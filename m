Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B9C46EE80
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 17:57:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A9C110E7DB;
	Thu,  9 Dec 2021 16:53:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9333089259;
 Thu,  9 Dec 2021 10:23:38 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id q3so8818721wru.5;
 Thu, 09 Dec 2021 02:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hkfiLJGyW+4hoBCPLbE1sjvRxohQ9Mg7Yhv+aLe7Qy0=;
 b=VOtuIKbDPWfpq7dwGQJzYLiEp+VZiv8XugUB82VJde2Ce9Ko/PV0b+LPkqSoXved0e
 S/naAFCPf+1yFNAq1gbgZC2rwesJyjgUaQ2LxH5l0MEZQJP+FQzby6sNMhZ7VIAnFkKg
 jk08xT2mzDQeSIEsZqSxURMGxVp32140vD4znSyuifBUJajmctmq+iVV57XWJVWU95Hz
 LXpBVwAmRJUtZF/hSd//ZaenmMUoQucZCOYC/OUv36t6XLEXZA1HEbT8rOSx2hCyeh3M
 OGtnQMHtoHX7vwGrlOMBbXRzpCOh4Ka9qn1CvcccrG5qM8THus1rwHqye37O1y2+rdeU
 /6Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hkfiLJGyW+4hoBCPLbE1sjvRxohQ9Mg7Yhv+aLe7Qy0=;
 b=IXOp5FgKC4yhsvAix3x+CKEMIUilgGZFNLynbrCqwrZRScHLL8418ra0j1AA4F9446
 fz6nWEyixx2umK2yJnNtULfNDX05COIhxZkwxTYv6syCUj6yiNzD6skqBd3oI9uJ3oMw
 Y1GF06kn4h3Dh3lJ0wmvqfsE9jwEgqQWbLXN9VxP8ZxtnYZTMvuRfSgrEd7r4TU6oEp9
 EkH8vqVsobo9p5tTBaqvIpQ5WAA/g+zcKuts8CPbpaWp1UqU2H2uHZYgK6drTH81w7M0
 oO3znMk9Q0f1MKnhZjuj3tiYi66PpYAbGt1dYFp6P1Pr7EiTytWNEaUB+4xDg3wHwVev
 fazg==
X-Gm-Message-State: AOAM530NC9keKGMyPxy8kknjxOQCA7SMHrKVNGqL21rFNPzxfSIz/wz1
 yzW/0djaEyv2BPEeVheYDDM=
X-Google-Smtp-Source: ABdhPJxq3FUQ40Y21T6KqwMeSl/Bm0NcMAP/f46Kbx6IddtLToj54XeoeKoASFAHn1ma1Esui+/9Cg==
X-Received: by 2002:adf:a404:: with SMTP id d4mr5483648wra.556.1639045417130; 
 Thu, 09 Dec 2021 02:23:37 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id f13sm6475727wmq.29.2021.12.09.02.23.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 02:23:36 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dmoulding@me.com,
	sf@sfritsch.de,
	bskeggs@redhat.com
Subject: [PATCH] drm/nouveau: wait for the exclusive fence after the shared
 ones v2
Date: Thu,  9 Dec 2021 11:23:35 +0100
Message-Id: <20211209102335.18321-1-christian.koenig@amd.com>
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Always waiting for the exclusive fence resulted on some performance
regressions. So try to wait for the shared fences first, then the
exclusive fence should always be signaled already.

v2: fix incorrectly placed "(", add some comment why we do this.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/nouveau/nouveau_fence.c | 28 +++++++++++++------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index 05d0b3eb3690..0ae416aa76dc 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -353,15 +353,22 @@ nouveau_fence_sync(struct nouveau_bo *nvbo, struct nouveau_channel *chan, bool e
 
 		if (ret)
 			return ret;
-	}
 
-	fobj = dma_resv_shared_list(resv);
-	fence = dma_resv_excl_fence(resv);
+		fobj = NULL;
+	} else {
+		fobj = dma_resv_shared_list(resv);
+	}
 
-	if (fence) {
+	/* Waiting for the exclusive fence first causes performance regressions
+	 * under some circumstances. So manually wait for the shared ones first.
+	 */
+	for (i = 0; i < (fobj ? fobj->shared_count : 0) && !ret; ++i) {
 		struct nouveau_channel *prev = NULL;
 		bool must_wait = true;
 
+		fence = rcu_dereference_protected(fobj->shared[i],
+						dma_resv_held(resv));
+
 		f = nouveau_local_fence(fence, chan->drm);
 		if (f) {
 			rcu_read_lock();
@@ -373,20 +380,13 @@ nouveau_fence_sync(struct nouveau_bo *nvbo, struct nouveau_channel *chan, bool e
 
 		if (must_wait)
 			ret = dma_fence_wait(fence, intr);
-
-		return ret;
 	}
 
-	if (!exclusive || !fobj)
-		return ret;
-
-	for (i = 0; i < fobj->shared_count && !ret; ++i) {
+	fence = dma_resv_excl_fence(resv);
+	if (fence) {
 		struct nouveau_channel *prev = NULL;
 		bool must_wait = true;
 
-		fence = rcu_dereference_protected(fobj->shared[i],
-						dma_resv_held(resv));
-
 		f = nouveau_local_fence(fence, chan->drm);
 		if (f) {
 			rcu_read_lock();
@@ -398,6 +398,8 @@ nouveau_fence_sync(struct nouveau_bo *nvbo, struct nouveau_channel *chan, bool e
 
 		if (must_wait)
 			ret = dma_fence_wait(fence, intr);
+
+		return ret;
 	}
 
 	return ret;
-- 
2.25.1

