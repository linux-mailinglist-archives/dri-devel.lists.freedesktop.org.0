Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD75674654
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 23:44:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F327E10E284;
	Thu, 19 Jan 2023 22:44:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80DBC10E285
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 22:44:47 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 z1-20020a17090a66c100b00226f05b9595so3257544pjl.0
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 14:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vkhEkO/AZn+iGeeCv4z3XDvZENqvSyRmzPX1UAsRe3E=;
 b=Q1xuRnvO5zB4dNHXmx9mPeSe2yQ9xR+RKfk8j4EtFNa17ivRYMfiW8h3oYZENvWGt4
 XuS9dLUpHfW00h90VvgPG9BPMh439dJjAifwI822JeuZ2yJe95JOtnx/bekBzXKKD8T1
 3qHSfKuub2eyqbsfzu+V/aAHdQlQJ14Q5QVuyBVRbkJm+pKOjswz4HtJeYh7tC2MloSC
 jiC9nweU9Ak1wWdtNB35TAFDKw6Kod+u2fx/qJGmlAqQVtMreAcuVnf5sVIfgDSJeNZx
 caXTst8FtDSBGZat1aMWEhhmg5UQVsQ7yNH0EGIXYC5pPTME0CkVzIwNBSH+hB/td1MO
 Nyfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vkhEkO/AZn+iGeeCv4z3XDvZENqvSyRmzPX1UAsRe3E=;
 b=ZHcdLNGQgEzX0h8flVcPxcsTR+jeGLpyQKMghwIyJ3MjGq3oc5cG5VrZc0hUWjj9rP
 LI3QuQl1lLHdAlhVkxUu8us4Cn2IkM8f7WoOqhcAwTu9zN3snCz2imLeeWqT/sviaBSk
 hZRHGMhrzRmSPs/89uMNrAc6q7tW7RXPeqkopbbLPZzXS2LESK+mzecSbdYBGLcphzzY
 xc7chLxm5mDsfA7Ga1bSbkclg8sDqwYGztBBWkPj1ik+D5G0qMMw0fB09v7/vh3gobCl
 rodi77Yx9lpNgBPd7gqn4NNLHQ57OxPlJgwxxvbS8dcRudgkVPsSBNhl7d7VLQJVfbkS
 wL2Q==
X-Gm-Message-State: AFqh2kqyDPu9K03taHFchGJ5MI1MkiUI1YvAVEIXM0StTIK4YlhBhL6E
 dXzgXwEzxTrH8Lh/RryuPr6+Vg+YNB8=
X-Google-Smtp-Source: AMrXdXsfwgtjavc1YmT4/TO8894hlFrlGymjTmQLll8/vCNGAUdngJay8tGUgXE4mVgUOTSW2//sug==
X-Received: by 2002:a17:90a:ab15:b0:21a:1b9b:139e with SMTP id
 m21-20020a17090aab1500b0021a1b9b139emr13065198pjq.8.1674168286884; 
 Thu, 19 Jan 2023 14:44:46 -0800 (PST)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a3d8200b00228ea2e951fsm173081pjc.8.2023.01.19.14.44.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 14:44:46 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/shmem: Cleanup drm_gem_shmem_create_with_handle()
Date: Thu, 19 Jan 2023 14:44:51 -0800
Message-Id: <20230119224452.2880652-1-robdclark@gmail.com>
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
 drivers/gpu/drm/drm_gem_shmem_helper.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index f21f47737817..fa6281e43954 100644
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

