Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 396D6547E92
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 06:27:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D972910E193;
	Mon, 13 Jun 2022 04:27:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 184F810E193
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 04:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655094442; x=1686630442;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fXTj57e/16P1FLvQqK4DAxGD4XzDJVp0y8bxr+oqqUQ=;
 b=TV4rQlh57mZT9Y7yxkiBQ8XZJf5lNUzRU6H6EsedsBmK8VixPSWPN/1s
 5xVxwj42elGC2UiUegCyTdIHWggM99K3yqhHQywFWxtyzVARyauQTaCbr
 jbAC4ILamu3exNIf0QqA1L7FdHA9+74sGIUkcQacH2xvWhMpTzLW4WwWn
 M603ArS5J0OttYtsL98X0Ulg7aCbHT9S6fNxt4yqFLQpNvKfrWtMTILC3
 C1BAH0omM1BjQ8OxrQnwRIKxKAlFL29DSimqX338Oo0cmUmUeis8kUYQi
 IFx0uErqH/mHWGFQ2LLZ/Gh2PyyHIhyC+6kaz0ZBNnz1q390dwMoOehUK A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10376"; a="258596103"
X-IronPort-AV: E=Sophos;i="5.91,296,1647327600"; d="scan'208";a="258596103"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2022 21:27:21 -0700
X-IronPort-AV: E=Sophos;i="5.91,296,1647327600"; d="scan'208";a="685809222"
Received: from tsengwil-desk1.itwn.intel.com (HELO gar) ([10.5.231.22])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2022 21:27:20 -0700
From: William Tseng <william.tseng@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/edid: ignore the CEA modes not defined in CEA-861-D
Date: Mon, 13 Jun 2022 12:27:07 +0800
Message-Id: <20220613042707.8525-1-william.tseng@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220531103421.11363-1-william.tseng@intel.com>
References: <20220531103421.11363-1-william.tseng@intel.com>
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
pictuure aspect ratio 64:27) and DTD.  When connecting to such sink,
source can't output the video format in SVD because an error is returned by
drm_hdmi_avi_infoframe_from_display_mode(), which can't fill the infoframe
with pictuure aspect ratio 64:27 and the vic, which is originally 90 and is
changed to 0 by drm_mode_cea_vic().

To work around it, do not set the vic 0 so the corresponding mode may be
accepted in drm_hdmi_avi_infoframe_from_display_mode() and be dispalyed.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Wayne Lin <waynelin@amd.com>
Cc: Lee Shawn C <shawn.c.lee@intel.com>
Signed-off-by: William Tseng <william.tseng@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index bc43e1b32092..a4582627ec9d 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5876,7 +5876,8 @@ static u8 drm_mode_hdmi_vic(const struct drm_connector *connector,
 }
 
 static u8 drm_mode_cea_vic(const struct drm_connector *connector,
-			   const struct drm_display_mode *mode)
+			   const struct drm_display_mode *mode,
+			   bool is_hdmi2_sink)
 {
 	u8 vic;
 
@@ -5896,7 +5897,7 @@ static u8 drm_mode_cea_vic(const struct drm_connector *connector,
 	 * HDMI 2.0 VIC range: 1 <= VIC <= 107 (CEA-861-F). So we
 	 * have to make sure we dont break HDMI 1.4 sinks.
 	 */
-	if (!is_hdmi2_sink(connector) && vic > 64)
+	if (!is_hdmi2_sink && vic > 64)
 		return 0;
 
 	return vic;
@@ -5927,7 +5928,7 @@ drm_hdmi_avi_infoframe_from_display_mode(struct hdmi_avi_infoframe *frame,
 	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
 		frame->pixel_repeat = 1;
 
-	vic = drm_mode_cea_vic(connector, mode);
+	vic = drm_mode_cea_vic(connector, mode, true);
 	hdmi_vic = drm_mode_hdmi_vic(connector, mode);
 
 	frame->picture_aspect = HDMI_PICTURE_ASPECT_NONE;
@@ -5971,7 +5972,8 @@ drm_hdmi_avi_infoframe_from_display_mode(struct hdmi_avi_infoframe *frame,
 		picture_aspect = HDMI_PICTURE_ASPECT_NONE;
 	}
 
-	frame->video_code = vic;
+	frame->video_code = drm_mode_cea_vic(connector, mode,
+						is_hdmi2_sink(connector));
 	frame->picture_aspect = picture_aspect;
 	frame->active_aspect = HDMI_ACTIVE_ASPECT_PICTURE;
 	frame->scan_mode = HDMI_SCAN_MODE_UNDERSCAN;
-- 
2.17.1

