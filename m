Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A41E3390ACE
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 22:58:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48DFE6E43B;
	Tue, 25 May 2021 20:57:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6142F6E43B;
 Tue, 25 May 2021 20:57:53 +0000 (UTC)
IronPort-SDR: i/trAULosdUad+QGzVcH7u/nZQUUMt0hrd8FVErNqfqUXCFVaaDGb+Qdwe+zlzVprYVyMhLFUU
 Q7Y+FtMVpnpw==
X-IronPort-AV: E=McAfee;i="6200,9189,9995"; a="266195933"
X-IronPort-AV: E=Sophos;i="5.82,329,1613462400"; d="scan'208";a="266195933"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 13:57:52 -0700
IronPort-SDR: Svz67JEaNOrFiVov5ldMM94X1+toxD9evMDYMQ0lT7FlNOpb+knv0U/C5mv8G3GYN2iKAwfAqw
 bxZrE96A5mqA==
X-IronPort-AV: E=Sophos;i="5.82,329,1613462400"; d="scan'208";a="443603509"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 13:57:51 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 00/17] Non-interface changing GuC CTBs updates
Date: Tue, 25 May 2021 14:15:24 -0700
Message-Id: <20210525211541.87696-1-matthew.brost@intel.com>
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

Patch number #12 needs an Ack from Michal Wajdeczko.
Patch number #14 needs a review.

[1] https://patchwork.freedesktop.org/series/89844/

Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Daniele Ceraolo Spurio (3):
  drm/i915/guc: skip disabling CTBs before sanitizing the GuC
  drm/i915/guc: use probe_error log for CT enablement failure
  drm/i915/guc: enable only the user interrupt when using GuC submission

Matthew Brost (1):
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
 drivers/gpu/drm/i915/gt/uc/intel_guc.c        |  16 -
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |   1 -
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     | 527 ++++++++++--------
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h     |  14 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   | 207 +------
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  31 --
 drivers/gpu/drm/i915/gt/uc/intel_uc.c         |  10 -
 drivers/gpu/drm/i915/i915_utils.h             |   5 +
 drivers/gpu/drm/i915/i915_vma.h               |   5 -
 16 files changed, 596 insertions(+), 491 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/abi/guc_communication_mmio_abi.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/abi/guc_errors_abi.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/abi/guc_messages_abi.h

-- 
2.28.0

