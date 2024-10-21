Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E539A937B
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 00:43:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0830810E1A2;
	Mon, 21 Oct 2024 22:43:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gIvc849B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF21B10E15A;
 Mon, 21 Oct 2024 22:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729550599; x=1761086599;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eNj13D7N9QfLTCPuudEVkz7xwSQKchMfnfCCJl1Jp08=;
 b=gIvc849BBiTKl0yQqRqCRoGEOduSDLj1SI+6ULYOvnTyK3+typNnMaZl
 eTq/jZUBq+k5EXh4JMJpehgQLtTlNY5YeQVWt4bn6EGCSsYYGCY7HyBmY
 E+vZd1Cs6TWwgHIVfDlaSRd2Uj56lnh8kNGhODyez+OsvO7v1hoWbwakb
 VswEcM3itU3F6WhWs64orVxVwqxBC8btp1UrRIfvcubMNQ5prKiJR+i4a
 +AhB9zqsAxLYvIsCHXeWCOW9902D4TFwDDsb/PBk72nm+vNTMipFoL6eH
 n0GP34HHubVV5jEH2knbCWPQJxz4pDi7dM99JVc73uTA/CX6uggKE3D4h Q==;
X-CSE-ConnectionGUID: wpZz3bWfRR68d1wjq/4RMw==
X-CSE-MsgGUID: bJHPAX3MTl6I2Oxp86WPMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="54464079"
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; d="scan'208";a="54464079"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 15:43:18 -0700
X-CSE-ConnectionGUID: Qi6b70AvR9KrLXZcAcGUMA==
X-CSE-MsgGUID: 2OeDRGAPTjqr83jhAK1WQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; d="scan'208";a="79751017"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by fmviesa008.fm.intel.com with ESMTP; 21 Oct 2024 15:43:18 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v2 1/1] drm/i915/guc: Move destroy context at end of reset
 prepare
Date: Mon, 21 Oct 2024 15:43:16 -0700
Message-Id: <20241021224316.293590-2-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241021224316.293590-1-zhanjun.dong@intel.com>
References: <20241021224316.293590-1-zhanjun.dong@intel.com>
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

During GuC reset prepare, interrupt disabled before hardware reset,
although interrupt disabled, the ct is still enabled, the host-GuC
communication is still active.
Move the destroy part to the end of reset preparation to avoid the
situation of host processing G2H messages about an context, but the
context already been destroyed.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 9ede6f240d79..858756eb4eb9 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -1689,10 +1689,11 @@ void intel_guc_submission_reset_prepare(struct intel_guc *guc)
 	spin_unlock_irq(guc_to_gt(guc)->irq_lock);
 
 	guc_flush_submissions(guc);
-	guc_flush_destroyed_contexts(guc);
 	flush_work(&guc->ct.requests.worker);
 
 	scrub_guc_desc_for_outstanding_g2h(guc);
+	guc_flush_destroyed_contexts(guc);
+
 }
 
 static struct intel_engine_cs *
-- 
2.34.1

