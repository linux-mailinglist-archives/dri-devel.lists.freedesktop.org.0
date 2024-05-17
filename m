Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9BB8C86B5
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 14:57:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8037610EEA5;
	Fri, 17 May 2024 12:57:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZAzRHDQp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A5EC10EE9D;
 Fri, 17 May 2024 12:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715950666; x=1747486666;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UIjknq9H/p1x3eVO1ZvOJBk6p66jGpdvdJktDTeiHKE=;
 b=ZAzRHDQp1EBV3vJe9UNpqui0M6GnndDwi4vpOmtrzSFgsiZAsMne45U4
 El+SM2Wt8hLUZJkSRIU06ErxuVwvrKJzV3xke0K4rlCXpzff1dU9T+KHV
 mknjF4R3jX7pNcQtT1TvRBpT2hJOeNUWzpyMNqjF1UG9DI253i7VukiB+
 qmx2Q0VD7hl9J7Cy/HuTb5WgrleQPM/KatjzRrQ+wM6QiGOungUgrPkGe
 2SR9lN/DIquLrsFbRtA75JRDUWBEIjVms9j0lvcR7K8am2FVV0gADJzJJ
 JR6LtxgMIsggvNbPwUsrqShXafjAXkazcAyITPjaf2jLsYCrZjM2xWSOU w==;
X-CSE-ConnectionGUID: +GLd0mZ8SsCpU2FybiOaHw==
X-CSE-MsgGUID: EG5VuUpgQtyxWymruYZADw==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="12314177"
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="12314177"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 05:57:45 -0700
X-CSE-ConnectionGUID: H0CcssJORsyPR9pV6KwNuA==
X-CSE-MsgGUID: juK8DQE0T2+0pkOk2lmxbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="31604886"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.94.252.59])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 05:57:44 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Maxime Ripard <mripard@kernel.org>, Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH 0/3] Improve drm printer code
Date: Fri, 17 May 2024 14:57:27 +0200
Message-Id: <20240517125730.2304-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We already have some drm printk functions that need to duplicate
a code to get a similar format of the final result, for example:

  [ ] 0000:00:00.0: [drm:foo] bar
  [ ] 0000:00:00.0: [drm] foo bar
  [ ] 0000:00:00.0: [drm] *ERROR* foo

Add a generic __drm_dev_vprintk() function that can format the
final message like all other existing function do and allows us
to keep the formatting code in one place.

Above also allows to improve drm_dbg_printer() that today lacks
of outputing symbolic name of the caller, like drm_dbg() does.

Cc: Maxime Ripard <mripard@kernel.org>
Cc: Jani Nikula <jani.nikula@intel.com>

Michal Wajdeczko (3):
  drm/print: Add generic drm dev printk function
  drm/print: Improve drm_dbg_printer
  drm/i915: Don't use __func__ as prefix for drm_dbg_printer

 drivers/gpu/drm/drm_print.c                | 50 ++++++++++++----------
 drivers/gpu/drm/i915/gt/intel_reset.c      |  2 +-
 drivers/gpu/drm/i915/gt/selftest_context.c |  2 +-
 include/drm/drm_print.h                    |  5 +++
 4 files changed, 34 insertions(+), 25 deletions(-)

-- 
2.43.0

