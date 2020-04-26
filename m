Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D251B8FE6
	for <lists+dri-devel@lfdr.de>; Sun, 26 Apr 2020 14:35:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 930276E2C4;
	Sun, 26 Apr 2020 12:35:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFB9C6E29B
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Apr 2020 10:01:32 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id r17so11315109lff.2
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Apr 2020 03:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=hcdO585ed6dhWyG//gXm3cGKsbtOyJyZqsLOBSwj2N8=;
 b=ikirOJ+7rRXxs7SrNlgEkDaZVMrjyvtQ7PidEJ7ixIVmpogc62gfDDT06j3E1/98JZ
 KhniI335e7UHyv+Eg17tUeY03z++QOQl/7LaVaUUK50gywj0Cc7yIcmTMMm6X6QuqGSE
 4zGMveRX/DfWj/KjsRo5XL5rPuhu7RAPSYZAWTPqbc6TCGa8np90xgfvZPE7oA90AZ9e
 dB+uQhKy8eL54f9DvEM7QVbUr0weEAB9vDUmW9ISF+z8J5m21YmfQ6aH5ld4dwrWYk7m
 T3dvULpTNzVlQ4odqRdZiera/2YRFPYD8GcSDC1gUIPKAAhApNQwHshRgAMJMLyZeZCv
 I9wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=hcdO585ed6dhWyG//gXm3cGKsbtOyJyZqsLOBSwj2N8=;
 b=M3gr/g9/z06IbuhQ7UcHeLe3e2u0VCyccOu6rAjEtqOXZGy5xlhnSutgGX6YQRHGLr
 ikB9Y5QS2wm8czvQszYVCxs/VanjC7mKk+ESK0TAmSAHJb8Ioldsu9DU1AspkxvX6sVo
 BdJcvHXu5+VGjYcLxB7WsSs1XRgSiXbwVeCnRPxDqgi4Hl3/+NJp0UZjYe+kEFWwZd31
 pWYTQxWCoy+uAINDjp68inJ+iarZUxq9L+LFuUEG/M3E3Zej3Bbc5z0VT3OhnuRxmu/i
 P6qrDNiIz+hTQ17NSRwXcRHrPDiwD19Xg7yGTVHGSdAmWDZ6a5fNr/sBhxpOKFnsQUa4
 Fm7g==
X-Gm-Message-State: AGi0PuZCVUijLmLVKzwtkZTgqpJG/LbKeCIgaJDV00uWPTjxdcILN1+p
 6MngQ1iwIfDL93DI/ZfnnfM=
X-Google-Smtp-Source: APiQypIMfzDbnEekij6Jd1FoTOd3sfpBap33rPZO9O0+3qrG9qvTIfqWdSKX24mM8n0Op4LXD1VC0Q==
X-Received: by 2002:ac2:5f5b:: with SMTP id 27mr12062370lfz.136.1587895291405; 
 Sun, 26 Apr 2020 03:01:31 -0700 (PDT)
Received: from e123311-lin.cambridge.arm.com
 (static-91-225-135-18.devs.futuro.pl. [91.225.135.18])
 by smtp.gmail.com with ESMTPSA id r206sm8720231lff.65.2020.04.26.03.01.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 26 Apr 2020 03:01:30 -0700 (PDT)
From: Michal Orzel <michalorzel.eng@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drm: Replace drm_modeset_lock/unlock_all with
 DRM_MODESET_LOCK_ALL_* helpers
Date: Sun, 26 Apr 2020 12:01:22 +0200
Message-Id: <1587895282-2808-1-git-send-email-michalorzel.eng@gmail.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Sun, 26 Apr 2020 12:35:16 +0000
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
Cc: Michal Orzel <michalorzel.eng@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As suggested by the TODO list for the kernel DRM subsystem, replace
the deprecated functions that take/drop modeset locks with new helpers.

Signed-off-by: Michal Orzel <michalorzel.eng@gmail.com>
---
 drivers/gpu/drm/drm_mode_object.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_mode_object.c b/drivers/gpu/drm/drm_mode_object.c
index 35c2719..901b078 100644
--- a/drivers/gpu/drm/drm_mode_object.c
+++ b/drivers/gpu/drm/drm_mode_object.c
@@ -402,12 +402,13 @@ int drm_mode_obj_get_properties_ioctl(struct drm_device *dev, void *data,
 {
 	struct drm_mode_obj_get_properties *arg = data;
 	struct drm_mode_object *obj;
+	struct drm_modeset_acquire_ctx ctx;
 	int ret = 0;
 
 	if (!drm_core_check_feature(dev, DRIVER_MODESET))
 		return -EOPNOTSUPP;
 
-	drm_modeset_lock_all(dev);
+	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
 
 	obj = drm_mode_object_find(dev, file_priv, arg->obj_id, arg->obj_type);
 	if (!obj) {
@@ -427,7 +428,7 @@ int drm_mode_obj_get_properties_ioctl(struct drm_device *dev, void *data,
 out_unref:
 	drm_mode_object_put(obj);
 out:
-	drm_modeset_unlock_all(dev);
+	DRM_MODESET_LOCK_ALL_END(ctx, ret);
 	return ret;
 }
 
@@ -449,12 +450,13 @@ static int set_property_legacy(struct drm_mode_object *obj,
 {
 	struct drm_device *dev = prop->dev;
 	struct drm_mode_object *ref;
+	struct drm_modeset_acquire_ctx ctx;
 	int ret = -EINVAL;
 
 	if (!drm_property_change_valid_get(prop, prop_value, &ref))
 		return -EINVAL;
 
-	drm_modeset_lock_all(dev);
+	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
 	switch (obj->type) {
 	case DRM_MODE_OBJECT_CONNECTOR:
 		ret = drm_connector_set_obj_prop(obj, prop, prop_value);
@@ -468,7 +470,7 @@ static int set_property_legacy(struct drm_mode_object *obj,
 		break;
 	}
 	drm_property_change_valid_put(prop, ref);
-	drm_modeset_unlock_all(dev);
+	DRM_MODESET_LOCK_ALL_END(ctx, ret);
 
 	return ret;
 }
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
