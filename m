Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D229543FC44
	for <lists+dri-devel@lfdr.de>; Fri, 29 Oct 2021 14:23:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85B1A6E108;
	Fri, 29 Oct 2021 12:23:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7207D6E108;
 Fri, 29 Oct 2021 12:23:02 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10151"; a="217566596"
X-IronPort-AV: E=Sophos;i="5.87,192,1631602800"; d="scan'208";a="217566596"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2021 05:23:01 -0700
X-IronPort-AV: E=Sophos;i="5.87,192,1631602800"; d="scan'208";a="498886211"
Received: from hohiggin-mobl2.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.213.197.138])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2021 05:23:00 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2] drm/i915/dmabuf: drop the flush on discrete
Date: Fri, 29 Oct 2021 13:21:37 +0100
Message-Id: <20211029122137.3484203-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
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

We were overzealous here; even though discrete is non-LLC, it should
still be always coherent.

v2(Thomas & Daniel)
  - Be extra cautious and limit to DG1
  - Add some more commentary

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
index a45d0ec2c5b6..a2b485a1be8c 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
@@ -250,8 +250,19 @@ static int i915_gem_object_get_pages_dmabuf(struct drm_i915_gem_object *obj)
 	if (IS_ERR(pages))
 		return PTR_ERR(pages);
 
-	/* XXX: consider doing a vmap flush or something */
-	if (!HAS_LLC(i915) || i915_gem_object_can_bypass_llc(obj))
+	/*
+	 * DG1 is special here since it still snoops transactions even with
+	 * CACHE_NONE. This is not the case with other HAS_SNOOP platforms. We
+	 * might need to revisit this as we add new discrete platforms.
+	 *
+	 * XXX: Consider doing a vmap flush or something, where possible.
+	 * Currently we just do a heavy handed wbinvd_on_all_cpus() here since
+	 * the underlying sg_table might not even point to struct pages, so we
+	 * can't just call drm_clflush_sg or similar, like we do elsewhere in
+	 * the driver.
+	 */
+	if (i915_gem_object_can_bypass_llc(obj) ||
+	    (!HAS_LLC(i915) && !IS_DG1(i915)))
 		wbinvd_on_all_cpus();
 
 	sg_page_sizes = i915_sg_dma_sizes(pages->sgl);
-- 
2.26.3

