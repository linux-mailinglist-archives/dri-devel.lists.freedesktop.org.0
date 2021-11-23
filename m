Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78AEA45A565
	for <lists+dri-devel@lfdr.de>; Tue, 23 Nov 2021 15:22:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3397D6E8A8;
	Tue, 23 Nov 2021 14:22:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CF186E86A
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Nov 2021 14:21:53 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 p3-20020a05600c1d8300b003334fab53afso2413387wms.3
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Nov 2021 06:21:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZA3eVOgXYF/5OpQnArz1+ZTX63Lsh0HMT2Me6ubTWAg=;
 b=TEEklyYpr4YJqPs69chmgb+yzwP1mQMdy5K778Nj1w/9iJe9GLbIj0hWFq/Lky/vUz
 H5mXDRlrL24KotjypM4vV77fCZ/aNpEUXvwcIt7+4bDCHKl4+AyLCL5tvPu4qyErGWhg
 O2F8V7bw6W6rUapXS1ogoyimjwoghSKK7XmycBAlxrhKnZ2WY7jJrupkejqsgn8TroYT
 u4RvOoRTQT8pTkxDjwDcWw+mLs8zkr9UBlyQS340kc6PcE9b7LgckVhg+rDGeOdhC/cX
 zfJb8n2ThmkuaqRkKH5WMaimkI323FelfWs1DadGdSevM24tTmT1jfY4VpjABMXc25DD
 9E/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZA3eVOgXYF/5OpQnArz1+ZTX63Lsh0HMT2Me6ubTWAg=;
 b=ZEWYmb1GyJPyvfwzz5Z4EU7ND33scVGglxzccwlElRSEUyOoO/cBx3pKhhJzxfb+Tb
 2gHOYkyupjIOu+H6y2a3WX4vbTgCcdcl0sCnJTgpT5GrkNie13II6D3srf5vk9w5Fv3g
 aBhzOMDUDm9cli1boyY36JIPaTdbIDScF1QQGVEUNVQJ295c9JYWpf8V0FT8cvRHnaUg
 F50173VBKhgdf1gWlgA5GyLT5QpMLv2uILALS2pS3c1dfA3c7q6z+EmDvjWNMSG2Hl+6
 UCgTn9OqguxHwJzGSDcNMhZgFreJl4nJE3iJnB/WVTbD3k+e32irFqJMkcajGakYHKw+
 6Oow==
X-Gm-Message-State: AOAM531jWQ1Qu7PHR1x8AXPXjQ4aIPf9GWPRr3KK4+PI+beexkS9zcvy
 4lPyLWi5LUJmJeTyOb9+qHE=
X-Google-Smtp-Source: ABdhPJyjlMjyW4yKQFiqSqmTSpZBQ8JHZc2WoFrzLFwWHowvF5mfVuCgRsFk6nGHySXsRcT3UMN0fA==
X-Received: by 2002:a1c:f418:: with SMTP id z24mr3644229wma.95.1637677311585; 
 Tue, 23 Nov 2021 06:21:51 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
 by smtp.gmail.com with ESMTPSA id t8sm1645928wmq.32.2021.11.23.06.21.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 06:21:51 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: sumit.semwal@linaro.org,
	daniel@ffwll.ch
Subject: [PATCH 21/26] drm/amdgpu: use dma_resv_get_singleton in
 amdgpu_pasid_free_cb
Date: Tue, 23 Nov 2021 15:21:06 +0100
Message-Id: <20211123142111.3885-22-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211123142111.3885-1-christian.koenig@amd.com>
References: <20211123142111.3885-1-christian.koenig@amd.com>
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

