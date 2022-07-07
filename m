Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D995569FBF
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 12:25:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37B8B14AEDF;
	Thu,  7 Jul 2022 10:25:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37A121131A8;
 Thu,  7 Jul 2022 10:25:00 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id f2so20265858wrr.6;
 Thu, 07 Jul 2022 03:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gmsLTjbvmHAI5Qt/fKzn1ZA7X8A0fRrENrMR1C3tdAY=;
 b=gbIbxd/6sRrwuA4araxry5QTbXHLjKRgLNuFh2MzXZwo08dO4hDtyvg/iysjWCFIVY
 CjygSqpT+Lm4aE6cFscHBnouvuMkvx3yRlpUx0fSyrbDIb4niJEYI3GO4heNKCDAkZsa
 /FcXPsvw56XPPSREEMN8PgJfee43UKMmESrD6U2WGtHyk50cdpTHc+NFTPWk983Jr7n7
 NXGNfud9FfbwX85/G4Ho2B3ZP5bwDDo9QOVdS/XQpFzT2vry4ArHktwGrewCh60uo+kz
 xzu/CVaQnhpFw/tLiSHb97PjAB13mKZC/dZwmMpz28BoKI+rBW2GeW86fRHmsCbJnKqM
 2vDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gmsLTjbvmHAI5Qt/fKzn1ZA7X8A0fRrENrMR1C3tdAY=;
 b=cEcd85IQ6s39hFz3VQikRi09CbZ2VohqBYfVTZsTvLGlU5RABmWzXtyiPwKGb+/3Il
 uiGDqYWyGI9bOYSKqLjLXrpkTH3uaJruhzlMX2/4bAk6M6fSWAH0z1n+rmUdffWmBuU8
 svYDDDe+/A9iVDfWXAjw7lsUOZ6F45wkpc0n55yYfRqzc2AzOI06lKlX6UmvkQvRm9v9
 +jnTF6ObuwWbqHybqJS5419uH2supbW4IFnfBILWNaDL4h9gWpUlZj4tj7gJJpqHr+Be
 9kme8YQMVUrmQ81GAli5ZW658hGMVQ0kdPH4UzVLFDa3uIOz9Vp/22UbHT8XQLPoW687
 733Q==
X-Gm-Message-State: AJIora8SDV6p4jfmhDkwhE6ItWyo6sX8kGO/xINqDD2Clv0LRudXDoWV
 b6n9K4c5EC16I7Cix3oD8Rle31yVfGE=
X-Google-Smtp-Source: AGRyM1syGpQLXkF/DpblswCcKG91/inbkVvL/NKkt9tNHxoolryvaG4hE3+Z2WSShXieJLhNM+q7wA==
X-Received: by 2002:a5d:6a88:0:b0:21d:6ee4:1fb1 with SMTP id
 s8-20020a5d6a88000000b0021d6ee41fb1mr15338055wru.249.1657189498760; 
 Thu, 07 Jul 2022 03:24:58 -0700 (PDT)
Received: from able.fritz.box (p57b0bd9f.dip0.t-ipconnect.de. [87.176.189.159])
 by smtp.gmail.com with ESMTPSA id
 e10-20020a05600c4e4a00b00397402ae674sm20091950wmq.11.2022.07.07.03.24.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 03:24:58 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: [PATCH 3/6] drm/nouveau: audit bo->resource usage
Date: Thu,  7 Jul 2022 12:24:50 +0200
Message-Id: <20220707102453.3633-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220707102453.3633-1-christian.koenig@amd.com>
References: <20220707102453.3633-1-christian.koenig@amd.com>
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

Make sure we can at least move and release BOs without backing store.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 92cd19021084..f83fb43b2e44 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -1006,7 +1006,8 @@ nouveau_bo_move(struct ttm_buffer_object *bo, bool evict,
 	}
 
 	/* Fake bo copy. */
-	if (old_reg->mem_type == TTM_PL_SYSTEM && !bo->ttm) {
+	if (!old_reg || (old_reg->mem_type == TTM_PL_SYSTEM &&
+			 !bo->ttm)) {
 		ttm_bo_move_null(bo, new_reg);
 		goto out;
 	}
-- 
2.25.1

