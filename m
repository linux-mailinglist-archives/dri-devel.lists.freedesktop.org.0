Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB6D4D8B9B
	for <lists+dri-devel@lfdr.de>; Mon, 14 Mar 2022 19:19:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCEBE10E320;
	Mon, 14 Mar 2022 18:19:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39FD010E320;
 Mon, 14 Mar 2022 18:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647281986; x=1678817986;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=II4o7QMvEfvzaCVVw9UZrmmR02JrkhOsUxZ0K19If9Y=;
 b=WisIkhZ7pscLP+sHs+S9BZD4Umg+n93E2UqEokjRXtqpoznSRd8UxM2s
 b43nQWXKayRtyv7oC06D8OAGLE79qUKDaIzlzmu2c3ZRrbbLrZwyyKlcU
 6nyvMbXGG1WIF6qheqpQBYleeWO6/jsLAFlJn4mfBvaFrR0sez6bV1e9U
 VC2f6DhM72U4zktEjgCcqflloYIFNUWpLVz4ZPyZizPATYNuR5rkeAQAh
 tJjTXj4pqpEfntY4Zpz6Qy+rF7YykfjruAYNeTJ9mT3o8R3dkpMkvpmj+
 5xKvWVWzS4qDPbJOMhvzZycxYXao7c1KZxpIVL09UfOEy7/+KthIXsXmb g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="238279153"
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400"; d="scan'208";a="238279153"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2022 11:19:46 -0700
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400"; d="scan'208";a="515549365"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2022 11:19:43 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH 4/4] drm/i915/selftest: Always cancel semaphore on error
Date: Mon, 14 Mar 2022 23:50:05 +0530
Message-Id: <20220314182005.17071-5-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220314182005.17071-1-ramalingam.c@intel.com>
References: <20220314182005.17071-1-ramalingam.c@intel.com>
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
Cc: CQ Tang <cq.tang@intel.com>, Hellstrom Thomas <thomas.hellstrom@intel.com>,
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
---
 drivers/gpu/drm/i915/gt/selftest_lrc.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/selftest_lrc.c b/drivers/gpu/drm/i915/gt/selftest_lrc.c
index b9cc89de01bf..ae16668dd9d4 100644
--- a/drivers/gpu/drm/i915/gt/selftest_lrc.c
+++ b/drivers/gpu/drm/i915/gt/selftest_lrc.c
@@ -1435,18 +1435,17 @@ static int __lrc_isolation(struct intel_engine_cs *engine, u32 poison)
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

