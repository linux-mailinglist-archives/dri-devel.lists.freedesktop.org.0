Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E35CC3D2031
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 10:56:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0C0D6EB33;
	Thu, 22 Jul 2021 08:56:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03F116E49D
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 08:55:59 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 o30-20020a05600c511eb029022e0571d1a0so2491613wms.5
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 01:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=9tlq7mjl0Xv5eclHQrr/UVAy/mSxUe1IxXzOhbpYP1U=;
 b=qFPa5l0DGK723CaWce8NgKVXp8gvN5pyQUD6waGsDl0QyhdD7cIMPk7mOSneyG1wIE
 qJJ/NQr5rw+I0RDnWJh0kVFV74zbnh14Hg91amHM/LtthfxShhiUVXRojk6WGMooWPYB
 V2Jf0zyZoAS7PLqbYZ8FRqqePXOOSz+jd2v1cIz/Sd94jsTPLTiGgpW/TmhLQpSATryQ
 Twfju+JEdzb4jyWK/PIYGFpYkQBrwlVWYjXFe6d92NA/JqbMXKPTs3qzt/LVfgZDgpEd
 kjNNRb/BhqIG/JZxMkaWBttiCqLSKIhulfO1dBcdCKaBdvAlZ6SRNfZmHAhT9noom3Gx
 YLNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9tlq7mjl0Xv5eclHQrr/UVAy/mSxUe1IxXzOhbpYP1U=;
 b=B+Rzz4lsa0h2t4Vdl8Fl8WUwkhmuFRQZIW0ZQbsUpcF6S2rw4HZfktIcaTZouutUWp
 L7xILVy8SlVev57uFjWxcDr+lh35jzNfsdKS6lyE08il3pO/oPpqqy4SE7UnGr8aOXY/
 syfJyUSZU9PgZXpSH/5frcdcZ6Bi/HALu2BTfs3q6yTXy4JZ+7c4FHXc05wKSeEsJLwo
 zwSt4XKNnMkc2cpowegyn/I9vDwNkyZZ0Uak8gCRF7Vbt0oY4b+rUUdGKVAM/+arMdoF
 9vA6YsXM+rtBafw5Bs5vnK9Oq6tJogeilfsRaNuP7ez8hKbT8X36tKYVFcYFMuBenGPl
 kB/Q==
X-Gm-Message-State: AOAM5337xuSYQCegvA5lx/auF6rgaEr4/WZYtQqQmcEsPWvz2Bo9lZHq
 ro0d61isr4rWuzk07FASpZdV1R1inV4=
X-Google-Smtp-Source: ABdhPJxej+j7DBVjKGosOme6e1yzTR8xlPjgyJ3fMNEDnooJgQ1MYqglAYUqwob//eazmvkB4EaDQw==
X-Received: by 2002:a7b:c24a:: with SMTP id b10mr7971914wmj.37.1626944157719; 
 Thu, 22 Jul 2021 01:55:57 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:ee9:2117:be77:929c])
 by smtp.gmail.com with ESMTPSA id w3sm29130889wrt.55.2021.07.22.01.55.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 01:55:57 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org,
	airlied@redhat.com
Subject: [PATCH 4/5] drm/radeon: unbind in radeon_ttm_tt_unpopulate()
Date: Thu, 22 Jul 2021 10:55:53 +0200
Message-Id: <20210722085554.1537-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210722085554.1537-1-christian.koenig@amd.com>
References: <20210722085554.1537-1-christian.koenig@amd.com>
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

Turned out that doing this in radeon_ttm_tt_destroy() is to late.

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

