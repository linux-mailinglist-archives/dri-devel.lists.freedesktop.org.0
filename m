Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84DCFC29C39
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 02:14:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D64CA10E27C;
	Mon,  3 Nov 2025 01:14:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DuuNqIQV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE4EB10E27C
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 01:14:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5F09F60273;
 Mon,  3 Nov 2025 01:14:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2001C116B1;
 Mon,  3 Nov 2025 01:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1762132447;
 bh=QtsiCdMjo289F+8iYA86NER/P37aUT15z21feQ7glLk=;
 h=Subject:To:Cc:From:Date:From;
 b=DuuNqIQVv7OGAcMGBlq2mFOFYOp9jLvD6WyhO+QklJMcJxoWctJqZ1Gf0HMD0dW7e
 9WkKelXAGI/5LT4HLRTl4uXrdYJCU+wm1xIoqpvmn9blrDClWP1sQdHEEggv1VuRm4
 qW8GPZhaxCPJ4I8T4M/V22aGdjGLro0jhJYmbQxw=
Subject: Patch "drm/sysfb: Do not dereference NULL pointer in plane reset" has
 been added to the 6.12-stable tree
To: airlied@gmail.com, dan.carpenter@linaro.org,
 dri-devel@lists.freedesktop.org, gregkh@linuxfoundation.org,
 javierm@redhat.com, maarten.lankhorst@linux.intel.com, melissa.srw@gmail.com,
 mripard@kernel.org, simona@ffwll.ch, tzimmermann@suse.de
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Mon, 03 Nov 2025 10:13:41 +0900
Message-ID: <2025110341-satisfy-tutu-26a6@gregkh>
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

    drm/sysfb: Do not dereference NULL pointer in plane reset

to the 6.12-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-sysfb-do-not-dereference-null-pointer-in-plane-reset.patch
and it can be found in the queue-6.12 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 14e02ed3876f4ab0ed6d3f41972175f8b8df3d70 Mon Sep 17 00:00:00 2001
From: Thomas Zimmermann <tzimmermann@suse.de>
Date: Fri, 17 Oct 2025 11:13:36 +0200
Subject: drm/sysfb: Do not dereference NULL pointer in plane reset

From: Thomas Zimmermann <tzimmermann@suse.de>

commit 14e02ed3876f4ab0ed6d3f41972175f8b8df3d70 upstream.

The plane state in __drm_gem_reset_shadow_plane() can be NULL. Do not
deref that pointer, but forward NULL to the other plane-reset helpers.
Clears plane->state to NULL.

v2:
- fix typo in commit description (Javier)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: b71565022031 ("drm/gem: Export implementation of shadow-plane helpers")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/dri-devel/aPIDAsHIUHp_qSW4@stanley.mountain/
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Melissa Wen <melissa.srw@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v5.15+
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Link: https://patch.msgid.link/20251017091407.58488-1-tzimmermann@suse.de
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/drm_gem_atomic_helper.c |    8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

--- a/drivers/gpu/drm/drm_gem_atomic_helper.c
+++ b/drivers/gpu/drm/drm_gem_atomic_helper.c
@@ -309,8 +309,12 @@ EXPORT_SYMBOL(drm_gem_destroy_shadow_pla
 void __drm_gem_reset_shadow_plane(struct drm_plane *plane,
 				  struct drm_shadow_plane_state *shadow_plane_state)
 {
-	__drm_atomic_helper_plane_reset(plane, &shadow_plane_state->base);
-	drm_format_conv_state_init(&shadow_plane_state->fmtcnv_state);
+	if (shadow_plane_state) {
+		__drm_atomic_helper_plane_reset(plane, &shadow_plane_state->base);
+		drm_format_conv_state_init(&shadow_plane_state->fmtcnv_state);
+	} else {
+		__drm_atomic_helper_plane_reset(plane, NULL);
+	}
 }
 EXPORT_SYMBOL(__drm_gem_reset_shadow_plane);
 


Patches currently in stable-queue which might be from tzimmermann@suse.de are

queue-6.12/drm-ast-clear-preserved-bits-from-register-output-value.patch
queue-6.12/fbcon-set-fb_display-mode-to-null-when-the-mode-is-released.patch
queue-6.12/drm-sysfb-do-not-dereference-null-pointer-in-plane-reset.patch
queue-6.12/fbdev-bitblit-bound-check-glyph-index-in-bit_putcs.patch
