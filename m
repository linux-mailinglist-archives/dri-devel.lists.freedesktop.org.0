Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED1A89050A
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 17:23:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D2F910E66F;
	Thu, 28 Mar 2024 16:23:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="nsWvlQpg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D69F910E66F
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 16:23:15 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-6e6a9fafacdso964279b3a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 09:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1711642995; x=1712247795;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=58X8x1UNsNMmiiyq8gcFRSe6N+Bhf8n97M2Kk8Wg5hs=;
 b=nsWvlQpgSBRGFt0aqgSAOdYngk0A/uHL8rnBhtqRmfHXz5kNyTcYApPmd762exF6wi
 VQAYtIegJZvwzvyGo+cdhXF6QYPYykTIF2A9TnpVxwOyXwdjsnJGOHmYQtYCvyUCRCIT
 5luztoAwLwOm6Vjxomk2l1wzYRs+icFVpEHOI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711642995; x=1712247795;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=58X8x1UNsNMmiiyq8gcFRSe6N+Bhf8n97M2Kk8Wg5hs=;
 b=UFqitQlodxoWCNMuS10rS+DuWAvS2/90yv8WEk1LFOVPdHIx13NLZQQb51Ujn2k/cl
 izlDFiqXC3x647EvYCXJJmtG7cSR8Oc/bGAwAsTR59SdlNUgTKlnGgR0AIJjAQaP9yKm
 Lcj6d9KhNTiAFFEa79YuOFEVYabkrylUD4cANzz96D/Vn/fpUuMug3rBKjjaRmfyQeHR
 1d11hrE59WTQ82J//5duBPrMH012r04paC0H5S129VkGcE8XgmxL4iGin4slr/YgvhXF
 Wp7t/VmweM1cN8ZTQPnul+rknRYTkWJSXxM+3Xe5HJ7OpwChjbGfMKCQRC/4LC+ftxmt
 zNuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXn2tzu56OBKJZaxtpTkAraZQHGsxJgwBTE67QFuppNza/eMLKPvRpbCrkxvXfqyYyc8kM9C/z1NT0Osx0sIJutl9NCWwWEGCCjDu6eSSex
X-Gm-Message-State: AOJu0YzvX/Y5Bp29ufuMc9UtlTz8DWjI+YEAD/+Nbs6UuQLUbNXBhX6B
 +Bu8uMbE69BlnFv1A8FlgrC9EfHPENbDfJtqsvNMerUNxpr6Cwa/imOvQ2BR6w==
X-Google-Smtp-Source: AGHT+IH8m4FOpmulMPR4PXwB9kS9sRqEde1d3TfpdPojRq6SCIUP5y0CcdDEYJswVgJiQU/Ul74A2A==
X-Received: by 2002:aa7:8892:0:b0:6e6:f9b8:38eb with SMTP id
 z18-20020aa78892000000b006e6f9b838ebmr3422184pfe.21.1711642995035; 
 Thu, 28 Mar 2024 09:23:15 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:8167:f222:93f:3779])
 by smtp.gmail.com with ESMTPSA id
 o1-20020a056a001b4100b006e6233563cesm1548793pfv.218.2024.03.28.09.23.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Mar 2024 09:23:14 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Douglas Anderson <dianders@chromium.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 CK Hu <ck.hu@mediatek.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nathan Lu <nathan.lu@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH] drm/mediatek: Init `ddp_comp` with devm_kcalloc()
Date: Thu, 28 Mar 2024 09:22:49 -0700
Message-ID: <20240328092248.1.I2e73c38c0f264ee2fa4a09cdd83994e37ba9f541@changeid>
X-Mailer: git-send-email 2.44.0.396.g6e790dbe36-goog
MIME-Version: 1.0
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

In the case where `conn_routes` is true we allocate an extra slot in
the `ddp_comp` array but mtk_drm_crtc_create() never seemed to
initialize it in the test case I ran. For me, this caused a later
crash when we looped through the array in mtk_drm_crtc_mode_valid().
This showed up for me when I booted with `slub_debug=FZPUA` which
poisons the memory initially. Without `slub_debug` I couldn't
reproduce, presumably because the later code handles the value being
NULL and in most cases (not guaranteed in all cases) the memory the
allocator returned started out as 0.

It really doesn't hurt to initialize the array with devm_kcalloc()
since the array is small and the overhead of initting a handful of
elements to 0 is small. In general initting memory to zero is a safer
practice and usually it's suggested to only use the non-initting alloc
functions if you really need to.

Let's switch the function to use an allocation function that zeros the
memory. For me, this avoids the crash.

Fixes: 01389b324c97 ("drm/mediatek: Add connector dynamic selection capability")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
I don't have a ton of experience with this driver to know if the fact
that the array item was still uninitialized when
mtk_drm_crtc_mode_valid() ran is the sign of a bug that should be
fixed. However, even if it is a bug and that bug is fixed then zeroing
memory when we allocate is still safer. If it's a bug that this memory
wasn't initialized then please consider this patch a bug report. ;-)

I'll also note that I reproduced this on a downstream 6.1-based
kernel. It appears that only mt8188 uses `conn_routes` and, as far as
I can tell, mt8188 isn't supported upstream yet.

 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index a04499c4f9ca..29207b2756c1 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -1009,10 +1009,10 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 
 	mtk_crtc->mmsys_dev = priv->mmsys_dev;
 	mtk_crtc->ddp_comp_nr = path_len;
-	mtk_crtc->ddp_comp = devm_kmalloc_array(dev,
-						mtk_crtc->ddp_comp_nr + (conn_routes ? 1 : 0),
-						sizeof(*mtk_crtc->ddp_comp),
-						GFP_KERNEL);
+	mtk_crtc->ddp_comp = devm_kcalloc(dev,
+					  mtk_crtc->ddp_comp_nr + (conn_routes ? 1 : 0),
+					  sizeof(*mtk_crtc->ddp_comp),
+					  GFP_KERNEL);
 	if (!mtk_crtc->ddp_comp)
 		return -ENOMEM;
 
-- 
2.44.0.396.g6e790dbe36-goog

