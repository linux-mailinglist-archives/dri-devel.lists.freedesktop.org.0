Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B32461497
	for <lists+dri-devel@lfdr.de>; Mon, 29 Nov 2021 13:07:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7DE76FA70;
	Mon, 29 Nov 2021 12:07:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 954356FA5B
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 12:07:17 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id t9so19292072wrx.7
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 04:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MHiuy8hFM9J8q0FM4IEtsQAAAvGX3NWM32T+WyyUIsc=;
 b=KJ7diNsGhQm/8Ndo7DLAVfBuhYtC+4Pxq8mfU3h1qgbXKcUPTd8zGoZPYRUg+is0MT
 DWl4HXOFMpYpzQA2nbcRJMEXgFSGmne6TPWQM2Jn5FEkoEJHa7K5JrThAzSKbLqE4QuT
 4tONh0cSokz9MJ/xTaJ4fG5zVaMQt2w90hCIcR7HpGty8ZRjn5CbCgGLdxMp5F5h7Mv4
 iMwyLw2LPjRCVMWT3LJJ5qG3Wd493nQ3ulBUQFcJpQO1EPOK2g7FP32dodX5we+cIkq9
 VdR1HX7qAuvWfpz8waMHBuMN5UKGuag2eeOxbP9PXw3G2lwAHvRrA+b4Ursld7TZaUcw
 geOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MHiuy8hFM9J8q0FM4IEtsQAAAvGX3NWM32T+WyyUIsc=;
 b=7c4rLZV7h18AOp9ijKKlXKb7RwDg5KnA9Y6BhMQS/ReT2zNgS39fS625g+skCngCL3
 1olAOPOjkxu0HOGyHyl9XasglsRyeNF0bo7dVxLsOU8Ya2Xl3pyj3UBXjwvQISaFfn8T
 h6LwF5aAjVZwE/RPtT4Oye+wEdoBWz81okuvgpRWpLJzm9eX4VaTXZcsUwUBXzMjHTxt
 emkns3Qgr+f0htioXvhF04CClfZ5jekgvWLTUAPdae3VEz/BoICWiOB0hKpQFj0tn+YD
 azHa3ssBHHR4MI2LdtEwC1z26V439wgsBjfNRrj5rCxu79KMdQnUTXWXTKgNtV4LoWgW
 HgIw==
X-Gm-Message-State: AOAM533ITHfc8Tl85JZ69L4SIAs1wJC99WPLbXzBbKEgz4nlAuUROZ5M
 bj48XyQ+K4pZ1sYiinjCv0Q=
X-Google-Smtp-Source: ABdhPJwYrRulNH1UIlUAXhJlQmOktxSeuXrTf3FJAf53GCRTDT8EtzYwHmYDRisvTYtIhveJBbbQ1w==
X-Received: by 2002:adf:ef84:: with SMTP id d4mr32384261wro.175.1638187636140; 
 Mon, 29 Nov 2021 04:07:16 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
 by smtp.gmail.com with ESMTPSA id b6sm20415234wmq.45.2021.11.29.04.07.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 04:07:15 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch
Subject: [PATCH 13/28] drm/radeon: stop using dma_resv_excl_fence
Date: Mon, 29 Nov 2021 13:06:44 +0100
Message-Id: <20211129120659.1815-14-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129120659.1815-1-christian.koenig@amd.com>
References: <20211129120659.1815-1-christian.koenig@amd.com>
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
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead use the new dma_resv_get_singleton function.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/radeon/radeon_display.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/radeon/radeon_display.c
index 573154268d43..a6f875118f01 100644
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

