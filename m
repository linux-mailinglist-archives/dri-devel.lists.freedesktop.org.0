Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7B63B9F9F
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 13:16:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11F616E122;
	Fri,  2 Jul 2021 11:16:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B54256E106
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jul 2021 11:16:47 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id w13so12821420edc.0
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Jul 2021 04:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ND7KwC2J9bqQZCM3dXcypP939eYSZ8A7ifwwevA1684=;
 b=T7j2GMqBtr1BYkg2Ecz4L4GrO0/ALRPPDNMRYXUooaau3hj58MqTnosAInEic+XVEm
 Cpj2QrNlQL9FCYCWLQXcnJUDX53U9B7JXdjja2jcpjyGN+ZXiVB8xFfFsaonmxPJCUCj
 QRwkj6R50Pw5Umj/7dL3gpH1Saplo6OSqALYrN7c9ne3820VrFZFLQjZkwkF1ON7NZeo
 QWqAlCBMC2e7aIIwOUOqJhZvdCWPPycuy+r63/+K0Y57Me7ltKvKQ/SHsnqGZb6HeeXN
 KE00r+YzQhzk2h1DAtKaLbZul0R4dnQuDHj9f1V7gWnvKAqQ1Bw89HhBxp78iTEz+Kei
 YkVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ND7KwC2J9bqQZCM3dXcypP939eYSZ8A7ifwwevA1684=;
 b=FG36ilorLCZSqzOGr2g0rzUb/cdQEKg8yekFKIuxjOC435N8rQXmo2JhSK9mQwRECv
 JoLlaB2aDyTxWt0WTlaRd7m2DorxSUxmcD0fQ+pWJabKmtNHWwx3OE+cSrdQDvtArfqk
 vFg9bfXv7kWZJYSlLqdN4WPx9AniLCd1FHQkvY3TxxKmGidn9eao0Ukxb4I7vI9S0ERe
 utJtnnSQwTzGYsk8vz6drCyBzQmHDLFO4Wadfse+vJHpUNgZFWip3M4gNgdMGdNOQKTY
 9fYQ5umnO29vX8gd9Jyx19p6cbVf2q0LnJ4S9IRwoT+uN1tp1zQX8kvcAfJNcfU4GYAX
 /oIw==
X-Gm-Message-State: AOAM531FBHQ16STla1otXnIER+bhZ5GFBxuqEG9hcPHiSFhMhXsvd5kc
 Zma88nWDMj8IKMtwlnJX4qd0dC1pEaU=
X-Google-Smtp-Source: ABdhPJztuzS49wqVastF48sJJFLKxMx65irXCJVOMSe/P4fou7tJGkGS3p5FHSugavPV492jep58rA==
X-Received: by 2002:a50:f692:: with SMTP id d18mr5992965edn.202.1625224606436; 
 Fri, 02 Jul 2021 04:16:46 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:9bc7:a922:a595:15bd])
 by smtp.gmail.com with ESMTPSA id g21sm937286ejf.25.2021.07.02.04.16.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 04:16:46 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org,
	daniel.vetter@ffwll.ch
Subject: [PATCH 3/4] drm/nouveau: always wait for the exclusive fence
Date: Fri,  2 Jul 2021 13:16:41 +0200
Message-Id: <20210702111642.17259-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210702111642.17259-1-christian.koenig@amd.com>
References: <20210702111642.17259-1-christian.koenig@amd.com>
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

Drivers also need to to sync to the exclusive fence when
a shared one is present.

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

