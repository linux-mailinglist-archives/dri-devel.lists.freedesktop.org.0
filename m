Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9308470FAF
	for <lists+dri-devel@lfdr.de>; Sat, 11 Dec 2021 02:02:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90CBE10E69E;
	Sat, 11 Dec 2021 01:02:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5724E10E691;
 Sat, 11 Dec 2021 01:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639184516; x=1670720516;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EhdUVVr9eIE9WCSz8TAVFuFLdO2xUveYEDO6k+ucB7k=;
 b=Cf/zz6PBymb3C8cn4XL6/y6vZX61xMpRHYnevjfivLasbzQl2UN9GlfU
 eh/cHUmDDKaLjnYflF7zQsm67pVgdlC/g4MyLpITI4s+zQI3BUsASLLWw
 1ryAqkxjJJQXU8UMvrbaXy2iVbu6rcDfKrEweNGQO6m/mmw6teddkDA7P
 JKIEA+Ipr3F6uIBHpG5khoKx1f9/wbI9K+Vr4F5x41f4N5umcOylUV41n
 uEYDJXKzPJD6Jtrm+IqREbtOYfpuGdQ7Azq/ODcfrB0sW/8qTA/Q5VSSs
 4MS7P99Bx/PvHPp5lWSlDBwFwpI8hJQgbiohwpPKwvLW3SFqC4rSEvZt2 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10194"; a="238298245"
X-IronPort-AV: E=Sophos;i="5.88,197,1635231600"; d="scan'208";a="238298245"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2021 17:01:41 -0800
X-IronPort-AV: E=Sophos;i="5.88,197,1635231600"; d="scan'208";a="517002951"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2021 17:01:41 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/7] drm/i915/guc: Only assign guc_id.id when stealing guc_id
Date: Fri, 10 Dec 2021 16:56:07 -0800
Message-Id: <20211211005612.8575-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211211005612.8575-1-matthew.brost@intel.com>
References: <20211211005612.8575-1-matthew.brost@intel.com>
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

Previously assigned whole guc_id structure (list, spin lock) which is
incorrect, only assign the guc_id.id.

Fixes: 0f7976506de61 ("drm/i915/guc: Rework and simplify locking")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 9b7b4f4e0d91..0fb2eeff0262 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -1935,7 +1935,7 @@ static int steal_guc_id(struct intel_guc *guc, struct intel_context *ce)
 		GEM_BUG_ON(intel_context_is_parent(cn));
 
 		list_del_init(&cn->guc_id.link);
-		ce->guc_id = cn->guc_id;
+		ce->guc_id.id = cn->guc_id.id;
 
 		spin_lock(&cn->guc_state.lock);
 		clr_context_registered(cn);
-- 
2.33.1

