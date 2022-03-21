Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1A14E28D7
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 14:59:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B79210E454;
	Mon, 21 Mar 2022 13:59:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64B2D10E443
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 13:59:11 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 l7-20020a05600c1d0700b0038c99618859so1331954wms.2
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 06:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ilcOGSqnxUqFL0ayC9N1nKoW8foqX4Z1qTckrM2yJmE=;
 b=MAhakpGMB4JA53psAtdY/1uGARE/CZb5Pb1F6U/RUZmxqv9qvrGt8S9zi+1kS9kUTu
 5wQfcQ64/3NjkxY9PAE45sPjtShsMvE7yMblfLr4zBfK7GYY+E6PrUIQmHJKKhFxIoaF
 /a6UwH4Zr5Cbz+zBCNxRIv5gNuv6gCudByUN2x33yIyOo3XLelp82BWeqmp5fhW8+1Xb
 0zeaEnyq3BhhtaJfRfFanYkRIgwNbKQwbc1u58VSSTGICCOUCBZY6+SjL8V88C3y0KwQ
 amQM6rsyBFTr9xPOCwRqXY1WWBKtVQD6X8VudZE0QH4cZlNf/PPQkBvS7jq09Mmc/fkw
 +ECg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ilcOGSqnxUqFL0ayC9N1nKoW8foqX4Z1qTckrM2yJmE=;
 b=Bca52uglNLWJYGIIn2EEtQsD2sPOW/gy9YZQc4JQ8LWPD3w1fyULfaDu9vBxeuv1ZV
 k29C5UufGSYQeWsLDcTND6aiG4EGqcFw7ySEhG9veJjyAnKQqAl+HAqvEofQItiq7WOW
 ROaxxnQh4WPXpJHR/RqIOdt7iVwnRNtr713q+ldWzBLvgFQYY1vMELz0vnnJpGRgDKWC
 IqzkFn1Gv6uV1N23EKxdsC6txNM4qu0pTpFD3k2z/cmHzG/68XGLVQzROHamkGsTCT25
 0J6Cl80AnCfi9VFmCmaTsaXRRKD/u6njWv7sCyMzDkwz0f/Ql5R69kTqVtmILwL7LUpn
 vjTg==
X-Gm-Message-State: AOAM533XyFe5Hdo9LJWpWUWQDAJ+Nmj9Hp/h6siWIEaqcKktrTbRJJCT
 Dpga35CDufLym7h7I3ncksm2Z+5bLlw=
X-Google-Smtp-Source: ABdhPJzwAPDD+LDJ7QHk+oTfBdT6TcLJoZ/76owoOCNKq8OylOC+1l641bld9xtbaqcTOuWw1t4m6g==
X-Received: by 2002:a05:600c:b49:b0:38c:93ad:6d4c with SMTP id
 k9-20020a05600c0b4900b0038c93ad6d4cmr10957358wmr.53.1647871149908; 
 Mon, 21 Mar 2022 06:59:09 -0700 (PDT)
Received: from able.fritz.box (p5b0eab60.dip0.t-ipconnect.de. [91.14.171.96])
 by smtp.gmail.com with ESMTPSA id
 m3-20020a5d6243000000b001e33760776fsm13317640wrv.10.2022.03.21.06.59.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 06:59:09 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel.vetter@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 13/23] drm/atomic-helper: support more than one write fence in
 drm_gem_plane_helper_prepare_fb
Date: Mon, 21 Mar 2022 14:58:46 +0100
Message-Id: <20220321135856.1331-13-christian.koenig@amd.com>
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use dma_resv_get_singleton() here to eventually get more than one write
fence as single fence.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/drm_gem_atomic_helper.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_atomic_helper.c b/drivers/gpu/drm/drm_gem_atomic_helper.c
index c3189afe10cb..9338ddb7edff 100644
--- a/drivers/gpu/drm/drm_gem_atomic_helper.c
+++ b/drivers/gpu/drm/drm_gem_atomic_helper.c
@@ -143,25 +143,21 @@
  */
 int drm_gem_plane_helper_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
 {
-	struct dma_resv_iter cursor;
 	struct drm_gem_object *obj;
 	struct dma_fence *fence;
+	int ret;
 
 	if (!state->fb)
 		return 0;
 
 	obj = drm_gem_fb_get_obj(state->fb, 0);
-	dma_resv_iter_begin(&cursor, obj->resv, false);
-	dma_resv_for_each_fence_unlocked(&cursor, fence) {
-		/* TODO: Currently there should be only one write fence, so this
-		 * here works fine. But drm_atomic_set_fence_for_plane() should
-		 * be changed to be able to handle more fences in general for
-		 * multiple BOs per fb anyway. */
-		dma_fence_get(fence);
-		break;
-	}
-	dma_resv_iter_end(&cursor);
+	ret = dma_resv_get_singleton(obj->resv, false, &fence);
+	if (ret)
+		return ret;
 
+	/* TODO: drm_atomic_set_fence_for_plane() should be changed to be able
+	 * to handle more fences in general for multiple BOs per fb.
+	 */
 	drm_atomic_set_fence_for_plane(state, fence);
 	return 0;
 }
-- 
2.25.1

