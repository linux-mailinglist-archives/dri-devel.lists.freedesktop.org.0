Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D839753950B
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 18:42:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D62E910E8E1;
	Tue, 31 May 2022 16:42:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6253310E888
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 16:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654015339; x=1685551339;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=KESADEJNBTVmTr5fcdtt2ix6DbkmLqtK3EzS37siK9M=;
 b=cgCgtXgB8KykHpJ5u2Kz2KEALcUeeX/qLtIOGN57yPJIoyFjPJc9rO43
 uyAIrLCj7+/NIWYQAUellVcV0eut5e3DlXvhXNLn9kxdMZ797iARffnjt
 +5ILBj53ZbjeUcXwkup3/JJ9Oom/t+VnOngjLU4Qu3daoAShE3AeB7xe9
 SPmm2/a+D2Fd0LXSuMliM0W5V66xPKFdyhTjvr645rEBthW4DMDSfFfcK
 aHhwpBN43/+QZL2I2v8QlHs5rmdOgTl7j7t+vDh/Ig1JLzWZ3xLfSvBAv
 wosFAFKULnR71J4i70/dhp152q4Ruwdykme40HAy42Ci0SlVHS0LqqL0p w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10364"; a="275397008"
X-IronPort-AV: E=Sophos;i="5.91,265,1647327600"; d="scan'208";a="275397008"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2022 09:42:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,265,1647327600"; d="scan'208";a="720388613"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.163])
 by fmsmga001.fm.intel.com with SMTP; 31 May 2022 09:42:14 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 31 May 2022 19:42:13 +0300
Date: Tue, 31 May 2022 19:42:13 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: William Tseng <william.tseng@intel.com>
Subject: Re: [PATCH] drm/edid: ignore the CEA modes not defined in CEA-861-D
Message-ID: <YpZFZcoTNy4cDBBV@intel.com>
References: <20220531103421.11363-1-william.tseng@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220531103421.11363-1-william.tseng@intel.com>
X-Patchwork-Hint: comment
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
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 31, 2022 at 06:34:21PM +0800, William Tseng wrote:
> This is a workaround for HDMI 1.4 sink which has a CEA mode with higher vic
> than what is defined in CEA-861-D.
> 
> As an example, a HDMI 1.4 sink has the video format 2560x1080p to be
> displayed and the video format is indicated by both SVD (with vic 90 and
> pictuure aspect ratio 64:27) and DTD.  When connecting to such sink,
> source can't output the video format in SVD because an error is returned by
> drm_hdmi_avi_infoframe_from_display_mode(), which can't fill the infoframe
> with pictuure aspect ratio 64:27 and the vic, which is originally 90 and is
> changed to 0 by drm_mode_cea_vic().

Hmm. I think either we need to change the logic in
drm_hdmi_avi_infoframe_from_display_mode() somehow to accept this
or we need to strip the aspect ratio from such modes when we probe
them.

The first option might be nicer, and something like this might even work:

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 929fc0e46751..3d5c76acf42a 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -6082,7 +6082,8 @@ static u8 drm_mode_hdmi_vic(const struct drm_connector *connector,
 }
 
 static u8 drm_mode_cea_vic(const struct drm_connector *connector,
-			   const struct drm_display_mode *mode)
+			   const struct drm_display_mode *mode,
+			   bool is_hdmi2_sink)
 {
 	u8 vic;
 
@@ -6102,7 +6103,7 @@ static u8 drm_mode_cea_vic(const struct drm_connector *connector,
 	 * HDMI 2.0 VIC range: 1 <= VIC <= 107 (CEA-861-F). So we
 	 * have to make sure we dont break HDMI 1.4 sinks.
 	 */
-	if (!is_hdmi2_sink(connector) && vic > 64)
+	if (!is_hdmi2_sink && vic > 64)
 		return 0;
 
 	return vic;
@@ -6133,7 +6134,7 @@ drm_hdmi_avi_infoframe_from_display_mode(struct hdmi_avi_infoframe *frame,
 	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
 		frame->pixel_repeat = 1;
 
-	vic = drm_mode_cea_vic(connector, mode);
+	vic = drm_mode_cea_vic(connector, mode, true);
 	hdmi_vic = drm_mode_hdmi_vic(connector, mode);
 
 	frame->picture_aspect = HDMI_PICTURE_ASPECT_NONE;
@@ -6177,7 +6178,7 @@ drm_hdmi_avi_infoframe_from_display_mode(struct hdmi_avi_infoframe *frame,
 		picture_aspect = HDMI_PICTURE_ASPECT_NONE;
 	}
 
-	frame->video_code = vic;
+	frame->video_code = drm_mode_cea_vic(connector, mode, is_hdmi2_sink(connector));
 	frame->picture_aspect = picture_aspect;
 	frame->active_aspect = HDMI_ACTIVE_ASPECT_PICTURE;
 	frame->scan_mode = HDMI_SCAN_MODE_UNDERSCAN;

But I don't quite remember off hand how the CEA VIC vs. HDMI VIC
decision plays into this, so there might be some issues with that
approach.

-- 
Ville Syrjälä
Intel
