Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 094B041EA7A
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 12:07:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15C456EDC3;
	Fri,  1 Oct 2021 10:06:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB19D6EDBF;
 Fri,  1 Oct 2021 10:06:23 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 b192-20020a1c1bc9000000b0030cfaf18864so6345052wmb.4; 
 Fri, 01 Oct 2021 03:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3Ayg2vtlIruNC6YCBqNsxWyZiGKufnG6wJQHZ9LfwL8=;
 b=K00QXrgQxZygBJhqldjpdmwq0Z5FQMgADFlRfTssTKaJE3iovqCn0W1uWy/liFb27G
 sRmAAVDGt10vOqAJN0XqaYtC7FbPeUEetGV5wXz82aJ1DtKUYn9lbgVZn6BaKXJuKOML
 x8ozY++DPIsV7PPpHPTt9h9iinHbivfk3NL2ifluDQ8edJitoGOmN5bJPKiU1riKJqvU
 7rmcZWL3h1FqkMXqqcvTUv5ANiq3XXBvjTtN7DeD4CD1j1FcN6mW2FYMXurRwYJMibFk
 A3PYLakR7Nt52UVSXLXGwoSgLGCmH5XuwoUIEgI0I//exVwLlvDSMoIUatN/5zgo3MbS
 uPKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3Ayg2vtlIruNC6YCBqNsxWyZiGKufnG6wJQHZ9LfwL8=;
 b=34KSii7dCQroHtUdcSqKgWC5c0UEoVv5NujmKTubEEuoL9GM/ve0g7WxyMWeZtb3ww
 PSfGW/J1pE8HuUsq/CG8R43LEYFGI7HzBbT575wLiEcKwYHyeggvFjHEOAwi5OQdLcpA
 E1vPHpr1IKYxoH6uKSzeTQyjY2i4c0Kt7+njRgQDov0G15BpMltgVEsFPf1EPBCQQf2W
 WPKi9WUNAb5RYecx4k3LSYlzNt3AOL+7qIV0g2Vbe55kvojTSF4YR7oVEYTix0e+I/5C
 8xBaxoD7AecNwSDnPd3fSOxVVPQ2Uacy6I0kr36sXAFkqIDrATnMErEfivEiqONZBRlQ
 8kXQ==
X-Gm-Message-State: AOAM533Vn4tj0xM2CdDO3Sqa88gqbM3xpKxqEDnH9QETtrFk5NHR3Nh6
 KX5GF2Vq90FGrMH05F6Qe+w=
X-Google-Smtp-Source: ABdhPJzKkdtSodQ60XlSPJX3CpAQhUJ5wkBsX+8uyL9AlLN6Kemxmfa1pWO/5mr4TwWesK30VX9KFg==
X-Received: by 2002:a1c:7302:: with SMTP id d2mr3614174wmb.92.1633082782335;
 Fri, 01 Oct 2021 03:06:22 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 v17sm5746069wro.34.2021.10.01.03.06.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 03:06:22 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 10/28] drm/ttm: use the new iterator in ttm_bo_flush_all_fences
Date: Fri,  1 Oct 2021 12:05:52 +0200
Message-Id: <20211001100610.2899-11-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211001100610.2899-1-christian.koenig@amd.com>
References: <20211001100610.2899-1-christian.koenig@amd.com>
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

This is probably a fix since we didn't even grabed a reference to the
fences.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index d62b2013c367..3934ee225c78 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -269,23 +269,15 @@ static int ttm_bo_individualize_resv(struct ttm_buffer_object *bo)
 static void ttm_bo_flush_all_fences(struct ttm_buffer_object *bo)
 {
 	struct dma_resv *resv = &bo->base._resv;
-	struct dma_resv_list *fobj;
+	struct dma_resv_iter cursor;
 	struct dma_fence *fence;
-	int i;
-
-	rcu_read_lock();
-	fobj = dma_resv_shared_list(resv);
-	fence = dma_resv_excl_fence(resv);
-	if (fence && !fence->ops->signaled)
-		dma_fence_enable_sw_signaling(fence);
-
-	for (i = 0; fobj && i < fobj->shared_count; ++i) {
-		fence = rcu_dereference(fobj->shared[i]);
 
+	dma_resv_iter_begin(&cursor, resv, true);
+	dma_resv_for_each_fence_unlocked(&cursor, fence) {
 		if (!fence->ops->signaled)
 			dma_fence_enable_sw_signaling(fence);
 	}
-	rcu_read_unlock();
+	dma_resv_iter_end(&cursor);
 }
 
 /**
-- 
2.25.1

