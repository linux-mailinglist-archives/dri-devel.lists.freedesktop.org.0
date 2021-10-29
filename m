Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1724643F8F0
	for <lists+dri-devel@lfdr.de>; Fri, 29 Oct 2021 10:33:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B9366EA2F;
	Fri, 29 Oct 2021 08:32:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7021B6EA1E;
 Fri, 29 Oct 2021 08:32:33 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10151"; a="210671286"
X-IronPort-AV: E=Sophos;i="5.87,192,1631602800"; d="scan'208";a="210671286"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2021 01:32:33 -0700
X-IronPort-AV: E=Sophos;i="5.87,192,1631602800"; d="scan'208";a="448302254"
Received: from hohiggin-mobl2.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.213.197.138])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2021 01:32:31 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Subject: [PATCH v2 06/10] drm/i915/pm: Move CONTEXT_VALID_BIT check
Date: Fri, 29 Oct 2021 09:31:14 +0100
Message-Id: <20211029083118.3386312-6-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20211029083118.3386312-1-matthew.auld@intel.com>
References: <20211029083118.3386312-1-matthew.auld@intel.com>
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

