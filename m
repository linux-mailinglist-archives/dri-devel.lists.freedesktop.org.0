Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D90859B6FEA
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2024 23:38:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3709B10E0CD;
	Wed, 30 Oct 2024 22:38:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YsuzDUw8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD26210E0CD;
 Wed, 30 Oct 2024 22:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730327928; x=1761863928;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=x7DUXtel16JbuQU+IAF1snu6Ycc0+k8CKNzYhLcwXZo=;
 b=YsuzDUw8IwAChgUrkXU/FYgVtLB1X3Rfu8PNpgiStWoxMKx1108TYRn8
 SamFFRswmpSQpHADxqMmw+QHlXqM4s9G+EaQLJwSvLjO1Fj4iXXe2GN1v
 RTzPoFoMmSWDUwH2H3uhcqkBLXJtzbd4Es6ezq1zneaDOIpOFuSJTmj7c
 KW/gf2p/sS7dqY+GCDokWtjT5wvzRqgddghPT72CDy3qDrEiMw6sf18Vl
 GBSyX5f17BMP8GelGLiB4CCMXEneJt/+r9fnovGDNYdEK8tUmKJx2ce7R
 yNbqtCkvHAGy2hZRc7pcOzTryt4nXH/hTW9XkdirYtc6s3ORPijIpM/cK Q==;
X-CSE-ConnectionGUID: H3JjZCq8T/6hxwxQyOHGng==
X-CSE-MsgGUID: 4a/13ZR4R9+nX503N1KvKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="47513971"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="47513971"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2024 15:38:48 -0700
X-CSE-ConnectionGUID: 4jSK5ld3QPSNQVFlG20p8A==
X-CSE-MsgGUID: GrnJZ9kKSRmA4vhFkATG/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,246,1725346800"; d="scan'208";a="119909084"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by orviesa001.jf.intel.com with ESMTP; 30 Oct 2024 15:38:49 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v1] drm/i915/guc: Flush ct receive tasklet during reset
 preparation
Date: Wed, 30 Oct 2024 15:38:46 -0700
Message-Id: <20241030223846.2272374-1-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
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

GuC to host communication is interrupt driven, the handling has 3
parts: interrupt context, tasklet and request queue worker.
During GuC reset prepare, interrupt is disabled before destroy
contexts steps start. The IRQ and worker flushed to finish
in progress message handling if there are. The tasklet flush is
missing, it might causes 2 race conditions:
1. Tasklet runs after IRQ flushed, add request to queue after worker
flush started, causes unexpected G2H message request processing,
meanwhile, reset prepare code already get the context destroyed.
This will causes error reported about bad context state.
2. Tasklet runs after intel_guc_submission_reset_prepare,
ct_try_receive_message start to run, while intel_uc_reset_prepare
already finished guc sanitize and set ct->enable to false. This will
causes warning on incorrect ct->enable state.

Add the missing tasklet flush to flush all 3 parts.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 9ede6f240d79..353a9167c9a4 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -1688,6 +1688,10 @@ void intel_guc_submission_reset_prepare(struct intel_guc *guc)
 	spin_lock_irq(guc_to_gt(guc)->irq_lock);
 	spin_unlock_irq(guc_to_gt(guc)->irq_lock);
 
+	/* Flush tasklet */
+	tasklet_disable(&guc->ct.receive_tasklet);
+	tasklet_enable(&guc->ct.receive_tasklet);
+
 	guc_flush_submissions(guc);
 	guc_flush_destroyed_contexts(guc);
 	flush_work(&guc->ct.requests.worker);
-- 
2.34.1

