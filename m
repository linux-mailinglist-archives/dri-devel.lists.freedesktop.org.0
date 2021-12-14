Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A81474902
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 18:14:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1393910E23C;
	Tue, 14 Dec 2021 17:14:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9FF410E117;
 Tue, 14 Dec 2021 17:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639502069; x=1671038069;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RR4OQyl93P6Xjlr+tous2lVRL+UUgd6EMt1s2adyaVM=;
 b=Mwy7RiRAKJZNNHms1SqWw8ddg9FU1V6M10Hkmg9H/PBfs7XHpkQpOq2Q
 ofNRNgETwdLwGrqcS3s+7cHIC+gHKCf88cLMWEeUcrIqODX3iUlUc5LrN
 +SLP7ku3t3CxwbUDNgF5SyGROZKKPNxaKlpfXxN6tkMxAWgmXIi2Z3z2V
 Z5Hj+aalx3F3EZBZmnJB88aaWL3q/nWMf6PuA1DAIfXkNzOE63lMHOZP/
 qVZLw+5Gen+F4JEKtgcPqtqGSAVJFUoZsOfm8MqvUBsfNXr7N2S452TBH
 xaSQ1FavpAMsboAiydB8GuIqt8skgcNNGQu81etkEbQ8Qw9Lv7M5HexEj g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="219043199"
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; d="scan'208";a="219043199"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2021 09:10:27 -0800
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; d="scan'208";a="614357541"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2021 09:10:25 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/7] drm/i915/guc: Use correct context lock when callig
 clr_context_registered
Date: Tue, 14 Dec 2021 09:04:54 -0800
Message-Id: <20211214170500.28569-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211214170500.28569-1-matthew.brost@intel.com>
References: <20211214170500.28569-1-matthew.brost@intel.com>
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
Cc: daniele.ceraolospurio@intel.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

s/ce/cn/ when grabbing guc_state.lock before calling
clr_context_registered.

Fixes: 0f7976506de61 ("drm/i915/guc: Rework and simplify locking")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 1f9d4fde421f..9b7b4f4e0d91 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -1937,9 +1937,9 @@ static int steal_guc_id(struct intel_guc *guc, struct intel_context *ce)
 		list_del_init(&cn->guc_id.link);
 		ce->guc_id = cn->guc_id;
 
-		spin_lock(&ce->guc_state.lock);
+		spin_lock(&cn->guc_state.lock);
 		clr_context_registered(cn);
-		spin_unlock(&ce->guc_state.lock);
+		spin_unlock(&cn->guc_state.lock);
 
 		set_context_guc_id_invalid(cn);
 
-- 
2.33.1

