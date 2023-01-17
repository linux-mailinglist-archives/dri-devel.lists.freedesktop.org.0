Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1786066E883
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 22:37:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6971410E088;
	Tue, 17 Jan 2023 21:36:55 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D5CB10E088;
 Tue, 17 Jan 2023 21:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673991413; x=1705527413;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Fy3xtxMcrrfL2u8MTvWilyHdwwtLzNjO78WqInuapjw=;
 b=UTgSeiTzICEjFmzu1CSLwCK1Lr+3PdUnjNh9daIXAki7v+Ic6klBBRIq
 sjkOYOeagLB85iLY3JTTTwb5YpJ3wXpfGAmbjH5YjeGwj+VyCbIXzXfxU
 cNUKDSIXB6YZBWAEAsx8MvYHTqxiIGeFiaTiz97W6df+q26PC1taf/R/T
 dRL1KEbMCn1NV+yByPy7kcNxQrZpWPJmKTFa4GKu6eAzl+r/CH+JO3Cl7
 UhK1PzAu8ctvNdw+1494vkWJIPHDnFOnNPwYyBTHiuvPiXFPLir5UPIUd
 sn2/Ke9OsfJn+XhojuQ9wF1LIHmhM4keA3yjcsTiVMAFuxUw4LGPO5wAm g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="312696223"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="312696223"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 13:36:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="988285016"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="988285016"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmsmga005.fm.intel.com with ESMTP; 17 Jan 2023 13:36:52 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v2 0/5] Allow error capture without a request / on reset
 failure
Date: Tue, 17 Jan 2023 13:36:25 -0800
Message-Id: <20230117213630.2897570-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.0
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

It is technically possible to get a hung context without a valid
request. In such a situation, try to provide as much information in
the error capture as possible rather than just aborting and capturing
nothing.

Similarly, in the case of an engine reset failure the GuC is not able
to report the guilty context. So try a manual search instead of
reporting nothing.

v2: Tidy up code flow in error capture. Reword some comments/messages.
(review feedback from Tvrtko)
Also fix up request locking issues from earlier changes noticed during
code review of this change.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (5):
  drm/i915: Fix request locking during error capture & debugfs dump
  drm/i915: Allow error capture without a request
  drm/i915: Allow error capture of a pending request
  drm/i915/guc: Look for a guilty context when an engine reset fails
  drm/i915/guc: Add a debug print on GuC triggered reset

 drivers/gpu/drm/i915/gt/intel_context.c       |  1 +
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  7 +-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 32 ++++++++-
 drivers/gpu/drm/i915/i915_gpu_error.c         | 71 ++++++++++++-------
 4 files changed, 82 insertions(+), 29 deletions(-)

-- 
2.39.0

