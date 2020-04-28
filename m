Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8831BC630
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 19:10:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 155366E85C;
	Tue, 28 Apr 2020 17:10:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C7566E85C;
 Tue, 28 Apr 2020 17:10:24 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id l11so17552988lfc.5;
 Tue, 28 Apr 2020 10:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=hcdO585ed6dhWyG//gXm3cGKsbtOyJyZqsLOBSwj2N8=;
 b=W41tP+JQzdv74uPdFblFj8+m0F8K5wRcvv6oCdjjnmR+B+CUicjNUvh34vFCxEB/Jf
 ALqzJ7RQLed/rJV/1aag5O65NzBsemSdRq6AMqBBXIsDD4DIrMNZ7lqERk0bxpB65r16
 EvaRgIbEma5uDXoPW1hvvHNLqUMu/9fW9U7r6OkbODrXfXeWN+Zvmii6hLBcEAI6FBOD
 8W55jA9aXTMLVizPuyAhn1r1vFHVP2dSvVAIe2uDCKscUVy3m36m0NKW9M0KcU0xg64q
 3FHp4Cehg8jB5fvgpKixnNF6wpSYecWuzLnlEVsUkv2Gi32oh+9k2PopFu9gkFZDEtO/
 NwFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=hcdO585ed6dhWyG//gXm3cGKsbtOyJyZqsLOBSwj2N8=;
 b=RozQn9wgi0maaqXMDzXXjPDYBrmKi9shxxb+PoYyMXb0nTfJiWA6gqMZO8ykOtOcTz
 X++Yv/o8Wtr/SlqnVj4qs6qycpO8XdlfNkDCLjCToMzy8BwF5OrKpzBHec+a9Z5nvPtO
 lTYaLbNuzKbITXCI5oyNbf3gY0Z4WaZtjeK/kPdl52qiNSTBd/NMgQQATWRHbpGLHcpj
 GKJjYOIdMBnkLMFtcaVX1I6nIBlsaA2cBDqN0lg0yBnSf2hNFv3tNUonqMCF3niMe9qb
 gfZRo/KGP32wtbSrHa/dPYYTX7n5vWfBrP9yTRGqllvnQK1qNj8wdbfGbpHpEorO8LLy
 DFpA==
X-Gm-Message-State: AGi0Pua2JoFznyBJ3nLv6l7UR2UENhGgnmHTO5ORDZTTZy52kdDVuUcA
 3EAzaSoukoYBW3OXTA8qvUM=
X-Google-Smtp-Source: APiQypIKj7K3jOpFa7ZhGvD1rD2Zy1rtxIlXdZBdq4XuYfv6p6653ZaPjJmlXsWzFPezTKtGBSHOPQ==
X-Received: by 2002:a19:ee18:: with SMTP id g24mr1708261lfb.67.1588093822773; 
 Tue, 28 Apr 2020 10:10:22 -0700 (PDT)
Received: from e123311-lin.cambridge.arm.com
 (static-91-225-135-18.devs.futuro.pl. [91.225.135.18])
 by smtp.gmail.com with ESMTPSA id v2sm13064703ljv.86.2020.04.28.10.10.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 Apr 2020 10:10:22 -0700 (PDT)
From: Michal Orzel <michalorzel.eng@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drm: Replace drm_modeset_lock/unlock_all with
 DRM_MODESET_LOCK_ALL_* helpers
Date: Tue, 28 Apr 2020 19:10:04 +0200
Message-Id: <1588093804-30446-1-git-send-email-michalorzel.eng@gmail.com>
X-Mailer: git-send-email 2.7.4
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
Cc: intel-gfx@lists.freedesktop.org, Michal Orzel <michalorzel.eng@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
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
