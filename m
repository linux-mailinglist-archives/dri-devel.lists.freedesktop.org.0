Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 618662C64F8
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:11:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F10F96EC9E;
	Fri, 27 Nov 2020 12:10:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED0406ECB0;
 Fri, 27 Nov 2020 12:10:12 +0000 (UTC)
IronPort-SDR: NnuTJyw2ANgIMq6e02IudyY6b2u0UnJSAvTL4XRLvC19fErJ6YL1QF6h6YLVlpniQ0AIYniE6B
 PdGMhr4ytuSw==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="172540780"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="172540780"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:10:12 -0800
IronPort-SDR: Kb1BCYn1Wm/a6T+laMBsXak+gNh5pafaMXqi/iltkF0zrgwoD+FdtI+qC55yT2sgBoV5sVSoH0
 xsoYTSnrMzfQ==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548029282"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:10:10 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 089/162] drm/i915/dg1: Fix occasional migration error
Date: Fri, 27 Nov 2020 12:06:05 +0000
Message-Id: <20201127120718.454037-90-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201127120718.454037-1-matthew.auld@intel.com>
References: <20201127120718.454037-1-matthew.auld@intel.com>
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
Cc: CQ Tang <cq.tang@intel.com>, Sudeep Dutt <sudeep.dutt@intel.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: CQ Tang <cq.tang@intel.com>

We posted blitter copying operation. Then we call
i915_gem_object_set_to_cpu_domain(), inside this function, we
call i915_gem_object_wait() with interruptible flag. Sometimes
this wait call gets interrupted by the blitter copying complete
interrupt. This will make migration operation to fail.
So before calling i915_gem_object_set_to_cpu_domain(), we call
i915_gem_object_wait() with non-interruptible flag to wait for
the blitter operation to finish.

Signed-off-by: CQ Tang <cq.tang@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Sudeep Dutt <sudeep.dutt@intel.com>
Cc: Ramalingam C <ramalingam.c@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_object.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index 7ff430503497..49935245a4a8 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -381,6 +381,17 @@ int i915_gem_object_migrate(struct drm_i915_gem_object *obj,
 		err = i915_gem_object_ww_copy_blt(obj, donor, ww, ce);
 		if (err)
 			goto unlock_donor;
+
+		/*
+		 * Occasionally i915_gem_object_wait() called inside
+		 * i915_gem_object_set_to_cpu_domain() get interrupted
+		 * and return -ERESTARTSYS, this will make migration
+		 * operation fail. So adding a non-interruptible wait
+		 * before changing the object domain.
+		 */
+		err = i915_gem_object_wait(donor, 0, MAX_SCHEDULE_TIMEOUT);
+		if (err)
+			goto unlock_donor;
 	}
 
 	err = i915_gem_object_set_to_cpu_domain(donor, false);
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
