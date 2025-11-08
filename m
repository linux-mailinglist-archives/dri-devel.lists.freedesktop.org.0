Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CBAC43435
	for <lists+dri-devel@lfdr.de>; Sat, 08 Nov 2025 20:50:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3E9210E201;
	Sat,  8 Nov 2025 19:50:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cDMIDSpL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63AE410E201
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Nov 2025 19:50:11 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4775e891b5eso9004695e9.2
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Nov 2025 11:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762631410; x=1763236210; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qi8xQlvzBSlmsDVPhecyLavK8NOYFA3LF8oQkJrVx+g=;
 b=cDMIDSpL4jH/bn5lsqqOqeNyawBzWOse7Lj9ukiZq4N+P7JRDPSt8OIS8HwJhOFM64
 HF/OdwB+3C4rQVcOo70Nne3O1a/8gpcODOsEo9SZn+wLlwHg0ksC0HiS8X8/AVU1Amka
 6i991RCaY98LxW4E+/zrMMgMUrLWXk4ch4rqbAG10ae1gIsgIX5GzgkK/gscRyEEhLNx
 ZjYvj4buPsuh6XqnuxVrZqQU4KCk+r0orq4qc96u3vy+tq9H0FPa6N2M4yCslhk3kRWY
 GAICRt5uhugV5788pzOKM1DBpbVkHjEZWA+TwBb1MdPWK5HRFSEMUD0RsLiTETFMdrFR
 6nkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762631410; x=1763236210;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=qi8xQlvzBSlmsDVPhecyLavK8NOYFA3LF8oQkJrVx+g=;
 b=ThAME+7N4Yz2dhQAe4FxnyzZxuVkpUPxb2vaZpQgjx3ZH0hCJdkhjY0mMayUmUCzPI
 V0VTRVAJUnO2zqowr7FLhXMS+v5es9A/XPj7pWF+liCSK+hAMsjLcW+s1+Q5pN3Bcw9L
 ylfSrEhYhN9bXxqT9AxB8Q628uhek6a6xIgwp1gO2IYLYqdiirq+mPHXZpZNMboLNv6N
 ev8W1XMXsKU0Y6mRGWaapdQMHph27oMxkeRsMw6zCm9A+ovRD1SiKXjdd2FiPLeivq1f
 KgPWjm2PsZVG3v3ISqFtW8pEtZ2QR4czGdkeR3yOsQaYd6uS8mPAQVCWpCuHpxe5XXxs
 NBkg==
X-Gm-Message-State: AOJu0Yz1TYBI29IdARsEM4ywmhL6wPb+CgBvyXJXvNfmaqaafdvqLWkg
 TX4y7HPPdlnTR2MKVy/rOuihxjMz0NFP9dMQWF1kRnY0vLyFxQXNuoVL
X-Gm-Gg: ASbGnct8Mt6/ob14heD77BIS2oYEJkwvGT7QxHcm3YxRzSa6W9O0bLbNC5jpwCN2zZL
 ecou2dq4YawjBiUWbU2ujTOwApix16brccuqUboorbvd9OLuHYpD0LKiLxUBlC+z0FGdkEuk2E+
 6FKIZBXJ0jxiY7O5inE6atPDiiUoRkDgAnrawpIURLxXWiOm/md4T1M6dEjRP5zWhjtdIJsoBQ+
 33fzskEeENCLECLzUNdRoJpVj96HcKtVYGJVedCBIUjlUawZv9hmDwBzZ33TdMQ+SyB/jLhAlWy
 ARoBVQVoSRDOR4lrmrzLh153DjKQ0Xqh4LJT6g4rsY08s7/mKoeuvwym9kkP7b0leGPR7aD9Re+
 zoxFFl5gn14Cb/XrY5szachQuDKrE0aV6uEWnMqIJwLm8a4I0aYXpwc0JOcmA/rcq1Bg9A1iU+/
 1r2j9gHQPef8y+JcnHfcSb
X-Google-Smtp-Source: AGHT+IGJ0mquGZTUHobdRtGScO/j12gECXAEL4G/mW7xZCyE1L9MtsLoPR7OPQcLTRH+LMInpSE23A==
X-Received: by 2002:a05:600c:138b:b0:475:ddf7:995e with SMTP id
 5b1f17b1804b1-477732341demr30177645e9.12.1762631409686; 
 Sat, 08 Nov 2025 11:50:09 -0800 (PST)
Received: from fedora ([156.208.73.128]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4775cdc33bdsm233461435e9.1.2025.11.08.11.50.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Nov 2025 11:50:09 -0800 (PST)
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
 Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>,
 James Jones <jajones@nvidia.com>
Subject: [PATCH v5 3/5] drm/nouveau/mmu/gp100: Remove unused/broken support
 for compression
Date: Sat,  8 Nov 2025 21:49:17 +0200
Message-ID: <20251108194919.68754-4-mohamedahmedegypt2001@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251108194919.68754-1-mohamedahmedegypt2001@gmail.com>
References: <20251108194919.68754-1-mohamedahmedegypt2001@gmail.com>
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
Reviewed-by: James Jones <jajones@nvidia.com>
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

