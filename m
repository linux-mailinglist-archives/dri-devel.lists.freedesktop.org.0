Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC3E57B807
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 16:02:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 953CC1131B2;
	Wed, 20 Jul 2022 14:02:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A65B711B1A5
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 14:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658325743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f5+OHAHK2VLcrnL1KSJdq9/Govt0hy/raOewuyTrtrI=;
 b=M+BkDi2AkhucMsTCJNOUc6eJSR2ucx8e9N7Z0ZecyPeXe/Fwt23fHfavyF5PjSVaQVg+I1
 4Ncr8+xtC1xRJbvVf8hyYdN5TAF/dQ4rYwF0gDfZ4wNEfATbD6KlCYQRN52v6SvYGEHcMs
 cGJPIGgKg5MVCAEEoBYbTByu90rhms4=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-611-UFqqHj0wM1Og0l3FWvLtyg-1; Wed, 20 Jul 2022 10:02:22 -0400
X-MC-Unique: UFqqHj0wM1Og0l3FWvLtyg-1
Received: by mail-ed1-f71.google.com with SMTP id
 t5-20020a056402524500b0043a923324b2so12304029edd.22
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 07:02:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f5+OHAHK2VLcrnL1KSJdq9/Govt0hy/raOewuyTrtrI=;
 b=OkX7f9shLlCRL4Z3oDSRYsaDT8zZmWdywJOhxchX3naoE1UTmMqX/kyWOkjCDa0SXn
 AaO2IactKwuBZ6PU0dEF0H6ZxQ5zOYSxBYeRqkpvINW8rNc9NefAT2VhND1ExtWGxutc
 2JQWtFJvqdWLSy+MOpBbSLOe5Od1X50/P+tW8YlXjsHINhuKEuBgpv3dgKH+v/yq5Qal
 4OQotycpS+ni7lvM+WoMyf1khundR524LtMaKmhRSyFn/PaGA/mrFXxHiCQD9QbJY6jj
 VpgqqsqrovKzlsi/EMD9CZcqs3Va+JMoG5mmGlQItqcsos/WP89XxJc89fNHGZlNEuou
 qVtg==
X-Gm-Message-State: AJIora/m4Alfd6S5xD2Nme8B7mFNlGmi4twyOWfs0p5DuLUj3pX+7fh1
 ys8GM686dl0waY/PwzBQx5YVLUpKtuOia/Vv1QCDWWZRYJeDe8uMUByXMZPstxSF4PgpEg/40fK
 oDZUf2CXgdSZ7YHnfKXbM0ENgi9gr
X-Received: by 2002:a17:907:2e02:b0:72b:7f58:34a7 with SMTP id
 ig2-20020a1709072e0200b0072b7f5834a7mr35386132ejc.525.1658325740934; 
 Wed, 20 Jul 2022 07:02:20 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vq2IV3yyjMp7raLEq7mPapfKG0of5mKXfvebNU8xf13qtjH+eOAFM2FVlEqO4W2e6ym12V8w==
X-Received: by 2002:a17:907:2e02:b0:72b:7f58:34a7 with SMTP id
 ig2-20020a1709072e0200b0072b7f5834a7mr35386116ejc.525.1658325740745; 
 Wed, 20 Jul 2022 07:02:20 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 f13-20020a170906560d00b006fee98045cdsm8053040ejq.10.2022.07.20.07.02.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 07:02:20 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@linux.ie,
	daniel@ffwll.ch,
	kraxel@redhat.com
Subject: [PATCH RESEND 1/2] drm/virtio: plane: use drm managed resources
Date: Wed, 20 Jul 2022 16:02:13 +0200
Message-Id: <20220720140214.199492-2-dakr@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220720140214.199492-1-dakr@redhat.com>
References: <20220720140214.199492-1-dakr@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dakr@redhat.com
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
order to cleanup/simplify drm plane .destroy callback.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/virtio/virtgpu_plane.c | 30 +++++++-------------------
 1 file changed, 8 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index 6d3cc9e238a4..3008551d6a05 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -67,16 +67,10 @@ uint32_t virtio_gpu_translate_format(uint32_t drm_fourcc)
 	return format;
 }
 
-static void virtio_gpu_plane_destroy(struct drm_plane *plane)
-{
-	drm_plane_cleanup(plane);
-	kfree(plane);
-}
-
 static const struct drm_plane_funcs virtio_gpu_plane_funcs = {
 	.update_plane		= drm_atomic_helper_update_plane,
 	.disable_plane		= drm_atomic_helper_disable_plane,
-	.destroy		= virtio_gpu_plane_destroy,
+	.destroy		= drm_plane_cleanup,
 	.reset			= drm_atomic_helper_plane_reset,
 	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
 	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
@@ -379,11 +373,7 @@ struct drm_plane *virtio_gpu_plane_init(struct virtio_gpu_device *vgdev,
 	const struct drm_plane_helper_funcs *funcs;
 	struct drm_plane *plane;
 	const uint32_t *formats;
-	int ret, nformats;
-
-	plane = kzalloc(sizeof(*plane), GFP_KERNEL);
-	if (!plane)
-		return ERR_PTR(-ENOMEM);
+	int nformats;
 
 	if (type == DRM_PLANE_TYPE_CURSOR) {
 		formats = virtio_gpu_cursor_formats;
@@ -394,17 +384,13 @@ struct drm_plane *virtio_gpu_plane_init(struct virtio_gpu_device *vgdev,
 		nformats = ARRAY_SIZE(virtio_gpu_formats);
 		funcs = &virtio_gpu_primary_helper_funcs;
 	}
-	ret = drm_universal_plane_init(dev, plane, 1 << index,
-				       &virtio_gpu_plane_funcs,
-				       formats, nformats,
-				       NULL, type, NULL);
-	if (ret)
-		goto err_plane_init;
+
+	plane = drmm_universal_plane_alloc(dev, struct drm_plane, dev,
+					   1 << index, &virtio_gpu_plane_funcs,
+					   formats, nformats, NULL, type, NULL);
+	if (IS_ERR(plane))
+		return plane;
 
 	drm_plane_helper_add(plane, funcs);
 	return plane;
-
-err_plane_init:
-	kfree(plane);
-	return ERR_PTR(ret);
 }
-- 
2.36.1

