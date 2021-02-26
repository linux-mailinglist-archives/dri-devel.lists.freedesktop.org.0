Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3078F326884
	for <lists+dri-devel@lfdr.de>; Fri, 26 Feb 2021 21:29:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22F346E091;
	Fri, 26 Feb 2021 20:29:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com
 [IPv6:2607:f8b0:4864:20::74a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 312F76E3D0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Feb 2021 19:48:27 +0000 (UTC)
Received: by mail-qk1-x74a.google.com with SMTP id x21so8308028qkm.19
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Feb 2021 11:48:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:cc;
 bh=TnNtS4KbVDrVJO3kPWuj8JRX/g6SzfnQp8/5tdqnzIk=;
 b=wEhB2yQiHllYIIW7+GztsuhLxSvJs4RXAgDaE6kAAMN9/jgGbiyv1XCNsxaWP9TAek
 VsdTRaoCccnGUS8Zj8xY2lzj9KwNu7luFTHT5shAqmdz3W9W9L27ViD8inNDMVlSuvo1
 HHgQWCYVc0hxtdByNqzw5srgMd0W5yRX65760+HwFwZFpP5ZyjUAvhJvFp74+AhQuBEm
 vdOyFeNBOPkyf1gufErHhGuF5xgEXE0mIea595hzcfboqzQQhEPb0b0tsyZ6F+e0DT7O
 RK2YUKtKHhsmOQsQlOdfSLAD5Dsp48PjD3BgqwaTFOwU6WePF1clAokkjNAoDhgs8vVS
 E1mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :cc; bh=TnNtS4KbVDrVJO3kPWuj8JRX/g6SzfnQp8/5tdqnzIk=;
 b=H13KIsygfUTdukJ5OrrgRYG2d7FUQ+TlLHd/luD6T9u0Ds/llIruzE+0KIoT0KGp+W
 Vkk0KtQtl8ohthWZ9jDCIh9YUOoW1wne5RpwpB0FASfS772rFup4pSgECDkQDo+FJtUa
 mnoCf8DTS4Ta8xrpRP/QfhgYGlxpGQLlOGLdpmXvMLBE7XLg3b3U9jHf0MnL30c9aaN+
 SgMcvC+GrZpQhBZVlIiM5bvOkA7xNHbZcdmMv3OJd78EpfhcxL8jvZDXFkE/wwvZES56
 NuTFr1PqgGEF77jovJ368CUEC86y8B9/cDjjob3eaPw8wpOyK5qKYtrkh7io+31rQWlT
 k9Ew==
X-Gm-Message-State: AOAM532xMhKtSyjRy8S3fmJJJdYArcxnHHJbOxEl3sHZ0tW4Uy29lfwB
 xvG+3cfaDNO00YCdo7h9UgR8DciXNJrewXiz
X-Google-Smtp-Source: ABdhPJxsnS5602xJJsh3HowqU2B/YiLGHyRP1FTTiior7VcjohO9mFIARa8RDSofk/e2vVrAYJXItW/4QxB/pNjE
X-Received: from markyacoub.nyc.corp.google.com
 ([2620:0:1003:513:24ad:644f:832c:b762])
 (user=markyacoub job=sendgmr) by 2002:a0c:b8a3:: with SMTP id
 y35mr4101268qvf.23.1614368906268; Fri, 26 Feb 2021 11:48:26 -0800 (PST)
Date: Fri, 26 Feb 2021 14:48:10 -0500
Message-Id: <20210226194810.3419873-1-markyacoub@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
Subject: [PATCH] drm/amdgpu: Verify bo size can fit framebuffer size
From: Mark Yacoub <markyacoub@google.com>
X-Mailman-Approved-At: Fri, 26 Feb 2021 20:29:30 +0000
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Sean Paul <seanpaul@chromium.org>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
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
