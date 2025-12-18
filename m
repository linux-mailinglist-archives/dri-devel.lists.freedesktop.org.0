Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9470CCCBBF
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 17:22:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46B8510EA57;
	Thu, 18 Dec 2025 16:22:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CbPz2zYa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47E8810EA57;
 Thu, 18 Dec 2025 16:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766074962; x=1797610962;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4nvX1N1DXa37JOu+56WFk9NhXEfvB1W+QnhbQe0FDDs=;
 b=CbPz2zYaETzavo3vOymSO9v2OX8310LD/emkyWh8axOYt8lYdlthCvRG
 4pj7p2eEYVcMDHE5NlU7IDhRucm5mhVgx9OUwcKySRQ4LevJlaJ7mZiDj
 r+0paYakHQ+oA6+Xrycft9kxQBcjSaHYZ47Cr678lxnROpnbUzncHyTH8
 mg7aM+EPNIQsQMqN9o8Fh2dofu9z8ex02qQoaKGcYqrcOVlTKdfVfB8K/
 zw2GECo3O/1C6Km/7Nm5W8nXs5oF/Xt+co/K/GwhuxfhBduw2j+5Bmzuc
 YlJGGECRamX+4/jeRGo8oBYWXHlKosc/WZEmWL/bmWeiN+gf1eC+Pwa03 Q==;
X-CSE-ConnectionGUID: gzxaMuSWQeWZhwg4lqWu8g==
X-CSE-MsgGUID: oMD3NbkDTvyjwS+dvDX9HQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="70607708"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="70607708"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 08:22:41 -0800
X-CSE-ConnectionGUID: ZH64LxYrR2mzWa2PgT8JQQ==
X-CSE-MsgGUID: Ib1RdXfETWaaN1uWb2XORA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="203705782"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO fedora)
 ([10.245.244.93])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 08:22:38 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org,
 himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>, felix.kuehling@amd.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dakr@kernel.org, "Mrozek, Michal" <michal.mrozek@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PATCH v5 18/24] drm/xe/svm: Document how xe keeps drm_pagemap
 references
Date: Thu, 18 Dec 2025 17:20:55 +0100
Message-ID: <20251218162101.605379-19-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251218162101.605379-1-thomas.hellstrom@linux.intel.com>
References: <20251218162101.605379-1-thomas.hellstrom@linux.intel.com>
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

v3:
- Fix formatting (Matt Brost)

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 654c72e7e61c..df31ba03f56f 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -28,6 +28,27 @@
 #define XE_PEER_PAGEMAP ((void *)0ul)
 #define XE_PEER_VM ((void *)1ul)
 
+/**
+ * DOC: drm_pagemap reference-counting in xe:
+ *
+ * In addition to the drm_pagemap internal reference counting by its zone
+ * device data, the xe driver holds the following long-time references:
+ *
+ * - struct xe_pagemap:
+ *	The xe_pagemap struct derives from struct drm_pagemap and uses its
+ *	reference count.
+ * - SVM-enabled VMs:
+ *	SVM-enabled VMs look up and keeps a reference to all xe_pagemaps on
+ *	the same device.
+ * - VMAs:
+ *	vmas keep a reference on the drm_pagemap indicated by a gpu_madvise()
+ *	call.
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

