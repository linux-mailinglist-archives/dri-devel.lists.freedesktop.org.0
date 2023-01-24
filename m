Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9DA6798B9
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 13:57:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2717310E678;
	Tue, 24 Jan 2023 12:57:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0E0D10E0B6;
 Tue, 24 Jan 2023 12:57:30 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id t18so970294wro.1;
 Tue, 24 Jan 2023 04:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=5bSse7tkaG3/+nuLEU+xi/PkacL4CwYjUBsJx8YNENg=;
 b=a53ElX8qX1f9Zkvq5hl5gu4XCqoom3QZvrANyW+htgYhdFhdQb5hmD2CkuF5sN6jX9
 xConofr5YkYemtrTn6wNRpcmymKH4ShPUpDwaNcxP9VyPzxgl75FCLJIE9fMLEkih5s1
 va9m9sl1SMBYCZaCOMxmjU52RFcvBo4tyr62xhr3n+GzL4nydwKCe0okWltGV7OpxiUo
 9J+fGZHTL1oCO8zpgdu2Ey+YooBkIse8qbyk8MM162vq/va023hre3VRw9+/CxFvmE+7
 ooWP3RILr7pQ0C3u2qCu8uPWKpQPyBwHvqLMaTlxUC2BugHmL5yxwxM0e1TpEgA7HVxN
 RPwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5bSse7tkaG3/+nuLEU+xi/PkacL4CwYjUBsJx8YNENg=;
 b=PzEPA4Nquxvg1EYU1BpYe2PIhTx3JBDXDxXQF8hS11IboUZ+jTrpDyhnIsoMW3KvjS
 nvOem5Yw+avJ9yDnGmmKXwvnRh6yNf129o8L8nO4HnZErjckBWS4KdvTWSljI/YeXpjq
 Il+LV2Cc9mNSfAWFeBR1lsqkD4+oiwf3zdXrx4xY4HzlrHgRtvsuA4OvMDQ3kXjo/uP2
 47oP0E6KWxaeucTxafBb8EfmQh4E1jm/8CDowTmbzZ/lt/qVTzopav9rlbvxAcc25kUx
 ObpzIcX8345MpgwHUVkwWBlXoH3aQ2v1Zg6D2v6OXOCAh3UWltnESVtNsALaVjc6W2/R
 4Sgg==
X-Gm-Message-State: AO0yUKWgYJKA2Ua4rs/dsQiZPGlam2dODpfaOXbdMNszvkSsm1HLWYPw
 FW7SwffkerQLE5jMh++cJyXzm4/Uk08=
X-Google-Smtp-Source: AK7set9wt7e56IVZtaX7eElobcmczL73nNvbjNIV4DiK0TKwedNf30MNvTyY/MCoD+8kvkOlBUwsiQ==
X-Received: by 2002:a5d:6a0c:0:b0:2bf:ae15:ac15 with SMTP id
 m12-20020a5d6a0c000000b002bfae15ac15mr2322429wru.62.1674565049248; 
 Tue, 24 Jan 2023 04:57:29 -0800 (PST)
Received: from able.fritz.box (p5b0ea2e7.dip0.t-ipconnect.de. [91.14.162.231])
 by smtp.gmail.com with ESMTPSA id
 z18-20020a056000111200b002366dd0e030sm1820927wrw.68.2023.01.24.04.57.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 04:57:28 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/5] drm/ttm: stop allocating dummy resources during BO
 creation
Date: Tue, 24 Jan 2023 13:57:23 +0100
Message-Id: <20230124125726.13323-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124125726.13323-1-christian.koenig@amd.com>
References: <20230124125726.13323-1-christian.koenig@amd.com>
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

That should not be necessary any more when drivers should at least be
able to handle the move without a resource.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 326a3d13a829..bb0c21c8caac 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -953,7 +953,6 @@ int ttm_bo_init_reserved(struct ttm_device *bdev, struct ttm_buffer_object *bo,
 			 struct sg_table *sg, struct dma_resv *resv,
 			 void (*destroy) (struct ttm_buffer_object *))
 {
-	static const struct ttm_place sys_mem = { .mem_type = TTM_PL_SYSTEM };
 	int ret;
 
 	kref_init(&bo->kref);
@@ -970,12 +969,6 @@ int ttm_bo_init_reserved(struct ttm_device *bdev, struct ttm_buffer_object *bo,
 		bo->base.resv = &bo->base._resv;
 	atomic_inc(&ttm_glob.bo_count);
 
-	ret = ttm_resource_alloc(bo, &sys_mem, &bo->resource);
-	if (unlikely(ret)) {
-		ttm_bo_put(bo);
-		return ret;
-	}
-
 	/*
 	 * For ttm_bo_type_device buffers, allocate
 	 * address space from the device.
-- 
2.34.1

