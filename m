Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0BC5A3120
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 23:36:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4086210E77B;
	Fri, 26 Aug 2022 21:35:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53C1F10E779;
 Fri, 26 Aug 2022 21:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661549733; x=1693085733;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ixMKHjHRc8NMDgtENPNmcnCt5JhqC1JOiOHEiREF7tY=;
 b=IX0qpRTk8cHlZc6j48lkqOLESPx87ZfGCnZHWTnXg++yKJhrJP3+Lcn2
 Dcmj0I+Pj3u9e4QAZJICYVTeZcs1/ZL02B/1rGur1SQSIlU53RLk6ew0Q
 FEjtBCA4OvyaG81i/g+hn21yZaEskqjHCvJ0JRTpBx8b2hzVfw5Hyk9Kg
 aNY0y9uxcyKXOgg0XS/NFWxQQ25yfVOXW56FIAN9Cefudb0yZE7GBrMEd
 wDlOfsYikL2FJyW6l+gbLmZs3MUBfYy6D0Qk3wRlise5FFddNKSywkO2R
 dLImr0LXr6GFV3g0SZYJtubt6zgCwyWiAq7PrCH69V/NzACf/bsn6sB/N g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10451"; a="295870991"
X-IronPort-AV: E=Sophos;i="5.93,266,1654585200"; d="scan'208";a="295870991"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2022 14:35:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,266,1654585200"; d="scan'208";a="699982811"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by FMSMGA003.fm.intel.com with SMTP; 26 Aug 2022 14:35:30 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Sat, 27 Aug 2022 00:35:29 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 08/11] drm/edid: Use the correct formula for standard timings
Date: Sat, 27 Aug 2022 00:34:58 +0300
Message-Id: <20220826213501.31490-9-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220826213501.31490-1-ville.syrjala@linux.intel.com>
References: <20220826213501.31490-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Prefer the timing formula indicated by the range
descriptor for generating the non-DMT standard timings.

Previously we just used CVT for all EDID 1.4 continuous
frequency displays without even checking if the range
descriptor indicates otherwise. Now we check the range
descriptor first, and fall back to CVT if nothing else
was indicated. EDID 1.4 more or less deprecates GTF/GTF2
but there are still a lot of 1.4 EDIDs out there that
don't advertise CVT support, so seems safer to use the
formula the EDID actually reports as supported.

For EDID 1.3 we use GTF2 if indicated (as before), and for
EDID 1.2+ we now just use GTF without even checking the
feature flag. There seem to be quite a few EDIDs out there that
don't set the GTF feature flag but still include a GTF range
descriptor and non-DMT standard timings.

This to me seems to be roughly what appendix B of EDID 1.4
suggests should be done.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_edid.c | 49 +++++++++++++++++++++++++++++++-------
 1 file changed, 41 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index fed2bdd55c09..c1c85b9e1208 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -3077,20 +3077,53 @@ drm_gtf2_2j(const struct drm_edid *drm_edid)
 	return descriptor ? descriptor->data.other_data.data.range.formula.gtf2.j : 0;
 }
 
+static void
+get_timing_level(const struct detailed_timing *descriptor, void *data)
+{
+	int *res = data;
+
+	if (!is_display_descriptor(descriptor, EDID_DETAIL_MONITOR_RANGE))
+		return;
+
+	BUILD_BUG_ON(offsetof(typeof(*descriptor), data.other_data.data.range.flags) != 10);
+
+	switch (descriptor->data.other_data.data.range.flags) {
+	case DRM_EDID_DEFAULT_GTF_SUPPORT_FLAG:
+		*res = LEVEL_GTF;
+		break;
+	case DRM_EDID_SECONDARY_GTF_SUPPORT_FLAG:
+		*res = LEVEL_GTF2;
+		break;
+	case DRM_EDID_CVT_SUPPORT_FLAG:
+		*res = LEVEL_CVT;
+		break;
+	default:
+		break;
+	}
+}
+
 /* Get standard timing level (CVT/GTF/DMT). */
 static int standard_timing_level(const struct drm_edid *drm_edid)
 {
 	const struct edid *edid = drm_edid->edid;
 
-	if (edid->revision >= 2) {
-		if (edid->revision >= 4 && (edid->features & DRM_EDID_FEATURE_DEFAULT_GTF))
-			return LEVEL_CVT;
-		if (drm_gtf2_hbreak(drm_edid))
-			return LEVEL_GTF2;
-		if (edid->features & DRM_EDID_FEATURE_DEFAULT_GTF)
-			return LEVEL_GTF;
+	if (edid->revision >= 4) {
+		/*
+		 * If the range descriptor doesn't
+		 * indicate otherwise default to CVT
+		 */
+		int ret = LEVEL_CVT;
+
+		drm_for_each_detailed_block(drm_edid, get_timing_level, &ret);
+
+		return ret;
+	} else if (edid->revision >= 3 && drm_gtf2_hbreak(drm_edid)) {
+		return LEVEL_GTF2;
+	} else if (edid->revision >= 2) {
+		return LEVEL_GTF;
+	} else {
+		return LEVEL_DMT;
 	}
-	return LEVEL_DMT;
 }
 
 /*
-- 
2.35.1

