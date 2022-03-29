Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCE84EABD9
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 13:03:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FD1310EFF0;
	Tue, 29 Mar 2022 11:03:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E23C10EFF2
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 11:03:01 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id y10so20224761edv.7
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 04:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K4POfuXq1sgO+BiXtrxvqjnXvEHIsFfGoMYbarNVCzo=;
 b=H6vNdqu9ZHmEJnvdjo2b7eaFiGygZGY1xbGTvByGLweAFYtRp5xXs7/Gql+imi5qC8
 DjNc5jEn8r7oLbciVYANgHLXG/RnDrHEu7NKov7XcFpFdPST91SvI77MJ5fcJa47cAd5
 luwXxLZM/fiCXRoFI383mqDSrm5A8tHO+11/tDdvSuUYRnt7q10W1HBLYUtrlbxa2dR2
 kHM8n6DRh5JxJ43XrQrRVqVM0pmQr2bWwoYEKrybV1wyPXo/Yq+CETidtNdi+1hy2scs
 VD4AJRIamYfxoC8tizuEHKain+7Ea5fdVcd4uqjfpzubMF8L1RICDQ22SKR04dKvpvWb
 wg6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K4POfuXq1sgO+BiXtrxvqjnXvEHIsFfGoMYbarNVCzo=;
 b=mym/e9skk+9umh71M+LzmHAFAFJqxZ7BQf1Gdzeah/97BqT/u5E5MhxkcfA7GtT5kN
 s2NF1QjUcLVn2xkxJmhhGhxEks25vxwOHQWbDouxd/XqtnWvDw1ja0cgwQnLJj46ZgXK
 Mfh8CVIosUuyK/MWlm8/sO9/uY1o/U5b8vMh401oX4zLnQe/yXZ9u5UY1prKpDnb/EAn
 hJDZFVfAAJyETMdMvx9DXx/atbcH9F4T44LA8iAO2YbRhAwO7T2hfY0HTADuavo5dw/z
 Wbb5gdFcigUuyuxR6YL2DC7yH/2AEyKOnMk2qy3mOJFovmgpYYiteeKsigI3bNYlbdNT
 aSeQ==
X-Gm-Message-State: AOAM5306vpqnjeaq4LYOzzJQ1lbQlyOn3yPz1xrX1LlO+jYeguK+ig5f
 92J84PQZ9zC+bEEpAFqedUjmPyhwf6c=
X-Google-Smtp-Source: ABdhPJy/16GJhzOgy+Jl5TrBK6QJBgubCYjgCthcejE3yH6GZ8XySoNyObQ1klvNM6v5CP9U5lycXg==
X-Received: by 2002:a05:6402:34d6:b0:419:4dc2:91c5 with SMTP id
 w22-20020a05640234d600b004194dc291c5mr3806688edc.329.1648551780161; 
 Tue, 29 Mar 2022 04:03:00 -0700 (PDT)
Received: from able.fritz.box (p5b0eab60.dip0.t-ipconnect.de. [91.14.171.96])
 by smtp.gmail.com with ESMTPSA id
 h20-20020a1709060f5400b006d6d54b9203sm6958402ejj.38.2022.03.29.04.02.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 04:02:59 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: bob.beckett@collabora.com,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 09/11] drm/ttm: audit bo->resource usage
Date: Tue, 29 Mar 2022 13:02:41 +0200
Message-Id: <20220329110243.6335-10-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220329110243.6335-1-christian.koenig@amd.com>
References: <20220329110243.6335-1-christian.koenig@amd.com>
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
index b7e259245f82..bd001fdde9fb 100644
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
 
@@ -156,8 +157,7 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
 	return 0;
 
 out_err:
-	new_man = ttm_manager_type(bdev, bo->resource->mem_type);
-	if (!new_man->use_tt)
+	if (!old_use_tt)
 		ttm_bo_tt_destroy(bo);
 
 	return ret;
@@ -900,7 +900,7 @@ int ttm_bo_validate(struct ttm_buffer_object *bo,
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

