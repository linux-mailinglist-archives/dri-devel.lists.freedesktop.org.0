Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B45574E7D
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 15:00:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C59D510E489;
	Thu, 14 Jul 2022 13:00:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73FA410ED9A
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 13:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657803635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f5+OHAHK2VLcrnL1KSJdq9/Govt0hy/raOewuyTrtrI=;
 b=MvJpAR9iQM//nnTRErmgfQnkm90O0WZEgXU3PJw96PXCuD1VJEkRdnZU68LdH/8Sc1sgjT
 xSm+72iTZ4SV6kSN3Tl7+sMsTSn/oayIjDBTZuyoE99wIWUr3hCk4z3QmyUl1hXnlZUm8d
 RohnxYmj9FRoRt5vgKr7ObTHFNHx3+Y=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-524-RdV1AZkXP-W163Xv-BWaVw-1; Thu, 14 Jul 2022 09:00:34 -0400
X-MC-Unique: RdV1AZkXP-W163Xv-BWaVw-1
Received: by mail-ed1-f72.google.com with SMTP id
 m13-20020a056402430d00b0043ac2f27d83so1478518edc.20
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 06:00:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f5+OHAHK2VLcrnL1KSJdq9/Govt0hy/raOewuyTrtrI=;
 b=qG/tMUF5j2Ts2C4/MJOdH7fIxEd2cHmkDWKBUXE2sfk7cFgdmXzqzFDf6lIUyV+xPZ
 jJtYfcIps7r8QqHKL0Dif2cyDHdOb86PB65FTwMTTkk356mTZeTR88u1qdOIuA8kk2GL
 lOkSepMNYteNxm5nVWPcNOWmYl2X8SaBSciQrODU7LSV3I9H5U94M0K91B9OjtlqBSy1
 AWJ70qa9TEogh4Ojh6IvmMHD6Zo0SpDWBOs4IoRO0KmYbBQ4pVkocdRWGBxh2tbOCUGi
 XH6KQhm44hmjzRTEtHImg7ehONTUiZ1P5CXqWtSGOsbHg/cxSIlszGgkGwz4gTMkPuPX
 4VcA==
X-Gm-Message-State: AJIora9RlZad+o5ZXqckNzuMzhueDHc/tKT3tttVqaC7t/AdC0Cg6VD8
 1XzaORMRmI7g3xWnh/Yj6umbp/FIpa0IdfO6jcuaVajB1DzdL6FWE2phj2dZONMm4MdYP1IxJjO
 PS3XkjjdhGcD3Lhi70rDJwdWiyOnh
X-Received: by 2002:a17:907:1b25:b0:6da:8206:fc56 with SMTP id
 mp37-20020a1709071b2500b006da8206fc56mr8627156ejc.81.1657803633107; 
 Thu, 14 Jul 2022 06:00:33 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vkP+Ryg2/TaLqA61ZrbhfntjLs/5u4V31Ija64DGclgSFfjLRVcA3qAMSo+XslbGnUdCIcjA==
X-Received: by 2002:a17:907:1b25:b0:6da:8206:fc56 with SMTP id
 mp37-20020a1709071b2500b006da8206fc56mr8627134ejc.81.1657803632961; 
 Thu, 14 Jul 2022 06:00:32 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 zk9-20020a17090733c900b0072ecef772acsm694237ejb.2.2022.07.14.06.00.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jul 2022 06:00:31 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@linux.ie,
	daniel@ffwll.ch,
	kraxel@redhat.com
Subject: [PATCH 1/2] drm/virtio: plane: use drm managed resources
Date: Thu, 14 Jul 2022 15:00:27 +0200
Message-Id: <20220714130028.2127858-2-dakr@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220714130028.2127858-1-dakr@redhat.com>
References: <20220714130028.2127858-1-dakr@redhat.com>
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

