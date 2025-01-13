Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E76A0B810
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 14:25:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F9C410E67F;
	Mon, 13 Jan 2025 13:25:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h5hQTI4z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAE2E10E67A;
 Mon, 13 Jan 2025 13:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736774719; x=1768310719;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2EpgXsnZKtFdEKmFB4ugPI9M5QuZ3Ls5yODFufgZaJY=;
 b=h5hQTI4znrd0yOhNY66ZD5fU4WgRjdzXSuOPwXMay7GJ5C+6qOynR4Nw
 hD4Qu3xgrN5XiHivKledSpin+A/KIDL62fzA1uKi0IhgpZTzGaLS9rND5
 y6y/K1skYlu1bHglUDh9vxv12enAabjS4U9gQuz7dPqCijRhtiqc2mth0
 BNdEzTolEcAoyIkj3GoXL+mELywGC3igo0KZp+2/vrw3qYLWgewQTCL3X
 iyirWaM8KfBb0SFhh//77vveJEcTJQRVkbTPStaXQkhD/GcH0CmcdR0iY
 AHBorcHtrdfWYhIFgDj7jiaMnTULEDggYRUFzxBKM2sElvnheZPwK8cEs w==;
X-CSE-ConnectionGUID: +CBW+NGmT/20hcHldEbCMg==
X-CSE-MsgGUID: 9ZuvT7CrR0OiA1UBnFsYyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="54454091"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="54454091"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2025 05:25:19 -0800
X-CSE-ConnectionGUID: uK3c4JWPRhCi0opIIUz1uA==
X-CSE-MsgGUID: Ac49AsNfTKe5JVWnSalQNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="104432390"
Received: from unknown (HELO mkuoppal-desk.fi.intel.com) ([10.237.72.193])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2025 05:25:16 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH 14/27] drm/xe/eudebug: userptr vm access pread/pwrite
Date: Mon, 13 Jan 2025 15:26:19 +0200
Message-ID: <20250113132619.373502-1-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

Implement debugger vm access for userptrs.

When userptr bind is done, mmu notifier is added by core xe.
Later when debugger wants to access the target memory, this
notifier can be used as it carries the struct mm of target.

Implement userptr vm access, for debugger pread/pwrite
using notifier mm passed to access_remote_vm().

This is based on suggestions from Thomas, Joonas and Simona.

v2: need to add offset into vma (Dominik)
v3: use exported access_remote_vm (Thomas)

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Simona Vetter <simona@ffwll.ch>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_eudebug.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index 210d9eeab1a7..25f18aa5447b 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -3077,6 +3077,27 @@ static int xe_eudebug_vma_access(struct xe_vma *vma,
 
 		xe_bo_put(bo);
 
+		return ret;
+	} else if (xe_vma_is_userptr(vma)) {
+		struct xe_userptr *userptr = &to_userptr_vma(vma)->userptr;
+		struct xe_vm *vm = xe_vma_vm(vma);
+		struct mm_struct *mm = NULL;
+		int ret;
+
+		down_read(&vm->userptr.notifier_lock);
+		if (mmget_not_zero(userptr->notifier.mm))
+			mm = userptr->notifier.mm;
+		up_read(&vm->userptr.notifier_lock);
+
+		if (!mm)
+			return -EFAULT;
+
+		ret = access_remote_vm(mm,
+				       xe_vma_userptr(vma) + offset_in_vma,
+				       buf, bytes,
+				       write ? FOLL_WRITE : 0);
+		mmput(mm);
+
 		return ret;
 	}
 
-- 
2.43.0

