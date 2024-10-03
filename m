Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0FB98EEBB
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 14:07:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6432310E825;
	Thu,  3 Oct 2024 12:07:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="A1MPQvIW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CCBB10E825
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2024 12:07:03 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-71b20ffd809so814560b3a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Oct 2024 05:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727957223; x=1728562023; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tENLZuUZDqCKRHgFd+nN+o31lrR5w79lUzAqq4taxj4=;
 b=A1MPQvIWTot003dCOqSv5aCG1OmY24M1Ydxpams08bWBqKXP0eKgF0MFInq7XR1P96
 ChMc/BMfGjIKxyHHgADAzmEn3CJ3uMLVzal6fMWtbDl9ueSRzcZBqbQrtcpCk3dn6+OO
 9/p2fdyzdNS9V3T9EJ2GrsWftDbse+Xyb7/IYIXs7G0mECUjpXh13kQrQMPK7DRk3j7V
 oYw8avXTQgK4WUy/Dfh71oOOOol2uLdl+XJo1PulgQO93B/3wwYmEJBUXyA1FztmOxWV
 lSd5sQ3zCFgEEQWPnUuqGX5rRgXg0LAdD0GCexxcrjbeYFm56BIiYSR3948aFG/soy8y
 pqOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727957223; x=1728562023;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tENLZuUZDqCKRHgFd+nN+o31lrR5w79lUzAqq4taxj4=;
 b=bBE7lbL6Ck5dp2QZnJTODtn0cxMoXRn4guDlbuoArlmE5beVDC+mNkOOtyrkWzY6SE
 nXyLk9BePJ8WYFFs7W/PbQ8HZXPqkUscdhlw4OGieciR0KXcCuFDYDP2PBzXO4IJffDw
 09sLePEBqyariwxauVCqkW0D0EMhEZusOjs1JRPiwajpve/azsbzlDV5/yAaT1W5J4Gy
 kbQB9Z87Sj7QkWGWfVCWLfU7wBfTlgXLdax16z2Pm/S9oR0D2rvuex2t4E3dCWkoZ80a
 KZ7RFyJANQZz+bUnx/H8RbMIK+Y1yS7P7yNMXZsk7YrAqnuzG92ss8uv7/fo2D4Pc57G
 myfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCViON9Ey3C0Y5m5/h3P613jYC3J5X3EswQEikZDzWmiPUpSOzq6nU4xp5QfV1Zy3Oux4s9Y1KFl4v0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyL7f9x32xX9QfUrovFs60cFnR54N7ARZuT3dMZ0C/PJHS+cJEY
 jPUXFpGGce0UCGAdqvIFUP0j2GBW/RExPH3/7h9clq4C8DIP5DvF
X-Google-Smtp-Source: AGHT+IFxqoj5fyUph4UhadmHB8SVnCU8LR0L/apgVycs4/k3ghkiqeSJseoHUadhnddg+9TcHN3m2w==
X-Received: by 2002:a05:6a21:9cca:b0:1d4:e4a9:c126 with SMTP id
 adf61e73a8af0-1d5e2d9e0a5mr10236329637.32.1727957222574; 
 Thu, 03 Oct 2024 05:07:02 -0700 (PDT)
Received: from fedora.. ([2405:201:d007:50c2:4888:86b4:6f32:9ae])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7e9dcb138f3sm601150a12.40.2024.10.03.05.06.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 05:07:01 -0700 (PDT)
From: Vamsi Krishna Brahmajosyula <vamsikrishna.brahmajosyula@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch
Cc: skhan@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] gpu/drm: set gamma_lut or degamma_lut based on HW in
 setcmap_atomic
Date: Thu,  3 Oct 2024 17:36:55 +0530
Message-ID: <20241003120655.53663-1-vamsikrishna.brahmajosyula@gmail.com>
X-Mailer: git-send-email 2.46.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

setcmap_atomic always sets gamma_lut in setcmap_atomic

Address the following FIXME to set gamma or degamma lut
	FIXME: This always uses gamma_lut. Some HW have only
	degamma_lut, in which case we should reset gamma_lut and set
	degamma_lut. See drm_crtc_legacy_gamma_set().

Tested by calling setcmap_atomic in drm_fb_helper_setcmap with out
the condition check.

Signed-off-by: Vamsi Krishna Brahmajosyula <vamsikrishna.brahmajosyula@gmail.com>
---
 drivers/gpu/drm/drm_fb_helper.c | 50 ++++++++++++++++++++-------------
 1 file changed, 31 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 29c53f9f449c..48f053f7ac89 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -871,11 +871,11 @@ static int setcmap_legacy(struct fb_cmap *cmap, struct fb_info *info)
 	return ret;
 }
 
-static struct drm_property_blob *setcmap_new_gamma_lut(struct drm_crtc *crtc,
+static struct drm_property_blob *setcmap_new_blob_lut(struct drm_crtc *crtc,
 						       struct fb_cmap *cmap)
 {
 	struct drm_device *dev = crtc->dev;
-	struct drm_property_blob *gamma_lut;
+	struct drm_property_blob *blob;
 	struct drm_color_lut *lut;
 	int size = crtc->gamma_size;
 	int i;
@@ -883,11 +883,11 @@ static struct drm_property_blob *setcmap_new_gamma_lut(struct drm_crtc *crtc,
 	if (!size || cmap->start + cmap->len > size)
 		return ERR_PTR(-EINVAL);
 
-	gamma_lut = drm_property_create_blob(dev, sizeof(*lut) * size, NULL);
-	if (IS_ERR(gamma_lut))
-		return gamma_lut;
+	blob = drm_property_create_blob(dev, sizeof(*lut) * size, NULL);
+	if (IS_ERR(blob))
+		return blob;
 
-	lut = gamma_lut->data;
+	lut = blob->data;
 	if (cmap->start || cmap->len != size) {
 		u16 *r = crtc->gamma_store;
 		u16 *g = r + crtc->gamma_size;
@@ -911,14 +911,14 @@ static struct drm_property_blob *setcmap_new_gamma_lut(struct drm_crtc *crtc,
 		lut[cmap->start + i].blue = cmap->blue[i];
 	}
 
-	return gamma_lut;
+	return blob;
 }
 
 static int setcmap_atomic(struct fb_cmap *cmap, struct fb_info *info)
 {
 	struct drm_fb_helper *fb_helper = info->par;
 	struct drm_device *dev = fb_helper->dev;
-	struct drm_property_blob *gamma_lut = NULL;
+	struct drm_property_blob *blob = NULL;
 	struct drm_modeset_acquire_ctx ctx;
 	struct drm_crtc_state *crtc_state;
 	struct drm_atomic_state *state;
@@ -926,6 +926,9 @@ static int setcmap_atomic(struct fb_cmap *cmap, struct fb_info *info)
 	struct drm_crtc *crtc;
 	u16 *r, *g, *b;
 	bool replaced;
+	u32 gamma_id = dev->mode_config.gamma_lut_property->base.id;
+	u32 degamma_id = dev->mode_config.degamma_lut_property->base.id;
+	bool use_gamma_lut;
 	int ret = 0;
 
 	drm_modeset_acquire_init(&ctx, 0);
@@ -941,11 +944,21 @@ static int setcmap_atomic(struct fb_cmap *cmap, struct fb_info *info)
 	drm_client_for_each_modeset(modeset, &fb_helper->client) {
 		crtc = modeset->crtc;
 
-		if (!gamma_lut)
-			gamma_lut = setcmap_new_gamma_lut(crtc, cmap);
-		if (IS_ERR(gamma_lut)) {
-			ret = PTR_ERR(gamma_lut);
-			gamma_lut = NULL;
+		if (drm_mode_obj_find_prop_id(&crtc->base, gamma_id))
+			use_gamma_lut = true;
+		else if (drm_mode_obj_find_prop_id(&crtc->base, degamma_id))
+			use_gamma_lut = false;
+		else {
+			ret = -ENODEV;
+			blob = NULL;
+			goto out_state;
+		}
+
+		if (!blob)
+			blob = setcmap_new_blob_lut(crtc, cmap);
+		if (IS_ERR(blob)) {
+			ret = PTR_ERR(blob);
+			blob = NULL;
 			goto out_state;
 		}
 
@@ -956,15 +969,14 @@ static int setcmap_atomic(struct fb_cmap *cmap, struct fb_info *info)
 		}
 
 		/*
-		 * FIXME: This always uses gamma_lut. Some HW have only
-		 * degamma_lut, in which case we should reset gamma_lut and set
-		 * degamma_lut. See drm_crtc_legacy_gamma_set().
+		 * Some HW have only degamma_lut, in which case we should
+		 * reset gamma_lut and set degamma_lut.
 		 */
 		replaced  = drm_property_replace_blob(&crtc_state->degamma_lut,
-						      NULL);
+						      use_gamma_lut ? NULL : blob);
 		replaced |= drm_property_replace_blob(&crtc_state->ctm, NULL);
 		replaced |= drm_property_replace_blob(&crtc_state->gamma_lut,
-						      gamma_lut);
+						      use_gamma_lut ? blob : NULL);
 		crtc_state->color_mgmt_changed |= replaced;
 	}
 
@@ -988,7 +1000,7 @@ static int setcmap_atomic(struct fb_cmap *cmap, struct fb_info *info)
 	if (ret == -EDEADLK)
 		goto backoff;
 
-	drm_property_blob_put(gamma_lut);
+	drm_property_blob_put(blob);
 	drm_atomic_state_put(state);
 out_ctx:
 	drm_modeset_drop_locks(&ctx);

base-commit: 7ec462100ef9142344ddbf86f2c3008b97acddbe
-- 
2.46.2

