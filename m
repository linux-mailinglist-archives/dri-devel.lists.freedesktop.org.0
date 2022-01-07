Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B46B486E55
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 01:06:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9282110E4E1;
	Fri,  7 Jan 2022 00:06:31 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D04F710E4DA;
 Fri,  7 Jan 2022 00:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641513988; x=1673049988;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ESzrR2C4+DN/vxE4MYel6qGJLGlvLdhOSJgN8+Dtng8=;
 b=ZBwlIGbQgWnzXeKhVAwAeAdLaZ7lvS74yvJtLFJxEJ1y9tSidpH9HlNs
 E1+04qZ8/3MZGisQVK0Jd3WRUCGWefXqJdu3qkpO53+qr2BYXQmTFlniA
 iUtW0y5tZgD6lla5cX2NfsZgd8IpMAyFsikWgweIAtTIyuLXMaLZgFRh6
 EmccjJwWWYGBJ7Jg6FhpTTJpUP3BfyVsUx/xErn7qCoInHt36F5pVGIDF
 g90SRaks6jNl4KxeCWu/pLZCJfkiUxusSOekJlDSiKmC2YO4NXsIy7bEP
 M8Hb80Hum+UjNxTiRILhpPaMWS2J7yIx9PYpAS9sgBq6I9njG5d7XJ75V Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="306132700"
X-IronPort-AV: E=Sophos;i="5.88,268,1635231600"; d="scan'208";a="306132700"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2022 16:06:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,268,1635231600"; d="scan'208";a="489110650"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by orsmga002.jf.intel.com with ESMTP; 06 Jan 2022 16:06:22 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v2 1/3] drm/i915/guc: Temporarily bump the GuC load timeout
Date: Thu,  6 Jan 2022 16:06:20 -0800
Message-Id: <20220107000622.292081-2-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220107000622.292081-1-John.C.Harrison@Intel.com>
References: <20220107000622.292081-1-John.C.Harrison@Intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

There is a known (but exceedingly unlikely) race condition where the
asynchronous frequency management code could reduce the GT clock while
a GuC reload is in progress (during a full GT reset). A fix is in
progress but there are complex locking issues to be resolved. In the
meantime bump the timeout to 200ms. Even at slowest clock, this
should be sufficient. And in the working case, a larger timeout makes
no difference.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
index 31420ce1ce6b..d09c205b2beb 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
@@ -105,12 +105,21 @@ static int guc_wait_ucode(struct intel_uncore *uncore)
 	/*
 	 * Wait for the GuC to start up.
 	 * NB: Docs recommend not using the interrupt for completion.
-	 * Measurements indicate this should take no more than 20ms, so a
+	 * Measurements indicate this should take no more than 20ms
+	 * (assuming the GT clock is at maximum frequency). So, a
 	 * timeout here indicates that the GuC has failed and is unusable.
 	 * (Higher levels of the driver may decide to reset the GuC and
 	 * attempt the ucode load again if this happens.)
+	 *
+	 * FIXME: There is a known (but exceedingly unlikely) race condition
+	 * where the asynchronous frequency management code could reduce
+	 * the GT clock while a GuC reload is in progress (during a full
+	 * GT reset). A fix is in progress but there are complex locking
+	 * issues to be resolved. In the meantime bump the timeout to
+	 * 200ms. Even at slowest clock, this should be sufficient. And
+	 * in the working case, a larger timeout makes no difference.
 	 */
-	ret = wait_for(guc_ready(uncore, &status), 100);
+	ret = wait_for(guc_ready(uncore, &status), 200);
 	if (ret) {
 		struct drm_device *drm = &uncore->i915->drm;
 
-- 
2.25.1

