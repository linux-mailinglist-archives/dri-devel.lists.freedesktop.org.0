Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A72962AAD84
	for <lists+dri-devel@lfdr.de>; Sun,  8 Nov 2020 22:06:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8592289704;
	Sun,  8 Nov 2020 21:06:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 396 seconds by postgrey-1.36 at gabe;
 Sun, 08 Nov 2020 21:06:40 UTC
Received: from abrecht.li (75-128-16-94.static.cable.fcom.ch [94.16.128.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42FBE89704
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Nov 2020 21:06:40 +0000 (UTC)
Received: from mail.abrecht.li (unknown [10.60.1.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by abrecht.li (Postfix) with ESMTPSA id 44F002D97A88;
 Sun,  8 Nov 2020 21:00:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 abrecht.li 44F002D97A88
MIME-Version: 1.0
Date: Sun, 08 Nov 2020 21:00:01 +0000
From: Daniel Abrecht <freedesktop-linux-dri-devel@nodmarc.danielabrecht.ch>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 RESEND] drm: mxsfb: Implement .format_mod_supported
Message-ID: <2a99ffffc2378209307e0992a6e97e70@nodmarc.danielabrecht.ch>
X-Sender: freedesktop-linux-dri-devel@nodmarc.danielabrecht.ch
User-Agent: Roundcube Webmail/1.3.15
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
Cc: Marek Vasut <marex@denx.de>, kernel@pengutronix.de, linux-imx@nxp.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This will make sure applications which use the IN_FORMATS blob
to figure out which modifiers they can use will pick up the
linear modifier which is needed by mxsfb. Such applications
will not work otherwise if an incompatible implicit modifier
ends up being selected.

Before commit ae1ed0093281 ("drm: mxsfb: Stop using DRM simple
display pipeline helper"), the DRM simple display pipeline
helper took care of this.

Signed-off-by: Daniel Abrecht <public@danielabrecht.ch>
Fixes: ae1ed0093281 ("drm: mxsfb: Stop using DRM simple display pipeline 
helper")
---
  drivers/gpu/drm/mxsfb/mxsfb_kms.c | 8 ++++++++
  1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c 
b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
index 956f631997f2..fc4b1626261b 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
@@ -484,6 +484,13 @@ static void 
mxsfb_plane_overlay_atomic_update(struct drm_plane *plane,
  	writel(ctrl, mxsfb->base + LCDC_AS_CTRL);
  }

+static bool mxsfb_format_mod_supported(struct drm_plane *plane,
+				       uint32_t format,
+				       uint64_t modifier)
+{
+	return modifier == DRM_FORMAT_MOD_LINEAR;
+}
+
  static const struct drm_plane_helper_funcs 
mxsfb_plane_primary_helper_funcs = {
  	.atomic_check = mxsfb_plane_atomic_check,
  	.atomic_update = mxsfb_plane_primary_atomic_update,
@@ -495,6 +502,7 @@ static const struct drm_plane_helper_funcs 
mxsfb_plane_overlay_helper_funcs = {
  };

  static const struct drm_plane_funcs mxsfb_plane_funcs = {
+	.format_mod_supported	= mxsfb_format_mod_supported,
  	.update_plane		= drm_atomic_helper_update_plane,
  	.disable_plane		= drm_atomic_helper_disable_plane,
  	.destroy		= drm_plane_cleanup,
-- 
2.20.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
