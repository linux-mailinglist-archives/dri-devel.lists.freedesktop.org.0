Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EAF41388F
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 19:37:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D59476E9CA;
	Tue, 21 Sep 2021 17:37:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36F186E9C9;
 Tue, 21 Sep 2021 17:37:13 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id d6so41375287wrc.11;
 Tue, 21 Sep 2021 10:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Xs3urb+CfK37NrDBLos1427ZQKhaGuo6xOveDYDdwk4=;
 b=H0Rsek8xSUZLyWEKZe4XKreStzYy2VNPFqSEyNoTUFaSPUyX4R3P9PRQPy1X7gQ4c3
 wbd/A+N25CV6YM2siHkR09nzeQhC40hggZbs44OYcmKETMyMhpzBrrl6za/doIjpcPDO
 cuOSrZAnHbR91RLNN1awE6zFZNAD+Q+goSD+1+FKkDcjcnD/BDvM1kRyKHIL4DtjGN79
 fC7ks1bHMeQt+TmQJAP4UQoJIpPFUfki8G/LIlmm6M9okevMEoBW7ceyZpH0vms8/SHm
 cBbo/kk2cuw+Nb0c+JfYCdSv0lpY3MWxHrCTd7O3c2qc9vWlyXKq1p0yaFDZHHeQscAD
 x+qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Xs3urb+CfK37NrDBLos1427ZQKhaGuo6xOveDYDdwk4=;
 b=BQCKwbePg7PMI0LqX30Uc55k+kPYp5O64HF9aGFtgTB2OV5YTQxhtT3IdFNJr+mu88
 tVwIlUBGJQk2XgypqDfa4SCT5bJS3R1Pjr1os8FnrsDoNB3xxNQBLHoxsqaevFRX9QWG
 KdEI4/nFLud1oQayrYkKaoSxWJtg6MbnZu1O26IZOBCOmvMejlxKfClL1KXVeKJbG1L5
 d5/KPc2tguQ3jtRnZPBPASyPCtenREeU8rHLY95vn6GVIqti2C8nOR7K3SPdtZt+jrO1
 B1CuGnzJNMMjMqWoI2zdKt6sbBesV+GczSFgtJMJf/bsS3SVMrVzAU1Hl/GTt5SRbZuW
 qe9Q==
X-Gm-Message-State: AOAM5320GKpXGw3kcSTAH0mSrRmd200fRfBj/455qSm4dDUocVdfLP8I
 f/pA3WWe5EVgUplDpEZAi20=
X-Google-Smtp-Source: ABdhPJwich8Zl0t7zBwPVpsRu7yBppehopcoUXMfKa4OOLk2jjioFZ1v3ZxiRnjyippNt8C/aGgXzw==
X-Received: by 2002:a5d:4a4e:: with SMTP id v14mr36153785wrs.271.1632245831727; 
 Tue, 21 Sep 2021 10:37:11 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 z13sm23310477wrs.90.2021.09.21.10.37.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 10:37:10 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: ckoenig.leichtzumerken@gmail.com, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 10/26] drm/msm: use new iterator in msm_gem_describe
Date: Tue, 21 Sep 2021 19:36:43 +0200
Message-Id: <20210921173659.246165-10-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210921173659.246165-1-christian.koenig@amd.com>
References: <20210921173659.246165-1-christian.koenig@amd.com>
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

Simplifying the code a bit. Also drop the RCU read side lock since the
object is locked anyway.

Untested since I can't get the driver to compile on !ARM.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 22308a1b66fc..14907622769f 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -880,7 +880,7 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m,
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	struct dma_resv *robj = obj->resv;
-	struct dma_resv_list *fobj;
+	struct dma_resv_iter cursor;
 	struct dma_fence *fence;
 	struct msm_gem_vma *vma;
 	uint64_t off = drm_vma_node_start(&obj->vma_node);
@@ -955,22 +955,13 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m,
 		seq_puts(m, "\n");
 	}
 
-	rcu_read_lock();
-	fobj = dma_resv_shared_list(robj);
-	if (fobj) {
-		unsigned int i, shared_count = fobj->shared_count;
-
-		for (i = 0; i < shared_count; i++) {
-			fence = rcu_dereference(fobj->shared[i]);
+	dma_resv_for_each_fence(&cursor, robj, true, fence) {
+		if (dma_resv_iter_is_exclusive(&cursor))
+			describe_fence(fence, "Exclusive", m);
+		else
 			describe_fence(fence, "Shared", m);
-		}
 	}
 
-	fence = dma_resv_excl_fence(robj);
-	if (fence)
-		describe_fence(fence, "Exclusive", m);
-	rcu_read_unlock();
-
 	msm_gem_unlock(obj);
 }
 
-- 
2.25.1

