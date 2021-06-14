Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C733A3A62F7
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jun 2021 13:05:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6210089B30;
	Mon, 14 Jun 2021 11:05:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37BEA89B30;
 Mon, 14 Jun 2021 11:05:20 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id r7so31506736edv.12;
 Mon, 14 Jun 2021 04:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=poJHyYi+U6hi4XqNqX9Ddd4HYWOh74niH3vqVM4huzI=;
 b=leVGIxAzOPZLakkvuPONeueYQpPw6n80dnPy9wBm6R/syQZmuhzJM+N3kvTLJlXorI
 CaxhbkhOhRU09Akhlo1XpKUUcq9NEBg4/vYubH9z3p9cfwMF+3Y3pSrBU00jSubh8Kdl
 Ag0IDyx0KeYJw8V7Qc3m1A3WnO76W1W7eEIJwG4hS5HW0tyRqbXHjNChzkAMQAXuW2bC
 YM8CtlzJQFgvuYaK1RkjaI+Snd9IOsRR16KFzihGH9QO8yIq4XMNDjkfWDUsOYsnZiew
 hSTdiK0aVZdv4GoQF1tU/JgnEaNpsN+dTF/U/3XNc4rnytcGeImIrVJPzlBHwKJHXYdq
 ounA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=poJHyYi+U6hi4XqNqX9Ddd4HYWOh74niH3vqVM4huzI=;
 b=nq5kGlyGgPuHr7oKrDz5SuA/OXr78A6xc/4JWW6Cx2KNbg573jrBHYMQquaf5fel0m
 d0uiLEe1EAVG4mqwD5lpz87tNr7d96P2VQHyuGEjpNucgtsfcl4YXCFjP+tEa+JwyLPF
 Qli+SGIUVVAQf3kMjZwd7AmQr6kOHlaVahHEOlpdN8BQZdfaeS+/gxf6bkyYCSFuegSR
 Di1d9ZWc7aCtN10jBKCsNOIoIyap/tAcEcfUhBUG3ZF8D47oVH4//V2EGd03P4h0z5Fr
 PatMISqaDcx1LulTqFoLS9k7gBTbEdQ07vgHQn4CX8Sm7K6PiYihD9djm6D+fRz6ZlFS
 Xhaw==
X-Gm-Message-State: AOAM532QVGl1kZB2mMGscKEYVx6RBFm2MwObu7oVa46IUCQlgR782xVn
 T1mH4fTMm5wk9TxAIszMwX6Qhurf40Y=
X-Google-Smtp-Source: ABdhPJxfeDXHZr6wp9ldQF4GsMa6NNw6mikAo2ke3BKc19aLK9cwAxjYNAkiUqA/8ZN7KYepyHiVMQ==
X-Received: by 2002:a05:6402:11d3:: with SMTP id
 j19mr16444655edw.247.1623668718852; 
 Mon, 14 Jun 2021 04:05:18 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:f8f:f28f:880f:43d2])
 by smtp.gmail.com with ESMTPSA id b22sm8442242eds.71.2021.06.14.04.05.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 04:05:18 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linux@zary.sk, bskeggs@redhat.com, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Subject: [PATCH] drm/nouveau: fix dma_address check for CPU/GPU sync
Date: Mon, 14 Jun 2021 13:05:17 +0200
Message-Id: <20210614110517.1624-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
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

AGP for example doesn't have a dma_address array.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 3e09df0472ce..170aba99a110 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -546,7 +546,7 @@ nouveau_bo_sync_for_device(struct nouveau_bo *nvbo)
 	struct ttm_tt *ttm_dma = (struct ttm_tt *)nvbo->bo.ttm;
 	int i, j;
 
-	if (!ttm_dma)
+	if (!ttm_dma || !ttm_dma->dma_address)
 		return;
 	if (!ttm_dma->pages) {
 		NV_DEBUG(drm, "ttm_dma 0x%p: pages NULL\n", ttm_dma);
@@ -582,7 +582,7 @@ nouveau_bo_sync_for_cpu(struct nouveau_bo *nvbo)
 	struct ttm_tt *ttm_dma = (struct ttm_tt *)nvbo->bo.ttm;
 	int i, j;
 
-	if (!ttm_dma)
+	if (!ttm_dma || !ttm_dma->dma_address)
 		return;
 	if (!ttm_dma->pages) {
 		NV_DEBUG(drm, "ttm_dma 0x%p: pages NULL\n", ttm_dma);
-- 
2.25.1

