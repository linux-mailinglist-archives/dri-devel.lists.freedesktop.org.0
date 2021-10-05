Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1F7422540
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 13:38:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FBF26EB62;
	Tue,  5 Oct 2021 11:38:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 407496EB5D;
 Tue,  5 Oct 2021 11:37:57 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 m14-20020a05600c3b0e00b0030d4dffd04fso2644826wms.3; 
 Tue, 05 Oct 2021 04:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yabWm1MzZV7BE4HotZc9CHXB10OboyyVoWyddM9btKw=;
 b=TSeRJ+qkpA1eghV4lfrllybunGX8WejkpRoxqq543rLTeKa7DZHVn2wR1tASvGcF+2
 YSnfrhiqlKVwwq3BwbMQ8DZBMrrqtJVajopWt5DmbRT2UhlzHcEPKYiydW11gfVTNyU6
 8itx/NTbG2pZpcn4uY+lOPwXhQohZpgaiKl5R1mKTyzcEUjPhQJOUF69bLIlyWrHZY3c
 ITPm+xuWN/jJ/Prvdb4ygpwtdCHFOHsrYXNV5DDV7gR42jBubLvvLN3bk+cSkpQsDZhD
 HqnnQjO/NQ7RIre8RhRO/fCRaTpelP0GJ5hg1J0rEHuydghCZvFou7sMwLraORdyoo45
 0J9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yabWm1MzZV7BE4HotZc9CHXB10OboyyVoWyddM9btKw=;
 b=6NIYx5Q2I47iHd9OhnXjE4lISxPo5r+5dgb3D9gTvgVxDPSeuULoBomFBGDH0kwcyQ
 x1USjt8id/8YcyomXfnlf5NpGktx5J8GDYFwc8BBKcMgDKXW/lHooMQjvu6/tfydVh2p
 n3eoQyxoXJrzN5+HCwHrhnvc1Ku3h9rBLqoRIRp/w1WW/DWPIU73RfkL0XKanxKVnzca
 kbJss6YU5VNOPcDWcrgfZbTE9Q7hiHCD99O0GjFz8SYpD93Nvk61O/qQ0x3S7yXvzZ+T
 isDq2M6Hm5Jqgj4iyT3Uj1nJl9BP4lfieU254UhnkseOdVDFXiSvftDmwAfveKJe9TGs
 Fg3g==
X-Gm-Message-State: AOAM532OiBkgklMnSntf6alolkh87TozSuh1t1NSDQi3oufhpV2qXXEs
 MYrgm79VkvyZLdxU9HudYi7R1GfwrMs=
X-Google-Smtp-Source: ABdhPJxEKoCjAGY0f/BN1VErxnsB/ujyvHpiYNyMr6i4pPYMxemcnlX3MniDy/X3LY0S+x/nRkMabQ==
X-Received: by 2002:a7b:c5d8:: with SMTP id n24mr2887218wmk.51.1633433875811; 
 Tue, 05 Oct 2021 04:37:55 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 c5sm1739912wml.9.2021.10.05.04.37.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 04:37:55 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 12/28] drm/amdgpu: use new iterator in
 amdgpu_ttm_bo_eviction_valuable
Date: Tue,  5 Oct 2021 13:37:26 +0200
Message-Id: <20211005113742.1101-13-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211005113742.1101-1-christian.koenig@amd.com>
References: <20211005113742.1101-1-christian.koenig@amd.com>
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
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index e8d70b6e6737..722e3c9e8882 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1345,10 +1345,9 @@ static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
 					    const struct ttm_place *place)
 {
 	unsigned long num_pages = bo->resource->num_pages;
+	struct dma_resv_iter resv_cursor;
 	struct amdgpu_res_cursor cursor;
-	struct dma_resv_list *flist;
 	struct dma_fence *f;
-	int i;
 
 	/* Swapout? */
 	if (bo->resource->mem_type == TTM_PL_SYSTEM)
@@ -1362,14 +1361,9 @@ static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
 	 * If true, then return false as any KFD process needs all its BOs to
 	 * be resident to run successfully
 	 */
-	flist = dma_resv_shared_list(bo->base.resv);
-	if (flist) {
-		for (i = 0; i < flist->shared_count; ++i) {
-			f = rcu_dereference_protected(flist->shared[i],
-				dma_resv_held(bo->base.resv));
-			if (amdkfd_fence_check_mm(f, current->mm))
-				return false;
-		}
+	dma_resv_for_each_fence(&resv_cursor, bo->base.resv, true, f) {
+		if (amdkfd_fence_check_mm(f, current->mm))
+			return false;
 	}
 
 	switch (bo->resource->mem_type) {
-- 
2.25.1

