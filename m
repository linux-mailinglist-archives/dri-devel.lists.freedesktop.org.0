Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B28651DA17
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 16:10:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED86410EEA4;
	Fri,  6 May 2022 14:10:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BACC10EE3F
 for <dri-devel@lists.freedesktop.org>; Fri,  6 May 2022 14:10:17 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id bv19so14723240ejb.6
 for <dri-devel@lists.freedesktop.org>; Fri, 06 May 2022 07:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uor/OSN0V9/XbNXb0bXHUuU21mNXIEqrRD93g0dLk70=;
 b=eoiL+ehjilJRInz4KyNTGXDjCQxQvktPs+FLWpNcUwyKeUQKgJw/fDS2D/tSkpWUbA
 Rohf/6m7Jzw1fH1g6FZddn4e+W9VMLCIsDeWD8SdUlwu+lT0/ZZPX1d5qyYP6PFIDSWC
 hsaVUcSnhXfrRxyz/r+jBSvvn/cQURk2CMhh2+y6ckzAmQ5m8kR839DkUrBimjoRvrvb
 zTYv5OTLZf0ot4Kgxv8r26ZsNHmRF89/3uSUpV5oa2wocr6q7ryNdjX/dnKVvh60c4FM
 0KCNZwgiEIB+k6IbFDEPYEF9JiuUhU9QAMYV58c9EqPdY7hjON539QWvKSmfArWVKu59
 Zsdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uor/OSN0V9/XbNXb0bXHUuU21mNXIEqrRD93g0dLk70=;
 b=yEGF/BVNfJhX9eFZs0v1Z5h/JNzMj5YfYK6NiIpZinYkBR6qk5Ao5T6V86jdyTn2iX
 DNshRNKXWlxylxvo7EqcGMUfbaHCviPACf37CK0BigBe3ISy2/YD1LfwDm35CtTdpk9U
 xUDWcnUVHaY5iIQQ365MJ4Nu0htqzfHhkmnJwpzlWkdDDv6+vOFc6ArElACJ6WUC5eGj
 fHU7zdAoXnWanD1pkiVrMeraxy5pYQ3IRE+h20S/XvxH9c8cEg3ebfY9YSesck0bTKfw
 qzQrV1fSikQO6xmtrBearae67KFgI/aGSWal28wPUPWSWubBervgVvY138gOy7YVVy9a
 ISkg==
X-Gm-Message-State: AOAM533+8BJ3SiZT9pYxoEyabWmzTw/yuzglNxNLTSBkp40pbdN7BEqN
 vYy1K3g0ZFujjocf1uGWiHytD9hUSeA=
X-Google-Smtp-Source: ABdhPJw0WomOd2Zi74Y+aPH/aOxK84ThKgGGj5r4wdVbJ1uFjWwbpufh7/uae4oFmdyMYrcgcVj8mQ==
X-Received: by 2002:a17:906:2b06:b0:6f4:7e76:c855 with SMTP id
 a6-20020a1709062b0600b006f47e76c855mr3193765ejg.78.1651846215956; 
 Fri, 06 May 2022 07:10:15 -0700 (PDT)
Received: from able.fritz.box (p57b0b3fd.dip0.t-ipconnect.de. [87.176.179.253])
 by smtp.gmail.com with ESMTPSA id
 jx3-20020a170907760300b006f3ef214e22sm1915415ejc.136.2022.05.06.07.10.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 07:10:15 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Subject: [PATCH 5/5] drm: use dma_fence_unwrap_merge() in drm_syncobj
Date: Fri,  6 May 2022 16:10:09 +0200
Message-Id: <20220506141009.18047-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220506141009.18047-1-christian.koenig@amd.com>
References: <20220506141009.18047-1-christian.koenig@amd.com>
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

