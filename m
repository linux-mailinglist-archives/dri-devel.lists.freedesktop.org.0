Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 617AA2ADB03
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 16:58:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC5B789356;
	Tue, 10 Nov 2020 15:58:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail1.protonmail.ch (mail1.protonmail.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7771C89356
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 15:58:17 +0000 (UTC)
Date: Tue, 10 Nov 2020 15:58:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1605023894;
 bh=Ild50f8f3Xx8eqyDNJTr+4QxDE6pY6eAX/jlVg/K1RQ=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=SzcnD4ek8kZetjOtQIVrPWnMEtBdK/XasJeb4yWDbt+AHWPiVl4VrnIKx6kbvwM7Q
 N1jDfmyEV3ceDtYzCuglyoJaxQj7wLVRC6+HqY+lD+1o/56EHMYUCpXWvm1PkfZ7sd
 3ugfvBRvMrD/gcNufW070GvEwre/qqD/rOBbmbQAUfMskTEF4BOtGUldFfdF2yN70u
 dgj++cOiPU193QSznRzPsJ7VMgGjNHBh8UNpMTgwNmhpR4pdc5Nx5ga94IChVAMr0H
 jRCWeKF2b5+TVISRbujwLg7JLrli5bj//eFy0qvB/v4A8lwUbON2OWWLbBXfaOKby3
 TNY1wYbH2t0FQ==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH] drm: add debug logs for drm_mode_atomic_ioctl errors
Message-ID: <2sJwtJZS8GpTVmDedCE6b5WNkmnmUARXGt0mugjU2BA@cp3-web-033.plabs.ch>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Be nice to user-space and log what happened when returning EINVAL in
drm_mode_atomic_ioctl.

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_atomic_uapi.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 25c269bc4681..68d767420082 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -1303,22 +1303,30 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 	 * though this may be a bit overkill, since legacy userspace
 	 * wouldn't know how to call this ioctl)
 	 */
-	if (!file_priv->atomic)
+	if (!file_priv->atomic) {
+		DRM_DEBUG_ATOMIC("atomic commit failed: atomic cap not enabled\n");
 		return -EINVAL;
+	}
 
-	if (arg->flags & ~DRM_MODE_ATOMIC_FLAGS)
+	if (arg->flags & ~DRM_MODE_ATOMIC_FLAGS) {
+		DRM_DEBUG_ATOMIC("atomic commit failed: invalid flag\n");
 		return -EINVAL;
+	}
 
 	if (arg->reserved)
 		return -EINVAL;
 
-	if (arg->flags & DRM_MODE_PAGE_FLIP_ASYNC)
+	if (arg->flags & DRM_MODE_PAGE_FLIP_ASYNC) {
+		DRM_DEBUG_ATOMIC("atomic commit failed: invalid flag DRM_MODE_PAGE_FLIP_ASYNC\n");
 		return -EINVAL;
+	}
 
 	/* can't test and expect an event at the same time. */
 	if ((arg->flags & DRM_MODE_ATOMIC_TEST_ONLY) &&
-			(arg->flags & DRM_MODE_PAGE_FLIP_EVENT))
+			(arg->flags & DRM_MODE_PAGE_FLIP_EVENT)) {
+		DRM_DEBUG_ATOMIC("atomic commit failed: page-flip event requested with test-only commit\n");
 		return -EINVAL;
+	}
 
 	state = drm_atomic_state_alloc(dev);
 	if (!state)
-- 
2.29.2


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
