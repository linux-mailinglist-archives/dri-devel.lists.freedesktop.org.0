Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0638077F4
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 19:47:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E37410E742;
	Wed,  6 Dec 2023 18:47:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [IPv6:2607:f8b0:4864:20::f36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 190EE10E742
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 18:47:49 +0000 (UTC)
Received: by mail-qv1-xf36.google.com with SMTP id
 6a1803df08f44-67adac40221so884786d6.2
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Dec 2023 10:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1701888468; x=1702493268;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=v4q9MyQ/r2TBjpMUXQEhWuBacEcVfTmwF7KmTnqv12Q=;
 b=GsncBG1xi0KDQnzIZfxuugRDQBDgC/k05AXkVs8kF8tQ8dC0mDL1IZ7u3l5Mr5ObpZ
 1AxbJNOTciNhVME7JQjWvnsM4wmMDLCikav9IFDlV0zoljfZNBtqOcE71MhcCneQz5SC
 uCgjkcHfN9sFfb6N4lZ7BkX5TBfHjCs2716zA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701888468; x=1702493268;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v4q9MyQ/r2TBjpMUXQEhWuBacEcVfTmwF7KmTnqv12Q=;
 b=GjtinEElrvQLVj+CIgINTa3mqY7fx+LvFrDDTzJ+y335fflTpVM1ThBU8yz3KNJi7R
 HdnbDve0mRWALnmTF2cqVyYFQ+jaG4TVZYiW28kBL4s5LGwQoWOpsWYqUS7YQVkdZC+k
 e61wDSuKBtUB8vWSxMXVaKsZGtRBAQFxZIH6wRbe6usb5Ovcyu6JmDN8204QpMAea6tR
 7Yn0FF3lFM5rb7QGfTGAe3LpztQmKFWbldAPqkIUv7kV/Y/265rMB6grFaqEJis886Mi
 XHr8PD39IuFgDZ8aoY65+uugzuRI+MHqo/il/87zxOe4tzZlWq9XyOEQfr0tGEdBR5tI
 DKXA==
X-Gm-Message-State: AOJu0YyhSsmDtiD4lSnxcTiT/0rqBbYz8K/+6wktietqpMJs+KHhg9KX
 EHfDdEn1XnHTzlnUtvU8ppmE+g==
X-Google-Smtp-Source: AGHT+IHiOJY5S1HzguMhAnwl7sMIiS7k+YcE7l7xbK3U/3mxe44aber4iMNXtni9CDi6QG9YXPKnrg==
X-Received: by 2002:a0c:ed42:0:b0:67a:a721:b19c with SMTP id
 v2-20020a0ced42000000b0067aa721b19cmr1238042qvq.87.1701888468177; 
 Wed, 06 Dec 2023 10:47:48 -0800 (PST)
Received: from pazz.c.googlers.com.com
 (150.254.86.34.bc.googleusercontent.com. [34.86.254.150])
 by smtp.gmail.com with ESMTPSA id
 g11-20020a0cd7cb000000b0067abdf75926sm187432qvj.14.2023.12.06.10.47.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Dec 2023 10:47:47 -0800 (PST)
From: Paz Zcharya <pazz@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Subject: [PATCH] [v2] drm/i915/display: Check GGTT to determine phys_base
Date: Wed,  6 Dec 2023 18:46:26 +0000
Message-ID: <20231206184736.3769657-1-pazz@chromium.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Subrata Banik <subratabanik@google.com>, intel-gfx@lists.freedesktop.org,
 Marcin Wojtas <mwojtas@chromium.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>,
 matthew.auld@intel.com, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Drew Davenport <ddavenport@chromium.org>, Paz Zcharya <pazz@chromium.org>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There was an assumption that for iGPU there should be a 1:1 mapping
of GGTT to physical address pointing to the framebuffer.
This assumption is not strictly true effective generation 8 or newer.
Fix that by checking GGTT to determine the phys address on gen8+.

The following algorithm for phys_base should be valid for all platforms:
1. Find pte
2. if(IS_DGFX(i915) && pte & GEN12_GGTT_PTE_LM) mem =
i915->mm.regions[INTEL_REGION_LMEM_0] else mem = i915->mm.stolen_region
3. phys_base = (pte & I915_GTT_PAGE_MASK) - mem->region.start;

- On older platforms, stolen_region points to system memory, starting at 0
- on DG2, it uses lmem region which starts at 0 as well
- on MTL, stolen_region points to stolen-local which starts at 0x800000

Changes from v1:
  - Add an if statement for gen7-, where there is a 1:1 mapping

Signed-off-by: Paz Zcharya <pazz@chromium.org>
---

 .../drm/i915/display/intel_plane_initial.c    | 64 +++++++++++--------
 1 file changed, 39 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_plane_initial.c b/drivers/gpu/drm/i915/display/intel_plane_initial.c
index a55c09cbd0e4..7d9bb631b93b 100644
--- a/drivers/gpu/drm/i915/display/intel_plane_initial.c
+++ b/drivers/gpu/drm/i915/display/intel_plane_initial.c
@@ -59,44 +59,58 @@ initial_plane_vma(struct drm_i915_private *i915,
 		return NULL;
 
 	base = round_down(plane_config->base, I915_GTT_MIN_ALIGNMENT);
-	if (IS_DGFX(i915)) {
+
+	if (GRAPHICS_VER(i915) < 8) {
+		/*
+		 * In gen7-, there is a 1:1 mapping
+		 * between GSM and physical address.
+		 */
+		phys_base = base;
+		mem = i915->mm.stolen_region;
+	} else {
+		/*
+		 * In gen8+, there is no 1:1 mapping between
+		 * GSM and physical address, so we need to
+		 * check GGTT to determine the physical address.
+		 */
 		gen8_pte_t __iomem *gte = to_gt(i915)->ggtt->gsm;
 		gen8_pte_t pte;
 
 		gte += base / I915_GTT_PAGE_SIZE;
-
 		pte = ioread64(gte);
-		if (!(pte & GEN12_GGTT_PTE_LM)) {
-			drm_err(&i915->drm,
-				"Initial plane programming missing PTE_LM bit\n");
-			return NULL;
-		}
-
-		phys_base = pte & I915_GTT_PAGE_MASK;
-		mem = i915->mm.regions[INTEL_REGION_LMEM_0];
 
-		/*
-		 * We don't currently expect this to ever be placed in the
-		 * stolen portion.
-		 */
-		if (phys_base >= resource_size(&mem->region)) {
-			drm_err(&i915->drm,
-				"Initial plane programming using invalid range, phys_base=%pa\n",
-				&phys_base);
-			return NULL;
+		if (IS_DGFX(i915)) {
+			if (!(pte & GEN12_GGTT_PTE_LM)) {
+				drm_err(&i915->drm,
+					"Initial plane programming missing PTE_LM bit\n");
+				return NULL;
+			}
+			mem = i915->mm.regions[INTEL_REGION_LMEM_0];
+		} else {
+			mem = i915->mm.stolen_region;
 		}
 
-		drm_dbg(&i915->drm,
-			"Using phys_base=%pa, based on initial plane programming\n",
-			&phys_base);
-	} else {
-		phys_base = base;
-		mem = i915->mm.stolen_region;
+		phys_base = (pte & I915_GTT_PAGE_MASK) - mem->region.start;
 	}
 
 	if (!mem)
 		return NULL;
 
+	/*
+	 * We don't currently expect this to ever be placed in the
+	 * stolen portion.
+	 */
+	if (phys_base >= resource_size(&mem->region)) {
+		drm_err(&i915->drm,
+			"Initial plane programming using invalid range, phys_base=%pa\n",
+			&phys_base);
+		return NULL;
+	}
+
+	drm_dbg(&i915->drm,
+		"Using phys_base=%pa, based on initial plane programming\n",
+		&phys_base);
+
 	size = round_up(plane_config->base + plane_config->size,
 			mem->min_page_size);
 	size -= base;
-- 
2.43.0.472.g3155946c3a-goog

