Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EBF7B2B361
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 23:30:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C222E10E4D2;
	Mon, 18 Aug 2025 21:30:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BhJbqhkX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A884010E4D1;
 Mon, 18 Aug 2025 21:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755552651; x=1787088651;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wgKEVDLvIDeeXdaUcnDKY3ldu61G1mMHoNdiAWKvPWs=;
 b=BhJbqhkX1jLvk+W9lacjmkBZ+dzX/h33f+Ssm8c7wYDI+6mzbLnAAJj2
 Oz9ZGblPliUQF6hILC0K/DekHsbWAKi8iILmqVplGl2qfufqWPcV6Y9+9
 RAVNDq7cO2bFTUD7pStNMrLE7avfu2Z9Zyu4hs2bbf/QHhZWea+pAE+2a
 YjHkdqM06lUIMoNKMJzGa0XJGKKKKqoIcoOgizXRE4OzmlWsE4cR1xpAk
 bGCQ0JGe8NvkU5T2FKRvFENu/44D9UtUb9r6+8BDoWP7t+FH5EgqdUbD7
 dtXKE0USRRVYUNGsRRvxEvdZq9m/5am0rYp6WpXuLNRJlaH9nVN8IQaER w==;
X-CSE-ConnectionGUID: vC/c7WsrS/OFqd2SaRUdeg==
X-CSE-MsgGUID: tG0TT4t5RJGwOVpHXoGYrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="56815188"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="56815188"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 14:30:50 -0700
X-CSE-ConnectionGUID: RrN9XAlIRFy11G8NK/H80g==
X-CSE-MsgGUID: X1lTGDTSQJ+V6ERPcKFdjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="167186243"
Received: from himal-super-server.iind.intel.com ([10.190.239.34])
 by fmviesa007.fm.intel.com with ESMTP; 18 Aug 2025 14:30:49 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v8 05/24] drm/xe/vm: Add attributes struct as member of vma
Date: Tue, 19 Aug 2025 03:27:34 +0530
Message-Id: <20250818215753.2762426-6-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250818215753.2762426-1-himal.prasad.ghimiray@intel.com>
References: <20250818215753.2762426-1-himal.prasad.ghimiray@intel.com>
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

The attribute of xe_vma will determine the migration policy and the
encoding of the page table entries (PTEs) for that vma.
This attribute helps manage how memory pages are moved and how their
addresses are translated. It will be used by madvise to set the
behavior of the vma.

v2 (Matthew Brost)
- Add docs

v3 (Matthew Brost)
- Add uapi references
- 80 characters line wrap

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_vm_types.h | 33 ++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 8a07feef503b..8e8138c2b80a 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -77,6 +77,33 @@ struct xe_userptr {
 #endif
 };
 
+/**
+ * struct xe_vma_mem_attr - memory attributes associated with vma
+ */
+struct xe_vma_mem_attr {
+	/** @preferred_loc: perferred memory_location */
+	struct {
+		/** @preferred_loc.migration_policy: Pages migration policy */
+		u32 migration_policy;
+
+		/**
+		 * @preferred_loc.devmem_fd: used for determining pagemap_fd
+		 * requested by user DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM and
+		 * DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE mean system memory or
+		 * closest device memory respectively.
+		 */
+		u32 devmem_fd;
+	} preferred_loc;
+
+	/**
+	 * @atomic_access: The atomic access type for the vma
+	 * See %DRM_XE_VMA_ATOMIC_UNDEFINED, %DRM_XE_VMA_ATOMIC_DEVICE,
+	 * %DRM_XE_VMA_ATOMIC_GLOBAL, and %DRM_XE_VMA_ATOMIC_CPU for possible
+	 * values. These are defined in uapi/drm/xe_drm.h.
+	 */
+	u32 atomic_access;
+};
+
 struct xe_vma {
 	/** @gpuva: Base GPUVA object */
 	struct drm_gpuva gpuva;
@@ -135,6 +162,12 @@ struct xe_vma {
 	 * Needs to be signalled before UNMAP can be processed.
 	 */
 	struct xe_user_fence *ufence;
+
+	/**
+	 * @attr: The attributes of vma which determines the migration policy
+	 * and encoding of the PTEs for this vma.
+	 */
+	struct xe_vma_mem_attr attr;
 };
 
 /**
-- 
2.34.1

