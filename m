Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D5199352D
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 19:39:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FEA210E225;
	Mon,  7 Oct 2024 17:39:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Y1/W1gnN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF36410E3ED
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 17:39:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E35F85C5CF7;
 Mon,  7 Oct 2024 17:39:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62FBFC4CEC6;
 Mon,  7 Oct 2024 17:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1728322746;
 bh=VvJ8YNU78de4xDh311gpCyCxsuwRL7e1AlwnGF6LTbw=;
 h=Subject:To:Cc:From:Date:From;
 b=Y1/W1gnNv7t1ijeCT7s6Cy0fGwoxiXMsddubbSjEwJvf+8uUvcm/MuAmbstm/bBNp
 W4ly0oc1r2Z6RwBqYmfmMEs/wEHmJb/pjleyxXPg2x4RAUWrQBtvHd1aKmk+W022G9
 xyOhz4/13HmrjISrjYnqM/fETu10dSTjdckcHgiE=
Subject: Patch "firmware/sysfb: Disable sysfb for firmware buffers with
 unknown parent" has been added to the 6.11-stable tree
To: alexander.deucher@amd.com, chaitanya.kumar.borah@intel.com,
 daniel.vetter@ffwll.ch, deller@gmx.de, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, javierm@redhat.com, regressions@leemhuis.info,
 sam@ravnborg.org, tzimmermann@suse.de
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Mon, 07 Oct 2024 19:35:45 +0200
Message-ID: <2024100744-predator-upbeat-952c@gregkh>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


This is a note to let you know that I've just added the patch titled

    firmware/sysfb: Disable sysfb for firmware buffers with unknown parent

to the 6.11-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     firmware-sysfb-disable-sysfb-for-firmware-buffers-with-unknown-parent.patch
and it can be found in the queue-6.11 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From ad604f0a4c040dcb8faf44dc72db25e457c28076 Mon Sep 17 00:00:00 2001
From: Thomas Zimmermann <tzimmermann@suse.de>
Date: Tue, 24 Sep 2024 10:41:03 +0200
Subject: firmware/sysfb: Disable sysfb for firmware buffers with unknown parent

From: Thomas Zimmermann <tzimmermann@suse.de>

commit ad604f0a4c040dcb8faf44dc72db25e457c28076 upstream.

The sysfb framebuffer handling only operates on graphics devices
that provide the system's firmware framebuffer. If that device is
not known, assume that any graphics device has been initialized by
firmware.

Fixes a problem on i915 where sysfb does not release the firmware
framebuffer after the native graphics driver loaded.

Reported-by: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>
Closes: https://lore.kernel.org/dri-devel/SJ1PR11MB6129EFB8CE63D1EF6D932F94B96F2@SJ1PR11MB6129.namprd11.prod.outlook.com/
Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12160
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: b49420d6a1ae ("video/aperture: optionally match the device in sysfb_disable()")
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Helge Deller <deller@gmx.de>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: dri-devel@lists.freedesktop.org
Cc: Linux regression tracking (Thorsten Leemhuis) <regressions@leemhuis.info>
Cc: <stable@vger.kernel.org> # v6.11+
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20240924084227.262271-1-tzimmermann@suse.de
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/firmware/sysfb.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

--- a/drivers/firmware/sysfb.c
+++ b/drivers/firmware/sysfb.c
@@ -67,9 +67,11 @@ static bool sysfb_unregister(void)
 void sysfb_disable(struct device *dev)
 {
 	struct screen_info *si = &screen_info;
+	struct device *parent;
 
 	mutex_lock(&disable_lock);
-	if (!dev || dev == sysfb_parent_dev(si)) {
+	parent = sysfb_parent_dev(si);
+	if (!dev || !parent || dev == parent) {
 		sysfb_unregister();
 		disabled = true;
 	}


Patches currently in stable-queue which might be from tzimmermann@suse.de are

queue-6.11/firmware-sysfb-disable-sysfb-for-firmware-buffers-with-unknown-parent.patch
queue-6.11/drm-consistently-use-struct-drm_mode_rect-for-fb_damage_clips.patch
