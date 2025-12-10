Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C59ACB2C79
	for <lists+dri-devel@lfdr.de>; Wed, 10 Dec 2025 12:09:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9635610E705;
	Wed, 10 Dec 2025 11:09:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gEVyUBKt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 306DA10E701;
 Wed, 10 Dec 2025 11:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765364954; x=1796900954;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=G0qIthYM3oskQ/BJrJRQ9rSJfTpZoDNkJQ+LEyBnvd0=;
 b=gEVyUBKtDC9StiP7Gw8joq021uEuIcNVjj+J094hkBfvNzZv0mjsVLoa
 yr2YgZbFeYfEZlucOsdt2NRTFCtUznykeZNWQGQwnUhX9U6AmWARK7Rse
 WsK4yvW7a5OsqwI73xaYjDTT2jesKoGJOPRxxqaALIO7t3Y3j9/0rhw3i
 ChJIp0mpn8KWLxatlQ/kHApREN3v4K/QetwRERw0jotJaxumaAtyuRy6x
 FWLcUICPsasp/b/hadiNIRckONyxzhtvszUl093pHDsFGFveykSjuEaPv
 nQd3kdQh14HF7AJwwrHAq5xf8ENwIBdHQ3uy+whBBQXCVI0ZhgdYu4JTJ w==;
X-CSE-ConnectionGUID: vAbOq8cGT72MXUYhGUFcAQ==
X-CSE-MsgGUID: pVYnHNonTPStnkZVfLYzfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67221870"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="67221870"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 03:09:14 -0800
X-CSE-ConnectionGUID: 8zWG/UX+Qs29eTktP5jOlg==
X-CSE-MsgGUID: ISlCaKCfTgSIKw3KXjBMeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="196487224"
Received: from rvuia-mobl.ger.corp.intel.com (HELO fedora) ([10.245.244.44])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 03:09:11 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org,
 himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>, felix.kuehling@amd.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dakr@kernel.org, "Mrozek, Michal" <michal.mrozek@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PATCH v3 17/22] drm/xe/svm: Document how xe keeps drm_pagemap
 references
Date: Wed, 10 Dec 2025 12:07:37 +0100
Message-ID: <20251210110742.107575-18-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251210110742.107575-1-thomas.hellstrom@linux.intel.com>
References: <20251210110742.107575-1-thomas.hellstrom@linux.intel.com>
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
index 9eb288b8b57b..8d230eda3360 100644
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

