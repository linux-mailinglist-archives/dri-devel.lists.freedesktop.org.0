Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5CC95B0126
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 12:01:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47FCE10E4D6;
	Wed,  7 Sep 2022 10:00:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4988E10E4D6
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Sep 2022 10:00:54 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 i186-20020a1c3bc3000000b003b2973dafb7so65982wma.2
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Sep 2022 03:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=8a7ewnIYbL77uedhfZXQbZgzn5QAFgKLZsd2CKYFFYk=;
 b=BRnH9MqwcY1hO31UuS7nTEO9oUzIMOR/DNmg8C/EBkg2CsmUdnUB+a52EF3Miu6Q+m
 BKYMLr4Wu2SD3sUdD9qoj5LYmTEhO2jjQpIidjCYzQvbZlMsPtE+7cVb8W8zUzxUALrA
 puDtYWcdGTdoMRpjxORy1xrx11kSrqQf3eE2TqpJkAHokTwg4wpxV6JAd6P8mmqUuTW9
 Dfcuk8q2tLTlYvJIaf9sDLC17JGN9KCN7bSiecZsfiW5/lSjZJpoCAf1kwk2/LTU3zbE
 MsoxNg62G8Mpb4q9sj6r7nvQ7szhBwYcNwRJ7p627yHRZe1pwxhJe0EsmfbVQdXElP65
 MQTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=8a7ewnIYbL77uedhfZXQbZgzn5QAFgKLZsd2CKYFFYk=;
 b=tSRp3b9pgvZdeBou98i74EgudTPCPI9GReSRQSsbZJbodNRDQWsTtlU42uKg4MPNsG
 UWpQ9W25tzp4HXCL1gM/Lih6SwIH23I9AWB0HvFBbi5DQeYHtP0Iw3tieZ0kcfcKiSx6
 ieWnhIKmdgQmdPosg87JUeMnYcrsoXBOTnpWjn8ElhLSwstPs3UTDKVK2Ysi3JMWK7K3
 F9DYSORQPe0/N0RGyHIosrSi40BK43DhSF1rZwesuXqTe4Lr0M8sQeCbOE769VNwPj4w
 TexmSfmQWTXNftp8gW51/t52jUdn/m00DYWzbS9X2AwVavnYimAJz+HDG8gjt9U4kyWG
 tD3g==
X-Gm-Message-State: ACgBeo3++MnEvF6W6HN0ASLn0jYIb8oMVNsFIliVt/r3PiACgjIsDWIg
 OnAp/x1u5EVBDU9x8vaGVT4=
X-Google-Smtp-Source: AA6agR6//YXn2l/CDo+FW5AWrT9QT0Cf3vrnbIyBFuPRm1UE5b0vCVEQrVDpnFDb1YCrHhOBo4HDcA==
X-Received: by 2002:a05:600c:2317:b0:3a5:a3b7:31f with SMTP id
 23-20020a05600c231700b003a5a3b7031fmr16195448wmo.6.1662544853241; 
 Wed, 07 Sep 2022 03:00:53 -0700 (PDT)
Received: from EliteBook.fritz.box (p4fc20f4e.dip0.t-ipconnect.de.
 [79.194.15.78]) by smtp.gmail.com with ESMTPSA id
 k23-20020a05600c1c9700b003a531c7aa66sm18957989wms.1.2022.09.07.03.00.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Sep 2022 03:00:52 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: matthew.william.auld@gmail.com, zhenguo.yin@amd.com,
 dri-devel@lists.freedesktop.org, jingwen.chen2@amd.com
Subject: [PATCH] drm/ttm: cleanup the resource of ghost objects after locking
 them
Date: Wed,  7 Sep 2022 12:00:51 +0200
Message-Id: <20220907100051.570641-1-christian.koenig@amd.com>
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Otherwise lockdep will complain about cleaning up the bulk_move.

Not even compile tested.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo_util.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 57a27847206f..911141d16e95 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -236,6 +236,11 @@ static int ttm_buffer_object_transfer(struct ttm_buffer_object *bo,
 	if (bo->type != ttm_bo_type_sg)
 		fbo->base.base.resv = &fbo->base.base._resv;
 
+	dma_resv_init(&fbo->base.base._resv);
+	fbo->base.base.dev = NULL;
+	ret = dma_resv_trylock(&fbo->base.base._resv);
+	WARN_ON(!ret);
+
 	if (fbo->base.resource) {
 		ttm_resource_set_bo(fbo->base.resource, &fbo->base);
 		bo->resource = NULL;
@@ -244,11 +249,6 @@ static int ttm_buffer_object_transfer(struct ttm_buffer_object *bo,
 		fbo->base.bulk_move = NULL;
 	}
 
-	dma_resv_init(&fbo->base.base._resv);
-	fbo->base.base.dev = NULL;
-	ret = dma_resv_trylock(&fbo->base.base._resv);
-	WARN_ON(!ret);
-
 	ret = dma_resv_reserve_fences(&fbo->base.base._resv, 1);
 	if (ret) {
 		kfree(fbo);
-- 
2.25.1

