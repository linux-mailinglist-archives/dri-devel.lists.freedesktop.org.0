Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7764F39108C
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 08:25:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A81C6EB7E;
	Wed, 26 May 2021 06:24:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D97946EB7E;
 Wed, 26 May 2021 06:24:50 +0000 (UTC)
IronPort-SDR: cSouGid5ZfThiGtzNi6kiiT174jwR6O+JWwFJNpe1KTyE9eiPnFNh0k9+8NYky/+Z4W5DGy2rx
 USmxkSoFc1Nw==
X-IronPort-AV: E=McAfee;i="6200,9189,9995"; a="182033740"
X-IronPort-AV: E=Sophos;i="5.82,330,1613462400"; d="scan'208";a="182033740"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 23:24:49 -0700
IronPort-SDR: pvx9JURigEYHKxkIsXUxDiQzVEcl7HzW8yCcFMBJqII3nD6kquQiTTYJ12J92tNT09PG5cEio2
 FeyyWyd/C7ow==
X-IronPort-AV: E=Sophos;i="5.82,330,1613462400"; d="scan'208";a="633376813"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 23:24:47 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 00/18] Non-interface changing GuC CTBs updates
Date: Tue, 25 May 2021 23:42:19 -0700
Message-Id: <20210526064237.77853-1-matthew.brost@intel.com>
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
Cc: Michal.Wajdeczko@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As discussed in [1] we are breaking that large series into a several
smaller ones. This series is the non-interface changing part of step #2
- it makes all the changes needed before updating the GuC firwmare to a
new version without breaking any old interfaces.

A follow on series will be squashed into a single patch that updates the
GuC firmware + the required interface changes.

Patch number #13 needs an Ack from Michal Wajdeczko.
Patch number #6, #15 need reviews.

v2: Fix some checkpatch warnings, add patch number #6 to address CI
failure [2] in first rev 

[1] https://patchwork.freedesktop.org/series/89844/
[2] https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_20192/shard-tglb3/igt@gem_eio@in-flight-suspend.html

Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Daniele Ceraolo Spurio (3):
  drm/i915/guc: skip disabling CTBs before sanitizing the GuC
  drm/i915/guc: use probe_error log for CT enablement failure
  drm/i915/guc: enable only the user interrupt when using GuC submission

Matthew Brost (2):
  drm/i915/guc: Drop guc->interrupts.enabled
  drm/i915/guc: Ensure H2G buffer updates visible before tail update

Michal Wajdeczko (12):
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

Rodrigo Vivi (1):
  drm/i915/guc: Remove sample_forcewake h2g action

 drivers/gpu/drm/i915/Kconfig.profile          |   9 +
 drivers/gpu/drm/i915/gt/intel_gt_irq.c        |  18 +-
 .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  |  51 ++
 .../gt/uc/abi/guc_communication_ctb_abi.h     | 106 ++++
 .../gt/uc/abi/guc_communication_mmio_abi.h    |  52 ++
 .../gpu/drm/i915/gt/uc/abi/guc_errors_abi.h   |  14 +
 .../gpu/drm/i915/gt/uc/abi/guc_messages_abi.h |  21 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.c        |  43 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |   2 -
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     | 527 ++++++++++--------
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h     |  14 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   | 207 +------
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  31 --
 drivers/gpu/drm/i915/gt/uc/intel_uc.c         |  10 -
 drivers/gpu/drm/i915/i915_utils.h             |   5 +
 drivers/gpu/drm/i915/i915_vma.h               |   5 -
 16 files changed, 605 insertions(+), 510 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/abi/guc_communication_mmio_abi.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/abi/guc_messages_abi.h

-- 
2.28.0

