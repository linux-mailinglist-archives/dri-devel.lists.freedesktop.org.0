Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE2D974DB6
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 10:59:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EC0110E806;
	Wed, 11 Sep 2024 08:59:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Vc3ONdog";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9563C10E805
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 08:59:10 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-42ca4e0299eso38659915e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 01:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726045149; x=1726649949; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=GebNVT89V3VBgieiU8BUbmF1DMQvP/Xo0HCswgUGTxo=;
 b=Vc3ONdog1gzX3IGuUKir1YxOuZeO9uJAYXOMVCKxrVpj5XzkinyF8AJ3ff55kZTowL
 fz3nispKOM5oREAlIyVGFk2tGhkSSHl8J51+nVTl8OJsvBrFWzr9AOUbYiZ/yiKcDjby
 X7N+i+3RX8F/zcYsq8RI4rOMxT4R9gC8wFoiYx31msw2ibv6CTOIlK95PgYMP/vaYzxb
 bDx3gehgzFt49rxf8ZGHzo90Uzu6w1XuRQxTOhkNl7PKakNZOd2GZabat4Lf+p/dqOAk
 mlrcKfynYwfaZIgneHc2BRJ8bXThMTqOAYsjs7U4p++W3NoV7L6lObzhiMxQ91cDn3HF
 vHsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726045149; x=1726649949;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GebNVT89V3VBgieiU8BUbmF1DMQvP/Xo0HCswgUGTxo=;
 b=ZxfD/UQWDWLPUdWiY66PyN8qFjcbNX8xIP1D0gQ0MlSR4SZac2xcA1MB7eTAUEKHEw
 7mY2WaUhQoDQcTnyx6NdSM8CBBMR9JxPrZYRNwIktGMWmdGMWeXYPzePJWU1li11t+k9
 csjVD9Y4Lxi7U/PLPajDPxxS4LVzKrmmVPGpmtplbEDqEGXuSCSdHqlUN/6qf4p1RUfU
 Vtk4rQR8+QywCwmWeZLMD5KxxUbVb6BxxctiIRp20NdPg5b9oRgVmp87vRoQJwOC1ltk
 9oy7OOGdUWwu+qjWm5ist/EaR4DmaaDfip9MhGys+HooHxF8xXse4ohYnvvBx0Z17KgX
 6I9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzb18qsBklay+WZo3yugp0ylVG8sCggWp2qnejsvk7on8DC9aM7Ux1UxLoULwI/a9zb0bMMRJMnWY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzophCBiSFVPyauYbtuFAXwgi4fEg6P0H5IPcTCP3mF7bU9bLGi
 LCia/8nHNurDIo0YhpOmnohcCOpkqSRM+kG1xiJJ6f7pLsHCGyiZ12CrOx5X/Co=
X-Google-Smtp-Source: AGHT+IF5kO7N4ATrvNhu/2h9Q1I4tRiN7l3i+9HZq7EdM3l8nUorG8M3/WeSVx5BmLbNsO/a7cVmbw==
X-Received: by 2002:a5d:4609:0:b0:378:8dea:4bee with SMTP id
 ffacd0b85a97d-3789269ed5bmr7195802f8f.33.1726045148901; 
 Wed, 11 Sep 2024 01:59:08 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:15d6:de00:8f84:56ce:f670:6ad4])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378956de4b9sm10978174f8f.111.2024.09.11.01.59.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2024 01:59:08 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: simona.vetter@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 4/7] drm/nouveau: remove questionable enable_signaling
 implementation
Date: Wed, 11 Sep 2024 10:59:00 +0200
Message-Id: <20240911085903.1496-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240911085903.1496-1-christian.koenig@amd.com>
References: <20240911085903.1496-1-christian.koenig@amd.com>
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

The comment that the callback is mandatory is incorrect and testing if
the fence is signaled or not just duplicates the testing by the core
framework. So this looks superflous.

Keep the implementation for the uevent operations.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/nouveau/nouveau_fence.c | 49 ++++++++-----------------
 1 file changed, 16 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index 09686d038d60..61d193e41f8c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -486,31 +486,6 @@ static bool nouveau_fence_is_signaled(struct dma_fence *f)
 	return ret;
 }
 
-static bool nouveau_fence_no_signaling(struct dma_fence *f)
-{
-	struct nouveau_fence *fence = from_fence(f);
-
-	/*
-	 * caller should have a reference on the fence,
-	 * else fence could get freed here
-	 */
-	WARN_ON(kref_read(&fence->base.refcount) <= 1);
-
-	/*
-	 * This needs uevents to work correctly, but dma_fence_add_callback relies on
-	 * being able to enable signaling. It will still get signaled eventually,
-	 * just not right away.
-	 */
-	if (nouveau_fence_is_signaled(f)) {
-		list_del(&fence->head);
-
-		dma_fence_put(&fence->base);
-		return false;
-	}
-
-	return true;
-}
-
 static void nouveau_fence_release(struct dma_fence *f)
 {
 	struct nouveau_fence *fence = from_fence(f);
@@ -523,7 +498,6 @@ static void nouveau_fence_release(struct dma_fence *f)
 static const struct dma_fence_ops nouveau_fence_ops_legacy = {
 	.get_driver_name = nouveau_fence_get_get_driver_name,
 	.get_timeline_name = nouveau_fence_get_timeline_name,
-	.enable_signaling = nouveau_fence_no_signaling,
 	.signaled = nouveau_fence_is_signaled,
 	.wait = nouveau_fence_wait_legacy,
 	.release = nouveau_fence_release
@@ -533,18 +507,27 @@ static bool nouveau_fence_enable_signaling(struct dma_fence *f)
 {
 	struct nouveau_fence *fence = from_fence(f);
 	struct nouveau_fence_chan *fctx = nouveau_fctx(fence);
-	bool ret;
+
+	/*
+	 * caller should have a reference on the fence,
+	 * else fence could get freed here
+	 */
+	WARN_ON(kref_read(&fence->base.refcount) <= 1);
 
 	if (!fctx->notify_ref++)
 		nvif_event_allow(&fctx->event);
 
-	ret = nouveau_fence_no_signaling(f);
-	if (ret)
-		set_bit(DMA_FENCE_FLAG_USER_BITS, &fence->base.flags);
-	else if (!--fctx->notify_ref)
-		nvif_event_block(&fctx->event);
+	if (nouveau_fence_is_signaled(f)) {
+		list_del(&fence->head);
 
-	return ret;
+		dma_fence_put(&fence->base);
+		if (!--fctx->notify_ref)
+			nvif_event_block(&fctx->event);
+		return false;
+	} else {
+		set_bit(DMA_FENCE_FLAG_USER_BITS, &fence->base.flags);
+		return true;
+	}
 }
 
 static const struct dma_fence_ops nouveau_fence_ops_uevent = {
-- 
2.34.1

