Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BFB62BBBC
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 12:26:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE5CE10E486;
	Wed, 16 Nov 2022 11:26:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2936E10E487;
 Wed, 16 Nov 2022 11:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668597967; x=1700133967;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=caBLKR0K5Hn/2pyKFe7g3RceXmf+MKUWWxkOKzJWFss=;
 b=XgUUfSCjJ25XdFFcrolhlwPvSRhDQEEZq73duptcPxBVba1M0TdXFu6f
 DLztgWBKXK6BZSbthFs7qyXqKlbkYPpn39qNnht9psoR6UKvXu9Qg/u34
 CxefLFbvTVf9UxFXAMBHfor1TYLQEKUnedutV5vjauzlesML8JoPXU0eA
 5MPaseU/NVc4Cs5twmqT7n2dtnZZjtfs6er6yMfkyLp4Pg1/qOakgzi6X
 5Ec589CDS+RJ2dm0Mxzl2vlcXDb5dc/WT5uSKbqM/lqJyeeYBEGxTUoJR
 UUBtfx1bDKlXTg0cnvkQKHaYZnEsAzzrOcyU7J/9Y1arrHN/ftwl8vWOB w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="295885172"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; d="scan'208";a="295885172"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2022 03:26:06 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="670468973"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; d="scan'208";a="670468973"
Received: from jkrzyszt-mobl1.ger.corp.intel.com ([10.213.12.208])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2022 03:26:03 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PATCH 3/3] drm/i915: Never return 0 if request wait succeeds
Date: Wed, 16 Nov 2022 12:25:32 +0100
Message-Id: <20221116112532.36253-4-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221116112532.36253-1-janusz.krzysztofik@linux.intel.com>
References: <20221116112532.36253-1-janusz.krzysztofik@linux.intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org,
 Chris Wilson <chris.p.wilson@intel.com>, dri-devel@lists.freedesktop.org,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

According to the docs of i915_request_wait_timeout(), its return value
"may be zero if the request is unfinished after the timeout expires."
However, 0 is also returned when the request is found finished right
after the timeout has expired.

Since the docs also state: "If the timeout is 0, it will return 1 if the
fence is signaled.", return 1 also when the fence is found signaled after
non-zero timeout has expired.

Fixes: 7e2e69ed4678 ("drm/i915: Fix i915_request fence wait semantics")
Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: stable@vger.kernel.org # v5.17
---
 drivers/gpu/drm/i915/i915_request.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index f949a9495758a..406ddfafbed4d 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -2079,6 +2079,8 @@ long i915_request_wait_timeout(struct i915_request *rq,
 
 		timeout = io_schedule_timeout(timeout);
 	}
+	if (!timeout)	/* expired but signaled, we shouldn't return 0 */
+		timeout = 1;
 	__set_current_state(TASK_RUNNING);
 
 	if (READ_ONCE(wait.tsk))
-- 
2.25.1

