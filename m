Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECEEA5B4300
	for <lists+dri-devel@lfdr.de>; Sat, 10 Sep 2022 01:19:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 866A410E12F;
	Fri,  9 Sep 2022 23:18:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29EDA10E12F;
 Fri,  9 Sep 2022 23:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662765520; x=1694301520;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tD+YOh2xW5+sCCCIU3HSpFnR7pYl3PmvmKWzh/rbeFo=;
 b=Qtt2xjJNAZSKT/kZ+yFW9eUVvlrg/mrW8VvfR2GeQeivDlRXrsf4O6Of
 eLlh2Nbt5owQSPzKnjC4R9k04l1fjZzltUtZqK4HK7bWwt0fZ4hoNiFKV
 n6tkiOKwXwY+dp1GMfRUPhWxi5FC522KlE9hPb7f38p7JM/HbnHJC7QRv
 hzXx9ciDbz7CsdPz9w2Fo1tfz3XrPyknhjq6aHvDz/t+6ocYuXMGGH0hZ
 jL4zz6QZ9JPSjoOXzzjSKqtRtdpKGUhlEcW1x3Tw14C/GytJColyU/nNt
 ZW+CP5c9WBWozxbV2/+c6BDc75Ok1sbUD5rXxRN9gGlM/Wk5Hv+yeJRfM A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10465"; a="295171542"
X-IronPort-AV: E=Sophos;i="5.93,304,1654585200"; d="scan'208";a="295171542"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2022 16:18:39 -0700
X-IronPort-AV: E=Sophos;i="5.93,304,1654585200"; d="scan'208";a="741210081"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.143])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2022 16:18:39 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 1/2] drm/i915/gt: Use MEDIA_VER() when handling media fuses
Date: Fri,  9 Sep 2022 16:18:15 -0700
Message-Id: <20220909-media-v2-1-6f20f322b4ef@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220909-media-v2-0-6f20f322b4ef@intel.com>
References: <20220909-media-v2-0-6f20f322b4ef@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.0-dev-df873
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Check for media IP version instead of graphics since this is figuring
out the media engines' configuration. Currently the only platform with
non-matching graphics/media version is Meteor Lake: update the check in
gen11_vdbox_has_sfc() so it considers not only version 12, but also any
later version which then includes that platform.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 6e0122b3dca2..b6602439224d 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -654,13 +654,12 @@ bool gen11_vdbox_has_sfc(struct intel_gt *gt,
 	 */
 	if ((gt->info.sfc_mask & BIT(physical_vdbox / 2)) == 0)
 		return false;
-	else if (GRAPHICS_VER(i915) == 12)
+	else if (MEDIA_VER(i915) >= 12)
 		return (physical_vdbox % 2 == 0) ||
 			!(BIT(physical_vdbox - 1) & vdbox_mask);
-	else if (GRAPHICS_VER(i915) == 11)
+	else if (MEDIA_VER(i915) == 11)
 		return logical_vdbox % 2 == 0;
 
-	MISSING_CASE(GRAPHICS_VER(i915));
 	return false;
 }
 
@@ -747,14 +746,14 @@ static intel_engine_mask_t init_engine_mask(struct intel_gt *gt)
 	 * and bits have disable semantices.
 	 */
 	media_fuse = intel_uncore_read(uncore, GEN11_GT_VEBOX_VDBOX_DISABLE);
-	if (GRAPHICS_VER_FULL(i915) < IP_VER(12, 50))
+	if (MEDIA_VER_FULL(i915) < IP_VER(12, 50))
 		media_fuse = ~media_fuse;
 
 	vdbox_mask = media_fuse & GEN11_GT_VDBOX_DISABLE_MASK;
 	vebox_mask = (media_fuse & GEN11_GT_VEBOX_DISABLE_MASK) >>
 		      GEN11_GT_VEBOX_DISABLE_SHIFT;
 
-	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50)) {
+	if (MEDIA_VER_FULL(i915) >= IP_VER(12, 50)) {
 		fuse1 = intel_uncore_read(uncore, HSW_PAVP_FUSE1);
 		gt->info.sfc_mask = REG_FIELD_GET(XEHP_SFC_ENABLE_MASK, fuse1);
 	} else {

-- 
b4 0.10.0-dev-df873
