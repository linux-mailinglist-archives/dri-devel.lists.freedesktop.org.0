Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CC640D8D0
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 13:31:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31DC288AEF;
	Thu, 16 Sep 2021 11:31:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A1C06ECF6;
 Thu, 16 Sep 2021 11:30:57 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id u18so7190039wrg.5;
 Thu, 16 Sep 2021 04:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KcGBgTqPip6/dZ1AoQyg0Edp54HfoO6axaUUT+kNZpA=;
 b=m+pyF6jf44i4RFjZqLoivuaADocbP/v5QWB06GPgd1/roGp9WvfNytXzKBle2L6Zg+
 mXyqPQlUVZyn0Tdrle2F+DVwrvdzCxUtK0OykRLWv+xUYlynlOx+zb44EcfwYz08Nzql
 547FX8c15NPftjpGuJdDtv2A3mDNnPbwuFkk4dQdYh+Yy0wV2b6Ruqsqi3nqJzWJE6XD
 u5fMcQuxLDZvK2qot1O5pzPZFlu9OvFq2BE+GEldPNlXvOrlP3dmgIyQoEhRbfBpONgZ
 z3xM4JTg6fRcIB55W+je3nazucPxWZqTLDtOQfMEBWvnUFiN8fjc3GJ5qqB1Kk3a+7Ry
 fwVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KcGBgTqPip6/dZ1AoQyg0Edp54HfoO6axaUUT+kNZpA=;
 b=F5vTyTFj7pbn5lMVOmdhA1BjSQl7AHITipwZZDSzmW2bS0drSMaeaXT2NB/xcT2bI3
 Xg0jttb3E9VBj3I2+dvyeeVfdOqtu2X3xCQ+SxE3qtcy++P/m9qtL9aeQ5p002brfP4J
 5NkP0B3X325qi9Iu0Uk+7Y4UTPNFDrMcMXmVXIONnjq1DGnd3K1qwULxnmGfz6xCoEbW
 tosKe3DsqX6mpGCgq8j9dPserFwK5Pb4NzkRgdq59CEMRJZfV0IXxbRgt/tJZTDEThRR
 XlR3Hkl7QvMsmtgfsMaOOO17gJ9Hjykx7Zhb9WLW1ndnesktqzZUK7EKCC6LVJZsKlGe
 K3sQ==
X-Gm-Message-State: AOAM531kZSSvGphVVx7lBXyScnTYbT963SIRpiObexSmMxgc39UEo3yV
 HLBjeJjJIX/eiF8zAChnMbkOW0wVwE8mhmR1
X-Google-Smtp-Source: ABdhPJzituzq4pK7OzQD32lgKLYW+PH2DCitMAhYPsU+lk7Ipv+2utGYpP1F4S0XgzV0ZuuuDedxMQ==
X-Received: by 2002:a5d:6283:: with SMTP id k3mr5550180wru.324.1631791855784; 
 Thu, 16 Sep 2021 04:30:55 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 c17sm3803674wrn.54.2021.09.16.04.30.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 04:30:55 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 11/26] drm/radeon: use new iterator in radeon_sync_resv
Date: Thu, 16 Sep 2021 13:30:27 +0200
Message-Id: <20210916113042.3631-12-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210916113042.3631-1-christian.koenig@amd.com>
References: <20210916113042.3631-1-christian.koenig@amd.com>
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
index 9257b60144c4..23fa98dfe04b 100644
--- a/drivers/gpu/drm/radeon/radeon_sync.c
+++ b/drivers/gpu/drm/radeon/radeon_sync.c
@@ -91,33 +91,17 @@ int radeon_sync_resv(struct radeon_device *rdev,
 		     struct dma_resv *resv,
 		     bool shared)
 {
-	struct dma_resv_list *flist;
-	struct dma_fence *f;
+	struct dma_resv_iter cursor;
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

