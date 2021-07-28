Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C5D3D8E81
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 15:06:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5EE26E489;
	Wed, 28 Jul 2021 13:06:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DC5B6E8FD
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 13:05:57 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id n21so1358348wmq.5
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 06:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nQjh8xW0eM60mkaCg8rr3F97N02/jcov+zo3FgQKaMo=;
 b=bdLLqaoHYrbyLv/JQ02RCHlAcchXlRuzOQhHsjak+UKtufwSh1GuFDlKv8FPFZAFsJ
 IeMmVI2Xpys2zlwuvX2KO7X+v4jkEL1GcMI7Nz4SyTN7ZxM259Mf+ZpUjIkBJ5y6+6O4
 ZYdoSolZ4K7Fp0yDpp9gMggGDNTq8EvPX9cZbTheRiQJ7yDqIbCif/Nhqwsjeu53lZkZ
 m405E4zDm1Dq1EZhmWN9YnLJmKaNB8rzaDO5471e4+6fprJhvA+ERdmIgiQLrKfyKCZJ
 CYB2PfrSyid+Aa4sw3YIIDMa04VyBj+TebsvE0v4KVLt0BpsvNwzXWoqfz+MUwN8I+hO
 Fv1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nQjh8xW0eM60mkaCg8rr3F97N02/jcov+zo3FgQKaMo=;
 b=F/aBoEUGvTMTPTKmYI+u61X7G7rnZblpHfBYmDRedb4dUAu/l5xvG/MUcyFtDafQQD
 7vOBV0/qwMZ4R1puZLrP75yjlmBE5xzVGJsComTVsBb+E181r9Aiy3YAtzHY91iLkl5p
 6c8X15ea2hyZRi3xgUBVp259jqkCq1RIQgv+ZkGTkJ5ifF9rhoL3FCovdbQkGvMxJUbI
 sA7xEnBHPe2zUjZQn8kQe1jbTl8rXDlsLsDZyTo9HkFNVfmjlgtT9qLHz/lwH4Brszyu
 qhQ4a6p0UwjmEtjpsLwjHo1MEq2O9qdfbzqwxDA5MvZFvbpRM28D11ULqNXMmeBtTPiK
 GxvA==
X-Gm-Message-State: AOAM531mKL/vCC7PcJrlAbpbC6exLBK9rJBdt4w7YkATipDSs0Cgg7GT
 MyQb8FykgSaxGQFV8gZcOG1OAZ/reZM=
X-Google-Smtp-Source: ABdhPJxn8jXr0Xg6K/UeT3BgbBQyyGMv/L8EnDib7pnZtpC75YcoPheq4knXZMIrRd7SrllgjoP0eg==
X-Received: by 2002:a7b:c3c5:: with SMTP id t5mr9179202wmj.28.1627477555583;
 Wed, 28 Jul 2021 06:05:55 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:6a03:ba57:3127:59bd])
 by smtp.gmail.com with ESMTPSA id o17sm5867374wmp.31.2021.07.28.06.05.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 06:05:55 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel.vetter@ffwll.ch,
	airlied@gmail.com
Subject: [PATCH 4/5] drm/radeon: unbind in radeon_ttm_tt_unpopulate()
Date: Wed, 28 Jul 2021 15:05:51 +0200
Message-Id: <20210728130552.2074-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210728130552.2074-1-christian.koenig@amd.com>
References: <20210728130552.2074-1-christian.koenig@amd.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Doing this in radeon_ttm_tt_destroy() is to late.

It turned out that this is not a good idea at all because it leaves pointers
to freed up system memory pages in the GART tables of the drivers.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/radeon/radeon_ttm.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index a06d4cc2fb1c..ee343b76db54 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -488,9 +488,7 @@ static void radeon_ttm_backend_destroy(struct ttm_device *bdev, struct ttm_tt *t
 {
 	struct radeon_ttm_tt *gtt = (void *)ttm;
 
-	radeon_ttm_backend_unbind(bdev, ttm);
 	ttm_tt_destroy_common(bdev, ttm);
-
 	ttm_tt_fini(&gtt->ttm);
 	kfree(gtt);
 }
@@ -574,6 +572,8 @@ static void radeon_ttm_tt_unpopulate(struct ttm_device *bdev, struct ttm_tt *ttm
 	struct radeon_ttm_tt *gtt = radeon_ttm_tt_to_gtt(rdev, ttm);
 	bool slave = !!(ttm->page_flags & TTM_PAGE_FLAG_SG);
 
+	radeon_ttm_tt_unbind(bdev, ttm);
+
 	if (gtt && gtt->userptr) {
 		kfree(ttm->sg);
 		ttm->page_flags &= ~TTM_PAGE_FLAG_SG;
@@ -651,7 +651,6 @@ static void radeon_ttm_tt_destroy(struct ttm_device *bdev,
 	struct radeon_device *rdev = radeon_get_rdev(bdev);
 
 	if (rdev->flags & RADEON_IS_AGP) {
-		ttm_agp_unbind(ttm);
 		ttm_tt_destroy_common(bdev, ttm);
 		ttm_agp_destroy(ttm);
 		return;
-- 
2.25.1

