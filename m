Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD7457F517
	for <lists+dri-devel@lfdr.de>; Sun, 24 Jul 2022 14:37:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0942112CA8;
	Sun, 24 Jul 2022 12:37:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00F08112C85
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Jul 2022 12:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658666269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=G0f3MDsyJEdQb5fcMCp5m0x+k6cu5Bh/NA8aL6IfSBI=;
 b=ehyUlK8aucES34fLIJdZQQ5Q25R5ox4ZC2ZHdiQWqECqbjTBhEpOMFdw+O8kTYCWtqcU1R
 u9DyFIqKxNQ6K+nt39Ttdyl6wJhieVxCu/jZpRfyaiwiKE671B3AssjKs/S3cpbYV7taUA
 hmd1N+yfvwF96xGS9GMfPi35vv29eQ0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-449-nIdkJj4gMeyvAJEwGtZ-iA-1; Sun, 24 Jul 2022 08:37:46 -0400
X-MC-Unique: nIdkJj4gMeyvAJEwGtZ-iA-1
Received: by mail-wm1-f70.google.com with SMTP id
 bh18-20020a05600c3d1200b003a32044cc9fso4802581wmb.6
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Jul 2022 05:37:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G0f3MDsyJEdQb5fcMCp5m0x+k6cu5Bh/NA8aL6IfSBI=;
 b=A7Bd4rPIorJ9pAycS9LE6ZQrnwc76weUNmovwDn+gn9b4a6jb7TWb/ktcwTg+CpC0o
 ygMoDyzJM7xaz9yA5yuKFbAs4FyvLKWvK8NQgDNNrCfYrgwDHoLyyNE8+UINgfNvGph9
 cSzXO0/JEo8M+3BGAq3kU0DATfVA3aFAePRbPwcLMMSd9J85+FNa48s9+gtuZvdStbJ0
 14460BcovY5zXxExlgz8MXcY2QVGNZT1z70ClZYFsjT1B3dEnDqo3sin0HYZx7FciVIo
 r9ARgNf6pjRlcksDlH4oi3Tgfnm4BWSrik0JvcDZp9RlH6GSiFvq4AxzXzGg2y8Jp1RO
 FzRQ==
X-Gm-Message-State: AJIora9DIQ7aBCK2TyG01DBcqqoYEu0ygUhiGtD/6p73DhbUatVF4s0y
 Do5AcLhUa4Qh+wT9B54DyYY89kEUssOxdtPWSbYn38BTe960mjcZswZoSq/va4SDFWwRyXmCKoB
 CbC1gB6R0CiROhMAINTVDyG9g1aie
X-Received: by 2002:a05:6000:2c8:b0:21d:b356:5f21 with SMTP id
 o8-20020a05600002c800b0021db3565f21mr5325415wry.515.1658666265082; 
 Sun, 24 Jul 2022 05:37:45 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ug4YTsIGIBNBnXCQXnAEtS3vid0LdX10qcNDlCxc235fu3aeC6pJksAYEP5BAkqCWq0SUwHQ==
X-Received: by 2002:a05:6000:2c8:b0:21d:b356:5f21 with SMTP id
 o8-20020a05600002c800b0021db3565f21mr5325389wry.515.1658666264736; 
 Sun, 24 Jul 2022 05:37:44 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 l4-20020a05600012c400b0021e4829d359sm9368925wrx.39.2022.07.24.05.37.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Jul 2022 05:37:44 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm: Prevent modeset helpers to access an uninitialized
 drm_mode_config
Date: Sun, 24 Jul 2022 14:37:41 +0200
Message-Id: <20220724123741.1268536-1-javierm@redhat.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DRM drivers initialize the mode configuration with drmm_mode_config_init()
and that function (among other things) initializes mutexes that are later
used by modeset helpers.

But the helpers should only attempt to grab those locks if the mode config
was properly initialized. Otherwise it can lead to kernel oops. An example
is when a DRM driver using the component framework does not initialize the
drm_mode_config, because its .bind callback was not being executed due one
of its expected sub-devices' driver failing to probe.

Some drivers check the struct drm_driver.registered field as an indication
on whether their .shutdown callback should call helpers to tearn down the
mode configuration or not, but most drivers just assume that it is always
safe to call helpers such as drm_atomic_helper_shutdown() during shutdown.

Let make the DRM core more robust and prevent this to happen, by marking a
struct drm_mode_config as initialized during drmm_mode_config_init(). that
way helpers can check for it and not attempt to grab uninitialized mutexes.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/gpu/drm/drm_mode_config.c  | 4 ++++
 drivers/gpu/drm/drm_modeset_lock.c | 6 ++++++
 include/drm/drm_mode_config.h      | 8 ++++++++
 3 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
index 59b34f07cfce..db649f97120b 100644
--- a/drivers/gpu/drm/drm_mode_config.c
+++ b/drivers/gpu/drm/drm_mode_config.c
@@ -456,6 +456,8 @@ int drmm_mode_config_init(struct drm_device *dev)
 		dma_resv_fini(&resv);
 	}
 
+	dev->mode_config.initialized = true;
+
 	return drmm_add_action_or_reset(dev, drm_mode_config_init_release,
 					NULL);
 }
@@ -549,6 +551,8 @@ void drm_mode_config_cleanup(struct drm_device *dev)
 	idr_destroy(&dev->mode_config.tile_idr);
 	idr_destroy(&dev->mode_config.object_idr);
 	drm_modeset_lock_fini(&dev->mode_config.connection_mutex);
+
+	dev->mode_config.initialized = false;
 }
 EXPORT_SYMBOL(drm_mode_config_cleanup);
 
diff --git a/drivers/gpu/drm/drm_modeset_lock.c b/drivers/gpu/drm/drm_modeset_lock.c
index 918065982db4..d6a81cb88123 100644
--- a/drivers/gpu/drm/drm_modeset_lock.c
+++ b/drivers/gpu/drm/drm_modeset_lock.c
@@ -444,6 +444,9 @@ EXPORT_SYMBOL(drm_modeset_unlock);
  *
  * See also: DRM_MODESET_LOCK_ALL_BEGIN() and DRM_MODESET_LOCK_ALL_END()
  *
+ * This function must only be called after drmm_mode_config_init(), since it
+ * takes locks that are initialized as part of the initial mode configuration.
+ *
  * Returns: 0 on success or a negative error-code on failure.
  */
 int drm_modeset_lock_all_ctx(struct drm_device *dev,
@@ -454,6 +457,9 @@ int drm_modeset_lock_all_ctx(struct drm_device *dev,
 	struct drm_plane *plane;
 	int ret;
 
+	if (WARN_ON(!dev->mode_config.initialized))
+		return -EINVAL;
+
 	ret = drm_modeset_lock(&dev->mode_config.connection_mutex, ctx);
 	if (ret)
 		return ret;
diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
index 6b5e01295348..d2e1a6d7dcc2 100644
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@ -954,6 +954,14 @@ struct drm_mode_config {
 	struct drm_atomic_state *suspend_state;
 
 	const struct drm_mode_config_helper_funcs *helper_private;
+
+	/**
+	 * @initialized:
+	 *
+	 * Internally used by modeset helpers such as drm_modeset_lock_all_ctx()
+	 * to determine if the mode configuration has been properly initialized.
+	 */
+	bool initialized;
 };
 
 int __must_check drmm_mode_config_init(struct drm_device *dev);
-- 
2.37.1

