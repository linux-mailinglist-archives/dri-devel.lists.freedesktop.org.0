Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 917E1635C3C
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 12:54:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2F9410E2EB;
	Wed, 23 Nov 2022 11:54:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79B6710E215
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 11:53:54 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 25FEF1F8CD;
 Wed, 23 Nov 2022 11:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1669204433; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+qg1OO1dCgTd++OsRQ6Rdbd/OePW6Ri6kDHag9UTxeg=;
 b=SH9gwwI1HIa31jksvUazw6VRrntrL1Ie3Vv+sealryxydSvW6LEryWIHuwCxlbdtq/gpjC
 OCpWcLRjvSjuvaN0ctMwf7x7nmJw4fjvnpuUXGrKf2di0rqGKOXNRuHQabIMxMVLhvEOxn
 VGyTK3jayby16DPMV2pzbmXz8jn3awg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1669204433;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+qg1OO1dCgTd++OsRQ6Rdbd/OePW6Ri6kDHag9UTxeg=;
 b=gYzSBpOfeECOs92xA0LMg104uN0FWGOgjI2hPA7RElln7XOWXjm5KS5LSFItSise9E+bz6
 +nAMVbsOLnQK3fBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C059013B03;
 Wed, 23 Nov 2022 11:53:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wC3uLdAJfmMwVwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 23 Nov 2022 11:53:52 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, xinliang.liu@linaro.org,
 tiantao6@hisilicon.com, jstultz@google.com, kong.kongxinwei@hisilicon.com,
 puck.chen@hisilicon.com, paul.kocialkowski@bootlin.com, javierm@redhat.com,
 airlied@redhat.com, kraxel@redhat.com
Subject: [PATCH v2 7/7] drm/fb-helper: Don't use the preferred depth for the
 BPP default
Date: Wed, 23 Nov 2022 12:53:48 +0100
Message-Id: <20221123115348.2521-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221123115348.2521-1-tzimmermann@suse.de>
References: <20221123115348.2521-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If no preferred value for bits-per-pixel has been given, fall back
to 32. Never use the preferred depth. The color depth is the number
of color/alpha bits per pixel, while bpp is the overall number of
bits in most cases.

Most noteworthy, XRGB8888 has a depth of 24 and a bpp value of 32.
Using depth for bpp would make the value 24 as well and format
selection in fbdev helpers fails. Unfortunately XRGB8888 is the most
common format and the old heuristic therefore fails for most of
the drivers (unless they implement the 24-bit RGB888 format).

Picking a bpp of 32 will later on result in a default depth of 24
and the format XRGB8888. As XRGB8888 is the default format for most
of the current and legacy graphics stack, all drivers must support
it. So it is the safe choice.

v2:
	* fix commit-message typo (Javier)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/drm_fbdev_generic.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_fbdev_generic.c b/drivers/gpu/drm/drm_fbdev_generic.c
index ab86956692795..0a4c160e0e58a 100644
--- a/drivers/gpu/drm/drm_fbdev_generic.c
+++ b/drivers/gpu/drm/drm_fbdev_generic.c
@@ -431,7 +431,6 @@ static const struct drm_client_funcs drm_fbdev_client_funcs = {
  * drm_fbdev_generic_setup() - Setup generic fbdev emulation
  * @dev: DRM device
  * @preferred_bpp: Preferred bits per pixel for the device.
- *                 @dev->mode_config.preferred_depth is used if this is zero.
  *
  * This function sets up generic fbdev emulation for drivers that supports
  * dumb buffers with a virtual address and that can be mmap'ed.
@@ -475,12 +474,16 @@ void drm_fbdev_generic_setup(struct drm_device *dev,
 	}
 
 	/*
-	 * FIXME: This mixes up depth with bpp, which results in a glorious
-	 * mess, resulting in some drivers picking wrong fbdev defaults and
-	 * others wrong preferred_depth defaults.
+	 * Pick a preferred bpp of 32 if no value has been given. This
+	 * will select XRGB8888 for the framebuffer formats. All drivers
+	 * have to support XRGB8888 for backwards compatibility with legacy
+	 * userspace, so it's the safe choice here.
+	 *
+	 * TODO: Replace struct drm_mode_config.preferred_depth and this
+	 *       bpp value with a preferred format that is given as struct
+	 *       drm_format_info. Then derive all other values from the
+	 *       format.
 	 */
-	if (!preferred_bpp)
-		preferred_bpp = dev->mode_config.preferred_depth;
 	if (!preferred_bpp)
 		preferred_bpp = 32;
 	fb_helper->preferred_bpp = preferred_bpp;
-- 
2.38.1

