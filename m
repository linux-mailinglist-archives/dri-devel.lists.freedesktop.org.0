Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD764AF9EC
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 19:26:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41D9C10E1DC;
	Wed,  9 Feb 2022 18:26:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71F1F10E1DC;
 Wed,  9 Feb 2022 18:26:03 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id cz16so6878240edb.8;
 Wed, 09 Feb 2022 10:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xy1Wl1YpQUBJ+tc0SQw9hpGSoZpQOiQLuW8DVJw6UJg=;
 b=kJ0XqzVgo4HWwoxJuhT4lXHGSLvV9GTJXnzzyFRjK3FAl7Ni8TCPYKxXeRWPzdWstV
 1xO6FcG0MomNvg3+BpvHpo+RCosTkaIl6THWWqgDTX2OOlaoMYEKf6Q8LfaNqAUA9ps8
 ZhF5/su5gueN99HLXDMt6GDBSpv3rOJiunonIJdtU5Lr61zXNtgRrQ0aKiYRsM5SkPwM
 A3qnxYpNOXa2tKc6YcpZomJM4I1x0Q8CWfajqt3wN5z8RpK5RQqOsddHPttPc3wGca09
 D075bmE/P5gbfZ50HkV9mrfWREfW1ANenqcI04UW/cqbUlF/LBvMaTYzXXVJPnn9BjCr
 ITrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xy1Wl1YpQUBJ+tc0SQw9hpGSoZpQOiQLuW8DVJw6UJg=;
 b=0BqealjQp98bT5mZRtOizxHcQmsw2fpfW1MwFziGuDwptKd2xynI/gd9yPkMZdf4nb
 gbD7wDFwyOPddj91GuZyCInBjKzY5zpDMrxBGgpAG/Wt8p6iHwWudlmYoCDAORrxbVoo
 YjwSxmScS/BsxRYTBdA+/zs/hMXOFTWSN90vThs84oO3jhB9e39tA2IwZBYpm1GxvFji
 RSny7x9yB8nU79ein2A5rLc5Cm0x8stuKsRqAJHcrF66wQ2LpCfdWkztQI3tikolSaDu
 5ANqZocFDpnJ7JmIRo1wW++5NQ2xYBmclBV5ROTc9aHAwZcGjKXNfZH6G1Dzn+XMq2Fr
 fVvw==
X-Gm-Message-State: AOAM531xYW+oZFvDK5K7+2fWJ1k+t1HscIWk+rclxo1iXA48YB1BllXw
 3XekWwQ3uATqxomL9PLt6yg1FrRgglI=
X-Google-Smtp-Source: ABdhPJzzS7j8gHRMsRxfam2p6eWcjNvR4qSY2heS34HP7/ucko1xgpid3LD+uuBdGqNHo3etUbyGhQ==
X-Received: by 2002:aa7:c947:: with SMTP id h7mr3894625edt.447.1644431161780; 
 Wed, 09 Feb 2022 10:26:01 -0800 (PST)
Received: from able.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id k7sm6190066ejp.182.2022.02.09.10.26.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 10:26:01 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: thomas.hellstrom@linux.intel.com, daniel.vetter@ffwll.ch,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/syncobj: flatten dma_fence_chains on transfer
Date: Wed,  9 Feb 2022 19:26:00 +0100
Message-Id: <20220209182600.434803-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It is illegal to add a dma_fence_chain as timeline point. Flatten out
the fences into a dma_fence_array instead.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/drm_syncobj.c | 61 ++++++++++++++++++++++++++++++++---
 1 file changed, 56 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index c313a5b4549c..7e48dcd1bee4 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -853,12 +853,57 @@ drm_syncobj_fd_to_handle_ioctl(struct drm_device *dev, void *data,
 					&args->handle);
 }
 
+
+/*
+ * Try to flatten a dma_fence_chain into a dma_fence_array so that it can be
+ * added as timeline fence to a chain again.
+ */
+static int drm_syncobj_flatten_chain(struct dma_fence **f)
+{
+	struct dma_fence_chain *chain = to_dma_fence_chain(*f);
+	struct dma_fence *tmp, **fences;
+	struct dma_fence_array *array;
+	unsigned int count;
+
+	if (!chain)
+		return 0;
+
+	count = 0;
+	dma_fence_chain_for_each(tmp, &chain->base)
+		++count;
+
+	fences = kmalloc_array(count, sizeof(*fences), GFP_KERNEL);
+	if (!fences)
+		return -ENOMEM;
+
+	count = 0;
+	dma_fence_chain_for_each(tmp, &chain->base)
+		fences[count++] = dma_fence_get(tmp);
+
+	array = dma_fence_array_create(count, fences,
+				       dma_fence_context_alloc(1),
+				       1, false);
+	if (!array)
+		goto free_fences;
+
+	dma_fence_put(*f);
+	*f = &array->base;
+	return 0;
+
+free_fences:
+	while (count--)
+		dma_fence_put(fences[count]);
+
+	kfree(fences);
+	return -ENOMEM;
+}
+
 static int drm_syncobj_transfer_to_timeline(struct drm_file *file_private,
 					    struct drm_syncobj_transfer *args)
 {
 	struct drm_syncobj *timeline_syncobj = NULL;
-	struct dma_fence *fence;
 	struct dma_fence_chain *chain;
+	struct dma_fence *fence;
 	int ret;
 
 	timeline_syncobj = drm_syncobj_find(file_private, args->dst_handle);
@@ -869,16 +914,22 @@ static int drm_syncobj_transfer_to_timeline(struct drm_file *file_private,
 				     args->src_point, args->flags,
 				     &fence);
 	if (ret)
-		goto err;
+		goto err_put_timeline;
+
+	ret = drm_syncobj_flatten_chain(&fence);
+	if (ret)
+		goto err_free_fence;
+
 	chain = dma_fence_chain_alloc();
 	if (!chain) {
 		ret = -ENOMEM;
-		goto err1;
+		goto err_free_fence;
 	}
+
 	drm_syncobj_add_point(timeline_syncobj, chain, fence, args->dst_point);
-err1:
+err_free_fence:
 	dma_fence_put(fence);
-err:
+err_put_timeline:
 	drm_syncobj_put(timeline_syncobj);
 
 	return ret;
-- 
2.25.1

