Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D02E716C4F
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 20:25:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2160D10E3EB;
	Tue, 30 May 2023 18:25:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E88910E402;
 Tue, 30 May 2023 18:25:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D309E616BA;
 Tue, 30 May 2023 18:25:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 051A5C4339C;
 Tue, 30 May 2023 18:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685471110;
 bh=L4MWwbmFhJSyRXhSvFxWlsDXV8X6p/YetuWJLT8veJk=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=RwunEe2tcBVqLpaj5MKrjYWOwl1FnHPdNS4UnZp8qYcnI3zeodq2qZQZRY4NrCPAG
 zOL5I3YHNZBKEY573oO0riFEswopmkAhm2XF8djoSXJ1n6BxylRe3aO0aH7mBSvdVE
 3zR91wP5jGNLQXcCZLbmQ4NIVs99iXZIDmfgjlf1PQcOXbST61IZ/z7DXOE/Tj4nGo
 Y+APSZpLffSZzED8XcfCAxYx8A4BTriyc8irCNeeKXEL3TF2y9SZXGbbnOzd6iVmwz
 xXVoTvz31hOYPPDd5CADq8E6Az4n3vBtxMXzXv8MhAnZ+FXINgijvC/qrKe2zz2ZVZ
 +FhoRkVRqvbvw==
From: Nathan Chancellor <nathan@kernel.org>
Date: Tue, 30 May 2023 11:24:38 -0700
Subject: [PATCH 1/2] drm/i915/gt: Fix second parameter type of pre-gen8
 pte_encode callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230530-i915-gt-cache_level-wincompatible-function-pointer-types-strict-v1-1-54501d598229@kernel.org>
References: <20230530-i915-gt-cache_level-wincompatible-function-pointer-types-strict-v1-0-54501d598229@kernel.org>
In-Reply-To: <20230530-i915-gt-cache_level-wincompatible-function-pointer-types-strict-v1-0-54501d598229@kernel.org>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com, 
 rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=6663; i=nathan@kernel.org;
 h=from:subject:message-id; bh=L4MWwbmFhJSyRXhSvFxWlsDXV8X6p/YetuWJLT8veJk=;
 b=owGbwMvMwCEmm602sfCA1DTG02pJDCll9i3njuz57LrDPUu9o1vIICLors05/128T1nPd1u32
 J2Ws2bsKGVhEONgkBVTZKl+rHrc0HDOWcYbpybBzGFlAhnCwMUpABPx+8PIcOkhb9G9G9XPVUot
 pp6f9Etr1sqqe4ZrJQwe53P3PvJa84Lhr2RgtM0n1RdWt402fIvRDIlc7BKlxNbTMyUi/PlKz59
 bOQA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
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
Cc: andi.shyti@linux.intel.com, trix@redhat.com,
 intel-gfx@lists.freedesktop.org, llvm@lists.linux.dev, ndesaulniers@google.com,
 patches@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Nathan Chancellor <nathan@kernel.org>, fei.yang@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When booting a kernel compiled with CONFIG_CFI_CLANG (kCFI), there is a
CFI failure in ggtt_probe_common() when trying to call hsw_pte_encode()
via an indirect call:

  [    5.030027] CFI failure at ggtt_probe_common+0xd1/0x130 [i915] (target: hsw_pte_encode+0x0/0x30 [i915]; expected type: 0xf5c1d0fc)

With kCFI, indirect calls are validated against their expected type
versus actual type and failures occur when the two types do not match.

clang's -Wincompatible-function-pointer-types-strict can catch this at
compile time but it is not enabled for the kernel yet:

  drivers/gpu/drm/i915/gt/intel_ggtt.c:1155:23: error: incompatible function pointer types assigning to 'u64 (*)(dma_addr_t, unsigned int, u32)' (aka 'unsigned long long (*)(unsigned int, unsigned int, unsigned int)') from 'u64 (dma_addr_t,
  enum i915_cache_level, u32)' (aka 'unsigned long long (unsigned int, enum i915_cache_level, unsigned int)') [-Werror,-Wincompatible-function-pointer-types-strict]
                  ggtt->vm.pte_encode = iris_pte_encode;
                                      ^ ~~~~~~~~~~~~~~~
  drivers/gpu/drm/i915/gt/intel_ggtt.c:1157:23: error: incompatible function pointer types assigning to 'u64 (*)(dma_addr_t, unsigned int, u32)' (aka 'unsigned long long (*)(unsigned int, unsigned int, unsigned int)') from 'u64 (dma_addr_t,
  enum i915_cache_level, u32)' (aka 'unsigned long long (unsigned int, enum i915_cache_level, unsigned int)') [-Werror,-Wincompatible-function-pointer-types-strict]
                  ggtt->vm.pte_encode = hsw_pte_encode;
                                      ^ ~~~~~~~~~~~~~~
  drivers/gpu/drm/i915/gt/intel_ggtt.c:1159:23: error: incompatible function pointer types assigning to 'u64 (*)(dma_addr_t, unsigned int, u32)' (aka 'unsigned long long (*)(unsigned int, unsigned int, unsigned int)') from 'u64 (dma_addr_t,
  enum i915_cache_level, u32)' (aka 'unsigned long long (unsigned int, enum i915_cache_level, unsigned int)') [-Werror,-Wincompatible-function-pointer-types-strict]
                  ggtt->vm.pte_encode = byt_pte_encode;
                                      ^ ~~~~~~~~~~~~~~
  drivers/gpu/drm/i915/gt/intel_ggtt.c:1161:23: error: incompatible function pointer types assigning to 'u64 (*)(dma_addr_t, unsigned int, u32)' (aka 'unsigned long long (*)(unsigned int, unsigned int, unsigned int)') from 'u64 (dma_addr_t,
  enum i915_cache_level, u32)' (aka 'unsigned long long (unsigned int, enum i915_cache_level, unsigned int)') [-Werror,-Wincompatible-function-pointer-types-strict]
                  ggtt->vm.pte_encode = ivb_pte_encode;
                                      ^ ~~~~~~~~~~~~~~
  drivers/gpu/drm/i915/gt/intel_ggtt.c:1163:23: error: incompatible function pointer types assigning to 'u64 (*)(dma_addr_t, unsigned int, u32)' (aka 'unsigned long long (*)(unsigned int, unsigned int, unsigned int)') from 'u64 (dma_addr_t,
  enum i915_cache_level, u32)' (aka 'unsigned long long (unsigned int, enum i915_cache_level, unsigned int)') [-Werror,-Wincompatible-function-pointer-types-strict]
                  ggtt->vm.pte_encode = snb_pte_encode;
                                      ^ ~~~~~~~~~~~~~~
  5 errors generated.

In this case, the pre-gen8 pte_encode functions have a second parameter
type of 'enum i915_cache_level' whereas the function pointer prototype
in 'struct i915_address_space' expects a second parameter type of
'unsigned int'.

Update the second parameter of the callbacks and the comment above them
noting that these statements are still valid, which matches other
functions and files, to clear up the kCFI failures at run time.

Fixes: 9275277d5324 ("drm/i915: use pat_index instead of cache_level")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/gpu/drm/i915/gt/intel_ggtt.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
index 2a7942fac798..122197737ef2 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
@@ -1015,16 +1015,16 @@ static int gen8_gmch_probe(struct i915_ggtt *ggtt)
 
 /*
  * For pre-gen8 platforms pat_index is the same as enum i915_cache_level,
- * so these PTE encode functions are left with using cache_level.
+ * so the switch-case statements in these PTE encode functions are still valid.
  * See translation table LEGACY_CACHELEVEL.
  */
 static u64 snb_pte_encode(dma_addr_t addr,
-			  enum i915_cache_level level,
+			  unsigned int pat_index,
 			  u32 flags)
 {
 	gen6_pte_t pte = GEN6_PTE_ADDR_ENCODE(addr) | GEN6_PTE_VALID;
 
-	switch (level) {
+	switch (pat_index) {
 	case I915_CACHE_L3_LLC:
 	case I915_CACHE_LLC:
 		pte |= GEN6_PTE_CACHE_LLC;
@@ -1033,19 +1033,19 @@ static u64 snb_pte_encode(dma_addr_t addr,
 		pte |= GEN6_PTE_UNCACHED;
 		break;
 	default:
-		MISSING_CASE(level);
+		MISSING_CASE(pat_index);
 	}
 
 	return pte;
 }
 
 static u64 ivb_pte_encode(dma_addr_t addr,
-			  enum i915_cache_level level,
+			  unsigned int pat_index,
 			  u32 flags)
 {
 	gen6_pte_t pte = GEN6_PTE_ADDR_ENCODE(addr) | GEN6_PTE_VALID;
 
-	switch (level) {
+	switch (pat_index) {
 	case I915_CACHE_L3_LLC:
 		pte |= GEN7_PTE_CACHE_L3_LLC;
 		break;
@@ -1056,14 +1056,14 @@ static u64 ivb_pte_encode(dma_addr_t addr,
 		pte |= GEN6_PTE_UNCACHED;
 		break;
 	default:
-		MISSING_CASE(level);
+		MISSING_CASE(pat_index);
 	}
 
 	return pte;
 }
 
 static u64 byt_pte_encode(dma_addr_t addr,
-			  enum i915_cache_level level,
+			  unsigned int pat_index,
 			  u32 flags)
 {
 	gen6_pte_t pte = GEN6_PTE_ADDR_ENCODE(addr) | GEN6_PTE_VALID;
@@ -1071,31 +1071,31 @@ static u64 byt_pte_encode(dma_addr_t addr,
 	if (!(flags & PTE_READ_ONLY))
 		pte |= BYT_PTE_WRITEABLE;
 
-	if (level != I915_CACHE_NONE)
+	if (pat_index != I915_CACHE_NONE)
 		pte |= BYT_PTE_SNOOPED_BY_CPU_CACHES;
 
 	return pte;
 }
 
 static u64 hsw_pte_encode(dma_addr_t addr,
-			  enum i915_cache_level level,
+			  unsigned int pat_index,
 			  u32 flags)
 {
 	gen6_pte_t pte = HSW_PTE_ADDR_ENCODE(addr) | GEN6_PTE_VALID;
 
-	if (level != I915_CACHE_NONE)
+	if (pat_index != I915_CACHE_NONE)
 		pte |= HSW_WB_LLC_AGE3;
 
 	return pte;
 }
 
 static u64 iris_pte_encode(dma_addr_t addr,
-			   enum i915_cache_level level,
+			   unsigned int pat_index,
 			   u32 flags)
 {
 	gen6_pte_t pte = HSW_PTE_ADDR_ENCODE(addr) | GEN6_PTE_VALID;
 
-	switch (level) {
+	switch (pat_index) {
 	case I915_CACHE_NONE:
 		break;
 	case I915_CACHE_WT:

-- 
2.40.1

