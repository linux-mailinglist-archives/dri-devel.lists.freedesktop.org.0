Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 991B26A1F9B
	for <lists+dri-devel@lfdr.de>; Fri, 24 Feb 2023 17:26:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9F3F10EC68;
	Fri, 24 Feb 2023 16:26:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4946B10EC6D;
 Fri, 24 Feb 2023 16:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677255997; x=1708791997;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=tWIS1fDOoAR997SIfPLRFSn5hDKzRRgGJcW8CcVa3mw=;
 b=KPcJXU1ZJW5oJoR6vD2w+0IIlNFxgbYlXvtJkxV2Yy9LhuBDxDiHLxhN
 6YmzBezt1l41ReS4PKGHr0M8yaib8pm0tKWixavhuMfO00KgB+AI8JN8O
 +ll6iP9/PxRqW3RIj9nwT80sEJEgDDc/VwXClwuUA9/7F5zzY7a5ADLXI
 TzQhwzOLWkw7hRqv4T+Zwc8BME4E/FyVHtM0ncEamdAMO6FLzF4Fy5Lpi
 MZtvcK+8xD6XTd+wRI4NFTHLDBwOUdXAa1H8NR8/OgmGZO5wsxEAjQiKK
 kshpRwdqvUxi5UNu6pd5SwcjG+x/5i1TZ/4SdwmQlnXwe19caWaoQ1fHI g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="317273430"
X-IronPort-AV: E=Sophos;i="5.97,325,1669104000"; d="scan'208";a="317273430"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2023 08:26:26 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="705321998"
X-IronPort-AV: E=Sophos;i="5.97,325,1669104000"; d="scan'208";a="705321998"
Received: from lab-ah.igk.intel.com ([10.102.42.211])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2023 08:26:22 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Fri, 24 Feb 2023 17:25:42 +0100
Subject: [PATCH 3/3] drm/i915: Correct type of wakeref variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230224-track_gt-v1-3-0222096fcdc6@intel.com>
References: <20230224-track_gt-v1-0-0222096fcdc6@intel.com>
In-Reply-To: <20230224-track_gt-v1-0-0222096fcdc6@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.11.1
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Chris Wilson <chris.p.wilson@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Wakeref has dedicated type. Assumption it will be int
compatible forever is incorrect.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 978820f8697059..c35f551193c9ad 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -3235,7 +3235,7 @@ static void destroyed_worker_func(struct work_struct *w)
 	struct intel_guc *guc = container_of(w, struct intel_guc,
 					     submission_state.destroyed_worker);
 	struct intel_gt *gt = guc_to_gt(guc);
-	int tmp;
+	intel_wakeref_t tmp;
 
 	with_intel_gt_pm(gt, tmp)
 		deregister_destroyed_contexts(guc);

-- 
2.34.1
