Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 059F34F0210
	for <lists+dri-devel@lfdr.de>; Sat,  2 Apr 2022 15:20:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACC2A10E087;
	Sat,  2 Apr 2022 13:20:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77E6C10E087
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Apr 2022 13:20:15 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EA5B3614CF;
 Sat,  2 Apr 2022 13:20:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D619C340EC;
 Sat,  2 Apr 2022 13:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1648905614;
 bh=d7xEhHGaM6RZ5J1GxacT6l7W4AM0+2DswZtXo8mYH8I=;
 h=Subject:To:Cc:From:Date:From;
 b=D2tmbg53Z+Is+BlvTobmVASDPgEiI9qiRcxQnHG4xey37HbqxXDCEtm4vUL7lAql6
 5yiac40WHM8D27Xo9JibtnTnOrnrW05eV2O5MvPqj0D8kce+Hpw3SGRkvIHx0mNGSf
 QihyStQYVZZV2Ayxbs3Y52Py1jsxkJL0/W/sXyM0=
Subject: Patch "drm/fb-helper: Mark screen buffers in system memory with
 FBINFO_VIRTFB" has been added to the 5.16-stable tree
To: daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, tzimmermann@suse.de
From: <gregkh@linuxfoundation.org>
Date: Sat, 02 Apr 2022 15:11:05 +0200
Message-ID: <16489050651912@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
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
Cc: stable-commits@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


This is a note to let you know that I've just added the patch titled

    drm/fb-helper: Mark screen buffers in system memory with FBINFO_VIRTFB

to the 5.16-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-fb-helper-mark-screen-buffers-in-system-memory-with-fbinfo_virtfb.patch
and it can be found in the queue-5.16 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From cd9f7f7ac5932129fe81b4c7559cfcb226ec7c5c Mon Sep 17 00:00:00 2001
From: Thomas Zimmermann <tzimmermann@suse.de>
Date: Tue, 1 Feb 2022 12:53:05 +0100
Subject: drm/fb-helper: Mark screen buffers in system memory with FBINFO_VIRTFB

From: Thomas Zimmermann <tzimmermann@suse.de>

commit cd9f7f7ac5932129fe81b4c7559cfcb226ec7c5c upstream.

Mark screen buffers in system memory with FBINFO_VIRTFB. Otherwise, fbdev
deferred I/O marks mmap'ed areas of system memory with VM_IO. (There's an
inverse relationship between the two flags.)

For shadow buffers, also set the FBINFO_READS_FAST hint.

v3:
	* change FB_ to FBINFO_ in commit description
v2:
	* updated commit description (Daniel)
	* added Fixes tag

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: d536540f304c ("drm/fb-helper: Add generic fbdev emulation .fb_probe function")
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v4.19+
Link: https://patchwork.freedesktop.org/patch/msgid/20220201115305.9333-1-tzimmermann@suse.de
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/drm_fb_helper.c |    9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -2346,6 +2346,7 @@ static int drm_fb_helper_generic_probe(s
 	fbi->fbops = &drm_fbdev_fb_ops;
 	fbi->screen_size = fb->height * fb->pitches[0];
 	fbi->fix.smem_len = fbi->screen_size;
+	fbi->flags = FBINFO_DEFAULT;
 
 	drm_fb_helper_fill_info(fbi, fb_helper, sizes);
 
@@ -2353,19 +2354,21 @@ static int drm_fb_helper_generic_probe(s
 		fbi->screen_buffer = vzalloc(fbi->screen_size);
 		if (!fbi->screen_buffer)
 			return -ENOMEM;
+		fbi->flags |= FBINFO_VIRTFB | FBINFO_READS_FAST;
 
 		fbi->fbdefio = &drm_fbdev_defio;
-
 		fb_deferred_io_init(fbi);
 	} else {
 		/* buffer is mapped for HW framebuffer */
 		ret = drm_client_buffer_vmap(fb_helper->buffer, &map);
 		if (ret)
 			return ret;
-		if (map.is_iomem)
+		if (map.is_iomem) {
 			fbi->screen_base = map.vaddr_iomem;
-		else
+		} else {
 			fbi->screen_buffer = map.vaddr;
+			fbi->flags |= FBINFO_VIRTFB;
+		}
 
 		/*
 		 * Shamelessly leak the physical address to user-space. As


Patches currently in stable-queue which might be from tzimmermann@suse.de are

queue-5.16/fbdev-hot-unplug-firmware-fb-devices-on-forced-removal.patch
queue-5.16/drm-fb-helper-mark-screen-buffers-in-system-memory-with-fbinfo_virtfb.patch
queue-5.16/drm-simpledrm-add-panel-orientation-property-on-non-upright-mounted-lcd-panels.patch
queue-5.16/mgag200-fix-memmapsl-configuration-in-gctl6-register.patch
