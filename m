Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 027F23CC630
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jul 2021 22:25:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87AE26EAD0;
	Sat, 17 Jul 2021 20:25:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFCF16EAD4;
 Sat, 17 Jul 2021 20:25:43 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id p17so7359949plf.12;
 Sat, 17 Jul 2021 13:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IVD9aK2ViSAsocanx1A8bXUaVSAERiao0WiLV0MIiP8=;
 b=YzVcPpsV2g8v7Q5x8W0kORS40H4nNH6xD04f4B5SK0yyRu0fTftMm/NspXU5mZFShu
 vpwLhe8gksFSEj/bJXkbeLLqQ/VLPAUhjfzfftkvyjlcSa50PArVTpMQ+wyN08EAjk+k
 4Td6VoSJirUSjoca+rpT0Y51/Iamfma2WlfQLHN/c2TATqI2QtnM6FraHowZ0++YVD0K
 55EBO9a8BJ5YZl6FU9uyIIuHPnJvErW76Urspz9o+E/5XnOUcguHZIbJ3V7p5SJ2bLPA
 f5VQRbfFigZZo7ONjOQuL191iM/93Q3/iL0PolUCxuvq8EgEfIt6yrBbIQTWmuaWVdJs
 97/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IVD9aK2ViSAsocanx1A8bXUaVSAERiao0WiLV0MIiP8=;
 b=ioHH7LYDCIPzZkH59+MJY8SP1OfK31WqMJpa9kTepzlr5S1ij8ZV2HctXTmLoUSeZR
 2x2PGbftKkxV99s+RoBeNbUUkGpXzGLKCeLPCUqUU1Czk1AE112Etr1DNmX5rbJRkhhc
 hOhqbrjxPEDeAEXgTUUDoKdbV9s+mZvhxct26KLDa3HUSwu61r4YZcxV2MsY1wOKXfJP
 kgaVfujkDEFkEAukh90v1VFejExKQNJHYEaopfFqBae4TOIUw/zgd2hxRK8+0X8M2XdA
 HnruAMxZvC14Bna6VizmooUoFBPtSLQZ9S8Xy1Lw0xERTG3Bc/Yr3/sAA8L4x35ge13N
 CwTQ==
X-Gm-Message-State: AOAM533F0n3zBbNP07rJ5rlPSsC/d8u3tVS74riHlZfe3QAHekkiZewR
 gw/+PlE4USyUiG2nauWsU+YLue99Ut5wig==
X-Google-Smtp-Source: ABdhPJwG2/gZlC/7T4wauE3STPezGwanh15E3AerQ3aZXf0j0HH2wbefZvSKII5Me/sXplNimFRNzw==
X-Received: by 2002:a17:90b:698:: with SMTP id
 m24mr16109804pjz.169.1626553542914; 
 Sat, 17 Jul 2021 13:25:42 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 l6sm15783597pgh.34.2021.07.17.13.25.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 13:25:42 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 08/11] drm/msm: Return ERR_PTR() from submit_create()
Date: Sat, 17 Jul 2021 13:29:10 -0700
Message-Id: <20210717202924.987514-9-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210717202924.987514-1-robdclark@gmail.com>
References: <20210717202924.987514-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

In the next patch, we start having more than a single potential failure
reason.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index f6f595aae2c5..f570155bc086 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -32,30 +32,27 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
 		uint32_t nr_cmds)
 {
 	struct msm_gem_submit *submit;
-	uint64_t sz = struct_size(submit, bos, nr_bos) +
-				  ((u64)nr_cmds * sizeof(submit->cmd[0]));
+	uint64_t sz;
+
+	sz = struct_size(submit, bos, nr_bos) +
+			((u64)nr_cmds * sizeof(submit->cmd[0]));
 
 	if (sz > SIZE_MAX)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 
-	submit = kmalloc(sz, GFP_KERNEL | __GFP_NOWARN | __GFP_NORETRY);
+	submit = kzalloc(sz, GFP_KERNEL | __GFP_NOWARN | __GFP_NORETRY);
 	if (!submit)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 
 	kref_init(&submit->ref);
 	submit->dev = dev;
 	submit->aspace = queue->ctx->aspace;
 	submit->gpu = gpu;
-	submit->fence = NULL;
 	submit->cmd = (void *)&submit->bos[nr_bos];
 	submit->queue = queue;
 	submit->ring = gpu->rb[queue->prio];
 	submit->fault_dumped = false;
 
-	/* initially, until copy_from_user() and bo lookup succeeds: */
-	submit->nr_bos = 0;
-	submit->nr_cmds = 0;
-
 	INIT_LIST_HEAD(&submit->node);
 	INIT_LIST_HEAD(&submit->bo_list);
 
@@ -799,8 +796,8 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 
 	submit = submit_create(dev, gpu, queue, args->nr_bos,
 		args->nr_cmds);
-	if (!submit) {
-		ret = -ENOMEM;
+	if (IS_ERR(submit)) {
+		ret = PTR_ERR(submit);
 		goto out_unlock;
 	}
 
-- 
2.31.1

