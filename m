Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB3B545268
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 18:52:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 535F611AB75;
	Thu,  9 Jun 2022 16:52:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52FCD11AB75;
 Thu,  9 Jun 2022 16:52:27 +0000 (UTC)
Received: from hermes-devbox.fritz.box (82-71-8-225.dsl.in-addr.zen.co.uk
 [82.71.8.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbeckett)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id CD5A666017BA;
 Thu,  9 Jun 2022 17:52:25 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1654793546;
 bh=fNrnNmjm8O3impsJ3FwNrPFJIw42pnJblFgr2kI6zEE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EpKGah8MRwcPqjQ95aCfc7Oks1XrRyNlKgTrhFsuhUw2s3yzaRTIoYsy++VgRqvQ5
 Oy/gXuwzxwXXFaonnGDftHH9qzCXCKjtF/MEMtxP/q7xQw0howdNcAsAVCn3P5hKYQ
 Kbc/xg4zKL+o1MMWxLTFRpwbLg/0h7jua9peemWb5Bt7Po3wzD8Zg/QJk8f53P5sD6
 ePj1vstZNyUg69igFYvoFsjGWRxMpGCvpoK1EZZwhk6myvgmc6GD+SBuFVTr4NgYqF
 ElfEg472OJdCcPK0tbEWwiQtU2I/u411NrTuCAXGhbk0Qckeh6POMRbPN0yY/KPU1M
 cn3s2ysIC8RwQ==
From: Robert Beckett <bob.beckett@collabora.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3 4/8] drm/i915: allow volatile buffers to use ttm pool
 allocator
Date: Thu,  9 Jun 2022 16:51:56 +0000
Message-Id: <20220609165200.842821-5-bob.beckett@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609165200.842821-1-bob.beckett@collabora.com>
References: <20220609165200.842821-1-bob.beckett@collabora.com>
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
Cc: Robert Beckett <bob.beckett@collabora.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 kernel@collabora.com, Matthew Auld <matthew.auld@intel.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Internal/volatile buffers should not be shmem backed.
If a volatile buffer is requested, allow ttm to use the pool allocator
to provide volatile pages as backing.
Fix i915_ttm_shrink to handle !is_shmem volatile buffers by purging.

Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 27d59639177f..8edce04a0509 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -309,7 +309,8 @@ static struct ttm_tt *i915_ttm_tt_create(struct ttm_buffer_object *bo,
 		page_flags |= TTM_TT_FLAG_ZERO_ALLOC;
 
 	caching = i915_ttm_select_tt_caching(obj);
-	if (i915_gem_object_is_shrinkable(obj) && caching == ttm_cached) {
+	if (i915_gem_object_is_shrinkable(obj) && caching == ttm_cached &&
+	    !i915_gem_object_is_volatile(obj)) {
 		page_flags |= TTM_TT_FLAG_EXTERNAL |
 			      TTM_TT_FLAG_EXTERNAL_MAPPABLE;
 		i915_tt->is_shmem = true;
@@ -531,9 +532,9 @@ static int i915_ttm_shrink(struct drm_i915_gem_object *obj, unsigned int flags)
 	if (!bo->ttm || bo->resource->mem_type != TTM_PL_SYSTEM)
 		return 0;
 
-	GEM_BUG_ON(!i915_tt->is_shmem);
+	GEM_BUG_ON(!i915_tt->is_shmem && obj->mm.madv != I915_MADV_DONTNEED);
 
-	if (!i915_tt->filp)
+	if (i915_tt->is_shmem && !i915_tt->filp)
 		return 0;
 
 	ret = ttm_bo_wait_ctx(bo, &ctx);
-- 
2.25.1

