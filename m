Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1017508A0
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 14:47:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 727C210E512;
	Wed, 12 Jul 2023 12:47:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E03410E512;
 Wed, 12 Jul 2023 12:47:11 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-31441bc0092so6833961f8f.1; 
 Wed, 12 Jul 2023 05:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689166029; x=1691758029;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jHB85lYYuoXRXeEQBJlN9+erRgQ0YNtnpeexgtMqiNU=;
 b=qUFXD++gJJEq867Q8tMMLt3APs9rY8R1KsFUZX9ygraxxQsPbTiK6NaW9YkUnHz1bB
 HBh9RSF59Eu+/Ryh5xOM3tm956ZXSroQYehKCbC9QlvpWmvKX+GttKQhHaVwtBblgnmd
 c+RjkNEpnJ1+Z+PvSgPK0hL0/3yZa701f1397CZS64Jvg7ijcmi90aAZZLhoJi37oJqF
 Hinm18l2aF1eIpPquee+eCSgUAXK3VH2IKCkKrl2Uwsq+BkPULyCGjvCHuXPJWizlh4D
 TieHa9JU1AO796vPd/NLb6eJUjy6QGl/u/58UkSKPq3cUnQa85Oh8B+XDY2gYMbgNPFU
 H9+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689166029; x=1691758029;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jHB85lYYuoXRXeEQBJlN9+erRgQ0YNtnpeexgtMqiNU=;
 b=ZEIsJYa8kzhtUtrAVgWp1nyKWx3VHPuufidG7MTJT22RbEa/sPm1rGJ2IeCeGHqVlZ
 cATrwbgV7rIz58unNyY6An22ybyO2qaVVzyT87/B+cLmcOc2OSc2IO1b6nglTRPoUZZa
 zL5MLrnKwSi6D6RPCThZjpvhFy6KtUI7ztS8Ev0Htrdm8eDu/x1YJD5Nmoodo4MJy+bo
 jqFHIvRiVFdddeC+4k0lJC/O5wQdVeI+xaFYoag1ZAy2g3mbx21Lgrm8EOTfY0Tb9ZZ1
 4jPHTmcDJLdekZTIUYUXLe8xScFc+njXpPUNRpbiMoBjEd3qWaNGeSdigRlonFHz8/zd
 icxg==
X-Gm-Message-State: ABy/qLaDxatIyGSPOqKoBa3XyPAwZEnYJE2DUTwOoa2ZcLLYVjUADUSp
 +cZVesCDlquYAREYEwMurhLL6IJkhl4=
X-Google-Smtp-Source: APBJJlEKdL6p/77/wJzXlf2kuJI3Orjh4OaDmmiDniORcukOog90eGUkqhaPlmWeilfB1QkgkSBhcQ==
X-Received: by 2002:adf:f108:0:b0:313:eaf5:515 with SMTP id
 r8-20020adff108000000b00313eaf50515mr15167312wro.6.1689166029358; 
 Wed, 12 Jul 2023 05:47:09 -0700 (PDT)
Received: from EliteBook.fritz.box ([2a00:e180:1557:4100:d4c4:2bb7:77d6:6d86])
 by smtp.gmail.com with ESMTPSA id
 j8-20020adfe508000000b0031424950a99sm4989225wrm.81.2023.07.12.05.47.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jul 2023 05:47:08 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/7] drm/lima: switch to using drm_exec
Date: Wed, 12 Jul 2023 14:47:00 +0200
Message-Id: <20230712124704.333004-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230712124704.333004-1-christian.koenig@amd.com>
References: <20230712124704.333004-1-christian.koenig@amd.com>
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 lima@lists.freedesktop.org, Qiang Yu <yuq825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Just a straightforward conversion without any optimization.

Only compile tested for now.

Signed-off-by: Christian König <christian.koenig@amd.com>
Cc: Qiang Yu <yuq825@gmail.com>
Cc: lima@lists.freedesktop.org
---
 drivers/gpu/drm/lima/Kconfig    |  1 +
 drivers/gpu/drm/lima/lima_gem.c | 17 +++++++++--------
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/lima/Kconfig b/drivers/gpu/drm/lima/Kconfig
index fa1d4f5df31e..1d2871d9ddd2 100644
--- a/drivers/gpu/drm/lima/Kconfig
+++ b/drivers/gpu/drm/lima/Kconfig
@@ -9,6 +9,7 @@ config DRM_LIMA
        depends on COMMON_CLK
        depends on OF
        select DRM_SCHED
+       select DRM_EXEC
        select DRM_GEM_SHMEM_HELPER
        select PM_DEVFREQ
        select DEVFREQ_GOV_SIMPLE_ONDEMAND
diff --git a/drivers/gpu/drm/lima/lima_gem.c b/drivers/gpu/drm/lima/lima_gem.c
index 4f9736e5f929..d4688d19465b 100644
--- a/drivers/gpu/drm/lima/lima_gem.c
+++ b/drivers/gpu/drm/lima/lima_gem.c
@@ -8,6 +8,7 @@
 #include <linux/shmem_fs.h>
 #include <linux/dma-mapping.h>
 
+#include <drm/drm_exec.h>
 #include <drm/drm_file.h>
 #include <drm/drm_syncobj.h>
 #include <drm/drm_utils.h>
@@ -292,7 +293,7 @@ static int lima_gem_add_deps(struct drm_file *file, struct lima_submit *submit)
 int lima_gem_submit(struct drm_file *file, struct lima_submit *submit)
 {
 	int i, err = 0;
-	struct ww_acquire_ctx ctx;
+	struct drm_exec exec;
 	struct lima_drm_priv *priv = to_lima_drm_priv(file);
 	struct lima_vm *vm = priv->vm;
 	struct drm_syncobj *out_sync = NULL;
@@ -329,8 +330,11 @@ int lima_gem_submit(struct drm_file *file, struct lima_submit *submit)
 		bos[i] = bo;
 	}
 
-	err = drm_gem_lock_reservations((struct drm_gem_object **)bos,
-					submit->nr_bos, &ctx);
+	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
+	drm_exec_until_all_locked(&exec)
+		err = drm_exec_prepare_array(&exec,
+					     (struct drm_gem_object **)bos,
+					     submit->nr_bos, 0);
 	if (err)
 		goto err_out0;
 
@@ -360,9 +364,7 @@ int lima_gem_submit(struct drm_file *file, struct lima_submit *submit)
 				   submit->bos[i].flags & LIMA_SUBMIT_BO_WRITE ?
 				   DMA_RESV_USAGE_WRITE : DMA_RESV_USAGE_READ);
 	}
-
-	drm_gem_unlock_reservations((struct drm_gem_object **)bos,
-				    submit->nr_bos, &ctx);
+	drm_exec_fini(&exec);
 
 	for (i = 0; i < submit->nr_bos; i++)
 		drm_gem_object_put(&bos[i]->base.base);
@@ -379,8 +381,7 @@ int lima_gem_submit(struct drm_file *file, struct lima_submit *submit)
 err_out2:
 	lima_sched_task_fini(submit->task);
 err_out1:
-	drm_gem_unlock_reservations((struct drm_gem_object **)bos,
-				    submit->nr_bos, &ctx);
+	drm_exec_fini(&exec);
 err_out0:
 	for (i = 0; i < submit->nr_bos; i++) {
 		if (!bos[i])
-- 
2.34.1

