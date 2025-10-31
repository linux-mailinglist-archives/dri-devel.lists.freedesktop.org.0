Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A15C249C4
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 11:49:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C16A10EBA9;
	Fri, 31 Oct 2025 10:49:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jaydmAos";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A665D10EBAA
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 10:49:55 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-47112edf9f7so16745455e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 03:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761907794; x=1762512594; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ultisk0LTvrj8uqMnV5HKpTwdWn+r1ljzwjarHhGTc0=;
 b=jaydmAosKcj3Gbyuxh4606yyeqIEWOys47wHyrpvx8VPEE/S97PT24QRU+AGJhfSxc
 WUlKEnqgwKzcHmZpcsHUcDJg4QtoyEU6STVvXUf3yudvv4eLRpl4BGmD+gSvVf2C6L0U
 7yoCMfxp7FjbrHoYOPevdJ8sDnQvQbMsXryOv/VMaQVr+fRnuVhLHlVXNgPUBXS3+4iq
 u//WvyZa65XE9bhFwxXRyA3shyf+rlYXgLWxKuE/qmna2Rl7xFpsW6yHg28Gx1EMyd5r
 Hx2XDbZn5/R4bNy/gdXXWvJKqCajf4RyzcjJzogL6fMVS5zs04R74y49GfLDDR8AbAyB
 BMfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761907794; x=1762512594;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ultisk0LTvrj8uqMnV5HKpTwdWn+r1ljzwjarHhGTc0=;
 b=GUKU0r+bp6rLRZjFzoT/mFFATDuLpBu8LXrcJ4mf5jEhcYI7QJOQwUA8BJe/KOdHcz
 LA9LTvGNe9oi8bFotPxUBGclDF46TgFhyH0xUkD72WtGCzGMYHHX+QT5i2yyAYxk4PUb
 +/BwaaGxTiGyBFwDwLV3iamL9EbgO/eS5LNIfA+8EsJk+b16y9g+hJ1tLsyyQGxEpl5G
 qneYvHKPCa1HbVwR/9R9XTPVTsKgxSIFlfkS1wcUhcZdYgySuUGHDSeFXw50nJhyZP+8
 aAJDWISpPZzIx21y/5R8wTtTIGn/Kt2EgcKf/Q/G3KPNz57EpJmYUOu+mUlyf8i640ac
 W8Gg==
X-Gm-Message-State: AOJu0YwBK1covbpo6SanbTiOQ4dwmFZhuIpA3UH5w5aKZX5QHida6oSq
 0N6TZGgxtdk56oS37SQaTGGUirw//ro5VfpRNsqkxoSvG0priq3RICko
X-Gm-Gg: ASbGnctvA30vOg1kJ9ggktsnTg+h9ebYvQmXWu9Yb4rfssK5grrxFYmVRp8aFR7TPFF
 DKAAotaCw5CJYcU4V6dYjscMWanGjirggCgRJVvFOfCKT7jlPEj8ZRuB6uhV7gOZcwQQyNaUCUK
 bF0mBE3iHm0ZWxgMLz2ikO3hFIKzVzN3AHxMBCMxb8g8tUjkmCrmEs+OH4/Sc5GeDM9+N7LjuT0
 nODlRBm7h6C2wfNSwojbu8XWZAbd5HNhlaU99a5+tBSFvbEegmfxlyPS6+jDpJ9w4IcA+DjdjRm
 1mGD5+ImVpq+L8tWikmRrmDt6SCTCPZYfTbnL/vpvhucb5gSReep/D6888hSb9Eej9uG+v6Ecft
 0l3R061cnCueiObJmZXptI0ZDEri11STnxDeUyQYE7Q9Kj7Bc31L1ZvTJ4b5UcTbmkcdgYhKeAD
 MvVA8QWqzF6Z3yDK68VXya4g==
X-Google-Smtp-Source: AGHT+IEHSKHsiRZqynSqJrt3dPUmRM03bePpniQMubUnp99Gzx7fJ+iI2PEvs2CkE9jbxNq/Xbd7UQ==
X-Received: by 2002:a05:600c:4695:b0:471:1774:3003 with SMTP id
 5b1f17b1804b1-477308be7b3mr31572655e9.29.1761907794096; 
 Fri, 31 Oct 2025 03:49:54 -0700 (PDT)
Received: from fedora ([154.182.161.198]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4772fcf7d07sm19498025e9.9.2025.10.31.03.49.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Oct 2025 03:49:53 -0700 (PDT)
From: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Mary Guillemard <mary@mary.zone>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, nouveau@lists.freedesktop.org,
 Ben Skeggs <bskeggs@nvidia.com>,
 Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
Subject: [PATCH v4 3/5] drm/nouveau/mmu/gp100: Remove unused/broken support
 for compression
Date: Fri, 31 Oct 2025 12:49:22 +0200
Message-ID: <20251031104924.10631-4-mohamedahmedegypt2001@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251031104924.10631-1-mohamedahmedegypt2001@gmail.com>
References: <20251031104924.10631-1-mohamedahmedegypt2001@gmail.com>
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

From: Ben Skeggs <bskeggs@nvidia.com>

From GP100 onwards it's not possible to initialise comptag RAM without
PMU firmware, which nouveau has no support for.

As such, this code is essentially a no-op and will always revert to the
equivalent non-compressed kind due to comptag allocation failure.  It's
also broken for the needs of VM_BIND/Vulkan.

Remove the code entirely to make way for supporting compression on GPUs
that support GSM-RM.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
Signed-off-by: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
---
 .../drm/nouveau/nvkm/subdev/mmu/vmmgp100.c    | 39 ++-----------------
 .../drm/nouveau/nvkm/subdev/mmu/vmmgp10b.c    |  4 +-
 2 files changed, 6 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
index 851fd847a2a9..ecff1096a1bb 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
@@ -21,9 +21,7 @@
  */
 #include "vmm.h"
 
-#include <core/client.h>
 #include <subdev/fb.h>
-#include <subdev/ltc.h>
 #include <subdev/timer.h>
 #include <engine/gr.h>
 
@@ -117,8 +115,6 @@ gp100_vmm_pgt_pte(struct nvkm_vmm *vmm, struct nvkm_mmu_pt *pt,
 {
 	u64 data = (addr >> 4) | map->type;
 
-	map->type += ptes * map->ctag;
-
 	while (ptes--) {
 		VMM_WO064(pt, vmm, ptei++ * 8, data);
 		data += map->next;
@@ -142,7 +138,6 @@ gp100_vmm_pgt_dma(struct nvkm_vmm *vmm, struct nvkm_mmu_pt *pt,
 		while (ptes--) {
 			const u64 data = (*map->dma++ >> 4) | map->type;
 			VMM_WO064(pt, vmm, ptei++ * 8, data);
-			map->type += map->ctag;
 		}
 		nvkm_done(pt->memory);
 		return;
@@ -200,8 +195,6 @@ gp100_vmm_pd0_pte(struct nvkm_vmm *vmm, struct nvkm_mmu_pt *pt,
 {
 	u64 data = (addr >> 4) | map->type;
 
-	map->type += ptes * map->ctag;
-
 	while (ptes--) {
 		VMM_WO128(pt, vmm, ptei++ * 0x10, data, 0ULL);
 		data += map->next;
@@ -411,8 +404,6 @@ gp100_vmm_valid(struct nvkm_vmm *vmm, void *argv, u32 argc,
 		struct gp100_vmm_map_vn vn;
 		struct gp100_vmm_map_v0 v0;
 	} *args = argv;
-	struct nvkm_device *device = vmm->mmu->subdev.device;
-	struct nvkm_memory *memory = map->memory;
 	u8  kind, kind_inv, priv, ro, vol;
 	int kindn, aper, ret = -ENOSYS;
 	const u8 *kindm;
@@ -450,30 +441,8 @@ gp100_vmm_valid(struct nvkm_vmm *vmm, void *argv, u32 argc,
 	}
 
 	if (kindm[kind] != kind) {
-		u64 tags = nvkm_memory_size(memory) >> 16;
-		if (aper != 0 || !(page->type & NVKM_VMM_PAGE_COMP)) {
-			VMM_DEBUG(vmm, "comp %d %02x", aper, page->type);
-			return -EINVAL;
-		}
-
-		if (!map->no_comp) {
-			ret = nvkm_memory_tags_get(memory, device, tags,
-						   nvkm_ltc_tags_clear,
-						   &map->tags);
-			if (ret) {
-				VMM_DEBUG(vmm, "comp %d", ret);
-				return ret;
-			}
-		}
-
-		if (!map->no_comp && map->tags->mn) {
-			tags = map->tags->mn->offset + (map->offset >> 16);
-			map->ctag |= ((1ULL << page->shift) >> 16) << 36;
-			map->type |= tags << 36;
-			map->next |= map->ctag;
-		} else {
-			kind = kindm[kind];
-		}
+		/* Revert to non-compressed kind. */
+		kind = kindm[kind];
 	}
 
 	map->type |= BIT(0);
@@ -592,8 +561,8 @@ gp100_vmm = {
 		{ 47, &gp100_vmm_desc_16[4], NVKM_VMM_PAGE_Sxxx },
 		{ 38, &gp100_vmm_desc_16[3], NVKM_VMM_PAGE_Sxxx },
 		{ 29, &gp100_vmm_desc_16[2], NVKM_VMM_PAGE_Sxxx },
-		{ 21, &gp100_vmm_desc_16[1], NVKM_VMM_PAGE_SVxC },
-		{ 16, &gp100_vmm_desc_16[0], NVKM_VMM_PAGE_SVxC },
+		{ 21, &gp100_vmm_desc_16[1], NVKM_VMM_PAGE_SVxx },
+		{ 16, &gp100_vmm_desc_16[0], NVKM_VMM_PAGE_SVxx },
 		{ 12, &gp100_vmm_desc_12[0], NVKM_VMM_PAGE_SVHx },
 		{}
 	}
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp10b.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp10b.c
index e081239afe58..5791d134962b 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp10b.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp10b.c
@@ -34,8 +34,8 @@ gp10b_vmm = {
 		{ 47, &gp100_vmm_desc_16[4], NVKM_VMM_PAGE_Sxxx },
 		{ 38, &gp100_vmm_desc_16[3], NVKM_VMM_PAGE_Sxxx },
 		{ 29, &gp100_vmm_desc_16[2], NVKM_VMM_PAGE_Sxxx },
-		{ 21, &gp100_vmm_desc_16[1], NVKM_VMM_PAGE_SxHC },
-		{ 16, &gp100_vmm_desc_16[0], NVKM_VMM_PAGE_SxHC },
+		{ 21, &gp100_vmm_desc_16[1], NVKM_VMM_PAGE_SxHx },
+		{ 16, &gp100_vmm_desc_16[0], NVKM_VMM_PAGE_SxHx },
 		{ 12, &gp100_vmm_desc_12[0], NVKM_VMM_PAGE_SxHx },
 		{}
 	}
-- 
2.51.1

