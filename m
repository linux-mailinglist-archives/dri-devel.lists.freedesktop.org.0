Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CF8806D9B
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 12:14:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4849B10E6E2;
	Wed,  6 Dec 2023 11:14:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2F5510E6D9
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 11:14:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3EC1061BF0;
 Wed,  6 Dec 2023 11:14:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9169DC433C7;
 Wed,  6 Dec 2023 11:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701861244;
 bh=+kRdN2xv43cDLD/yot67INzXSTD/LZWXnkCQemV92x4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gbN9SftIpOYN6ZyYrOMSFFD6U0wtohfLcx0VYig1+NV+hZIVw0ULV5gm3Ui4+5Xk9
 cDVie5UUkx/tuljwL7hhac0IrKdvXg4hHdSmXcTGJY8iDgoStTOhebUMe8Wl1h0JI3
 HLykayTzh3n/Z627VndwS19k3pLKtzgYxl+xSX90KhA/Ly1d93yl78wOWEe54qzBmF
 oT68cHx5Ve3ZXafvkQiDhP4BQxSxPSVHLYHJUW8t4g5AMU9XPJ0kkYwe1Yf93h9BJx
 ARR6C3Gst564mV6WhWDK3kBW1HdhRAPTlpq08UNvIEzCn6B7Of+CJFp5VeFd2o0yjf
 DiGdUSJT0nNRQ==
From: Maxime Ripard <mripard@kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 4/4] drm/connector: Make init functions panic consitently and
 explicitly
Date: Wed,  6 Dec 2023 12:13:51 +0100
Message-ID: <20231206111351.300225-4-mripard@kernel.org>
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

 - drm_connector_init() and drm_connector_init_with_ddc() implicitly
   panic if the drm_device pointer, or the drm_connector pointer are
   NULL, and will call WARN_ON and error out if the
   drm_connector_funcs pointer is NULL or if there's no destroy
   implementation.

 - drmm_connector_init() implicitly panics if the drm_device pointer,
   the drm_connector_funcs pointer, or the drm_connector pointer are
   NULL, and will call WARN_ON and error out if there's a destroy
   implementation.

The current consensus is that the drm_device pointer, the drm_connector
pointer, and the drm_connector_funcs pointer should be considered
pre-requisite and the function should panic if we encounter such a
situation, and that returning an error in such a situation is not
welcome.

Let's make all functions consider those three pointers to be always set
and explicitly panic if they aren't. And let's document that behaviour
too.

Link: https://lore.kernel.org/dri-devel/20231128-kms-hdmi-connector-state-v4-5-c7602158306e@kernel.org/
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_connector.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index b0516505f7ae..e7a463db11ea 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -351,14 +351,19 @@ static int __drm_connector_init(struct drm_device *dev,
  *
  * Returns:
  * Zero on success, error code on failure.
+ *
+ * Panics:
+ * If @dev, @connector, or @funcs are NULL.
  */
 int drm_connector_init(struct drm_device *dev,
 		       struct drm_connector *connector,
 		       const struct drm_connector_funcs *funcs,
 		       int connector_type)
 {
-	if (drm_WARN_ON(dev, !(funcs && funcs->destroy)))
-		return -EINVAL;
+	BUG_ON(!dev);
+	BUG_ON(!connector);
+	BUG_ON(!funcs);
+	drm_WARN_ON(dev, !funcs->destroy);
 
 	return __drm_connector_init(dev, connector, funcs, connector_type, NULL);
 }
@@ -387,6 +392,9 @@ EXPORT_SYMBOL(drm_connector_init);
  *
  * Returns:
  * Zero on success, error code on failure.
+ *
+ * Panics:
+ * If @dev, @connector, or @funcs are NULL.
  */
 int drm_connector_init_with_ddc(struct drm_device *dev,
 				struct drm_connector *connector,
@@ -394,8 +402,10 @@ int drm_connector_init_with_ddc(struct drm_device *dev,
 				int connector_type,
 				struct i2c_adapter *ddc)
 {
-	if (drm_WARN_ON(dev, !(funcs && funcs->destroy)))
-		return -EINVAL;
+	BUG_ON(!dev);
+	BUG_ON(!connector);
+	BUG_ON(!funcs);
+	drm_WARN_ON(dev, !funcs->destroy);
 
 	return __drm_connector_init(dev, connector, funcs, connector_type, ddc);
 }
@@ -427,6 +437,9 @@ static void drm_connector_cleanup_action(struct drm_device *dev,
  *
  * Returns:
  * Zero on success, error code on failure.
+ *
+ * Panics:
+ * If @dev, @connector, or @funcs are NULL.
  */
 int drmm_connector_init(struct drm_device *dev,
 			struct drm_connector *connector,
@@ -436,8 +449,10 @@ int drmm_connector_init(struct drm_device *dev,
 {
 	int ret;
 
-	if (drm_WARN_ON(dev, funcs && funcs->destroy))
-		return -EINVAL;
+	BUG_ON(!dev);
+	BUG_ON(!connector);
+	BUG_ON(!funcs);
+	drm_WARN_ON(dev, funcs->destroy);
 
 	ret = __drm_connector_init(dev, connector, funcs, connector_type, ddc);
 	if (ret)
-- 
2.43.0

