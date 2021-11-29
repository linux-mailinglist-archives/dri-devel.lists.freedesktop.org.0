Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF6E46149C
	for <lists+dri-devel@lfdr.de>; Mon, 29 Nov 2021 13:08:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39F3C6FA72;
	Mon, 29 Nov 2021 12:07:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A55876FA68
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 12:07:29 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id d9so15385553wrw.4
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 04:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZA3eVOgXYF/5OpQnArz1+ZTX63Lsh0HMT2Me6ubTWAg=;
 b=Ls9pyYYC4IRtynWGVv7PST9jgW7xhHwCKudS7fmE4huulke2dfwzeuE9o1LWLYWfEw
 bInGt1reT+dqSlIgkYPeb8xP2J1aHcx60QtRar3gElqtczG8bS83M9BgVkswP8ij1SgN
 t8hHVP+QFxyCwPUpbm+j8f7qVEjtovxSxo9uqbFAAcpO1Z2xqk3CQpBCvd5vx0TQiYoy
 c8p9/qmUrqySlCTEuUG3wAOwNrsjG7WfyGMjP/6RcKyj1OBAGvYvBS5+GP6CV11DsJvW
 xsqBA1QvJoJDxH/rB0F/HLPjMbty4ybd9cZP8SuwnapTs21ZTkg34GNbgv9KpH6v5Vf4
 NtXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZA3eVOgXYF/5OpQnArz1+ZTX63Lsh0HMT2Me6ubTWAg=;
 b=RckPYdwiH1FPZwg6OpeH0plfOL7SNX1CB8NhAuHTdF7d62xJ1zbXQ4iq6gA/eQW28Y
 i1W65xW9iJP2DSzNamQumoQbuGjkAlS+G883kZcEtp4wldzE9VpgM/QNH7hbDSiXN6rD
 yGlvWmzU8dbgsllIZRJxBszL11g1x7+rA2/+Y5HdlUq0nB5iY08LkpTP9xAFG/uDdCJd
 2dAc6xPe+u3fr94f3hSCa6hZY0LpF3TGZZZ1mxHldDzGD7Uvf8rz+XZMTtku78v9Ah34
 Yflh0cTukSgknCzAdSZLlBUakAr9cnBo1Tq38/6oNatZ1Od3oARDFAZH+EOh/kjwej2c
 Mt+A==
X-Gm-Message-State: AOAM531XKcsmLLu5IxAJlKZuAQgyU7Mxsa9u01zkvQDbf4bUg4+rk7/s
 4UrIrnqwxn8XrPEMbqzehVg=
X-Google-Smtp-Source: ABdhPJwLYqaPOW2nguhOPYGXqO3qoZ4hZ/r8fLTEY5IhxAz1jmeW2jZMMnQjf5rdot0FcpgeR5ne5g==
X-Received: by 2002:a5d:4ed1:: with SMTP id s17mr34904053wrv.310.1638187648289; 
 Mon, 29 Nov 2021 04:07:28 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
 by smtp.gmail.com with ESMTPSA id b6sm20415234wmq.45.2021.11.29.04.07.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 04:07:27 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch
Subject: [PATCH 21/28] drm/amdgpu: use dma_resv_get_singleton in
 amdgpu_pasid_free_cb
Date: Mon, 29 Nov 2021 13:06:52 +0100
Message-Id: <20211129120659.1815-22-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129120659.1815-1-christian.koenig@amd.com>
References: <20211129120659.1815-1-christian.koenig@amd.com>
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
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Makes the code a bit more simpler.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c | 23 +++--------------------
 1 file changed, 3 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
index be48487e2ca7..888d97143177 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
@@ -107,36 +107,19 @@ static void amdgpu_pasid_free_cb(struct dma_fence *fence,
 void amdgpu_pasid_free_delayed(struct dma_resv *resv,
 			       u32 pasid)
 {
-	struct dma_fence *fence, **fences;
 	struct amdgpu_pasid_cb *cb;
-	unsigned count;
+	struct dma_fence *fence;
 	int r;
 
-	r = dma_resv_get_fences(resv, true, &count, &fences);
+	r = dma_resv_get_singleton(resv, true, &fence);
 	if (r)
 		goto fallback;
 
-	if (count == 0) {
+	if (!fence) {
 		amdgpu_pasid_free(pasid);
 		return;
 	}
 
-	if (count == 1) {
-		fence = fences[0];
-		kfree(fences);
-	} else {
-		uint64_t context = dma_fence_context_alloc(1);
-		struct dma_fence_array *array;
-
-		array = dma_fence_array_create(count, fences, context,
-					       1, false);
-		if (!array) {
-			kfree(fences);
-			goto fallback;
-		}
-		fence = &array->base;
-	}
-
 	cb = kmalloc(sizeof(*cb), GFP_KERNEL);
 	if (!cb) {
 		/* Last resort when we are OOM */
-- 
2.25.1

