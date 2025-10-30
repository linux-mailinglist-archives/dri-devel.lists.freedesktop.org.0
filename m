Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB47C22A0F
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 00:04:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DC3D10EA69;
	Thu, 30 Oct 2025 23:04:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fTl1F5ml";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B4F910EA69
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 23:04:33 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4711b95226dso20562915e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 16:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761865472; x=1762470272; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ultisk0LTvrj8uqMnV5HKpTwdWn+r1ljzwjarHhGTc0=;
 b=fTl1F5mlf0mmKsuFa9R9GqrcEtqs5l6AdXtu7oJQYTMXuhnPuBu3NKIYW4amHsmzU+
 B8r8gU4oVPwDjl7+eKQAJ9CC9mKXAwE8+6g0PKoxfaDBf15lspz6+2Xl+fapyBWZbBmb
 MlmOZhoSELrfsDteyajcIvRq6mJ7EhtwWoRg6xNWDJS1PDJYTXaDmDLL0UcbUM5pn6v0
 Ec8g1oq/seh9A3ZK69MRrn1TKfaqy+vPro2oJLWcyEONQ9N+ul0idKDgub6yi+5awHgX
 wNWraS66HFYoSc7vxfYuQaB4Ui/LXY+poG0uP6bYQBa0S7PQVAY0mF9FY7XB19vdhd4a
 8QMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761865472; x=1762470272;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ultisk0LTvrj8uqMnV5HKpTwdWn+r1ljzwjarHhGTc0=;
 b=Iwi4/UyB4dnHSrMHeZ8PPoh4bK7vTIIwYTnIBziB38QRD6PHmi9RwcfaWVQeinA4L1
 phlOU3adMs3qGWhqOwh0sphWKx4aSIxM2ubJ+9jtUX59EbC7XZfHUexLSPKidssPgjF0
 tEJ6+wZJrRovpuvRxJ9IkYV4bXcr8S2uD4pbKVXYqRe9Vmw3H9v8Gs4R9V9bvYk3jd2w
 nuf8disHSSebJOhK+9pM66YRZ7CmKtqiZ3L2C7hnGcB/kyi8gt2i52hOpuIq3Dwh2Cf4
 G0iNJYVzaI5J/dv1/JbijER/VRHY6FKZOhLBvUn4/P6n84FHOKRZMS2LQrLpweg6I7l8
 r/Ow==
X-Gm-Message-State: AOJu0YzTK2IuvsU8XLcmg8rV5828LI6kq2kg6ZdEHSld7gfj7HPr/spM
 W/k/WebADh47yD2q7S+iaHhGKPWRllruzDVCE7QP4DVI0hVpLdibXkTE
X-Gm-Gg: ASbGncsceIOPXalNyA/tse188+sx+fbbiwwAiU4lFvhsku6o6QaCcjvgR2mhc51Rt+k
 zcyZJ1qoyJw6Z/OBqL8801Ve2GhLee9vVvhWsivrmn3m/QUksuXeiysspcR/+EDS/vBXfMSRMeq
 vqDcwRSGNLbQMPI8B7jSpwQ6kvd4/AwukJamnXUBhXCJPgGqoHEh39tN9Rl/yYCfWH0UMH1ZvwF
 NeVYFqMns4Wc/YTOoeV0+EvC/7BXfyHTmDnqQeo0Pwa8VhBH6v71XYZUoRYq7DhyVpUgCfSmySt
 T4RNCnpNYwEugI+jdTs2Z6DN/tltpcr65lE+haJqMe9HWVKyTbzY8zXbHUPDoyorikb1k5sZVoX
 yMznLAt5w+Gsi3mc/zLClGgxWmPrg3WV5swlRj2OPfsNy2DTvtR83q4FLulVfNIdlTOeRmgCpyW
 LUWdZHWRslGO8lqJcWptcdk86yaHgZsI+6
X-Google-Smtp-Source: AGHT+IFlWust8iq3x6eNp1+tkDyEzKkeBYIiGz+XhjWpGCSMYnkzi9Rvv4VNhEjjagfH257BWjyiZA==
X-Received: by 2002:a05:600c:83c8:b0:477:1ae1:fa5d with SMTP id
 5b1f17b1804b1-4773087b0d0mr10710235e9.20.1761865471717; 
 Thu, 30 Oct 2025 16:04:31 -0700 (PDT)
Received: from fedora ([154.182.161.198]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47732ff8235sm2227025e9.14.2025.10.30.16.04.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Oct 2025 16:04:29 -0700 (PDT)
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
Subject: [PATCH v3 3/5] drm/nouveau/mmu/gp100: Remove unused/broken support
 for compression
Date: Fri, 31 Oct 2025 01:03:55 +0200
Message-ID: <20251030230357.45070-4-mohamedahmedegypt2001@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251030230357.45070-1-mohamedahmedegypt2001@gmail.com>
References: <20251030230357.45070-1-mohamedahmedegypt2001@gmail.com>
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

