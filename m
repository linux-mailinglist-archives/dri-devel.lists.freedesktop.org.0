Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B144B2659
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 13:51:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB61410EBF3;
	Fri, 11 Feb 2022 12:50:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDC3D10EB99
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 12:50:15 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id a8so22696215ejc.8
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 04:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=B3EeKT8jgVo8Digjn1dxqu4KOtw+ELIqN+RGzTZ3mh8=;
 b=MvkNjXSZQMzC4ePO4XbfsmNMs/cjyzcKNJXaG97VydhSQkEk/uROk5UCPTXewvgzbf
 Ot0ZwGq/vi/TVDAFP2dbuk0l0Y/2dyOv/L7O837kmYpSCmxMt8yzDiRxEILrIg3/mdqe
 TqVjLzn2uDzAmD+pPxo2wGzChK8738L7kgvJi1dg9ZDg+mF6hTs5q3dVZ12Id0O9s4jQ
 Q0MN/2AKm7w29XN1OXHCGrOmqhBSzQoSHSAQUMMm7XyuLimeNXt66G577be4XL3uD1l1
 pwMwHpBOPIDiIv2HCtbDFPsbKFnvt//IfF1eaCypoy3bgXX908pZ7n94dW6yIZjRmPnE
 X4iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B3EeKT8jgVo8Digjn1dxqu4KOtw+ELIqN+RGzTZ3mh8=;
 b=HYmOLjzXTcmCXpBlZMbT9ugCkZEuMadEoZYFFxQqfgh/hIvNzu5oI9arHULav18MMh
 qKwsAv1X5NRTiw8B0f3pGdt/OD1sg7Om4P0Q9FU/GjBj81vMdadZ5pw1vEXLZcqTOo9a
 mDJQW2A7GpPmGE0lmzECbzdK+h7jVDgw75IBj3Eg4Mmlc0/91R/006w3h1bKVRwYTl6s
 Dcay2BxxZLbZZmSJhc3pwAdLGaQVpb/HrwgIesHQOsSK9MZZuqwu1kUqn9TnrodHj9XF
 FScHMupYMvZFijiB2zlKhQZ3AQKXAs1TRx2fpo7zp0Hh7S5CDrE2C8D3kna3jgtQDyV+
 64mQ==
X-Gm-Message-State: AOAM5303tIt1quy9ip6g23V0uMVhJbyYRblbtKbtrh3nmUGL+jYNfA1U
 uDTuqyBIl7RYhISRWipIerJLGFvcA6o=
X-Google-Smtp-Source: ABdhPJx+xQ+Ga2gLt/GxM8aUaH7c9FQdcWW6VrhtRU27Ud4JaBdv/J0itcLC7h7zzf4FWWPp1R8oKQ==
X-Received: by 2002:a17:906:73cc:: with SMTP id
 n12mr58119ejl.109.1644583814555; 
 Fri, 11 Feb 2022 04:50:14 -0800 (PST)
Received: from able.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id w22sm7868604ejc.137.2022.02.11.04.50.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 04:50:14 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, sumit.semwal@linaro.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH 09/23] drm/amdgpu: use dma_resv_for_each_fence for CS
 workaround
Date: Fri, 11 Feb 2022 13:49:49 +0100
Message-Id: <20220211125003.918447-10-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220211125003.918447-1-christian.koenig@amd.com>
References: <20220211125003.918447-1-christian.koenig@amd.com>
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

Get the write fence using dma_resv_for_each_fence instead of accessing
it manually.

Signed-off-by: Christian König <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index e8440d306496..ae83df4d0c10 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -1267,6 +1267,8 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
 	amdgpu_bo_list_for_each_entry(e, p->bo_list) {
 		struct dma_resv *resv = e->tv.bo->base.resv;
 		struct dma_fence_chain *chain = e->chain;
+		struct dma_resv_iter cursor;
+		struct dma_fence *fence;
 
 		if (!chain)
 			continue;
@@ -1276,9 +1278,10 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
 		 * submission in a dma_fence_chain and add it as exclusive
 		 * fence.
 		 */
-		dma_fence_chain_init(chain, dma_resv_excl_fence(resv),
-				     dma_fence_get(p->fence), 1);
-
+		dma_resv_for_each_fence(&cursor, resv, false, fence) {
+			break;
+		}
+		dma_fence_chain_init(chain, fence, dma_fence_get(p->fence), 1);
 		rcu_assign_pointer(resv->fence_excl, &chain->base);
 		e->chain = NULL;
 	}
-- 
2.25.1

