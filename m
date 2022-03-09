Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5094D2830
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 06:17:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 455A710E94D;
	Wed,  9 Mar 2022 05:17:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B823C10E936;
 Wed,  9 Mar 2022 05:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646803020; x=1678339020;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2mP6RRebQUE3vKxzk2Ezz1JjDoe9ZfqAwpTaqOWKV6w=;
 b=dgUqgIc6u8jmFA9/26c8BLg1RfKR0+Jex+PvoJLbXBx+aLxii3jDQjKa
 tA4rO3Y5x9OZRKrnQPyPP0bC6rQi4Eqjvu2yyLZsnEDEQ2t+pdtupQ005
 zMij+Okit4o8nkRQixfCTfQq01l1nS5+fg4s/9Z5SBmDw2dVFoBVYH5yg
 u++qEc9Uo94Q6Tq9K+bIYWsdz8YiofkJ0PvNZ78oq5xvKrqVW3zdMplWz
 NoZtsXBxn/D8In2IW4QY9Lg5n7macj4yDCsBYcBUOdvh4h5jwoXaAusLM
 VP/gH1BYwLZqbaM0cgT83e7if3EdZC+ZC9rHzpBEpIfOFLX2s1TIoHXfX Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="255081144"
X-IronPort-AV: E=Sophos;i="5.90,166,1643702400"; d="scan'208";a="255081144"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 21:17:00 -0800
X-IronPort-AV: E=Sophos;i="5.90,166,1643702400"; d="scan'208";a="711807557"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 21:16:57 -0800
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH 7/8] drm/i915/selftest: Always cancel semaphore on error
Date: Wed,  9 Mar 2022 10:47:07 +0530
Message-Id: <20220309051708.22644-8-ramalingam.c@intel.com>
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
Cc: lucas.demarchi@intel.com, Chris Wilson <chris@chris-wilson.co.uk>,
 CQ Tang <cq.tang@intel.com>, daniele.ceraolospurio@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Wilson <chris@chris-wilson.co.uk>

Ensure that we always signal the semaphore when timing out, so that if it
happens to be stuck waiting for the semaphore we will quickly recover
without having to wait for a reset.

Reported-by: CQ Tang <cq.tang@intel.com>
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
---
 drivers/gpu/drm/i915/gt/selftest_lrc.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/selftest_lrc.c b/drivers/gpu/drm/i915/gt/selftest_lrc.c
index d8face764ee4..63fd508fea49 100644
--- a/drivers/gpu/drm/i915/gt/selftest_lrc.c
+++ b/drivers/gpu/drm/i915/gt/selftest_lrc.c
@@ -1530,20 +1530,17 @@ __lrc_isolation(struct intel_engine_cs *engine, u32 poison, bool relative)
 		usleep_range(100, 500);
 
 	err = poison_registers(B, engine, poison, relative, &sema);
-	if (err) {
-		WRITE_ONCE(*sema.va, -1);
-		i915_request_put(rq);
-		goto err_result1;
-	}
-
-	if (i915_request_wait(rq, 0, HZ / 2) < 0) {
+	if (err == 0 && i915_request_wait(rq, 0, HZ / 2) < 0) {
 		pr_err("%s(%s): wait for results timed out\n",
 		       __func__, engine->name);
-		i915_request_put(rq);
 		err = -ETIME;
-		goto err_result1;
 	}
+
+	/* Always cancel the semaphore wait, just in case the GPU gets stuck */
+	WRITE_ONCE(*sema.va, -1);
 	i915_request_put(rq);
+	if (err)
+		goto err_result1;
 
 	err = compare_isolation(engine, ref, result, A, poison, relative);
 
-- 
2.20.1

