Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AEBE39CE81
	for <lists+dri-devel@lfdr.de>; Sun,  6 Jun 2021 12:03:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94DE26E02D;
	Sun,  6 Jun 2021 10:03:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFDCF6E48C
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Jun 2021 10:03:18 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id g20so21646475ejt.0
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Jun 2021 03:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=QG/Bcse/WwVT2/GPFpdvzIrOUv/CCY38Q315BSZqR1Q=;
 b=OzvcJJDyXHJVs2NTI+uA/NtLFZV8xNpxZgxR2NrVv/bc2Pc+5qG3s6x5Hw+lqhQ2xY
 0C4RHGKdbKL1bBFJq5/GwpPGmljs2S0Aik2wC/tjTQOirqrMi74M8FpOADCFc+CpQ4Wj
 VrWbBGnRxM6qObBLbeQm2oubnVoPALulhAeB7yy9IJlUIJOQk680K9Ku2Z9yuwEo0/K5
 7tjed0Sf4cNKWxY7NbYx63qE38x7tmHNK0n8Nen8ypagF1uDj2u/5WywX9RH5s3y38Gh
 c1QKazgDe4DwRokNEudNjth/NnrL4dOPfut9LXMXRu0R1g/uHcJceCxsbRRGdB6NCIQo
 07oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QG/Bcse/WwVT2/GPFpdvzIrOUv/CCY38Q315BSZqR1Q=;
 b=se1zyYmQd7QszFrIymm95QrfxR51plp9eE5OK7+XWYCDvG6ITNIkCCE5IajmHnNouc
 tfqTQU1GyjpfnZcNHRm87ZRSg3YO6lgAyzjIQ6A/ZrKtqS4IcxXSZ6bnftlgKH333/nH
 rwtIWAGQJhKssKpFYRfExLRpGcycGlAnyV4OzNO2EU10IJTaGSxRcQGY4bLenNyRcmje
 G4RZmArf6n+dHa3D/O1gyEARRif0i/BwYHij75TPix/TODybt4LoTa3nY2+cVYS9++31
 bMskwk1GbNFSTLFXK8v8BuWoIKUSeO9HAdOPdoUUyPAFrsLe+diKVufmpmGZ2eZq7RpM
 zJKQ==
X-Gm-Message-State: AOAM533X5v4nRFIJk2OM3YJPE2dlhv040V4yyZLCv81P4DLave9rDd7m
 SIVVqWgvi3I6LVAvaKDD6Tk=
X-Google-Smtp-Source: ABdhPJy9kWJ3LtX7n71cE2e85H8TXhDKdoKaFRtb69sOnFkqO1BjV/3nhaKVSMaUFiPKDKXp9FA1Xg==
X-Received: by 2002:a17:906:2419:: with SMTP id
 z25mr13141602eja.343.1622973797400; 
 Sun, 06 Jun 2021 03:03:17 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:78a4:bc57:b741:16b2])
 by smtp.gmail.com with ESMTPSA id r12sm6077531edv.82.2021.06.06.03.03.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Jun 2021 03:03:17 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] drm/nouveau: always wait for the exclusive fence
Date: Sun,  6 Jun 2021 12:03:11 +0200
Message-Id: <20210606100312.119176-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210606100312.119176-1-christian.koenig@amd.com>
References: <20210606100312.119176-1-christian.koenig@amd.com>
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

As discussed with Daniel we want to drop the rule that all
shared fences must signal after the exclusive fence.

This means that drivers also need to to sync to the
exclusive fence when a shared one is present.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/nouveau/nouveau_fence.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index 6b43918035df..05d0b3eb3690 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -358,7 +358,7 @@ nouveau_fence_sync(struct nouveau_bo *nvbo, struct nouveau_channel *chan, bool e
 	fobj = dma_resv_shared_list(resv);
 	fence = dma_resv_excl_fence(resv);
 
-	if (fence && (!exclusive || !fobj || !fobj->shared_count)) {
+	if (fence) {
 		struct nouveau_channel *prev = NULL;
 		bool must_wait = true;
 
-- 
2.25.1

