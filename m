Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0697D4C4FD5
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 21:42:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D902010E94C;
	Fri, 25 Feb 2022 20:41:59 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A47E10E93A;
 Fri, 25 Feb 2022 20:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645821712; x=1677357712;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FvYDSOt614xqG6HgMpZNGd2CpSxhP8DmClDEPFhTTxo=;
 b=gXZ/ye+YHzuFppS1xMbckny7WRWXNFDblSWNplojUrGXClDYgel8WxxK
 NCCTNOQlw9a4tTltCzRxk7eqd6ST9oT59Ms5FoPF806Cc2vjWal+UJLNX
 /wU1bxsxMDeowQZ/hWmGLrHq4ucQgNNMl1rhT88vStanzbJ5sBbJ/Q6xf
 qSIqChdjJ5R4TcckAaH9BiXQoOD6Z8y7Onr8jPBOZGS3IDHtdeb6TPypA
 frWMKouRPsHbS+xcTn+H9MpniPxenfA+YbwV27soQG117wwyv6QA2c2Xf
 HvbeGEXO19b9hlHh2b+nNPG/8Zyu843SQFE1Pg0Nl/r2RS1z+SkSXOCX3 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10269"; a="315791547"
X-IronPort-AV: E=Sophos;i="5.90,137,1643702400"; d="scan'208";a="315791547"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 12:41:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,137,1643702400"; d="scan'208";a="549414300"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by orsmga008.jf.intel.com with ESMTP; 25 Feb 2022 12:41:51 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v2 2/3] drm/i915/gt: Make the heartbeat play nice with long
 pre-emption timeouts
Date: Fri, 25 Feb 2022 12:41:50 -0800
Message-Id: <20220225204151.2248027-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220225204151.2248027-1-John.C.Harrison@Intel.com>
References: <20220225204151.2248027-1-John.C.Harrison@Intel.com>
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

Compute workloads are inherently not pre-emptible for long periods on
current hardware. As a workaround for this, the pre-emption timeout
for compute capable engines was disabled. This is undesirable with GuC
submission as it prevents per engine reset of hung contexts. Hence the
next patch will re-enable the timeout but bumped up by an order of
magnitude.

However, the heartbeat might not respect that. Depending upon current
activity, a pre-emption to the heartbeat pulse might not even be
attempted until the last heartbeat period. Which means that only one
period is granted for the pre-emption to occur. With the aforesaid
bump, the pre-emption timeout could be significantly larger than this
heartbeat period.

So adjust the heartbeat code to take the pre-emption timeout into
account. When it reaches the final (high priority) period, it now
ensures the delay before hitting reset is bigger than the pre-emption
timeout.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
index a3698f611f45..72a82a6085e0 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
@@ -22,9 +22,25 @@
 
 static bool next_heartbeat(struct intel_engine_cs *engine)
 {
+	struct i915_request *rq;
 	long delay;
 
 	delay = READ_ONCE(engine->props.heartbeat_interval_ms);
+
+	rq = engine->heartbeat.systole;
+	if (rq && rq->sched.attr.priority >= I915_PRIORITY_BARRIER) {
+		long longer;
+
+		/*
+		 * The final try is at the highest priority possible. Up until now
+		 * a pre-emption might not even have been attempted. So make sure
+		 * this last attempt allows enough time for a pre-emption to occur.
+		 */
+		longer = READ_ONCE(engine->props.preempt_timeout_ms) * 2;
+		if (longer > delay)
+			delay = longer;
+	}
+
 	if (!delay)
 		return false;
 
-- 
2.25.1

