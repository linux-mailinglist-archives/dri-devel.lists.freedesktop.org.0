Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA5E63875C
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 11:22:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D614110E712;
	Fri, 25 Nov 2022 10:22:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5913210E607;
 Fri, 25 Nov 2022 10:21:46 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id n3so6074239wrp.5;
 Fri, 25 Nov 2022 02:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=33DOQ6vIILkZQ3xEa6fyI46ngystOIlWDLLPn82kuV0=;
 b=kJX7IkC4crz3dmOgYPbRKZRKOuNuneH1sLMxyeWft8WqHHa4+WXc4YmD8PlV3ChHfF
 Oz9HnywlMZ5YTlEfkQN5gIX7Fhm2l4+nzFh+5JwTqStPgrGkv9Rw+XAdshtkAlOVaUPI
 QdE5NguTdAPu7d5Xl8yFVSWtrDpFndF6F6zeY6ZtLm2FBolDa5DuiPc0PPKuzwShawRr
 jV/Kc1G5Siihh9RTGwLuwgtIXV9YbAd8nAWfXRDtBkMY7uT6JjHdTAjlf2vKg5vMhyz1
 Tcb6kKct98aQNPPEH6q364vPQv2mtTwnGa4BTSkFUrD/zC/3bWWcmbLo3rWv7aczAya6
 vIAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=33DOQ6vIILkZQ3xEa6fyI46ngystOIlWDLLPn82kuV0=;
 b=Kbg4zPXiDf/yPptakMkZNSEoUuYMzKY1X9R0RwfCaiRNg0iyYasW364FuoVVDkz91N
 5EPvA2HwJdXU7Nz59bfpuytU/P6ybxIinGdOdQf+DRjz84mWKcRpQCLpmv4QOydQ9XQa
 O6wZfLUc/yQgpRJ7RV0/1X97lq/ce4V5zISXwMwkyFJz0Oe9PnaRpDORmsBeVJhaH+pn
 HSZuGI4dbxyp5YzaYgpI4TV2xrJFQAkKZgSUsBQ7Crj/yLGJ9/d/k++4eIpjsrrCUlSN
 t+UR5TkmgQGNUuKYwirCIdGjxx0QF1JjItDXtFC8j2joYaX3K4z4aHMyDHEd9KEiI6Wv
 z48g==
X-Gm-Message-State: ANoB5pnZYZA69RCh3LMAhEI+GCRXnijaLImYMZrOXkLxrnYiKf7qYu2P
 BWDGAqTosFLn1tgsapcBvcqbR5cmzdY=
X-Google-Smtp-Source: AA0mqf7E4aDTtlz9t7bv0fqT7LUToARjYgjvdOa3757tYVgKsoerJq6QppVNY6973wjwqcA2B0zWKg==
X-Received: by 2002:a5d:4143:0:b0:241:ea66:88dc with SMTP id
 c3-20020a5d4143000000b00241ea6688dcmr7966462wrq.86.1669371704530; 
 Fri, 25 Nov 2022 02:21:44 -0800 (PST)
Received: from able.fritz.box (p5b0ea229.dip0.t-ipconnect.de. [91.14.162.41])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a056000038200b00241cfe6e286sm3351193wrf.98.2022.11.25.02.21.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Nov 2022 02:21:44 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: [PATCH 6/9] drm/qxl: stop using ttm_bo_wait
Date: Fri, 25 Nov 2022 11:21:34 +0100
Message-Id: <20221125102137.1801-6-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221125102137.1801-1-christian.koenig@amd.com>
References: <20221125102137.1801-1-christian.koenig@amd.com>
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

TTM is just wrapping core DMA functionality here, remove the mid-layer.
No functional change.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/qxl/qxl_cmd.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_cmd.c b/drivers/gpu/drm/qxl/qxl_cmd.c
index 63aa96a69752..281edab518cd 100644
--- a/drivers/gpu/drm/qxl/qxl_cmd.c
+++ b/drivers/gpu/drm/qxl/qxl_cmd.c
@@ -579,7 +579,7 @@ void qxl_surface_evict(struct qxl_device *qdev, struct qxl_bo *surf, bool do_upd
 
 static int qxl_reap_surf(struct qxl_device *qdev, struct qxl_bo *surf, bool stall)
 {
-	int ret;
+	long ret;
 
 	ret = qxl_bo_reserve(surf);
 	if (ret)
@@ -588,7 +588,19 @@ static int qxl_reap_surf(struct qxl_device *qdev, struct qxl_bo *surf, bool stal
 	if (stall)
 		mutex_unlock(&qdev->surf_evict_mutex);
 
-	ret = ttm_bo_wait(&surf->tbo, true, !stall);
+	if (stall) {
+		ret = dma_resv_wait_timeout(surf->tbo.base.resv,
+					    DMA_RESV_USAGE_BOOKKEEP, true,
+					    15 * HZ);
+		if (ret > 0)
+			ret = 0;
+		else if (ret == 0)
+			ret = -EBUSY;
+	} else {
+		ret = dma_resv_test_signaled(surf->tbo.base.resv,
+					     DMA_RESV_USAGE_BOOKKEEP);
+		ret = ret ? -EBUSY : 0;
+	}
 
 	if (stall)
 		mutex_lock(&qdev->surf_evict_mutex);
-- 
2.34.1

