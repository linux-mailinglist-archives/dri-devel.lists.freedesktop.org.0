Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF72AD8E80
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 16:03:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E50CF10E9D1;
	Fri, 13 Jun 2025 14:03:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mCMh+mIL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF35E10E9D1;
 Fri, 13 Jun 2025 14:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749823417; x=1781359417;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AyWHG/1OU3NCOwN2KV5H9lqTgcq2Rn1dBFIA+OhCnuk=;
 b=mCMh+mIL59iXNCRwV67Y1mEVRwy/ya87X+7hggP2PsGru2OPJnnuhWL3
 9J7mKVXsxmA5ve/hm+j4AJwYBFjlxZ9bKqn0BQrWXCIdeQKG6K7SYnZY3
 1M1FYsuA2+d2RXf8C84IqSFoPcXE/SEzkYFqUIYH73gDTazCdWlArV2Wc
 Ui5Nm0wW+SEChLLT5wYMcZeJG+s2L9J1PwuF7nx2KGF68AYTx32sOWWQ9
 VM0dDTBpGuGOGzmKhP5CwJ9s2La3yGousEUuq35/KIV7rVfDpLbsg2KxL
 YlYTyBjjqH24A9HAZq5OFAflSGQ0LMPNN1wiZfRMWyYKvLHOt3X671K0Q Q==;
X-CSE-ConnectionGUID: LmlPYZImR0q00GJSaf25Gw==
X-CSE-MsgGUID: Kdx9LwXcTgSa3b5duQLPMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="69617592"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; d="scan'208";a="69617592"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 07:03:14 -0700
X-CSE-ConnectionGUID: zrAdeFEEShqW2CW5jFs/mw==
X-CSE-MsgGUID: ZDNi4ESCSsWvQoF6zDMDHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; d="scan'208";a="147676723"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.245.245.83])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 07:03:10 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 apopple@nvidia.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>,
 =?UTF-8?q?Felix=20K=C3=BChling?= <felix.kuehling@amd.com>,
 "Philip Yang" <philip.yang@amd.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dakr@kernel.org, "Mrozek, Michal" <michal.mrozek@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PATCH v3 0/3] drm/gpusvm, drm/pagemap,
 drm/xe: Restructure migration in preparation for multi-device
Date: Fri, 13 Jun 2025 16:02:16 +0200
Message-ID: <20250613140219.87479-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.49.0
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

This patchset modifies the migration part of drm_gpusvm to drm_pagemap and
adds a populate_mm() op to drm_pagemap.

The idea is that the device that receives a pagefault determines if it wants to
migrate content and to where. It then calls the populate_mm() method of relevant
drm_pagemap.

This functionality was mostly already in place, but hard-coded for xe only without
going through a pagemap op. Since we might be dealing with separate devices moving
forward, it also now becomes the responsibilit of the populate_mm() op to
grab any necessary local device runtime pm references and keep them held while
its pages are present in an mm (struct mm_struct).

On thing to decide here is whether the populate_mm() callback should sit on a
struct drm_pagemap for now while we sort multi-device usability out or whether
we should add it (or something equivalent) to struct dev_pagemap.

v2:
- Rebase.
v3:
- Documentation updates (CI, Matt Brost)
- Don't change TTM buffer object type for VRAM allocations (Matt Brost)

Matthew Brost (1):
  drm/gpusvm, drm/pagemap: Move migration functionality to drm_pagemap

Thomas Hellström (2):
  drm/pagemap: Add a populate_mm op
  drm/xe: Implement and use the drm_pagemap populate_mm op

 Documentation/gpu/rfc/gpusvm.rst     |  12 +-
 drivers/gpu/drm/Makefile             |   6 +-
 drivers/gpu/drm/drm_gpusvm.c         | 760 +-----------------------
 drivers/gpu/drm/drm_pagemap.c        | 832 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/Kconfig           |  10 +-
 drivers/gpu/drm/xe/xe_bo_types.h     |   2 +-
 drivers/gpu/drm/xe/xe_device_types.h |   2 +-
 drivers/gpu/drm/xe/xe_svm.c          | 124 ++--
 drivers/gpu/drm/xe/xe_svm.h          |  10 +-
 drivers/gpu/drm/xe/xe_tile.h         |  11 +
 drivers/gpu/drm/xe/xe_vm.c           |   2 +-
 include/drm/drm_gpusvm.h             |  96 ----
 include/drm/drm_pagemap.h            | 135 +++++
 13 files changed, 1090 insertions(+), 912 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_pagemap.c

-- 
2.49.0

