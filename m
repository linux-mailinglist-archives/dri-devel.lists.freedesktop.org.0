Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 093A2516E91
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 13:09:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4E0D10E3D2;
	Mon,  2 May 2022 11:09:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5577A10E2D1;
 Mon,  2 May 2022 11:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651489762; x=1683025762;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MK11EVElSwT5p1WgoT0P7ax3fERS5Bdsto7Rnmj5QXM=;
 b=HpLej2x4f1TNEKKldD1PCBJGz1/Q8FlGR6+gA5hdXB0mi65PwTNj/+mg
 BmVlrIHe3zpJT2s1HZHehEDUmrOzhoS6oOsrD7H3suJs9AEMYYggMl9yV
 8JCewTRplEsI8JH8B27oJ6e3Ym1yYEv/H7AL0LPZ05IT2ITk+0d9Xh0DC
 T0dr3Uktu0+t98EDKcVc5NCjHz+NABpPSwF8Sc4nZ3NMt/b1BxjVlzjnu
 GUY38qkp86uUldJSiPQXqdHxBFn3GjJCD/4mG4jqGKr8VvPLZh5ZyMhZc
 w8rfAOrsO31tHVmspLW6k0JZhXYQnOBVMHCZHJeMAmxyMtlZmZPIXZDks Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10334"; a="254632174"
X-IronPort-AV: E=Sophos;i="5.91,190,1647327600"; d="scan'208";a="254632174"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2022 04:09:09 -0700
X-IronPort-AV: E=Sophos;i="5.91,190,1647327600"; d="scan'208";a="535800130"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2022 04:09:07 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v4 3/4] drm/i915/selftest: Always cancel semaphore on error
Date: Mon,  2 May 2022 16:40:02 +0530
Message-Id: <20220502111003.32397-4-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220502111003.32397-1-ramalingam.c@intel.com>
References: <20220502111003.32397-1-ramalingam.c@intel.com>
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
Cc: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>, CQ Tang <cq.tang@intel.com>,
 Hellstrom Thomas <thomas.hellstrom@intel.com>
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
index 3271f01fe7db..e4d5d74489bf 100644
--- a/drivers/gpu/drm/i915/gt/selftest_lrc.c
+++ b/drivers/gpu/drm/i915/gt/selftest_lrc.c
@@ -1460,18 +1460,17 @@ static int __lrc_isolation(struct intel_engine_cs *engine, u32 poison)
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

