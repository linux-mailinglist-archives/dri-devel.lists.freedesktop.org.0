Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13AF16731ED
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 07:50:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C73F110E8B1;
	Thu, 19 Jan 2023 06:50:34 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A71310E8B1;
 Thu, 19 Jan 2023 06:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674111033; x=1705647033;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ov8y484JIIkk/zE3pkQvSrmWUXT/SHd+zOXd9wu9OYE=;
 b=PM/KCgBf87do+6awN7ho0P8G/MQ11OZXwTVvvrC2vw49aEtQlOJB/1eR
 iUlub0koStG9hWlDEg55uFIpfoCZxb+7pTCMw8SkqSQ0s6kxgsvHCTUPN
 qBL5UUHmktmIzRRazJcOgP96ACSnvQw2PYJx6hd1X2XL71D8T94JRRXKA
 tK1vXxqB7GUMP4NRej+3adQ/X3Mt4T19MSBv+82hnV6zTUQykZJ1Uh/pV
 2VGMKBcJV+reXoLlLA4D29rKT1bIa0IzBXgM3QvqmDzinTXGeOlg5MLIe
 FqpEcwBnO1bYmzmBIjXrRMdjOrQFxwy1qmrcTdWOsT/YGsBUe5pyJ6wQM g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="323897859"
X-IronPort-AV: E=Sophos;i="5.97,228,1669104000"; d="scan'208";a="323897859"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 22:50:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="723385731"
X-IronPort-AV: E=Sophos;i="5.97,228,1669104000"; d="scan'208";a="723385731"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmsmga008.fm.intel.com with ESMTP; 18 Jan 2023 22:50:20 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v3 0/6] Allow error capture without a request & fix locking
 issues
Date: Wed, 18 Jan 2023 22:49:54 -0800
Message-Id: <20230119065000.1661857-1-John.C.Harrison@Intel.com>
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

While doing all this, it was noticed that the locking was broken in a
number of places when searching for hung requests and dumping request
info. So fix all that up as well.

v2: Tidy up code flow in error capture. Reword some comments/messages.
(review feedback from Tvrtko)
Also fix up request locking issues from earlier changes noticed during
code review of this change.
v3: Fix some potential null pointer derefs and a reference leak.
Add new patch to refactor the duplicated hung request search code into
a common backend agnostic wrapper function and use the correct
spinlocks for the correct lists. Also tweak some of the patch
descriptions for better accuracy.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (6):
  drm/i915: Fix request locking during error capture & debugfs dump
  drm/i915: Fix up locking around dumping requests lists
  drm/i915: Allow error capture without a request
  drm/i915: Allow error capture of a pending request
  drm/i915/guc: Look for a guilty context when an engine reset fails
  drm/i915/guc: Add a debug print on GuC triggered reset

 drivers/gpu/drm/i915/gt/intel_context.c       | 31 +++++++
 drivers/gpu/drm/i915/gt/intel_context.h       |  3 +
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     | 49 ++++++-----
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 34 ++++++-
 drivers/gpu/drm/i915/i915_gpu_error.c         | 88 ++++++++++---------
 5 files changed, 138 insertions(+), 67 deletions(-)

-- 
2.39.0

