Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 716AE4B2640
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 13:50:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7269910EBC2;
	Fri, 11 Feb 2022 12:50:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32DFE10EB97
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 12:50:15 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id k25so22701428ejp.5
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 04:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=eZArxmFAnB1PGWm4AcT/QCKlSkXWEYFq45qSSQ8R3LA=;
 b=Bk3lLbbDEJgnYNzasK6l8Qryg47XulEhQdznSaqsTOJfkmWOyi4N7s/IdrVcc+6VZ2
 7RI6Si4YV085o8RaYLLNKF/868pPCwij9/DGyeKm/F8agQt+hw7XrHep2wd7DxdMTQCS
 2fhs7l70ZRMTu8Rg/eWSEYfXb46tXBbYnH+Stpoy5sAUsTA8BY88ibOx2H6dxzwt/3En
 2PS87H+Se40WpbkWhMkno4FajDvqEFrdbij+h0qlyFcYtHBFn4pHVIr3He0zLUown0y6
 r/92krR9kxaIWmWpwkOBfVzMWumUYaW71xwiTUPmbVv8bUu2wVJlDJS+zUKdRdmeIk2P
 gtmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eZArxmFAnB1PGWm4AcT/QCKlSkXWEYFq45qSSQ8R3LA=;
 b=ScGos4tjmbCl6XzbWToRqyYJ+a/4moLToRnb4MblwlGtTK+nVpPetRepXf8eU6D9VV
 8GySYlWSunY9V7vix/NYrbwr3PGHHYYdIzsgaQnrMrF2P5lzKOLox73MQ5BP3qsSXfjl
 mCy6YCaLmWsNj+EHfaeJf/+3fUWwo5M6nzOp2gLQWcJeSKPoUhrfA0zuTODUDik+LIyc
 zqpx1B/YdPtYBgaAcVBQWMrYOQ8WmvfUxinGSkeJBozncRm7l9vHyFJeL+DMM+TrBYMP
 w6bGv1FRX2NSeECkyALzk4q2AdNUlQRMhmQ9d9m4rIWoLay7FGxWishDgTwQw+xTYrHT
 bNQQ==
X-Gm-Message-State: AOAM531Ba9q4n6sPhxP1WbaDwbjYpGtorCjO68Ewmd6w7R35gJDqqbqe
 uZdsbtxOrb5TAd46IhwVCX1bBOYwUOY=
X-Google-Smtp-Source: ABdhPJz5L2JJkfnWjSaXXOzAvlIAreH8lM8z/Tpfy4h4QzTrYOb0wO3tPG0pH+yVN3fA4sC0z3QezQ==
X-Received: by 2002:a17:906:2ed0:: with SMTP id
 s16mr1240418eji.327.1644583813803; 
 Fri, 11 Feb 2022 04:50:13 -0800 (PST)
Received: from able.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id w22sm7868604ejc.137.2022.02.11.04.50.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 04:50:13 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, sumit.semwal@linaro.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH 08/23] drm/radeon: stop using dma_resv_excl_fence
Date: Fri, 11 Feb 2022 13:49:48 +0100
Message-Id: <20220211125003.918447-9-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220211125003.918447-1-christian.koenig@amd.com>
References: <20220211125003.918447-1-christian.koenig@amd.com>
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

Instead use the new dma_resv_get_singleton function.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org
---
 drivers/gpu/drm/radeon/radeon_display.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/radeon/radeon_display.c
index b9a07677a71e..f60e826cd292 100644
--- a/drivers/gpu/drm/radeon/radeon_display.c
+++ b/drivers/gpu/drm/radeon/radeon_display.c
@@ -533,7 +533,12 @@ static int radeon_crtc_page_flip_target(struct drm_crtc *crtc,
 		DRM_ERROR("failed to pin new rbo buffer before flip\n");
 		goto cleanup;
 	}
-	work->fence = dma_fence_get(dma_resv_excl_fence(new_rbo->tbo.base.resv));
+	r = dma_resv_get_singleton(new_rbo->tbo.base.resv, false, &work->fence);
+	if (r) {
+		radeon_bo_unreserve(new_rbo);
+		DRM_ERROR("failed to get new rbo buffer fences\n");
+		goto cleanup;
+	}
 	radeon_bo_get_tiling_flags(new_rbo, &tiling_flags, NULL);
 	radeon_bo_unreserve(new_rbo);
 
-- 
2.25.1

