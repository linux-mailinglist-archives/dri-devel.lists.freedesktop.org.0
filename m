Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC3E616A14
	for <lists+dri-devel@lfdr.de>; Wed,  2 Nov 2022 18:09:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91A9410E52A;
	Wed,  2 Nov 2022 17:08:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69D7A10E52B;
 Wed,  2 Nov 2022 17:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667408899; x=1698944899;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UfeNvml+F9LwVw7dCjZIlE5ONNfbdiWMjAZUjJMyt0U=;
 b=G1v68pnvxVeqBlN+p+z3h/h8zijt8aOQ2qZM59NdwgFs36YL9LBoPIQQ
 45AqZI8yvfQNeInwp3ywvY9EsiPkuX0tC+XKTnyFfpji2s+ZSTCqChXS1
 vA9v/Xzbs07YPsj5cX9NcKnr6onIz+dm8J4haZFDgEaajTsbe50AXCIyU
 YXR9INo/W94AcAcr9c4ePeHjpGe86SIqkus5w5DEjTJriDHQ+7jXhvUZu
 vNwW2LYEE50aSFy+CChvg5MulvY5cYQPZaac0SOat5gbUDHiwwDMTGqrz
 WuE/qeMuIHArk8zfKotdyyABsRoBuamsxzDcKp5xQFocogXgyzYWY8y81 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="395777116"
X-IronPort-AV: E=Sophos;i="5.95,234,1661842800"; d="scan'208";a="395777116"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2022 10:07:59 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="739835288"
X-IronPort-AV: E=Sophos;i="5.95,234,1661842800"; d="scan'208";a="739835288"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2022 10:07:59 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 1/5] drm/i915/mtl: add initial definitions for GSC CS
Date: Wed,  2 Nov 2022 10:10:43 -0700
Message-Id: <20221102171047.2787951-2-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221102171047.2787951-1-daniele.ceraolospurio@intel.com>
References: <20221102171047.2787951-1-daniele.ceraolospurio@intel.com>
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Starting on MTL, the GSC is no longer managed with direct MMIO access,
but we instead have a dedicated command streamer for it. As a first step
for adding support for this CS, add the required definitions.
Note that, although it is now a CS, the GSC retains its old
class:instance value (OTHER_CLASS instance 6)

Bspec: 65308, 45605
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c    | 8 ++++++++
 drivers/gpu/drm/i915/gt/intel_engine_types.h | 1 +
 drivers/gpu/drm/i915/gt/intel_engine_user.c  | 1 +
 drivers/gpu/drm/i915/i915_reg.h              | 1 +
 4 files changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 3b7d750ad054..e0fbfac03979 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -244,6 +244,13 @@ static const struct engine_info intel_engines[] = {
 			{ .graphics_ver = 12, .base = GEN12_COMPUTE3_RING_BASE }
 		}
 	},
+	[GSC0] = {
+		.class = OTHER_CLASS,
+		.instance = OTHER_GSC_INSTANCE,
+		.mmio_bases = {
+			{ .graphics_ver = 12, .base = MTL_GSC_RING_BASE }
+		}
+	},
 };
 
 /**
@@ -324,6 +331,7 @@ u32 intel_engine_context_size(struct intel_gt *gt, u8 class)
 	case VIDEO_DECODE_CLASS:
 	case VIDEO_ENHANCEMENT_CLASS:
 	case COPY_ENGINE_CLASS:
+	case OTHER_CLASS:
 		if (GRAPHICS_VER(gt->i915) < 8)
 			return 0;
 		return GEN8_LR_CONTEXT_OTHER_SIZE;
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
index 6b5d4ea22b67..4fd54fb8810f 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
@@ -136,6 +136,7 @@ enum intel_engine_id {
 	CCS2,
 	CCS3,
 #define _CCS(n) (CCS0 + (n))
+	GSC0,
 	I915_NUM_ENGINES
 #define INVALID_ENGINE ((enum intel_engine_id)-1)
 };
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_user.c b/drivers/gpu/drm/i915/gt/intel_engine_user.c
index 46a174f8aa00..79312b734690 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_user.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_user.c
@@ -140,6 +140,7 @@ const char *intel_engine_class_repr(u8 class)
 		[COPY_ENGINE_CLASS] = "bcs",
 		[VIDEO_DECODE_CLASS] = "vcs",
 		[VIDEO_ENHANCEMENT_CLASS] = "vecs",
+		[OTHER_CLASS] = "other",
 		[COMPUTE_CLASS] = "ccs",
 	};
 
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 1c0da50c0dc7..d056c3117ef2 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -970,6 +970,7 @@
 #define GEN11_VEBOX2_RING_BASE		0x1d8000
 #define XEHP_VEBOX3_RING_BASE		0x1e8000
 #define XEHP_VEBOX4_RING_BASE		0x1f8000
+#define MTL_GSC_RING_BASE		0x11a000
 #define GEN12_COMPUTE0_RING_BASE	0x1a000
 #define GEN12_COMPUTE1_RING_BASE	0x1c000
 #define GEN12_COMPUTE2_RING_BASE	0x1e000
-- 
2.37.3

