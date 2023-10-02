Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B277B4EED
	for <lists+dri-devel@lfdr.de>; Mon,  2 Oct 2023 11:21:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDFDE10E273;
	Mon,  2 Oct 2023 09:21:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E481310E273
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Oct 2023 09:20:57 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-690bd8f89baso12915425b3a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Oct 2023 02:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1696238457; x=1696843257;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HZEAIvCKjKxg1y/mOTHgOyfszBWrD2m6dpbpnehzSJo=;
 b=l+E+2LVmz6OKU1K5Al8wObJSBrm9B86JXh7OJ8+eojWSoFShzjFghYx4PKJqucdZAP
 iSvrQAxrYdHSJHEnBf1TpWBkCNVIEc2gCl/0Pun0I+VpHmoNZB8uEMAn8dRWCcdsMGIQ
 CXLJAJu/T2UOf7qcFJf6177E9A7oBFiZ15YJ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696238457; x=1696843257;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HZEAIvCKjKxg1y/mOTHgOyfszBWrD2m6dpbpnehzSJo=;
 b=OIe84z+yQp1ZKYboncE2fdKgdC4EqEfKI3HE6ls52TBNmC69ZA7QHbuuETtyZiwIAV
 TbLjIW8DSSPlLKuBD8VP9XMALG1VLXMp2Ll4Bxkc8zCJF0M9uzCLm1WJhKf9HaudW2rg
 MRnpVuXp8pZfuoyNAUljME1K+gCYKr6CABzE4L8fq3GhFow+qMaXjI+ZvGxPn6CwSNDg
 5LigL79EuBI5uYuvAWBr7IQ21IzkaVE0I/pVf/b+eZdLFvXujKBOUki0l0fwnTedxX/A
 rE8WSRESBVPyH/V/JZJwtaCLgb9JMQa1H/ULPsNoVd7OnNU9Sy0XSv8IFnbU9Sw8j06w
 hkwA==
X-Gm-Message-State: AOJu0Yx7V7DZcFoZPMinsxM/LuhNHeHMnDI0U7Ls9mQKijRwP5FtJL6R
 cbtZs+5LJOhopqf+tnpDHSf3KQ==
X-Google-Smtp-Source: AGHT+IH+tG+Aai4uuggMfO+rGGTM2xMUkfQN5lWyX+UpJgbKOheJR2hXD3NjLu95wgcSCgr7dLlOhA==
X-Received: by 2002:a05:6a00:21ce:b0:68f:c865:5ba8 with SMTP id
 t14-20020a056a0021ce00b0068fc8655ba8mr10744096pfj.18.1696238457377; 
 Mon, 02 Oct 2023 02:20:57 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:16ed:daa5:ae8c:12dd])
 by smtp.gmail.com with ESMTPSA id
 x26-20020aa784da000000b0068c0fcb40d3sm19164936pfn.211.2023.10.02.02.20.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Oct 2023 02:20:57 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] drm/mediatek: Correctly free sg_table in gem prime vmap
Date: Mon,  2 Oct 2023 17:20:48 +0800
Message-ID: <20231002092051.555479-1-wenst@chromium.org>
X-Mailer: git-send-email 2.42.0.582.g8ccd20d70d-goog
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
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Chen-Yu Tsai <wenst@chromium.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The MediaTek DRM driver implements GEM PRIME vmap by fetching the
sg_table for the object, iterating through the pages, and then
vmapping them. In essence, unlike the GEM DMA helpers which vmap
when the object is first created or imported, the MediaTek version
does it on request.

Unfortunately, the code never correctly frees the sg_table contents.
This results in a kernel memory leak. On a Hayato device with a text
console on the internal display, this results in the system running
out of memory in a few days from all the console screen cursor updates.

Add sg_free_table() to correctly free the contents of the sg_table. This
was missing despite explicitly required by mtk_gem_prime_get_sg_table().

Fixes: 3df64d7b0a4f ("drm/mediatek: Implement gem prime vmap/vunmap function")
Cc: <stable@vger.kernel.org>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Please merge for v6.6 fixes.

Also, I was wondering why the MediaTek DRM driver implements a lot of
the GEM functionality itself, instead of using the GEM DMA helpers.
From what I could tell, the code closely follows the DMA helpers, except
that it vmaps the buffers only upon request.


 drivers/gpu/drm/mediatek/mtk_drm_gem.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
index 9f364df52478..297ee090e02e 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
@@ -239,6 +239,7 @@ int mtk_drm_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *map)
 	npages = obj->size >> PAGE_SHIFT;
 	mtk_gem->pages = kcalloc(npages, sizeof(*mtk_gem->pages), GFP_KERNEL);
 	if (!mtk_gem->pages) {
+		sg_free_table(sgt);
 		kfree(sgt);
 		return -ENOMEM;
 	}
@@ -248,11 +249,13 @@ int mtk_drm_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *map)
 	mtk_gem->kvaddr = vmap(mtk_gem->pages, npages, VM_MAP,
 			       pgprot_writecombine(PAGE_KERNEL));
 	if (!mtk_gem->kvaddr) {
+		sg_free_table(sgt);
 		kfree(sgt);
 		kfree(mtk_gem->pages);
 		return -ENOMEM;
 	}
 out:
+	sg_free_table(sgt);
 	kfree(sgt);
 	iosys_map_set_vaddr(map, mtk_gem->kvaddr);
 
-- 
2.42.0.582.g8ccd20d70d-goog

