Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B89A538F1A
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 12:34:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B98C2112281;
	Tue, 31 May 2022 10:34:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0B70112281
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 10:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653993266; x=1685529266;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3YpK8LtcPE0677n75/BRy4Ia8657/+94hBHBaUlN9TY=;
 b=LuB4oSFmuqpnv8qwCmU/5ycl2236Fc9jao4QIxwUhxBvAx69vx81mz+m
 jYwA4NKv2ha7WiL7qBzcNHLjzxQuIh13qnqwouO9WgJSHEsFt1i0TpAyh
 ItjJLfcRBZ9kDKBLASFbJyt5XEClv+kHdCt65vrCkpUNzjKgh3dC5S1Ml
 4dCcHMdplWzs2k+inXdYC4wYnrV9FnXnmjzCMRvYwvLjD5XLZ1Anjx50L
 bb60/Fg7rWxSb/pqqRcuyaRpJFh/52opbnvT4pHvNIoGXHfdpnt85VfwF
 X7DVsHs2G+Ijc0qjk+B2EYOU796/eYHtCLIUJ2iSu0iHe/XdNuXXbQ96L g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10363"; a="335873662"
X-IronPort-AV: E=Sophos;i="5.91,264,1647327600"; d="scan'208";a="335873662"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2022 03:34:26 -0700
X-IronPort-AV: E=Sophos;i="5.91,264,1647327600"; d="scan'208";a="605606218"
Received: from tsengwil-desk1.itwn.intel.com (HELO gar) ([10.5.231.22])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2022 03:34:25 -0700
From: William Tseng <william.tseng@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/edid: ignore the CEA modes not defined in CEA-861-D
Date: Tue, 31 May 2022 18:34:21 +0800
Message-Id: <20220531103421.11363-1-william.tseng@intel.com>
X-Mailer: git-send-email 2.17.1
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

To work around it, this patch ignores such CEA modes in do_cea_modes() so
the modes won't be processed in drm_hdmi_avi_infoframe_from_display_mode().
And only the video format in DTD can be dispalyed.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Wayne Lin <waynelin@amd.com>
Cc: Lee Shawn C <shawn.c.lee@intel.com>
Signed-off-by: William Tseng <william.tseng@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 39 +++++++++++++++++++++++++-------------
 1 file changed, 26 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index bc43e1b32092..a93f68878bfd 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -3982,6 +3982,19 @@ drm_display_mode_from_cea_vic(struct drm_device *dev,
 }
 EXPORT_SYMBOL(drm_display_mode_from_cea_vic);
 
+static bool is_hdmi2_sink(const struct drm_connector *connector)
+{
+	/*
+	 * FIXME: sil-sii8620 doesn't have a connector around when
+	 * we need one, so we have to be prepared for a NULL connector.
+	 */
+	if (!connector)
+		return true;
+
+	return connector->display_info.hdmi.scdc.supported ||
+		connector->display_info.color_formats & DRM_COLOR_FORMAT_YCBCR420;
+}
+
 static int
 do_cea_modes(struct drm_connector *connector, const u8 *db, u8 len)
 {
@@ -3993,6 +4006,19 @@ do_cea_modes(struct drm_connector *connector, const u8 *db, u8 len)
 
 		mode = drm_display_mode_from_vic_index(connector, db, len, i);
 		if (mode) {
+			u8 vic = svd_to_vic(db[i]);
+
+			if (!drm_valid_cea_vic(vic))
+				continue;
+
+			/*
+			 * HDMI 1.4 VIC range: 1 <= VIC <= 64 (CEA-861-D) but
+			 * HDMI 2.0 VIC range: 1 <= VIC <= 107 (CEA-861-F). So we
+			 * have to make sure we dont break HDMI 1.4 sinks.
+			 */
+			if (!is_hdmi2_sink(connector) && vic > 64)
+				continue;
+
 			/*
 			 * YCBCR420 capability block contains a bitmap which
 			 * gives the index of CEA modes from CEA VDB, which
@@ -5846,19 +5872,6 @@ void drm_set_preferred_mode(struct drm_connector *connector,
 }
 EXPORT_SYMBOL(drm_set_preferred_mode);
 
-static bool is_hdmi2_sink(const struct drm_connector *connector)
-{
-	/*
-	 * FIXME: sil-sii8620 doesn't have a connector around when
-	 * we need one, so we have to be prepared for a NULL connector.
-	 */
-	if (!connector)
-		return true;
-
-	return connector->display_info.hdmi.scdc.supported ||
-		connector->display_info.color_formats & DRM_COLOR_FORMAT_YCBCR420;
-}
-
 static u8 drm_mode_hdmi_vic(const struct drm_connector *connector,
 			    const struct drm_display_mode *mode)
 {
-- 
2.17.1

