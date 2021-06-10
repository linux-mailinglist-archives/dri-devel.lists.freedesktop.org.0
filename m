Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A01E3A2330
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 06:19:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D63AE6E4B6;
	Thu, 10 Jun 2021 04:19:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25AFB6E453;
 Thu, 10 Jun 2021 04:19:00 +0000 (UTC)
IronPort-SDR: e+BbRuKmcEBFTuhpFcFLbuuC6BMfJYXKCTH4eu5PocFBGOiTmiLqyol9hJdSzlKKkscAbwJ2ch
 VPchhV2H/rAQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10010"; a="203373000"
X-IronPort-AV: E=Sophos;i="5.83,262,1616482800"; d="scan'208";a="203373000"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2021 21:18:59 -0700
IronPort-SDR: y2zQaLPS95s78L8McFPPHKXePenC8HI3AELhztjISsP1XAph2hFkHngcJV1yT/cHdqhS4MmlMu
 aXoOZJ68hwbA==
X-IronPort-AV: E=Sophos;i="5.83,262,1616482800"; d="scan'208";a="485997244"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2021 21:18:59 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 00/13]  Update firmware to v62.0.0
Date: Wed,  9 Jun 2021 21:36:36 -0700
Message-Id: <20210610043649.144416-1-matthew.brost@intel.com>
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
and greatest firmware. This series does that. This is a destructive
change. e.g. Without all the patches in this series it will break the
i915 driver. As such, after we review most of these patches they will
squashed into a single patch for merging.

v2: Address comments, looking for remaning RBs so patches can be
squashed and sent for CI

Signed-off-by: Matthew Brost <matthew.brost@intel.com>

[1] https://patchwork.freedesktop.org/series/89844/i

John Harrison (3):
  drm/i915/guc: Support per context scheduling policies
  drm/i915/guc: Unified GuC log
  drm/i915/guc: Update firmware to v62.0.0

Michal Wajdeczko (10):
  drm/i915/guc: Introduce unified HXG messages
  drm/i915/guc: Update MMIO based communication
  drm/i915/guc: Update CTB response status definition
  drm/i915/guc: Add flag for mark broken CTB
  drm/i915/guc: New definition of the CTB descriptor
  drm/i915/guc: New definition of the CTB registration action
  drm/i915/guc: New CTB based communication
  drm/i915/doc: Include GuC ABI documentation
  drm/i915/guc: Kill guc_clients.ct_pool
  drm/i915/guc: Kill ads.client_info

 Documentation/gpu/i915.rst                    |   8 +
 .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  | 107 ++++++
 .../gt/uc/abi/guc_communication_ctb_abi.h     | 128 +++++--
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
 13 files changed, 750 insertions(+), 421 deletions(-)

-- 
2.28.0

