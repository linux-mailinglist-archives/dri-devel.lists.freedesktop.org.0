Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E47B725D83C
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 14:00:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D08A6EB7D;
	Fri,  4 Sep 2020 12:00:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 192786EB85;
 Fri,  4 Sep 2020 12:00:19 +0000 (UTC)
IronPort-SDR: QE4xup+zH5kTGPbuO/Zlzuya98BCGcFLZ9FJd/P13VH2U+vz7C+bvf5V0H91lL/jDl9wWow5AW
 dXCgcfc8L+hg==
X-IronPort-AV: E=McAfee;i="6000,8403,9733"; a="137781526"
X-IronPort-AV: E=Sophos;i="5.76,389,1592895600"; d="scan'208";a="137781526"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2020 05:00:18 -0700
IronPort-SDR: wEVFUF3vYs444AQ8tUo41eQLotCXyZHia4ZGO/ZWSXbcopmgwRDsZRO1ic0Y8BsGc38Gi4s9uy
 BcJY+nkjfBgg==
X-IronPort-AV: E=Sophos;i="5.76,389,1592895600"; d="scan'208";a="298389855"
Received: from unknown (HELO karthik-2012-Client-Platform.iind.intel.com)
 ([10.223.74.217])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 04 Sep 2020 05:00:14 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v7 2/7] drm/i915: Add support for async flips in I915
Date: Fri,  4 Sep 2020 17:03:25 +0530
Message-Id: <20200904113330.19815-3-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200904113330.19815-1-karthik.b.s@intel.com>
References: <20200904113330.19815-1-karthik.b.s@intel.com>
MIME-Version: 1.0
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
Cc: paulo.r.zanoni@intel.com, michel@daenzer.net,
 Karthik B S <karthik.b.s@intel.com>, dri-devel@lists.freedesktop.org,
 vandita.kulkarni@intel.com, uma.shankar@intel.com, daniel.vetter@intel.com,
 nicholas.kazlauskas@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Set the Async Address Update Enable bit in plane ctl
when async flip is requested.

v2: -Move the Async flip enablement to individual patch (Paulo)

v3: -Rebased.

v4: -Add separate plane hook for async flip case (Ville)

v5: -Rebased.

v6: -Move the plane hook to separate patch. (Paulo)
    -Remove the early return in skl_plane_ctl. (Paulo)

v7: -Move async address update enable to skl_plane_ctl_crtc() (Ville)

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 3 +++
 drivers/gpu/drm/i915/i915_reg.h              | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 25cea9592891..c795ea01cec3 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -4784,6 +4784,9 @@ u32 skl_plane_ctl_crtc(const struct intel_crtc_state *crtc_state)
 	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->dev);
 	u32 plane_ctl = 0;
 
+	if (crtc_state->uapi.async_flip)
+		plane_ctl |= PLANE_CTL_ASYNC_FLIP;
+
 	if (INTEL_GEN(dev_priv) >= 10 || IS_GEMINILAKE(dev_priv))
 		return plane_ctl;
 
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index ab4b1abd4364..abf43e63264c 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -6924,6 +6924,7 @@ enum {
 #define   PLANE_CTL_TILED_X			(1 << 10)
 #define   PLANE_CTL_TILED_Y			(4 << 10)
 #define   PLANE_CTL_TILED_YF			(5 << 10)
+#define   PLANE_CTL_ASYNC_FLIP			(1 << 9)
 #define   PLANE_CTL_FLIP_HORIZONTAL		(1 << 8)
 #define   PLANE_CTL_MEDIA_DECOMPRESSION_ENABLE	(1 << 4) /* TGL+ */
 #define   PLANE_CTL_ALPHA_MASK			(0x3 << 4) /* Pre-GLK */
-- 
2.22.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
