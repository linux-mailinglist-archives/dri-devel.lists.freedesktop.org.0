Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8411C619E9D
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 18:24:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7768F10E968;
	Fri,  4 Nov 2022 17:23:42 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE96510E95F;
 Fri,  4 Nov 2022 17:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667582616; x=1699118616;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=T6C9BuDOv2hAmQPuBbvy1WAjA1cKsJwjkCW9vt9hVUw=;
 b=nvtg6GY6rB0/i4jGLTNjN6g+MUGoM76iWcw9sZpLfwGo8EXny1WevAFU
 wOUHwhW6gLh4htbN2YiGDHDPlbEt1oBfCRBUoS/detYL3CfUCtDDoWNet
 nqsVx18yoxtMsAJoKlX9LjxB7Qbq81Xjc4mnfwc7bdGDvszZQkALG+cuV
 /lq0Kxy0AJUCx8rR5x2B7li9qDSwdpl9BgM5bUVMjqn1hGZ1fFBw7S7uk
 qwlHIm8eIU8JDqlVC0rJ+EmkDO0cgUXZ+64Q0aa5UBT1KaPLXdb05HER+
 r6DYGH4ahvdMH8ljQyf17lTgJLX00sVsLA//H0H4NlQradf9dSxGiIZzi Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10521"; a="293350202"
X-IronPort-AV: E=Sophos;i="5.96,138,1665471600"; d="scan'208";a="293350202"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2022 10:23:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10521"; a="724422779"
X-IronPort-AV: E=Sophos;i="5.96,138,1665471600"; d="scan'208";a="724422779"
Received: from relo-linux-5.jf.intel.com ([10.165.21.154])
 by FMSMGA003.fm.intel.com with ESMTP; 04 Nov 2022 10:23:35 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 0/2] Add GT oriented dmesg output
Date: Fri,  4 Nov 2022 10:25:23 -0700
Message-Id: <20221104172525.569913-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

When trying to analyse bug reports from CI, customers, etc. it can be
difficult to work out exactly what is happening on which GT in a
multi-GT system. So add GT oriented debug/error message wrappers. If
used instead of the drm_ equivalents, you get the same output but with
a GT# prefix on it.

This patch also updates the gt/uc files to use the new helpers as a
first step. The intention would be to convert all output messages that
have access to a GT structure.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (2):
  drm/i915/gt: Add GT oriented dmesg output
  drm/i915/uc: Update the gt/uc code to use GT_ERR and friends

 drivers/gpu/drm/i915/gt/intel_gt.h            | 15 +++
 drivers/gpu/drm/i915/gt/uc/intel_guc.c        | 25 +++--
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    |  9 +-
 .../gpu/drm/i915/gt/uc/intel_guc_capture.c    | 50 ++++------
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     |  9 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c     | 17 ++--
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c    | 49 +++++-----
 drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c     |  3 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c   |  6 +-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 56 ++++++------
 drivers/gpu/drm/i915/gt/uc/intel_huc.c        | 20 ++--
 drivers/gpu/drm/i915/gt/uc/intel_uc.c         | 84 ++++++++---------
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      | 91 +++++++++----------
 drivers/gpu/drm/i915/gt/uc/selftest_guc.c     | 36 ++++----
 .../drm/i915/gt/uc/selftest_guc_hangcheck.c   | 22 ++---
 .../drm/i915/gt/uc/selftest_guc_multi_lrc.c   | 10 +-
 16 files changed, 243 insertions(+), 259 deletions(-)

-- 
2.37.3

