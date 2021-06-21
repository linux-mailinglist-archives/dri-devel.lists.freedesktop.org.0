Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6ABB3AEA30
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 15:39:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C1906E131;
	Mon, 21 Jun 2021 13:39:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 028756E122
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 13:39:33 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D55681F4229C;
 Mon, 21 Jun 2021 14:39:26 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Rob Herring <robh+dt@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Steven Price <steven.price@arm.com>, Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v2 04/12] drm/panfrost: Expose exception types to userspace
Date: Mon, 21 Jun 2021 15:38:59 +0200
Message-Id: <20210621133907.1683899-5-boris.brezillon@collabora.com>
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

Job headers contain an exception type field which might be read and
converted to a human readable string by tracing tools. Let's expose
the exception type as an enum so we share the same definition.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 include/uapi/drm/panfrost_drm.h | 65 +++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/include/uapi/drm/panfrost_drm.h b/include/uapi/drm/panfrost_drm.h
index 061e700dd06c..9a05d57d0118 100644
--- a/include/uapi/drm/panfrost_drm.h
+++ b/include/uapi/drm/panfrost_drm.h
@@ -224,6 +224,71 @@ struct drm_panfrost_madvise {
 	__u32 retained;       /* out, whether backing store still exists */
 };
 
+/* The exception types */
+
+enum drm_panfrost_exception_type {
+	DRM_PANFROST_EXCEPTION_OK = 0x00,
+	DRM_PANFROST_EXCEPTION_DONE = 0x01,
+	DRM_PANFROST_EXCEPTION_STOPPED = 0x03,
+	DRM_PANFROST_EXCEPTION_TERMINATED = 0x04,
+	DRM_PANFROST_EXCEPTION_KABOOM = 0x05,
+	DRM_PANFROST_EXCEPTION_EUREKA = 0x06,
+	DRM_PANFROST_EXCEPTION_ACTIVE = 0x08,
+	DRM_PANFROST_EXCEPTION_JOB_CONFIG_FAULT = 0x40,
+	DRM_PANFROST_EXCEPTION_JOB_POWER_FAULT = 0x41,
+	DRM_PANFROST_EXCEPTION_JOB_READ_FAULT = 0x42,
+	DRM_PANFROST_EXCEPTION_JOB_WRITE_FAULT = 0x43,
+	DRM_PANFROST_EXCEPTION_JOB_AFFINITY_FAULT = 0x44,
+	DRM_PANFROST_EXCEPTION_JOB_BUS_FAULT = 0x48,
+	DRM_PANFROST_EXCEPTION_INSTR_INVALID_PC = 0x50,
+	DRM_PANFROST_EXCEPTION_INSTR_INVALID_ENC = 0x51,
+	DRM_PANFROST_EXCEPTION_INSTR_BARRIER_FAULT = 0x55,
+	DRM_PANFROST_EXCEPTION_DATA_INVALID_FAULT = 0x58,
+	DRM_PANFROST_EXCEPTION_TILE_RANGE_FAULT = 0x59,
+	DRM_PANFROST_EXCEPTION_ADDR_RANGE_FAULT = 0x5a,
+	DRM_PANFROST_EXCEPTION_IMPRECISE_FAULT = 0x5b,
+	DRM_PANFROST_EXCEPTION_OOM = 0x60,
+	DRM_PANFROST_EXCEPTION_UNKNOWN = 0x7f,
+	DRM_PANFROST_EXCEPTION_DELAYED_BUS_FAULT = 0x80,
+	DRM_PANFROST_EXCEPTION_GPU_SHAREABILITY_FAULT = 0x88,
+	DRM_PANFROST_EXCEPTION_SYS_SHAREABILITY_FAULT = 0x89,
+	DRM_PANFROST_EXCEPTION_GPU_CACHEABILITY_FAULT = 0x8a,
+	DRM_PANFROST_EXCEPTION_TRANSLATION_FAULT_0 = 0xc0,
+	DRM_PANFROST_EXCEPTION_TRANSLATION_FAULT_1 = 0xc1,
+	DRM_PANFROST_EXCEPTION_TRANSLATION_FAULT_2 = 0xc2,
+	DRM_PANFROST_EXCEPTION_TRANSLATION_FAULT_3 = 0xc3,
+	DRM_PANFROST_EXCEPTION_TRANSLATION_FAULT_4 = 0xc4,
+	DRM_PANFROST_EXCEPTION_TRANSLATION_FAULT_IDENTITY = 0xc7,
+	DRM_PANFROST_EXCEPTION_PERM_FAULT_0 = 0xc8,
+	DRM_PANFROST_EXCEPTION_PERM_FAULT_1 = 0xc9,
+	DRM_PANFROST_EXCEPTION_PERM_FAULT_2 = 0xca,
+	DRM_PANFROST_EXCEPTION_PERM_FAULT_3 = 0xcb,
+	DRM_PANFROST_EXCEPTION_TRANSTAB_BUS_FAULT_0 = 0xd0,
+	DRM_PANFROST_EXCEPTION_TRANSTAB_BUS_FAULT_1 = 0xd1,
+	DRM_PANFROST_EXCEPTION_TRANSTAB_BUS_FAULT_2 = 0xd2,
+	DRM_PANFROST_EXCEPTION_TRANSTAB_BUS_FAULT_3 = 0xd3,
+	DRM_PANFROST_EXCEPTION_ACCESS_FLAG_0 = 0xd8,
+	DRM_PANFROST_EXCEPTION_ACCESS_FLAG_1 = 0xd9,
+	DRM_PANFROST_EXCEPTION_ACCESS_FLAG_2 = 0xda,
+	DRM_PANFROST_EXCEPTION_ACCESS_FLAG_3 = 0xdb,
+	DRM_PANFROST_EXCEPTION_ADDR_SIZE_FAULT_IN0 = 0xe0,
+	DRM_PANFROST_EXCEPTION_ADDR_SIZE_FAULT_IN1 = 0xe1,
+	DRM_PANFROST_EXCEPTION_ADDR_SIZE_FAULT_IN2 = 0xe2,
+	DRM_PANFROST_EXCEPTION_ADDR_SIZE_FAULT_IN3 = 0xe3,
+	DRM_PANFROST_EXCEPTION_ADDR_SIZE_FAULT_OUT0 = 0xe4,
+	DRM_PANFROST_EXCEPTION_ADDR_SIZE_FAULT_OUT1 = 0xe5,
+	DRM_PANFROST_EXCEPTION_ADDR_SIZE_FAULT_OUT2 = 0xe6,
+	DRM_PANFROST_EXCEPTION_ADDR_SIZE_FAULT_OUT3 = 0xe7,
+	DRM_PANFROST_EXCEPTION_MEM_ATTR_FAULT_0 = 0xe8,
+	DRM_PANFROST_EXCEPTION_MEM_ATTR_FAULT_1 = 0xe9,
+	DRM_PANFROST_EXCEPTION_MEM_ATTR_FAULT_2 = 0xea,
+	DRM_PANFROST_EXCEPTION_MEM_ATTR_FAULT_3 = 0xeb,
+	DRM_PANFROST_EXCEPTION_MEM_ATTR_NONCACHE_0 = 0xec,
+	DRM_PANFROST_EXCEPTION_MEM_ATTR_NONCACHE_1 = 0xed,
+	DRM_PANFROST_EXCEPTION_MEM_ATTR_NONCACHE_2 = 0xee,
+	DRM_PANFROST_EXCEPTION_MEM_ATTR_NONCACHE_3 = 0xef,
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.31.1

