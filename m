Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C160806D9A
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 12:14:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B25610E6D9;
	Wed,  6 Dec 2023 11:14:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7211A10E6D9
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 11:14:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id CD096B82014;
 Wed,  6 Dec 2023 11:14:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D15B1C433C8;
 Wed,  6 Dec 2023 11:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701861242;
 bh=zR/emj+oOuWHjbArF/endzskL5/KXXwA7MWUakEBzOE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ias4dbNOsFxwpcg5k99uU1pnnhitq2CNJ3K4DNZZ+MkYzZshJDVRcbKYdpB5jO43d
 JVDpgiUXvjetDsfkOdyZg1IIYmsuQIvShIDL3HUzdwF9kDXRHi5KWhHNsXimLUh7il
 pL4hYAp2AYkFxavZB/wgKtvTSljNVjt/QfB5j1ELGGvZyu/HKvmdR26JxxodW9cbj6
 RTgimhbdhVt3JXFlWZgPiHWaYSUcnFM7TMgEgfqemN1OHQbP1LBtdQVK74T4IHDxAu
 LPqBtmPjbK7tEMi2V/UFaL7zLtIMK/T6kJxi3v/YO+6AtKh8wzIIpoa9LdeaiiZiOZ
 xi8qyGvAPO78Q==
From: Maxime Ripard <mripard@kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 3/4] drm/encoder: Make init functions panic consitently and
 explicitly
Date: Wed,  6 Dec 2023 12:13:50 +0100
Message-ID: <20231206111351.300225-3-mripard@kernel.org>
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

All of the current encoder init / allocation functions behave slightly
differently when it comes to argument sanitizing:

 - drm_encoder_init() implicitly panics if the drm_device pointer, or
   the drm_encoder pointer are NULL, and calls WARN_ON if there's no
   destroy implementation but goes on with the initialization.

 - drmm_encoder_init() implicitly panics if the drm_device pointer is
   NULL, and calls WARN_ON and errors out if the drm_encoder_funcs
   pointer is NULL or if there's no destroy implementation.

 - drmm_encoder_alloct() implicitly panics if the drm_device pointer is
   NULL, and calls WARN_ON and errors out if the drm_encoder_funcs
   pointer is NULL or if there's no destroy implementation.

The current consensus is that the drm_device pointer, the
drm_encoder_funcs pointer, and the drm_encoder pointer if relevant,
should be considered pre-requisite and the function should panic if we
encounter such a situation, and that returning an error in such a
situation is not welcome.

Let's make all functions consider those three pointers to be always set
and explicitly panic if they aren't. And let's document that behaviour
too.

Link: https://lore.kernel.org/dri-devel/20231128-kms-hdmi-connector-state-v4-5-c7602158306e@kernel.org/
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_encoder.c | 19 +++++++++++++++++--
 include/drm/drm_encoder.h     |  6 ++++++
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_encoder.c b/drivers/gpu/drm/drm_encoder.c
index 8f2bc6a28482..bb120b0814a3 100644
--- a/drivers/gpu/drm/drm_encoder.c
+++ b/drivers/gpu/drm/drm_encoder.c
@@ -159,6 +159,9 @@ static int __drm_encoder_init(struct drm_device *dev,
  *
  * Returns:
  * Zero on success, error code on failure.
+ *
+ * Panics:
+ * If @dev, @encoder, or @funcs are NULL.
  */
 int drm_encoder_init(struct drm_device *dev,
 		     struct drm_encoder *encoder,
@@ -168,6 +171,9 @@ int drm_encoder_init(struct drm_device *dev,
 	va_list ap;
 	int ret;
 
+	BUG_ON(!dev);
+	BUG_ON(!encoder);
+	BUG_ON(!funcs);
 	WARN_ON(!funcs->destroy);
 
 	va_start(ap, name);
@@ -227,8 +233,7 @@ static int __drmm_encoder_init(struct drm_device *dev,
 {
 	int ret;
 
-	if (drm_WARN_ON(dev, funcs && funcs->destroy))
-		return -EINVAL;
+	drm_WARN_ON(dev, funcs->destroy);
 
 	ret = __drm_encoder_init(dev, encoder, funcs, encoder_type, name, args);
 	if (ret)
@@ -250,6 +255,9 @@ void *__drmm_encoder_alloc(struct drm_device *dev, size_t size, size_t offset,
 	va_list ap;
 	int ret;
 
+	BUG_ON(!dev);
+	BUG_ON(!funcs);
+
 	container = drmm_kzalloc(dev, size, GFP_KERNEL);
 	if (!container)
 		return ERR_PTR(-ENOMEM);
@@ -283,6 +291,9 @@ EXPORT_SYMBOL(__drmm_encoder_alloc);
  *
  * Returns:
  * Zero on success, error code on failure.
+ *
+ * Panics:
+ * If @dev, @encoder, or @funcs are NULL.
  */
 int drmm_encoder_init(struct drm_device *dev, struct drm_encoder *encoder,
 		      const struct drm_encoder_funcs *funcs,
@@ -291,6 +302,10 @@ int drmm_encoder_init(struct drm_device *dev, struct drm_encoder *encoder,
 	va_list ap;
 	int ret;
 
+	BUG_ON(!dev);
+	BUG_ON(!encoder);
+	BUG_ON(!funcs);
+
 	va_start(ap, name);
 	ret = __drmm_encoder_init(dev, encoder, funcs, encoder_type, name, ap);
 	va_end(ap);
diff --git a/include/drm/drm_encoder.h b/include/drm/drm_encoder.h
index 977a9381c8ba..1dbebbc36dd4 100644
--- a/include/drm/drm_encoder.h
+++ b/include/drm/drm_encoder.h
@@ -238,6 +238,9 @@ void *__drmm_encoder_alloc(struct drm_device *dev,
  *
  * Returns:
  * Pointer to new encoder, or ERR_PTR on failure.
+ *
+ * Panics:
+ * If @dev, or @funcs are NULL.
  */
 #define drmm_encoder_alloc(dev, type, member, funcs, encoder_type, name, ...) \
 	((type *)__drmm_encoder_alloc(dev, sizeof(type), \
@@ -256,6 +259,9 @@ void *__drmm_encoder_alloc(struct drm_device *dev,
  *
  * Returns:
  * Pointer to the new drm_encoder struct, or ERR_PTR on failure.
+ *
+ * Panics:
+ * If @dev, or @funcs are NULL.
  */
 #define drmm_plain_encoder_alloc(dev, funcs, encoder_type, name, ...) \
 	((struct drm_encoder *) \
-- 
2.43.0

