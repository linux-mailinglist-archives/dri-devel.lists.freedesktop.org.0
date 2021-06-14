Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5733A76C8
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jun 2021 07:52:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36C9389F3C;
	Tue, 15 Jun 2021 05:52:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3A4689D30
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jun 2021 12:45:43 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id q25so10475068pfh.7
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jun 2021 05:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=0WPH3hjxXBLsSpR7DWHsVJlt9dhkg5b/9bT0LLsWmo0=;
 b=ZG0sX2lQCF9+s9b3JXRpSAFu3a+dyqh8u264TEvZUod7aE9f7jmj/EcQtCQPMSy0XU
 q6V7ZIImpi3E4fyA4Sgl32befqpBoWLXMb1r31el8SdtftiIZLABolBoM/f0gtTrTe8O
 Pp+DGQd18YckizMSqdAorKKGWdRxkJtnvgcCw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=0WPH3hjxXBLsSpR7DWHsVJlt9dhkg5b/9bT0LLsWmo0=;
 b=WN/eEr+QkVtp7lMx4CdUwTVZ/OwqXVni8InrLOYhIePD7SxftyrJjUlnuEutfCJKxx
 4ok6l0lSqYwVKDhqWLpRL8rhyZB03/LAVgc9MKXLlc0CdUMYBVyZMTbPkL4xFSAcq+Bi
 DR5VstSkJbw94ej0Qia9y7Aso8eqsluzcYV5ztoXqdnndL9P1ihBwhkEAXUXY683eTQt
 Lxl6yXl5g1Kk7nedRrQXV0+9eQuho74ximFvyO1pIxD0oVZMKxV81R/vc82ACC1KM3wh
 qIMPiPyWBZIrxr7wg2VsLraf4xOYSiasSUXOYTQlg/VUcKsqToGAG4sSlnowpTLT0xBP
 u36A==
X-Gm-Message-State: AOAM531FhGsxgS4MEOOcu+e8stS5pqjc/E/7FIYaCwH3k05l5kGK0k9c
 RibZ8OzU5gJNop/zh/waxwR1Nvfkrcmucg==
X-Google-Smtp-Source: ABdhPJyVl60sQemzfpMYfU7sBdra5ITiOkMCODvou3wJumVZHT15gIThHUNcK01ELLsBz9W2sLkV1Q==
X-Received: by 2002:a63:3ec3:: with SMTP id
 l186mr16665906pga.371.1623674743459; 
 Mon, 14 Jun 2021 05:45:43 -0700 (PDT)
Received: from google.com ([2409:10:2e40:5100:f64:2ecb:b3c0:fd80])
 by smtp.gmail.com with ESMTPSA id mi10sm16609030pjb.10.2021.06.14.05.45.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 05:45:42 -0700 (PDT)
Date: Mon, 14 Jun 2021 21:45:37 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Chris Wilson <chris@chris-wilson.co.uk>
Subject: drm/i915: __GFP_RETRY_MAYFAIL allocations in stable kernels
Message-ID: <YMdPcWZi4x7vnCxI@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailman-Approved-At: Tue, 15 Jun 2021 05:52:29 +0000
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

We are observing some user-space crashes (sigabort, segfaults etc.)
under moderate memory pressure (pretty far from severe pressure) which
have one thing in common - restrictive GFP mask in setup_scratch_page().

For instance, (stable 4.19) drivers/gpu/drm/i915/i915_gem_gtt.c

(trimmed down version)

static int gen8_init_scratch(struct i915_address_space *vm)
{
        setup_scratch_page(vm, __GFP_HIGHMEM);

        vm->scratch_pt = alloc_pt(vm);
        vm->scratch_pd = alloc_pd(vm);
        if (use_4lvl(vm)) {
                vm->scratch_pdp = alloc_pdp(vm);
        }
}

gen8_init_scratch() function puts a rather inconsistent restrictions on mm.

Looking at it line by line:

setup_scratch_page() uses very restrictive gfp mask:
	__GFP_HIGHMEM | __GFP_ZERO | __GFP_RETRY_MAYFAIL

it doesn't try to reclaim anything and fails almost immediately.

alloc_pt() - uses more permissive gfp mask:
	GFP_KERNEL | __GFP_RETRY_MAYFAIL | __GFP_NOWARN

alloc_pd() - likewise:
	GFP_KERNEL | __GFP_RETRY_MAYFAIL | __GFP_NOWARN

alloc_pdp() - very permissive gfp mask:
	GFP_KERNEL


So can all allocations in gen8_init_scratch() use
	GFP_KERNEL | __GFP_RETRY_MAYFAIL | __GFP_NOWARN
?

E.g.

---
diff --git a/drivers/gpu/drm/i915/i915_gem_gtt.c b/drivers/gpu/drm/i915/i915_gem_gtt.c
index a12430187108..e862680b9c93 100644
--- a/drivers/gpu/drm/i915/i915_gem_gtt.c
+++ b/drivers/gpu/drm/i915/i915_gem_gtt.c
@@ -792,7 +792,7 @@ alloc_pdp(struct i915_address_space *vm)
 
        GEM_BUG_ON(!use_4lvl(vm));
 
-       pdp = kzalloc(sizeof(*pdp), GFP_KERNEL);
+       pdp = kzalloc(sizeof(*pdp), I915_GFP_ALLOW_FAIL);
        if (!pdp)
                return ERR_PTR(-ENOMEM);
 
@@ -1262,7 +1262,7 @@ static int gen8_init_scratch(struct i915_address_space *vm)
 {
        int ret;
 
-       ret = setup_scratch_page(vm, __GFP_HIGHMEM);
+       ret = setup_scratch_page(vm, GFP_KERNEL | __GFP_HIGHMEM);
        if (ret)
                return ret;
 
@@ -1972,7 +1972,7 @@ static int gen6_ppgtt_init_scratch(struct gen6_hw_ppgtt *ppgtt)
        u32 pde;
        int ret;
 
-       ret = setup_scratch_page(vm, __GFP_HIGHMEM);
+       ret = setup_scratch_page(vm, GFP_KERNEL | __GFP_HIGHMEM);
        if (ret)
                return ret;
 
@@ -3078,7 +3078,7 @@ static int ggtt_probe_common(struct i915_ggtt *ggtt, u64 size)
                return -ENOMEM;
        }
 
-       ret = setup_scratch_page(&ggtt->vm, GFP_DMA32);
+       ret = setup_scratch_page(&ggtt->vm, GFP_KERNEL | GFP_DMA32);
        if (ret) {
                DRM_ERROR("Scratch setup failed\n");
                /* iounmap will also get called at remove, but meh */
---



It's quite similar on stable 5.4 - setup_scratch_page() uses restrictive
gfp mask again.

---
diff --git a/drivers/gpu/drm/i915/i915_gem_gtt.c b/drivers/gpu/drm/i915/i915_gem_gtt.c
index f614646ed3f9..99d78b1052df 100644
--- a/drivers/gpu/drm/i915/i915_gem_gtt.c
+++ b/drivers/gpu/drm/i915/i915_gem_gtt.c
@@ -1378,7 +1378,7 @@ static int gen8_init_scratch(struct i915_address_space *vm)
                return 0;
        }
 
-       ret = setup_scratch_page(vm, __GFP_HIGHMEM);
+       ret = setup_scratch_page(vm, GFP_KERNEL | __GFP_HIGHMEM);
        if (ret)
                return ret;
 
@@ -1753,7 +1753,7 @@ static int gen6_ppgtt_init_scratch(struct gen6_ppgtt *ppgtt)
        struct i915_page_directory * const pd = ppgtt->base.pd;
        int ret;
 
-       ret = setup_scratch_page(vm, __GFP_HIGHMEM);
+       ret = setup_scratch_page(vm, GFP_KERNEL | __GFP_HIGHMEM);
        if (ret)
                return ret;
 
@@ -2860,7 +2860,7 @@ static int ggtt_probe_common(struct i915_ggtt *ggtt, u64 size)
                return -ENOMEM;
        }
 
-       ret = setup_scratch_page(&ggtt->vm, GFP_DMA32);
+       ret = setup_scratch_page(&ggtt->vm, GFP_KERNEL | GFP_DMA32);
        if (ret) {
                DRM_ERROR("Scratch setup failed\n");
                /* iounmap will also get called at remove, but meh */
---
