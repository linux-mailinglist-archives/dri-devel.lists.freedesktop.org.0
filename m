Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B79AD340AE7
	for <lists+dri-devel@lfdr.de>; Thu, 18 Mar 2021 18:04:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE0CA6E937;
	Thu, 18 Mar 2021 17:04:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A8426E934;
 Thu, 18 Mar 2021 17:04:29 +0000 (UTC)
IronPort-SDR: Ko1UXn4Xaa9K9wmcBQuCmjGUIG9WRwPNVDy85w2fwtCXP7wHF0hx2H7Wuc3gqvEoCG9fdTn1zE
 7TP48UwFTeqg==
X-IronPort-AV: E=McAfee;i="6000,8403,9927"; a="209733842"
X-IronPort-AV: E=Sophos;i="5.81,259,1610438400"; d="scan'208";a="209733842"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2021 10:04:29 -0700
IronPort-SDR: UqeLmsDra9bJCW/T0qrztBc+lLR64HmAOmN6MzErnc5xFpmhtAZ+ZvAn/QHUe32kuz4SedouBz
 HCpXpRomNTzQ==
X-IronPort-AV: E=Sophos;i="5.81,259,1610438400"; d="scan'208";a="413164912"
Received: from syeghiay-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.252.51.182])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2021 10:04:27 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/6] drm/i915: Restrict sentinel requests further
Date: Thu, 18 Mar 2021 17:04:15 +0000
Message-Id: <20210318170419.2107512-3-tvrtko.ursulin@linux.intel.com>
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

Disallow sentinel requests follow previous sentinels to make request
cancellation work better when faced with a chain of requests which have
all been marked as in error.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_execlists_submission.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index 4c2acb5a6c0a..4b870eca9693 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -896,7 +896,7 @@ static bool can_merge_rq(const struct i915_request *prev,
 	if (__i915_request_is_complete(next))
 		return true;
 
-	if (unlikely((i915_request_flags(prev) ^ i915_request_flags(next)) &
+	if (unlikely((i915_request_flags(prev) | i915_request_flags(next)) &
 		     (BIT(I915_FENCE_FLAG_NOPREEMPT) |
 		      BIT(I915_FENCE_FLAG_SENTINEL))))
 		return false;
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
