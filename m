Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3598C59FC25
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 15:47:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9996910E084;
	Wed, 24 Aug 2022 13:47:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D50AE10E084;
 Wed, 24 Aug 2022 13:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661348808; x=1692884808;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GXdPhCs+OiXL6atbTQKesx51GVza2ZRqHVt6nYJiM6g=;
 b=nFVW72q1du5PwvFv8n/c1Cd8h3DUYnAN5cySQD4kUSmOeYkc2tQVm8t/
 RCZD23WWW/pP2U9of8i4TTD963S/vTIT6oPchx/0WFpGKwZw4YU7Ax7UW
 fHUWDHKmY01gjkLJJe+K+5ePcB75jgBFqqSDtCUHDlx+/e0VXrhI2tGeg
 vw/jNPWNaBeBjoVUw5LwRnUvpqW5Cy6l4vb5MJID6mHtNgkFYbDJPN8lx
 /JJ8pxZkKjdnOpqFzC7GDAbn5bFtNlL033GbMOxjK9mXrnF2alu1pxB4y
 Yl3WCHtdA5qfZ4ozy0Okjq+fvSgTLdLhiNoeDwC+7BoVMTQ4qmeXQhLmb A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10449"; a="355697386"
X-IronPort-AV: E=Sophos;i="5.93,260,1654585200"; d="scan'208";a="355697386"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2022 06:46:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,260,1654585200"; d="scan'208";a="609764547"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.59])
 by orsmga002.jf.intel.com with SMTP; 24 Aug 2022 06:46:40 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 24 Aug 2022 16:46:39 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/edid: Handle EDID 1.4 range descriptor h/vfreq offsets
Date: Wed, 24 Aug 2022 16:46:39 +0300
Message-Id: <20220824134639.8454-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220819092728.14753-1-ville.syrjala@linux.intel.com>
References: <20220819092728.14753-1-ville.syrjala@linux.intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

EDID 1.4 introduced some extra flags in the range
descriptor to support min/max h/vfreq >= 255. Consult them
to correctly parse the vfreq limits.

Note that some combinations of the flags are documented
as "reserved" (as are some other values in the descriptor)
but explicitly checking for those doesn't seem particularly
worthwile since we end up with bogus results whether we
decode them or not.

v2: Increase the storage to u16 to make it work (Jani)
    Note the "reserved" values situation (Jani)

Cc: stable@vger.kernel.org
Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/6519
Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_edid.c  | 24 ++++++++++++++++++------
 include/drm/drm_connector.h |  4 ++--
 include/drm/drm_edid.h      |  5 +++++
 3 files changed, 25 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 90a5e26eafa8..4005dab6147d 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -6020,12 +6020,14 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
 }
 
 static
-void get_monitor_range(const struct detailed_timing *timing,
-		       void *info_monitor_range)
+void get_monitor_range(const struct detailed_timing *timing, void *c)
 {
-	struct drm_monitor_range_info *monitor_range = info_monitor_range;
+	struct detailed_mode_closure *closure = c;
+	struct drm_display_info *info = &closure->connector->display_info;
+	struct drm_monitor_range_info *monitor_range = &info->monitor_range;
 	const struct detailed_non_pixel *data = &timing->data.other_data;
 	const struct detailed_data_monitor_range *range = &data->data.range;
+	const struct edid *edid = closure->drm_edid->edid;
 
 	if (!is_display_descriptor(timing, EDID_DETAIL_MONITOR_RANGE))
 		return;
@@ -6041,18 +6043,28 @@ void get_monitor_range(const struct detailed_timing *timing,
 
 	monitor_range->min_vfreq = range->min_vfreq;
 	monitor_range->max_vfreq = range->max_vfreq;
+
+	if (edid->revision >= 4) {
+		if (data->pad2 & DRM_EDID_RANGE_OFFSET_MIN_VFREQ)
+			monitor_range->min_vfreq += 255;
+		if (data->pad2 & DRM_EDID_RANGE_OFFSET_MAX_VFREQ)
+			monitor_range->max_vfreq += 255;
+	}
 }
 
 static void drm_get_monitor_range(struct drm_connector *connector,
 				  const struct drm_edid *drm_edid)
 {
-	struct drm_display_info *info = &connector->display_info;
+	const struct drm_display_info *info = &connector->display_info;
+	struct detailed_mode_closure closure = {
+		.connector = connector,
+		.drm_edid = drm_edid,
+	};
 
 	if (!version_greater(drm_edid, 1, 1))
 		return;
 
-	drm_for_each_detailed_block(drm_edid, get_monitor_range,
-				    &info->monitor_range);
+	drm_for_each_detailed_block(drm_edid, get_monitor_range, &closure);
 
 	DRM_DEBUG_KMS("Supported Monitor Refresh rate range is %d Hz - %d Hz\n",
 		      info->monitor_range.min_vfreq,
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 248206bbd975..56aee949c6fa 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -319,8 +319,8 @@ enum drm_panel_orientation {
  *             EDID's detailed monitor range
  */
 struct drm_monitor_range_info {
-	u8 min_vfreq;
-	u8 max_vfreq;
+	u16 min_vfreq;
+	u16 max_vfreq;
 };
 
 /**
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index 2181977ae683..d81da97cad6e 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -92,6 +92,11 @@ struct detailed_data_string {
 	u8 str[13];
 } __attribute__((packed));
 
+#define DRM_EDID_RANGE_OFFSET_MIN_VFREQ (1 << 0)
+#define DRM_EDID_RANGE_OFFSET_MAX_VFREQ (1 << 1)
+#define DRM_EDID_RANGE_OFFSET_MIN_HFREQ (1 << 2)
+#define DRM_EDID_RANGE_OFFSET_MAX_HFREQ (1 << 3)
+
 #define DRM_EDID_DEFAULT_GTF_SUPPORT_FLAG   0x00
 #define DRM_EDID_RANGE_LIMITS_ONLY_FLAG     0x01
 #define DRM_EDID_SECONDARY_GTF_SUPPORT_FLAG 0x02
-- 
2.35.1

