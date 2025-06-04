Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9CFACDB12
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 11:36:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2128D10E8FA;
	Wed,  4 Jun 2025 09:36:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CYVCKh8h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CC3310E8FA;
 Wed,  4 Jun 2025 09:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749029760; x=1780565760;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jeLtjTMQV71Rcvo+mu5SXxKbdCWTgIi85lUOoo9XwTI=;
 b=CYVCKh8hmV8lCZF9ferRV8G3kQk16MV6UDWSqxSV25PIYQz+qbLbXBUQ
 4PsoIsTRoOu1KFJ+A61kFXY+vPDVTDkC5u35at9Z/lCiof+tLjNeZHPDx
 K9gpceOP4DxE60ggTdUBjhw1lLuU2A0gHkgNZOStQM4VQUUz/9qcZK05D
 5CyiM7ukH8nITLzXquR1Ge4EIJDqn7APImKgMR6SK7lMiQR0MS56bZQp+
 FL81E2hzTzn9ssH0kafqbcsbMBrfplEJXSEl5a8TgLMdH1CCVLwyxJgBw
 4KmwyoXHFxGbukCUntfBjOlR3RAmNMEZ4z/40RUHfjI6nDICIAmrl6lvk Q==;
X-CSE-ConnectionGUID: W7LTEoqsSZm8rtid0U9JzA==
X-CSE-MsgGUID: OiyC0rvlRkqKjls6CHt1kw==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="50344665"
X-IronPort-AV: E=Sophos;i="6.16,208,1744095600"; d="scan'208";a="50344665"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 02:35:59 -0700
X-CSE-ConnectionGUID: JuUUMAFLT3y9UReXbuEKkw==
X-CSE-MsgGUID: rgxrygEPRqO5WAYeAYv0/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,208,1744095600"; d="scan'208";a="176001284"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO fedora..)
 ([10.245.245.121])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 02:35:56 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 apopple@nvidia.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>, felix.kuehling@amd.com,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dakr@kernel.org, "Mrozek, Michal" <michal.mrozek@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PATCH v2 0/3] drm/gpusvm, drm/pagemap,
 drm/xe: Restructure migration in preparation for multi-device
Date: Wed,  4 Jun 2025 11:35:33 +0200
Message-ID: <20250604093536.95982-1-thomas.hellstrom@linux.intel.com>
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

Matthew Brost (1):
  drm/gpusvm, drm/pagemap: Move migration functionality to drm_pagemap

Thomas Hellström (2):
  drm/pagemap: Add a populate_mm op
  drm/xe: Implement and use the drm_pagemap populate_mm op

 Documentation/gpu/rfc/gpusvm.rst     |  12 +-
 drivers/gpu/drm/Makefile             |   6 +-
 drivers/gpu/drm/drm_gpusvm.c         | 760 +-----------------------
 drivers/gpu/drm/drm_pagemap.c        | 846 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/Kconfig           |  10 +-
 drivers/gpu/drm/xe/xe_bo_types.h     |   2 +-
 drivers/gpu/drm/xe/xe_device_types.h |   2 +-
 drivers/gpu/drm/xe/xe_svm.c          | 129 ++--
 drivers/gpu/drm/xe/xe_svm.h          |  10 +-
 drivers/gpu/drm/xe/xe_tile.h         |  11 +
 drivers/gpu/drm/xe/xe_vm.c           |   2 +-
 include/drm/drm_gpusvm.h             |  96 ---
 include/drm/drm_pagemap.h            | 135 +++++
 13 files changed, 1107 insertions(+), 914 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_pagemap.c

-- 
2.49.0

