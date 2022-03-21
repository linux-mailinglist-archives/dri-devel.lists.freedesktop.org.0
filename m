Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CD44E28E1
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 14:59:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94B5610E447;
	Mon, 21 Mar 2022 13:59:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63B7E10E430;
 Mon, 21 Mar 2022 13:59:06 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id j18so11190403wrd.6;
 Mon, 21 Mar 2022 06:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eZArxmFAnB1PGWm4AcT/QCKlSkXWEYFq45qSSQ8R3LA=;
 b=N8PA9s2Vix2Z9jZgrlq7tKa4dKMcSTfJCplUCjv03fPq5+FN0FT8FJ2rkGRP1Lhc7f
 DVsXsYPIv029w9pU8xCYaPD0E9NwRf9LxBK8MOh1XzDmwsQqemeGsIKnBP3h+CDIP7L6
 nbMhvg4UoCqwyoOhWntWLHmDR1zqHpNdBM2wtCdgwH9sBFFw7ZJ6MuKq5gyD6fegKow1
 RAB4gyasnSibW3Qt59sVb1Exi3Ojt8Niss/Bh092Az61Yu0dPbQnW6bfIyr6s7ykHgkE
 C45ddnuLieW9/Jn+L9FUEdHg3HpLetu/AynWzYIgcumpjf9mjxurHAAvrxg5Szh9XLG5
 wDYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eZArxmFAnB1PGWm4AcT/QCKlSkXWEYFq45qSSQ8R3LA=;
 b=3FpIoNXPJ4/YrGVEcvmHWRPji4Cd4MCOEcLB3lD4OLwQ4YwvI/uzt/PMKqLaWY9nZp
 qI/Nlvd6hBadaxm8LGbzTgyXCfpBk8uNEiRmNXRzrIC538m/2EkYeJZvRVHzjTfaP8F5
 CeX1IjmyC4wF7nHgkcKBE8wSOGUd9AKzHGrP7Z7Edxel+QXnnUp9YdJv+9/cdpbpDS3D
 JxsIJlBThxBeo7CImeHQmIUeuf+tIBb/TK9KDy6Z6cWLy8JuiJ1o01mlTTCatE1vTwDi
 vHVljJYvblEuOHOb/bNe2JfGfjQ27FjvrxvmziuoC2xYh9qPxWtmf/QSzL3Pyk2ULmgh
 Bg7w==
X-Gm-Message-State: AOAM532zPE2vcSSxHHjW8491Byz7KaLx/UExbFb7CI7CGx29l0jFNvQ8
 wJhM1ABiMOFpsOBvk0xoKzQ=
X-Google-Smtp-Source: ABdhPJwHsbDyqXdjTwRMxNSRDk9CQybtx63wzRTSSUNV4T7vbzhNVQVTROLbXBLwNiDicBzpj0gieA==
X-Received: by 2002:adf:ca08:0:b0:1ed:c0bc:c212 with SMTP id
 o8-20020adfca08000000b001edc0bcc212mr18191089wrh.577.1647871144961; 
 Mon, 21 Mar 2022 06:59:04 -0700 (PDT)
Received: from able.fritz.box (p5b0eab60.dip0.t-ipconnect.de. [91.14.171.96])
 by smtp.gmail.com with ESMTPSA id
 m3-20020a5d6243000000b001e33760776fsm13317640wrv.10.2022.03.21.06.59.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 06:59:04 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel.vetter@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 08/23] drm/radeon: stop using dma_resv_excl_fence
Date: Mon, 21 Mar 2022 14:58:41 +0100
Message-Id: <20220321135856.1331-8-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220321135856.1331-1-christian.koenig@amd.com>
References: <20220321135856.1331-1-christian.koenig@amd.com>
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org
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

