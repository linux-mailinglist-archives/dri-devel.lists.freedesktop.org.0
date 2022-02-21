Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DAF4BEDE6
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 00:26:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AFB310E575;
	Mon, 21 Feb 2022 23:26:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6EA510E56D;
 Mon, 21 Feb 2022 23:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645485990; x=1677021990;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JVXkGTgMk0f0BZi0vzDMp/6U04Z0YVjDjG523a9A54I=;
 b=C8p/TVVHTkz0LNfcKWVHUdMobdxLX41AAOJY2BQBqTaQbPzdZubH09fN
 bV1XMPl/1xoJW6mYQ1kkQLpmZsoQ5e6uiw/zResAprnbzi0et3pKaivU5
 yMBwQnKxpTs2Kxx+haVo+f/2VrZnOHIyhGCyiYEqItwflPUBtL8mE25kH
 /FKLzJ5KcmVqsbffJWoHrRxfCl7jwmY1uzsW6//Ezapmg2GRhvU5W3QZw
 yKrcN9Fqymo3EFTFfwed99LTtMroyjmxl3ZZYWab9o9joZoqI8IH1HLRA
 pn54U8Rn1Wmnz8F/jjXbl4Vi5jsUqkPQ5xX9yzMmRrt7zapDCCnCfm4/H w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="235119465"
X-IronPort-AV: E=Sophos;i="5.88,386,1635231600"; d="scan'208";a="235119465"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2022 15:26:30 -0800
X-IronPort-AV: E=Sophos;i="5.88,386,1635231600"; d="scan'208";a="706397078"
Received: from lab-ah.igk.intel.com ([10.91.215.196])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2022 15:26:24 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
To: linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, netdev <netdev@vger.kernel.org>
Subject: [PATCH v3 10/11] drm/i915: Correct type of wakeref variable
Date: Tue, 22 Feb 2022 00:25:41 +0100
Message-Id: <20220221232542.1481315-11-andrzej.hajda@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220221232542.1481315-1-andrzej.hajda@intel.com>
References: <20220221232542.1481315-1-andrzej.hajda@intel.com>
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

