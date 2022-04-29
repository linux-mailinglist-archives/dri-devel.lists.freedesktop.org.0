Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E86FF515254
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 19:33:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99F0710EF14;
	Fri, 29 Apr 2022 17:33:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 742FB10EF0B;
 Fri, 29 Apr 2022 17:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651253579; x=1682789579;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=k4aEVJ99Dg/Aj6lnsYjRlfX7AhGvuX1Wr9QU++XKpqA=;
 b=Bl8Ht6W5zgcnxYITo7xBnGHN7PikxBvyYjWdC619Q/TDt5BdtnhATQUo
 dofV+re1+Rm/W3Gsul0KbcBBdpb3ZR7Qq0zyaLISNbIxpOReNeaQY7eW0
 0lzcEMTXdeXBVMHcvWg4XhL1e4mVWQcIgV/Cq3NNYeSItZp81KtePa7bb
 QbiA+mKLDQlhaWvviC4KlhPa+hF1ZIfHM80MTZtd5PSTJpgAJh9anBRvF
 noP8CVPkk65VdPLwSpys6GB5K/y0zsx2mlCNLYUrXt72krRj/vlpoA4zV
 uSoIIP+0l/fC1sDXgv3qmrf6w0sPvBHzqXB01QDu0GBTD8Ztx1BkKkfad A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10332"; a="329657258"
X-IronPort-AV: E=Sophos;i="5.91,185,1647327600"; d="scan'208";a="329657258"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2022 10:31:10 -0700
X-IronPort-AV: E=Sophos;i="5.91,185,1647327600"; d="scan'208";a="534590258"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2022 10:31:07 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 3/4] drm/i915/selftest: Always cancel semaphore on error
Date: Fri, 29 Apr 2022 23:02:00 +0530
Message-Id: <20220429173201.20499-4-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220429173201.20499-1-ramalingam.c@intel.com>
References: <20220429173201.20499-1-ramalingam.c@intel.com>
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
 Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
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

