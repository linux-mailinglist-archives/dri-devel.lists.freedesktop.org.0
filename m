Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9172E52BBA6
	for <lists+dri-devel@lfdr.de>; Wed, 18 May 2022 15:59:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E394610ED71;
	Wed, 18 May 2022 13:59:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFC0C10EC5A;
 Wed, 18 May 2022 13:58:53 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id wh22so3866488ejb.7;
 Wed, 18 May 2022 06:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uor/OSN0V9/XbNXb0bXHUuU21mNXIEqrRD93g0dLk70=;
 b=QzRtkq27gU5hPqpjv9jQC+FW+5eGbamUNuEcffv6WlaqnEtN96v3wz22w46nuCjw6/
 kwfU0kJp0OENAIUNjNQ/eCa+SxUULRgNFW4toBFfiounv8ufUqIMZkLH5Sc28WixfwSS
 JYYsTb61fpexHKv+Cr3lBaZUDaA3YIw9s51yPTunh0F8EiYazj5sXnJ9hK1gs7/7OiMF
 aeqEvyGnqxNOhZ9HgvMyDetrJ75Dn27FMKeZ1TsGfU655nvRX4NwvsZBC2O+8hcfF7Kl
 sOKsITDGl0jIxPprZBtq6AeWBq5NR/YYRRoSaHAd9muoWd5LVC1CHWv9x2DGzpxdyhsB
 NBrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uor/OSN0V9/XbNXb0bXHUuU21mNXIEqrRD93g0dLk70=;
 b=zSLjvkqhj/9TCLvooR+nGlsZNBEtSmgZyAyxjSFOsCnLq+V9KvnSFgHebUsZilAWeC
 zBdo1hgN8mrzJlqy7GBmDaM+wb6pCkYeoaDXpxtr80SAOXFY01rlqs4+/oCAIq9LZHYS
 M5Q9/03x2xaAfPQdT2Y4TVP0ITfiQ6cFKQaJGnECc/0rPyLipMFokL9m2H2QdZJXKfz9
 f5BIoF4JRXegh+t8rLBXhVUqRYyvfMOb4KNsu5N2das6ic0soNqL1evinuYJ/FIi6CdB
 VVqKj33ZJjrkfQCWCGNOyR/Tx9v9mmpNBhj9NoFNX1LMyxIuEnCWEt5HUq7J7bJ5uo89
 Z/Rw==
X-Gm-Message-State: AOAM530fDSIDdJhvxY8kQIiqvCxF5a3/a0R+HwueX1FxJFbXvFFRAD3x
 F1fbWMyw17wZrLX5jYkoiE20fFPvLyc=
X-Google-Smtp-Source: ABdhPJydBlJ3Lbz1qf3zoqI0cq8URBWyZw0OZlTYr+b6sZdoMqcl2FEVzOvFEmIBd8CKiN/Ky9MTdQ==
X-Received: by 2002:a17:906:9b87:b0:6fa:8b03:5837 with SMTP id
 dd7-20020a1709069b8700b006fa8b035837mr24934129ejc.362.1652882332224; 
 Wed, 18 May 2022 06:58:52 -0700 (PDT)
Received: from able.fritz.box (p57b0bdaa.dip0.t-ipconnect.de. [87.176.189.170])
 by smtp.gmail.com with ESMTPSA id
 c21-20020aa7c995000000b0042aaacd4edasm1388917edt.26.2022.05.18.06.58.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 May 2022 06:58:51 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 5/5] drm: use dma_fence_unwrap_merge() in drm_syncobj
Date: Wed, 18 May 2022 15:58:44 +0200
Message-Id: <20220518135844.3338-6-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220518135844.3338-1-christian.koenig@amd.com>
References: <20220518135844.3338-1-christian.koenig@amd.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The unwrap merge function is now intended for this use case.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/drm_syncobj.c | 57 +++++------------------------------
 1 file changed, 7 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index 7e48dcd1bee4..bbad9e4696e7 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -184,6 +184,7 @@
  */
 
 #include <linux/anon_inodes.h>
+#include <linux/dma-fence-unwrap.h>
 #include <linux/file.h>
 #include <linux/fs.h>
 #include <linux/sched/signal.h>
@@ -853,57 +854,12 @@ drm_syncobj_fd_to_handle_ioctl(struct drm_device *dev, void *data,
 					&args->handle);
 }
 
-
-/*
- * Try to flatten a dma_fence_chain into a dma_fence_array so that it can be
- * added as timeline fence to a chain again.
- */
-static int drm_syncobj_flatten_chain(struct dma_fence **f)
-{
-	struct dma_fence_chain *chain = to_dma_fence_chain(*f);
-	struct dma_fence *tmp, **fences;
-	struct dma_fence_array *array;
-	unsigned int count;
-
-	if (!chain)
-		return 0;
-
-	count = 0;
-	dma_fence_chain_for_each(tmp, &chain->base)
-		++count;
-
-	fences = kmalloc_array(count, sizeof(*fences), GFP_KERNEL);
-	if (!fences)
-		return -ENOMEM;
-
-	count = 0;
-	dma_fence_chain_for_each(tmp, &chain->base)
-		fences[count++] = dma_fence_get(tmp);
-
-	array = dma_fence_array_create(count, fences,
-				       dma_fence_context_alloc(1),
-				       1, false);
-	if (!array)
-		goto free_fences;
-
-	dma_fence_put(*f);
-	*f = &array->base;
-	return 0;
-
-free_fences:
-	while (count--)
-		dma_fence_put(fences[count]);
-
-	kfree(fences);
-	return -ENOMEM;
-}
-
 static int drm_syncobj_transfer_to_timeline(struct drm_file *file_private,
 					    struct drm_syncobj_transfer *args)
 {
 	struct drm_syncobj *timeline_syncobj = NULL;
+	struct dma_fence *fence, *tmp;
 	struct dma_fence_chain *chain;
-	struct dma_fence *fence;
 	int ret;
 
 	timeline_syncobj = drm_syncobj_find(file_private, args->dst_handle);
@@ -912,13 +868,14 @@ static int drm_syncobj_transfer_to_timeline(struct drm_file *file_private,
 	}
 	ret = drm_syncobj_find_fence(file_private, args->src_handle,
 				     args->src_point, args->flags,
-				     &fence);
+				     &tmp);
 	if (ret)
 		goto err_put_timeline;
 
-	ret = drm_syncobj_flatten_chain(&fence);
-	if (ret)
-		goto err_free_fence;
+	fence = dma_fence_unwrap_merge(tmp);
+	dma_fence_put(tmp);
+	if (!fence)
+		goto err_put_timeline;
 
 	chain = dma_fence_chain_alloc();
 	if (!chain) {
-- 
2.25.1

