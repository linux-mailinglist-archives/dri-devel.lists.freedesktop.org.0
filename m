Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CAD5BDD15
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 08:23:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2D3610E2A6;
	Tue, 20 Sep 2022 06:23:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E8E110E2A6
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 06:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663655010; x=1695191010;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FCs15209pNaqv4gwLX0Yw1Ms7TPQIeIo5RMes56zHdU=;
 b=MqWd9J/Rp0gzWhM+A4KNofDNyBVi5I7JsVwUuQQYLC/NYkKe4Kh2oJ04
 WX3uwUgXR3p6V0zjA243/mcMIWzxRn6i4Ypjlf5k3lgxK/nmg+VA6uX3v
 dt7OVgg6QN9lku0LPBcw4/9Bq4P+QY6kmX65D/SDYW0Mw0/ePD4mR04yc
 HjMgt4XEQdQ3JLSRVW25pSowbIpdqHzxTBPRgOnSxHI0qoky2cvt8PQ0X
 TMazVBfurf10JMq2s2hwrvCDtJIOqjRHVfdCpdCwSPGdEIauuoIhgVIya
 sicAgMMapADMswg2uuUHmsc9J2CZGE3eLrBHFWcNzNdsBksTdJkD0690V g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10475"; a="300429656"
X-IronPort-AV: E=Sophos;i="5.93,329,1654585200"; d="scan'208";a="300429656"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 23:23:22 -0700
X-IronPort-AV: E=Sophos;i="5.93,329,1654585200"; d="scan'208";a="621140624"
Received: from tsengwil-desk2.itwn.intel.com (HELO gar) ([10.5.231.144])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 23:23:21 -0700
From: William Tseng <william.tseng@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4] drm/edid: ignore the CEA modes not defined in CEA-861-D
Date: Tue, 20 Sep 2022 14:23:16 +0800
Message-Id: <20220920062316.43162-1-william.tseng@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220613122655.12432-1-william.tseng@intel.com>
References: <20220613122655.12432-1-william.tseng@intel.com>
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
Cc: Lee Shawn C <shawn.c.lee@intel.com>, Wayne Lin <waynelin@amd.com>,
 William Tseng <william.tseng@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a workaround for HDMI 1.4 sink which has a CEA mode with higher vic
than what is defined in CEA-861-D.

As an example, a HDMI 1.4 sink has the video format 2560x1080p to be
displayed and the video format is indicated by both SVD (with vic 90 and
picture aspect ratio 64:27) and DTD.  When connecting to such sink,
source can't output the video format in SVD because an error is returned by
drm_hdmi_avi_infoframe_from_display_mode(), which can't fill the infoframe
with picture aspect ratio 64:27 and the vic, which is originally 90 and is
changed to 0 by drm_mode_cea_vic().

To work around it, do not set the vic 0 so the corresponding mode may be
accepted in drm_hdmi_avi_infoframe_from_display_mode() and be dispalyed.

v1: initial version.
v2: change the logic in drm_hdmi_avi_infoframe_from_display_mode().
v3: fix typo.
v4: add revision history.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Wayne Lin <waynelin@amd.com>
Cc: Lee Shawn C <shawn.c.lee@intel.com>
Signed-off-by: William Tseng <william.tseng@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index eaa819381281..3c6a4e09b2d6 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -6640,7 +6640,8 @@ static u8 drm_mode_hdmi_vic(const struct drm_connector *connector,
 }
 
 static u8 drm_mode_cea_vic(const struct drm_connector *connector,
-			   const struct drm_display_mode *mode)
+			   const struct drm_display_mode *mode,
+			   bool is_hdmi2_sink)
 {
 	u8 vic;
 
@@ -6660,7 +6661,7 @@ static u8 drm_mode_cea_vic(const struct drm_connector *connector,
 	 * HDMI 2.0 VIC range: 1 <= VIC <= 107 (CEA-861-F). So we
 	 * have to make sure we dont break HDMI 1.4 sinks.
 	 */
-	if (!is_hdmi2_sink(connector) && vic > 64)
+	if (!is_hdmi2_sink && vic > 64)
 		return 0;
 
 	return vic;
@@ -6691,7 +6692,7 @@ drm_hdmi_avi_infoframe_from_display_mode(struct hdmi_avi_infoframe *frame,
 	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
 		frame->pixel_repeat = 1;
 
-	vic = drm_mode_cea_vic(connector, mode);
+	vic = drm_mode_cea_vic(connector, mode, true);
 	hdmi_vic = drm_mode_hdmi_vic(connector, mode);
 
 	frame->picture_aspect = HDMI_PICTURE_ASPECT_NONE;
@@ -6735,7 +6736,8 @@ drm_hdmi_avi_infoframe_from_display_mode(struct hdmi_avi_infoframe *frame,
 		picture_aspect = HDMI_PICTURE_ASPECT_NONE;
 	}
 
-	frame->video_code = vic;
+	frame->video_code = drm_mode_cea_vic(connector, mode,
+						is_hdmi2_sink(connector));
 	frame->picture_aspect = picture_aspect;
 	frame->active_aspect = HDMI_ACTIVE_ASPECT_PICTURE;
 	frame->scan_mode = HDMI_SCAN_MODE_UNDERSCAN;
-- 
2.25.1

