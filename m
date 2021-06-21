Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6D53AEA2F
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 15:39:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0ED66E128;
	Mon, 21 Jun 2021 13:39:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45D1E6E128
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 13:39:34 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 7FEA71F422A6;
 Mon, 21 Jun 2021 14:39:28 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Rob Herring <robh+dt@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Steven Price <steven.price@arm.com>, Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v2 08/12] drm/panfrost: Do the exception -> string translation
 using a table
Date: Mon, 21 Jun 2021 15:39:03 +0200
Message-Id: <20210621133907.1683899-9-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210621133907.1683899-1-boris.brezillon@collabora.com>
References: <20210621133907.1683899-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Do the exception -> string translation using a table so we can add extra
fields if we need to. While at it add an error field to ease the
exception -> error conversion which we'll need if we want to set the
fence error to something that reflects the exception code.

TODO: fix the error codes.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_device.c | 134 +++++++++++++--------
 drivers/gpu/drm/panfrost/panfrost_device.h |   1 +
 2 files changed, 88 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
index f7f5ca94f910..2de011cee258 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.c
+++ b/drivers/gpu/drm/panfrost/panfrost_device.c
@@ -292,55 +292,95 @@ void panfrost_device_fini(struct panfrost_device *pfdev)
 	panfrost_clk_fini(pfdev);
 }
 
-const char *panfrost_exception_name(u32 exception_code)
-{
-	switch (exception_code) {
-		/* Non-Fault Status code */
-	case 0x00: return "NOT_STARTED/IDLE/OK";
-	case 0x01: return "DONE";
-	case 0x02: return "INTERRUPTED";
-	case 0x03: return "STOPPED";
-	case 0x04: return "TERMINATED";
-	case 0x08: return "ACTIVE";
-		/* Job exceptions */
-	case 0x40: return "JOB_CONFIG_FAULT";
-	case 0x41: return "JOB_POWER_FAULT";
-	case 0x42: return "JOB_READ_FAULT";
-	case 0x43: return "JOB_WRITE_FAULT";
-	case 0x44: return "JOB_AFFINITY_FAULT";
-	case 0x48: return "JOB_BUS_FAULT";
-	case 0x50: return "INSTR_INVALID_PC";
-	case 0x51: return "INSTR_INVALID_ENC";
-	case 0x52: return "INSTR_TYPE_MISMATCH";
-	case 0x53: return "INSTR_OPERAND_FAULT";
-	case 0x54: return "INSTR_TLS_FAULT";
-	case 0x55: return "INSTR_BARRIER_FAULT";
-	case 0x56: return "INSTR_ALIGN_FAULT";
-	case 0x58: return "DATA_INVALID_FAULT";
-	case 0x59: return "TILE_RANGE_FAULT";
-	case 0x5A: return "ADDR_RANGE_FAULT";
-	case 0x60: return "OUT_OF_MEMORY";
-		/* GPU exceptions */
-	case 0x80: return "DELAYED_BUS_FAULT";
-	case 0x88: return "SHAREABILITY_FAULT";
-		/* MMU exceptions */
-	case 0xC1: return "TRANSLATION_FAULT_LEVEL1";
-	case 0xC2: return "TRANSLATION_FAULT_LEVEL2";
-	case 0xC3: return "TRANSLATION_FAULT_LEVEL3";
-	case 0xC4: return "TRANSLATION_FAULT_LEVEL4";
-	case 0xC8: return "PERMISSION_FAULT";
-	case 0xC9 ... 0xCF: return "PERMISSION_FAULT";
-	case 0xD1: return "TRANSTAB_BUS_FAULT_LEVEL1";
-	case 0xD2: return "TRANSTAB_BUS_FAULT_LEVEL2";
-	case 0xD3: return "TRANSTAB_BUS_FAULT_LEVEL3";
-	case 0xD4: return "TRANSTAB_BUS_FAULT_LEVEL4";
-	case 0xD8: return "ACCESS_FLAG";
-	case 0xD9 ... 0xDF: return "ACCESS_FLAG";
-	case 0xE0 ... 0xE7: return "ADDRESS_SIZE_FAULT";
-	case 0xE8 ... 0xEF: return "MEMORY_ATTRIBUTES_FAULT";
+#define PANFROST_EXCEPTION(id, err) \
+	[DRM_PANFROST_EXCEPTION_ ## id] = { \
+		.name = #id, \
+		.error = err, \
 	}
 
-	return "UNKNOWN";
+struct panfrost_exception_info {
+	const char *name;
+	int error;
+};
+
+static const struct panfrost_exception_info panfrost_exception_infos[] = {
+	PANFROST_EXCEPTION(OK, 0),
+	PANFROST_EXCEPTION(DONE, 0),
+	PANFROST_EXCEPTION(STOPPED, 0),
+	PANFROST_EXCEPTION(TERMINATED, 0),
+	PANFROST_EXCEPTION(KABOOM, 0),
+	PANFROST_EXCEPTION(EUREKA, 0),
+	PANFROST_EXCEPTION(ACTIVE, 0),
+	PANFROST_EXCEPTION(JOB_CONFIG_FAULT, -EINVAL),
+	PANFROST_EXCEPTION(JOB_POWER_FAULT, -ECANCELED),
+	PANFROST_EXCEPTION(JOB_READ_FAULT, -EINVAL),
+	PANFROST_EXCEPTION(JOB_WRITE_FAULT, -EINVAL),
+	PANFROST_EXCEPTION(JOB_AFFINITY_FAULT, -EINVAL),
+	PANFROST_EXCEPTION(JOB_BUS_FAULT, -EINVAL),
+	PANFROST_EXCEPTION(INSTR_INVALID_PC, -EINVAL),
+	PANFROST_EXCEPTION(INSTR_INVALID_ENC, -EINVAL),
+	PANFROST_EXCEPTION(INSTR_BARRIER_FAULT, -EINVAL),
+	PANFROST_EXCEPTION(DATA_INVALID_FAULT, -EINVAL),
+	PANFROST_EXCEPTION(TILE_RANGE_FAULT, -EINVAL),
+	PANFROST_EXCEPTION(ADDR_RANGE_FAULT, -EINVAL),
+	PANFROST_EXCEPTION(IMPRECISE_FAULT, -EINVAL),
+	PANFROST_EXCEPTION(OOM, -ENOMEM),
+	PANFROST_EXCEPTION(UNKNOWN, -EINVAL),
+	PANFROST_EXCEPTION(DELAYED_BUS_FAULT, -EINVAL),
+	PANFROST_EXCEPTION(GPU_SHAREABILITY_FAULT, -ECANCELED),
+	PANFROST_EXCEPTION(SYS_SHAREABILITY_FAULT, -ECANCELED),
+	PANFROST_EXCEPTION(GPU_CACHEABILITY_FAULT, -ECANCELED),
+	PANFROST_EXCEPTION(TRANSLATION_FAULT_0, -EINVAL),
+	PANFROST_EXCEPTION(TRANSLATION_FAULT_1, -EINVAL),
+	PANFROST_EXCEPTION(TRANSLATION_FAULT_2, -EINVAL),
+	PANFROST_EXCEPTION(TRANSLATION_FAULT_3, -EINVAL),
+	PANFROST_EXCEPTION(TRANSLATION_FAULT_4, -EINVAL),
+	PANFROST_EXCEPTION(TRANSLATION_FAULT_IDENTITY, -EINVAL),
+	PANFROST_EXCEPTION(PERM_FAULT_0, -EINVAL),
+	PANFROST_EXCEPTION(PERM_FAULT_1, -EINVAL),
+	PANFROST_EXCEPTION(PERM_FAULT_2, -EINVAL),
+	PANFROST_EXCEPTION(PERM_FAULT_3, -EINVAL),
+	PANFROST_EXCEPTION(TRANSTAB_BUS_FAULT_0, -EINVAL),
+	PANFROST_EXCEPTION(TRANSTAB_BUS_FAULT_1, -EINVAL),
+	PANFROST_EXCEPTION(TRANSTAB_BUS_FAULT_2, -EINVAL),
+	PANFROST_EXCEPTION(TRANSTAB_BUS_FAULT_3, -EINVAL),
+	PANFROST_EXCEPTION(ACCESS_FLAG_0, -EINVAL),
+	PANFROST_EXCEPTION(ACCESS_FLAG_1, -EINVAL),
+	PANFROST_EXCEPTION(ACCESS_FLAG_2, -EINVAL),
+	PANFROST_EXCEPTION(ACCESS_FLAG_3, -EINVAL),
+	PANFROST_EXCEPTION(ADDR_SIZE_FAULT_IN0, -EINVAL),
+	PANFROST_EXCEPTION(ADDR_SIZE_FAULT_IN1, -EINVAL),
+	PANFROST_EXCEPTION(ADDR_SIZE_FAULT_IN2, -EINVAL),
+	PANFROST_EXCEPTION(ADDR_SIZE_FAULT_IN3, -EINVAL),
+	PANFROST_EXCEPTION(ADDR_SIZE_FAULT_OUT0, -EINVAL),
+	PANFROST_EXCEPTION(ADDR_SIZE_FAULT_OUT1, -EINVAL),
+	PANFROST_EXCEPTION(ADDR_SIZE_FAULT_OUT2, -EINVAL),
+	PANFROST_EXCEPTION(ADDR_SIZE_FAULT_OUT3, -EINVAL),
+	PANFROST_EXCEPTION(MEM_ATTR_FAULT_0, -EINVAL),
+	PANFROST_EXCEPTION(MEM_ATTR_FAULT_1, -EINVAL),
+	PANFROST_EXCEPTION(MEM_ATTR_FAULT_2, -EINVAL),
+	PANFROST_EXCEPTION(MEM_ATTR_FAULT_3, -EINVAL),
+	PANFROST_EXCEPTION(MEM_ATTR_NONCACHE_0, -EINVAL),
+	PANFROST_EXCEPTION(MEM_ATTR_NONCACHE_1, -EINVAL),
+	PANFROST_EXCEPTION(MEM_ATTR_NONCACHE_2, -EINVAL),
+	PANFROST_EXCEPTION(MEM_ATTR_NONCACHE_3, -EINVAL),
+};
+
+const char *panfrost_exception_name(u32 exception_code)
+{
+	if (WARN_ON(exception_code >= ARRAY_SIZE(panfrost_exception_infos) ||
+		    !panfrost_exception_infos[exception_code].name))
+		return "UNKNOWN";
+
+	return panfrost_exception_infos[exception_code].name;
+}
+
+int panfrost_exception_to_error(u32 exception_code)
+{
+	if (WARN_ON(exception_code >= ARRAY_SIZE(panfrost_exception_infos)))
+		return 0;
+
+	return panfrost_exception_infos[exception_code].error;
 }
 
 void panfrost_device_reset(struct panfrost_device *pfdev)
diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
index 1c6a3597eba0..498c7b5dccd0 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.h
+++ b/drivers/gpu/drm/panfrost/panfrost_device.h
@@ -174,6 +174,7 @@ int panfrost_device_resume(struct device *dev);
 int panfrost_device_suspend(struct device *dev);
 
 const char *panfrost_exception_name(u32 exception_code);
+int panfrost_exception_to_error(u32 exception_code);
 
 static inline void
 panfrost_device_schedule_reset(struct panfrost_device *pfdev)
-- 
2.31.1

