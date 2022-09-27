Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6348F5ECA5A
	for <lists+dri-devel@lfdr.de>; Tue, 27 Sep 2022 19:01:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B177310E12A;
	Tue, 27 Sep 2022 17:01:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB3DF10E0F4;
 Tue, 27 Sep 2022 17:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664298043; x=1695834043;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=J+2ijVANxbRuGevqdil92LUSYcS8Yn6hnMQANjtBow0=;
 b=E2LRKqUDvXQM1uIVJ2Tp1Meys8jy8iqOKc+JHkHF9bFtoJGkqzALyYpB
 BGnLMAhsyqpGgJWOSDa9tHmCyjuqHy0UTjDHstJlYNEcIOQWoAlGDMP7q
 OA+8KcJVr9VeE3XHcOb/GZ5Nwq6a0xRMlA3mKGq9MEIq9xZHrwRRLMEm2
 62C03ogXj3sJRuStQdTCAtU8B0F6rOQsUJHITNnEZV2EE2KQT/IVyjClQ
 a9q35eZOyZNle9fnRfZaAZyRVheiadx5l250cWu3XO3wIy4akZ5v7XJGz
 j7Lp4iKqypEDmT8TDDIuRFVSymFzZUQpFRsdfMLBiVnP2Ju4jw6CVkNmF w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="365414076"
X-IronPort-AV: E=Sophos;i="5.93,349,1654585200"; d="scan'208";a="365414076"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2022 10:00:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="623821938"
X-IronPort-AV: E=Sophos;i="5.93,350,1654585200"; d="scan'208";a="623821938"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by fmsmga007.fm.intel.com with SMTP; 27 Sep 2022 10:00:25 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 27 Sep 2022 20:00:25 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 5/9] drm/edid: Use GTF2 for inferred modes
Date: Tue, 27 Sep 2022 20:00:02 +0300
Message-Id: <20220927170006.27855-6-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220927170006.27855-1-ville.syrjala@linux.intel.com>
References: <20220927170006.27855-1-ville.syrjala@linux.intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

For some resaon we only use the secondary GTF curve for the
standard timings. Use it for inferred modes as well.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_edid.c | 35 ++++++++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index c7dbd6bf7f80..efe8d5e76875 100644
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

