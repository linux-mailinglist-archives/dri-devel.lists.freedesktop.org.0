Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE38C806D97
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 12:14:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D02B910E6DA;
	Wed,  6 Dec 2023 11:14:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EC9510E6D5
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 11:13:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 1C82CB8200B;
 Wed,  6 Dec 2023 11:13:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9FA1C433C8;
 Wed,  6 Dec 2023 11:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701861236;
 bh=QFcoKgq7CWQqdqYlKW6NEt5qPgpKJjBelWwveJXD228=;
 h=From:To:Cc:Subject:Date:From;
 b=muPrjhoo5LnGN5QJVkCHWpDSs8f156enl2bTNuR5idyUe2J2KS9+nyVBo9PPkti1r
 wUnD4DSlm220IEcZdH72KaHGi3/lz0UuHIpt0lewMl5LyYDBcgKiRMICZ4U/UYJpUK
 a4Q3ekcx6ZjVYI3yCNSuPOyp2vZXN3Lg3e9ZHgSf+6eQ+MksUhjYuVTGA8YYiUq1S9
 oY0O3KxXpI+ZsE7ShkFq34YUQDh9IhKefXkuOn0s20eKbGYyGgK+WKJcAH0tdjZstp
 H7tR3VWHgxIgk2FgQMGT2u8tG3jF1Ne8iOEFLeVARE+31M2v2WhU8JpBRTMCER/CMl
 yRWBosSSpSyLw==
From: Maxime Ripard <mripard@kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 1/4] drm/plane: Make init functions panic consitently and
 explicitly
Date: Wed,  6 Dec 2023 12:13:48 +0100
Message-ID: <20231206111351.300225-1-mripard@kernel.org>
X-Mailer: git-send-email 2.43.0
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

All of the current plane init / allocation functions behave slightly
differently when it comes to argument sanitizing:

 - drm_universal_plane_init() implicitly panics if the drm_device
   pointer or the drm_plane_funcs pointer are NULL, and calls WARN_ON if
   there's no destroy implementation but goes on with the initialization.

 - drm_universal_plane_alloc() implicitly panics if the drm_device
   pointer is NULL, and will call WARN_ON and return an error if the
   drm_plane_funcs pointer is NULL.

 - drmm_universal_plane_alloc() implicitly panics if the drm_device
   pointer is NULL, and will call WARN_ON and return an error if the
   drm_plane_funcs pointer is NULL or if there is a destroy
   implementation.

The current consensus is that the drm_device pointer, the
drm_plane_funcs pointer, and the drm_plane pointer if relevant, should
be considered pre-requisite and the function should panic if we
encounter such a situation, and that returning an error in such a
situation is not welcome.

Let's make all functions consider those three pointers to be always set
and explicitly panic if they aren't. And let's document that behaviour
too.

Link: https://lore.kernel.org/dri-devel/20231128-kms-hdmi-connector-state-v4-5-c7602158306e@kernel.org/
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_plane.c | 15 +++++++++++----
 include/drm/drm_plane.h     |  6 ++++++
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index 9e8e4c60983d..ce0fa98a0e3f 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -482,6 +482,9 @@ static int __drm_universal_plane_init(struct drm_device *dev,
  *
  * Returns:
  * Zero on success, error code on failure.
+ *
+ * Panics:
+ * If @dev, @plane or @funcs are NULL.
  */
 int drm_universal_plane_init(struct drm_device *dev, struct drm_plane *plane,
 			     uint32_t possible_crtcs,
@@ -494,6 +497,9 @@ int drm_universal_plane_init(struct drm_device *dev, struct drm_plane *plane,
 	va_list ap;
 	int ret;
 
+	BUG_ON(!dev);
+	BUG_ON(!plane);
+	BUG_ON(!funcs);
 	WARN_ON(!funcs->destroy);
 
 	va_start(ap, name);
@@ -528,8 +534,9 @@ void *__drmm_universal_plane_alloc(struct drm_device *dev, size_t size,
 	va_list ap;
 	int ret;
 
-	if (WARN_ON(!funcs || funcs->destroy))
-		return ERR_PTR(-EINVAL);
+	BUG_ON(!dev);
+	BUG_ON(!funcs);
+	WARN_ON(funcs->destroy);
 
 	container = drmm_kzalloc(dev, size, GFP_KERNEL);
 	if (!container)
@@ -567,8 +574,8 @@ void *__drm_universal_plane_alloc(struct drm_device *dev, size_t size,
 	va_list ap;
 	int ret;
 
-	if (drm_WARN_ON(dev, !funcs))
-		return ERR_PTR(-EINVAL);
+	BUG_ON(!dev);
+	BUG_ON(!funcs);
 
 	container = kzalloc(size, GFP_KERNEL);
 	if (!container)
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index c6565a6f9324..2dab1b360fa2 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -824,6 +824,9 @@ void *__drmm_universal_plane_alloc(struct drm_device *dev,
  *
  * Returns:
  * Pointer to new plane, or ERR_PTR on failure.
+ *
+ * Panics:
+ * If @dev or @funcs are NULL.
  */
 #define drmm_universal_plane_alloc(dev, type, member, possible_crtcs, funcs, formats, \
 				   format_count, format_modifiers, plane_type, name, ...) \
@@ -868,6 +871,9 @@ void *__drm_universal_plane_alloc(struct drm_device *dev,
  *
  * Returns:
  * Pointer to new plane, or ERR_PTR on failure.
+ *
+ * Panics:
+ * If @dev or @funcs are NULL.
  */
 #define drm_universal_plane_alloc(dev, type, member, possible_crtcs, funcs, formats, \
 				   format_count, format_modifiers, plane_type, name, ...) \
-- 
2.43.0

