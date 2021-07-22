Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDE83D2375
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 14:41:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DF176EC04;
	Thu, 22 Jul 2021 12:41:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6131C6EC04
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 12:41:32 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 x14-20020a7bc20e0000b0290249f2904453so2445362wmi.1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 05:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=nQjh8xW0eM60mkaCg8rr3F97N02/jcov+zo3FgQKaMo=;
 b=I+cFaqhx4B0Cc0gHyJ7m/nObCtgyfaf2YcrSQxP5IUbfvcSMIL/u0Hlq3byu8val4n
 HJ+VbdcYC5FGPGxDdldHIqbfEnfCY28lt0a4Cn6iWeM45BMYG3XEnO0O5Yeg3V0um48Y
 xNFZ0WyZP8Pg2QP6Brc5nxEhZZuL59NXPuYnILxJYNBHCGioCZ2GTbrwsZC96WsrLzSW
 dUq98h1+onHyuNKz7MURy4BlBPFbH8LJsgj2Qwek1ZS54WW40i02IP2QiXflFUNYnV2O
 UmxT2ADe5P1KAEYHmBNO74FR6nXEi9ZnFTzfx9gDn8FuTqmbwKCuUAexX6sBd/Vwjv7L
 Ez5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nQjh8xW0eM60mkaCg8rr3F97N02/jcov+zo3FgQKaMo=;
 b=ETUCxKQW3neVUthi9fajPxFdjOrOLUUcQYMNlD57yPj+WFSNLSwORECYZ7EinGXbHg
 v+MymlMpsyNXIyfLHNHHXf4EupKjuQYNFwAkz4/MXHKctYQApJQmGtQxgcrcWK4RW76O
 4ILpEZjcg2ahOKci80+qPr9kR0bB7GRqbL9IO+hafMe5r24QuDPRPKYHsIs0XiO4LjXG
 3q8nEA1HFYZj2/2kt3iQf9Ujxpnl8wSCaFCcyqJh4rfZ6MwK+QuYZ53gy6vorkIfA94n
 jj+AsFo8P8kzS/Yy20JQT+4/B2GlWKbB1BU7VPc3ezJ0ZYgzqbm/7tOfoDf1/Sjl4Elg
 +Ikg==
X-Gm-Message-State: AOAM533FxFPaggguf21mhnBacAjDAFi31LhCdPzt37Wyv3ZXTb1KO4Ie
 WS+WAIIYmaHX0aKUbUD8dvlR7XMmAoo=
X-Google-Smtp-Source: ABdhPJwkUeEcY1rT49CNYrSi9hw4Cs1o3Uqc9U0tZMlfT8SwWLzkszONK/RNcMRURVS9w78/5hyrDA==
X-Received: by 2002:a7b:c108:: with SMTP id w8mr42718138wmi.99.1626957691121; 
 Thu, 22 Jul 2021 05:41:31 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:6c5:784c:9ce7:760b])
 by smtp.gmail.com with ESMTPSA id w8sm18545133wrk.10.2021.07.22.05.41.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 05:41:30 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org,
	airlied@redhat.com,
	daniel@ffwll.ch
Subject: [PATCH 4/5] drm/radeon: unbind in radeon_ttm_tt_unpopulate()
Date: Thu, 22 Jul 2021 14:41:26 +0200
Message-Id: <20210722124127.17901-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210722124127.17901-1-christian.koenig@amd.com>
References: <20210722124127.17901-1-christian.koenig@amd.com>
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

