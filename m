Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D256E324E
	for <lists+dri-devel@lfdr.de>; Sat, 15 Apr 2023 18:13:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B55D10E0AE;
	Sat, 15 Apr 2023 16:13:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86BDA10E0AE
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Apr 2023 16:13:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BD43461366;
 Sat, 15 Apr 2023 16:13:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAB88C433EF;
 Sat, 15 Apr 2023 16:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1681575205;
 bh=5j6f6I4mbEo7KGdtYrweQ2fm7COf+DDOnyGSkcdLOkc=;
 h=Subject:To:Cc:From:Date:From;
 b=HHFg2DXNw/F10cbgdvh4gmCDuz0fR53WoR7yWXS+uLdXsYKuiCa6qzfXblCmXAHpC
 yP1tV8K++C4K6+28qQLZFuXGox6nwf3saYNNnuuJ8xw6Iz1U5yYBmIZmHbrS8iNDef
 WWbez8zmNtc8NDoGqQ8x91NIyTA/AbzB+l7sye4I=
Subject: Patch "fbmem: Reject FB_ACTIVATE_KD_TEXT from userspace" has been
 added to the 6.2-stable tree
To: airlied@linux.ie, alexander.deucher@amd.com, b.zolnierkie@samsung.com,
 daniel.vetter@ffwll.ch, daniel.vetter@intel.com, daniel@ffwll.ch,
 deller@gmx.de, dri-devel@lists.freedesktop.org, geert+renesas@glider.be,
 geert@linux-m68k.org, gregkh@linuxfoundation.org, hqjagain@gmail.com,
 javierm@redhat.com, maarten.lankhorst@linux.intel.com, michel@daenzer.net,
 mripard@kernel.org, natechancellor@gmail.com, noralf@tronnes.org,
 peda@axentia.se, penguin-kernel@I-love.SAKURA.ne.jp, sam@ravnborg.org,
 samuel.thibault@ens-lyon.org, shlomo@fastmail.com, syoshida@redhat.com,
 tzimmermann@suse.de
From: <gregkh@linuxfoundation.org>
Date: Sat, 15 Apr 2023 18:12:46 +0200
Message-ID: <2023041546-unpack-wildland-1e57@gregkh>
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
Cc: stable-commits@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


This is a note to let you know that I've just added the patch titled

    fbmem: Reject FB_ACTIVATE_KD_TEXT from userspace

to the 6.2-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     fbmem-reject-fb_activate_kd_text-from-userspace.patch
and it can be found in the queue-6.2 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 6fd33a3333c7916689b8f051a185defe4dd515b0 Mon Sep 17 00:00:00 2001
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 4 Apr 2023 21:39:34 +0200
Subject: fbmem: Reject FB_ACTIVATE_KD_TEXT from userspace
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Daniel Vetter <daniel.vetter@ffwll.ch>

commit 6fd33a3333c7916689b8f051a185defe4dd515b0 upstream.

This is an oversight from dc5bdb68b5b3 ("drm/fb-helper: Fix vt
restore") - I failed to realize that nasty userspace could set this.

It's not pretty to mix up kernel-internal and userspace uapi flags
like this, but since the entire fb_var_screeninfo structure is uapi
we'd need to either add a new parameter to the ->fb_set_par callback
and fb_set_par() function, which has a _lot_ of users. Or some other
fairly ugly side-channel int fb_info. Neither is a pretty prospect.

Instead just correct the issue at hand by filtering out this
kernel-internal flag in the ioctl handling code.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Acked-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Fixes: dc5bdb68b5b3 ("drm/fb-helper: Fix vt restore")
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: shlomo@fastmail.com
Cc: Michel Dänzer <michel@daenzer.net>
Cc: Noralf Trønnes <noralf@tronnes.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Daniel Vetter <daniel.vetter@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v5.7+
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Nathan Chancellor <natechancellor@gmail.com>
Cc: Qiujun Huang <hqjagain@gmail.com>
Cc: Peter Rosin <peda@axentia.se>
Cc: linux-fbdev@vger.kernel.org
Cc: Helge Deller <deller@gmx.de>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>
Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Cc: Shigeru Yoshida <syoshida@redhat.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20230404193934.472457-1-daniel.vetter@ffwll.ch
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/video/fbdev/core/fbmem.c |    2 ++
 1 file changed, 2 insertions(+)

--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -1117,6 +1117,8 @@ static long do_fb_ioctl(struct fb_info *
 	case FBIOPUT_VSCREENINFO:
 		if (copy_from_user(&var, argp, sizeof(var)))
 			return -EFAULT;
+		/* only for kernel-internal use */
+		var.activate &= ~FB_ACTIVATE_KD_TEXT;
 		console_lock();
 		lock_fb_info(info);
 		ret = fbcon_modechange_possible(info, &var);


Patches currently in stable-queue which might be from daniel.vetter@ffwll.ch are

queue-6.2/fbmem-reject-fb_activate_kd_text-from-userspace.patch
