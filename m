Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09017BBF132
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 21:14:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FEAA10E44D;
	Mon,  6 Oct 2025 19:14:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VyiXNkCy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AEAF10E44D
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Oct 2025 19:14:16 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-3ee1221ceaaso4018465f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Oct 2025 12:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759778054; x=1760382854; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1j0V90HxcPRVTKrhHkvxSsBjf2AtjVnHy6SmuJWd4uc=;
 b=VyiXNkCyI/ruPOOUtrfyqjZysCapCeA+OHMxG2fG9V9EIqbs1uWHYZpwXjCBJXSdyG
 zZskBgVLoG2s/cEx512jk/iQqKDwKRR7prOQuwokWMtFCR8hrfiGLDKWtcd8MFRUnBHY
 0xYtpbUcVrS6g6ueB8X1f72+yB+nRopktv31s3SfU4GA7K7AYFLVKxxpwN6f+nS7l9qL
 2adJSsYtDMO6GTtApMmw5zhnDAwFoIUB7WT7cBN2MBt9BUYBCfqzD0Rhl+NLiGC2bIT1
 thQXUaRRDuyLPbDeB+b7IicGxJhmjWxUUm64g0iqvTou7XOcg62v+plSqJ/C6V3Fu9WA
 atCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759778054; x=1760382854;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1j0V90HxcPRVTKrhHkvxSsBjf2AtjVnHy6SmuJWd4uc=;
 b=tCuD4AlARGlEjiI/4vGzgUgp/1qJjx83W7is5pI215wYn+5Y9cVctDJ7cw6cs/YJFB
 gPSNMDnbrf3TfpXKR0zjKRwMaAOlhKu7vIGUsbYW4A8DObJL+PJyYVHvR5UYDlIDeP/v
 2qtGLm0Qeqqw5tC6SgpLWlnb4DxW8bP/IHh/Put+okk8vXA2H0yG+ccsI8XyuIvIUmVB
 1Cjgyrrj1NW0doeKCpKR0U0pL+jkuhGOhQmtS8i0LXWD5DFnXzHhqBIElhkIVB1fGX65
 x1BoBlAR64TLRoY7AFFa5NT2FYntDKaI4nTh3JPDglmGMNCl+ezPs9b8I5bsNx+PkE76
 nAfQ==
X-Gm-Message-State: AOJu0YyBGJG5eA50si9aGCaYw15Wk+WLWFF304M54DPQw7pExLrGVeHB
 ETMe+9iviy4cT6TCoIATdmnXiSZemFW26vdf3j4lL+sHrjuaPpDPRCqq
X-Gm-Gg: ASbGncugRR3Sb4aROTyayg4G+0mrflLlGmrsjjgkNvgpJrN08njkJ9n4EBZRdc9Da7P
 aj/awzKGqz6L4Hok1s6GE6KWIAKLcroqS3WL1k7kea4Mq+wTwjsbn2WhR8OD40FQkhAbtLIrmVK
 Mb52g4DJDLQ7fbOfkaRHjEgKcgUrF95bSL9a0fKGT7BFFTrbLBqR7vt4WHGXX8j5bGrIOi7Wnsv
 mfyXDtHArFBaJHGMIZXcjZDXmk8zhzjdyZyZCq66fSSPmGogUjoGSZXxpw6IB3gj8ry732OSQyc
 TLXnQXBzLN6+urnhhPJ1mHsa2qXfxVxRo/ycTjmobYXpfSNuZ9hOrN7PtqLE3xr1gHJ0n9F91U5
 3mLgdwMEOgHEQEdHt60Bunpz5JEbqFHKqhD9XqOnFOS4xVDPKsSDRvPH/HX0nG24bNpTNTKw+Jf
 gYcdw=
X-Google-Smtp-Source: AGHT+IFUbfCqi9C93YR2bP5dtsE3l+2iS9CguomaGDGXJEXk2nSHZJBr5r0pl0Mosg68LCW/bIjt9A==
X-Received: by 2002:a05:6000:1842:b0:3c8:7fbf:2d6d with SMTP id
 ffacd0b85a97d-425671b28ecmr7651955f8f.50.1759778054388; 
 Mon, 06 Oct 2025 12:14:14 -0700 (PDT)
Received: from fedora ([154.182.208.105]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4256866060fsm16646435f8f.14.2025.10.06.12.14.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Oct 2025 12:14:13 -0700 (PDT)
From: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Mary Guillemard <mary@mary.zone>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, nouveau@lists.freedesktop.org
Subject: [PATCH 2/5] drm/nouveau/uvmm: Allow larger pages
Date: Mon,  6 Oct 2025 22:13:25 +0300
Message-ID: <20251006191329.277485-3-mohamedahmedegypt2001@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251006191329.277485-1-mohamedahmedegypt2001@gmail.com>
References: <20251006191329.277485-1-mohamedahmedegypt2001@gmail.com>
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

From: Mary Guillemard <mary@mary.zone>

Now that everything in UVMM knows about the variable page shift, we can
select larger values.

The proposed approach rely on nouveau_bo::page unless it would cause
alignment issues (in which case we fall back to searching an appropriate
shift)

Co-developed-by: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
Signed-off-by: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
Signed-off-by: Mary Guillemard <mary@mary.zone>
---
 drivers/gpu/drm/nouveau/nouveau_uvmm.c | 55 +++++++++++++++++++++++++-
 1 file changed, 53 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index a92c729600d6..c336a121e320 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -454,6 +454,56 @@ op_unmap_prepare_unwind(struct drm_gpuva *va)
 	drm_gpuva_insert(va->vm, va);
 }
 
+static bool
+op_map_aligned_to_page_shift(const struct drm_gpuva_op_map *op, u8 page_shift)
+{
+	u64 page_size = 1ULL << page_shift;
+
+	return op->va.addr % page_size == 0 && op->va.range % page_size == 0 &&
+		   op->gem.offset % page_size == 0;
+}
+
+static u8
+select_page_shift(struct nouveau_uvmm *uvmm, struct drm_gpuva_op_map *op)
+{
+	struct nouveau_bo *nvbo = nouveau_gem_object(op->gem.obj);
+
+	if (nvbo) {
+		/* If the BO preferred page shift already fits, use it. */
+		if (op_map_aligned_to_page_shift(op, nvbo->page))
+			return nvbo->page;
+
+		struct nouveau_mem *mem = nouveau_mem(nvbo->bo.resource);
+		struct nvif_vmm *vmm = &uvmm->vmm.vmm;
+		int i;
+
+		/* Otherwise let's find a granuality that will fit. */
+		for (i = 0; i < vmm->page_nr; i++) {
+			/* Ignore anything that is bigger or identical to the BO preference. */
+			if (vmm->page[i].shift >= nvbo->page)
+				continue;
+
+			/* Skip incompatible domains. */
+			if ((mem->mem.type & NVIF_MEM_VRAM) && !vmm->page[i].vram)
+				continue;
+			if ((mem->mem.type & NVIF_MEM_HOST) &&
+			    (!vmm->page[i].host || vmm->page[i].shift > PAGE_SHIFT))
+				continue;
+
+			/* If it fits, return the proposed shift. */
+			if (op_map_aligned_to_page_shift(op, vmm->page[i].shift))
+				return vmm->page[i].shift;
+		}
+
+		/* If we get here then nothing can reconcile the requirements. This should never
+		 * happen.
+		 */
+		WARN_ON(1);
+	}
+
+	return PAGE_SHIFT;
+}
+
 static void
 nouveau_uvmm_sm_prepare_unwind(struct nouveau_uvmm *uvmm,
 			       struct nouveau_uvma_prealloc *new,
@@ -506,7 +556,7 @@ nouveau_uvmm_sm_prepare_unwind(struct nouveau_uvmm *uvmm,
 			if (vmm_get_range)
 				nouveau_uvmm_vmm_put(uvmm, vmm_get_start,
 						     vmm_get_range,
-						     PAGE_SHIFT);
+						     select_page_shift(uvmm, &op->map));
 			break;
 		}
 		case DRM_GPUVA_OP_REMAP: {
@@ -636,7 +686,8 @@ nouveau_uvmm_sm_prepare(struct nouveau_uvmm *uvmm,
 		case DRM_GPUVA_OP_MAP: {
 			u64 vmm_get_range = vmm_get_end - vmm_get_start;
 
-			ret = op_map_prepare(uvmm, &new->map, &op->map, args, PAGE_SHIFT);
+			ret = op_map_prepare(uvmm, &new->map, &op->map, args,
+					     select_page_shift(uvmm, &op->map));
 			if (ret)
 				goto unwind;
 
-- 
2.51.0

