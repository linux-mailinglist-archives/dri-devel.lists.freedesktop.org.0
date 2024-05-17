Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDA48C8A21
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 18:34:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60AA910E27F;
	Fri, 17 May 2024 16:34:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g8uz70x+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6FA810E1A9;
 Fri, 17 May 2024 16:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715963672; x=1747499672;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1wIOkTCZI65kGkqJTfXweDp8zJYRu/swhkLcioIxMTY=;
 b=g8uz70x+yTyzQVkLqb1X2Vz8kyiVS1uaN/DWmVstDgGHFSTofrtnqdI2
 BuzFGnhEiElPI15XhvjcJUAWsMiNgcbrw5f3sWrGsCnj+R6DchlFw7lgk
 rWtnxb1fnxIVO5sXO6YcdeJc75RyutMdZLKsEhsQy0phWwn3MWzESPgJc
 qIP51oxRvy3M1g1uGSF/GOih+3XgXXyqCATBptF8jCi0/J/8mjVxyep7B
 DI76DFraHAB6srdak9rlWdztKgdS4Ne4XHfa/J5eO/4xh+AXT6l3IBtul
 6qeO9Ga9voJS0vUHyVPftT/9fzgohIsdliCUmVYP1127YmroJYN20Nuj6 w==;
X-CSE-ConnectionGUID: Z5hPeK02Qv6nOM7R0APAYA==
X-CSE-MsgGUID: YDQiRMynRxyJTdKJzw54nA==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="12022104"
X-IronPort-AV: E=Sophos;i="6.08,168,1712646000"; d="scan'208";a="12022104"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 09:34:21 -0700
X-CSE-ConnectionGUID: 8KOFMBIMSXeBUtVx/c+1vg==
X-CSE-MsgGUID: RD53J98BSHyBBmsZqLKlxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,168,1712646000"; d="scan'208";a="31986708"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.94.252.59])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 09:34:19 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2 0/3] Improve drm printer code
Date: Fri, 17 May 2024 18:34:03 +0200
Message-Id: <20240517163406.2348-1-michal.wajdeczko@intel.com>
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

v1: https://patchwork.freedesktop.org/series/133749/
v2: make it static, keep it simple and use braces (Jani)

Michal Wajdeczko (3):
  drm/print: Add generic drm dev printk function
  drm/print: Improve drm_dbg_printer
  drm/i915: Don't use __func__ as prefix for drm_dbg_printer

 drivers/gpu/drm/drm_print.c                | 53 ++++++++++++----------
 drivers/gpu/drm/i915/gt/intel_reset.c      |  2 +-
 drivers/gpu/drm/i915/gt/selftest_context.c |  2 +-
 include/drm/drm_print.h                    |  2 +
 4 files changed, 34 insertions(+), 25 deletions(-)

-- 
2.43.0

