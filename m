Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E4B3BBDE4
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jul 2021 15:53:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73FB8893D0;
	Mon,  5 Jul 2021 13:53:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CD958936B;
 Mon,  5 Jul 2021 13:53:34 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10035"; a="207154298"
X-IronPort-AV: E=Sophos;i="5.83,325,1616482800"; d="scan'208";a="207154298"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2021 06:53:34 -0700
X-IronPort-AV: E=Sophos;i="5.83,325,1616482800"; d="scan'208";a="562596248"
Received: from ricrossl-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.23.185])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2021 06:53:30 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 4/5] drm/i915/uapi: convert drm_i915_gem_set_domain to
 kernel doc
Date: Mon,  5 Jul 2021 14:53:09 +0100
Message-Id: <20210705135310.1502437-4-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210705135310.1502437-1-matthew.auld@intel.com>
References: <20210705135310.1502437-1-matthew.auld@intel.com>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Jason Ekstrand <jason@jlekstrand.net>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jordan Justen <jordan.l.justen@intel.com>, dri-devel@lists.freedesktop.org,
 Kenneth Graunke <kenneth@whitecape.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert all the drm_i915_gem_set_domain bits to proper kernel doc.

Suggested-by: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Jordan Justen <jordan.l.justen@intel.com>
Cc: Kenneth Graunke <kenneth@whitecape.org>
Cc: Jason Ekstrand <jason@jlekstrand.net>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Ramalingam C <ramalingam.c@intel.com>
---
 include/uapi/drm/i915_drm.h | 34 +++++++++++++++++++++++++++++++---
 1 file changed, 31 insertions(+), 3 deletions(-)

diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index a4faceeb8c32..6f94e5e7569a 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -880,14 +880,42 @@ struct drm_i915_gem_mmap_offset {
 	__u64 extensions;
 };
 
+
+/**
+ * struct drm_i915_gem_set_domain - Adjust the objects write or read domain, in
+ * preparation for accessing the pages via some CPU domain.
+ *
+ * Specifying a new write or read domain will flush the object out of the
+ * previous domain(if required), before then updating the objects domain
+ * tracking with the new domain.
+ *
+ * Note this might involve waiting for the object first if it is still active on
+ * the GPU.
+ *
+ * Supported values for @read_domains and @write_domain:
+ *
+ *	- I915_GEM_DOMAIN_WC: Uncached write-combined domain
+ *	- I915_GEM_DOMAIN_CPU: CPU cache domain
+ *	- I915_GEM_DOMAIN_GTT: Mappable aperture domain
+ *
+ * All other domains are rejected.
+ *
+ */
 struct drm_i915_gem_set_domain {
-	/** Handle for the object */
+	/** @handle: Handle for the object. */
 	__u32 handle;
 
-	/** New read domains */
+	/**
+	 * @read_domains: New read domains.
+	 */
 	__u32 read_domains;
 
-	/** New write domain */
+	/**
+	 * @write_domain: New write domain.
+	 *
+	 * Note that having something in the write domain implies it's in the
+	 * read domain, and only that read domain.
+	 */
 	__u32 write_domain;
 };
 
-- 
2.26.3

