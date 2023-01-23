Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA2767805B
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 16:48:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BAEE10E4DC;
	Mon, 23 Jan 2023 15:48:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A68810E4DC
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 15:48:33 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id 88so456610pjo.3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 07:48:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=79zz21d93rosXhCHk+UtsCaN0zcr+E49ORMLW7ABZQw=;
 b=IVYnhU2i0SWRMhhUGw/JcLPqKoaX9v5kgL+O6i0Anxid8V31nd+JNdqf7WGaWve+Ov
 6co3BfBCQtoxiXViNgIe17blkI9gSzEfb3aZQqgjBPfAO+xuXFTzkgMwuVPKPQufRkFE
 Enoq+oODNuk1UbSXSA4OBJU+xnXLVb0Kn7Csf0qWqLnuTteQ9NcN8sCJfGLTetwO0NsX
 ktJVjgNXBd6G4H7x+cyA+RHW1YJazqMU7gqmm4S+Jz/J2sRmMIf9IyqkTPu4E8tkXBWV
 LSICp/e0CsZPkhbpzqzLxw+q5cRiBxISSrefqB3Spesm6byOunKkgqTQvVbDGsIDtOdt
 6CAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=79zz21d93rosXhCHk+UtsCaN0zcr+E49ORMLW7ABZQw=;
 b=gCyZSjzsRjF7S5yVELeYuIHQfkONquCEQoHQ9zVGldIVi4Fr6kK+DzPHhcaJY94XVQ
 tp0X1VV5EHgot7angMJZUvgcJudK0V2RSAOrGz7P4pgmAy1jBFidmA0F4ggfJaNNPpLR
 h5RLXgrswy8n9ODyYflrYzQHo8feQjzXuyQ7nLIcwoF59TEhv8Owrmd0y3LC+iv0ZbGg
 xQrVSC35rLe8pQZ3SpwIRyO/bJwP1Nhn8y/vsOc+AVXiQ0Jmys+VcyEvkQxMzHwoiLYj
 p4DxYjPx2V3WjogGpVbkY7kv7kg3a1kMTQ2IVhoADrg77ZnnJeqoyTgYx0jDBLT0SVyr
 2n1Q==
X-Gm-Message-State: AO0yUKXnjRBXLqPRwwNQHhtu6H948hGzXtGhoqWjUc1itqHkRFR3QnNk
 EAgx2Mbiu55cSTikDTfzJfDnDCwnoo0=
X-Google-Smtp-Source: AK7set9YrXeJZMX+IyKBeKOJFuPWRH6Qpv+eq6XUyBQWUuT/GqssZsH/dtCsFGcfxh8s8dy8ti5U0A==
X-Received: by 2002:a17:902:da81:b0:196:e77:f07b with SMTP id
 j1-20020a170902da8100b001960e77f07bmr242552plx.39.1674488912600; 
 Mon, 23 Jan 2023 07:48:32 -0800 (PST)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 t6-20020a170902bc4600b00196065e8d78sm1976697plz.50.2023.01.23.07.48.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 07:48:32 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3] drm/shmem: Cleanup drm_gem_shmem_create_with_handle()
Date: Mon, 23 Jan 2023 07:48:31 -0800
Message-Id: <20230123154831.3191821-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 open list <linux-kernel@vger.kernel.org>, Steven Price <steven.price@arm.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
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
 drivers/gpu/drm/drm_gem_shmem_helper.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index f21f47737817..42c496c5f92c 100644
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
@@ -425,7 +425,7 @@ drm_gem_shmem_create_with_handle(struct drm_file *file_priv,
 
 	shmem = drm_gem_shmem_create(dev, size);
 	if (IS_ERR(shmem))
-		return shmem;
+		return PTR_ERR(shmem);
 
 	/*
 	 * Allocate an id of idr table where the obj is registered
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
@@ -520,7 +518,6 @@ int drm_gem_shmem_dumb_create(struct drm_file *file, struct drm_device *dev,
 			      struct drm_mode_create_dumb *args)
 {
 	u32 min_pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
-	struct drm_gem_shmem_object *shmem;
 
 	if (!args->pitch || !args->size) {
 		args->pitch = min_pitch;
@@ -533,9 +530,7 @@ int drm_gem_shmem_dumb_create(struct drm_file *file, struct drm_device *dev,
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

