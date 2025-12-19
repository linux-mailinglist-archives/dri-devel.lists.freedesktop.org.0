Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D77DCCF9A4
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 12:35:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD19D10EF3C;
	Fri, 19 Dec 2025 11:35:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="itx0bRH3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36CB310EF40;
 Fri, 19 Dec 2025 11:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766144109; x=1797680109;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VYywXm4UdkLrI+kyFm+UlWkaM12K80XJc7dlo+814pM=;
 b=itx0bRH3BYdSGIbfv6R3WHm0DDp4PGYekZaom8JL33/5B9e1YGAFFcYw
 HyzFHWqHWIDb7qAGo/T38ZyAfh5+zOuazzuVoxQSKtk2Pm6TIuF7aYvml
 qnm29Lx3EEn5e3ouZAZRRPZkAwEf6+V6NzHcTAYu+i9LUSKIJ88r2s7QD
 ULDlnaR8pS008zrDIgAHVjODsHTUCmOOw7fJ+zTT08pK1fIRRxn6Be9Hw
 gvFJFOKCrsZhxEgFdvJS0AJPjUztUv6pE+IlmA139B1+Drd/B0UJaAinV
 9+Teq2K75yFQiGrEDhujYjY4JUwaNK+tqs60QVQLmI+lPKuPi1SKkqAs2 w==;
X-CSE-ConnectionGUID: Ry67+gHrSFqnViFM6Rwopw==
X-CSE-MsgGUID: GfS5yv6iTuKYVG867HnhLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="79224596"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="79224596"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 03:35:09 -0800
X-CSE-ConnectionGUID: whhxm24rQU27M6E2xPlSRw==
X-CSE-MsgGUID: PPD52RKkT6iBw7tb8JzYfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="203005792"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO fedora)
 ([10.245.244.251])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 03:35:05 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org,
 himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>, felix.kuehling@amd.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dakr@kernel.org, "Mrozek, Michal" <michal.mrozek@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PATCH v6 18/24] drm/xe/svm: Document how xe keeps drm_pagemap
 references
Date: Fri, 19 Dec 2025 12:33:14 +0100
Message-ID: <20251219113320.183860-19-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251219113320.183860-1-thomas.hellstrom@linux.intel.com>
References: <20251219113320.183860-1-thomas.hellstrom@linux.intel.com>
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
index 43af813276b8..68f30338abee 100644
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

