Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 922E6CB69A5
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 18:00:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF06D10E89F;
	Thu, 11 Dec 2025 17:00:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lVuaFobu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2278F10E8AB;
 Thu, 11 Dec 2025 17:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765472440; x=1797008440;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YhYFp/1/LD6BF85Yqo3fb0hmrh0aK+iIjysIN7nwTY4=;
 b=lVuaFobueyVeDk+enT/nUFGSWpOcyChP+KSnEmYfJrBjE2PRYJVgzpM8
 pc6bkDpsuweS/JE4SyVY8FnrzcUo6G53FneO4OfSnsx9Q0Fmi5bauW6zF
 sQEAxLbvGrWIJLbabtU5JWZ/U3ldAbgydpKhD0kas8o6XSGnCbTufjyC5
 3BzBCnEWFOjxVRI23LqNNs8hsjoYD1Iyw6TQcTm4DXfs6WRr1kGzxAOM0
 G+dzlHaNBA1nI5RYU1IFOH3/F6wn0DIDqJBNCekscLM8iafBLSTMMS02W
 oWCoxZ/MgpFFls6FFlJ0Dpf1y70BtwEKybMW6A4mj1ioNdEw5fmf/zQ2F g==;
X-CSE-ConnectionGUID: MRSQAMRWQnagxUmVZa3iXQ==
X-CSE-MsgGUID: 7pRO9ZZJSEC2BGuN6gFYww==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="71083362"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="71083362"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 09:00:39 -0800
X-CSE-ConnectionGUID: OKjlwOvXRFGJxOmS9JzVNg==
X-CSE-MsgGUID: jyjXcYfCS7m+GBoAepxZ9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="196849761"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO fedora)
 ([10.245.244.197])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 09:00:36 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org,
 himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>, felix.kuehling@amd.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dakr@kernel.org, "Mrozek, Michal" <michal.mrozek@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PATCH v4 17/22] drm/xe/svm: Document how xe keeps drm_pagemap
 references
Date: Thu, 11 Dec 2025 17:59:04 +0100
Message-ID: <20251211165909.219710-18-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251211165909.219710-1-thomas.hellstrom@linux.intel.com>
References: <20251211165909.219710-1-thomas.hellstrom@linux.intel.com>
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
index 30584def0c6c..489b3e3e38dc 100644
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

