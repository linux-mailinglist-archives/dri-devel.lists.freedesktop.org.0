Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FB532880B
	for <lists+dri-devel@lfdr.de>; Mon,  1 Mar 2021 18:36:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 791FA6E873;
	Mon,  1 Mar 2021 17:36:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2DF3898C8
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Mar 2021 16:59:15 +0000 (UTC)
Received: by mail-qt1-x82b.google.com with SMTP id b3so12478205qtj.10
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Mar 2021 08:59:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x0j36itVEu9pJWcfNSA2nYtI2hPWzcnt/Y/nnKwvNoo=;
 b=lblEvkqzL7BhGIa+3SFbXgcsKO/D0zAGdCF3OaBf13QjC1B173F17FzKaKEcNAKOyM
 9iasy6KX7wcpLc+BDQh4iRrwUy/keOKAwSgunyDmsY0Bwzca6ljCsmLHLjcN+Z5c6ISK
 En9MJDbxuZECNVMPrXVXgm5xwgABPl9dhs/24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x0j36itVEu9pJWcfNSA2nYtI2hPWzcnt/Y/nnKwvNoo=;
 b=fI0IZf1kA6PhZBaeETvLyigu3KTdtHgnaQ17UG0aYZcNmL8tbVPg2iPZCInVrHWEwq
 qcQdVk/sbZfa0mnuj7Zu2nInK0+ognjOWBUi6cU3gHJKcOyn1afR+XNZqdYU5FPeaqiI
 +VfIFjDMX7UVzwgnX/Yyi+Wc2j5z93FIDyyJguYG2FZEnkTJOuHOoxyuVI1BG3slB13+
 lTmls9sHegCBewanqoJnydKdYJoJ2sidJu5xCuvuXBypf1Sw7Le06eXNaa/A7Bnc5Dpq
 66Z6CC6EfY7WpbLI9cdywZMhqOuGrvVySt4btTzAK3LPrxXh9Dxjzsn8TGsdxAdK8qd0
 Nukg==
X-Gm-Message-State: AOAM531gdlQpAP+rxJkRBEYcaGZVTvNUKACX7wIiyPiCyMDsq+F5FsuC
 mkJNNfqAxhJdXOu0n/TacAiL9w==
X-Google-Smtp-Source: ABdhPJx/Ze9O5+4BJy1M/rfHx1DtCuRRUqv69pUA63rIygQxf1lxp3WrO84RsUa4y38iT8+GyBHNOg==
X-Received: by 2002:ac8:4e8f:: with SMTP id 15mr6170863qtp.317.1614617954768; 
 Mon, 01 Mar 2021 08:59:14 -0800 (PST)
Received: from markyacoub.nyc.corp.google.com
 ([2620:0:1003:513:91e3:3df6:3ae:d219])
 by smtp.gmail.com with ESMTPSA id c22sm4882733qtn.74.2021.03.01.08.59.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Mar 2021 08:59:14 -0800 (PST)
From: Mark Yacoub <markyacoub@chromium.org>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu: Verify bo size can fit framebuffer size
Date: Mon,  1 Mar 2021 11:59:08 -0500
Message-Id: <20210301165908.3846489-1-markyacoub@chromium.org>
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 01 Mar 2021 17:36:34 +0000
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
Cc: alexander.deucher@amd.com, Mark Yacoub <markyacoub@chromium.org>,
 seanpaul@chromium.org, Mark Yacoub <markyacoub@google.com>
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
