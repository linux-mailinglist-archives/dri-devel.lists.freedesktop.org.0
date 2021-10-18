Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93ACA43257A
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 19:49:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 487636EA35;
	Mon, 18 Oct 2021 17:49:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4112B6E9FF;
 Mon, 18 Oct 2021 17:49:20 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10141"; a="225784963"
X-IronPort-AV: E=Sophos;i="5.85,382,1624345200"; d="scan'208";a="225784963"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2021 10:49:18 -0700
X-IronPort-AV: E=Sophos;i="5.85,382,1624345200"; d="scan'208";a="526358665"
Received: from cscleary-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.13.221])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2021 10:49:15 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 4/9] drm/i915/dmabuf: add paranoid flush-on-acquire
Date: Mon, 18 Oct 2021 18:45:03 +0100
Message-Id: <20211018174508.2137279-4-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20211018174508.2137279-1-matthew.auld@intel.com>
References: <20211018174508.2137279-1-matthew.auld@intel.com>
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

As pointed out by Thomas, we likely need to flush the pages here if the
GPU can read the page contents directly from main memory. Underneath we
don't know what the sg_table is pointing to, so just add a
wbinvd_on_all_cpus() here, for now.

Reported-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
index 5be505ebbb7b..1adcd8e02d29 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
@@ -232,6 +232,7 @@ struct dma_buf *i915_gem_prime_export(struct drm_gem_object *gem_obj, int flags)
 
 static int i915_gem_object_get_pages_dmabuf(struct drm_i915_gem_object *obj)
 {
+	struct drm_i915_private *i915 = to_i915(obj->base.dev);
 	struct sg_table *pages;
 	unsigned int sg_page_sizes;
 
@@ -242,8 +243,11 @@ static int i915_gem_object_get_pages_dmabuf(struct drm_i915_gem_object *obj)
 	if (IS_ERR(pages))
 		return PTR_ERR(pages);
 
-	sg_page_sizes = i915_sg_dma_sizes(pages->sgl);
+	/* XXX: consider doing a vmap flush or something */
+	if (!HAS_LLC(i915) || i915_gem_object_can_bypass_llc(obj))
+		wbinvd_on_all_cpus();
 
+	sg_page_sizes = i915_sg_dma_sizes(pages->sgl);
 	__i915_gem_object_set_pages(obj, pages, sg_page_sizes);
 
 	return 0;
-- 
2.26.3

