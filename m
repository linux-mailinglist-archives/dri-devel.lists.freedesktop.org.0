Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A44C051FDA3
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 15:10:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 657EE10F19B;
	Mon,  9 May 2022 13:10:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB76E10F175
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 13:10:05 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id w4so19352043wrg.12
 for <dri-devel@lists.freedesktop.org>; Mon, 09 May 2022 06:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z82DEt/MpKknW8qHYlosJQTAdFztO/fEKh/wJV8RWKs=;
 b=IWtzSeoNrMtmksuiTUGc1RZLE1JZCQ72Pg/ITp7OAAySu8cI1MHnmTQu292mHhihqK
 v5vF/osnVWyFkF/Q/XovyL4WGLsMZZdk78poY0GZ/QVleGmGuUJWInBrjv+QBsl6OdJg
 q4GsQdWTDvS/VZk9t/oEr6TnUFnrBdLXriOQ2U06cOHcxQdGMf+xmuxOECiji5DuAwzG
 UdQcssJ++LivSJw4RHzV4XCspxgqUkPzGBwc/BEcI1mmnOtgZhle+erjuD2TiYkRym+I
 syDgpKqMmFhacaGyDfCi4EITfYsdzqP8HcsU7oEGj86QubpjBx4F/DX/xgfbIeaKjhUY
 sCpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z82DEt/MpKknW8qHYlosJQTAdFztO/fEKh/wJV8RWKs=;
 b=lQRrSm8iaumn/BpQ4feN4LdXSlNtfs37O2PU0IwSkHRV5SGFMPcvWDz/8pXtW1U7o3
 YMu38T/IgyyG0goLYMj3MzLtQMPE1X7ss1kgMO6M87TuZbo+YdtfjOyVWaU5QvVueeTQ
 63bHcEG/sjgaT6d4uZFOxEbh9Q6lz0hztPMn004gpm6u02N6uKi1FBFC5X7RAQsVP47p
 +X6rIVN+g6IgMViqDquW9XtlGP0YMtl3FsSdXQDnLveMXzI1PVxWowzlgAFa2yB3gGw6
 zNuEStT8P1QP23pOzm4AWfHOYRGx1GUwvccw9E9J3yOzo2+kx3HB95pPVLgc/EviOS9V
 j9OA==
X-Gm-Message-State: AOAM530vJRDR/xYJQqDPaeVF+DfS36tbvbTNCeM4xwM6erUB52+VO3Mu
 dnd2EZoPZ4Oy5K5Nj1Qu2+gZIIG6Mgw=
X-Google-Smtp-Source: ABdhPJwy2byzHZfxIPiQWG/SIqVyOjsjynczH5mLCplTIJf8CZLPX/pAk51DFtvLRCJx2apFXCTAuw==
X-Received: by 2002:a5d:64cb:0:b0:20c:6b0b:b052 with SMTP id
 f11-20020a5d64cb000000b0020c6b0bb052mr14004076wri.556.1652101804377; 
 Mon, 09 May 2022 06:10:04 -0700 (PDT)
Received: from able.fritz.box (p57b0b3fd.dip0.t-ipconnect.de. [87.176.179.253])
 by smtp.gmail.com with ESMTPSA id
 t16-20020a05600c2f9000b003942a244f50sm18683385wmn.41.2022.05.09.06.10.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 06:10:03 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: bob.beckett@collabora.com, dri-devel@lists.freedesktop.org, daniel@ffwll.ch
Subject: [PATCH 09/11] drm/ttm: audit bo->resource usage
Date: Mon,  9 May 2022 15:09:49 +0200
Message-Id: <20220509130951.486344-10-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220509130951.486344-1-christian.koenig@amd.com>
References: <20220509130951.486344-1-christian.koenig@amd.com>
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

Allow BOs to exist without backing store.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 2b01cb30694a..a55564c8b57c 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -117,12 +117,13 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
 				  struct ttm_operation_ctx *ctx,
 				  struct ttm_place *hop)
 {
-	struct ttm_resource_manager *old_man, *new_man;
 	struct ttm_device *bdev = bo->bdev;
+	bool old_use_tt, new_use_tt;
 	int ret;
 
-	old_man = ttm_manager_type(bdev, bo->resource->mem_type);
-	new_man = ttm_manager_type(bdev, mem->mem_type);
+	old_use_tt = bo->resource &&
+		ttm_manager_type(bdev, bo->resource->mem_type)->use_tt;
+	new_use_tt = ttm_manager_type(bdev, mem->mem_type)->use_tt;
 
 	ttm_bo_unmap_virtual(bo);
 
@@ -130,11 +131,11 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
 	 * Create and bind a ttm if required.
 	 */
 
-	if (new_man->use_tt) {
+	if (new_use_tt) {
 		/* Zero init the new TTM structure if the old location should
 		 * have used one as well.
 		 */
-		ret = ttm_tt_create(bo, old_man->use_tt);
+		ret = ttm_tt_create(bo, old_use_tt);
 		if (ret)
 			goto out_err;
 
@@ -160,8 +161,7 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
 	return 0;
 
 out_err:
-	new_man = ttm_manager_type(bdev, bo->resource->mem_type);
-	if (!new_man->use_tt)
+	if (!old_use_tt)
 		ttm_bo_tt_destroy(bo);
 
 	return ret;
@@ -898,7 +898,7 @@ int ttm_bo_validate(struct ttm_buffer_object *bo,
 	/*
 	 * Check whether we need to move buffer.
 	 */
-	if (!ttm_resource_compat(bo->resource, placement)) {
+	if (!bo->resource || !ttm_resource_compat(bo->resource, placement)) {
 		ret = ttm_bo_move_buffer(bo, placement, ctx);
 		if (ret)
 			return ret;
-- 
2.25.1

