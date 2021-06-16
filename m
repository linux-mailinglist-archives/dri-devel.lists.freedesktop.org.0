Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5906D3A8CEC
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 01:55:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A464892C8;
	Tue, 15 Jun 2021 23:55:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5D26892BD;
 Tue, 15 Jun 2021 23:55:12 +0000 (UTC)
IronPort-SDR: t31T7wlJmdUItGA6IP5TiAGzTBP9dy9Vbgm0BA48rr9EGQ9dy4V0kZ8y7s3e2UXNqiWqpyUZcY
 uWGbBP848ReA==
X-IronPort-AV: E=McAfee;i="6200,9189,10016"; a="267236620"
X-IronPort-AV: E=Sophos;i="5.83,276,1616482800"; d="scan'208";a="267236620"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2021 16:55:11 -0700
IronPort-SDR: 6mNbyQ9MHARoWLEqUQiNRt0uKTYAcr+k0snM/MLkiSNGGAYCGj9fbw2bJbhfwK+BM+d//2+Yrl
 EGwqDktd0ZBw==
X-IronPort-AV: E=Sophos;i="5.83,276,1616482800"; d="scan'208";a="452138635"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2021 16:55:11 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/3] Update firmware to v62.0.0
Date: Tue, 15 Jun 2021 17:12:59 -0700
Message-Id: <20210616001302.84233-1-matthew.brost@intel.com>
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
Cc: daniele.ceraolospurio@intel.com, john.c.harrison@intel.com,
 Michal.Wajdeczko@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As part of enabling GuC submission [1] we need to update to the latest
and greatest firmware. This series does that. All backwards
compatibility breaking changes squashed into a single patch #2. Same
series sent to trybot [2] forcing GuC to be enabled to ensure we haven't
broke something.

v2: Address comments, looking for remaning RBs so patches can be
squashed and sent for CI
v3: Delete a few unused defines, squash patches
v4: Add values back into kernel doc, fix docs warning

Signed-off-by: Matthew Brost <matthew.brost@intel.com>

[1] https://patchwork.freedesktop.org/series/89844
[2] https://patchwork.freedesktop.org/series/91341 

Michal Wajdeczko (3):
  drm/i915/guc: Introduce unified HXG messages
  drm/i915/guc: Update firmware to v62.0.0
  drm/i915/doc: Include GuC ABI documentation

 Documentation/gpu/i915.rst                    |   8 +
 .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  | 107 ++++++
 .../gt/uc/abi/guc_communication_ctb_abi.h     | 126 +++++--
 .../gt/uc/abi/guc_communication_mmio_abi.h    |  65 ++--
 .../gpu/drm/i915/gt/uc/abi/guc_messages_abi.h | 213 +++++++++++
 drivers/gpu/drm/i915/gt/uc/intel_guc.c        | 107 ++++--
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    |  45 +--
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     | 356 +++++++++---------
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h     |   6 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |  75 +---
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c    |  29 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.h    |   6 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      |  26 +-
 13 files changed, 748 insertions(+), 421 deletions(-)

-- 
2.28.0

