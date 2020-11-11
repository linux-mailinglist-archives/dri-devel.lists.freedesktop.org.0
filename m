Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B47102AECA7
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 10:07:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ABFB89FD3;
	Wed, 11 Nov 2020 09:07:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.protonmail.ch (mail-40136.protonmail.ch
 [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 506BA89FD3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 09:07:51 +0000 (UTC)
Date: Wed, 11 Nov 2020 09:07:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1605085669;
 bh=3CnySMZH2apTpCFBS19YF02YJsKtkXuILcez4Wq+5eE=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=BrrD60X4BmMzqNzf4CrP53DNIlA4/murOETsxV8G2nuVOOI1EBTxQsfbEQwDUZYT0
 /FsuhybuhSB8fvIc0BiEreWmfVv9QM8UZt1Wiq5f9NjhZWl+D9eKqSmoQQKq3Ed/r0
 BYvuIx4XGJ49sp4X0RFxQSeV7PvXIbah5+akE7P0K42z5onQOdLKANiP3g3UsTgL1n
 XA43PEbzmaT2TKGULdioLokIxMkTqvG0xxTzgoUnVybIAHBP1Kbl0wOMAD+UfI403l
 ilfkAaoe1Ono3BNn5Xs2pmap1ygjmrotYbSZZGwvXsZW9eaeoK3+5C9FPB+SoG8ZC0
 hIEvHTnHCzuhA==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH v2 2/2] drm: add debug logs for drm_mode_atomic_ioctl errors
Message-ID: <AVFi5ZzKwRVLtY8AQyxvqgIbcUfVgNebOtGVwSNMKvs@cp4-web-038.plabs.ch>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Be nice to user-space and log what happened when returning EINVAL in
drm_mode_atomic_ioctl.

v2:

- Migrate to drm_dbg_atomic (Sam)
- Add debug log for arg->reserved (Ville)
- Drop redundant "atomic" word in log messages (Ville)

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index efab3d518891..9df7f2a170e3 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -1330,22 +1330,35 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 	 * though this may be a bit overkill, since legacy userspace
 	 * wouldn't know how to call this ioctl)
 	 */
-	if (!file_priv->atomic)
+	if (!file_priv->atomic) {
+		drm_dbg_atomic(dev,
+			       "commit failed: atomic cap not enabled\n");
 		return -EINVAL;
+	}
 
-	if (arg->flags & ~DRM_MODE_ATOMIC_FLAGS)
+	if (arg->flags & ~DRM_MODE_ATOMIC_FLAGS) {
+		drm_dbg_atomic(dev, "commit failed: invalid flag\n");
 		return -EINVAL;
+	}
 
-	if (arg->reserved)
+	if (arg->reserved) {
+		drm_dbg_atomic(dev, "commit failed: reserved field set\n");
 		return -EINVAL;
+	}
 
-	if (arg->flags & DRM_MODE_PAGE_FLIP_ASYNC)
+	if (arg->flags & DRM_MODE_PAGE_FLIP_ASYNC) {
+		drm_dbg_atomic(dev,
+			       "commit failed: invalid flag DRM_MODE_PAGE_FLIP_ASYNC\n");
 		return -EINVAL;
+	}
 
 	/* can't test and expect an event at the same time. */
 	if ((arg->flags & DRM_MODE_ATOMIC_TEST_ONLY) &&
-			(arg->flags & DRM_MODE_PAGE_FLIP_EVENT))
+			(arg->flags & DRM_MODE_PAGE_FLIP_EVENT)) {
+		drm_dbg_atomic(dev,
+			       "commit failed: page-flip event requested with test-only commit\n");
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
