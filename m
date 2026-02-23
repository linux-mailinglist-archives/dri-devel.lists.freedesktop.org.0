Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id puF9JMfmm2nW9AMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 06:33:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DB5171E55
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 06:33:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F68A10E21B;
	Mon, 23 Feb 2026 05:33:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hIDjvQOo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C36A10E21B;
 Mon, 23 Feb 2026 05:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771824834; x=1803360834;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yEOpfAFaPTRQ9zteVUAnAyz7/OxJJTvpgO9p56rm2Ww=;
 b=hIDjvQOoZM5hnr6Rr3pnzpnA0VjibY6rm89iP2MWh241dvLhGsMttVK0
 CvGjA9ZX64sGip9rP1QdAmhCuDqWVaaJ8Zmn21Ih3Yx/TOzedupBgSWmB
 q4yIX6iZYONYMp8rBfF0GMQMqMiWDgEc7yRzy+IP/C8MUDhREUI/vlieV
 gkaAY7et54uV0FPnbPCvMheaPjexy864xVTaC6n2LRb3Dz8PTvS2IhRHq
 RGKfqNMV2pYY6kO9+2XJ44p4f5S+tpgMad+jTOar+rD9YbpuBxHEbDohc
 4Oh2e1tL15ZOyxUnUp8KtGx8OGT4r9kgNFIcyB+J3c3YPcmwLtKoJGSAH Q==;
X-CSE-ConnectionGUID: ohhN9gKFSOSe/kLtk22Gzg==
X-CSE-MsgGUID: 8XwVuBnvQlmoFQndXCfKiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="72991440"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="72991440"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2026 21:33:52 -0800
X-CSE-ConnectionGUID: aa5du8NITe+765/ptf30ig==
X-CSE-MsgGUID: dWoDEh3+S42TIoNE3hDrWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="253175066"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2026 21:33:47 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 simona.vetter@ffwll.ch, airlied@gmail.com, pratik.bari@intel.com,
 joshua.santosh.ranjan@intel.com, ashwin.kumar.kulkarni@intel.com,
 shubham.kumar@intel.com, ravi.kishore.koppuravuri@intel.com,
 raag.jadav@intel.com, anvesh.bakwad@intel.com,
 Riana Tauro <riana.tauro@intel.com>
Subject: [PATCH v8 0/5] Introduce DRM_RAS using generic netlink for RAS
Date: Mon, 23 Feb 2026 11:35:40 +0530
Message-ID: <20260223060541.526397-7-riana.tauro@intel.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux.intel.com,intel.com,ffwll.ch,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[riana.tauro@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:mid,intel.com:dkim]
X-Rspamd-Queue-Id: 65DB5171E55
X-Rspamd-Action: no action

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

1) List Nodes:

    $ sudo ynl --family drm_ras --dump list-nodes
    [{'device-name': '0000:03:00.0',
      'node-id': 0,
      'node-name': 'correctable-errors',
      'node-type': 'error-counter'},
     {'device-name': '0000:03:00.0',
      'node-id': 1,
      'node-name': 'uncorrectable-errors',
      'node-type': 'error-counter'}]

2) Get Error counters:

    $ sudo ynl --family drm_ras --dump get-error-counter --json '{"node-id":0}'
    [{'error-id': 1, 'error-name': 'core-compute', 'error-value': 0},
    {'error-id': 2, 'error-name': 'soc-internal', 'error-value': 0}]

3) Get specific Error counter:

    $ sudo ynl --family drm_ras --do get-error-counter --json '{"node-id":0, "error-id":1}'
    {'error-id': 1, 'error-name': 'core-compute', 'error-value': 0}

IGT : https://patchwork.freedesktop.org/patch/689729/?series=157409&rev=3

Rev2: Fix review comments
      Add support for GT and SOC errors

Rev3: Add uAPI for errors and nodes
      Update documentation

Rev4: Use only correctable and uncorrectable error nodes
      use REG_BIT
      remove redundant error strings

Rev5: Split patch 2
      use atomic_t
      fix memory leaks
      fix logs
      fix hook failure
      change component and severity UAPI

Rev6: fix alignment
      fix comparison in CSC error
      add severity string to csc error
      rename soc error handler base register variables
      deallocate info if drm ras registeration fails
      rename init function to xe_drm_ras_init()
      fix htmldocs errors
      Add 'depends on NET' for drm ras netlink

Rev7: add macro for gt vector length and master local registers
      print errors on failure

Rev8: use single command for both do/dump operations
      fix yamllint errors
      regenerate files
      fix kernel-doc

Riana Tauro (4):
  drm/xe/xe_drm_ras: Add support for XE DRM RAS
  drm/xe/xe_hw_error: Integrate DRM RAS with hardware error handling
  drm/xe/xe_hw_error: Add support for Core-Compute errors
  drm/xe/xe_hw_error: Add support for PVC SoC errors

Rodrigo Vivi (1):
  drm/ras: Introduce the DRM RAS infrastructure over generic netlink

 Documentation/gpu/drm-ras.rst              | 103 +++++
 Documentation/gpu/index.rst                |   1 +
 Documentation/netlink/specs/drm_ras.yaml   | 118 ++++++
 drivers/gpu/drm/Kconfig                    |  10 +
 drivers/gpu/drm/Makefile                   |   1 +
 drivers/gpu/drm/drm_drv.c                  |   6 +
 drivers/gpu/drm/drm_ras.c                  | 352 ++++++++++++++++
 drivers/gpu/drm/drm_ras_genl_family.c      |  42 ++
 drivers/gpu/drm/drm_ras_nl.c               |  55 +++
 drivers/gpu/drm/xe/Makefile                |   1 +
 drivers/gpu/drm/xe/regs/xe_hw_error_regs.h |  86 +++-
 drivers/gpu/drm/xe/xe_device_types.h       |   4 +
 drivers/gpu/drm/xe/xe_drm_ras.c            | 186 +++++++++
 drivers/gpu/drm/xe/xe_drm_ras.h            |  15 +
 drivers/gpu/drm/xe/xe_drm_ras_types.h      |  48 +++
 drivers/gpu/drm/xe/xe_hw_error.c           | 451 +++++++++++++++++++--
 include/drm/drm_ras.h                      |  75 ++++
 include/drm/drm_ras_genl_family.h          |  17 +
 include/drm/drm_ras_nl.h                   |  25 ++
 include/uapi/drm/drm_ras.h                 |  49 +++
 include/uapi/drm/xe_drm.h                  |  79 ++++
 21 files changed, 1682 insertions(+), 42 deletions(-)
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

