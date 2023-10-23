Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAFB7D3626
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 14:13:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C858B10E1B9;
	Mon, 23 Oct 2023 12:13:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8710310E1B5;
 Mon, 23 Oct 2023 12:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698063195; x=1729599195;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yOwcElqlK6VygFlKmmOUYYYj/YezK4k8gr3Pt+hbxRI=;
 b=PV2HDb1r7zX1FNIByHvVJ9Oyr1hqxdgDNXB0JRKEY1F4RcLU4wmKRTWq
 Tc/5wi0EdZGMPEcMejrd2kvcmqWsnq+W35Fau8K6nDHy3iSEnFbU6YCPy
 t4q9e9fwLWZq+U9+fpopUd64hpsvavCeiuYqAEAUo1FBBSoS5w3OnwZvD
 +R3aA2f0YgKUn5iefKK/F4pj6MuOkvCCDWGJf1IdFJgseYoR5E1GO/LmB
 V5KSEFwrKgNysJ3CfqMaUO0rSwJEe7FEWmy4PC6FI48yhF/B6eCNEwvFM
 w1VdYBW4iZV41jmvOvQTWUA72R81hIAF9148jlj5zsa/sI8OVvoSBujHo w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="377199037"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; d="scan'208";a="377199037"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2023 05:13:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="751612498"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; d="scan'208";a="751612498"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2023 05:13:13 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/gt: Use proper priority enum instead of 0
Date: Mon, 23 Oct 2023 14:13:05 +0200
Message-ID: <20231023121305.12560-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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
Cc: John Harrison <John.C.Harrison@Intel.com>, dri-devel@lists.freedesktop.org,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I915_PRIORITY_NORMAL is 0 so use that instead for better
readability.

Cc: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
index 9a527e1f5be6..1a8e2b7db013 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
@@ -188,7 +188,7 @@ static void heartbeat(struct work_struct *wrk)
 			 * low latency and no jitter] the chance to naturally
 			 * complete before being preempted.
 			 */
-			attr.priority = 0;
+			attr.priority = I915_PRIORITY_NORMAL;
 			if (rq->sched.attr.priority >= attr.priority)
 				attr.priority = I915_PRIORITY_HEARTBEAT;
 			if (rq->sched.attr.priority >= attr.priority)
-- 
2.41.0

