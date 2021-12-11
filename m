Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 363BB470F35
	for <lists+dri-devel@lfdr.de>; Sat, 11 Dec 2021 01:08:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6640010E429;
	Sat, 11 Dec 2021 00:08:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A824410E406;
 Sat, 11 Dec 2021 00:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639181289; x=1670717289;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZZYhZhcaOFSjBuZXHdnvv0ajseqsgdN1F3haeMU+47Q=;
 b=X0SJX3HXISWVcWGIn43LSEXoxYP26LD5EK3jO7JAlDNoeb4B7QL0ke/B
 3ew1AmrABPu6nxdnvk5Og/d4As8nMdOXRkxeITsRQ2Rwl0PSA/rfdekiU
 zOVD08/BVZCXy4WpM5KD6vB54jqa6yud1/ezBZtRih4CHZBKLSH0Ls6W7
 3xFzMNL38SPMhhFzCu8RQs7hhkLQjb6ZvycZt7C+f7GrkUXlC4Y69vuf3
 Gk5q5rsHuYXBx71PbWWvYZqBdcEPkGy3UqSPPQuswP5kcMAp8fqTaunbw
 GI8pwgTkxSK6F0+ADxB+4WQBwrVO8C6uilnOnq3RaPUHOFPBK37HOCsoG Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10194"; a="218508327"
X-IronPort-AV: E=Sophos;i="5.88,197,1635231600"; d="scan'208";a="218508327"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2021 16:08:09 -0800
X-IronPort-AV: E=Sophos;i="5.88,197,1635231600"; d="scan'208";a="504149971"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2021 16:08:08 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 0/3] drm/i915: Support bigger GuC RSA keys
Date: Fri, 10 Dec 2021 16:07:53 -0800
Message-Id: <20211211000756.1698923-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, dri-devel@lists.freedesktop.org,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some of the newer platforms use a bigger RSA key to authenticate the GuC,
which is provided to the HW via a ggtt-pinned object instead of mmio.

While doing the changes for this I've also spotted an inconsistency in
the error status of the fw on init failure, so I've added a path to fix
that as well.

v2: clarify in comments that the expected RSA size is hardcoded in the
bootrom (Matt)

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>

Daniele Ceraolo Spurio (2):
  drm/i915/uc: correctly track uc_fw init failure
  drm/i915/guc: support bigger RSA keys

Michal Wajdeczko (1):
  drm/i915/uc: Prepare for different firmware key sizes

 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c | 33 ++++++--
 drivers/gpu/drm/i915/gt/uc/intel_huc.c    | 75 +-----------------
 drivers/gpu/drm/i915/gt/uc/intel_huc.h    |  2 -
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c  | 95 ++++++++++++++++++++---
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h  | 18 +++--
 5 files changed, 128 insertions(+), 95 deletions(-)

-- 
2.25.1

