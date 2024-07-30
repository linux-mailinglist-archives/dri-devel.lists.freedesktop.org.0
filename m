Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 987B0941D97
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 19:19:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98A5C10E22E;
	Tue, 30 Jul 2024 17:19:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="N6lnkm5r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CD3810E22E
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 17:19:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DDD0C6200B;
 Tue, 30 Jul 2024 17:19:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 089FCC32782;
 Tue, 30 Jul 2024 17:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1722359943;
 bh=zszISfNrirE0HvsHCcAevi+yGsKWq/xBi2hS4Isnk40=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=N6lnkm5r9iNG1MI18VkzE8YJjlmzb6qMQj4OHfLAYhtgxl3Z9nJX73L3DcJkax2/q
 z787r4dLfYMl0xDNDHg1E3545KgeWmDPH+lAM550BhEr0t+487RprRQ9bMjmhk4f/P
 VKaQqrHPb611a73nlpPdK3kQdlsHrSLz31IWRR/A=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, patches@lists.linux.dev,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Pallavi Mishra <pallavi.mishra@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Effie Yu <effie.yu@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jose Souza <jose.souza@intel.com>, Michal Mrozek <michal.mrozek@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 6.10 557/809] drm/xe: Use write-back caching mode for system
 memory on DGFX
Date: Tue, 30 Jul 2024 17:47:13 +0200
Message-ID: <20240730151746.758213774@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240730151724.637682316@linuxfoundation.org>
References: <20240730151724.637682316@linuxfoundation.org>
User-Agent: quilt/0.67
X-stable: review
X-Patchwork-Hint: ignore
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

6.10-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Thomas Hellström <thomas.hellstrom@linux.intel.com>

commit 5207c393d3e7dda9aff813d6b3e2264370d241be upstream.

The caching mode for buffer objects with VRAM as a possible
placement was forced to write-combined, regardless of placement.

However, write-combined system memory is expensive to allocate and
even though it is pooled, the pool is expensive to shrink, since
it involves global CPU TLB flushes.

Moreover write-combined system memory from TTM is only reliably
available on x86 and DGFX doesn't have an x86 restriction.

So regardless of the cpu caching mode selected for a bo,
internally use write-back caching mode for system memory on DGFX.

Coherency is maintained, but user-space clients may perceive a
difference in cpu access speeds.

v2:
- Update RB- and Ack tags.
- Rephrase wording in xe_drm.h (Matt Roper)
v3:
- Really rephrase wording.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Fixes: 622f709ca629 ("drm/xe/uapi: Add support for CPU caching mode")
Cc: Pallavi Mishra <pallavi.mishra@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: dri-devel@lists.freedesktop.org
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Effie Yu <effie.yu@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Jose Souza <jose.souza@intel.com>
Cc: Michal Mrozek <michal.mrozek@intel.com>
Cc: <stable@vger.kernel.org> # v6.8+
Acked-by: Matthew Auld <matthew.auld@intel.com>
Acked-by: José Roberto de Souza <jose.souza@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Fixes: 622f709ca629 ("drm/xe/uapi: Add support for CPU caching mode")
Acked-by: Michal Mrozek <michal.mrozek@intel.com>
Acked-by: Effie Yu <effie.yu@intel.com> #On chat
Link: https://patchwork.freedesktop.org/patch/msgid/20240705132828.27714-1-thomas.hellstrom@linux.intel.com
(cherry picked from commit 01e0cfc994be484ddcb9e121e353e51d8bb837c0)
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/xe/xe_bo.c       |   47 +++++++++++++++++++++++----------------
 drivers/gpu/drm/xe/xe_bo_types.h |    3 +-
 include/uapi/drm/xe_drm.h        |    8 +++++-
 3 files changed, 37 insertions(+), 21 deletions(-)

--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -317,7 +317,7 @@ static struct ttm_tt *xe_ttm_tt_create(s
 	struct xe_device *xe = xe_bo_device(bo);
 	struct xe_ttm_tt *tt;
 	unsigned long extra_pages;
-	enum ttm_caching caching;
+	enum ttm_caching caching = ttm_cached;
 	int err;
 
 	tt = kzalloc(sizeof(*tt), GFP_KERNEL);
@@ -331,26 +331,35 @@ static struct ttm_tt *xe_ttm_tt_create(s
 		extra_pages = DIV_ROUND_UP(xe_device_ccs_bytes(xe, bo->size),
 					   PAGE_SIZE);
 
-	switch (bo->cpu_caching) {
-	case DRM_XE_GEM_CPU_CACHING_WC:
-		caching = ttm_write_combined;
-		break;
-	default:
-		caching = ttm_cached;
-		break;
-	}
-
-	WARN_ON((bo->flags & XE_BO_FLAG_USER) && !bo->cpu_caching);
-
 	/*
-	 * Display scanout is always non-coherent with the CPU cache.
-	 *
-	 * For Xe_LPG and beyond, PPGTT PTE lookups are also non-coherent and
-	 * require a CPU:WC mapping.
+	 * DGFX system memory is always WB / ttm_cached, since
+	 * other caching modes are only supported on x86. DGFX
+	 * GPU system memory accesses are always coherent with the
+	 * CPU.
 	 */
-	if ((!bo->cpu_caching && bo->flags & XE_BO_FLAG_SCANOUT) ||
-	    (xe->info.graphics_verx100 >= 1270 && bo->flags & XE_BO_FLAG_PAGETABLE))
-		caching = ttm_write_combined;
+	if (!IS_DGFX(xe)) {
+		switch (bo->cpu_caching) {
+		case DRM_XE_GEM_CPU_CACHING_WC:
+			caching = ttm_write_combined;
+			break;
+		default:
+			caching = ttm_cached;
+			break;
+		}
+
+		WARN_ON((bo->flags & XE_BO_FLAG_USER) && !bo->cpu_caching);
+
+		/*
+		 * Display scanout is always non-coherent with the CPU cache.
+		 *
+		 * For Xe_LPG and beyond, PPGTT PTE lookups are also
+		 * non-coherent and require a CPU:WC mapping.
+		 */
+		if ((!bo->cpu_caching && bo->flags & XE_BO_FLAG_SCANOUT) ||
+		    (xe->info.graphics_verx100 >= 1270 &&
+		     bo->flags & XE_BO_FLAG_PAGETABLE))
+			caching = ttm_write_combined;
+	}
 
 	err = ttm_tt_init(&tt->ttm, &bo->ttm, page_flags, caching, extra_pages);
 	if (err) {
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -66,7 +66,8 @@ struct xe_bo {
 
 	/**
 	 * @cpu_caching: CPU caching mode. Currently only used for userspace
-	 * objects.
+	 * objects. Exceptions are system memory on DGFX, which is always
+	 * WB.
 	 */
 	u16 cpu_caching;
 
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -776,7 +776,13 @@ struct drm_xe_gem_create {
 #define DRM_XE_GEM_CPU_CACHING_WC                      2
 	/**
 	 * @cpu_caching: The CPU caching mode to select for this object. If
-	 * mmaping the object the mode selected here will also be used.
+	 * mmaping the object the mode selected here will also be used. The
+	 * exception is when mapping system memory (including data evicted
+	 * to system) on discrete GPUs. The caching mode selected will
+	 * then be overridden to DRM_XE_GEM_CPU_CACHING_WB, and coherency
+	 * between GPU- and CPU is guaranteed. The caching mode of
+	 * existing CPU-mappings will be updated transparently to
+	 * user-space clients.
 	 */
 	__u16 cpu_caching;
 	/** @pad: MBZ */


