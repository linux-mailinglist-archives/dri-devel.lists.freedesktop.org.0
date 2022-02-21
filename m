Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9B24BEDBF
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 00:18:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C3B110E538;
	Mon, 21 Feb 2022 23:18:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8341810E535;
 Mon, 21 Feb 2022 23:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645485495; x=1677021495;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JVXkGTgMk0f0BZi0vzDMp/6U04Z0YVjDjG523a9A54I=;
 b=Gb6GN6BCFOpM5Kyau9N9SCrTwD0QokLpwgWn3iVv0UU9kJb0rWUZ4K76
 0cRyzcSE6QYB2SKhdqrnvGnXimVfZkGAFgiO7v9rYWTgjA76Il2syS1Iu
 fAGaDRBAMGOjnYvx0aZZuRQrlioU2C7VlZuWxt7EKEXJ9abGGAHNdL2Mg
 oZxRoYfYZbyorJOoBazNfBabXkutSz23BVGEVQgXrzHvBwwd7NFiB7bW6
 IphZNwDL0yUrq+B7uU/JAHpMMZtCrwi1JG49fqKb+Eo99HLarHpZ6dD7J
 ip4bUsImnpP0hZqAIy/UnK6U9vigFw71wIYe0ghs72ys6qPzQUtNssWgZ A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="238996047"
X-IronPort-AV: E=Sophos;i="5.88,386,1635231600"; d="scan'208";a="238996047"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2022 15:18:15 -0800
X-IronPort-AV: E=Sophos;i="5.88,386,1635231600"; d="scan'208";a="638694587"
Received: from lab-ah.igk.intel.com ([10.91.215.196])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2022 15:18:12 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
To: linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, netdev <netdev@vger.kernel.org>
Subject: [PATCH v2 8/9] drm/i915: Correct type of wakeref variable
Date: Tue, 22 Feb 2022 00:17:00 +0100
Message-Id: <20220221231705.1481059-19-andrzej.hajda@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220221231705.1481059-1-andrzej.hajda@intel.com>
References: <20220221231705.1481059-1-andrzej.hajda@intel.com>
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Chris Wilson <chris.p.wilson@intel.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Dmitry Vyukov <dvyukov@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Wakeref has dedicated type. Assumption it will be int
compatible forever is incorrect.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 7799939c38945..b308dd0866eaf 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -2797,7 +2797,7 @@ static void destroyed_worker_func(struct work_struct *w)
 	struct intel_guc *guc = container_of(w, struct intel_guc,
 					     submission_state.destroyed_worker);
 	struct intel_gt *gt = guc_to_gt(guc);
-	int tmp;
+	intel_wakeref_t tmp;
 
 	with_intel_gt_pm(gt, tmp)
 		deregister_destroyed_contexts(guc);
-- 
2.25.1

