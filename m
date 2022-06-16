Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7A954E06D
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 14:01:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81E2611A4B5;
	Thu, 16 Jun 2022 12:01:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16F6A11A4AE;
 Thu, 16 Jun 2022 12:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655380893; x=1686916893;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X69ketEy+PBI2ThrySQWbAyCa9sAMtjMWIpV7nJLeEw=;
 b=c3/YlTfRlslA2gQ+XE4vLmgxVZWJl8Od07gVNOc30Vrgn9RKOOFaCcwH
 Yftj0qLt1Mi8psN95w1+G3aYb1nA8oxoubxKmzDr/bvIothm0fZVm6kaD
 nDI3oNk0XSs3JTWdjFCl6cNhQFjGRxjCIBh8rIaAVaZ0YhfTByzFP/5iq
 v6GNV5i51whC8XmoOL2sIyzcRhdk1Dy8CDMefzoIdI5keMAPzQHWaCjkT
 CDYqFd8qUrXVVfeSTG/I/srMwDhX4fCs5h4EMRPMHuaefyjXzvUKB8w60
 tM4wBYi7wAfx7t/vxP7Sy12PQUyJWSBqgQnGDUjYqJC5liy88bwKae9HD g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10379"; a="343189582"
X-IronPort-AV: E=Sophos;i="5.91,305,1647327600"; d="scan'208";a="343189582"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 05:01:32 -0700
X-IronPort-AV: E=Sophos;i="5.91,305,1647327600"; d="scan'208";a="713330894"
Received: from srr4-3-linux-105-anshuma1.iind.intel.com ([10.223.74.179])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 05:01:30 -0700
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/9] drm/i915/dg2: Add DG2_NB_MBD subplatform
Date: Thu, 16 Jun 2022 17:31:00 +0530
Message-Id: <20220616120106.24353-4-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20220616120106.24353-1-anshuman.gupta@intel.com>
References: <20220616120106.24353-1-anshuman.gupta@intel.com>
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
Cc: tilak.tangudu@intel.com, tvrtko.ursulin@intel.com,
 Anshuman Gupta <anshuman.gupta@intel.com>, jon.ewins@intel.com,
 badal.nilawar@intel.com, rodrigo.vivi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DG2 NB SKU need to distinguish between MBD and AIC to probe
the VRAM Self Refresh feature support. Adding those sub platform
accordingly.

Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 drivers/gpu/drm/i915/i915_drv.h          |  3 +++
 drivers/gpu/drm/i915/intel_device_info.c | 21 +++++++++++++++++++++
 drivers/gpu/drm/i915/intel_device_info.h | 11 +++++++----
 include/drm/i915_pciids.h                | 23 ++++++++++++++++-------
 4 files changed, 47 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index a5bc6a774c5a..f1f8699eedfd 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1007,10 +1007,13 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 #define IS_PONTEVECCHIO(dev_priv) IS_PLATFORM(dev_priv, INTEL_PONTEVECCHIO)
 
 #define IS_DG2_G10(dev_priv) \
+	IS_SUBPLATFORM(dev_priv, INTEL_DG2, INTEL_SUBPLATFORM_G10_NB_MBD) || \
 	IS_SUBPLATFORM(dev_priv, INTEL_DG2, INTEL_SUBPLATFORM_G10)
 #define IS_DG2_G11(dev_priv) \
+	IS_SUBPLATFORM(dev_priv, INTEL_DG2, INTEL_SUBPLATFORM_G11_NB_MBD) || \
 	IS_SUBPLATFORM(dev_priv, INTEL_DG2, INTEL_SUBPLATFORM_G11)
 #define IS_DG2_G12(dev_priv) \
+	IS_SUBPLATFORM(dev_priv, INTEL_DG2, INTEL_SUBPLATFORM_G12_NB_MBD) || \
 	IS_SUBPLATFORM(dev_priv, INTEL_DG2, INTEL_SUBPLATFORM_G12)
 #define IS_ADLS_RPLS(dev_priv) \
 	IS_SUBPLATFORM(dev_priv, INTEL_ALDERLAKE_S, INTEL_SUBPLATFORM_RPL)
diff --git a/drivers/gpu/drm/i915/intel_device_info.c b/drivers/gpu/drm/i915/intel_device_info.c
index f0bf23726ed8..93da555adc4e 100644
--- a/drivers/gpu/drm/i915/intel_device_info.c
+++ b/drivers/gpu/drm/i915/intel_device_info.c
@@ -187,6 +187,18 @@ static const u16 subplatform_rpl_ids[] = {
 	INTEL_RPLP_IDS(0),
 };
 
+static const u16 subplatform_g10_mb_mbd_ids[] = {
+	INTEL_DG2_G10_NB_MBD_IDS(0),
+};
+
+static const u16 subplatform_g11_mb_mbd_ids[] = {
+	INTEL_DG2_G11_NB_MBD_IDS(0),
+};
+
+static const u16 subplatform_g12_mb_mbd_ids[] = {
+	INTEL_DG2_G12_NB_MBD_IDS(0),
+};
+
 static const u16 subplatform_g10_ids[] = {
 	INTEL_DG2_G10_IDS(0),
 	INTEL_ATS_M150_IDS(0),
@@ -246,6 +258,15 @@ void intel_device_info_subplatform_init(struct drm_i915_private *i915)
 	} else if (find_devid(devid, subplatform_rpl_ids,
 			      ARRAY_SIZE(subplatform_rpl_ids))) {
 		mask = BIT(INTEL_SUBPLATFORM_RPL);
+	} else if (find_devid(devid, subplatform_g10_mb_mbd_ids,
+			      ARRAY_SIZE(subplatform_g10_mb_mbd_ids))) {
+		mask = BIT(INTEL_SUBPLATFORM_G10_NB_MBD);
+	} else if (find_devid(devid, subplatform_g11_mb_mbd_ids,
+			      ARRAY_SIZE(subplatform_g11_mb_mbd_ids))) {
+		mask = BIT(INTEL_SUBPLATFORM_G11_NB_MBD);
+	} else if (find_devid(devid, subplatform_g12_mb_mbd_ids,
+			      ARRAY_SIZE(subplatform_g12_mb_mbd_ids))) {
+		mask = BIT(INTEL_SUBPLATFORM_G12_NB_MBD);
 	} else if (find_devid(devid, subplatform_g10_ids,
 			      ARRAY_SIZE(subplatform_g10_ids))) {
 		mask = BIT(INTEL_SUBPLATFORM_G10);
diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
index 08341174ee0a..c929e2d7e59c 100644
--- a/drivers/gpu/drm/i915/intel_device_info.h
+++ b/drivers/gpu/drm/i915/intel_device_info.h
@@ -97,7 +97,7 @@ enum intel_platform {
  * it is fine for the same bit to be used on multiple parent platforms.
  */
 
-#define INTEL_SUBPLATFORM_BITS (3)
+#define INTEL_SUBPLATFORM_BITS (6)
 #define INTEL_SUBPLATFORM_MASK (BIT(INTEL_SUBPLATFORM_BITS) - 1)
 
 /* HSW/BDW/SKL/KBL/CFL */
@@ -111,9 +111,12 @@ enum intel_platform {
 #define INTEL_SUBPLATFORM_UY	(0)
 
 /* DG2 */
-#define INTEL_SUBPLATFORM_G10	0
-#define INTEL_SUBPLATFORM_G11	1
-#define INTEL_SUBPLATFORM_G12	2
+#define INTEL_SUBPLATFORM_G10_NB_MBD	0
+#define INTEL_SUBPLATFORM_G11_NB_MBD	1
+#define INTEL_SUBPLATFORM_G12_NB_MBD	2
+#define INTEL_SUBPLATFORM_G10	3
+#define INTEL_SUBPLATFORM_G11	4
+#define INTEL_SUBPLATFORM_G12	5
 
 /* ADL */
 #define INTEL_SUBPLATFORM_RPL	0
diff --git a/include/drm/i915_pciids.h b/include/drm/i915_pciids.h
index 4585fed4e41e..198be417bb2d 100644
--- a/include/drm/i915_pciids.h
+++ b/include/drm/i915_pciids.h
@@ -693,32 +693,41 @@
 	INTEL_VGA_DEVICE(0xA7A9, info)
 
 /* DG2 */
-#define INTEL_DG2_G10_IDS(info) \
+#define INTEL_DG2_G10_NB_MBD_IDS(info) \
 	INTEL_VGA_DEVICE(0x5690, info), \
 	INTEL_VGA_DEVICE(0x5691, info), \
-	INTEL_VGA_DEVICE(0x5692, info), \
+	INTEL_VGA_DEVICE(0x5692, info)
+
+#define INTEL_DG2_G11_NB_MBD_IDS(info) \
+	INTEL_VGA_DEVICE(0x5693, info), \
+	INTEL_VGA_DEVICE(0x5694, info), \
+	INTEL_VGA_DEVICE(0x5695, info)
+
+#define INTEL_DG2_G12_NB_MBD_IDS(info) \
+	INTEL_VGA_DEVICE(0x5696, info), \
+	INTEL_VGA_DEVICE(0x5697, info)
+
+#define INTEL_DG2_G10_IDS(info) \
 	INTEL_VGA_DEVICE(0x56A0, info), \
 	INTEL_VGA_DEVICE(0x56A1, info), \
 	INTEL_VGA_DEVICE(0x56A2, info)
 
 #define INTEL_DG2_G11_IDS(info) \
-	INTEL_VGA_DEVICE(0x5693, info), \
-	INTEL_VGA_DEVICE(0x5694, info), \
-	INTEL_VGA_DEVICE(0x5695, info), \
 	INTEL_VGA_DEVICE(0x56A5, info), \
 	INTEL_VGA_DEVICE(0x56A6, info), \
 	INTEL_VGA_DEVICE(0x56B0, info), \
 	INTEL_VGA_DEVICE(0x56B1, info)
 
 #define INTEL_DG2_G12_IDS(info) \
-	INTEL_VGA_DEVICE(0x5696, info), \
-	INTEL_VGA_DEVICE(0x5697, info), \
 	INTEL_VGA_DEVICE(0x56A3, info), \
 	INTEL_VGA_DEVICE(0x56A4, info), \
 	INTEL_VGA_DEVICE(0x56B2, info), \
 	INTEL_VGA_DEVICE(0x56B3, info)
 
 #define INTEL_DG2_IDS(info) \
+	INTEL_DG2_G10_NB_MBD_IDS(info), \
+	INTEL_DG2_G11_NB_MBD_IDS(info), \
+	INTEL_DG2_G12_NB_MBD_IDS(info), \
 	INTEL_DG2_G10_IDS(info), \
 	INTEL_DG2_G11_IDS(info), \
 	INTEL_DG2_G12_IDS(info)
-- 
2.26.2

