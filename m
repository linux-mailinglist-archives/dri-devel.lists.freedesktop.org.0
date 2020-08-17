Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9381C246C93
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 18:22:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D72C489DFB;
	Mon, 17 Aug 2020 16:22:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C44889DFB;
 Mon, 17 Aug 2020 16:22:17 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id g15so3872021plj.6;
 Mon, 17 Aug 2020 09:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LMklsHHTMxijqDeAVwRgPfCmNnVtewqnmZOiIx8IoQs=;
 b=RbABWtb8XXpDsj3fj6OykBcPLZ5s6mzXo5+8O5lLzibS4H/7sSSbJxgK232d3ZHNl1
 b9OzjD8Evbx+rgydLEzlQePAE9vfUy5L6WAd/HPRFwk/FX68hop3CG7mzh3ZM81mv6Sx
 syKtTcwlb9dGPXkYfbADlIa/5LOrPQHNFDoPCojDFrab605RRle/eZNq65gZHtMmMWrU
 V0k8w/Htzxgdw5ge65ajA54zbKU9mqntHLqH2bMvqPu/STQuBK6D5VB8TdOgcvrSTl2F
 ssnNqEgnzGyi/N+mbujL5peAmlxByvmEpZg6BnM7T5YM+fbbsqtTUqQQ8HBqO++dG3Np
 sTNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LMklsHHTMxijqDeAVwRgPfCmNnVtewqnmZOiIx8IoQs=;
 b=n3TVgW1a1AeSwgvawBa/j/ukKeNgavAO4hWfR6PEBsox9UfOZlHlPFp/Cq4coa2/xP
 pODgOq6wQGroS9CSfvSWr7KY0aQXE/NvVEgd4mU3NAN4af8kJK3DFl75jktuvZEpdpvv
 AGjrjdSQB+42Ss9zQhI5AvBkbuak8SokOzOydzWjMM/b3jFor2LhHR3dK0OZWHvYhOtC
 Cc5lvy6/PFeIJawno0a4bUceDV/NKaxacFmtQ2UffK30pZnzc6szhaaJxZeC2XXD4yDJ
 aqmnWL0FtBXaN3WmjeGXUFe0Cz6y/HOeGP9Ul36hKX1/OSFrxxw6JjNVfI9vye5ceZv2
 rFNw==
X-Gm-Message-State: AOAM532UaAhJQzzisrffbBBwCYyRz/Z6kUwJUO4+sb7VzEbsSa5s6+6y
 d4mrw7Nqt4JbYTXKFotMRwMzFvor7f+wwg==
X-Google-Smtp-Source: ABdhPJxZqVKsxln0UatgdMDzqUQzs7RKNdYGMqEbSpKXAB2AkdX/2A4LN0FQkPSE/xgeFXUS77iQIw==
X-Received: by 2002:a17:902:7616:: with SMTP id
 k22mr12281766pll.25.1597681336661; 
 Mon, 17 Aug 2020 09:22:16 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 w16sm20513732pfq.13.2020.08.17.09.22.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 09:22:15 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm/gpu: make ringbuffer readonly
Date: Mon, 17 Aug 2020 09:23:09 -0700
Message-Id: <20200817162309.362032-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

The GPU has no business writing into the ringbuffer, let's make it
readonly to the GPU.

Fixes: 7198e6b03155 ("drm/msm: add a3xx gpu support")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_ringbuffer.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
index e397c44cc011..39ecb5a18431 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.c
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
@@ -27,7 +27,8 @@ struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
 	ring->id = id;
 
 	ring->start = msm_gem_kernel_new(gpu->dev, MSM_GPU_RINGBUFFER_SZ,
-		MSM_BO_WC, gpu->aspace, &ring->bo, &ring->iova);
+		MSM_BO_WC | MSM_BO_GPU_READONLY, gpu->aspace, &ring->bo,
+		&ring->iova);
 
 	if (IS_ERR(ring->start)) {
 		ret = PTR_ERR(ring->start);
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
