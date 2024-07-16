Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFEE9326AD
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 14:35:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A22610E6BC;
	Tue, 16 Jul 2024 12:35:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VK28f7vP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB60410E6B4
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 12:35:26 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-427b1d4da32so10721245e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 05:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721133325; x=1721738125; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=fWFqWCTZWMvDWm/KP6ygCaXkxI7hwc90L3wN+uo1b0o=;
 b=VK28f7vPrAnksKWH6hjMtWURWqv4lWsji+tzAS1HJu9b9iZUpIsxcjnLrzCwUwKWus
 9UJbSDMCkcpGEoOUQcXi8EGcLa744+ji3uK1ikAOOX98WK4XaRGIcIqwHgGYiSxk8Us4
 3HlB09DpDNNXvutcOcXpUrXV7CPALX/MXPMZGjhUUeMjCCs8+GJw6hstns7g0HfkFLVG
 eR4t2vnsqntDDkWQ/RT4vjhNjHGu8MWrKC9pOn9lpx4bDiIIHrYJ6qdrWToG7jJaeUBg
 MkCblWYVtR86e+rEXOBZasNFG0gYNFTVsujxcEfRSDUFCdGEpQg6d+zX++whmXRm/X6W
 zFOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721133325; x=1721738125;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fWFqWCTZWMvDWm/KP6ygCaXkxI7hwc90L3wN+uo1b0o=;
 b=N8AKjGWwCxeJvklMBugvDKuGvwIejACs4N+0yPoge68FwLsrwany+1cumUjkvjGr+t
 CvwDzzswqfhoJRQowXaYpapk8hg9deKMC5oGeD4qmHvQ5abSzDmx5cnOr3FGDL/nne0O
 w2XL3opaoqBxIdIb6xpUiFC8Ukp0r+FUv5VKbW68+GAhWlDwrfBk3o9tDDt7ffTCmMBy
 gKpJsKsxsXFSePVhVqSmqzPqoRcKItTK+ArgSwmMeA+ASsl2FMOPV4F4fc+kOC4D74a/
 O2dBH22CBVp1pa/bdJLB1LwKzUWDVw4T0GcuY/5yNqDgSxwUZ0DeuMMVtJ17q8K7qvqL
 aWBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIMl4s6xAq43+N31YhoSv004JR0AKgK+EHEPO+jt2KfrlxMkJZLC1cWKqu33zeAbzD2WPORMvnNdWH3Wg2HNMNkKzGTR/u7m6tq/Vclr5Q
X-Gm-Message-State: AOJu0YywA1XDAIFEo4/AnFP61Ch3WTJMWZ3E+Ctl0/pABhkBu8pZS8A9
 VE/leEq/NAQtG8pjKL7auGlPQ1/2JeosC1M34q7WE7YUkfqxaIfE
X-Google-Smtp-Source: AGHT+IE30yXMUIiq4kagvlPmomPN0bfadbIv2TQM9KeFUW63LqStmJ36YIFgikn186yr6VMBvMAQFw==
X-Received: by 2002:a05:600c:1396:b0:426:5e32:4857 with SMTP id
 5b1f17b1804b1-427bb5f5b32mr12359145e9.0.1721133325061; 
 Tue, 16 Jul 2024 05:35:25 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1592:7f00:1c98:7fd3:7b80:1cc1])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427a5e77493sm127058225e9.7.2024.07.16.05.35.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 05:35:24 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: thomas.hellstrom@linux.intel.com, matthew.brost@intel.com,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 4/9] drm/radeon: use GEM references instead of TTMs
Date: Tue, 16 Jul 2024 14:35:14 +0200
Message-Id: <20240716123519.1884-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240716123519.1884-1-christian.koenig@amd.com>
References: <20240716123519.1884-1-christian.koenig@amd.com>
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

Instead of a TTM reference grab a GEM reference whenever necessary.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/radeon/radeon_gem.c    | 2 +-
 drivers/gpu/drm/radeon/radeon_object.c | 7 ++-----
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
index 2ef201a072f1..05df49b3a5c6 100644
--- a/drivers/gpu/drm/radeon/radeon_gem.c
+++ b/drivers/gpu/drm/radeon/radeon_gem.c
@@ -88,7 +88,7 @@ static void radeon_gem_object_free(struct drm_gem_object *gobj)
 
 	if (robj) {
 		radeon_mn_unregister(robj);
-		radeon_bo_unref(&robj);
+		ttm_bo_put(&robj->tbo);
 	}
 }
 
diff --git a/drivers/gpu/drm/radeon/radeon_object.c b/drivers/gpu/drm/radeon/radeon_object.c
index a955f8a2f7fe..4b972c8c9516 100644
--- a/drivers/gpu/drm/radeon/radeon_object.c
+++ b/drivers/gpu/drm/radeon/radeon_object.c
@@ -256,18 +256,15 @@ struct radeon_bo *radeon_bo_ref(struct radeon_bo *bo)
 	if (bo == NULL)
 		return NULL;
 
-	ttm_bo_get(&bo->tbo);
+	drm_gem_object_get(&bo->tbo.base);
 	return bo;
 }
 
 void radeon_bo_unref(struct radeon_bo **bo)
 {
-	struct ttm_buffer_object *tbo;
-
 	if ((*bo) == NULL)
 		return;
-	tbo = &((*bo)->tbo);
-	ttm_bo_put(tbo);
+	drm_gem_object_put(&(*bo)->tbo.base);
 	*bo = NULL;
 }
 
-- 
2.34.1

