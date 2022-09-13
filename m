Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 708075B7CEA
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 00:16:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C83C10E58F;
	Tue, 13 Sep 2022 22:15:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FF1010E57E
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Sep 2022 22:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663107312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3NFp4VgvnrWlpf0cR1jJD5RUagyd6mZ8BYx1FSeEHWg=;
 b=B7MTpW09fQ+lihj0CI+mDTkUlF8jl5Cn+dXT7We6W3EhSLwzYBgiqp8hh6Hji52PY0I7zR
 MULvqSoJWmGAev3X9dQz9SLzDxkPZlSiI9dBWAuy0O9b6wSSlOS5uLWTXyp+05kH7Wt3wx
 B9w2tNHbfwL0pDAOOIRgm1fUU33UoTg=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-663-sKhxm2OlNMaYYFGw21TJZQ-1; Tue, 13 Sep 2022 18:15:11 -0400
X-MC-Unique: sKhxm2OlNMaYYFGw21TJZQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 m13-20020a056402510d00b004519332f0b1so5833000edd.7
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Sep 2022 15:15:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=3NFp4VgvnrWlpf0cR1jJD5RUagyd6mZ8BYx1FSeEHWg=;
 b=bGeR8CrkygBzkc5amKhMDv7wK5e0Kg0RbIed7HxEj11l0lQNzgo4v650MCtqaI+Zgx
 TRzDZHcI0KK2jep4Xw9xsx0d+FLxQzNny7PCi5fWn03FF1x5Z5l72h9Ud39apYUnlopC
 Z6PNQYV7c9dMiDwIwt9o8ISVZeuHeYw5Ekq5N4LUaxVo9sKQxvfRtV0oPOJ5wyr4GAFe
 eOGGZdxwKqD+lCB2QobArmIjE/AK78htyK/2xU6vZEWa5sZzjKHRO3xXKglJa/pfleGB
 MO/PfBtAtV5J0FoMzt5f0K3Biu16IbBpicbuZ6zG+My3vIHA/HDxu3prMtjpg4Jddgbo
 68ZQ==
X-Gm-Message-State: ACgBeo38/cmMbeHSAKM3b1Yjy+YU7+8YTzozuwhlmglu0lzDkj9ePhRI
 v/7N8Y3XkA9aibKHlsfk2Dlbxn72fZOuhxLOkcWQAyOXYoH1Vq3j+Hwul9EnsnFXW0MbYmCjSsl
 d8wgncCitOz3PXKLOPx08qv4NCUiF
X-Received: by 2002:a05:6402:5008:b0:440:941a:93c3 with SMTP id
 p8-20020a056402500800b00440941a93c3mr11421867eda.47.1663107310594; 
 Tue, 13 Sep 2022 15:15:10 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5KhucR8r5x09VFOVDFq9E+WrNdnLRNQO9ncHrfWTWlUc3ZuYrpuLfrhf8xvJhv8/6n25RPzg==
X-Received: by 2002:a05:6402:5008:b0:440:941a:93c3 with SMTP id
 p8-20020a056402500800b00440941a93c3mr11421856eda.47.1663107310449; 
 Tue, 13 Sep 2022 15:15:10 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 1-20020a170906218100b00730b61d8a5esm6684941eju.61.2022.09.13.15.15.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Sep 2022 15:15:10 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org,
 liviu.dudau@arm.com, brian.starkey@arm.com
Subject: [PATCH drm-misc-next v2 3/6] drm/arm/hdlcd: plane: use drm managed
 resources
Date: Wed, 14 Sep 2022 00:14:53 +0200
Message-Id: <20220913221456.147937-4-dakr@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220913221456.147937-1-dakr@redhat.com>
References: <20220913221456.147937-1-dakr@redhat.com>
MIME-Version: 1.0
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
Cc: Danilo Krummrich <dakr@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use drm managed resource allocation (drmm_universal_plane_alloc()) in
order to get rid of the explicit destroy hook in struct drm_plane_funcs.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/arm/hdlcd_crtc.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/arm/hdlcd_crtc.c b/drivers/gpu/drm/arm/hdlcd_crtc.c
index 4a8959d0b2a6..1de0f7b23766 100644
--- a/drivers/gpu/drm/arm/hdlcd_crtc.c
+++ b/drivers/gpu/drm/arm/hdlcd_crtc.c
@@ -290,7 +290,6 @@ static const struct drm_plane_helper_funcs hdlcd_plane_helper_funcs = {
 static const struct drm_plane_funcs hdlcd_plane_funcs = {
 	.update_plane		= drm_atomic_helper_update_plane,
 	.disable_plane		= drm_atomic_helper_disable_plane,
-	.destroy		= drm_plane_cleanup,
 	.reset			= drm_atomic_helper_plane_reset,
 	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
 	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
@@ -298,24 +297,19 @@ static const struct drm_plane_funcs hdlcd_plane_funcs = {
 
 static struct drm_plane *hdlcd_plane_init(struct drm_device *drm)
 {
-	struct hdlcd_drm_private *hdlcd = drm->dev_private;
+	struct hdlcd_drm_private *hdlcd = drm_to_hdlcd_priv(drm);
 	struct drm_plane *plane = NULL;
 	u32 formats[ARRAY_SIZE(supported_formats)], i;
-	int ret;
-
-	plane = devm_kzalloc(drm->dev, sizeof(*plane), GFP_KERNEL);
-	if (!plane)
-		return ERR_PTR(-ENOMEM);
 
 	for (i = 0; i < ARRAY_SIZE(supported_formats); i++)
 		formats[i] = supported_formats[i].fourcc;
 
-	ret = drm_universal_plane_init(drm, plane, 0xff, &hdlcd_plane_funcs,
-				       formats, ARRAY_SIZE(formats),
-				       NULL,
-				       DRM_PLANE_TYPE_PRIMARY, NULL);
-	if (ret)
-		return ERR_PTR(ret);
+	plane = drmm_universal_plane_alloc(drm, struct drm_plane, dev, 0xff,
+					   &hdlcd_plane_funcs,
+					   formats, ARRAY_SIZE(formats),
+					   NULL, DRM_PLANE_TYPE_PRIMARY, NULL);
+	if (IS_ERR(plane))
+		return plane;
 
 	drm_plane_helper_add(plane, &hdlcd_plane_helper_funcs);
 	hdlcd->plane = plane;
-- 
2.37.3

