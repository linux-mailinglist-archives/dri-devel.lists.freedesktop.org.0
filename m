Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C1C4E28D0
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 14:59:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50DCF10E446;
	Mon, 21 Mar 2022 13:59:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6786110E440;
 Mon, 21 Mar 2022 13:59:04 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id m30so10984804wrb.1;
 Mon, 21 Mar 2022 06:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7WCa5qA1/nLtCEHZ/PpDjh5N7A1IJbEHHrC/YoiEV28=;
 b=Rxv3py+pB/g6NFcbDA24HDqrbqvlmJJiezujsjkH+c+XmPfcMvtdDYUfw9C+T7wixF
 g/q+Vgw6pQ/kvwc4qz7tqpLzNVSNW4nMmc6/erTJuPnK/3WutmQt+g5sBdEDj9EYWBfL
 kIH++2mfm3lIKgB4fYrdJnZw1iJjAOC6YZnwhrkgJT+DT9ZFGkDQBqoJRgEhJN7zYBtp
 YFbRg0YJZEhcAo1LoOD4nZnAgyZBACX3YIz0WS0PhLpcTmh2mFOJcnlo0d5NsMUe0AE2
 JrtGlby8xNocU7IaBHlWIuqBtplxEyrCzdvne497xJsTSHfTEtCsI4nX4hPk7EEWElsQ
 H13A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7WCa5qA1/nLtCEHZ/PpDjh5N7A1IJbEHHrC/YoiEV28=;
 b=nhlPfRWg8hGWvMFjGMRzu3KXwpFGvWwD/ecDxacDlEoAAz5N6NGJ9sPeu/RH/+B2es
 BFELKHNH3OqVTdwOgiq+9MVjTFqyMeVAQ8j3S9cgBmVgutHCEsS+1BcjmI2zdNIdSqV8
 KYdgD25K1WFg7SjaM0fsyAMlZClP/noVBAu6rrh2QpD9KGxAF19iE8Du0SmTasRDUMB3
 oITYeujqiIOx/p4kErk+mPnPbgQudZ2l45Pu9uATW+kFwrS3Av2hyYbqaOShjEdbR8Gv
 ApaWnxCWYe18PDljUaFGkpjBQmBeU6DBjIC8g0OeGLz9tPcX0O62TW/mziMyrubMLiFI
 MzUw==
X-Gm-Message-State: AOAM532P3n7Js7B2YkiG+tGPZiVXiGGfwozBBHCxGwnbPkjnmbgIpYAX
 /pyH7dhqBkKsLLujKOBk9OCi/h31MWk=
X-Google-Smtp-Source: ABdhPJw2XwfpQvB4WJlgW3zjIYZYIOXJ4RPKvlQFUP9eCwly7siylCB5YDARAHBNoSBn6o31YEyDQg==
X-Received: by 2002:a05:6000:18a2:b0:203:d2de:d6dc with SMTP id
 b2-20020a05600018a200b00203d2ded6dcmr18373185wri.550.1647871142995; 
 Mon, 21 Mar 2022 06:59:02 -0700 (PDT)
Received: from able.fritz.box (p5b0eab60.dip0.t-ipconnect.de. [91.14.171.96])
 by smtp.gmail.com with ESMTPSA id
 m3-20020a5d6243000000b001e33760776fsm13317640wrv.10.2022.03.21.06.59.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 06:59:02 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel.vetter@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 06/23] drm/nouveau: stop using dma_resv_excl_fence
Date: Mon, 21 Mar 2022 14:58:39 +0100
Message-Id: <20220321135856.1331-6-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220321135856.1331-1-christian.koenig@amd.com>
References: <20220321135856.1331-1-christian.koenig@amd.com>
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
Cc: nouveau@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Karol Herbst <kherbst@redhat.com>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead use the new dma_resv_get_singleton function.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: nouveau@lists.freedesktop.org
---
 drivers/gpu/drm/nouveau/nouveau_bo.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index fa73fe57f97b..74f8652d2bd3 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -959,7 +959,14 @@ nouveau_bo_vm_cleanup(struct ttm_buffer_object *bo,
 {
 	struct nouveau_drm *drm = nouveau_bdev(bo->bdev);
 	struct drm_device *dev = drm->dev;
-	struct dma_fence *fence = dma_resv_excl_fence(bo->base.resv);
+	struct dma_fence *fence;
+	int ret;
+
+	/* TODO: This is actually a memory management dependency */
+	ret = dma_resv_get_singleton(bo->base.resv, false, &fence);
+	if (ret)
+		dma_resv_wait_timeout(bo->base.resv, false, false,
+				      MAX_SCHEDULE_TIMEOUT);
 
 	nv10_bo_put_tile_region(dev, *old_tile, fence);
 	*old_tile = new_tile;
-- 
2.25.1

