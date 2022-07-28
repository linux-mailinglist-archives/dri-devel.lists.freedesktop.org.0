Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6FF5836BE
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 04:20:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCCAA10E11D;
	Thu, 28 Jul 2022 02:20:38 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F15E210E0F4;
 Thu, 28 Jul 2022 02:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658974833; x=1690510833;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vmllZM6cK7b0ipcKBEsDQT6S6bdz3014SHWlkt2qXIg=;
 b=H0su+AfeyUhoMjI4oOdpj568EpzKOajyRH9KxvLPYTWIWBY2s6NZq7wH
 8hc2+o5tD0E1dBhfBZneoGqT4HaIsIAPWllGVIolGbrQdOGW7v6twljhy
 iA2T5/8BkP9ez8VfxeDlzP1q3SZ7OYjIi8wTaPnlzNAUFW30zszi/RWMe
 cHEslWncq65tNrzs+7mMENyRJH0Wn3ZUaTged25R5iLwr1ayGzXWlHyei
 6Pq7YKgT901vKgUihAhqtyATmluuB/xXguw7CiCRUo8N/xWVf4P+YF3P1
 oAakcwOY9Xsp0mOKeq1rzZj9sgexPiDoefeuKctdn6v+tu7nMSfPIiLnW w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10421"; a="285947580"
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200"; d="scan'208";a="285947580"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2022 19:20:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200"; d="scan'208";a="600648459"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by orsmga002.jf.intel.com with ESMTP; 27 Jul 2022 19:20:28 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 0/7] Fixes and improvements to GuC logging and error capture
Date: Wed, 27 Jul 2022 19:20:21 -0700
Message-Id: <20220728022028.2190627-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.37.1
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

Fix bugs and improve the usability/effectiveness of GuC logging and
GuC related error captures.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


Alan Previn (1):
  drm/i915/guc: Add a helper for log buffer size

Chris Wilson (1):
  drm/i915/guc: Use streaming loads to speed up dumping the guc log

John Harrison (5):
  drm/i915/guc: Fix capture size warning and bump the size
  drm/i915/guc: Add GuC <-> kernel time stamp translation information
  drm/i915/guc: Record CTB info in error logs
  drm/i915/guc: Make GuC log sizes runtime configurable
  drm/i915/guc: Reduce spam from error capture

 drivers/gpu/drm/i915/gt/intel_gt_regs.h       |   2 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.c        |  72 +++--
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |   2 +
 .../gpu/drm/i915/gt/uc/intel_guc_capture.c    | 113 ++++----
 .../gpu/drm/i915/gt/uc/intel_guc_capture.h    |   1 -
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c    | 253 +++++++++++++++---
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.h    |  42 +--
 drivers/gpu/drm/i915/i915_gpu_error.c         |  67 ++++-
 drivers/gpu/drm/i915/i915_gpu_error.h         |  21 +-
 drivers/gpu/drm/i915/i915_params.c            |  12 +
 drivers/gpu/drm/i915/i915_params.h            |   3 +
 11 files changed, 427 insertions(+), 161 deletions(-)

-- 
2.37.1

