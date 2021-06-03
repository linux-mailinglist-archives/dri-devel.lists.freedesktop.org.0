Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 040AF399983
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 06:59:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94C1E6F3A1;
	Thu,  3 Jun 2021 04:58:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F93F6F39E;
 Thu,  3 Jun 2021 04:58:42 +0000 (UTC)
IronPort-SDR: p7KV4P4WaWUZB8Y7js1sYpVR4fFho/mZ/yLsWxj+D4/oCkzkLgMWipHhv81lOFOvzQFjpJ4VWC
 qD0XQvbjKSIg==
X-IronPort-AV: E=McAfee;i="6200,9189,10003"; a="203956504"
X-IronPort-AV: E=Sophos;i="5.83,244,1616482800"; d="scan'208";a="203956504"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2021 21:58:40 -0700
IronPort-SDR: SiYPmNobvucqJ3EhWavo4/srYY7C9kPGdIAHfj2qriMFu7BiT6wZyNq9pO0BLTFXKzK2Ovy+Nf
 7HvPE/LhUYog==
X-IronPort-AV: E=Sophos;i="5.83,244,1616482800"; d="scan'208";a="480019984"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2021 21:58:40 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 00/20] GuC CTBs changes + a few misc patches
Date: Wed,  2 Jun 2021 22:16:10 -0700
Message-Id: <20210603051630.2635-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
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
Cc: daniel.vetter@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Single series to merge the following series that have been reviewed /
passed CI:
https://patchwork.freedesktop.org/series/90633/
https://patchwork.freedesktop.org/series/90552/

Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Daniele Ceraolo Spurio (4):
  drm/i915/guc: skip disabling CTBs before sanitizing the GuC
  drm/i915/guc: use probe_error log for CT enablement failure
  drm/i915/guc: enable only the user interrupt when using GuC submission
  drm/i915/guc: Use guc_class instead of engine_class in fw interface

Matthew Brost (2):
  drm/i915/guc: Drop guc->interrupts.enabled
  drm/i915/guc: Ensure H2G buffer updates visible before tail update

Michal Wajdeczko (13):
  drm/i915/guc: Keep strict GuC ABI definitions
  drm/i915/guc: Stop using fence/status from CTB descriptor
  drm/i915: Promote ptrdiff() to i915_utils.h
  drm/i915/guc: Only rely on own CTB size
  drm/i915/guc: Don't repeat CTB layout calculations
  drm/i915/guc: Replace CTB array with explicit members
  drm/i915/guc: Update sizes of CTB buffers
  drm/i915/guc: Relax CTB response timeout
  drm/i915/guc: Start protecting access to CTB descriptors
  drm/i915/guc: Stop using mutex while sending CTB messages
  drm/i915/guc: Don't receive all G2H messages in irq handler
  drm/i915/guc: Always copy CT message to new allocation
  drm/i915/guc: Early initialization of GuC send registers

Rodrigo Vivi (1):
  drm/i915/guc: Remove sample_forcewake h2g action

 drivers/gpu/drm/i915/Kconfig.profile          |  10 +
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |   6 +-
 drivers/gpu/drm/i915/gt/intel_gt_irq.c        |  18 +-
 .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  |  51 ++
 .../gt/uc/abi/guc_communication_ctb_abi.h     | 106 ++++
 .../gt/uc/abi/guc_communication_mmio_abi.h    |  52 ++
 .../gpu/drm/i915/gt/uc/abi/guc_errors_abi.h   |  14 +
 .../gpu/drm/i915/gt/uc/abi/guc_messages_abi.h |  21 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.c        |  61 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |   2 -
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    |  20 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     | 537 +++++++++++-------
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h     |  14 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   | 233 ++------
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  31 -
 drivers/gpu/drm/i915/gt/uc/intel_uc.c         |  10 -
 drivers/gpu/drm/i915/i915_utils.h             |   5 +
 drivers/gpu/drm/i915/i915_vma.h               |   5 -
 18 files changed, 667 insertions(+), 529 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/abi/guc_communication_mmio_abi.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/abi/guc_messages_abi.h

-- 
2.28.0

