Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8004B2650
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 13:50:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8F4D10EBDA;
	Fri, 11 Feb 2022 12:50:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBD3210EBC9
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 12:50:19 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id f17so16421768edd.2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 04:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=WoX8sxPvPTbgZop8phAodihk23LCXGizwdQE923C6MQ=;
 b=f0zsY9IcIfWmYeNqKyhsaxi2SnBEbpUzB9wOLgK5GmAG1UogtnzklYDP0Aed3faqCB
 h0b8APBlfb5i2RlqXfR3woEwJo4GqfbQqzQU8o2KC/m4uHfKnVGJ/M0xKUw7JYGKRc5C
 A6gBtwlSHINYI2d9Zx8f+xCeEuJdZUFOKR/qJyE2OgBm9dGc0/J6btiNO7B8ygbkQN2n
 ycu+Ttj2pI+HKUFeqsuaNeLERCzYuaQD791ve7Be/93V7ojdfAFM+M5V3SQYwl0jewRE
 5TJL6y0l5jAA06X96u7zOWOzjcFqJCFqBv2y7QfAZDLX5QbRV5kEo5kgQm8QKM+kyrqA
 GMgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WoX8sxPvPTbgZop8phAodihk23LCXGizwdQE923C6MQ=;
 b=S5wnIkKKQRhV4bRHvvSsdaYDnYUF8O8k9r24DBKloigHxaSFjaJcfRhC215mOI9SQc
 u/dUBDTfagK7iOQJKt0UOp1dABV8GBoOUPOtm35nWy/fi6OT2KBVxQE7+1CAXRHW4kvH
 15LNzJnaZHi3EncDVtnBVb8CRZEt8gotxotj+RTACvkNluMBq18yE54Sk4qu4BIsPG/V
 5I/UyfqhWqFAkll6JSwEnd0wEShrbAcTQS/PYzejujjFk6qNWrGCQsg7qzXaQwlNDuu4
 /VyywBRO6fpYvWYfchL4qC2ZuzGmGnusdrGuG64uCSyBvNCJS+tJEXyrs6KbTOA3Ln7O
 GzHg==
X-Gm-Message-State: AOAM5305FY+SeICrqPKjTfx1ihilSVlA+SmcNFXpYqgzelmM5lXolkAU
 mpeRSLZ3lQ1DlNJH9+M7qYk=
X-Google-Smtp-Source: ABdhPJwfhpPd1YbrAte9JiktX0MR36E7mOxUbdIEGUzofbw3rRRJozJ5B6//hlENIubsaLHmLEtnfQ==
X-Received: by 2002:a05:6402:84f:: with SMTP id
 b15mr1745788edz.206.1644583818556; 
 Fri, 11 Feb 2022 04:50:18 -0800 (PST)
Received: from able.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id w22sm7868604ejc.137.2022.02.11.04.50.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 04:50:18 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, sumit.semwal@linaro.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH 14/23] drm/nouveau: support more than one write fence in
 fenv50_wndw_prepare_fb
Date: Fri, 11 Feb 2022 13:49:54 +0100
Message-Id: <20220211125003.918447-15-christian.koenig@amd.com>
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

Use dma_resv_get_singleton() here to eventually get more than one write
fence as single fence.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Lyude Paul <lyude@redhat.com>
Cc: nouveau@lists.freedesktop.org
---
 drivers/gpu/drm/nouveau/dispnv50/wndw.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
index 133c8736426a..b55a8a723581 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
@@ -536,8 +536,6 @@ nv50_wndw_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
 	struct nouveau_bo *nvbo;
 	struct nv50_head_atom *asyh;
 	struct nv50_wndw_ctxdma *ctxdma;
-	struct dma_resv_iter cursor;
-	struct dma_fence *fence;
 	int ret;
 
 	NV_ATOMIC(drm, "%s prepare: %p\n", plane->name, fb);
@@ -560,13 +558,11 @@ nv50_wndw_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
 			asyw->image.handle[0] = ctxdma->object.handle;
 	}
 
-	dma_resv_iter_begin(&cursor, nvbo->bo.base.resv, false);
-	dma_resv_for_each_fence_unlocked(&cursor, fence) {
-		/* TODO: We only use the first writer here */
-		asyw->state.fence = dma_fence_get(fence);
-		break;
-	}
-	dma_resv_iter_end(&cursor);
+	ret = dma_resv_get_singleton(nvbo->bo.base.resv, false,
+				     &asyw->state.fence);
+	if (ret)
+		return ret;
+
 	asyw->image.offset[0] = nvbo->offset;
 
 	if (wndw->func->prepare) {
-- 
2.25.1

