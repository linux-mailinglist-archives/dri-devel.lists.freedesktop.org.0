Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8867B408C64
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 15:18:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CECA06ECA7;
	Mon, 13 Sep 2021 13:17:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D85F46E19B;
 Mon, 13 Sep 2021 13:17:27 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 c8-20020a7bc008000000b002e6e462e95fso6960777wmb.2; 
 Mon, 13 Sep 2021 06:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R6hl7Kj0yqQ18nUKlg1tjNnt1DaG6v6UQcKSpcEHFSE=;
 b=N1yh3KLMPT2mSLdGaNPMr4FcR2oS5TudmRGaIzNscK5H43U4M9/1H/Zjf1pdaepVW8
 mmP4W86H2+S2MuPhd6iRL1B1CF07HnuqLLDI4CkZPRL5M1O7HO/y7AaIsZbp3uShV/I3
 Zavhexb7l14JcmV5JgKo3j/16BkY6WUZZDf4Za2Uxi75ko8zgiy0arh4QncD/OfhJHk2
 c+6ml7UNDHKPzr48GZyzH+QzsHDwRk3HyQ4VubasIElM+5sfz3n3Scyla6SIqlKaA9Vz
 NMWd7qJBkaWGbrTW2pWQuf9M9CDkEzaRqkmdoVPQdoSm9SlcPHPvXoIH3G9BPmVCs/FF
 dbAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R6hl7Kj0yqQ18nUKlg1tjNnt1DaG6v6UQcKSpcEHFSE=;
 b=519gSrGgsbv3JGTGgVSCaonZMKllEdsUYNybgD0NRAfPk+aoTUl0hmO8gtq0Qx8vkC
 eQ8K/2CvMAp66KXED4h5vla/wytEFZRnoYYJ+P8WL7ikp1kbKhqajr4C5MtvBywuEC5z
 GsR5k+iY6qXE80X9cjfdO+pvXkL9FEiR8FG53Ywe2oHgBGib2FZVOHzoYuE2Gh4fDJxE
 bKqy0FvF/VVQSELnIzVAD4Mdk4dW69c8qR+iyuE6Hka+q64ImhTfXPEwDdzoPp/TL5EW
 RREYNTXYNfDSjvyzwDuomVRHR1ljuB3jOzO6eX5l89AfvM6vIDijk8SJtSqxII0cH2jn
 IE+A==
X-Gm-Message-State: AOAM5303ZeHcHOK2Rvlorhx4snsWMPqmGofQXMNvaeFVOwhg0oNaSuMt
 VYM2ZsW+/OfmdyALuVJ9lo0=
X-Google-Smtp-Source: ABdhPJzynpoOddBfRnKkBOAXF99mq6o+MV9PdUiMtxClU6QvSUdcyopeL7XqvPv6o1S/dqJefTgVHg==
X-Received: by 2002:a1c:9a12:: with SMTP id c18mr871983wme.51.1631539046477;
 Mon, 13 Sep 2021 06:17:26 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 h18sm7602834wrb.33.2021.09.13.06.17.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 06:17:26 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Cc: daniel@ffwll.ch,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 11/26] drm/radeon: use new iterator in radeon_sync_resv
Date: Mon, 13 Sep 2021 15:16:52 +0200
Message-Id: <20210913131707.45639-12-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210913131707.45639-1-christian.koenig@amd.com>
References: <20210913131707.45639-1-christian.koenig@amd.com>
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

Simplifying the code a bit.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/radeon/radeon_sync.c | 22 +++-------------------
 1 file changed, 3 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_sync.c b/drivers/gpu/drm/radeon/radeon_sync.c
index 9257b60144c4..14a4d8135bad 100644
--- a/drivers/gpu/drm/radeon/radeon_sync.c
+++ b/drivers/gpu/drm/radeon/radeon_sync.c
@@ -91,33 +91,17 @@ int radeon_sync_resv(struct radeon_device *rdev,
 		     struct dma_resv *resv,
 		     bool shared)
 {
-	struct dma_resv_list *flist;
-	struct dma_fence *f;
+	struct dma_resv_cursor cursor;
 	struct radeon_fence *fence;
-	unsigned i;
+	struct dma_fence *f;
 	int r = 0;
 
-	/* always sync to the exclusive fence */
-	f = dma_resv_excl_fence(resv);
-	fence = f ? to_radeon_fence(f) : NULL;
-	if (fence && fence->rdev == rdev)
-		radeon_sync_fence(sync, fence);
-	else if (f)
-		r = dma_fence_wait(f, true);
-
-	flist = dma_resv_shared_list(resv);
-	if (shared || !flist || r)
-		return r;
-
-	for (i = 0; i < flist->shared_count; ++i) {
-		f = rcu_dereference_protected(flist->shared[i],
-					      dma_resv_held(resv));
+	dma_resv_for_each_fence(resv, &cursor, shared, f) {
 		fence = to_radeon_fence(f);
 		if (fence && fence->rdev == rdev)
 			radeon_sync_fence(sync, fence);
 		else
 			r = dma_fence_wait(f, true);
-
 		if (r)
 			break;
 	}
-- 
2.25.1

