Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8114B1565
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 19:37:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 783AD10E94F;
	Thu, 10 Feb 2022 18:37:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4565510E951;
 Thu, 10 Feb 2022 18:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644518213; x=1676054213;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1IX9wkoWsbtqy+bgG/GLAyffib2A3mrxbjpJxzK79Cs=;
 b=Ssmu+ER3Xc1YH2tKAeEjqf0RjPPDej6rKd+PgefYMEYXHvTmchcpHZWB
 KFeAICBI9DNDUK3rhzKonRb0vOp86qC94eVUjTmbUfUuVNJ4Jan+VMq8H
 nQbmVhc6w0D2Qq16r1cudWw+I7dz/GD/oVyIZkfuwC02qdIW/8i0d7L1j
 q1uMV3wizvjwrqldr3iYNre8uOBu+5yGFinkxZ4afqR9dA9Dbd19SjIec
 JQrvJCNQ6QG/1PsrrmYNiOYPMYOblqmu0/Fjji9Y4OeqTPWCFkybLvg7v
 j1pk1QjDsFc6r0ZRsX3kEMWFGpInQTBkDOgEPx3cE6xDlUM25b5lrxYQw Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10254"; a="229528167"
X-IronPort-AV: E=Sophos;i="5.88,359,1635231600"; d="scan'208";a="229528167"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 10:36:41 -0800
X-IronPort-AV: E=Sophos;i="5.88,359,1635231600"; d="scan'208";a="526616766"
Received: from lmoua-mobl.amr.corp.intel.com (HELO mvcheng-desk2.intel.com)
 ([10.212.169.226])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 10:36:40 -0800
From: Michael Cheng <michael.cheng@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v10 3/6] drm/i915/gt: Drop invalidate_csb_entries
Date: Thu, 10 Feb 2022 10:36:33 -0800
Message-Id: <20220210183636.1187973-4-michael.cheng@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220210183636.1187973-1-michael.cheng@intel.com>
References: <20220210183636.1187973-1-michael.cheng@intel.com>
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
Cc: tvrtko.ursulin@linux.intel.com, michael.cheng@intel.com,
 balasubramani.vivekanandan@intel.com, wayne.boyer@intel.com,
 casey.g.bowman@intel.com, lucas.demarchi@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drop invalidate_csb_entries and directly call drm_clflush_virt_range.
This allows for one less function call, and prevent complier errors when
building for non-x86 architectures.

v2(Michael Cheng): Drop invalidate_csb_entries function and directly
		   invoke drm_clflush_virt_range. Thanks to Tvrtko for the
		   sugguestion.

v3(Michael Cheng): Use correct parameters for drm_clflush_virt_range.
		   Thanks to Tvrtko for pointing this out.

Signed-off-by: Michael Cheng <michael.cheng@intel.com>
---
 .../gpu/drm/i915/gt/intel_execlists_submission.c    | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index 9bb7c863172f..6186a5e4b191 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -1646,12 +1646,6 @@ cancel_port_requests(struct intel_engine_execlists * const execlists,
 	return inactive;
 }
 
-static void invalidate_csb_entries(const u64 *first, const u64 *last)
-{
-	clflush((void *)first);
-	clflush((void *)last);
-}
-
 /*
  * Starting with Gen12, the status has a new format:
  *
@@ -1999,7 +1993,7 @@ process_csb(struct intel_engine_cs *engine, struct i915_request **inactive)
 	 * the wash as hardware, working or not, will need to do the
 	 * invalidation before.
 	 */
-	invalidate_csb_entries(&buf[0], &buf[num_entries - 1]);
+	drm_clflush_virt_range(&buf[0], num_entries * sizeof(buf[0]));
 
 	/*
 	 * We assume that any event reflects a change in context flow
@@ -2783,8 +2777,9 @@ static void reset_csb_pointers(struct intel_engine_cs *engine)
 
 	/* Check that the GPU does indeed update the CSB entries! */
 	memset(execlists->csb_status, -1, (reset_value + 1) * sizeof(u64));
-	invalidate_csb_entries(&execlists->csb_status[0],
-			       &execlists->csb_status[reset_value]);
+	drm_clflush_virt_range(&execlists->csb_status[0],
+			       execlists->csb_size *
+			       sizeof(execlists->csb_status[0]));
 
 	/* Once more for luck and our trusty paranoia */
 	ENGINE_WRITE(engine, RING_CONTEXT_STATUS_PTR,
-- 
2.25.1

