Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 760FDAE0797
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 15:41:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC27310EA5C;
	Thu, 19 Jun 2025 13:40:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PH1NQGVt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EFED10EA59;
 Thu, 19 Jun 2025 13:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750340456; x=1781876456;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=olyk2Z08y9yVfDz1dq6kysTGfQdXE+8we6FETMScyTI=;
 b=PH1NQGVtY0HIekWD7Qg6oleobhUTK+QP1MJxZyyGUTMEcko8YhWMiEN6
 5h7PKH9IXGs6vtirvBneqSOWbPApxgCQ8AnxssqPzUm3aaKn8hviLUtM0
 1Rg12cb6wzZQtEjNJ32ZTC2FchwYb1nSpwG0R1CyA12fPrKY/GV84DelP
 TTNYNcsEYG/J29VCd9STjTmWcaBKa1PVxFzLsSzxYkG6VWxmHF647nDnZ
 149yKWD7pKiKIcYsRAswm2BEL7HmJIpm3yuA5V+lh30gHD5lZMNFl6thW
 O3Zn/8EyWU6+PhUAP2kN2YCYlg1Xk1hf+ETbqnOhDoMQjHtZADlvc6z/n w==;
X-CSE-ConnectionGUID: B4dDbu8lSEyT6BXAEWjDgA==
X-CSE-MsgGUID: tv3ZqckfRc+zb8DBKud9BQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="62862121"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; d="scan'208";a="62862121"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 06:40:56 -0700
X-CSE-ConnectionGUID: GuDOm9jNTnOjD9Wc6WX8ow==
X-CSE-MsgGUID: sERTmzvIS8SDm5wpQF1fgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; d="scan'208";a="150247417"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.245.244.196])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 06:40:52 -0700
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
Subject: [PATCH v6 0/3] drm/gpusvm, drm/pagemap,
 drm/xe: Restructure migration in preparation for multi-device
Date: Thu, 19 Jun 2025 15:40:32 +0200
Message-ID: <20250619134035.170086-1-thomas.hellstrom@linux.intel.com>
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
v4:
- Documentation Updates (Himal Ghimiray, Matt Brost)
- Add an assert (Matt Brost)
v5:
- Rebase
- Add R-Bs and SOBs.
v6:
- Fix an uninitialized variable (CI)

Matthew Brost (1):
  drm/gpusvm, drm/pagemap: Move migration functionality to drm_pagemap

Thomas Hellström (2):
  drm/pagemap: Add a populate_mm op
  drm/xe: Implement and use the drm_pagemap populate_mm op

 Documentation/gpu/rfc/gpusvm.rst     |  12 +-
 drivers/gpu/drm/Makefile             |   6 +-
 drivers/gpu/drm/drm_gpusvm.c         | 762 +-----------------------
 drivers/gpu/drm/drm_pagemap.c        | 838 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/Kconfig           |  10 +-
 drivers/gpu/drm/xe/xe_bo_types.h     |   2 +-
 drivers/gpu/drm/xe/xe_device_types.h |   2 +-
 drivers/gpu/drm/xe/xe_svm.c          | 125 ++--
 drivers/gpu/drm/xe/xe_svm.h          |  10 +-
 drivers/gpu/drm/xe/xe_tile.h         |  11 +
 drivers/gpu/drm/xe/xe_vm.c           |   2 +-
 include/drm/drm_gpusvm.h             |  96 ---
 include/drm/drm_pagemap.h            | 135 +++++
 13 files changed, 1099 insertions(+), 912 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_pagemap.c

-- 
2.49.0

