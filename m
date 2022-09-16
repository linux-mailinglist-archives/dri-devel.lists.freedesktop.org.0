Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2905BB11C
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 18:34:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2083B10E4E0;
	Fri, 16 Sep 2022 16:34:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9766810E21D;
 Fri, 16 Sep 2022 16:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663346024; x=1694882024;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mHI24FmnqlV4Cs36rLp+0uhjn0jhUt841zuGdrfWm4Q=;
 b=Lgnhu97MEntLMLwSTvdtOMsBP8+dY6DmwJ8nnSBiY71rv9N556pu0Rv9
 fVJbzDYbRdMkr5QzBfoK++CKCF1M5MvIVRDrhNJVBbmH/WEmi5OXOXFDP
 axFJpDdk/OfprZLcA20Jubs80YZ87giqETUF46WDtoLleLwzpG7U7zLcP
 9xbFRWa/ONkheWew4cNeKB8l5/pV6v2D9v7p5HkCx10ligw8NZP1NvWot
 yokjvRPYVL3c4gX+2+7VgJforCjW/9JnsBYb9Vm23AOPE6cgLbbTvwBHa
 j8XK5wVzoufAjqRRB5iQT0LUKiWNaGsCJAQn6DxDxj6Ku5gjCMg/9mtwi A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10472"; a="362990794"
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; d="scan'208";a="362990794"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2022 09:33:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; d="scan'208";a="613308406"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by orsmga007.jf.intel.com with SMTP; 16 Sep 2022 09:33:40 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 16 Sep 2022 19:33:39 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/4] drm/i915: Don't reuse commit_work for the cleanup
Date: Fri, 16 Sep 2022 19:33:29 +0300
Message-Id: <20220916163331.6849-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220916163331.6849-1-ville.syrjala@linux.intel.com>
References: <20220916163331.6849-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Currently we reuse the commit_work for a later cleanup step.
Let's not do that so that atomic ioctl handler won't accidentally
wait for the cleanup work when it really wants to just wait on the
commit_tail() part. We'll just add another work struct for the
cleanup.

Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Simon Ser <contact@emersion.fr>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: Jonas Ådahl <jadahl@gmail.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c       | 6 +++---
 drivers/gpu/drm/i915/display/intel_display_types.h | 1 +
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index dd008ba8afe3..cd617046e0ee 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -7422,7 +7422,7 @@ static void intel_cleanup_dsbs(struct intel_atomic_state *state)
 static void intel_atomic_cleanup_work(struct work_struct *work)
 {
 	struct intel_atomic_state *state =
-		container_of(work, struct intel_atomic_state, base.commit_work);
+		container_of(work, struct intel_atomic_state, cleanup_work);
 	struct drm_i915_private *i915 = to_i915(state->base.dev);
 
 	intel_cleanup_dsbs(state);
@@ -7643,8 +7643,8 @@ static void intel_atomic_commit_tail(struct intel_atomic_state *state)
 	 * schedule point (cond_resched()) here anyway to keep latencies
 	 * down.
 	 */
-	INIT_WORK(&state->base.commit_work, intel_atomic_cleanup_work);
-	queue_work(system_highpri_wq, &state->base.commit_work);
+	INIT_WORK(&state->cleanup_work, intel_atomic_cleanup_work);
+	queue_work(system_highpri_wq, &state->cleanup_work);
 }
 
 static void intel_atomic_commit_work(struct work_struct *work)
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 298d00a11f47..971e2b1e1b26 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -655,6 +655,7 @@ struct intel_atomic_state {
 
 	struct i915_sw_fence commit_ready;
 
+	struct work_struct cleanup_work;
 	struct llist_node freed;
 };
 
-- 
2.35.1

