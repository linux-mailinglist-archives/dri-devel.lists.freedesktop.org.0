Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B85326888
	for <lists+dri-devel@lfdr.de>; Fri, 26 Feb 2021 21:34:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2EDB6E117;
	Fri, 26 Feb 2021 20:34:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf49.google.com (mail-qv1-xf49.google.com
 [IPv6:2607:f8b0:4864:20::f49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2D956E117
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Feb 2021 20:34:14 +0000 (UTC)
Received: by mail-qv1-xf49.google.com with SMTP id k4so7730511qvf.8
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Feb 2021 12:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=cbkRU90b5SgpivSa1jA0/1Ze/TRby2Uo+UMPBFBsn+Q=;
 b=vO5YUurN5t/pIQPQwysm7PJlRJXnOZbrg8yNFLKTGN+EsuK3fQSkIJAqO2mzsxzXa3
 yVKOfLylFcUDhL8H7Pr+HTBwTGLJS1xcTvn5EgD3/MTN/nOXpbJoO8RTS1z9JatIluHa
 IT79VtUsV8sr77JOvyRiewpDICRi8rxFDDIttWL3e697D5W9nz0MYQfzSgh8s7VCgL+X
 KnDGRmrnvAVthnQ6yXurxBOVwwJmSBTqjIUHXV+aZRPkrBINbmAuTfAnDrqHwoRkjRpm
 OwGk1Z03VZkXOwG0j5M8MuFLFVh0on/EAL6ff76O2s9E6KDll5FWw+0UKKpf35HnOvjc
 63tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=cbkRU90b5SgpivSa1jA0/1Ze/TRby2Uo+UMPBFBsn+Q=;
 b=O1Mv6z/+H0UXbGmfV0j/rHsMFMESz613xOjrfTnZtsfG4tYACubm2HnfMWL0IRVDm/
 J2veE7QSs+BYIiBF+2e+lRmkHZGsRlNDsSyHf6B47RRFIhoo7Wox8ZWJy5/dvsz8Pj4j
 VHiNTj+nYeydCVBeq+ywnHyhxBcaaXMrPY+LLa5XuXjgBK4fihq8JW8YIWP1jWbFpw8h
 IwIlBdqOb+xWwLBjVKnLXOf2QVpAJ0PROvgn1YO5yTjjfP7EcVtpCAvlzEXvxGTJ2azu
 GaB3E22X9pXCOQ3d/oCQDxcF70R8EvNzrs3k2BjvB7Ar4DZvUigG4+ec+Cxe0sSPVQL5
 MwCA==
X-Gm-Message-State: AOAM532RVPZtWj6ji2yKwRk49mrhBIEJcPRIw7X2Gxts9tnI25ZRzS+3
 hpcAlqpKp9omS2xp1o8JFbSyq7MlTxtMYcb3
X-Google-Smtp-Source: ABdhPJynoO04pVb4k8WipKPiNtd9o43Go8Sw0kz7Tkzlhl6nN+4hgMo7yhAwZdLA0cMmCsBs1XmwcERzXSbYB/K9
X-Received: from markyacoub.nyc.corp.google.com
 ([2620:0:1003:513:24ad:644f:832c:b762])
 (user=markyacoub job=sendgmr) by 2002:a0c:f946:: with SMTP id
 i6mr4248802qvo.40.1614371653926; Fri, 26 Feb 2021 12:34:13 -0800 (PST)
Date: Fri, 26 Feb 2021 15:34:00 -0500
Message-Id: <20210226203400.3424408-1-markyacoub@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
Subject: [PATCH] [PATCH] drm/amdgpu: Verify bo size can fit framebuffer size
From: Mark Yacoub <markyacoub@google.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
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
Cc: alexander.deucher@amd.com, seanpaul@chromium.org,
 Mark Yacoub <markyacoub@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When creating a new framebuffer, verify that the bo size associated with
it can handle the fb size.
drm_gem_fb_init_with_funcs implements this check by calculating the
minimum expected size of each plane. amdgpu now uses this function to
initialize its fb as it performs the required checks.

The bug was caught using igt-gpu-tools test: kms_addfb_basic.too-high
and kms_addfb_basic.bo-too-small

Suggested-by: Sean Paul <seanpaul@chromium.org>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Mark Yacoub <markyacoub@google.com>
Change-Id: I9de3e21657510781b97f06afdc5db06d79f6f0f4
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c | 8 +++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c      | 3 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h    | 1 +
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index 48cb33e5b3826..61684d543b8ef 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -872,13 +872,14 @@ static int amdgpu_display_get_fb_info(const struct amdgpu_framebuffer *amdgpu_fb
 
 int amdgpu_display_framebuffer_init(struct drm_device *dev,
 				    struct amdgpu_framebuffer *rfb,
+				    struct drm_file *file,
 				    const struct drm_mode_fb_cmd2 *mode_cmd,
 				    struct drm_gem_object *obj)
 {
 	int ret, i;
 	rfb->base.obj[0] = obj;
-	drm_helper_mode_fill_fb_struct(dev, &rfb->base, mode_cmd);
-	ret = drm_framebuffer_init(dev, &rfb->base, &amdgpu_fb_funcs);
+	ret = drm_gem_fb_init_with_funcs(dev, &rfb->base, file, mode_cmd,
+					 &amdgpu_fb_funcs);
 	if (ret)
 		goto fail;
 
@@ -953,7 +954,8 @@ amdgpu_display_user_framebuffer_create(struct drm_device *dev,
 		return ERR_PTR(-ENOMEM);
 	}
 
-	ret = amdgpu_display_framebuffer_init(dev, amdgpu_fb, mode_cmd, obj);
+	ret = amdgpu_display_framebuffer_init(dev, amdgpu_fb, file_priv,
+					      mode_cmd, obj);
 	if (ret) {
 		kfree(amdgpu_fb);
 		drm_gem_object_put(obj);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c
index 0bf7d36c6686d..2b9c9a621c437 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c
@@ -233,7 +233,8 @@ static int amdgpufb_create(struct drm_fb_helper *helper,
 	}
 
 	ret = amdgpu_display_framebuffer_init(adev_to_drm(adev), &rfbdev->rfb,
-					      &mode_cmd, gobj);
+					      helper->client.file, &mode_cmd,
+					      gobj);
 	if (ret) {
 		DRM_ERROR("failed to initialize framebuffer %d\n", ret);
 		goto out;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
index 319cb19e1b99f..997b93674955e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
@@ -604,6 +604,7 @@ int amdgpu_display_get_crtc_scanoutpos(struct drm_device *dev,
 
 int amdgpu_display_framebuffer_init(struct drm_device *dev,
 				    struct amdgpu_framebuffer *rfb,
+				    struct drm_file *file,
 				    const struct drm_mode_fb_cmd2 *mode_cmd,
 				    struct drm_gem_object *obj);
 
-- 
2.30.1.766.gb4fecdf3b7-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
