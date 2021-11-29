Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A31461498
	for <lists+dri-devel@lfdr.de>; Mon, 29 Nov 2021 13:07:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B4796FA6F;
	Mon, 29 Nov 2021 12:07:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2E676FA64
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 12:07:28 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id j3so36294780wrp.1
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 04:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VGR7sEyP5xUI57aswHQi5HhbTWAZp7wO5W8n1Qo9nVA=;
 b=DvxyvmA4UkCgdWcyCMMQaRiMvazH42UIQQOpJO5EerdANdxHj4KctvJTw1jId0sMdt
 UNipWKXziNXoJmDw3V19P2Iuqpg4Njhzt+PqLRQp5htQ8+upc+XS8TQ2VmsiQAB8sJ3u
 lwvMO3IftrF7bS/FOL2sYTRPvzDb8VK0giPv7FEZN8v4VA2ZomSLM+5Xm4vmsOCopeC0
 7dn8ho9Chxqh+uIWLz1M+KCYJOys7m3cTffo7iBowhR8YSIt5ezUfyF9xCxEgywMlq5b
 4gQdEIgOUbbvzuH4efae6HvT1R8fZLie5Gk1ljIRoZzsxwNaUcrjWY3K/1ovoaIleTyX
 ot3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VGR7sEyP5xUI57aswHQi5HhbTWAZp7wO5W8n1Qo9nVA=;
 b=VsKtL4evHAIQcYftoZsMFgDZDxqFQEFgDKSOlAyTHWLZaORvcBQhzoSrRC5PjuJQ/3
 Yx8Y6dbvhbkzmlRE/VHkdPGPIeE2SD+Ye5BkpcTfzkETrUACW4v0cl9BYPrl7DGL+8GM
 BqilMzj9ntx99l4UtUnKcqF9Q8G1TBuvShrQIiCff05aJVC8CjjhBOtgk4CEBgOR30cH
 ooOnBsLdFJEwYtX+EbCJIK9swMz6XoQyttF2x2oHMvGcDmloZMUhG468J3YZebRrvjyF
 niqyaAnqEexW0cPsGyW9EZ48YtUe0bdG6wannLoazKVeKPm6R8gZC1DG2SrV/bjTQaTA
 3AVQ==
X-Gm-Message-State: AOAM530HE8dwad3bK53eVYFoOPFz2Rp/ymt14y2JY4HTuclkWSIfcZFT
 BBPHpsLtBnM9K8Wft2Qo0Ts=
X-Google-Smtp-Source: ABdhPJx/isgwTDi2SrqXAXlYd86/rMNxzip0CZRacAJNcrcxqfNYJ4bA/CaByWKIpkS+/y0WMI24LA==
X-Received: by 2002:a5d:452b:: with SMTP id j11mr33442239wra.432.1638187647380; 
 Mon, 29 Nov 2021 04:07:27 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
 by smtp.gmail.com with ESMTPSA id b6sm20415234wmq.45.2021.11.29.04.07.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 04:07:27 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch
Subject: [PATCH 20/28] drm/nouveau: support more than one write fence in
 fenv50_wndw_prepare_fb
Date: Mon, 29 Nov 2021 13:06:51 +0100
Message-Id: <20211129120659.1815-21-christian.koenig@amd.com>
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

Use dma_resv_get_singleton() here to eventually get more than one write
fence as single fence.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/nouveau/dispnv50/wndw.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
index 133c8736426a..b55a8a723581 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
@@ -536,8 +536,6 @@ nv50_wndw_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
 	struct nouveau_bo *nvbo;
 	struct nv50_head_atom *asyh;
 	struct nv50_wndw_ctxdma *ctxdma;
-	struct dma_resv_iter cursor;
-	struct dma_fence *fence;
 	int ret;
 
 	NV_ATOMIC(drm, "%s prepare: %p\n", plane->name, fb);
@@ -560,13 +558,11 @@ nv50_wndw_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
 			asyw->image.handle[0] = ctxdma->object.handle;
 	}
 
-	dma_resv_iter_begin(&cursor, nvbo->bo.base.resv, false);
-	dma_resv_for_each_fence_unlocked(&cursor, fence) {
-		/* TODO: We only use the first writer here */
-		asyw->state.fence = dma_fence_get(fence);
-		break;
-	}
-	dma_resv_iter_end(&cursor);
+	ret = dma_resv_get_singleton(nvbo->bo.base.resv, false,
+				     &asyw->state.fence);
+	if (ret)
+		return ret;
+
 	asyw->image.offset[0] = nvbo->offset;
 
 	if (wndw->func->prepare) {
-- 
2.25.1

