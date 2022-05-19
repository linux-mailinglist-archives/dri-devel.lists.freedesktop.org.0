Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF61E52CFE7
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 11:55:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12C0811B33D;
	Thu, 19 May 2022 09:55:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4167E11B32D;
 Thu, 19 May 2022 09:55:21 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id n23so6399275edy.0;
 Thu, 19 May 2022 02:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z82DEt/MpKknW8qHYlosJQTAdFztO/fEKh/wJV8RWKs=;
 b=AeLktnJ/D27ap0dS1jHVWwd5eFx00SkFo+YfoAiGUygADdUV4Gy1AGNF50X2vi7vEI
 0igQxieDuDCOE26rGt/x7erfuH1OJNcFzygmXFg+VAV7HsbxFH+Qoihlt/xrSAOBQ5h0
 Y86PZArWkTqOejVmJCI1hxUfW+OHGyww9UBbZXaVES9tfK/p9JmXQQSHwrF0PSIZsQQx
 4YDunpsM/XAZKWqmeEZsTYQEgNFK3D+JBmljrayZSyKk6+PZIS87//WIZOb4qqnJaTIp
 4Xh3i2Qi5PovJgEujIBSlkSEsawMu9PkZonY+mKx6jqfdFxYgVyMB9oU569MEP+TIXxY
 PutQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z82DEt/MpKknW8qHYlosJQTAdFztO/fEKh/wJV8RWKs=;
 b=gC5ZYUfeLaqvMpnzXNsOMQBTEyvReQWV8xr1wFTYLcwXry879BG+kHq+KNRANfpots
 oknbEW2tZPMXDJDsmOOvfTHjKyogk0M5IkVRlAQCvuKbokwRVRQC3d77b6FvWEJYj06i
 +GxSwrHvMPwGgt+YURIAUNCvmlMtan62n7QaEqBIU+XI1nEHrkZ9sYu1cT0u1mGctKy8
 ZQr2pnGw8YX8O1PJwCPM918C60/y91S/XBlwJ9yVq4euAg9bSW9Ja587g8L4m1lWOze6
 IAGfChwgASsJH/bMap6EpSPRHfC+d3lTWTs2aPDUeUgqnasMUUX1UOSyzB7mR0ol5cQT
 MG1A==
X-Gm-Message-State: AOAM5329j7mDs7e4vd5iXz1oU8/7rMfHJbSltu/uQN5jgWyVRmV8QkKo
 hBDNZRIVCfdUIVAal/pCNRyvK0OiLLA=
X-Google-Smtp-Source: ABdhPJxjXrdr1K6dc9aEHO6AOBQUkMZ7WtYmbxM+pbL/9TxERjoWh8Ar43ASv8OM+AQuD4VydomK9Q==
X-Received: by 2002:aa7:db10:0:b0:42a:a983:a5d6 with SMTP id
 t16-20020aa7db10000000b0042aa983a5d6mr4389284eds.312.1652954119827; 
 Thu, 19 May 2022 02:55:19 -0700 (PDT)
Received: from able.fritz.box (p57b0bdaa.dip0.t-ipconnect.de. [87.176.189.170])
 by smtp.gmail.com with ESMTPSA id
 y6-20020a170906518600b006fe9c65ffb8sm388267ejk.92.2022.05.19.02.55.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 02:55:19 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 09/11] drm/ttm: audit bo->resource usage
Date: Thu, 19 May 2022 11:55:06 +0200
Message-Id: <20220519095508.115203-10-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220519095508.115203-1-christian.koenig@amd.com>
References: <20220519095508.115203-1-christian.koenig@amd.com>
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
Cc: matthew.william.auld@gmail.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
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

