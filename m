Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4854F56EB
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 09:52:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C73A10F2DD;
	Wed,  6 Apr 2022 07:51:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9DA210F2D8
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 07:51:49 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id a6so2618722ejk.0
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Apr 2022 00:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references:reply-to
 :mime-version:content-transfer-encoding;
 bh=Q9J71JHfLi+jNvESRZI7/GeJZRTFH9JIsw/X6nmHqVg=;
 b=mjkQmZ+kYVo5DG7qCjJzpIzzWU1ZSLcSmO7HmEVkv0Te4t8WJqAmEBygzPMyK+dMwa
 7jh3DTT/YXbLQ848CnQXG/X2oQZziRohGDOXea3n4GrXOv6SnAWJTu6rtmlP/7QuKeza
 keVIbt15cAfBkXP11NXSiNOIpofDRCE4+HbhmAt5lWZ5dv0HDdXGeuc4uG4dncYVZmxU
 wgq5NnrcCeh8heERDcKbSB9pZ230DAUpdfCVSOY7AEuf9OfeqqUVkX/mpL10Y5X1gndb
 vKYZ3xmc1hCZFRSIO97knE5w0MRz0nZXgCX9zPTZyfT3P2eFIfF8HpMHxiIGaUjqJmAG
 ZOXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:reply-to:mime-version:content-transfer-encoding;
 bh=Q9J71JHfLi+jNvESRZI7/GeJZRTFH9JIsw/X6nmHqVg=;
 b=Ac7MHRVfsJBQrKX3dB0nbIqlEpIRHiu01DKsppJWBCGQmUqv7dqZeKDWwZYoaSKyBJ
 Edbvv00gP9OC0Gq+YPWVHeMIsPaOTb981mRAS9zO+fiefosux3FsoUu9sg7nB2uwlf7P
 5kWJRn95X8KANsNu1QF/VyYU4BvKDK7aj94cyxxDMHVw4nkuIBrowCc62XB+7A5beIT1
 Pq3IRNR2u52TMtKUzYP4/G9jIqJA+0GpjhZdB5OOu7Q0xNiyYVvjVC/aGSs+heTgrrNC
 ea8mao/D8LzGdQyt+tbT4k9BpEOd+YPiB0JQ7p9pD5ez2QlPlh2dgNxobjMA7/LOcoUp
 YPXw==
X-Gm-Message-State: AOAM5332L5URlSNOmYTOmr6NI7X8nmgCbJnS+XVHPYbMwns+q4bza/jk
 9qTIoha2Ld1aIeKOGrZ+Xvg=
X-Google-Smtp-Source: ABdhPJzzpWX0YjUIry/3gMKmj6LouW+H4HfoZAesD5IyKvRhvpkHUyiFd6ti3o0VtayI3jvlayIpxA==
X-Received: by 2002:a17:907:168b:b0:6e7:f2a5:bb0f with SMTP id
 hc11-20020a170907168b00b006e7f2a5bb0fmr7087209ejc.162.1649231508447; 
 Wed, 06 Apr 2022 00:51:48 -0700 (PDT)
Received: from able.fritz.box (p57b0b9e1.dip0.t-ipconnect.de. [87.176.185.225])
 by smtp.gmail.com with ESMTPSA id
 bs7-20020a056402304700b004197e5d2350sm7376386edb.54.2022.04.06.00.51.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 00:51:47 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel.vetter@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 08/16] drm/etnaviv: always wait for kernel fences
Date: Wed,  6 Apr 2022 09:51:24 +0200
Message-Id: <20220406075132.3263-9-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220406075132.3263-1-christian.koenig@amd.com>
References: <20220406075132.3263-1-christian.koenig@amd.com>
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
Reply-To: DMA-resv@freedesktop.org
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Even for explicit synchronization we should wait for kernel fences.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c | 27 ++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
index 98bb5c9239de..3fedd29732d5 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
@@ -171,6 +171,26 @@ static int submit_lock_objects(struct etnaviv_gem_submit *submit,
 	return ret;
 }
 
+/* TODO: This should be moved into the GPU scheduler if others need it */
+static int submit_fence_kernel_sync(struct etnaviv_gem_submit *submit,
+				    struct dma_resv *resv)
+{
+	struct dma_resv_iter cursor;
+	struct dma_fence *fence;
+	int ret;
+
+	dma_resv_for_each_fence(&cursor, resv, DMA_RESV_USAGE_KERNEL, fence) {
+		/* Make sure to grab an additional ref on the added fence */
+		dma_fence_get(fence);
+		ret = drm_sched_job_add_dependency(&submit->sched_job, fence);
+		if (ret) {
+			dma_fence_put(fence);
+			return ret;
+		}
+	}
+	return 0;
+}
+
 static int submit_fence_sync(struct etnaviv_gem_submit *submit)
 {
 	int i, ret = 0;
@@ -183,8 +203,11 @@ static int submit_fence_sync(struct etnaviv_gem_submit *submit)
 		if (ret)
 			return ret;
 
-		if (submit->flags & ETNA_SUBMIT_NO_IMPLICIT)
-			continue;
+		if (submit->flags & ETNA_SUBMIT_NO_IMPLICIT) {
+			ret = submit_fence_kernel_sync(submit, robj);
+			if (ret)
+				return ret;
+		}
 
 		ret = drm_sched_job_add_implicit_dependencies(&submit->sched_job,
 							      &bo->obj->base,
-- 
2.25.1

