Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0DD3AB245
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 13:16:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D44FF6E8F4;
	Thu, 17 Jun 2021 11:16:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 973E36E8EC
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 11:16:13 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id gb32so1046785ejc.2
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 04:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=R6hl7Kj0yqQ18nUKlg1tjNnt1DaG6v6UQcKSpcEHFSE=;
 b=JGK01UuNZMIEIDibVS0nyIINaWe1LD8WZSd2MzqqM2c1KEb2oA3W9tigP/K49EqQW8
 HZxCrrioSf1JPwkEFtuGmZZRBoArktZT6ohdSForRUjBj23LLhDX3yQPRXYyLMozPX7e
 l/t6i/bxYWFoVNcLTK5HgX2RtfTcooCVtxNCp2D/9SEn52xJiDUO84QtRapdt+IJlEok
 CJ/lmWyy/U6dbXa2Wniz6V7zBH0SdBaNv+4HPtws7b0i6j4yuu/SCwo2rT0oVh2DOaju
 TJzNFPmCQnAbO6g6e6nPuoZt4kam7XNW4A0fqhl+bNthPPPtHRZpXfuD5m1sNVTOBZlL
 O/PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R6hl7Kj0yqQ18nUKlg1tjNnt1DaG6v6UQcKSpcEHFSE=;
 b=tfZnXzvO6wH95/DDO4mLfhHI/4zrQ+M2kLjag0xvlfeTkl15A5nDAhk7G9t1W+5xQA
 fZmoMggyZqqXOfPFbf2cSQG+HweaRIuS3AGXrYNKANFyzdTz+x+o8j2umwHNh18ehJNg
 8cbHca+rCoKhbaboXUD0CtUIsGfczopq2nac1xMmmFcMSQo/CW3bE88sd+vxbo6YOiks
 1xrVMbZdFlaGxcPkusivamV8Fb9+XUjEnNnpk7bcJWYgA8sMRk8hv5xtPvOHj3uHCY4R
 Yt2gR9WvF4vXRaV/tQmYzymRlhlVvCAIjGIat3AuJGpNZ8oMxTvJ21AYh2L64Rc34xSS
 EMlg==
X-Gm-Message-State: AOAM5325IVsBX0mnhvDahSeYIRnew9+31/vsWyrIqVlPhaOrD6+ARjqt
 9kcIBFP0AdECXhL62S+Q+3k=
X-Google-Smtp-Source: ABdhPJzM+36tYqZqJ/QN7yQ4BXU4PIysQ1XlwHkj9hQ3HC1RgavOExt7bDD1K7FT+NqCLwr8YaMZWQ==
X-Received: by 2002:a17:907:20ee:: with SMTP id
 rh14mr4645376ejb.461.1623928572354; 
 Thu, 17 Jun 2021 04:16:12 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:8534:5e76:1ee5:f3ad])
 by smtp.gmail.com with ESMTPSA id y10sm3531353ejm.76.2021.06.17.04.16.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 04:16:12 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, sumit.semwal@linaro.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org
Subject: [PATCH 16/16] drm/radeon: use new iterator in radeon_sync_resv
Date: Thu, 17 Jun 2021 13:15:58 +0200
Message-Id: <20210617111558.28486-17-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210617111558.28486-1-christian.koenig@amd.com>
References: <20210617111558.28486-1-christian.koenig@amd.com>
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

Simplifying the code a bit.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/radeon/radeon_sync.c | 22 +++-------------------
 1 file changed, 3 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_sync.c b/drivers/gpu/drm/radeon/radeon_sync.c
index 9257b60144c4..14a4d8135bad 100644
--- a/drivers/gpu/drm/radeon/radeon_sync.c
+++ b/drivers/gpu/drm/radeon/radeon_sync.c
@@ -91,33 +91,17 @@ int radeon_sync_resv(struct radeon_device *rdev,
 		     struct dma_resv *resv,
 		     bool shared)
 {
-	struct dma_resv_list *flist;
-	struct dma_fence *f;
+	struct dma_resv_cursor cursor;
 	struct radeon_fence *fence;
-	unsigned i;
+	struct dma_fence *f;
 	int r = 0;
 
-	/* always sync to the exclusive fence */
-	f = dma_resv_excl_fence(resv);
-	fence = f ? to_radeon_fence(f) : NULL;
-	if (fence && fence->rdev == rdev)
-		radeon_sync_fence(sync, fence);
-	else if (f)
-		r = dma_fence_wait(f, true);
-
-	flist = dma_resv_shared_list(resv);
-	if (shared || !flist || r)
-		return r;
-
-	for (i = 0; i < flist->shared_count; ++i) {
-		f = rcu_dereference_protected(flist->shared[i],
-					      dma_resv_held(resv));
+	dma_resv_for_each_fence(resv, &cursor, shared, f) {
 		fence = to_radeon_fence(f);
 		if (fence && fence->rdev == rdev)
 			radeon_sync_fence(sync, fence);
 		else
 			r = dma_fence_wait(f, true);
-
 		if (r)
 			break;
 	}
-- 
2.25.1

