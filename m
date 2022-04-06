Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1954F56EA
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 09:52:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A66C110F2CF;
	Wed,  6 Apr 2022 07:51:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C44A210F2CF
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 07:51:48 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id c42so1611818edf.3
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Apr 2022 00:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references:reply-to
 :mime-version:content-transfer-encoding;
 bh=3QbzjuROnxJraA9CK9trtayJW6PgZOzIb/wwNoU3y6s=;
 b=P/BjtrN/T5hmXaI2+LmjJqNeZFpQMvxlTgSeYNjekfbRzDx5i46OXpZllmW/cIWSJO
 eBXYK6J9IPrcNlt+2p1X1p7vKW4LjZTDtXzp9FdxfPS+qEHNRw1R/0pCAVFQQ/F++F5g
 EK4yztlr4+BKweHP5lnArAd711sUN8+/P+P33LZLsHLAG+jh4w9YzdNb28Zcb5nhksCb
 MKJOqgny9F5k21IqgK+HFVNH0vAZ54qVDxrbDKeab3VlhB2tLVT8mgZLzXy06wYzfJAe
 YUK7urljtU2ShNXkOGWMFC9KbsIyRreIA4ZSTDJT0pGZhqy+9ZaeMnuS0JDSEDlV1ARZ
 RKnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:reply-to:mime-version:content-transfer-encoding;
 bh=3QbzjuROnxJraA9CK9trtayJW6PgZOzIb/wwNoU3y6s=;
 b=s5zYER9k34JWFzlLyEFUojcFLr9k2Ai+nLQZ79k/huxh1LTW3CUF1xIgDycWgRixw5
 yJgGI8lo8JSaaGVcAv4VtzNyFnQhrkohOLhtDLdUdZDTxC3A4EgaIheaGL2VCCMfjNwX
 XxoNGAUn0nRES/soqUXMMUatrWtwYcJ5nBRTKuSc/eBQjVXTbgWYRVCto01KhgGjlZlM
 dH4foogwM5XkKHCvKkmKqn5C2WTzLVsu4+xLx5TRH//YRmcu1DKN9S2YOQOCBiyfInT6
 gSJZJoOG/GbXHCCjQ2cBt4WvpNFX6DRQa0Wr3QNg/T12ALdLN+kpn39wfLsB9xCtCsFW
 X0CA==
X-Gm-Message-State: AOAM533aYZQSe521V0hy5iu8CeRrFKu198zLxEl3RC+zykD382jJAykY
 Fo4vSU1Jf0qmSVIwXurpgYA=
X-Google-Smtp-Source: ABdhPJwcURPKRYe43rOuZYJAMDgrddD933xM+S/e3+9v+c8mRntxISdEpq6h23kHvh8fQQa47+NTAA==
X-Received: by 2002:aa7:d8da:0:b0:41c:ce44:dfcd with SMTP id
 k26-20020aa7d8da000000b0041cce44dfcdmr7512803eds.142.1649231507347; 
 Wed, 06 Apr 2022 00:51:47 -0700 (PDT)
Received: from able.fritz.box (p57b0b9e1.dip0.t-ipconnect.de. [87.176.185.225])
 by smtp.gmail.com with ESMTPSA id
 bs7-20020a056402304700b004197e5d2350sm7376386edb.54.2022.04.06.00.51.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 00:51:46 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel.vetter@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 07/16] drm/radeon: use DMA_RESV_USAGE_KERNEL
Date: Wed,  6 Apr 2022 09:51:23 +0200
Message-Id: <20220406075132.3263-8-christian.koenig@amd.com>
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

Always wait for kernel fences before kmap and not only for UVD kmaps.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/radeon/radeon_object.c |  7 ++++++-
 drivers/gpu/drm/radeon/radeon_uvd.c    | 12 ++----------
 2 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_object.c b/drivers/gpu/drm/radeon/radeon_object.c
index cb5c4aa45cef..6c4a6802ca96 100644
--- a/drivers/gpu/drm/radeon/radeon_object.c
+++ b/drivers/gpu/drm/radeon/radeon_object.c
@@ -219,7 +219,12 @@ int radeon_bo_create(struct radeon_device *rdev,
 int radeon_bo_kmap(struct radeon_bo *bo, void **ptr)
 {
 	bool is_iomem;
-	int r;
+	long r;
+
+	r = dma_resv_wait_timeout(bo->tbo.base.resv, DMA_RESV_USAGE_KERNEL,
+				  false, MAX_SCHEDULE_TIMEOUT);
+	if (r < 0)
+		return r;
 
 	if (bo->kptr) {
 		if (ptr) {
diff --git a/drivers/gpu/drm/radeon/radeon_uvd.c b/drivers/gpu/drm/radeon/radeon_uvd.c
index a50750740ab0..a2cda184b2b2 100644
--- a/drivers/gpu/drm/radeon/radeon_uvd.c
+++ b/drivers/gpu/drm/radeon/radeon_uvd.c
@@ -470,24 +470,16 @@ static int radeon_uvd_cs_msg(struct radeon_cs_parser *p, struct radeon_bo *bo,
 	int32_t *msg, msg_type, handle;
 	unsigned img_size = 0;
 	void *ptr;
-	long r;
-	int i;
+	int i, r;
 
 	if (offset & 0x3F) {
 		DRM_ERROR("UVD messages must be 64 byte aligned!\n");
 		return -EINVAL;
 	}
 
-	r = dma_resv_wait_timeout(bo->tbo.base.resv, DMA_RESV_USAGE_WRITE,
-				  false, MAX_SCHEDULE_TIMEOUT);
-	if (r <= 0) {
-		DRM_ERROR("Failed waiting for UVD message (%ld)!\n", r);
-		return r ? r : -ETIME;
-	}
-
 	r = radeon_bo_kmap(bo, &ptr);
 	if (r) {
-		DRM_ERROR("Failed mapping the UVD message (%ld)!\n", r);
+		DRM_ERROR("Failed mapping the UVD message (%d)!\n", r);
 		return r;
 	}
 
-- 
2.25.1

