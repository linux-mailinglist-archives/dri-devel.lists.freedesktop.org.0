Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 831AC430825
	for <lists+dri-devel@lfdr.de>; Sun, 17 Oct 2021 12:50:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF4A66E5BD;
	Sun, 17 Oct 2021 10:50:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A42D6E5BD
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Oct 2021 10:50:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 70DFE61040;
 Sun, 17 Oct 2021 10:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1634467806;
 bh=9CXaXpW71OyuJBeoqzq+PuQsQrhDPw5GhNLnUKMJcu8=;
 h=Subject:To:Cc:From:Date:From;
 b=Yj/AXfSMH38z+xEBCZNwLII6bxqXA3KTl3J1xGCnu611CzHtMOg/CCG9tZf3LaLXB
 9CF8/9js3/+JASzhoB8D/RXutyAJY/m2QRHihHqNjTbNiZWQPPgK0Wlzs6nnrC7L5i
 dFF//VKRIkSLBmCFIZYpJFDqjOaQeNO+tq/CD3Eo=
Subject: Patch "drm/fbdev: Clamp fbdev surface size if too large" has been
 added to the 5.14-stable tree
To: airlied@redhat.com, alexander.deucher@amd.com, daniel.vetter@ffwll.ch,
 dirty.ice.hu@gmail.com, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, kernel@amanoeldawod.com, maxime@cerno.tech,
 michael+lkml@stapelberg.ch, tzimmermann@suse.de, ville.syrjala@linux.intel.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Sun, 17 Oct 2021 12:49:22 +0200
Message-ID: <163446776284197@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


This is a note to let you know that I've just added the patch titled

    drm/fbdev: Clamp fbdev surface size if too large

to the 5.14-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-fbdev-clamp-fbdev-surface-size-if-too-large.patch
and it can be found in the queue-5.14 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From b693e42921e0220c0d564c55c6cdc680b0f85390 Mon Sep 17 00:00:00 2001
From: Thomas Zimmermann <tzimmermann@suse.de>
Date: Tue, 5 Oct 2021 09:03:55 +0200
Subject: drm/fbdev: Clamp fbdev surface size if too large
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Thomas Zimmermann <tzimmermann@suse.de>

commit b693e42921e0220c0d564c55c6cdc680b0f85390 upstream.

Clamp the fbdev surface size of the available maximumi height to avoid
failing to init console emulation. An example error is shown below.

  bad framebuffer height 2304, should be >= 768 && <= 768
  [drm] Initialized simpledrm 1.0.0 20200625 for simple-framebuffer.0 on minor 0
  simple-framebuffer simple-framebuffer.0: [drm] *ERROR* fbdev: Failed to setup generic emulation (ret=-22)

This is especially a problem with drivers that have very small screen
sizes and cannot over-allocate at all.

v2:
	* reduce warning level (Ville)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 11e8f5fd223b ("drm: Add simpledrm driver")
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Reported-by: Amanoel Dawod <kernel@amanoeldawod.com>
Reported-by: Zoltán Kővágó <dirty.ice.hu@gmail.com>
Reported-by: Michael Stapelberg <michael+lkml@stapelberg.ch>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v5.14+
Link: https://patchwork.freedesktop.org/patch/msgid/20211005070355.7680-1-tzimmermann@suse.de
Signed-off-by: Dave Airlie <airlied@redhat.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/drm_fb_helper.c |    6 ++++++
 1 file changed, 6 insertions(+)

--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -1506,6 +1506,7 @@ static int drm_fb_helper_single_fb_probe
 {
 	struct drm_client_dev *client = &fb_helper->client;
 	struct drm_device *dev = fb_helper->dev;
+	struct drm_mode_config *config = &dev->mode_config;
 	int ret = 0;
 	int crtc_count = 0;
 	struct drm_connector_list_iter conn_iter;
@@ -1663,6 +1664,11 @@ static int drm_fb_helper_single_fb_probe
 	/* Handle our overallocation */
 	sizes.surface_height *= drm_fbdev_overalloc;
 	sizes.surface_height /= 100;
+	if (sizes.surface_height > config->max_height) {
+		drm_dbg_kms(dev, "Fbdev over-allocation too large; clamping height to %d\n",
+			    config->max_height);
+		sizes.surface_height = config->max_height;
+	}
 
 	/* push down into drivers */
 	ret = (*fb_helper->funcs->fb_probe)(fb_helper, &sizes);


Patches currently in stable-queue which might be from tzimmermann@suse.de are

queue-5.14/drm-fbdev-clamp-fbdev-surface-size-if-too-large.patch
