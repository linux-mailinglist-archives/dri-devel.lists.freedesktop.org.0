Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 585EF39431C
	for <lists+dri-devel@lfdr.de>; Fri, 28 May 2021 15:00:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 844C46F5B3;
	Fri, 28 May 2021 13:00:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C106D6F5B3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 May 2021 13:00:43 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id b9so5139157ejc.13
 for <dri-devel@lists.freedesktop.org>; Fri, 28 May 2021 06:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aV4RNQFd9h1iMvLlTaI3u1NZqr/MIuuHCtQsn5vMoFA=;
 b=KSYt/MIMDDHjxNRlxNM0nco+Egb1hALhTW9691mB41GCisVpZH52W04Mr1ZaxMOF+N
 t39t5jbN6d9J4w5ytnSFsxZUl8tDNYwM2+yAZ5s8kFmelLPJkuvfacRKftKNGcFtUBLi
 0Q5b7zXkk+pOAU7czpr/KyKuxYl272/lDdh5wfmpNEa2EqgSxwQbiYwVr3Td01CuvtT0
 AFcPjaGfS2B1WJ0wr3rXj0rfWYewsJowMzE7k9uL62Erfr9T+6PBs/8OYJ8BtmhhxGYZ
 XLC2u4HBXsGR8JC9VzBlu4pynz5VACP2BeZvEDQt6a83n3c2LrDQFG5qWmQDHJcOwLgk
 7qcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aV4RNQFd9h1iMvLlTaI3u1NZqr/MIuuHCtQsn5vMoFA=;
 b=k9Rllz/f12iAyUrgjeM/Tez+meCHZ4Y95wmK2L4tFpYQRxt2tuJTkRTHGSXbuKChni
 WOoLOtdUclykQhn3firTN7r7f5WXj6TQSuftCyWmf9v8hx3VVEqXtvHTGwTpULoadiM0
 0RXKk2S+JMu+clFBoDCQTdLN3ZfqmIvRHE94QX5X+kf9vyEqrzssMrbSWgQsWp/C7ThK
 /LZT6cPw0NyVTXLLibdYrcq/WjB1u/2sQcYk4GK6ytiophWLcHtrAueDs37xin4aagx4
 quGABhUFgS8H0ygcBXaYmCNwxNbwOKdbovoq0dKMv5mA1vUIbKUFpdWhnhm8X5S8pz9O
 DkHg==
X-Gm-Message-State: AOAM531b7XwOKBBnGcflgrMaPPkGoljt4BjzM9anEHOq8b7zdjqWAQ8l
 U9ewmM3JDCBkPZlrsGuywUH4UzboY1I=
X-Google-Smtp-Source: ABdhPJzaHbDTp7Ne9Yr97LsHL+66923ilwHp8gtD0RJSFg8iA8XASTmWjuAvPlexg3gnALSaOdShww==
X-Received: by 2002:a17:907:a06b:: with SMTP id
 ia11mr8669984ejc.528.1622206842375; 
 Fri, 28 May 2021 06:00:42 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:c4d5:7196:c6bc:fb88])
 by smtp.gmail.com with ESMTPSA id t14sm2685542edv.27.2021.05.28.06.00.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 May 2021 06:00:42 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/ttm: fix deref of bo->ttm without holding the lock v2
Date: Fri, 28 May 2021 15:00:41 +0200
Message-Id: <20210528130041.1683-1-christian.koenig@amd.com>
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
Cc: thomas.hellstrom@linux.intel.com, Xinhui.Pan@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We need to grab the resv lock first before doing that check.

v2 (chk): simplify the change for -fixes

Signed-off-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c     | 5 ++++-
 drivers/gpu/drm/ttm/ttm_device.c | 8 +-------
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index cfd0b9292397..ebcffe794adb 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -1172,7 +1172,10 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
 	if (!ttm_bo_evict_swapout_allowable(bo, ctx, &locked, NULL))
 		return -EBUSY;
 
-	if (!ttm_bo_get_unless_zero(bo)) {
+	if (!bo->ttm || !ttm_tt_is_populated(bo->ttm) ||
+	    bo->ttm->page_flags & TTM_PAGE_FLAG_SG ||
+	    bo->ttm->page_flags & TTM_PAGE_FLAG_SWAPPED ||
+	    !ttm_bo_get_unless_zero(bo)) {
 		if (locked)
 			dma_resv_unlock(bo->base.resv);
 		return -EBUSY;
diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index a1dcf7d55c90..3d9c62b93e29 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -143,14 +143,8 @@ int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
 
 		for (j = 0; j < TTM_MAX_BO_PRIORITY; ++j) {
 			list_for_each_entry(bo, &man->lru[j], lru) {
-				uint32_t num_pages;
+				uint32_t num_pages = PFN_UP(bo->base.size);
 
-				if (!bo->ttm || !ttm_tt_is_populated(bo->ttm) ||
-				    bo->ttm->page_flags & TTM_PAGE_FLAG_SG ||
-				    bo->ttm->page_flags & TTM_PAGE_FLAG_SWAPPED)
-					continue;
-
-				num_pages = bo->ttm->num_pages;
 				ret = ttm_bo_swapout(bo, ctx, gfp_flags);
 				/* ttm_bo_swapout has dropped the lru_lock */
 				if (!ret)
-- 
2.25.1

