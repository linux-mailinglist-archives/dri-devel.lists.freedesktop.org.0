Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 123FB9928D8
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 12:11:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E03110E35A;
	Mon,  7 Oct 2024 10:11:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="YEAE4GBz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2CBF10E35A
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 10:11:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 378395C5C3D;
 Mon,  7 Oct 2024 10:11:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A76E8C4CECC;
 Mon,  7 Oct 2024 10:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1728295865;
 bh=Xc7GG2mGZ+hY3QLSdOxScqxqR2EQbA5mUGPm2pTNvwY=;
 h=Subject:To:Cc:From:Date:From;
 b=YEAE4GBzVHwTM3qWL33c51E6Wqj1vIcXuVw9QPXJ1IG+Ptwve3NsgtWB1lHEeg54a
 WrAWWtvW2o07aPddwKfz4Di7vLyrS3ZkJORxUCEEarxfauJuB+HQEdHiXiWbwnpc6J
 D1iqwjJz2CSDL8pPZ7B91c0p2BW2uMjYSbgrqoXo=
Subject: Patch "drm: Consistently use struct drm_mode_rect for
 FB_DAMAGE_CLIPS" has been added to the 6.6-stable tree
To: airlied@gmail.com, daniel.vetter@ffwll.ch, dmitry.baryshkov@linaro.org,
 drawat@vmware.com, dri-devel@lists.freedesktop.org, gregkh@linuxfoundation.org,
 lukasz.spintzyk@displaylink.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, simona@ffwll.ch, thellstrom@vmware.com,
 tzimmermann@suse.de, ville.syrjala@linux.intel.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Mon, 07 Oct 2024 12:09:50 +0200
Message-ID: <2024100750-retool-drinking-a9b8@gregkh>
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

    drm: Consistently use struct drm_mode_rect for FB_DAMAGE_CLIPS

to the 6.6-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-consistently-use-struct-drm_mode_rect-for-fb_damage_clips.patch
and it can be found in the queue-6.6 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 8b0d2f61545545ab5eef923ed6e59fc3be2385e0 Mon Sep 17 00:00:00 2001
From: Thomas Zimmermann <tzimmermann@suse.de>
Date: Mon, 23 Sep 2024 09:58:14 +0200
Subject: drm: Consistently use struct drm_mode_rect for FB_DAMAGE_CLIPS
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Thomas Zimmermann <tzimmermann@suse.de>

commit 8b0d2f61545545ab5eef923ed6e59fc3be2385e0 upstream.

FB_DAMAGE_CLIPS is a plane property for damage handling. Its UAPI
should only use UAPI types. Hence replace struct drm_rect with
struct drm_mode_rect in drm_atomic_plane_set_property(). Both types
are identical in practice, so there's no change in behavior.

Reported-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Closes: https://lore.kernel.org/dri-devel/Zu1Ke1TuThbtz15E@intel.com/
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: d3b21767821e ("drm: Add a new plane property to send damage during plane update")
Cc: Lukasz Spintzyk <lukasz.spintzyk@displaylink.com>
Cc: Deepak Rawat <drawat@vmware.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Thomas Hellstrom <thellstrom@vmware.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v5.0+
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20240923075841.16231-1-tzimmermann@suse.de
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/drm_atomic_uapi.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -585,7 +585,7 @@ static int drm_atomic_plane_set_property
 					&state->fb_damage_clips,
 					val,
 					-1,
-					sizeof(struct drm_rect),
+					sizeof(struct drm_mode_rect),
 					&replaced);
 		return ret;
 	} else if (property == plane->scaling_filter_property) {


Patches currently in stable-queue which might be from tzimmermann@suse.de are

queue-6.6/drm-consistently-use-struct-drm_mode_rect-for-fb_damage_clips.patch
