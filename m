Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D320286029
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 15:30:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 081476E12D;
	Wed,  7 Oct 2020 13:30:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9675A6E12D
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 13:30:43 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id t9so2147622wrq.11
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Oct 2020 06:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GJlIfxKpLNZqZHdxokGLJqMnaEqHp9/LzxV1Yh6KCW0=;
 b=IjsUW/Xl9Qo8GL1q2uw4aeZSY/sA1WsCritibF5rkLGXsG4NfIupNM9pnI1irS3W1E
 NbWQ0KDsojRA/K+CGkIoBTrVOT/Y/9D2HIu8ZgRiBIGp8PnhOlHyhvCe/JaaohNASOXu
 Yx9htbjdnYi1MsBZmBhIFfzxhebiJlTgVekfA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GJlIfxKpLNZqZHdxokGLJqMnaEqHp9/LzxV1Yh6KCW0=;
 b=uXPoWxEWRaPeU9MRb5ckfNGiJlL49rwrYDjXeylPUwov0i7vVTQ1JCrQuFtUnPE2nf
 3gfId5XBdy5G+dFGKazG235O7+FyyOMGa35N3PBUV1VMg1tT18VeJtZFZhw8uBpdCP8r
 HGNAIsFr8JnyYdIq8ncqUzoSD6U+UU/8QsScxmg7auE5vX/UzNZri2IQ2T+MM+WAC8XV
 5JWFmSKfhfk8et3ZoRuhcQLMXCwJLE3L9tRzF60uQ8SROQ5ve1mopYPl/+Det++FdWFN
 FoqgHOzCX2WCoW6jV+rFoKXov+0uLXYCt7Y0hQqCOBoVs45Gob3LyMmJsDboR1lDSuTi
 imhA==
X-Gm-Message-State: AOAM532DMeK7lGDZytJGYrf3dw9AjMtAnh0nfe3cfVeypdaFjbZzuW7O
 N7gBCNmzXREtYzX9770XD+aPvJydmaeyupMM
X-Google-Smtp-Source: ABdhPJy7en8xKm70WxhZutmO9bjDeXCAJR+AcDfL4Tw/ThwOIxOvoSo+aOwUK9bgUGWNTJoq4AsL0Q==
X-Received: by 2002:adf:94e6:: with SMTP id 93mr3452672wrr.190.1602077441970; 
 Wed, 07 Oct 2020 06:30:41 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id x6sm2827011wmb.17.2020.10.07.06.30.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2020 06:30:41 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/fb-helper: Add locking to sysrq handling
Date: Wed,  7 Oct 2020 15:30:35 +0200
Message-Id: <20201007133036.1541639-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We didn't take the kernel_fb_helper_lock mutex, which protects that
code. While at it, simplify the code
- inline the function (originally shared with kgdb I think)
- drop the error tracking and all the complications
- drop the pointless early out, it served nothing

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/drm_fb_helper.c | 26 +++++---------------------
 1 file changed, 5 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 8697554ccd41..c2f72bb6afb1 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -281,18 +281,12 @@ int drm_fb_helper_restore_fbdev_mode_unlocked(struct drm_fb_helper *fb_helper)
 EXPORT_SYMBOL(drm_fb_helper_restore_fbdev_mode_unlocked);
 
 #ifdef CONFIG_MAGIC_SYSRQ
-/*
- * restore fbcon display for all kms driver's using this helper, used for sysrq
- * and panic handling.
- */
-static bool drm_fb_helper_force_kernel_mode(void)
+/* emergency restore, don't bother with error reporting */
+static void drm_fb_helper_restore_work_fn(struct work_struct *ignored)
 {
-	bool ret, error = false;
 	struct drm_fb_helper *helper;
 
-	if (list_empty(&kernel_fb_helper_list))
-		return false;
-
+	mutex_lock(&kernel_fb_helper_lock);
 	list_for_each_entry(helper, &kernel_fb_helper_list, kernel_fb_list) {
 		struct drm_device *dev = helper->dev;
 
@@ -300,22 +294,12 @@ static bool drm_fb_helper_force_kernel_mode(void)
 			continue;
 
 		mutex_lock(&helper->lock);
-		ret = drm_client_modeset_commit_locked(&helper->client);
-		if (ret)
-			error = true;
+		drm_client_modeset_commit_locked(&helper->client);
 		mutex_unlock(&helper->lock);
 	}
-	return error;
+	mutex_unlock(&kernel_fb_helper_lock);
 }
 
-static void drm_fb_helper_restore_work_fn(struct work_struct *ignored)
-{
-	bool ret;
-
-	ret = drm_fb_helper_force_kernel_mode();
-	if (ret == true)
-		DRM_ERROR("Failed to restore crtc configuration\n");
-}
 static DECLARE_WORK(drm_fb_helper_restore_work, drm_fb_helper_restore_work_fn);
 
 static void drm_fb_helper_sysrq(int dummy1)
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
