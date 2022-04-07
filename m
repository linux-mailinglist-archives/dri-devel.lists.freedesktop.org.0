Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 291C24F7AB3
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 11:00:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 567DE10E58D;
	Thu,  7 Apr 2022 09:00:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 495AE10E5AE;
 Thu,  7 Apr 2022 08:59:58 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id bg10so9453775ejb.4;
 Thu, 07 Apr 2022 01:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fLTp1rDW4i3mY7eYY/RGlpkFX2oma6BG2r9ZnWbz4W8=;
 b=RyoBUlxLgDLhzTvyNfjF+EkytESivgX1dhEo0gcCn5VZSZzh7H6HCKmtJNYBzXC6Nz
 mI8dpm1eo3NAcUoqtn4LXpJ+EpIB3oBfnruBHftNG+3J9XQsBZrvCgs7cV9m4fhxJLfW
 YfeCfGH0EnRrZiFe4yxiob4iqEtW1C52sXmnBkbLhhpt2YM/MjajEGuteG0tx4nMDbXU
 cxCyMGoiKVhA2Ym6gdPEDa2LJ1fw0cYOrEAnw78I/Kjz6IPex74StxxGnb/iT785YUcK
 oD+WlJKrtaCFc5rgydkDbhgP1xl5v+FR9SoRM1qljZbY4Qx0m1ESYhrpMQpPH5/R3t8R
 IfuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fLTp1rDW4i3mY7eYY/RGlpkFX2oma6BG2r9ZnWbz4W8=;
 b=evRm0TDGyldFcDpWj87omNi1NoyQiXHZ4JbGr2bbS1jp0kA5ayUF3cqyDkbnIOQZp6
 aJ3TZEyI2uG4wHm/38LgnvQy7t3y9Z9ICgXTbM6l6zyKGu/8elRMmEZY71kd1PuFRGvW
 cKakfz9Z2aFfsavrg/T+vZd5wkGieAfDfCdiQDTpaIwp3QY4ns4CX10NQbi7vj3XXXWg
 yVUJXnA3c2IjLAjxFCdRJIR62/lCL77I9l2oJg/7OeV00/bC5s/BhE3uCGVvqRuHjqAB
 vFmDwEu2v6vyOn4wJ93F9QoAgcHAWlQioprbpfMnpGUlE8cGAT9mNLQAB4j3dWfRODmE
 dpLA==
X-Gm-Message-State: AOAM531WnZsRtCQPPeTmm+dXK/su4zCGrblJwxOlpIrgz0irg9qW2Dy8
 CrqWw9KFjKmFKfMBN3GKxrPdb9rgpzI=
X-Google-Smtp-Source: ABdhPJybdeY80Ujzj5/bv7vK1+k9Ar1apQmg9d9BVBW8qyLyTVJkUvryNql02/i+jE1F5jbDUKTmWg==
X-Received: by 2002:a17:907:3fa8:b0:6d3:477a:efe with SMTP id
 hr40-20020a1709073fa800b006d3477a0efemr12634642ejc.401.1649321996781; 
 Thu, 07 Apr 2022 01:59:56 -0700 (PDT)
Received: from able.fritz.box (p57b0b9e1.dip0.t-ipconnect.de. [87.176.185.225])
 by smtp.gmail.com with ESMTPSA id
 h26-20020a170906111a00b006e778bd4fc8sm5186563eja.38.2022.04.07.01.59.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 01:59:56 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH 06/15] drm/radeon: use DMA_RESV_USAGE_KERNEL
Date: Thu,  7 Apr 2022 10:59:37 +0200
Message-Id: <20220407085946.744568-7-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220407085946.744568-1-christian.koenig@amd.com>
References: <20220407085946.744568-1-christian.koenig@amd.com>
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Always wait for kernel fences before kmap and not only for UVD kmaps.

Signed-off-by: Christian König <christian.koenig@amd.com>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
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

