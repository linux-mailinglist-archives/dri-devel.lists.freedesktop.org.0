Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3904169A3D7
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 03:25:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C522310E195;
	Fri, 17 Feb 2023 02:25:05 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 922E910E1A3;
 Fri, 17 Feb 2023 02:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676600704; x=1708136704;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PCzGL8HyoQjOxs2uE0Tn4vpdvjpxrJIyAJdOPd2gJAo=;
 b=Vl0UpMmZC9Wl/au4ltYrCF+yNr6NA4OviHy4YCb7B7dosB3NDS7YX8td
 b57a7OhI+sGY5gDEfRuew21Zu1ufTwak27GGJ40CJNmfGbqitdOUFp4nN
 u1G9j6HuP0R8qTYT9LtNA574SJxd3hBQSiJgKyFGBx/mYPzn+r4UBtvcQ
 XisDYhAdM+0OayqgXo4Et4dTPT5ygH3S9BEWgH8l4mYx+za9cW32OqAqH
 b7tNRE3EPKCqqRBp1NdVmDMVEGJ/oW+gL12rKn4SZTLEys9NwW+FUstY9
 +gYWjnyW+xY9y3Wf+46c1vzCpdErm/i6vz99JWrNMLmQewEOZV9x4/oh/ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="334093367"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; d="scan'208";a="334093367"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 18:25:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="670389092"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; d="scan'208";a="670389092"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga002.jf.intel.com with ESMTP; 16 Feb 2023 18:25:02 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v2 3/3] drm/i915: Include timeline seqno in error capture
Date: Thu, 16 Feb 2023 18:24:20 -0800
Message-Id: <20230217022420.2664116-4-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230217022420.2664116-1-John.C.Harrison@Intel.com>
References: <20230217022420.2664116-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

The seqno value actually written out to memory is no longer in the
regular HWSP. Instead, it is now in its own private timeline buffer.
Thus, it is no longer visible in an error capture. So, explicitly read
the value and include that in the capture.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/i915_gpu_error.c | 3 +++
 drivers/gpu/drm/i915/i915_gpu_error.h | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index 904f21e1380cd..036a65c9cbf67 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -505,6 +505,7 @@ static void error_print_context(struct drm_i915_error_state_buf *m,
 		   header, ctx->comm, ctx->pid, ctx->sched_attr.priority,
 		   ctx->guilty, ctx->active,
 		   ctx->total_runtime, ctx->avg_runtime);
+	err_printf(m, "  context timeline seqno %d\n", ctx->hwsp_seqno);
 }
 
 static struct i915_vma_coredump *
@@ -1395,6 +1396,8 @@ static bool record_context(struct i915_gem_context_coredump *e,
 	e->sched_attr = ctx->sched;
 	e->guilty = atomic_read(&ctx->guilty_count);
 	e->active = atomic_read(&ctx->active_count);
+	e->hwsp_seqno = (ce->timeline && ce->timeline->hwsp_seqno) ?
+				*ce->timeline->hwsp_seqno : ~0U;
 
 	e->total_runtime = intel_context_get_total_runtime_ns(ce);
 	e->avg_runtime = intel_context_get_avg_runtime_ns(ce);
diff --git a/drivers/gpu/drm/i915/i915_gpu_error.h b/drivers/gpu/drm/i915/i915_gpu_error.h
index 56027ffbce51f..a91932cc65317 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.h
+++ b/drivers/gpu/drm/i915/i915_gpu_error.h
@@ -107,6 +107,7 @@ struct intel_engine_coredump {
 		int active;
 		int guilty;
 		struct i915_sched_attr sched_attr;
+		u32 hwsp_seqno;
 	} context;
 
 	struct i915_vma_coredump *vma;
-- 
2.39.1

