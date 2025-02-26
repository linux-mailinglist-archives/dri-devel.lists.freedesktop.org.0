Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC592A46ED7
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 23:56:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 012BE10E9FF;
	Wed, 26 Feb 2025 22:56:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TSidy1Lc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B092610E0A0;
 Wed, 26 Feb 2025 22:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740610560; x=1772146560;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9JhWOlwu+I9akc8a0zb5UZRnO2vhqdbuO+hgivhNSek=;
 b=TSidy1LcNR7eEdDxBwEh7OzoteY2ENFl3oD2wHhWQ5vpr+C0W/bglhbQ
 WGDRNkxhYo2ch3Sci9BlzAhKjuoEOsDY+160Srja/FcPmoJ/at8JBbH+9
 ncVr+KhsoApcab4cl1W812AOnorKsiYgdQaOXfUPJkFhqffA3cfipDVmH
 2L9jEaTuSAIWpVG1XpWwXvnyyGQYDNSM5/wzbLCXkMzWzcXs2/RcNdExL
 OQcBurE8yq61HG/FBtCbMWEn9/DugX/UIZPT5kkgt7cfSMt0PuNxPsWta
 dvNEdnvWJLHBXTyuqunTf9bjpWKiSPk+qdTmO9darwAp7DKsgfR/KpC6a A==;
X-CSE-ConnectionGUID: Jr9too33T1S5ZsOmYz4hvQ==
X-CSE-MsgGUID: ae9j5hmjTq+X0d1yrmelJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="44308777"
X-IronPort-AV: E=Sophos;i="6.13,318,1732608000"; d="scan'208";a="44308777"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 14:55:59 -0800
X-CSE-ConnectionGUID: MmZganv7SF+5vMCcY3XhOg==
X-CSE-MsgGUID: XBLJCL9eSBOo3xTWtJsEMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,318,1732608000"; d="scan'208";a="117326779"
Received: from dut4025lnl.fm.intel.com ([10.105.10.92])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 14:55:58 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, dri-devel@lists.freedesktop.org
Subject: [PATCH 5/6] drm/xe/xe_vm: Add per VM reset stats
Date: Wed, 26 Feb 2025 22:55:55 +0000
Message-ID: <20250226225557.133076-6-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250226225557.133076-1-jonathan.cavitt@intel.com>
References: <20250226225557.133076-1-jonathan.cavitt@intel.com>
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

Add a counter to xe_vm that tracks the number of times an engine reset
has been observed with respect to the VM since creation.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 2 ++
 drivers/gpu/drm/xe/xe_vm_types.h   | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index f0bfc9d109cb..e4c2413ed47e 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1990,6 +1990,8 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
 
 	trace_xe_exec_queue_reset(q);
 
+	atomic_inc(&q->vm->reset_count);
+
 	/*
 	 * A banned engine is a NOP at this point (came from
 	 * guc_exec_queue_timedout_job). Otherwise, kick drm scheduler to cancel
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index e7e2d682b1b6..a448402250e5 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -305,6 +305,9 @@ struct xe_vm {
 		spinlock_t lock;
 	} pf;
 
+	/** @reset_count: number of times this VM has seen an engine reset */
+	atomic_t reset_count;
+
 	/**
 	 * @tlb_flush_seqno: Required TLB flush seqno for the next exec.
 	 * protected by the vm resv.
-- 
2.43.0

