Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5275408C57
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 15:18:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C00906EC8B;
	Mon, 13 Sep 2021 13:17:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 134D16EB17;
 Mon, 13 Sep 2021 13:17:43 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 c8-20020a7bc008000000b002e6e462e95fso6961455wmb.2; 
 Mon, 13 Sep 2021 06:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ywYiPBqYLCJ23trq34bYRpm7rnat1pMXJ6GgV3mhHgc=;
 b=A5lNs2MC/N0NsksmvdHX/ybghY3pb390BUp8YGF91muqiTAho89imbSUvtWtO0svRP
 lYstGtNDVY0ikAKhwKuM11qNKiVdYZXbzOXpPwzXc4Jt5UukYV8PjLou6zK/l+uM0VOX
 Klb+hmB2u2G9Ub8UPA54IoiUjp2mw2qMaeYHvzWPStvc11BtCIQ1QcL4bfpsiRJ+zaSp
 0bSz0Agre+2HiHecyk1hrShlKkVwNHREX9GV/EYX1oz4tO1xwlAmPTGbDZBBjrtpj4H6
 2Ls+so7KMHz/GW6GQS+NTXewXWkWmrYoGLMRM0WvO/ZuWl/ejbKnI16r4OhxSNXvzcik
 q3DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ywYiPBqYLCJ23trq34bYRpm7rnat1pMXJ6GgV3mhHgc=;
 b=aNIQnRHQsJAoXT5R+zfHg1/RURzTjGS7CPz7lSWgUhPttx1GBWe4n9e46QQNNAwHK5
 TgEUGuQvYAeWw73RYHj/ai20huxn0/u9oLt3UmKfx1Xpe5SflpHtcB7d1A5YGgV6F8tS
 e7ASCmAa/Cmf8W3e3M101nL2T1gxDraTuQCYj6LCivoMmyGtNq+oALqf8NmeYCkInIVM
 Ke7PuED2iwVCEW+hvVjA7Uo5rv96zlbZkDBNz+tHZADuHmuNpAvyC24zfhe8uzKQSR97
 YZXVaDJH8aKP6X0vIhwEyoG5ixO5sDHuBu5gqhwrfOXNK402xa1blnnwfSXa3mZ+Vyr1
 fzdQ==
X-Gm-Message-State: AOAM531cUUvFCr2Yn6tjYVz3BPRzYZ+yJ+wRTS6w0HZxRyLAPQ+WhMtg
 acHzRNIcw6/bL1066e01wrZHIiRrZQTeTTNB
X-Google-Smtp-Source: ABdhPJzqAAz9usdIPSG+fQU4iIicyc4vSAGCAFCzdcYdUrhMteKzMJM6QOeBvNhZH9MSD7CZy4OBOg==
X-Received: by 2002:a05:600c:2259:: with SMTP id
 a25mr4541562wmm.133.1631539061673; 
 Mon, 13 Sep 2021 06:17:41 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 h18sm7602834wrb.33.2021.09.13.06.17.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 06:17:41 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Cc: daniel@ffwll.ch,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 23/26] drm/nouveau: use the new interator in
 nv50_wndw_prepare_fb
Date: Mon, 13 Sep 2021 15:17:04 +0200
Message-Id: <20210913131707.45639-24-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210913131707.45639-1-christian.koenig@amd.com>
References: <20210913131707.45639-1-christian.koenig@amd.com>
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

Makes the handling a bit more complex, but avoids the use of
dma_resv_get_excl_unlocked().

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/nouveau/dispnv50/wndw.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
index 8d048bacd6f0..9a0c42d38a47 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
@@ -539,6 +539,8 @@ nv50_wndw_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
 	struct nouveau_bo *nvbo;
 	struct nv50_head_atom *asyh;
 	struct nv50_wndw_ctxdma *ctxdma;
+	struct dma_resv_cursor cursor;
+	struct dma_fence *fence;
 	int ret;
 
 	NV_ATOMIC(drm, "%s prepare: %p\n", plane->name, fb);
@@ -561,7 +563,12 @@ nv50_wndw_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
 			asyw->image.handle[0] = ctxdma->object.handle;
 	}
 
-	asyw->state.fence = dma_resv_get_excl_unlocked(nvbo->bo.base.resv);
+	dma_resv_for_each_fence_unlocked(nvbo->bo.base.resv, &cursor, false,
+					 fence) {
+		/* TODO: We only use the first writer here */
+		asyw->state.fence = fence;
+		break;
+	}
 	asyw->image.offset[0] = nvbo->offset;
 
 	if (wndw->func->prepare) {
-- 
2.25.1

