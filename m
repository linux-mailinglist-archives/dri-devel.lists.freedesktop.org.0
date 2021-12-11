Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BAB4714FD
	for <lists+dri-devel@lfdr.de>; Sat, 11 Dec 2021 18:41:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCFCD10E2E4;
	Sat, 11 Dec 2021 17:41:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E773A10E2E4;
 Sat, 11 Dec 2021 17:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639244474; x=1670780474;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DGT5qCnkrYczQ4QmWQrFegXKWKfOJfDpMn5RuRBi61s=;
 b=WVxs9oStxTCWwvUWLHR2KoNzZAYvEWL5IVFd4hAc5KOYHf6oiAhJgbR8
 MbftFti1VtrPQRe6b7nxKUmIzWlDucqegWh3Bz3eyf//YAEWGtSzZIp5w
 CUrq2NMsdM6npexlLG/3cSnevrD1Q+2V7JSLdi7ZM6jjhjg6oOYc3Oyfg
 11b9/mH57bZWYwfR6L96IiA1gZmf0m2YdPGDw1Wm33z5vSswjhbCiDhIc
 hCg67Zin0RrhoxzhBqmzntTFCSe9O0jz14MBwNs5M2cc2BY8x/Yk671Jw
 Jy8omLhzedFdFkVF5U5IGPpTiX474DV+dgNSYeVb1WYBpfYhUPyE8W/HG Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10195"; a="238493208"
X-IronPort-AV: E=Sophos;i="5.88,198,1635231600"; d="scan'208";a="238493208"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2021 09:41:13 -0800
X-IronPort-AV: E=Sophos;i="5.88,198,1635231600"; d="scan'208";a="602548099"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2021 09:41:13 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/7] Fix stealing guc_ids + test
Date: Sat, 11 Dec 2021 09:35:38 -0800
Message-Id: <20211211173545.23536-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.33.1
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
Cc: daniele.ceraolospurio@intel.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Patches 1 & 2 address bugs in stealing of guc_ids and patch 7 tests this
path.

Patches 4-6 address some issues with the CTs exposed by the selftest in
patch 7. Basically if a lot of contexts were all deregistered all at
once, the CT channel could deadlock.

Patch 3 is a small fix that is already review but just included for CI.

v2: Address comments, resend for CI

Signed-off-by: Matthew Brost <matthew.brost@intel.com>

John Harrison (1):
  drm/i915/guc: Don't hog IRQs when destroying contexts

Matthew Brost (6):
  drm/i915/guc: Use correct context lock when callig
    clr_context_registered
  drm/i915/guc: Only assign guc_id.id when stealing guc_id
  drm/i915/guc: Remove racey GEM_BUG_ON
  drm/i915/guc: Add extra debug on CT deadlock
  drm/i915/guc: Kick G2H tasklet if no credits
  drm/i915/guc: Selftest for stealing of guc ids

 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  12 ++
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     |  18 +-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  69 ++++---
 drivers/gpu/drm/i915/gt/uc/selftest_guc.c     | 173 ++++++++++++++++++
 4 files changed, 244 insertions(+), 28 deletions(-)

-- 
2.33.1

