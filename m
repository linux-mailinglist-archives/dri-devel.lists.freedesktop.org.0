Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6C533D930
	for <lists+dri-devel@lfdr.de>; Tue, 16 Mar 2021 17:23:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B08DE6E41A;
	Tue, 16 Mar 2021 16:23:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 990786E422;
 Tue, 16 Mar 2021 16:23:43 +0000 (UTC)
IronPort-SDR: fz14Shv/Y29QpbS+ldR95v9P3ruEVQtalXmPOAZ0nqJYmKUVtt2SdJESZah8iJjymmocEalYu7
 7JNIxf6hi9Kw==
X-IronPort-AV: E=McAfee;i="6000,8403,9925"; a="209231242"
X-IronPort-AV: E=Sophos;i="5.81,251,1610438400"; d="scan'208";a="209231242"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2021 09:23:43 -0700
IronPort-SDR: IrBjQVy3ppCoaNH0y+dGmNXvWnctFiVGArCLI54NnwATQA8wm4UHFrZI+ZQuTKMSDaLeuY/wAx
 KN3SkO6Mv1PA==
X-IronPort-AV: E=Sophos;i="5.81,251,1610438400"; d="scan'208";a="412274174"
Received: from lmirensk-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.214.195.153])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2021 09:23:40 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/6] drm/i915: Handle async cancellation in sentinel assert
Date: Tue, 16 Mar 2021 16:23:23 +0000
Message-Id: <20210316162326.1994039-4-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210316162326.1994039-1-tvrtko.ursulin@linux.intel.com>
References: <20210316162326.1994039-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

With the watchdog cancelling requests asynchronously to preempt-to-busy we
need to relax one assert making it apply only to requests not in error.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_execlists_submission.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index 4b870eca9693..a886f0c9b288 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -752,8 +752,11 @@ assert_pending_valid(const struct intel_engine_execlists *execlists,
 		 * Sentinels are supposed to be the last request so they flush
 		 * the current execution off the HW. Check that they are the only
 		 * request in the pending submission.
+		 *
+		 * Due async nature of preempt-to-busy and request cancellation
+		 * we need to skip this assert for cancelled requests.
 		 */
-		if (sentinel) {
+		if (sentinel && !rq->fence.error) {
 			GEM_TRACE_ERR("%s: context:%llx after sentinel in pending[%zd]\n",
 				      engine->name,
 				      ce->timeline->fence_context,
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
