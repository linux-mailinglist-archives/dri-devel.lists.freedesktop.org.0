Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71587519F2E
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 14:23:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 068A210F353;
	Wed,  4 May 2022 12:23:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73B5C10F1EC
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 12:23:03 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id u3so1792857wrg.3
 for <dri-devel@lists.freedesktop.org>; Wed, 04 May 2022 05:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xVf0ouNzqYcmj9vzxVqNivW1b4yIyv0QPUJDmRo41CY=;
 b=cnaRnMV7sVg7pNWlxjmJG4DXhnAkGth6VkW4qHR2+NeZjYcIVgzYm4EIKVITZ+qOIo
 Kvy5RjLFyzQ2UnGYA6vtHAb/DocXrfzILOY+iHkQkDqGOwhKuiovwEPFba8EcDN4JRJX
 HN4ewxKo0KaRna9MIfgIRuMzKhilOh4ZeNmJVz8AYzxsM2VqLgE/aF7Olu24RskfOikw
 IcxEzWhEyBYG6F2crJ7OQhykiWEiyVJz6n6Sww3jHMGkFSXMyIjieiAcrtdghbQ07Xpo
 Hch6h+yhiw2xE5tFnMg7zSBDRfiYueZkynesDJXoOcc/qupKWgp9Yljf3z2phLYUgOFZ
 V4Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xVf0ouNzqYcmj9vzxVqNivW1b4yIyv0QPUJDmRo41CY=;
 b=7SiG5jM5zEdhqKAhLYxuK/MO4QjKr2OzzFjcJVVZ8Dr2oNYfRsV0YZ2/7g3CovCFMd
 58Nrmb7vHjW39ucFUNHuD5fQ6Cqj5tY972CExaaAAnOOjAd8YPNajQL7xK6V6IwyPEsA
 K+jzsg4p6KfleYInMzQrv7sRYR/fBc2MHsv0QTxkPE7JbNWqv1s0ev+EYrY7mNhjsf+K
 1NZeNvT1TXn7058n8SEOrqo/tvY+Om3pSYoQIR6LpQdMs0dbHEAciNGB2pmtLrwVvvsj
 8Zpb1HApMo50ES794yzArVmSiG9mvOAMcrO6gr90V/V08lVwqkBj20CZFIHtWO8ftyQr
 po0g==
X-Gm-Message-State: AOAM5304DDOBb+ght0F6aa1iEcVEGAZlWaxUb7Vfvt33VkbcXuBEbVhJ
 fPKlH5a3F6/fbaZayAbi4qI=
X-Google-Smtp-Source: ABdhPJyA8j1ql7YtH3QnjRvNvAgCWa1faL1t7sZcwDC7aGuoOXqd2a8oYgG0bQwmuGU5DBqd4cdxCw==
X-Received: by 2002:a5d:5681:0:b0:207:b2d2:aa4f with SMTP id
 f1-20020a5d5681000000b00207b2d2aa4fmr16464829wrv.170.1651666982035; 
 Wed, 04 May 2022 05:23:02 -0700 (PDT)
Received: from able.fritz.box (p57b0b7c9.dip0.t-ipconnect.de. [87.176.183.201])
 by smtp.gmail.com with ESMTPSA id
 l28-20020a05600c1d1c00b003942a244ed1sm1462119wms.22.2022.05.04.05.23.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 05:23:01 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org
Subject: [PATCH 5/5] drm: use dma_fence_unwrap_merge() in drm_syncobj
Date: Wed,  4 May 2022 14:22:56 +0200
Message-Id: <20220504122256.1654-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220504122256.1654-1-christian.koenig@amd.com>
References: <20220504122256.1654-1-christian.koenig@amd.com>
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The unwrap merge function is now intended for this use case.

Signed-off-by: Christian König <christian.koenig@amd.com>
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

