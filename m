Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CF7C8A26F
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 15:08:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 769BA10E2B2;
	Wed, 26 Nov 2025 14:08:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DKlgAPVn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CDF310E2B2;
 Wed, 26 Nov 2025 14:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764166086; x=1795702086;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=n0BTz/KDiWpJkZ53qVb1PFbXEJ0IG+HQvXpbEvJMUZ0=;
 b=DKlgAPVnDgPOtwKOSWmlgRCImesVvzwxBjhzsQDROmHCeqQdHdVILsKW
 yOpd/uz1WIWDKNJSrPw1do152bb+wIa+iEr73Qwd6g3XU9MSQ+AcOUxIp
 p0qXlB1nWA/mKP1ms4KXZaDVct0BHZccnuCXLmkG4VfvwpPJ1ZiIimnEr
 4fnxe69/4UOVyiveUAWiDR8/U3fyC1SwRszL2VWLRGmdNarVSvyhUs7qE
 yZW6Gwd4mpMJNJwVHMltYU9c4k0krnNofNazFIqh/wXPeqcRx2ni5KiXc
 YKC5bYDR8FuxtuoFPk6otuf4jl3nEvXSeJ/26EqMQJlks3sqr3bveKsQX A==;
X-CSE-ConnectionGUID: JYSaR94RQAedNlYSSEg4Iw==
X-CSE-MsgGUID: 8sq0nNPtQLGvxfIJ3iDdxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="66365868"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="66365868"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 06:08:06 -0800
X-CSE-ConnectionGUID: R5cls438STyxEQFHyLG2mQ==
X-CSE-MsgGUID: O1WDIFgLQVGUx0xZHjcBig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="192740283"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 06:08:03 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com, lukas@wunner.de,
 simona.vetter@ffwll.ch, airlied@gmail.com, lucas.demarchi@intel.com,
 Riana Tauro <riana.tauro@intel.com>
Subject: [PATCH v2 0/4] Introduce DRM_RAS using generic netlink for RAS
Date: Wed, 26 Nov 2025 20:06:43 +0530
Message-ID: <20251126143652.2843242-6-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
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

This work is a continuation of the great work started by Aravind ([1] and [2])
in order to fulfill the RAS requirements and proposal as previously discussed
and agreed in the Linux Plumbers accelerator's bof of 2022 [3].

[1]: https://lore.kernel.org/dri-devel/20250730064956.1385855-1-aravind.iddamsetty@linux.intel.com/
[2]: https://lore.kernel.org/all/4cbdfcc5-5020-a942-740e-a602d4c00cc2@linux.intel.com/
[3]: https://airlied.blogspot.com/2022/09/accelerators-bof-outcomes-summary.html

During the past review round, Lukas pointed out that netlink had evolved
in parallel during these years and that now, any new usage of netlink families
would require the usage of the YAML description and scripts.

With this new requirement in place, the family name is hardcoded in the yaml file,
so we are forced to have a single family name for the entire drm, and then we now
we are forced to have a registration.

So, while doing the registration, we now created the concept of drm-ras-node.
For now the only node type supported is the agreed error-counter. But that could
be expanded for other cases like telemetry, requested by Zack for the qualcomm accel
driver.

In this first version, only querying counter is supported. But also this is expandable
to future introduction of multicast notification and also clearing the counters.

This design with multiple nodes per device is already flexible enough for driver
to decide if it wants to handle error per device, or per IP block, or per error
category. I believe this fully attend to the requested AMD feedback in the earlier
reviews.

So, my proposal is to start simple with this case as is, and then iterate over
with the drm-ras in tree so we evolve together according to various driver's RAS
needs.

I have provided a documentation and the first Xe implementation of the counter
as reference.

Also, it is worth to mention that we have a in-tree pyynl/cli.py tool that entirely
exercises this new API, hence I hope this can be the reference code for the uAPI
usage, while we continue with the plan of introducing IGT tests and tools for this
and adjusting the internal vendor tools to open with open source developments and
changing them to support these flows.

Example:

$ sudo ynl --family drm_ras  --dump list-nodes
[{'device-name': '0000:03:00.0',
  'node-id': 0,
  'node-name': 'correctable-errors',
  'node-type': 'error-counter'},
 {'device-name': '0000:03:00.0',
  'node-id': 1,
  'node-name': 'nonfatal-errors',
  'node-type': 'error-counter'},
 {'device-name': '0000:03:00.0',
  'node-id': 2,
  'node-name': 'fatal-errors',
  'node-type': 'error-counter'}]

$ sudo ynl --family drm_ras  --dump get-error-counters --json '{"node-id":2}'
[{'error-id': 1, 'error-name': 'GT Error', 'error-value': 2},
 {'error-id': 2, 'error-name': 'SOC Error', 'error-value': 0}]


$ sudo ynl --family drm_ras --do query-error-counter  --json '{"node-id":2, "error-id":1}'
{'error-id': 1, 'error-name': 'GT Error', 'error-value': 2}

IGT : https://patchwork.freedesktop.org/patch/689729/?series=157409&rev=3

Rev2: Fix review comments
      Add support for GT and SOC errors

Riana Tauro (3):
  drm/xe/xe_drm_ras: Add support for drm ras
  drm/xe/xe_hw_error: Add support for GT hardware errors
  drm/xe/xe_hw_error: Add support for PVC SOC errors

Rodrigo Vivi (1):
  drm/ras: Introduce the DRM RAS infrastructure over generic netlink

 Documentation/gpu/drm-ras.rst              | 107 ++++++
 Documentation/netlink/specs/drm_ras.yaml   | 130 +++++++
 drivers/gpu/drm/Kconfig                    |   9 +
 drivers/gpu/drm/Makefile                   |   1 +
 drivers/gpu/drm/drm_drv.c                  |   6 +
 drivers/gpu/drm/drm_ras.c                  | 351 +++++++++++++++++
 drivers/gpu/drm/drm_ras_genl_family.c      |  42 +++
 drivers/gpu/drm/drm_ras_nl.c               |  54 +++
 drivers/gpu/drm/xe/Makefile                |   1 +
 drivers/gpu/drm/xe/regs/xe_hw_error_regs.h |  68 ++++
 drivers/gpu/drm/xe/xe_device_types.h       |   4 +
 drivers/gpu/drm/xe/xe_drm_ras.c            | 222 +++++++++++
 drivers/gpu/drm/xe/xe_drm_ras.h            |  12 +
 drivers/gpu/drm/xe/xe_drm_ras_types.h      |  54 +++
 drivers/gpu/drm/xe/xe_hw_error.c           | 413 +++++++++++++++++++--
 include/drm/drm_ras.h                      |  76 ++++
 include/drm/drm_ras_genl_family.h          |  17 +
 include/drm/drm_ras_nl.h                   |  24 ++
 include/uapi/drm/drm_ras.h                 |  49 +++
 include/uapi/drm/xe_drm.h                  |   6 +
 20 files changed, 1620 insertions(+), 26 deletions(-)
 create mode 100644 Documentation/gpu/drm-ras.rst
 create mode 100644 Documentation/netlink/specs/drm_ras.yaml
 create mode 100644 drivers/gpu/drm/drm_ras.c
 create mode 100644 drivers/gpu/drm/drm_ras_genl_family.c
 create mode 100644 drivers/gpu/drm/drm_ras_nl.c
 create mode 100644 drivers/gpu/drm/xe/xe_drm_ras.c
 create mode 100644 drivers/gpu/drm/xe/xe_drm_ras.h
 create mode 100644 drivers/gpu/drm/xe/xe_drm_ras_types.h
 create mode 100644 include/drm/drm_ras.h
 create mode 100644 include/drm/drm_ras_genl_family.h
 create mode 100644 include/drm/drm_ras_nl.h
 create mode 100644 include/uapi/drm/drm_ras.h

-- 
2.47.1

