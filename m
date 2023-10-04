Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8395C7B7A14
	for <lists+dri-devel@lfdr.de>; Wed,  4 Oct 2023 10:32:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 458C010E35A;
	Wed,  4 Oct 2023 08:32:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26A8C89167
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Oct 2023 08:32:32 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1c5db4925f9so5413435ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Oct 2023 01:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1696408351; x=1697013151;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZldOxV+c4bwKc6J0kQAYnC3fAIMV5HICSvouxRGQ9mg=;
 b=kKitn7PkN5qsb1DnEHYHwOGl81brEH8q8g3QcEAcPCU01s/+4srg/Q6vIX7Vmj00X/
 2mQ3LpAlsuI8PQhgRlsFxUPDqDKM41cfA774FF+3OEXfSV6wWVKzypnG6CHsCFnzr+B4
 jO4fDwYYG/62kSstdUxAnEn1pUBAevqwfTam0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696408351; x=1697013151;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZldOxV+c4bwKc6J0kQAYnC3fAIMV5HICSvouxRGQ9mg=;
 b=YtqVbOKqq211i6Rhn/Kmk12T/xut7srqLCXZ5oT9jkqzFmf3RuohABKhUW4+S+Wihi
 2pKIz3mFRnbaDG52Brmx49oEZhnpzBysKwuMg3FPhg34aOybN4icQXw8/S2vcUco0Dx3
 JV9N97u1qSXAUgcJpbABnf2Z5yNujNBzzcm2Ct8pbPeD1kD4OrtpQHHEBxXNXxu2QUsB
 rXj8RVXstaeG5nQ+XL9mfHs5vOeKASvNlQ+dQb2x2A6EJqgphG3s2e2nz+lNM/g0d6hT
 +TUIGn0PmlgfguiK8HgLXY8gaJQi8tLaraY3FrYXRgNAkwh2VowvJRlrvxP4d30G3waS
 bA6A==
X-Gm-Message-State: AOJu0YwrnStvlqNtqhw+KcEbdFguuUUy8KSkZuJyAQHqleiya0tbl9lN
 zqSpeT1xm/HUcJS3dIvEHYEKaQ==
X-Google-Smtp-Source: AGHT+IHPFtFRpDAbBWYZ0AkQ+t6cKaHbihDnGlYJ+Lg4L83KqHlHsnttPEhpVTVbh8QLQYPAN7bkZA==
X-Received: by 2002:a17:902:db11:b0:1b8:8682:62fb with SMTP id
 m17-20020a170902db1100b001b8868262fbmr8840475plx.4.1696408351467; 
 Wed, 04 Oct 2023 01:32:31 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:eff2:d66d:cbf7:f41b])
 by smtp.gmail.com with ESMTPSA id
 u11-20020a170902b28b00b001b890009634sm3015940plr.139.2023.10.04.01.32.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Oct 2023 01:32:31 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2] drm/mediatek: Correctly free sg_table in gem prime vmap
Date: Wed,  4 Oct 2023 16:32:24 +0800
Message-ID: <20231004083226.1940055-1-wenst@chromium.org>
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

Also move the "out" shortcut label to after the kfree() call for the
sg_table. Having sg_free_table() together with kfree() makes more sense.
The shortcut is only used when the object already has a kernel address,
in which case the pointer is NULL and kfree() does nothing. Hence this
change causes no functional change.

Fixes: 3df64d7b0a4f ("drm/mediatek: Implement gem prime vmap/vunmap function")
Cc: <stable@vger.kernel.org>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Please merge for v6.6 fixes.

Also, I was wondering why the MediaTek DRM driver implements a lot of
the GEM functionality itself, instead of using the GEM DMA helpers.
From what I could tell, the code closely follows the DMA helpers, except
that it vmaps the buffers only upon request.

 drivers/gpu/drm/mediatek/mtk_drm_gem.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
index 9f364df52478..0e0a41b2f57f 100644
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
@@ -248,12 +249,15 @@ int mtk_drm_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *map)
 	mtk_gem->kvaddr = vmap(mtk_gem->pages, npages, VM_MAP,
 			       pgprot_writecombine(PAGE_KERNEL));
 	if (!mtk_gem->kvaddr) {
+		sg_free_table(sgt);
 		kfree(sgt);
 		kfree(mtk_gem->pages);
 		return -ENOMEM;
 	}
-out:
+	sg_free_table(sgt);
 	kfree(sgt);
+
+out:
 	iosys_map_set_vaddr(map, mtk_gem->kvaddr);
 
 	return 0;
-- 
2.42.0.582.g8ccd20d70d-goog

