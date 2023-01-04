Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9062565D02D
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 11:06:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 944F710E533;
	Wed,  4 Jan 2023 10:05:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 358A310E532;
 Wed,  4 Jan 2023 10:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672826750; x=1704362750;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=n5RoPOmG4WYOtyZqDioWy3ZtOqSaIKxBkmLNsfC5khw=;
 b=PLQ6cT9XmKTDe5cetM58bPBD3ZSQTVlUfroza49NZ8n1nydksr4Da6wK
 hEU0aLLKN0q6uF0sBBW+OyoEvCJN54oLe8wsOd2iBRW8p8ppCqgCi3ssL
 6YtYHRtGBCFt0n6e5A3rKNKHRyxzbx7cBOQ0RAlLb0YdXKxzvc/FPFTgY
 NN5x5iaOmjTV8e755zp3CDRqB1DdTLXAGjVirZ1JVhF6Nu++roKsJgbkF
 HwR7RMVs86eXOSARmIY4Pq5pvuXM5vCTQDn0+gBde9K8ZThIpZlp6hEnZ
 D3z16rmK5Wt5bvGUyRh088mRRSuQC9SznSN/CG9pKzIr9XRtbBipLtGKt Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="386333684"
X-IronPort-AV: E=Sophos;i="5.96,299,1665471600"; d="scan'208";a="386333684"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2023 02:05:49 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="983876991"
X-IronPort-AV: E=Sophos;i="5.96,299,1665471600"; d="scan'208";a="983876991"
Received: from mkabdel-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.25.63])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2023 02:05:47 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v7 01/22] drm/edid: fix AVI infoframe aspect ratio handling
Date: Wed,  4 Jan 2023 12:05:16 +0200
Message-Id: <c3e78cc6d01ed237f71ad0038826b08d83d75eef.1672826282.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1672826282.git.jani.nikula@intel.com>
References: <cover.1672826282.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: jani.nikula@intel.com, stable@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, William Tseng <william.tseng@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We try to avoid sending VICs defined in the later specs in AVI
infoframes to sinks that conform to the earlier specs, to not upset
them, and use 0 for the VIC instead. However, we do this detection and
conversion to 0 too early, as we'll need the actual VIC to figure out
the aspect ratio.

In particular, for a mode with 64:27 aspect ratio, 0 for VIC fails the
AVI infoframe generation altogether with -EINVAL.

Separate the VIC lookup from the "filtering", and postpone the
filtering, to use the proper VIC for aspect ratio handling, and the 0
VIC for the infoframe video code as needed.

Reported-by: William Tseng <william.tseng@intel.com>
Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/6153
References: https://lore.kernel.org/r/20220920062316.43162-1-william.tseng@intel.com
Cc: <stable@vger.kernel.org>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 3841aba17abd..23f7146e6a9b 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -6885,8 +6885,6 @@ static u8 drm_mode_hdmi_vic(const struct drm_connector *connector,
 static u8 drm_mode_cea_vic(const struct drm_connector *connector,
 			   const struct drm_display_mode *mode)
 {
-	u8 vic;
-
 	/*
 	 * HDMI spec says if a mode is found in HDMI 1.4b 4K modes
 	 * we should send its VIC in vendor infoframes, else send the
@@ -6896,13 +6894,18 @@ static u8 drm_mode_cea_vic(const struct drm_connector *connector,
 	if (drm_mode_hdmi_vic(connector, mode))
 		return 0;
 
-	vic = drm_match_cea_mode(mode);
+	return drm_match_cea_mode(mode);
+}
 
-	/*
-	 * HDMI 1.4 VIC range: 1 <= VIC <= 64 (CEA-861-D) but
-	 * HDMI 2.0 VIC range: 1 <= VIC <= 107 (CEA-861-F). So we
-	 * have to make sure we dont break HDMI 1.4 sinks.
-	 */
+/*
+ * Avoid sending VICs defined in HDMI 2.0 in AVI infoframes to sinks that
+ * conform to HDMI 1.4.
+ *
+ * HDMI 1.4 (CTA-861-D) VIC range: [1..64]
+ * HDMI 2.0 (CTA-861-F) VIC range: [1..107]
+ */
+static u8 vic_for_avi_infoframe(const struct drm_connector *connector, u8 vic)
+{
 	if (!is_hdmi2_sink(connector) && vic > 64)
 		return 0;
 
@@ -6978,7 +6981,7 @@ drm_hdmi_avi_infoframe_from_display_mode(struct hdmi_avi_infoframe *frame,
 		picture_aspect = HDMI_PICTURE_ASPECT_NONE;
 	}
 
-	frame->video_code = vic;
+	frame->video_code = vic_for_avi_infoframe(connector, vic);
 	frame->picture_aspect = picture_aspect;
 	frame->active_aspect = HDMI_ACTIVE_ASPECT_PICTURE;
 	frame->scan_mode = HDMI_SCAN_MODE_UNDERSCAN;
-- 
2.34.1

