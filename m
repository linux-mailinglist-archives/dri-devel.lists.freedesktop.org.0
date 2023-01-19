Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F376D6740A3
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 19:13:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE90810E19C;
	Thu, 19 Jan 2023 18:13:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 199BF10E19C
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 18:13:20 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 u1-20020a17090a450100b0022936a63a21so6631565pjg.4
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 10:13:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gzlco0z7kyARFne6aPjn97rwGjIZC5wmHdoy935q5v8=;
 b=Em6XPAjN56DTVWK7ltE7kWrUpgn4OjY5KNM0m0CZekF/Erh5W6I0BYol/sRWj7Iv8m
 2y4DE4uEOTBLFrbViTWJwhiO698EWk1mFt4PHLKjI8nwgqj8QNmoz7AcfTIZuX2esnPc
 I59H7o/kCo0x2wW6+2EGEiGcxYk4sFsUcqrWlLYrsW+fYwBIBr7tCIojm1QCpQ1xeIRq
 DjYCudyK0HK4cdjR62ipxU1DiPs443dl3466m1BdtZ+9ah+h7R//mnLkKyihBgW9axoK
 DD75W548dMoOGRN18vbHqB8ZZqDVWsJ2VP9ttM+GhsThtHAhtnfypWOiTVjmSzx4s58s
 w9tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gzlco0z7kyARFne6aPjn97rwGjIZC5wmHdoy935q5v8=;
 b=YMfDq+J/fIslr/WIzzKfaCdxOC+h1cwrJG+LaJZRKNCnLSQp83pyR8KtHgwASBlBVn
 mpd4C9hO+NjToJtir3kj5M79cq+tdXX40bw90aBl3dG0CtfdK2AHo+/ZHD+0kfjdtnSb
 R4DFyawN1QlntkWxZrQZaz4xitgnADxQENhGUT5nq/NAjRuKYWzMq+45Sn2+L/AZw3O9
 WXlTBkbNfg83OzZmzus0A7LyQqAGY6B6sDUH7doUDaN9ZgRxUjw66aYHmhHBMuz6WN1O
 882g8l9gel5xI4yE75RLr7hpFxwu2ifiLbytZ0An6HIpp2fnP71hCo9yl63a4HiI6AMz
 5FYQ==
X-Gm-Message-State: AFqh2kocOFBnGzpKShCbtFBbIOVrybPKH8HxkB0nIo2KomnJ4sMyQcY8
 BFPM59pDch0PGzPbhqs/+mGbQoOLXA0=
X-Google-Smtp-Source: AMrXdXug0azKk/0n6wkJT+UoB4iTHWTRt5ztblvHe2juNwv12N7kECjxNTh6EWL7HBHOs6e56kcfQA==
X-Received: by 2002:a17:903:11c7:b0:194:a531:4b39 with SMTP id
 q7-20020a17090311c700b00194a5314b39mr15913608plh.67.1674151999425; 
 Thu, 19 Jan 2023 10:13:19 -0800 (PST)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 y22-20020a17090264d600b001708c4ebbaesm12103841pli.309.2023.01.19.10.13.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 10:13:19 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/shmem: Cleanup drm_gem_shmem_create_with_handle()
Date: Thu, 19 Jan 2023 10:13:25 -0800
Message-Id: <20230119181325.2834875-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
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
Cc: Rob Clark <robdclark@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Once we create the handle, the handle owns the reference.  Currently
nothing was doing anything with the shmem ptr after the handle was
created, but let's change drm_gem_shmem_create_with_handle() to not
return the pointer, so-as to not encourage problematic use of this
function in the future.  As a bonus, it makes the code a bit cleaner.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index f21f47737817..19406f4907df 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -415,7 +415,7 @@ void drm_gem_shmem_vunmap(struct drm_gem_shmem_object *shmem,
 }
 EXPORT_SYMBOL(drm_gem_shmem_vunmap);
 
-static struct drm_gem_shmem_object *
+static int
 drm_gem_shmem_create_with_handle(struct drm_file *file_priv,
 				 struct drm_device *dev, size_t size,
 				 uint32_t *handle)
@@ -434,10 +434,8 @@ drm_gem_shmem_create_with_handle(struct drm_file *file_priv,
 	ret = drm_gem_handle_create(file_priv, &shmem->base, handle);
 	/* drop reference from allocate - handle holds it now. */
 	drm_gem_object_put(&shmem->base);
-	if (ret)
-		return ERR_PTR(ret);
 
-	return shmem;
+	return ret;
 }
 
 /* Update madvise status, returns true if not purged, else
@@ -533,9 +531,7 @@ int drm_gem_shmem_dumb_create(struct drm_file *file, struct drm_device *dev,
 			args->size = PAGE_ALIGN(args->pitch * args->height);
 	}
 
-	shmem = drm_gem_shmem_create_with_handle(file, dev, args->size, &args->handle);
-
-	return PTR_ERR_OR_ZERO(shmem);
+	return drm_gem_shmem_create_with_handle(file, dev, args->size, &args->handle);
 }
 EXPORT_SYMBOL_GPL(drm_gem_shmem_dumb_create);
 
-- 
2.38.1

