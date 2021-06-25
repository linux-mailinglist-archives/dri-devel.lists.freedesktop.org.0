Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F87E3B4491
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jun 2021 15:34:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 732C36EDD9;
	Fri, 25 Jun 2021 13:34:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA9626EDC1
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jun 2021 13:33:44 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 757451F40F3F;
 Fri, 25 Jun 2021 14:33:37 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 06/15] drm/panfrost: Do the exception -> string translation
 using a table
Date: Fri, 25 Jun 2021 15:33:18 +0200
Message-Id: <20210625133327.2598825-7-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210625133327.2598825-1-boris.brezillon@collabora.com>
References: <20210625133327.2598825-1-boris.brezillon@collabora.com>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Do the exception -> string translation using a table. This way we get
rid of those magic numbers and can easily add new fields if we need
to attach extra information to exception types.

v3:
* Drop the error field

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_device.c | 130 +++++++++++++--------
 1 file changed, 83 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
index bce6b0aff05e..736854542b05 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.c
+++ b/drivers/gpu/drm/panfrost/panfrost_device.c
@@ -292,55 +292,91 @@ void panfrost_device_fini(struct panfrost_device *pfdev)
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
+#define PANFROST_EXCEPTION(id) \
+	[DRM_PANFROST_EXCEPTION_ ## id] = { \
+		.name = #id, \
 	}
 
-	return "UNKNOWN";
+struct panfrost_exception_info {
+	const char *name;
+};
+
+static const struct panfrost_exception_info panfrost_exception_infos[] = {
+	PANFROST_EXCEPTION(OK),
+	PANFROST_EXCEPTION(DONE),
+	PANFROST_EXCEPTION(INTERRUPTED),
+	PANFROST_EXCEPTION(STOPPED),
+	PANFROST_EXCEPTION(TERMINATED),
+	PANFROST_EXCEPTION(KABOOM),
+	PANFROST_EXCEPTION(EUREKA),
+	PANFROST_EXCEPTION(ACTIVE),
+	PANFROST_EXCEPTION(JOB_CONFIG_FAULT),
+	PANFROST_EXCEPTION(JOB_POWER_FAULT),
+	PANFROST_EXCEPTION(JOB_READ_FAULT),
+	PANFROST_EXCEPTION(JOB_WRITE_FAULT),
+	PANFROST_EXCEPTION(JOB_AFFINITY_FAULT),
+	PANFROST_EXCEPTION(JOB_BUS_FAULT),
+	PANFROST_EXCEPTION(INSTR_INVALID_PC),
+	PANFROST_EXCEPTION(INSTR_INVALID_ENC),
+	PANFROST_EXCEPTION(INSTR_TYPE_MISMATCH),
+	PANFROST_EXCEPTION(INSTR_OPERAND_FAULT),
+	PANFROST_EXCEPTION(INSTR_TLS_FAULT),
+	PANFROST_EXCEPTION(INSTR_BARRIER_FAULT),
+	PANFROST_EXCEPTION(INSTR_ALIGN_FAULT),
+	PANFROST_EXCEPTION(DATA_INVALID_FAULT),
+	PANFROST_EXCEPTION(TILE_RANGE_FAULT),
+	PANFROST_EXCEPTION(ADDR_RANGE_FAULT),
+	PANFROST_EXCEPTION(IMPRECISE_FAULT),
+	PANFROST_EXCEPTION(OOM),
+	PANFROST_EXCEPTION(OOM_AFBC),
+	PANFROST_EXCEPTION(UNKNOWN),
+	PANFROST_EXCEPTION(DELAYED_BUS_FAULT),
+	PANFROST_EXCEPTION(GPU_SHAREABILITY_FAULT),
+	PANFROST_EXCEPTION(SYS_SHAREABILITY_FAULT),
+	PANFROST_EXCEPTION(GPU_CACHEABILITY_FAULT),
+	PANFROST_EXCEPTION(TRANSLATION_FAULT_0),
+	PANFROST_EXCEPTION(TRANSLATION_FAULT_1),
+	PANFROST_EXCEPTION(TRANSLATION_FAULT_2),
+	PANFROST_EXCEPTION(TRANSLATION_FAULT_3),
+	PANFROST_EXCEPTION(TRANSLATION_FAULT_4),
+	PANFROST_EXCEPTION(TRANSLATION_FAULT_IDENTITY),
+	PANFROST_EXCEPTION(PERM_FAULT_0),
+	PANFROST_EXCEPTION(PERM_FAULT_1),
+	PANFROST_EXCEPTION(PERM_FAULT_2),
+	PANFROST_EXCEPTION(PERM_FAULT_3),
+	PANFROST_EXCEPTION(TRANSTAB_BUS_FAULT_0),
+	PANFROST_EXCEPTION(TRANSTAB_BUS_FAULT_1),
+	PANFROST_EXCEPTION(TRANSTAB_BUS_FAULT_2),
+	PANFROST_EXCEPTION(TRANSTAB_BUS_FAULT_3),
+	PANFROST_EXCEPTION(ACCESS_FLAG_0),
+	PANFROST_EXCEPTION(ACCESS_FLAG_1),
+	PANFROST_EXCEPTION(ACCESS_FLAG_2),
+	PANFROST_EXCEPTION(ACCESS_FLAG_3),
+	PANFROST_EXCEPTION(ADDR_SIZE_FAULT_IN0),
+	PANFROST_EXCEPTION(ADDR_SIZE_FAULT_IN1),
+	PANFROST_EXCEPTION(ADDR_SIZE_FAULT_IN2),
+	PANFROST_EXCEPTION(ADDR_SIZE_FAULT_IN3),
+	PANFROST_EXCEPTION(ADDR_SIZE_FAULT_OUT0),
+	PANFROST_EXCEPTION(ADDR_SIZE_FAULT_OUT1),
+	PANFROST_EXCEPTION(ADDR_SIZE_FAULT_OUT2),
+	PANFROST_EXCEPTION(ADDR_SIZE_FAULT_OUT3),
+	PANFROST_EXCEPTION(MEM_ATTR_FAULT_0),
+	PANFROST_EXCEPTION(MEM_ATTR_FAULT_1),
+	PANFROST_EXCEPTION(MEM_ATTR_FAULT_2),
+	PANFROST_EXCEPTION(MEM_ATTR_FAULT_3),
+	PANFROST_EXCEPTION(MEM_ATTR_NONCACHE_0),
+	PANFROST_EXCEPTION(MEM_ATTR_NONCACHE_1),
+	PANFROST_EXCEPTION(MEM_ATTR_NONCACHE_2),
+	PANFROST_EXCEPTION(MEM_ATTR_NONCACHE_3),
+};
+
+const char *panfrost_exception_name(u32 exception_code)
+{
+	if (WARN_ON(exception_code >= ARRAY_SIZE(panfrost_exception_infos) ||
+		    !panfrost_exception_infos[exception_code].name))
+		return "Unknown exception type";
+
+	return panfrost_exception_infos[exception_code].name;
 }
 
 void panfrost_device_reset(struct panfrost_device *pfdev)
-- 
2.31.1

