Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E403E8797
	for <lists+dri-devel@lfdr.de>; Wed, 11 Aug 2021 03:16:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A88586E084;
	Wed, 11 Aug 2021 01:16:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C375089CBC
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Aug 2021 01:16:29 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10072"; a="202211836"
X-IronPort-AV: E=Sophos;i="5.84,311,1620716400"; d="scan'208";a="202211836"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2021 18:16:29 -0700
X-IronPort-AV: E=Sophos;i="5.84,311,1620716400"; d="scan'208";a="675603982"
Received: from dut151-iclu.fm.intel.com ([10.105.23.69])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2021 18:16:28 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <gfx-internal-devel@eclists.intel.com>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 5/9] drm/i915/guc: Flush the work queue for GuC generated G2H
Date: Wed, 11 Aug 2021 01:16:18 +0000
Message-Id: <20210811011622.255784-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210811011622.255784-1-matthew.brost@intel.com>
References: <20210811011622.255784-1-matthew.brost@intel.com>
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

Flush the work queue for GuC generated G2H messages durinr a GT reset.
This is accomplished by spinning on the the list of outstanding G2H to
go empty.

Fixes: eb5e7da736f3 ("drm/i915/guc: Reset implementation for new GuC interface")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Cc: <stable@vger.kernel.org>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 3cd2da6f5c03..e5eb2df11b4a 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -727,6 +727,11 @@ void intel_guc_submission_reset_prepare(struct intel_guc *guc)
 			wait_for_reset(guc, &guc->outstanding_submission_g2h);
 		} while (!list_empty(&guc->ct.requests.incoming));
 	}
+
+	/* Flush any GuC generated G2H */
+	while (!list_empty(&guc->ct.requests.incoming))
+		msleep(20);
+
 	scrub_guc_desc_for_outstanding_g2h(guc);
 }
 
-- 
2.32.0

