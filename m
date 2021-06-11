Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1579F3A3816
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 01:48:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5E866EE18;
	Thu, 10 Jun 2021 23:48:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 150B36EE18;
 Thu, 10 Jun 2021 23:48:17 +0000 (UTC)
IronPort-SDR: FZ7qfAb4yctFBYok2FWez/OjfxDWfv6uCWZDQH8R7ccnq9jpsOez/jDNAG8FVMUCPUUgRgbHuU
 vOcyq4Q88R5g==
X-IronPort-AV: E=McAfee;i="6200,9189,10011"; a="205246683"
X-IronPort-AV: E=Sophos;i="5.83,264,1616482800"; d="scan'208";a="205246683"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2021 16:48:14 -0700
IronPort-SDR: ld5TrV8Xc6jiOPxrp3MMFBh/hi3JxaR0say60UE3LBc0mWz72Wrgfq9Dsb9WmtgNA7DniOSIjO
 lDlsyxbc4TyA==
X-IronPort-AV: E=Sophos;i="5.83,264,1616482800"; d="scan'208";a="483054959"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2021 16:48:05 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/1] drm/i915/guc: Relax CTB response timeout
Date: Thu, 10 Jun 2021 17:05:55 -0700
Message-Id: <20210611000555.133859-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210611000555.133859-1-matthew.brost@intel.com>
References: <20210611000555.133859-1-matthew.brost@intel.com>
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
Cc: daniele.ceraolospurio@intel.com, john.c.harrison@intel.com,
 Michal.Wajdeczko@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In upcoming patch we will allow more CTB requests to be sent in
parallel to the GuC for processing, so we shouldn't assume any more
that GuC will always reply without 10ms.

Use bigger value hardcoded value of 1s instead.

v2: Add CONFIG_DRM_I915_GUC_CTB_TIMEOUT config option
v3:
 (Daniel Vetter)
  - Use hardcoded value of 1s rather than config option

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index 8f7b148fef58..bc626ca0a9eb 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -475,12 +475,14 @@ static int wait_for_ct_request_update(struct ct_request *req, u32 *status)
 	/*
 	 * Fast commands should complete in less than 10us, so sample quickly
 	 * up to that length of time, then switch to a slower sleep-wait loop.
-	 * No GuC command should ever take longer than 10ms.
+	 * No GuC command should ever take longer than 10ms but many GuC
+	 * commands can be inflight at time, so use a 1s timeout on the slower
+	 * sleep-wait loop.
 	 */
 #define done INTEL_GUC_MSG_IS_RESPONSE(READ_ONCE(req->status))
 	err = wait_for_us(done, 10);
 	if (err)
-		err = wait_for(done, 10);
+		err = wait_for(done, 1000);
 #undef done
 
 	if (unlikely(err))
-- 
2.28.0

