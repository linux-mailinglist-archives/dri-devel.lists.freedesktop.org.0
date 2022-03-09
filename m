Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 111034D282A
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 06:17:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E0B110E92F;
	Wed,  9 Mar 2022 05:17:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66AF710E913;
 Wed,  9 Mar 2022 05:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646803018; x=1678339018;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GUSpKYUUIMtRiNhdGXOEVXDcz/6y7BP7quUj5AfJn4g=;
 b=hIYEi8l+TK32ZFfD8Ft9pVO6xFi+CyTTTM9WKL8Gf3iTg6VYXbOhpKXB
 N2B849i+kFzR3im8Svcr/zu39MpaOmuCflxZxWgWixQuKz4IQuMgrZifG
 3LooFZ9ikxcl0MCQELzF5/n9khGodqBEMwd33fFTVU2QWnp8vkCcqfLXD
 ndX8gN+aAiU7kdFwTgmQiXq74WYKtSBQaX+V1xwcZTEJGHhh8iI0qHveo
 E9T6g6qb3EJ2N1oBm3ZGjRN4AgFK6qBpbjP3LWNx2sqVmPw+5zyI06XJT
 LM/4m4qiyco2nLbBVblCFofTiy/C72ffbmTq1CkJs4t9dq9SjudIAzrEj A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="255081138"
X-IronPort-AV: E=Sophos;i="5.90,166,1643702400"; d="scan'208";a="255081138"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 21:16:57 -0800
X-IronPort-AV: E=Sophos;i="5.90,166,1643702400"; d="scan'208";a="711807532"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 21:16:47 -0800
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH 3/8] drm/i915/selftests: Flush the submission for lrc_isolation
Date: Wed,  9 Mar 2022 10:47:03 +0530
Message-Id: <20220309051708.22644-4-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220309051708.22644-1-ramalingam.c@intel.com>
References: <20220309051708.22644-1-ramalingam.c@intel.com>
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
Cc: daniele.ceraolospurio@intel.com, lucas.demarchi@intel.com,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Wilson <chris@chris-wilson.co.uk>

The lrc_isolation test uses two contexts in order to read from one
context while poisoning from a second. The test verifies that the
writes of the second context do not leak into the first context. This is
done by first recording the register state from context A, forcing a
preemption to context B, and only then switching back to context A to
re-read the register state to see if anything changed. The sequence is
important (and internally controlled by semaphores), but it does require
that context A is submitted *before* context B, as context B has higher
priority to force the preemption.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
---
 drivers/gpu/drm/i915/gt/selftest_lrc.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/selftest_lrc.c b/drivers/gpu/drm/i915/gt/selftest_lrc.c
index 998e561694be..b064e824053f 100644
--- a/drivers/gpu/drm/i915/gt/selftest_lrc.c
+++ b/drivers/gpu/drm/i915/gt/selftest_lrc.c
@@ -1416,8 +1416,10 @@ __lrc_isolation(struct intel_engine_cs *engine, u32 poison, bool relative)
 	}
 
 	if (i915_request_wait(rq, 0, HZ / 2) < 0) {
+		pr_err("%s(%s): wait for reference results timed out\n",
+		       __func__, engine->name);
 		i915_request_put(rq);
-		err = -ETIME;
+		err = -EIO;
 		goto err_ref1;
 	}
 	i915_request_put(rq);
@@ -1440,6 +1442,17 @@ __lrc_isolation(struct intel_engine_cs *engine, u32 poison, bool relative)
 		goto err_result1;
 	}
 
+	/* Wait until we record the register state before allowing preemption */
+	if (wait_for_submit(engine, rq, HZ / 5)) {
+		pr_err("%s(%s): wait for submission timed out\n",
+		       __func__, engine->name);
+		i915_request_put(rq);
+		err = -EIO;
+		goto err_result1;
+	}
+	while (READ_ONCE(*sema.va) && !signal_pending(current))
+		usleep_range(100, 500);
+
 	err = poison_registers(B, engine, poison, relative, &sema);
 	if (err) {
 		WRITE_ONCE(*sema.va, -1);
@@ -1448,6 +1461,8 @@ __lrc_isolation(struct intel_engine_cs *engine, u32 poison, bool relative)
 	}
 
 	if (i915_request_wait(rq, 0, HZ / 2) < 0) {
+		pr_err("%s(%s): wait for results timed out\n",
+		       __func__, engine->name);
 		i915_request_put(rq);
 		err = -ETIME;
 		goto err_result1;
-- 
2.20.1

