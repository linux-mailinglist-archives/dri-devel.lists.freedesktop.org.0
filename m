Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A90275B91B5
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 02:33:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 785BC10E1ED;
	Thu, 15 Sep 2022 00:33:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DFB310E204
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 00:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663201971;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xaw3iUtMLKwH2xCvo5P17z6DGidg5D+TvENUAVXK2ek=;
 b=XEbb+I7w96LMbTyQXBzgZcTblT0fiPuOnkFBlc7gu9Z8uxjsyogd/3WbX91kM+AR/oBQKX
 tfoT+qkgCMik5Pp8dyj5gwbKu2XwoPr1vZxkkEIe78nSr05iBNC09nuNI8OXaHaSo9hH4F
 JTPpRhYx7JdnuQHL429T8cxcDz3qZSY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-507-ypy6MadaNPqCiOO1mqG2BQ-1; Wed, 14 Sep 2022 20:32:50 -0400
X-MC-Unique: ypy6MadaNPqCiOO1mqG2BQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 x5-20020a05640226c500b00451ec193793so7145742edd.16
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Sep 2022 17:32:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Xaw3iUtMLKwH2xCvo5P17z6DGidg5D+TvENUAVXK2ek=;
 b=2uh90J/j7ynpuH5T2io5focUTn5torM1MFocIfVaJj7WbbAjHqsU/nWusmh+6VNtim
 N0HV61fBxI5LilR9ssQeZEKYuH0+kh5AC5ODgh06j/N6w5Z1U4s39JaPXDTiwlFTQd/G
 uV8dOm2/4n4klPeMdq760xYHZcXVcao8Z8sWsGg+fmK9NUaBtWzFNqiazFTVuxXZtBH4
 qFbChK0IowtGsDOlgVtMqrZgT2DO2SvuJPm5RsWpMTwFBZY/U65y1aXAIsiUOoQV2rvy
 Od4jcuOjAS3vzguObdUsTDj3w8vlc3g3e8NSnGqQ5048NqM3cx4JHUnnbLwRaFOY8KiL
 fWzw==
X-Gm-Message-State: ACgBeo2ZyUAIxEHK91h5+PRcl3uwW9ZCjX3laN/A012zZY2DOnT5vGN7
 RF/PUJD3D75rNtKw2xrMe7wuVzx/cBzVFRgf35M1u+PYXMu9P3PlB16+psdexXVJAJmfQq1ii+T
 GJSBQb7DzGLXE5jm4ibFEwZAcNdoc
X-Received: by 2002:a17:907:6293:b0:769:9dfc:10eb with SMTP id
 nd19-20020a170907629300b007699dfc10ebmr28017391ejc.191.1663201969521; 
 Wed, 14 Sep 2022 17:32:49 -0700 (PDT)
X-Google-Smtp-Source: AA6agR76AUHZP7TSM1OI8rVca0sDWA90ENPNmx7n18UfSpYDwhdtincdX9d/3H678m4vxuSNRmwafw==
X-Received: by 2002:a17:907:6293:b0:769:9dfc:10eb with SMTP id
 nd19-20020a170907629300b007699dfc10ebmr28017377ejc.191.1663201969380; 
 Wed, 14 Sep 2022 17:32:49 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 s1-20020a056402014100b0044e8d0682b2sm10672079edu.71.2022.09.14.17.32.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 17:32:48 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org,
 stefan@agner.ch, alison.wang@nxp.com
Subject: [PATCH drm-misc-next 3/8] drm/fsl-dcu: crtc: use
 drmm_crtc_init_with_planes()
Date: Thu, 15 Sep 2022 02:32:26 +0200
Message-Id: <20220915003231.363447-4-dakr@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220915003231.363447-1-dakr@redhat.com>
References: <20220915003231.363447-1-dakr@redhat.com>
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

Use drmm_crtc_init_with_planes() instead of drm_crtc_init_with_planes()
to get rid of the explicit destroy hook in struct drm_plane_funcs.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c
index e05311e2b0e0..0b70624260fc 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c
@@ -159,7 +159,6 @@ static void fsl_dcu_drm_crtc_disable_vblank(struct drm_crtc *crtc)
 static const struct drm_crtc_funcs fsl_dcu_drm_crtc_funcs = {
 	.atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
-	.destroy = drm_crtc_cleanup,
 	.page_flip = drm_atomic_helper_page_flip,
 	.reset = drm_atomic_helper_crtc_reset,
 	.set_config = drm_atomic_helper_set_config,
@@ -180,8 +179,8 @@ int fsl_dcu_drm_crtc_create(struct fsl_dcu_drm_device *fsl_dev)
 	if (!primary)
 		return -ENOMEM;
 
-	ret = drm_crtc_init_with_planes(drm, crtc, primary, NULL,
-					&fsl_dcu_drm_crtc_funcs, NULL);
+	ret = drmm_crtc_init_with_planes(drm, crtc, primary, NULL,
+					 &fsl_dcu_drm_crtc_funcs, NULL);
 	if (ret) {
 		primary->funcs->destroy(primary);
 		return ret;
-- 
2.37.3

