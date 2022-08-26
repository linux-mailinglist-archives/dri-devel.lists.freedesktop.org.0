Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6525A3122
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 23:36:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8597810E8B0;
	Fri, 26 Aug 2022 21:35:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B136E10E721;
 Fri, 26 Aug 2022 21:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661549730; x=1693085730;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8m7IY/xdcl+XJ7Wk54Y2ANol4C3mdBs2nDMyaOr7POw=;
 b=d2GGzf4ojACUsu6vPPAt4xhLvOQQ9tj+oyDgeK+Eg+5pLFA1ixpu/wIR
 1OAAflZCym/WUcexQXi77oMYaAe6uRZiA/3cEoPcjHXVNaB/8O5/JkPSR
 BA305xzbUkpU4RUdHfSMhHITwklvfsrYixabHBE0VwrPmig2VCFN1oqgW
 rqXtsol0Q0fwbcft8DMrtONwonI2I5WIl3eURRIxMjHPNglpyRclbW6c+
 d+3oim2d55cZheldFVb/NsHf6siYSwb7RUabU4znnMzZwlKk7wrxwIlM8
 LuSph1g8WS44a3Ao/k0nfwiLzYf4HUlA1Lkf1A6/wzftT1dM5G5mLZg8w g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10451"; a="295375979"
X-IronPort-AV: E=Sophos;i="5.93,266,1654585200"; d="scan'208";a="295375979"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2022 14:35:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,266,1654585200"; d="scan'208";a="753006820"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by fmsmga001.fm.intel.com with SMTP; 26 Aug 2022 14:35:27 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Sat, 27 Aug 2022 00:35:26 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 07/11] drm/edid: Use GTF2 for inferred modes
Date: Sat, 27 Aug 2022 00:34:57 +0300
Message-Id: <20220826213501.31490-8-ville.syrjala@linux.intel.com>
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

For some resaon we only use the secondary GTF curve for the
standard timings. Use it for inferred modes as well.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_edid.c | 35 ++++++++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 0c7cbe9b44f5..fed2bdd55c09 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -3546,6 +3546,35 @@ static int drm_gtf_modes_for_range(struct drm_connector *connector,
 	return modes;
 }
 
+static int drm_gtf2_modes_for_range(struct drm_connector *connector,
+				    const struct drm_edid *drm_edid,
+				    const struct detailed_timing *timing)
+{
+	int i, modes = 0;
+	struct drm_display_mode *newmode;
+	struct drm_device *dev = connector->dev;
+
+	for (i = 0; i < ARRAY_SIZE(extra_modes); i++) {
+		const struct minimode *m = &extra_modes[i];
+
+		newmode = drm_gtf2_mode(dev, drm_edid, m->w, m->h, m->r);
+		if (!newmode)
+			return modes;
+
+		drm_mode_fixup_1366x768(newmode);
+		if (!mode_in_range(newmode, drm_edid, timing) ||
+		    !valid_inferred_mode(connector, newmode)) {
+			drm_mode_destroy(dev, newmode);
+			continue;
+		}
+
+		drm_mode_probed_add(connector, newmode);
+		modes++;
+	}
+
+	return modes;
+}
+
 static int drm_cvt_modes_for_range(struct drm_connector *connector,
 				   const struct drm_edid *drm_edid,
 				   const struct detailed_timing *timing)
@@ -3594,7 +3623,11 @@ do_inferred_modes(const struct detailed_timing *timing, void *c)
 		return; /* GTF not defined yet */
 
 	switch (range->flags) {
-	case DRM_EDID_SECONDARY_GTF_SUPPORT_FLAG: /* XXX could do more */
+	case DRM_EDID_SECONDARY_GTF_SUPPORT_FLAG:
+		closure->modes += drm_gtf2_modes_for_range(closure->connector,
+							   closure->drm_edid,
+							   timing);
+		break;
 	case DRM_EDID_DEFAULT_GTF_SUPPORT_FLAG:
 		closure->modes += drm_gtf_modes_for_range(closure->connector,
 							  closure->drm_edid,
-- 
2.35.1

