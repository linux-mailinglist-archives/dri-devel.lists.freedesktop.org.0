Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4883B27C2
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 08:48:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B200C6EA30;
	Thu, 24 Jun 2021 06:47:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5279D6E9FA;
 Thu, 24 Jun 2021 06:47:31 +0000 (UTC)
IronPort-SDR: ekgySzQjEW+ahrd8le8toQVJbcaRvN3WFivBothxGZ1wAl9zBkAJSY0NRHJk+q9awEc9Ll0VU6
 NnOi0UWYB6gA==
X-IronPort-AV: E=McAfee;i="6200,9189,10024"; a="207346775"
X-IronPort-AV: E=Sophos;i="5.83,295,1616482800"; d="scan'208";a="207346775"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 23:47:26 -0700
IronPort-SDR: vNDJiVYY1MVlbLNIWbA2yjug6oDv57QI54zmIF30a6t2Pg4MXRhH8jmwH0QipMSR8djpfehO+h
 GPv2kO4rFg2g==
X-IronPort-AV: E=Sophos;i="5.83,295,1616482800"; d="scan'208";a="556390974"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 23:47:26 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 37/47] drm/i915/guc: Enable the timer expired interrupt for GuC
Date: Thu, 24 Jun 2021 00:05:06 -0700
Message-Id: <20210624070516.21893-38-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210624070516.21893-1-matthew.brost@intel.com>
References: <20210624070516.21893-1-matthew.brost@intel.com>
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
Cc: daniele.ceraolospurio@intel.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The GuC can implement execution qunatums, detect hung contexts and
other such things but it requires the timer expired interrupt to do so.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
CC: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/intel_rps.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
index 06e9a8ed4e03..0c8e7f2b06f0 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -1877,6 +1877,10 @@ void intel_rps_init(struct intel_rps *rps)
 
 	if (GRAPHICS_VER(i915) >= 8 && GRAPHICS_VER(i915) < 11)
 		rps->pm_intrmsk_mbz |= GEN8_PMINTR_DISABLE_REDIRECT_TO_GUC;
+
+	/* GuC needs ARAT expired interrupt unmasked */
+	if (intel_uc_uses_guc_submission(&rps_to_gt(rps)->uc))
+		rps->pm_intrmsk_mbz |= ARAT_EXPIRED_INTRMSK;
 }
 
 void intel_rps_sanitize(struct intel_rps *rps)
-- 
2.28.0

