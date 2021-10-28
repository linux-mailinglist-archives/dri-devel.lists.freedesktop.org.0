Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8CE43E1CF
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 15:14:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7F476E973;
	Thu, 28 Oct 2021 13:14:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3939A6E96E;
 Thu, 28 Oct 2021 13:14:02 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10150"; a="227852799"
X-IronPort-AV: E=Sophos;i="5.87,189,1631602800"; d="scan'208";a="227852799"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 06:01:17 -0700
X-IronPort-AV: E=Sophos;i="5.87,189,1631602800"; d="scan'208";a="665406545"
Received: from malloyd-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.16.73])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 06:01:15 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Subject: [PATCH 07/11] drm/i915/pm: Move CONTEXT_VALID_BIT check
Date: Thu, 28 Oct 2021 13:58:51 +0100
Message-Id: <20211028125855.3281674-7-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20211028125855.3281674-1-matthew.auld@intel.com>
References: <20211028125855.3281674-1-matthew.auld@intel.com>
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

From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Resetting will clear the CONTEXT_VALID_BIT, so wait until after that to
test.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_pm.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pm.c b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
index a1334b48dde7..849fbb229bd3 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_pm.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
@@ -52,8 +52,6 @@ static int __engine_unpark(struct intel_wakeref *wf)
 	/* Discard stale context state from across idling */
 	ce = engine->kernel_context;
 	if (ce) {
-		GEM_BUG_ON(test_bit(CONTEXT_VALID_BIT, &ce->flags));
-
 		/* Flush all pending HW writes before we touch the context */
 		while (unlikely(intel_context_inflight(ce)))
 			intel_engine_flush_submission(engine);
@@ -68,6 +66,9 @@ static int __engine_unpark(struct intel_wakeref *wf)
 			 ce->timeline->seqno,
 			 READ_ONCE(*ce->timeline->hwsp_seqno),
 			 ce->ring->emit);
+
+		GEM_BUG_ON(test_bit(CONTEXT_VALID_BIT, &ce->flags));
+
 		GEM_BUG_ON(ce->timeline->seqno !=
 			   READ_ONCE(*ce->timeline->hwsp_seqno));
 	}
-- 
2.26.3

