Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 443FFB89A15
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 15:15:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A77310E9E3;
	Fri, 19 Sep 2025 13:15:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="f3lOnQzY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 518F010E9C5
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 13:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XKPqHt4vXEU1vbae9y9kW5dMPCPogPxr8uQvyKSieXA=; b=f3lOnQzYLclAOPARaGppMK673K
 EryppstD9UcjhIjZo9C+fcFfVJQCkPd+fvBXd+PX5OG+v8i6/x+Rn7XBCbO2uyZpw0Hy24Fekj5Sh
 FoqqR9Uy2XKvz0TYQd6yBFijZeqV7iDcbZXGQeTjLMbiZlJJi+T1ZktnMtuB9MgJyAd8ACYXup7Db
 T4yKAq61PCtWHZlIa1aqHaiidULwyOw6wgDtYHD5Uhzm/N07PUWNqRVPhzr9ofdZKUOcW+qeAtbl5
 dQKEhqdaIbfJ2jY0OpKJlCVU+ZvPbe9eZ2cxBf/LL1hJ855Z6JRwAA6qvl9O3InQTnWWRS9cFQbaL
 OtT3R5qQ==;
Received: from [84.66.36.92] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uzaxe-00E6Nf-LE; Fri, 19 Sep 2025 15:15:38 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH 1/4] drm/ttm: Make ttm_bo_init_validate safe against
 ttm_operation_ctx re-ordering
Date: Fri, 19 Sep 2025 14:15:27 +0100
Message-ID: <20250919131530.91247-2-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250919131530.91247-1-tvrtko.ursulin@igalia.com>
References: <20250919131530.91247-1-tvrtko.ursulin@igalia.com>
MIME-Version: 1.0
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

Struct ttm_operation_ctx initializer in ttm_bo_init_validate assumes the
order of the structure fields when it is configuring the interruptible
flag.

Fix it by using named initialization.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 29423ceeec5c..e5f5d4aa5a47 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -1024,7 +1024,7 @@ int ttm_bo_init_validate(struct ttm_device *bdev, struct ttm_buffer_object *bo,
 			 struct sg_table *sg, struct dma_resv *resv,
 			 void (*destroy) (struct ttm_buffer_object *))
 {
-	struct ttm_operation_ctx ctx = { interruptible, false };
+	struct ttm_operation_ctx ctx = { .interruptible = interruptible };
 	int ret;
 
 	ret = ttm_bo_init_reserved(bdev, bo, type, placement, alignment, &ctx,
-- 
2.48.0

