Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B007340AE9
	for <lists+dri-devel@lfdr.de>; Thu, 18 Mar 2021 18:04:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EBEF6E934;
	Thu, 18 Mar 2021 17:04:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F07FC6E935;
 Thu, 18 Mar 2021 17:04:31 +0000 (UTC)
IronPort-SDR: IgOFYAT8AGDadI1/Rm5ycFYMiwp7KejMg9hQQcc8aU0VXhwwpQDS+tN4FEjfhvc+YqArbhMRDC
 tvVt4/hAt8nw==
X-IronPort-AV: E=McAfee;i="6000,8403,9927"; a="209733847"
X-IronPort-AV: E=Sophos;i="5.81,259,1610438400"; d="scan'208";a="209733847"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2021 10:04:31 -0700
IronPort-SDR: MtdxoRNfcJPry6Lqi5cQi/Dp+FQb8RLVDPS/L0Yb+zPdryJrbug8jW/hq+EU/SZrOR0ejrimDN
 eVJVyXZ98FEQ==
X-IronPort-AV: E=Sophos;i="5.81,259,1610438400"; d="scan'208";a="413164945"
Received: from syeghiay-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.252.51.182])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2021 10:04:29 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/6] drm/i915: Handle async cancellation in sentinel assert
Date: Thu, 18 Mar 2021 17:04:16 +0000
Message-Id: <20210318170419.2107512-4-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210318170419.2107512-1-tvrtko.ursulin@linux.intel.com>
References: <20210318170419.2107512-1-tvrtko.ursulin@linux.intel.com>
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

v2:
 * Check against the correct request!

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_execlists_submission.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index 4b870eca9693..bf557290173a 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -815,6 +815,13 @@ assert_pending_valid(const struct intel_engine_execlists *execlists,
 		spin_unlock_irqrestore(&rq->lock, flags);
 		if (!ok)
 			return false;
+
+		/*
+		 * Due async nature of preempt-to-busy and request cancellation
+		 * we need to skip further asserts for cancelled requests.
+		 */
+		if (READ_ONCE(rq->fence.error))
+			break;
 	}
 
 	return ce;
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
