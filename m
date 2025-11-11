Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28AAAC4F197
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 17:45:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D2EA10E62A;
	Tue, 11 Nov 2025 16:45:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dvKio0UA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F2C210E628;
 Tue, 11 Nov 2025 16:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762879525; x=1794415525;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bD7vg0Imwvw+C2f4GGwhVmom6OFe1El4o2bBLXiS8nM=;
 b=dvKio0UAFLkeYS5FFsneh5ZI5BVvBvP2qrhIXVR5xmaImCCsUypdfO5q
 GN2A8TOu6+BnxXbxuQBA+BTthIvOQHWlXXICMf8168GdkTfDFiGqSytuI
 dhbTHd4K1UO4OZPP9QZobrewroaS78iGk2+L/qG/dUBRcAyO7w2Yy4EKU
 u0PXT8EBSp8C/ZqwJJSrpGePtXgCjn+pM3aFEW5IobMnaTX5+5oAc2yDm
 9YLBmizV16+zOax/5mmlYtKQ+TaQvaWg6MYnrXlNK6V9M213x+YbmGPT+
 mIcqiT0lH+Bo8hz9iPcIuSKEuwAYt0cFOOmgd9COQ2PvWyuq7jgbtkNJB w==;
X-CSE-ConnectionGUID: WYddKrt/Rri2QPkDr67LQw==
X-CSE-MsgGUID: NNywEKbDQmqMZMZc5fZEaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="75244801"
X-IronPort-AV: E=Sophos;i="6.19,297,1754982000"; d="scan'208";a="75244801"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 08:45:25 -0800
X-CSE-ConnectionGUID: tlKP5hqQSDKPQYzMMs1toQ==
X-CSE-MsgGUID: lTrMO2/xTe+aZ2GM8OMSNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,297,1754982000"; d="scan'208";a="188647005"
Received: from rvuia-mobl.ger.corp.intel.com (HELO fedora) ([10.245.244.91])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 08:45:22 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org,
 himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>, felix.kuehling@amd.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dakr@kernel.org, "Mrozek, Michal" <michal.mrozek@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PATCH v2 17/17] drm/xe/svm: Document how xe keeps drm_pagemap
 references
Date: Tue, 11 Nov 2025 17:44:07 +0100
Message-ID: <20251111164408.113070-18-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251111164408.113070-1-thomas.hellstrom@linux.intel.com>
References: <20251111164408.113070-1-thomas.hellstrom@linux.intel.com>
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

As an aid to understanding the lifetime of the drm_pagemaps used
by the xe driver, document how the xe driver keeps the
drm_pagemap references.

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 56bb3896b89a..c1d6eb2f97d1 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -28,6 +28,28 @@
 #define XE_PEER_PAGEMAP ((void *)0ul)
 #define XE_PEER_VM ((void *)1ul)
 
+/**
+ * DOC: drm_pagemap reference-counting in xe:
+ *
+ * In addition to the drm_pagemap internal reference counting by
+ * its zone device data, the xe driver holds the following
+ * long-time references:
+ *
+ * - struct xe_pagemap:
+ *      The xe_pagemap struct derives from struct drm_pagemap and
+ *      uses its reference count.
+ * - SVM-enabled VMs:
+ *      SVM-enabled VMs look up and keeps a reference to all
+ *      xe_pagemaps on the same device.
+ * - VMAs:
+ *      vmas keep a reference on the drm_pagemap indicated by a gpu_madvise()
+ *      call.
+ *
+ * In addition, all drm_pagemap or xe_pagemap pointers where lifetime cannot
+ * be guaranteed by a vma reference under the vm lock should keep a reference.
+ * That includes the range->pages.dpagemap pointer.
+ */
+
 static int xe_svm_get_pagemaps(struct xe_vm *vm);
 
 void *xe_svm_private_page_owner(struct xe_vm *vm, bool force_smem)
-- 
2.51.1

