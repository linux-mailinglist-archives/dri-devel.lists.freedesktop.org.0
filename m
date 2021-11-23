Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFBF45A539
	for <lists+dri-devel@lfdr.de>; Tue, 23 Nov 2021 15:21:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29D4C6E55E;
	Tue, 23 Nov 2021 14:21:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 110F56E546
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Nov 2021 14:21:20 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id c4so39216656wrd.9
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Nov 2021 06:21:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7hlTa22QWarOC/D/GwKDXYcY+ynnKGNkNozyiGKICA8=;
 b=FCdGllJcVHqCf8Mmrtx2o7c65xOYOBgWAvUxQotbylOv8rRvg/Bq+IgN1z+q3ft3PG
 6M53Gq3PXfQiwwptvIh7434kf2II0sG1H/89bI2FFMyTEBuHwBtoMnhc3MzehUMsPJyt
 iez5pmeOKWR8S95xi4ThBz9xsuoLgfOSjHJmbbaTlV84X0YDkTjIz08b6sZlOhBymIAS
 kB24R7Ap1E+ADonJbwkmN7X7hUAAXUUNqGw9yEQ4cUr4XqamE5tBXVAlfPfZ9kjtdKkp
 pCf9WvPHz3qOgaa66apwZF2VTyjjoVrO1h25QN8PKOUrXgjWo76nWwIi1JzqYPhiWR7s
 5QqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7hlTa22QWarOC/D/GwKDXYcY+ynnKGNkNozyiGKICA8=;
 b=ORwyhb7pnx7x2UqAaXoSkB6WI1fXXJBtRI/ybRxX37gspcmkF4+VSPSIT+PT5n6sSe
 s6BStiOOamymaToXtk3fAQnZSn02hYkYkEAZDRClRybCxojdbH3secuDYoEhb73cz2tO
 yAieEffGH/wKw+qH3be4Tzq2s0eF/W/77RqIVA7s4hVcOVmSffERcF3UDQuCA+wlO432
 UsL/aT+ZTQkfiN4VshmK6qfTZ7G+kbIyDZKt+Hd0uigM+0rXI5P8ceFThL76ndYcTLVL
 rzPIW5uo3HkFUKsks2CrtPu0en0ZDwKe1WzQVSilJcsn+gWhi4XJqILa8aznxfyK2iRo
 Mjbg==
X-Gm-Message-State: AOAM530qoClSQCJGDYCNYfVv/JttFLhsKrTObajXlkMjZb0csSUb/7rL
 floW3007F8/SiI0F27zlOXA=
X-Google-Smtp-Source: ABdhPJwCq/sc20/U9XtjBTriweP61eqo5pPpAjSWR3OVyPxWa7Xtu5CDeOGg3nJ6y0Zp+4UlErbNFg==
X-Received: by 2002:a5d:47a1:: with SMTP id 1mr7407992wrb.436.1637677278619;
 Tue, 23 Nov 2021 06:21:18 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
 by smtp.gmail.com with ESMTPSA id t8sm1645928wmq.32.2021.11.23.06.21.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 06:21:18 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: sumit.semwal@linaro.org,
	daniel@ffwll.ch
Subject: [PATCH 01/26] drm/amdgpu: partially revert "svm bo enable_signal call
 condition"
Date: Tue, 23 Nov 2021 15:20:46 +0100
Message-Id: <20211123142111.3885-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211123142111.3885-1-christian.koenig@amd.com>
References: <20211123142111.3885-1-christian.koenig@amd.com>
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
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Partially revert commit 5f319c5c21b5909abb43d8aadc92a8aa549ee443.

First of all this is illegal use of RCU to call dma_fence_enable_sw_signaling()
since we don't hold a reference to the fence in question and can crash badly.

Then the code doesn't seem to have the intended effect since only the
exclusive fence is handled, but the KFD fences are always added as shared fence.

Only keep the handling to throw away the content of SVM BOs.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index eab4380f28e5..c15687ce67c4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -116,17 +116,8 @@ static void amdgpu_evict_flags(struct ttm_buffer_object *bo,
 
 	abo = ttm_to_amdgpu_bo(bo);
 	if (abo->flags & AMDGPU_AMDKFD_CREATE_SVM_BO) {
-		struct dma_fence *fence;
-		struct dma_resv *resv = &bo->base._resv;
-
-		rcu_read_lock();
-		fence = rcu_dereference(resv->fence_excl);
-		if (fence && !fence->ops->signaled)
-			dma_fence_enable_sw_signaling(fence);
-
 		placement->num_placement = 0;
 		placement->num_busy_placement = 0;
-		rcu_read_unlock();
 		return;
 	}
 
-- 
2.25.1

