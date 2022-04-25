Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DC250DF88
	for <lists+dri-devel@lfdr.de>; Mon, 25 Apr 2022 13:57:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E40010E586;
	Mon, 25 Apr 2022 11:57:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 778C710E5A5;
 Mon, 25 Apr 2022 11:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650887859; x=1682423859;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=k4aEVJ99Dg/Aj6lnsYjRlfX7AhGvuX1Wr9QU++XKpqA=;
 b=Xacswk2PfK8i0xsZ65QBW7yEf9eEAH/vJOmlxmnrTUHdYfBfOkl522mW
 0kOPruWA0nMngg+ISoyz++IyXK2bLKx7SsL1lMiujEtSivVxWCPTdoS3O
 Q5eRMBMPgvCpRrS0ZT9czA/v2dvQGQVTWgY7yhH0Trwpf2KCQqUZB/B7d
 YRpMKkz6NE7gNMSeRlBzpuIDloJ4En13eDsinQNqQGnBp3MGOeeiB9Mt4
 arOb5GfakS5tby1ir3xFf2zc/x46Aj6EbdZWBdOoeohgkDr5iC1xduYuP
 Jg97aEuQ7LPXH3XC09iiiweWGOWt5PGOywWPklUFXG2QHmEEFQV65GX+R w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10327"; a="290363132"
X-IronPort-AV: E=Sophos;i="5.90,288,1643702400"; d="scan'208";a="290363132"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 04:57:39 -0700
X-IronPort-AV: E=Sophos;i="5.90,288,1643702400"; d="scan'208";a="557695909"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 04:57:36 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 3/4] drm/i915/selftest: Always cancel semaphore on error
Date: Mon, 25 Apr 2022 17:28:27 +0530
Message-Id: <20220425115828.21473-4-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220425115828.21473-1-ramalingam.c@intel.com>
References: <20220425115828.21473-1-ramalingam.c@intel.com>
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
Cc: CQ Tang <cq.tang@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Wilson <chris@chris-wilson.co.uk>

Ensure that we always signal the semaphore when timing out, so that if it
happens to be stuck waiting for the semaphore we will quickly recover
without having to wait for a reset.

Reported-by: CQ Tang <cq.tang@intel.com>
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: CQ Tang <cq.tang@intel.com>
cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
Reviewed-by: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/selftest_lrc.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/selftest_lrc.c b/drivers/gpu/drm/i915/gt/selftest_lrc.c
index 684a63de156a..51e4b7092d4f 100644
--- a/drivers/gpu/drm/i915/gt/selftest_lrc.c
+++ b/drivers/gpu/drm/i915/gt/selftest_lrc.c
@@ -1411,18 +1411,17 @@ static int __lrc_isolation(struct intel_engine_cs *engine, u32 poison)
 	}
 
 	err = poison_registers(B, poison, sema);
-	if (err) {
-		WRITE_ONCE(*sema, -1);
-		i915_request_put(rq);
-		goto err_result1;
-	}
-
-	if (i915_request_wait(rq, 0, HZ / 2) < 0) {
-		i915_request_put(rq);
+	if (err == 0 && i915_request_wait(rq, 0, HZ / 2) < 0) {
+		pr_err("%s(%s): wait for results timed out\n",
+		       __func__, engine->name);
 		err = -ETIME;
-		goto err_result1;
 	}
+
+	/* Always cancel the semaphore wait, just in case the GPU gets stuck */
+	WRITE_ONCE(*sema, -1);
 	i915_request_put(rq);
+	if (err)
+		goto err_result1;
 
 	err = compare_isolation(engine, ref, result, A, poison);
 
-- 
2.20.1

