Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DAF3D8504
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 03:02:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D27C16EB8E;
	Wed, 28 Jul 2021 01:02:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2A496EBFF;
 Wed, 28 Jul 2021 01:02:43 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 mz5-20020a17090b3785b0290176ecf64922so7463274pjb.3; 
 Tue, 27 Jul 2021 18:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aWHAAuOhk3NUAyAh/B2dsoKf1PQoiLne1nY0lFgXP48=;
 b=DmyFTtUHoyY/OdcTn4Rclp495TjYNYrswlT9rvrZ47hdEV4Ey/HlabaNLrxU0t9tl/
 v43yGVFMAcPGLhC31pwve3Ue6URK8eLr4DiEHpscDklYfpHfUa3EMgaQS6mCCL3HI/KK
 muewMmPMo3/vCzMGHm2KTPiiphfHSb1UaabxepX6gYwid1VWqdA9m5j28VKJpN4x+yrv
 bSMPF4C0krWTdMa1L2OsodFSxzIzWD7MdxxlZ+WgZ6YVw4ju3kOZtHWy1BbB9FpBvcQy
 rxXHrE52698EY5f1ryVGLW67bjMLL7f7QEFVqxjOEFZNp8YppuurJhpNZsfOMr8LmEnA
 UpIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aWHAAuOhk3NUAyAh/B2dsoKf1PQoiLne1nY0lFgXP48=;
 b=NAydOFd8dDvDmCGraXhHQmsDF2Tcm7yX3VWsy1WLgf21COizWjx9AymctddqKsF7GX
 tLnwHY6dSP785XBBZM9tifnO1N7W3gaoTs9bUrwt+Wx1KZ6DgyF+z4mST0MA6nLPWv7O
 80PJinq9otbvDTcFbTZjZPj3JyOZN+s/1eHaA0wKrWgR57MpRIAYnt3EBrvUOTy/bnY9
 qGH/WNb8CkWIgX5fFnkcPr2iE0ql/xwpxIqn7tsZ4dIDoyJ+wCxYG4e3wR6hepDVi0sF
 BJmw7U7toBYD3Zq3r1/KNlZZIim+YbBd7cKhj4x01P99d149viYWG78mls6yQk5grO/R
 RT0A==
X-Gm-Message-State: AOAM531gI5gbigrnoDdk0gB5q3g4CpmMuzlmDNR5DN3sUgrbEisZEr8l
 M+mjihbR449LPoSbK0ngd0/2XGaacUgbsg==
X-Google-Smtp-Source: ABdhPJyvXiFvIYVjvygOXnqPubsO7UO1JJJBiEyYjSdBO23OsM8bU0Mond1RL3SJtOuYc4A2W0MJ9g==
X-Received: by 2002:a17:90a:ea12:: with SMTP id
 w18mr25376118pjy.103.1627434162969; 
 Tue, 27 Jul 2021 18:02:42 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 k8sm4575643pfu.116.2021.07.27.18.02.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 18:02:41 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 04/13] drm: Drop drm_gem_object_put_locked()
Date: Tue, 27 Jul 2021 18:06:09 -0700
Message-Id: <20210728010632.2633470-5-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210728010632.2633470-1-robdclark@gmail.com>
References: <20210728010632.2633470-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, freedreno@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Now that no one is using it, remove it.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Acked-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/drm_gem.c | 22 ----------------------
 include/drm/drm_gem.h     |  2 --
 2 files changed, 24 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index d62fb1a3c916..a34525332bef 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -973,28 +973,6 @@ drm_gem_object_free(struct kref *kref)
 }
 EXPORT_SYMBOL(drm_gem_object_free);
 
-/**
- * drm_gem_object_put_locked - release a GEM buffer object reference
- * @obj: GEM buffer object
- *
- * This releases a reference to @obj. Callers must hold the
- * &drm_device.struct_mutex lock when calling this function, even when the
- * driver doesn't use &drm_device.struct_mutex for anything.
- *
- * For drivers not encumbered with legacy locking use
- * drm_gem_object_put() instead.
- */
-void
-drm_gem_object_put_locked(struct drm_gem_object *obj)
-{
-	if (obj) {
-		WARN_ON(!mutex_is_locked(&obj->dev->struct_mutex));
-
-		kref_put(&obj->refcount, drm_gem_object_free);
-	}
-}
-EXPORT_SYMBOL(drm_gem_object_put_locked);
-
 /**
  * drm_gem_vm_open - vma->ops->open implementation for GEM
  * @vma: VM area structure
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index 240049566592..35e7f44c2a75 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -384,8 +384,6 @@ drm_gem_object_put(struct drm_gem_object *obj)
 		__drm_gem_object_put(obj);
 }
 
-void drm_gem_object_put_locked(struct drm_gem_object *obj);
-
 int drm_gem_handle_create(struct drm_file *file_priv,
 			  struct drm_gem_object *obj,
 			  u32 *handlep);
-- 
2.31.1

