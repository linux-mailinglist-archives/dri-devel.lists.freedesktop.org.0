Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0304FB2B36B
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 23:31:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17F6010E4E5;
	Mon, 18 Aug 2025 21:31:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mtl6juha";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1669310E4DA;
 Mon, 18 Aug 2025 21:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755552679; x=1787088679;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ig+V85+Q858DhV8ZDCj4yrKSQ4oD1SdA9e8dhVbIy6w=;
 b=mtl6juhaySWjxLvbnmT5rot7iNb8IbuYtYg3JvevGFK1W3tNYCbbeiEa
 lmhT058s//bSe7F7Ik4MGCNSCZEa4ZxGBaaI7ooS9YjJKKUXhhQ1CFjNN
 0TQ5C/TejxevE02zDPgMsLIymGhoAIlaEtE2PvHFmJr5DYYCRTVASnuqh
 s6A/n7qAW1Kpne08CDTjVtxbG03IwYWACQFC0IcPClZv80O0wHEmcAyfc
 aHiOnSynAEmQ+3rH0iXLRcXPuZG6Wd1qAgLPbtj58B4JH7aw5A4put/5c
 rFFItjjZ1+GO6/5p/gq46uZmIqnf8GINRKDa8hmelL9sv8iaNdKBuXS3p w==;
X-CSE-ConnectionGUID: SoqmGBXvR82SvARU/oEveQ==
X-CSE-MsgGUID: vZe5OronRgCvDXgFB3Y5ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="56815253"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="56815253"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 14:31:10 -0700
X-CSE-ConnectionGUID: YA1H38ZgT0SO1czb284+GA==
X-CSE-MsgGUID: ZufAGwDeS2WqZTP9VBrdpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="167186323"
Received: from himal-super-server.iind.intel.com ([10.190.239.34])
 by fmviesa007.fm.intel.com with ESMTP; 18 Aug 2025 14:31:09 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v8 16/24] drm/xe/uapi: Add flag for consulting madvise hints
 on svm prefetch
Date: Tue, 19 Aug 2025 03:27:45 +0530
Message-Id: <20250818215753.2762426-17-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250818215753.2762426-1-himal.prasad.ghimiray@intel.com>
References: <20250818215753.2762426-1-himal.prasad.ghimiray@intel.com>
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

Introduce flag DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC to ensure prefetching
in madvise-advised memory regions

v2 (Matthew Brost)
- Add kernel-doc

v3 (Matthew Brost)
- Fix kernel-doc

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 include/uapi/drm/xe_drm.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 4e6e9a9164ee..115b9bca2a25 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1010,6 +1010,10 @@ struct drm_xe_vm_destroy {
  *    valid on VMs with DRM_XE_VM_CREATE_FLAG_FAULT_MODE set. The CPU address
  *    mirror flag are only valid for DRM_XE_VM_BIND_OP_MAP operations, the BO
  *    handle MBZ, and the BO offset MBZ.
+ *
+ * The @prefetch_mem_region_instance for %DRM_XE_VM_BIND_OP_PREFETCH can also be:
+ *  - %DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC, which ensures prefetching occurs in
+ *    the memory region advised by madvise.
  */
 struct drm_xe_vm_bind_op {
 	/** @extensions: Pointer to the first extension struct, if any */
@@ -1115,6 +1119,7 @@ struct drm_xe_vm_bind_op {
 	/** @flags: Bind flags */
 	__u32 flags;
 
+#define DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC	-1
 	/**
 	 * @prefetch_mem_region_instance: Memory region to prefetch VMA to.
 	 * It is a region instance, not a mask.
-- 
2.34.1

