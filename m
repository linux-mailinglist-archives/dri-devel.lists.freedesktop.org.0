Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 663E7496885
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jan 2022 01:14:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB0C610E73E;
	Sat, 22 Jan 2022 00:14:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C84ED10E73E;
 Sat, 22 Jan 2022 00:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642810452; x=1674346452;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Kp9dfhm2LPb2IwO6IDaylKBUidLVc98g1xu94P41MYo=;
 b=ZNtiTO6H1HzOh7utngdq1hkEBlhKNy7gldkP8yLNMxYFtxRbi+UC+3+x
 +1ydd61K2e1OcESKnZI0c/OVeglP8fiTxyy+SHSwRIFqBSv8vOn5E8HBj
 76glxr36VBkwydMwFEGyOJqUPJL+l2Ufm7IGusRWRw0Cc5BRSOIlHKCgj
 UnWvDSzCGzcEb5iXigLAICAG5mFA24AnrgDPP1KIPI4mKDdequmywbmEp
 s+5gwxlIcTAsJpOVYkMbYttZa9AizAlm297HFKG8QdUL0NvI+nd2HkUnr
 IQLKwuUEdvFdyFoDyIglFxWqQkxtQHYVNEATkGDIZqMOyt4h5m6c7V9jF Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10234"; a="245715118"
X-IronPort-AV: E=Sophos;i="5.88,306,1635231600"; d="scan'208";a="245715118"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2022 16:14:11 -0800
X-IronPort-AV: E=Sophos;i="5.88,306,1635231600"; d="scan'208";a="476122557"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2022 16:14:11 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/i915/selftests: Use less in contexts steal guc id test
Date: Fri, 21 Jan 2022 16:08:22 -0800
Message-Id: <20220122000822.25616-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Using more guc_ids in the stealing guc id test has no real benefit.
Tearing down lots of contexts all at the same time takes a bit of time
due to the H2G / G2H ping-pong with the GuC. On some slower platforms
this can cause timeous when flushing the test as the GT isn't idle when
this ping-pong is happening. Reduce the number of guc ids to speed up
the flushing of the test.

Link: https://gitlab.freedesktop.org/drm/intel/-/issues/4821
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/selftest_guc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/selftest_guc.c b/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
index d3327b802b761..a115894d5896e 100644
--- a/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
+++ b/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
@@ -157,7 +157,7 @@ static int intel_guc_steal_guc_ids(void *arg)
 	wakeref = intel_runtime_pm_get(gt->uncore->rpm);
 	engine = intel_selftest_find_any_engine(gt);
 	sv = guc->submission_state.num_guc_ids;
-	guc->submission_state.num_guc_ids = 4096;
+	guc->submission_state.num_guc_ids = 512;
 
 	/* Create spinner to block requests in below loop */
 	ce[context_index] = intel_context_create(engine);
-- 
2.34.1

