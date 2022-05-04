Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E945192F5
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 02:45:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2777F10EF17;
	Wed,  4 May 2022 00:45:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A739010EBE7;
 Wed,  4 May 2022 00:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651625101; x=1683161101;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UY26pVsClKAJkJh8ps139WrCxtF0RU2lG1d4/ydL+9w=;
 b=CwfdGz6QAFrqsXI/dCWv4jrHaTaHM+SaAunMUvwtyunxXVyM2GoZG1Vu
 4C7jly0YqjwCPVLmilALgnfR8AjIZJMIeicje244L3V7LVbggVWJNP/ey
 3FUSYT2zoiKzL5NnL+t83dtFB2Oe6hMS3ZBTyod1ywdLDg3txnOsWuNnX
 I6q4ggXXnZKaNSd8iHtaSJQVUVueCdo4GIzWq4JrnF6RmV8QdndnkafJL
 ZxxeI0k4mfKrzpJca1ohTa7GV3+w5QEgchWiy+UMDnadQXLJEnU8iKm+E
 VA6fI4cuax/l9yCQHjPREZ7oVXGZjYRRWd7Fi/p+k/N7eGlGRl+Vq13Pz A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10336"; a="267225499"
X-IronPort-AV: E=Sophos;i="5.91,196,1647327600"; d="scan'208";a="267225499"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2022 17:45:00 -0700
X-IronPort-AV: E=Sophos;i="5.91,196,1647327600"; d="scan'208";a="653495897"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2022 17:45:00 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/guc: Support programming the EU priority in the GuC
 descriptor
Date: Tue,  3 May 2022 17:44:46 -0700
Message-Id: <20220504004446.2000540-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 John Harrison <john.c.harrison@intel.com>, dri-devel@lists.freedesktop.org,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Matthew Brost <matthew.brost@intel.com>

The EU priority register must be updated by the GuC rather than the
driver as it is context specific and only the GuC knows which context
is currently executing.

Cc: John Harrison <john.c.harrison@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 75291e9846c50..8f3ed60ff07d9 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -2420,6 +2420,8 @@ static void prepare_context_registration_info(struct intel_context *ce,
 	 */
 	info->hwlrca_lo = lower_32_bits(ce->lrc.lrca);
 	info->hwlrca_hi = upper_32_bits(ce->lrc.lrca);
+	if (engine->flags & I915_ENGINE_HAS_EU_PRIORITY)
+		info->hwlrca_lo |= lrc_desc_priority(ce->guc_state.prio);
 	info->flags = CONTEXT_REGISTRATION_FLAG_KMD;
 
 	/*
-- 
2.25.1

