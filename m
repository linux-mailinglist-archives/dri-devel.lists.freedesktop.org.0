Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1F08FB871
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 18:05:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14BD110E33C;
	Tue,  4 Jun 2024 16:05:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PSNQz4kR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E370210E2CF;
 Tue,  4 Jun 2024 16:05:12 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-42120fc8cbfso44926235e9.2; 
 Tue, 04 Jun 2024 09:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717517111; x=1718121911; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FPH40L1XLTqvnGgDXyNCjxEAOhlXpvTvYgz2Co35HOs=;
 b=PSNQz4kRekaRe9N7DkQWb3DBwD6aC+/SpZ2lpgMNz4UQDOUouUbk2pVXNsxjBOAoVG
 wULMH418VpyQHt4Ygft8E6YAO4Q2GaadebUILdm+ozfTEfjxVQJm7zqG9S0kY30beL/3
 hu9to4FDcxr0V6g/7vKKqiFrdv+0DowWvHsC+wZv4LyJFLnHEihSUkpWQXp2iEiJtD6t
 3Isulo3KeAKC61nyD0JAyUbeRajwfu629A//+vN6D+MVqczs5IXjR4TcO1ciVoJrPiaZ
 ok2uaUxF7Sw+DlTTzH1VGVlUvQExBoYzw2g3SLtk+ifbzPD3yQ6VFKkLyH1STJ8gF/DN
 UAiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717517111; x=1718121911;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FPH40L1XLTqvnGgDXyNCjxEAOhlXpvTvYgz2Co35HOs=;
 b=FNAJIWPRlV6dkPdPwUDagpcSP5PnE41wsHxL/QmIfrAgw9ypBvi3gPL1+H7VjcDYls
 P/BBy5g4bwuDth9DE0UaqSauP7IarU4ldxvdkZc0R9g1zKcWIml0V9X7Q5WK1uPj/7JQ
 yCCtov6rRcsXo7824pid+IEuLuDJQp9XJiS/Wyvlo03Hz7kA1hJULnnu9OSXAmEO7Qgd
 0UlfqyeTNKCHrV54/IqFu+ZO+y3BUb0yGIzSWhmJAl21y3IXyqfl7urLCI2GMSJLQ0ym
 xUe/iFWp7E9owe8xGWpjX37JMrEjoSf1C3Ek4jf12cljqsdrQJLyBFJdR9fwafwaHReh
 epRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUv3qwFEcmeHfOhb3ugXREh5FmOO0cWddNJo+JMxtFKhWiwIxkGt9cd/lXFHYncvBtajr0w0LiYWQT+3M8vE7TR7CTFAo+x3qWF26TvFA==
X-Gm-Message-State: AOJu0YwN3wyjmmGtI7CVli8l26tG3V0IhUIqE4Yu+IgOxDy9BJRwjKIl
 kD0yjGgGpt7L15vtyd1XA90kidGVyUlk78vXW+GRQSq7b6uLPEmK6SIp4QQqdI0=
X-Google-Smtp-Source: AGHT+IFTIqAx3QmUfh9T2IXfVjGQRhMx7TISWfa0cvHnegvwIFMGpmBKUxDR7lV+zWxvGstvd/OE6g==
X-Received: by 2002:a05:600c:1c19:b0:421:1152:b098 with SMTP id
 5b1f17b1804b1-421562d4694mr726885e9.4.1717517111028; 
 Tue, 04 Jun 2024 09:05:11 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:157b:4500:3a1f:103c:c5a9:7f90])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35e7e07d7besm2388082f8f.18.2024.06.04.09.05.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jun 2024 09:05:10 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: tursulin@ursulin.net,
	friedrich.vock@gmx.de
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 5/6] drm/amdgpu: always enable move threshold for BOs
Date: Tue,  4 Jun 2024 18:05:02 +0200
Message-Id: <20240604160503.43359-6-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240604160503.43359-1-christian.koenig@amd.com>
References: <20240604160503.43359-1-christian.koenig@amd.com>
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

This should prevent buffer moves when the threshold is reached during
CS.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c     | 36 ++++++++--------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 22 +++++++++----
 2 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index ec888fc6ead8..9a217932a4fc 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -784,7 +784,6 @@ static int amdgpu_cs_bo_validate(void *param, struct amdgpu_bo *bo)
 		.no_wait_gpu = false,
 		.resv = bo->tbo.base.resv
 	};
-	uint32_t domain;
 	int r;
 
 	if (bo->tbo.pin_count)
@@ -796,37 +795,28 @@ static int amdgpu_cs_bo_validate(void *param, struct amdgpu_bo *bo)
 	if (p->bytes_moved < p->bytes_moved_threshold &&
 	    (!bo->tbo.base.dma_buf ||
 	    list_empty(&bo->tbo.base.dma_buf->attachments))) {
+
+		/* And don't move a CPU_ACCESS_REQUIRED BO to limited
+		 * visible VRAM if we've depleted our allowance to do
+		 * that.
+		 */
 		if (!amdgpu_gmc_vram_full_visible(&adev->gmc) &&
-		    (bo->flags & AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED)) {
-			/* And don't move a CPU_ACCESS_REQUIRED BO to limited
-			 * visible VRAM if we've depleted our allowance to do
-			 * that.
-			 */
-			if (p->bytes_moved_vis < p->bytes_moved_vis_threshold)
-				domain = bo->preferred_domains;
-			else
-				domain = bo->allowed_domains;
-		} else {
-			domain = bo->preferred_domains;
-		}
-	} else {
-		domain = bo->allowed_domains;
+		    (bo->flags & AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED) &&
+		    p->bytes_moved_vis < p->bytes_moved_vis_threshold)
+			ctx.move_threshold = p->bytes_moved_vis_threshold -
+				p->bytes_moved_vis;
+		else
+			ctx.move_threshold = p->bytes_moved_vis_threshold -
+				p->bytes_moved;
 	}
 
-retry:
-	amdgpu_bo_placement_from_domain(bo, domain);
+	amdgpu_bo_placement_from_domain(bo, bo->allowed_domains);
 	r = ttm_bo_validate(&bo->tbo, &bo->placement, &ctx);
 
 	p->bytes_moved += ctx.bytes_moved;
 	if (!amdgpu_gmc_vram_full_visible(&adev->gmc) &&
 	    amdgpu_res_cpu_visible(adev, bo->tbo.resource))
 		p->bytes_moved_vis += ctx.bytes_moved;
-
-	if (unlikely(r == -ENOMEM) && domain != bo->allowed_domains) {
-		domain = bo->allowed_domains;
-		goto retry;
-	}
-
 	return r;
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 8c92065c2d52..cae1a5420c58 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -168,13 +168,23 @@ void amdgpu_bo_placement_from_domain(struct amdgpu_bo *abo, u32 domain)
 			abo->flags & AMDGPU_GEM_CREATE_PREEMPTIBLE ?
 			AMDGPU_PL_PREEMPT : TTM_PL_TT;
 		places[c].flags = 0;
-		/*
-		 * When GTT is just an alternative to VRAM make sure that we
-		 * only use it as fallback and still try to fill up VRAM first.
-		 */
+
 		if (domain & abo->preferred_domains & AMDGPU_GEM_DOMAIN_VRAM &&
-		    !(adev->flags & AMD_IS_APU))
-			places[c].flags |= TTM_PL_FLAG_FALLBACK;
+		    !(adev->flags & AMD_IS_APU)) {
+			/*
+			 * When GTT is just an alternative to VRAM make sure that we
+			 * only use it as fallback and still try to fill up VRAM first.
+			*/
+			if (abo->preferred_domains & AMDGPU_GEM_DOMAIN_GTT)
+				places[c].flags |= TTM_PL_FLAG_FALLBACK;
+
+			/*
+			 * Enable GTT when the threshold of moved bytes is
+			 * reached. This prevents any non essential buffer move
+			 * when the links are already saturated.
+			 */
+			places[c].flags |= TTM_PL_FLAG_MOVE_THRESHOLD;
+		}
 		c++;
 	}
 
-- 
2.34.1

