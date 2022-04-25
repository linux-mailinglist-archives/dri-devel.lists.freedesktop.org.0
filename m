Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9729750EB27
	for <lists+dri-devel@lfdr.de>; Mon, 25 Apr 2022 23:13:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7F8710E2A6;
	Mon, 25 Apr 2022 21:13:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE25710E1BC;
 Mon, 25 Apr 2022 21:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650921188; x=1682457188;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=J7wogVNf6rSHogt48eW3Yd6FMehrNK1l+GBCh9ZIIXQ=;
 b=VCq3yjgK3gT6Z+5ofnkRzceOCJNJkxf3W2/IqQpo7gJYigoOj1XTNosu
 Zvcx89CeaAtbyJv+ecjLrKPhgl5aWJnd3Q3e05KlyeKNTjZSsdXZ/3tR5
 J3/w3k14fK16fsWqc3vShP5Yjqrs6hVRDDvGEeZKXkcVMUjg7Dd/pXxin
 1/Ubw492Er4iM5vZAddY35jdQs9eSZctfdAWAcPcU9Y7UiZBE3iWrpMYf
 7H41D2D3ViEydDfBNUoake8z6xF2wSYfZFSF22K5zHIE5fqWwC7hVdiMy
 N1QFGbNSTf01q9oKgmLJS+tcgCaK2zf7YSVSisF2GHSs3ZyiJgZMKYLFM A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10328"; a="265531325"
X-IronPort-AV: E=Sophos;i="5.90,289,1643702400"; d="scan'208";a="265531325"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 14:12:59 -0700
X-IronPort-AV: E=Sophos;i="5.90,289,1643702400"; d="scan'208";a="729916088"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 14:12:58 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 2/3] drm/i915: Add first set of DG2 PCI IDs
Date: Mon, 25 Apr 2022 14:12:50 -0700
Message-Id: <20220425211251.77154-3-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220425211251.77154-1-matthew.d.roper@intel.com>
References: <20220425211251.77154-1-matthew.d.roper@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The IDs added here are the subset reserved for 'motherboard down'
designs of DG2.  We have all the necessary support upstream to enable
these now (although they'll continue to require force_probe until the
usual requirements are met).

The remaining DG2 IDs for add-in cards will come in a future patch once
some additional required functionality has fully landed.

Bspec: 44477
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Dave Airlie <airlied@gmail.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/i915_pci.c          |  2 +-
 drivers/gpu/drm/i915/intel_device_info.c | 21 +++++++++++++++++++++
 include/drm/i915_pciids.h                | 22 ++++++++++++++++++++++
 3 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index a3a1b4cb2942..1d44f57c2eb0 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -1058,7 +1058,6 @@ static const struct intel_device_info xehpsdv_info = {
 		BIT(VECS0) | BIT(VECS1) | \
 		BIT(VCS0) | BIT(VCS2)
 
-__maybe_unused
 static const struct intel_device_info dg2_info = {
 	DG2_FEATURES,
 	XE_LPD_FEATURES,
@@ -1154,6 +1153,7 @@ static const struct pci_device_id pciidlist[] = {
 	INTEL_DG1_IDS(&dg1_info),
 	INTEL_RPLS_IDS(&adl_s_info),
 	INTEL_RPLP_IDS(&adl_p_info),
+	INTEL_DG2_IDS(&dg2_info),
 	{0, 0, 0}
 };
 MODULE_DEVICE_TABLE(pci, pciidlist);
diff --git a/drivers/gpu/drm/i915/intel_device_info.c b/drivers/gpu/drm/i915/intel_device_info.c
index 74c3ffb66b8d..cefa9ed784ff 100644
--- a/drivers/gpu/drm/i915/intel_device_info.c
+++ b/drivers/gpu/drm/i915/intel_device_info.c
@@ -186,6 +186,18 @@ static const u16 subplatform_rpl_ids[] = {
 	INTEL_RPLP_IDS(0),
 };
 
+static const u16 subplatform_g10_ids[] = {
+	INTEL_DG2_G10_IDS(0),
+};
+
+static const u16 subplatform_g11_ids[] = {
+	INTEL_DG2_G11_IDS(0),
+};
+
+static const u16 subplatform_g12_ids[] = {
+	INTEL_DG2_G12_IDS(0),
+};
+
 static bool find_devid(u16 id, const u16 *p, unsigned int num)
 {
 	for (; num; num--, p++) {
@@ -231,6 +243,15 @@ void intel_device_info_subplatform_init(struct drm_i915_private *i915)
 	} else if (find_devid(devid, subplatform_rpl_ids,
 			      ARRAY_SIZE(subplatform_rpl_ids))) {
 		mask = BIT(INTEL_SUBPLATFORM_RPL);
+	} else if (find_devid(devid, subplatform_g10_ids,
+			      ARRAY_SIZE(subplatform_g10_ids))) {
+		mask = BIT(INTEL_SUBPLATFORM_G10);
+	} else if (find_devid(devid, subplatform_g11_ids,
+			      ARRAY_SIZE(subplatform_g11_ids))) {
+		mask = BIT(INTEL_SUBPLATFORM_G11);
+	} else if (find_devid(devid, subplatform_g12_ids,
+			      ARRAY_SIZE(subplatform_g12_ids))) {
+		mask = BIT(INTEL_SUBPLATFORM_G12);
 	}
 
 	GEM_BUG_ON(mask & ~INTEL_SUBPLATFORM_MASK);
diff --git a/include/drm/i915_pciids.h b/include/drm/i915_pciids.h
index a7b5eea7ffaa..283dadfbb4db 100644
--- a/include/drm/i915_pciids.h
+++ b/include/drm/i915_pciids.h
@@ -692,4 +692,26 @@
 	INTEL_VGA_DEVICE(0xA7A8, info), \
 	INTEL_VGA_DEVICE(0xA7A9, info)
 
+/* DG2 */
+#define INTEL_DG2_G10_IDS(info) \
+	INTEL_VGA_DEVICE(0x5690, info), \
+	INTEL_VGA_DEVICE(0x5691, info), \
+	INTEL_VGA_DEVICE(0x5692, info)
+
+#define INTEL_DG2_G11_IDS(info) \
+	INTEL_VGA_DEVICE(0x5693, info), \
+	INTEL_VGA_DEVICE(0x5694, info), \
+	INTEL_VGA_DEVICE(0x5695, info), \
+	INTEL_VGA_DEVICE(0x56B0, info)
+
+#define INTEL_DG2_G12_IDS(info) \
+	INTEL_VGA_DEVICE(0x5696, info), \
+	INTEL_VGA_DEVICE(0x5697, info), \
+	INTEL_VGA_DEVICE(0x56B2, info)
+
+#define INTEL_DG2_IDS(info) \
+	INTEL_DG2_G10_IDS(info), \
+	INTEL_DG2_G11_IDS(info), \
+	INTEL_DG2_G12_IDS(info)
+
 #endif /* _I915_PCIIDS_H */
-- 
2.35.1

