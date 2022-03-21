Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0344E28E4
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 14:59:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0032F10E44A;
	Mon, 21 Mar 2022 13:59:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E0AE10E441;
 Mon, 21 Mar 2022 13:59:07 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id r13so5776289wrr.9;
 Mon, 21 Mar 2022 06:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5Tk77/oPiCnvHCb0roIWds+s2zsMP2yTCm3KPRHz8kU=;
 b=Dwd8keu0E8R774MBtIN8iJX4JIsphz38Kfef1gXRb4TunQGpL7xT6wLaxeJjdD4DTT
 wfZgA7SvBTMshcYTwkXS/qZI3vjfLByop/Aa2wwMGLEoRTVEhwtTPB3rODcasMszkiZs
 58N1976uYoyGJrEXlAsXPamSkZ87jLgpnzRusGoZAIWa5j0O9TUISVvvX0wJ1tEhkYsm
 T9o8k5uv6oDX4m1FXpu2iyUxjqJYqqn+yb85it/QAKhCcxpEfu2j+1Aq+xhnNtpnu9Dw
 W9Kwr8JyidkdzLqMWikD+IJniRbi8pVTuIATU2LmF2oHlKHa7i6d2kkg+CXAH+JCHaba
 fQ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5Tk77/oPiCnvHCb0roIWds+s2zsMP2yTCm3KPRHz8kU=;
 b=yH+NZgqnzYDIP40TZ8X+MVc+GChdlg56gfaNMa5V+ZUI3SodmWxHJzvup3tErF5Kc7
 SiW0HFP6CpSaLAkqpQ/VOsyVNA20B7xA6WXCPX6uddyo/DmsBCg71ROMtNDHn80OaoxU
 rdbeODgCUjISnXkyezJf3ejvxZYWJ7nXbYKc1jLNCDmyhppcruZXirR3RBa6pUVDnTny
 t/UetXQE7BWCp0At+EgKNrwP/8oY1uSAeWoVpq/NdzspGSVmgmhn8QzRC1X0OfPBEavO
 uDEDnj/lwEJmdJtfmvOUl19YXHla8CajraMQOCSdioZIhEs8ZyY18xwHfPJ1fh5RiTkQ
 Ktgg==
X-Gm-Message-State: AOAM533i/AorfDFH8e4V7iIc9mlCfD4nhFUkcEs6Sc6WAP1Cli77vagv
 pRoo+o90InGEU+GwDBYhiOE=
X-Google-Smtp-Source: ABdhPJyQjkABIMMUzmRzem8wXmrUWPZ4IeZFbT/WYvfYh8AYP6OFbfJZZwiIsTTJB2sO8i4gA6T6Vg==
X-Received: by 2002:a5d:5607:0:b0:203:fb6f:3c88 with SMTP id
 l7-20020a5d5607000000b00203fb6f3c88mr11470609wrv.261.1647871145884; 
 Mon, 21 Mar 2022 06:59:05 -0700 (PDT)
Received: from able.fritz.box (p5b0eab60.dip0.t-ipconnect.de. [91.14.171.96])
 by smtp.gmail.com with ESMTPSA id
 m3-20020a5d6243000000b001e33760776fsm13317640wrv.10.2022.03.21.06.59.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 06:59:05 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel.vetter@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 09/23] drm/amdgpu: use dma_resv_for_each_fence for CS
 workaround
Date: Mon, 21 Mar 2022 14:58:42 +0100
Message-Id: <20220321135856.1331-9-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220321135856.1331-1-christian.koenig@amd.com>
References: <20220321135856.1331-1-christian.koenig@amd.com>
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org
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
index 025748e9c772..02488a824fe8 100644
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

