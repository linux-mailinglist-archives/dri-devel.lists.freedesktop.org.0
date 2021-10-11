Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC5B429644
	for <lists+dri-devel@lfdr.de>; Mon, 11 Oct 2021 20:02:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDC5F6E52A;
	Mon, 11 Oct 2021 18:01:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FA846E52A;
 Mon, 11 Oct 2021 18:01:55 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10134"; a="207049640"
X-IronPort-AV: E=Sophos;i="5.85,365,1624345200"; d="scan'208";a="207049640"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2021 11:01:53 -0700
X-IronPort-AV: E=Sophos;i="5.85,365,1624345200"; d="scan'208";a="485980770"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2021 11:01:52 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Cc: <thomas.hellstrom@linux.intel.com>
Subject: [PATCH] drm/i915/selftests: Increase timeout in requests perf selftest
Date: Mon, 11 Oct 2021 10:57:04 -0700
Message-Id: <20211011175704.28509-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.32.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

perf_parallel_engines is micro benchmark to test i915 request
scheduling. The test creates a thread per physical engine and submits
NOP requests and waits the requests to complete in a loop. In execlists
mode this works perfectly fine as powerful CPU has enough cores to feed
each engine and process the CSBs. With GuC submission the uC gets
overwhelmed as all threads feed into a single CTB channel and the GuC
gets bombarded with CSBs as contexts are immediately switched in and out
on the engines due to the zero runtime of the requests. When the GuC is
overwhelmed scheduling of contexts is unfair due to the nature of the
GuC scheduling algorithm. This behavior is understood and deemed
acceptable as this micro benchmark isn't close to real world use case.
Increasing the timeout of wait period for requests to complete. This
makes the test understand that is ok for contexts to get starved in this
scenario.

A future patch / cleanup may just delete these micro benchmark tests as
they basically mean nothing. We care about real workloads not made up
ones.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/selftests/i915_request.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/selftests/i915_request.c b/drivers/gpu/drm/i915/selftests/i915_request.c
index d67710d10615..6496671a113c 100644
--- a/drivers/gpu/drm/i915/selftests/i915_request.c
+++ b/drivers/gpu/drm/i915/selftests/i915_request.c
@@ -2805,7 +2805,7 @@ static int p_sync0(void *arg)
 		i915_request_add(rq);
 
 		err = 0;
-		if (i915_request_wait(rq, 0, HZ / 5) < 0)
+		if (i915_request_wait(rq, 0, HZ) < 0)
 			err = -ETIME;
 		i915_request_put(rq);
 		if (err)
@@ -2876,7 +2876,7 @@ static int p_sync1(void *arg)
 		i915_request_add(rq);
 
 		err = 0;
-		if (prev && i915_request_wait(prev, 0, HZ / 5) < 0)
+		if (prev && i915_request_wait(prev, 0, HZ) < 0)
 			err = -ETIME;
 		i915_request_put(prev);
 		prev = rq;
-- 
2.32.0

