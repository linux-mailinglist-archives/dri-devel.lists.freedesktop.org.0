Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A147D6B5905
	for <lists+dri-devel@lfdr.de>; Sat, 11 Mar 2023 07:38:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A863810EA5C;
	Sat, 11 Mar 2023 06:38:18 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C19610E0D1;
 Sat, 11 Mar 2023 06:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678516696; x=1710052696;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d8h4HW5/JM9xOCNH7wDZWckq71z5KOcSv3cidNaFdQo=;
 b=QMgk3a0qGgtcrwV+jsRSB90Ipl/P5n2DmP1LU/sEOmxdh7lpMWkc1zhi
 UEp5mbBmqcekjP2HxCrcC64TNt4OleogzdUlEUi3l9019wF/aXhksFp4V
 mGcWpLbwc2b95Xrw5D8bpsWpXVMX0R4W9vdagM3UCIA/00qTRb+yfe2rO
 gHnCOxc5iO5kRW16uNsZ/elBwRcpZYIxkEtG3S+lTAAaxGNryVcNfvrLk
 2sWxANChx6Cp1LwIeFVYcsbUrRlWrSzuAhzcCGZAPqm5WRJ9GpMEgOlYz
 qsFgaTNiPMQ9Dvq+7G3LWU8R9sLnJch4QrFo45cA0x9iW6027MvpwGApX A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="335579554"
X-IronPort-AV: E=Sophos;i="5.98,252,1673942400"; d="scan'208";a="335579554"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2023 22:38:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="678086700"
X-IronPort-AV: E=Sophos;i="5.98,252,1673942400"; d="scan'208";a="678086700"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga002.jf.intel.com with ESMTP; 10 Mar 2023 22:38:15 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v3 3/3] drm/i915: Include timeline seqno in error capture
Date: Fri, 10 Mar 2023 22:37:14 -0800
Message-Id: <20230311063714.570389-4-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230311063714.570389-1-John.C.Harrison@Intel.com>
References: <20230311063714.570389-1-John.C.Harrison@Intel.com>
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
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

The seqno value actually written out to memory is no longer in the
regular HWSP. Instead, it is now in its own private timeline buffer.
Thus, it is no longer visible in an error capture. So, explicitly read
the value and include that in the capture.

v2: %d -> %u (Alan)

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/i915/i915_gpu_error.c | 3 +++
 drivers/gpu/drm/i915/i915_gpu_error.h | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index 904f21e1380cd..f020c0086fbcd 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -505,6 +505,7 @@ static void error_print_context(struct drm_i915_error_state_buf *m,
 		   header, ctx->comm, ctx->pid, ctx->sched_attr.priority,
 		   ctx->guilty, ctx->active,
 		   ctx->total_runtime, ctx->avg_runtime);
+	err_printf(m, "  context timeline seqno %u\n", ctx->hwsp_seqno);
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

