Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 359DD4B2653
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 13:50:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36EE910EBDE;
	Fri, 11 Feb 2022 12:50:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC93110EBC3
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 12:50:20 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id p24so22744714ejo.1
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 04:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=/8feDZVFHPKC3pY8v1GnW/3pzS/fVxuaXiSADYQ0yfQ=;
 b=DW+1YT0uilfzh6wmfT8IKyo2JwtKHLAeTnP+ASk1G5/6HqK/ozIdBn9oW2uJ8+DDpk
 J5fYEgPTp3ApB2oSpxk4Neof5S5Clr/wpUVnDAjLuIL2ZXGqjDK3WdQ8bFsnSJBNmwzf
 Y9PbGQjCBbp9ud2uUEQvYalY3Xrn6uEE6UDhPdzvmbDw0EZJuQaEq+i0pGE+xX6IQppt
 zoyaWwRVRYK2FphqGW/DvhVXPJi79f2VYYhiUgmxipUo2eDDpWtZPTT3bP8wjdF5wHzz
 5YOIvQ6eFgKzB/CN5JikDFx5agA4BS1VEt88D0ysOfx9ZBP2Fa2+4MztoR49vSVWKT4T
 /yoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/8feDZVFHPKC3pY8v1GnW/3pzS/fVxuaXiSADYQ0yfQ=;
 b=EB2LYkhwKjmOet+7gFB/zw3IvfjZG1gR3BsLo02WsC1QEYYcfbVnL26TgBLGUZrxLg
 EWS8cX1ZlsE5kZTw7ezlEUBq+N8ROPD+wynU8fl6xddN0tyD1FzmODSHPs5dqs7j0Lnu
 /VgnVs0aZYkdwNBMJklqTKFdOOXAgC+5tglomCu/F7CVDKQJenhhFQVCkxpejQuyNwcq
 A81ZJvh5maI29TyaR6Tn2hvXewiNE7SlNIeTpJFFrOEtAQfaKC+Q1jhNI7UGUi4vi3Im
 Y5GmzvpMtse7hPb18Q2sPNvG1BhY20QWFd0z8UBD/yKdBafRywvz28sEqdWlcO76ks1b
 fK9A==
X-Gm-Message-State: AOAM532gMzOcZXE8ArSKuOJ1vwu8jB4zzNuIexJFZ4evIU0UugIS8y9V
 0PYM1IijTbMxojTVLe6pIxc=
X-Google-Smtp-Source: ABdhPJxvWHSKjx7krkrML/k54QIPgudSP7kpI2fiokJUVV1lWTDKNLz9pAe3JtRrrsQENnxEfjN17w==
X-Received: by 2002:a17:907:1c01:: with SMTP id
 nc1mr1283166ejc.659.1644583819305; 
 Fri, 11 Feb 2022 04:50:19 -0800 (PST)
Received: from able.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id w22sm7868604ejc.137.2022.02.11.04.50.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 04:50:18 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, sumit.semwal@linaro.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH 15/23] drm/amdgpu: use dma_resv_get_singleton in
 amdgpu_pasid_free_cb
Date: Fri, 11 Feb 2022 13:49:55 +0100
Message-Id: <20220211125003.918447-16-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220211125003.918447-1-christian.koenig@amd.com>
References: <20220211125003.918447-1-christian.koenig@amd.com>
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

Makes the code a bit more simpler.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org
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

