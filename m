Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BBF6F8661
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 18:08:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 794C710E635;
	Fri,  5 May 2023 16:08:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00A7810E633;
 Fri,  5 May 2023 16:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683302907; x=1714838907;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PRuHjZkzqB/ib3PdQurqfsVvSKMKgrOuiux5EVQVrwg=;
 b=NQHafGCTwRuut4xQ0mqqjIAdT2jw3WEuPBr7irSYiFzCoTfi9rNjXTjm
 RrjP33nyEI98VNx6PXTFAz/4crxPqkE5p4c1yXui5YdGRJA535nqFJnag
 qyfjhiQU7lxCKhxOVJWiIHxyP053dU4wDcoGckB6ybQSfr/1RaXmvnDUy
 9lzKQVvuwQuFLzaeMY1Rwaw+sLakvYJ3YIGi/QJS/ZccPJ1Z/9st6TfGr
 5J+AWbUXksffBVZRxUGzzvVt/1tyXpWJHg9KjLBu7YiLsnpGF1V5P3a3E
 C+t+BrHNmeLPNQ1MKHJQ1FL1EdRxxyMcuOWGOnriugvPQgbg36gV1dfFT w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="349276932"
X-IronPort-AV: E=Sophos;i="5.99,252,1677571200"; d="scan'208";a="349276932"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 09:04:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="871911252"
X-IronPort-AV: E=Sophos;i="5.99,252,1677571200"; d="scan'208";a="871911252"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 09:04:26 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/6] drm/i915: GSC FW support for MTL
Date: Fri,  5 May 2023 09:04:09 -0700
Message-Id: <20230505160415.889525-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.40.0
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
Cc: John Harrison <John.C.Harrison@Intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Last chunk of the required support for the GSC FW. This includes some
fixes to the GSC memory allocation, FW idefinition and version
management, plus a new debugfs for debug information.

Adding the FW definition will enable all the features that are dependent
on the GSC being loaded (Media C6, HuC loading, SW proxy, PXP, HDCP).

The HuC series [1] has been included, squashed in a single patch,
as one of the patches in this series depends on it, but it should be
reviewd in its own thread.

[1] https://patchwork.freedesktop.org/series/117080/
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Suraj Kandpal <suraj.kandpal@intel.com>

Daniele Ceraolo Spurio (6):
  DO NOT REVIEW: drm/i915: HuC loading and authentication for MTL
  drm/i915/uc/gsc: fixes and updates for GSC memory allocation
  drm/i915/uc/gsc: extract release and security versions from the gsc
    binary
  drm/i915/uc/gsc: query the GSC FW for its compatibility version
  drm/i915/uc/gsc: define gsc fw
  drm/i915/uc/gsc: Add a gsc_info debugfs

 drivers/gpu/drm/i915/Makefile                 |   3 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c          |   3 +
 drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c     | 277 +++++++++++++++---
 drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h     |   2 +
 .../drm/i915/gt/uc/intel_gsc_meu_headers.h    | 143 +++++++++
 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c     | 154 +++++++++-
 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h     |   6 +
 .../gpu/drm/i915/gt/uc/intel_gsc_uc_debugfs.c |  38 +++
 .../gpu/drm/i915/gt/uc/intel_gsc_uc_debugfs.h |  14 +
 .../i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c |   2 +-
 .../i915/gt/uc/intel_gsc_uc_heci_cmd_submit.h |   1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.c        |   2 +-
 drivers/gpu/drm/i915/gt/uc/intel_huc.c        | 182 ++++++++----
 drivers/gpu/drm/i915/gt/uc/intel_huc.h        |  26 +-
 drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c     | 224 +++++++++++++-
 drivers/gpu/drm/i915/gt/uc/intel_huc_fw.h     |   6 +-
 drivers/gpu/drm/i915/gt/uc/intel_huc_print.h  |  21 ++
 drivers/gpu/drm/i915/gt/uc/intel_uc.c         |  10 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.h         |   2 +
 drivers/gpu/drm/i915/gt/uc/intel_uc_debugfs.c |   2 +
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      | 218 +++++++++-----
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h      |  13 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h  |   6 -
 drivers/gpu/drm/i915/i915_getparam.c          |   6 +-
 drivers/gpu/drm/i915/i915_reg.h               |  25 ++
 .../drm/i915/pxp/intel_pxp_cmd_interface_43.h |  14 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_huc.c      |   2 +-
 include/uapi/drm/i915_drm.h                   |   3 +-
 28 files changed, 1191 insertions(+), 214 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_gsc_meu_headers.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_debugfs.c
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_debugfs.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_huc_print.h

-- 
2.40.0

