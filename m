Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E941B4DE6C1
	for <lists+dri-devel@lfdr.de>; Sat, 19 Mar 2022 08:31:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0989110EE17;
	Sat, 19 Mar 2022 07:31:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10B4210EE17
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Mar 2022 07:31:53 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id l8so11426460pfu.1
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Mar 2022 00:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=QzDLV0cCeAb+rv+fxj0RGmela1ApQSWzei1cauVEwFA=;
 b=LEVXNTeZJJ80nn6qVqrPjCAcSkk/56tEmue/nPO2/9UaeSJgvFWzXfIFRecH5iE4E3
 WNUnWW2FcXS6nhGW7Qz0yr19v5QN36AmkPB/xP0YyNJFTL/LNX9OXsZHHzfjtXozSPHu
 2rmlM7OOZD0bzRcGj+d0TSmQ9xZAMJyPvXgVmivjyNWZARh1l9uca/IA+QVR6Pr21xMw
 cr/rVjdkDM0PIP5m4rtUTDFQKYWxfqR5424AiBoIC5fmpk0Vw9KJkP0KIV92HQNhSzqI
 wfuEjNXXHmFnn1SHyvhh+zHf5Mzw3Yvb7j32ptAEfGJbB64TVCqp0RkQFFpJW9yutlW5
 66Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=QzDLV0cCeAb+rv+fxj0RGmela1ApQSWzei1cauVEwFA=;
 b=Ub54JvCN1njzBMGhkFz5Y97W0IRQPpLjq74YL3ruEOSISAzoFUXAXKTN4Zb4r8bjxt
 AWHUbis/gkQs7UhNNLwXi5ravqqKROOt8xDVqG74s9oLNqRSSpCoMuiv2/ljkpy8CUYf
 VQPEPKa7v41dLAFUF09uS5vMlZuj7QIiXi7XONZdTb9cRoQiFU44zA3H3NUYk/elO396
 jNmw2omZJJbMzUuNUq2VGj6kC1/9+t1aWw0l9qohG/SxX8Z2tMFIOv+UR6HccVNBfL6/
 zDuJ3cj8yrk8C8daibrx+vL+xMVMRIJw2COIwUkPsgTuJLcqLXEfq6qoV7eTTAxMBA5T
 +T/g==
X-Gm-Message-State: AOAM532Zx6spZA2ThcnwYQSpFsqfxaoJ31FhW5Zdo7+pkAzDkyaTPlYE
 3gdsWnTk1zqT4vtJslTgz7c=
X-Google-Smtp-Source: ABdhPJzdkru/fjwamVbwAzLqdlW6FlPJy3EfUcUF/R5TE/jyds0+NPhvAtL1tF5jNkXNCDVjjzP/2g==
X-Received: by 2002:a05:6a00:24cd:b0:4f7:2340:a6cf with SMTP id
 d13-20020a056a0024cd00b004f72340a6cfmr13894631pfv.36.1647675112656; 
 Sat, 19 Mar 2022 00:31:52 -0700 (PDT)
Received: from ubuntu.huawei.com ([119.3.119.18])
 by smtp.googlemail.com with ESMTPSA id
 s30-20020a056a001c5e00b004f73f27aa40sm11358882pfw.161.2022.03.19.00.31.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Mar 2022 00:31:52 -0700 (PDT)
From: Xiaomeng Tong <xiam0nd.tong@gmail.com>
To: christian.koenig@amd.com, ray.huang@amd.com, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH] ttm: remove check of list iterator against head outside the
 loop
Date: Sat, 19 Mar 2022 15:31:43 +0800
Message-Id: <20220319073143.30184-1-xiam0nd.tong@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Xiaomeng Tong <xiam0nd.tong@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When list_for_each_entry() completes the iteration over the whole list
without breaking the loop, the iterator value will be a bogus pointer
computed based on the head element.

While it is safe to use the pointer to determine if it was computed
based on the head element with &pos->member == head, using the iterator
variable after the loop should be avoided.

In preparation to limiting the scope of a list iterator to the list
traversal loop, use a dedicated pointer to point to the found element [1].

Link: https://lore.kernel.org/all/YhdfEIwI4EdtHdym@kroah.com/

Signed-off-by: Xiaomeng Tong <xiam0nd.tong@gmail.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index db3dc7ef5382..413b5bbf2414 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -673,36 +673,36 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
 			struct ww_acquire_ctx *ticket)
 {
 	struct ttm_buffer_object *bo = NULL, *busy_bo = NULL;
+	struct ttm_buffer_object *iter;
 	bool locked = false;
 	unsigned i;
 	int ret;
 
 	spin_lock(&bdev->lru_lock);
 	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i) {
-		list_for_each_entry(bo, &man->lru[i], lru) {
+		list_for_each_entry(iter, &man->lru[i], lru) {
 			bool busy;
 
-			if (!ttm_bo_evict_swapout_allowable(bo, ctx, place,
+			if (!ttm_bo_evict_swapout_allowable(iter, ctx, place,
 							    &locked, &busy)) {
 				if (busy && !busy_bo && ticket !=
-				    dma_resv_locking_ctx(bo->base.resv))
-					busy_bo = bo;
+				    dma_resv_locking_ctx(iter->base.resv))
+					busy_bo = iter;
 				continue;
 			}
 
-			if (!ttm_bo_get_unless_zero(bo)) {
+			if (!ttm_bo_get_unless_zero(iter)) {
 				if (locked)
-					dma_resv_unlock(bo->base.resv);
+					dma_resv_unlock(iter->base.resv);
 				continue;
 			}
+
+			bo = iter;
 			break;
 		}
 
-		/* If the inner loop terminated early, we have our candidate */
-		if (&bo->lru != &man->lru[i])
+		if (bo)
 			break;
-
-		bo = NULL;
 	}
 
 	if (!bo) {
-- 
2.17.1

