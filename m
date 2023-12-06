Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83025806D99
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 12:14:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C9E310E6D6;
	Wed,  6 Dec 2023 11:14:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 948A410E6D9
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 11:14:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 1511DB82013;
 Wed,  6 Dec 2023 11:14:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14937C433C9;
 Wed,  6 Dec 2023 11:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701861239;
 bh=+tq8JaRTw/nWXBe9GrW47h9Yc348vGVApgCfrQ+NN98=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FGPIj11GIjksQOC93Z+pMHLJvM2nnDLJuAQ+c+JBtwK9riNqgp7D9HupkhZfGB/DM
 CtVk12h4l+I0roMspgoHSAC3xtv5qKr8rs5UTFxbkrkfWD0XZSzU6nn8rKELcGVHjM
 peF6c9C6ww4pgFNqtAoB22ticpY6OiD1FCB1ArAi3QsBKj6bYOFmJfc8uKZj8edf6S
 DzpXEoHklYPqz7ph9yn6o4nJDVYdaLZJCKpDWvl9ulqL2Fj32oPn/bbqNM1Q+Q4h7f
 JKNanleKf6Vxl8o3u5OngyOM4jCwOOcoXVmTbkirQWq4uTmLc8OXk7aLYLUzoK3Pz0
 iTrkRRZ8DiFNg==
From: Maxime Ripard <mripard@kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 2/4] drm/crtc: Make init functions panic consitently and
 explicitly
Date: Wed,  6 Dec 2023 12:13:49 +0100
Message-ID: <20231206111351.300225-2-mripard@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231206111351.300225-1-mripard@kernel.org>
References: <20231206111351.300225-1-mripard@kernel.org>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

All of the current CRTC init / allocation functions behave slightly
differently when it comes to argument sanitizing:

 - drm_crtc_init_with_planes() implicitly panics if the drm_device
   pointer, the drm_crtc pointer, or the drm_crtc_funcs pointer are
   NULL, and calls WARN_ON if there's no destroy implementation but
   goes on with the initialization.

 - drmm_crtc_init_with_planes() implicitly panics if the drm_device
   pointer, the drm_crtc pointer, or the drm_crtc_funcs pointer are
   NULL, and calls WARN_ON if there's no destroy implementation but
   goes on with the initialization.

 - drmm_crtc_alloc_with_planes() implicitly panics if the drm_device
   pointer, or the drm_crtc pointer are NULL, and calls WARN_ON if
   the drm_crtc_funcs pointer is NULL or there's no destroy
   implementation but goes on with the initialization.

The current consensus is that the drm_device pointer, the
drm_crtc_funcs pointer, and the drm_crtc pointer if relevant, should be
considered pre-requisite and the function should panic if we encounter
such a situation, and that returning an error in such a situation is not
welcome.

Let's make all functions consider those three pointers to be always set
and explicitly panic if they aren't. And let's document that behaviour
too.

Link: https://lore.kernel.org/dri-devel/20231128-kms-hdmi-connector-state-v4-5-c7602158306e@kernel.org/
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_crtc.c | 18 ++++++++++++++++--
 include/drm/drm_crtc.h     |  3 +++
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index df9bf3c9206e..87e5877b753d 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -350,6 +350,9 @@ static int __drm_crtc_init_with_planes(struct drm_device *dev, struct drm_crtc *
  *
  * Returns:
  * Zero on success, error code on failure.
+ *
+ * Panics:
+ * If @dev, @crtc, or @funcs are NULL.
  */
 int drm_crtc_init_with_planes(struct drm_device *dev, struct drm_crtc *crtc,
 			      struct drm_plane *primary,
@@ -360,6 +363,9 @@ int drm_crtc_init_with_planes(struct drm_device *dev, struct drm_crtc *crtc,
 	va_list ap;
 	int ret;
 
+	BUG_ON(!dev);
+	BUG_ON(!crtc);
+	BUG_ON(!funcs);
 	WARN_ON(!funcs->destroy);
 
 	va_start(ap, name);
@@ -432,6 +438,9 @@ static int __drmm_crtc_init_with_planes(struct drm_device *dev,
  *
  * Returns:
  * Zero on success, error code on failure.
+ *
+ * Panics:
+ * If @dev, @crtc, or @funcs are NULL.
  */
 int drmm_crtc_init_with_planes(struct drm_device *dev, struct drm_crtc *crtc,
 			       struct drm_plane *primary,
@@ -442,6 +451,10 @@ int drmm_crtc_init_with_planes(struct drm_device *dev, struct drm_crtc *crtc,
 	va_list ap;
 	int ret;
 
+	BUG_ON(!dev);
+	BUG_ON(!crtc);
+	BUG_ON(!funcs);
+
 	va_start(ap, name);
 	ret = __drmm_crtc_init_with_planes(dev, crtc, primary, cursor, funcs,
 					   name, ap);
@@ -465,8 +478,9 @@ void *__drmm_crtc_alloc_with_planes(struct drm_device *dev,
 	va_list ap;
 	int ret;
 
-	if (WARN_ON(!funcs || funcs->destroy))
-		return ERR_PTR(-EINVAL);
+	BUG_ON(!dev);
+	BUG_ON(!funcs);
+	WARN_ON(funcs->destroy);
 
 	container = drmm_kzalloc(dev, size, GFP_KERNEL);
 	if (!container)
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index 8b48a1974da3..fdcbc3ac9e08 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -1248,6 +1248,9 @@ void *__drmm_crtc_alloc_with_planes(struct drm_device *dev,
  *
  * Returns:
  * Pointer to new crtc, or ERR_PTR on failure.
+ *
+ * Panics:
+ * If @dev or @funcs are NULL.
  */
 #define drmm_crtc_alloc_with_planes(dev, type, member, primary, cursor, funcs, name, ...) \
 	((type *)__drmm_crtc_alloc_with_planes(dev, sizeof(type), \
-- 
2.43.0

