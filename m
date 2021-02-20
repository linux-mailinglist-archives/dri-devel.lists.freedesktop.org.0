Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F643205BF
	for <lists+dri-devel@lfdr.de>; Sat, 20 Feb 2021 15:39:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C2D46E1BA;
	Sat, 20 Feb 2021 14:39:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7405A6E1B2
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Feb 2021 14:38:59 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id a207so10394098wmd.1
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Feb 2021 06:38:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=1mcGwYv2cie6U6D4CsYyEr2Obo5HL2xrArgwzJIG/Xg=;
 b=p73Bc8CbzwzlgKFh0JGIgk/2vb5ZCddiz5vHQNSpTdJO0PITyvQ8Js9drxFZaBSh+X
 mcGI9OKLnTFE9JTEA032L/W734d+A7D4d/QWeKRe9nMZiTAyJBhAQRqiLA6UZS/lHcAH
 IXGNC6MQbmMZILpNOj4nGOjP+T//40fQiJi9B5Q2q1U6o6OUbvnJj4Xuh1R1u81ivQsS
 MTCWU8G0X8/9tUvxSCpmvqC8JW55y578JgdyZaKIV5LNJ7unXbRrmP0C2wc3teOYxWY3
 RDn5ZINMY+Y/YykWa25AZCR/f93kEj/b5RvuAymA12zj69HCa+aVucs+i2VKAbDjNKSL
 6TZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=1mcGwYv2cie6U6D4CsYyEr2Obo5HL2xrArgwzJIG/Xg=;
 b=SuFpk44CRNZqR7RscbsbE85ixWuVO4zganZ036scDC684TBonXJ7OhilHvyqMqoeXj
 5pRIKxjVzVLXKPf+S9mS8RFz91SrHTOhzxDUzBsxIe1HTERDSjmygqriU38uC6C8X2uU
 QHysbacL01HYivp/BxAsrzDAZyuzo8xwDuFNo1J9ttF7sMQNhkKHT0iQX6yDmzkcMks0
 aQiizk8u2NkClVoYRaafRVGArbZZZwojsVvd/npTHtQGlFRzP03Wb4ZL3ZdZli/xGqNq
 KwISv/ik8/VGyQlTM3Y3bohdAwaVQiJg8IrAtVW43WzebVf5gcFKsGW4h9ZyYmd9gJQ0
 m8Fw==
X-Gm-Message-State: AOAM533E5JiyPxCRZCTGZoXxU5jyduVoh5pqctf9Xx7rJT6C1PDcfAA/
 KeG5RZK1CRwEZzE7khdpfT4=
X-Google-Smtp-Source: ABdhPJzvUi9viU+WAjXHuqvXoPmZUPctC8nfV00nfzUREodCJIXa4/aOvsykU5jzJc2R9e3P42c5Hg==
X-Received: by 2002:a1c:b0c2:: with SMTP id z185mr12476379wme.67.1613831938209; 
 Sat, 20 Feb 2021 06:38:58 -0800 (PST)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
 by smtp.gmail.com with ESMTPSA id z13sm7120108wmi.45.2021.02.20.06.38.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Feb 2021 06:38:57 -0800 (PST)
Date: Sat, 20 Feb 2021 11:38:50 -0300
From: Melissa Wen <melissa.srw@gmail.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Simon Ser <contact@emersion.fr>,
 Sumera Priyadarsini <sylphrenadin@gmail.com>,
 David Airlie <airlied@linux.ie>
Subject: [RFC PATCH 1/3] drm/vkms: decouple cursor plane setup from crtc_init
Message-ID: <20210220143850.k22n4r4uel5zhxr2@smtp.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Initialize CRTC only with primary plane (without cursor) as a preparation
to init overlay plane before cursor plane and keep cursor on the top.

Signed-off-by: Melissa Wen <melissa.srw@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_crtc.c   |  4 ++--
 drivers/gpu/drm/vkms/vkms_drv.h    |  2 +-
 drivers/gpu/drm/vkms/vkms_output.c | 14 +++++++++-----
 3 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index 0443b7deeaef..2d4cd7736933 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -270,12 +270,12 @@ static const struct drm_crtc_helper_funcs vkms_crtc_helper_funcs = {
 };
 
 int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
-		   struct drm_plane *primary, struct drm_plane *cursor)
+		   struct drm_plane *primary)
 {
 	struct vkms_output *vkms_out = drm_crtc_to_vkms_output(crtc);
 	int ret;
 
-	ret = drm_crtc_init_with_planes(dev, crtc, primary, cursor,
+	ret = drm_crtc_init_with_planes(dev, crtc, primary, NULL,
 					&vkms_crtc_funcs, NULL);
 	if (ret) {
 		DRM_ERROR("Failed to init CRTC\n");
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 35540c7c4416..9ad5ad8b7737 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -110,7 +110,7 @@ struct vkms_device {
 
 /* CRTC */
 int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
-		   struct drm_plane *primary, struct drm_plane *cursor);
+		   struct drm_plane *primary);
 
 int vkms_output_init(struct vkms_device *vkmsdev, int index);
 
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index f5f6f15c362c..05d3bb45e6c1 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -47,6 +47,10 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
 	if (IS_ERR(primary))
 		return PTR_ERR(primary);
 
+	ret = vkms_crtc_init(dev, crtc, primary);
+	if (ret)
+		goto err_crtc;
+
 	if (vkmsdev->config->cursor) {
 		cursor = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_CURSOR, index);
 		if (IS_ERR(cursor)) {
@@ -55,9 +59,9 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
 		}
 	}
 
-	ret = vkms_crtc_init(dev, crtc, primary, cursor);
-	if (ret)
-		goto err_crtc;
+	crtc->cursor = cursor;
+	if (cursor && !cursor->possible_crtcs)
+		cursor->possible_crtcs = drm_crtc_mask(crtc);
 
 	ret = drm_connector_init(dev, connector, &vkms_connector_funcs,
 				 DRM_MODE_CONNECTOR_VIRTUAL);
@@ -100,11 +104,11 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
 err_connector:
 	drm_crtc_cleanup(crtc);
 
-err_crtc:
+err_cursor:
 	if (vkmsdev->config->cursor)
 		drm_plane_cleanup(cursor);
 
-err_cursor:
+err_crtc:
 	drm_plane_cleanup(primary);
 
 	return ret;
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
