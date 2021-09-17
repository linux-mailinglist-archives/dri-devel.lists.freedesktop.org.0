Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED9840F7D6
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 14:36:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B3F26EC5F;
	Fri, 17 Sep 2021 12:36:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E73F46EC48;
 Fri, 17 Sep 2021 12:35:37 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id x6so14882685wrv.13;
 Fri, 17 Sep 2021 05:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AUpHD5Mst15U8lHt1Hgxp+Cu6jJmPPk21DhsAGpzZ+s=;
 b=j+uAS7ZkiO0ApRZo17ZwTDrdSBOiMynTykHMOTGXqTXiQQ1p6ejG6KfnZ9XeJgbh22
 AKsV4AWL7PbDytdH2vV7R8VYd/xPzEGjOYX+C07N4l/AKlApEraVUvbKCn7l7pN9izXm
 NxrY/tY3a/3IZCKtUznLpISCgzSlofZLz+OcphEPaLbHEekzrjXMlyjH3LO7TQkzGTLh
 YuucCnOf8VUv/Mi23x5SN0BxOFfHlMYMzKOKCc73XvciU5o9GGBbASXplusvUeueuPX2
 n/XGrIvLtesDBJeaIEZmsxnOxgcE/sz97Cc9Jt3q6YDJX1ObCUDaMdMHPU9Ud2WrPS0+
 IoMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AUpHD5Mst15U8lHt1Hgxp+Cu6jJmPPk21DhsAGpzZ+s=;
 b=zpHzFWMO2GLYHorrCcPduxRTFHNmTB3bN/FyIP4JdV+HP1uHy2pEhSBLENOsTEFs84
 nHzdK8AAACXzwmEtMYl5Inlu2MpF3zLY9KTPYsqw7W1zq9z9mLLbDgYySfU52ISrUNRi
 pTxTpm7kWcshu1gy9FCoeDOLCRwJvXsUbGF/i0UvO9kQd0E2QPs4pSQRC826ea5QmRW9
 2FuX5CL1kagJM9HwWzyMRg0LXPzYTvLG4W3LO4vqtdTYfyZ0adsNVf8PGzGMiPDpzgcb
 sGc9q+idpbJfPwA8akmOsTgb5N0kGo+idcFfymCa9u0hoB+8lfmO8MsbbqWgf7IoT3RO
 d5zw==
X-Gm-Message-State: AOAM530nwJKAdDx9dFxPd02bLQnw8KX36Lh1z/j3Qoq0EUehqf7WDMYJ
 Z5Y/GGoMJsTEX3a4tagbOCw=
X-Google-Smtp-Source: ABdhPJz+TxgvDq1tNUR5ZcT7whVGLx4K5oVeHiddhXow//SYV0XseFxVr5yspabtLCqA2Wclcvx5bQ==
X-Received: by 2002:a5d:404b:: with SMTP id w11mr11830630wrp.437.1631882136529; 
 Fri, 17 Sep 2021 05:35:36 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 l21sm6122049wmh.31.2021.09.17.05.35.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 05:35:36 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch
Subject: [PATCH 24/26] drm/etnaviv: use new iterator in etnaviv_gem_describe
Date: Fri, 17 Sep 2021 14:35:11 +0200
Message-Id: <20210917123513.1106-25-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210917123513.1106-1-christian.koenig@amd.com>
References: <20210917123513.1106-1-christian.koenig@amd.com>
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

Instead of hand rolling the logic.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_gem.c | 29 ++++++++++-----------------
 1 file changed, 11 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
index 8f1b5af47dd6..16f5991446c8 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
@@ -428,19 +428,17 @@ int etnaviv_gem_wait_bo(struct etnaviv_gpu *gpu, struct drm_gem_object *obj,
 static void etnaviv_gem_describe_fence(struct dma_fence *fence,
 	const char *type, struct seq_file *m)
 {
-	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
-		seq_printf(m, "\t%9s: %s %s seq %llu\n",
-			   type,
-			   fence->ops->get_driver_name(fence),
-			   fence->ops->get_timeline_name(fence),
-			   fence->seqno);
+	seq_printf(m, "\t%9s: %s %s seq %llu\n", type,
+		   fence->ops->get_driver_name(fence),
+		   fence->ops->get_timeline_name(fence),
+		   fence->seqno);
 }
 
 static void etnaviv_gem_describe(struct drm_gem_object *obj, struct seq_file *m)
 {
 	struct etnaviv_gem_object *etnaviv_obj = to_etnaviv_bo(obj);
 	struct dma_resv *robj = obj->resv;
-	struct dma_resv_list *fobj;
+	struct dma_resv_iter cursor;
 	struct dma_fence *fence;
 	unsigned long off = drm_vma_node_start(&obj->vma_node);
 
@@ -450,19 +448,14 @@ static void etnaviv_gem_describe(struct drm_gem_object *obj, struct seq_file *m)
 			off, etnaviv_obj->vaddr, obj->size);
 
 	rcu_read_lock();
-	fobj = dma_resv_shared_list(robj);
-	if (fobj) {
-		unsigned int i, shared_count = fobj->shared_count;
-
-		for (i = 0; i < shared_count; i++) {
-			fence = rcu_dereference(fobj->shared[i]);
+	dma_resv_iter_begin(&cursor, robj, true);
+	dma_resv_for_each_fence_unlocked(&cursor, fence) {
+		if (dma_resv_iter_is_exclusive(&cursor))
+			etnaviv_gem_describe_fence(fence, "Exclusive", m);
+		else
 			etnaviv_gem_describe_fence(fence, "Shared", m);
-		}
 	}
-
-	fence = dma_resv_excl_fence(robj);
-	if (fence)
-		etnaviv_gem_describe_fence(fence, "Exclusive", m);
+	dma_resv_iter_end(&cursor);
 	rcu_read_unlock();
 }
 
-- 
2.25.1

