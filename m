Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FFEAD39CDF
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 04:29:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9888410E32B;
	Mon, 19 Jan 2026 03:29:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZK+U5OLu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78BCE10E32B;
 Mon, 19 Jan 2026 03:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768793391; x=1800329391;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=O4q+1AGtGrB28fOYUZxTRUC9O/6WswHRXwjokHzTSJM=;
 b=ZK+U5OLulCc8MI2Gdk+Ai3CjEGiwSwXEcAnanew7sW4KSY09N2f9oNWx
 FG12A0WdX3j/eRXDM/I+1e8c+MRfMja99OYUcIsYTM4uDpbH153dLoL6D
 xfIYacxofMI37j26nUmKrQxzxP1OuvwdyCV1mLipqdNjlLpTawrw2PYPa
 XXAuFPvy2mgIFp84+ZkkuVaC1rzcZKg+Ai0dK92erJWwfle0NglFqfn1D
 mgwJrWlCqWFEsd0v47gLB93KPcxyLipp/noWBGvGagd1XkHGiNv7fbgux
 kPmClTCdntdaPTv6a5lA2OQvD6jyasgaEr5pQtsffOi3IfhkkjY6EzGgY w==;
X-CSE-ConnectionGUID: b9HSGMb1RyWKwYi+3JtNxg==
X-CSE-MsgGUID: fkU2y2GtT4KCZ6q3FYWtRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="70050091"
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; d="scan'208";a="70050091"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2026 19:29:51 -0800
X-CSE-ConnectionGUID: iDM/5xg1SCaz+IuGLBmCJA==
X-CSE-MsgGUID: gXEBc2lnSG2zoru9RTx9jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; d="scan'208";a="243323843"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2026 19:29:47 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 simona.vetter@ffwll.ch, airlied@gmail.com, pratik.bari@intel.com,
 joshua.santosh.ranjan@intel.com, ashwin.kumar.kulkarni@intel.com,
 shubham.kumar@intel.com, ravi.kishore.koppuravuri@intel.com,
 raag.jadav@intel.com, Riana Tauro <riana.tauro@intel.com>
Subject: [PATCH v4 0/4] Introduce DRM_RAS using generic netlink for RAS
Date: Mon, 19 Jan 2026 09:30:22 +0530
Message-ID: <20260119040023.2821518-6-riana.tauro@intel.com>
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

List Nodes:

$ sudo ynl --family drm_ras --dump list-nodes
[{'device-name': '0000:03:00.0',
  'node-id': 0,
  'node-name': 'correctable-errors',
  'node-type': 'error-counter'},
 {'device-name': '0000:03:00.0',
  'node-id': 1,
  'node-name': 'uncorrectable-errors',
  'node-type': 'error-counter'}]

Get Error counters:

$ sudo ynl --family drm_ras  --dump get-error-counters --json '{"node-id":0}'
[{'error-id': 1, 'error-name': 'GT', 'error-value': 0},
 {'error-id': 2, 'error-name': 'SoC', 'error-value': 0}]

Query Error counter:

$ sudo ynl --family drm_ras --do query-error-counter  --json '{"node-id":0, "error-id":1}'
{'error-id': 1, 'error-name': 'GT', 'error-value': 0}

IGT : https://patchwork.freedesktop.org/patch/689729/?series=157409&rev=3

Rev2: Fix review comments
      Add support for GT and SOC errors

Rev3: Add uAPI for errors and nodes
      Update documentation
       
Rev4: Use only correctable and uncorrectable error nodes
      use REG_BIT
      remove redundant error strings

Riana Tauro (3):
  drm/xe/xe_drm_ras: Add support for drm ras
  drm/xe/xe_hw_error: Add support for GT hardware errors
  drm/xe/xe_hw_error: Add support for PVC SOC errors

Rodrigo Vivi (1):
  drm/ras: Introduce the DRM RAS infrastructure over generic netlink

 Documentation/gpu/drm-ras.rst              | 109 ++++++
 Documentation/gpu/index.rst                |   1 +
 Documentation/netlink/specs/drm_ras.yaml   | 130 +++++++
 drivers/gpu/drm/Kconfig                    |   9 +
 drivers/gpu/drm/Makefile                   |   1 +
 drivers/gpu/drm/drm_drv.c                  |   6 +
 drivers/gpu/drm/drm_ras.c                  | 351 +++++++++++++++++
 drivers/gpu/drm/drm_ras_genl_family.c      |  42 ++
 drivers/gpu/drm/drm_ras_nl.c               |  54 +++
 drivers/gpu/drm/xe/Makefile                |   1 +
 drivers/gpu/drm/xe/regs/xe_hw_error_regs.h |  77 +++-
 drivers/gpu/drm/xe/xe_device_types.h       |   4 +
 drivers/gpu/drm/xe/xe_drm_ras.c            | 176 +++++++++
 drivers/gpu/drm/xe/xe_drm_ras.h            |  15 +
 drivers/gpu/drm/xe/xe_drm_ras_types.h      |  49 +++
 drivers/gpu/drm/xe/xe_hw_error.c           | 431 +++++++++++++++++++--
 include/drm/drm_ras.h                      |  76 ++++
 include/drm/drm_ras_genl_family.h          |  17 +
 include/drm/drm_ras_nl.h                   |  24 ++
 include/uapi/drm/drm_ras.h                 |  49 +++
 include/uapi/drm/xe_drm.h                  |  79 ++++
 21 files changed, 1663 insertions(+), 38 deletions(-)
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

