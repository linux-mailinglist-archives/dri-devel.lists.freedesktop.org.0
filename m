Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4949474900
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 18:14:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6B3D10E117;
	Tue, 14 Dec 2021 17:14:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 798CD89838;
 Tue, 14 Dec 2021 17:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639502068; x=1671038068;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nvP/wLBSGLAqxZ7lYWdwXDFpuKamvLX/GLMw74XDQi4=;
 b=eORWa9j8+UoSC5LBaaA/LUVfIc03ajdfZWteH97TUyklRGy28gub1XW6
 B/dgqUSeUPka8x21uqr/PbC3Pwq2+/SeY6psQqk5185ktl+2mhzuJeeS9
 l4NgCiMfPzi9mOsftvn05xqFMHW9RRWMVZHR/ty7SVnungajr6QWy5x/K
 sCvHE8o5VSVowCctxQqqEwd1hGkuEHnduTpDRjlRbMt0pxqweI0qTjriH
 rKvTPbvyhyQuGUdQv4W3bjyjq9SP2RYVPt8iN8z4vqMVjA1Nx+XzPt/wZ
 Ab1/L6Cy1CXZLU03kMzA9HoSfrbs/t59VGOxBkcYTpPBO9ZnrE0/Jym+A A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="219043193"
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; d="scan'208";a="219043193"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2021 09:10:27 -0800
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; d="scan'208";a="614357538"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2021 09:10:25 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/7] Fix stealing guc_ids + test
Date: Tue, 14 Dec 2021 09:04:53 -0800
Message-Id: <20211214170500.28569-1-matthew.brost@intel.com>
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
v3: Address comments in patch #7

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

