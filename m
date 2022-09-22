Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79EC65E6F67
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 00:10:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F0A410E47E;
	Thu, 22 Sep 2022 22:10:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98F8510E449;
 Thu, 22 Sep 2022 22:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663884622; x=1695420622;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IdWFJTYviqZq0fUomhEWUPPpWBZkPTfExZuRgx3Kujs=;
 b=SIAxlUKJdqdn249mQsgWgzCPvDwfHzmf5km9sPY1jZ4uGzkoDP57kyIg
 jAaefjk0AubgymTN/MGg5CaiclmxZVyhkfrO81ocTOeDe6adHeybMXENg
 Ph4EZMUqKPG76pZCj88dS1cYPvAGsR6qi+RGQBtiah3nKuJB2a3T/hNUC
 qWD0dbmzckWo99EI4rG5Z/L9ybEjjpXOX2+ZgpXGZnPRzT7LHrqz3CCCN
 +bzb4gWcQzX2ONVjRWmjM/pS+bk4eBgcNGOhvNWiiY3kQSpGdO3wv6zc0
 C/AIEWSfLxuFFYRnBiU6tMjX0vMXMxyVMB6HppFr6rfAhZn92zNyuJtTs A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="280815477"
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; d="scan'208";a="280815477"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 15:10:21 -0700
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; d="scan'208";a="682416098"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 15:10:21 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/7] drm/i915: prepare for uC loading on MTL
Date: Thu, 22 Sep 2022 15:11:10 -0700
Message-Id: <20220922221117.458087-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.37.3
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
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The introduction of the media GT brings a few changes for GuC/HuC. The
main difference between the 2 GTs is that only the media one has the
HuC, while both have the GuC. Also, the fact that both GTs use the same
G-unit and GGTT means we now have parallel interrupt/communication
paths. Lastly, WOPCM is divided between the two GTs, with each having
their own private chunk.

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Radhakrishna Sripada <radhakrishna.sripada@intel.com>

Aravind Iddamsetty (1):
  drm/i915/mtl: Handle wopcm per-GT and limit calculations.

Daniele Ceraolo Spurio (5):
  drm/i915/huc: only load HuC on GTs that have VCS engines
  drm/i915/uc: fetch uc firmwares for each GT
  drm/i915/uc: use different ggtt pin offsets for uc loads
  drm/i915/guc: define media GT GuC send regs
  drm/i915/guc: handle interrupts from media GuC

Stuart Summers (1):
  drm/i915/guc: Add GuC deprivilege feature to MTL

 drivers/gpu/drm/i915/Makefile               |  7 +--
 drivers/gpu/drm/i915/gt/intel_ggtt.c        |  2 +-
 drivers/gpu/drm/i915/gt/intel_gt.c          |  1 +
 drivers/gpu/drm/i915/gt/intel_gt_irq.c      | 21 +++++++--
 drivers/gpu/drm/i915/gt/intel_gt_regs.h     |  2 +
 drivers/gpu/drm/i915/gt/intel_gt_types.h    |  2 +
 drivers/gpu/drm/i915/{ => gt}/intel_wopcm.c | 48 +++++++++++++++------
 drivers/gpu/drm/i915/{ => gt}/intel_wopcm.h |  0
 drivers/gpu/drm/i915/gt/uc/intel_guc.c      | 43 ++++++++++--------
 drivers/gpu/drm/i915/gt/uc/intel_guc.h      |  5 ++-
 drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h  |  2 +
 drivers/gpu/drm/i915/gt/uc/intel_huc.c      | 21 +++++++++
 drivers/gpu/drm/i915/gt/uc/intel_uc.c       | 12 ++++--
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c    | 36 ++++++++++++----
 drivers/gpu/drm/i915/i915_driver.c          |  2 -
 drivers/gpu/drm/i915/i915_drv.h             | 12 +++---
 drivers/gpu/drm/i915/i915_gem.c             |  6 ++-
 drivers/gpu/drm/i915/i915_pci.c             |  1 +
 18 files changed, 161 insertions(+), 62 deletions(-)
 rename drivers/gpu/drm/i915/{ => gt}/intel_wopcm.c (86%)
 rename drivers/gpu/drm/i915/{ => gt}/intel_wopcm.h (100%)

-- 
2.37.3

