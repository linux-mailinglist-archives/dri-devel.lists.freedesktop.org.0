Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C35AB068D
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 01:33:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D009F10E22D;
	Thu,  8 May 2025 23:33:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qp/+cd0a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18D1A10E222;
 Thu,  8 May 2025 23:33:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 028424ACF0;
 Thu,  8 May 2025 23:33:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5428C4CEF0;
 Thu,  8 May 2025 23:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746747216;
 bh=qrbtE4GJAc5CkkZvuRY2A4Vna57jDG+6dB5+Nw5K9to=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qp/+cd0aLdjY1AeppBROmJzDS1w0IVP2u2f2XHj9own9KkNr7DK5VW0NKgXXsPoaK
 B/CA+Z74yAfX6G/l8l20eG6PuYkkPlDJNRd6JYbtVLw49138zf6KlE0tvlMYzBGg1O
 edvUw6YmBtZD2UEu99Gug1fEjOwN6uEX9qR8UCTF1ld2S2Tx0WXYVLjI3R1Rcwq07c
 sEior2X/RNuB+RQiKzlE9LUxAOHv5Cvoz/nYgAnFYAl/C4rjqUviBheNuDrBbYD0uy
 rERZVJk2KKAr7tphqTCnUj2b2rbSft9z0VSm6PwdQXo1UGK0piSs9IMCMJbPPVzCDE
 /qKV4eVHKXUNw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
 id 628A6CE11D4; Thu,  8 May 2025 16:33:36 -0700 (PDT)
From: "Paul E. McKenney" <paulmck@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: kernel-team@meta.com, Andrew Morton <akpm@linux-foundation.org>,
 Kuniyuki Iwashima <kuniyu@amazon.com>, Mateusz Guzik <mjguzik@gmail.com>,
 Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
 John Ogness <john.ogness@linutronix.de>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Jon Pan-Doh <pandoh@google.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Karolina Stolarek <karolina.stolarek@oracle.com>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Jani Nikula <jani.nikula@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v5 03/21] drm/i915: Avoid open-coded use of ratelimit_state
 structure's ->missed field
Date: Thu,  8 May 2025 16:33:17 -0700
Message-Id: <20250508233335.1996059-3-paulmck@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <1bcf7d5e-b89c-4118-b872-c8896bdbdc19@paulmck-laptop>
References: <1bcf7d5e-b89c-4118-b872-c8896bdbdc19@paulmck-laptop>
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

The i915_oa_stream_destroy() function directly accesses the
ratelimit_state structure's ->missed field, which works, but which also
makes it more difficult to change this field.  Therefore, make use of
the ratelimit_state_get_miss() function instead of directly accessing
the ->missed field.

Link: https://lore.kernel.org/all/fbe93a52-365e-47fe-93a4-44a44547d601@paulmck-laptop/
Link: https://lore.kernel.org/all/20250423115409.3425-1-spasswolf@web.de/
Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Reviewed-by: Petr Mladek <pmladek@suse.com>
Acked-by: Jani Nikula <jani.nikula@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: <intel-gfx@lists.freedesktop.org>
Cc: <dri-devel@lists.freedesktop.org>
---
 drivers/gpu/drm/i915/i915_perf.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
index de0b413600a15..1658f1246c6fa 100644
--- a/drivers/gpu/drm/i915/i915_perf.c
+++ b/drivers/gpu/drm/i915/i915_perf.c
@@ -1666,6 +1666,7 @@ static void i915_oa_stream_destroy(struct i915_perf_stream *stream)
 	struct i915_perf *perf = stream->perf;
 	struct intel_gt *gt = stream->engine->gt;
 	struct i915_perf_group *g = stream->engine->oa_group;
+	int m;
 
 	if (WARN_ON(stream != g->exclusive_stream))
 		return;
@@ -1690,10 +1691,9 @@ static void i915_oa_stream_destroy(struct i915_perf_stream *stream)
 	free_oa_configs(stream);
 	free_noa_wait(stream);
 
-	if (perf->spurious_report_rs.missed) {
-		gt_notice(gt, "%d spurious OA report notices suppressed due to ratelimiting\n",
-			  perf->spurious_report_rs.missed);
-	}
+	m = ratelimit_state_get_miss(&perf->spurious_report_rs);
+	if (m)
+		gt_notice(gt, "%d spurious OA report notices suppressed due to ratelimiting\n", m);
 }
 
 static void gen7_init_oa_buffer(struct i915_perf_stream *stream)
-- 
2.40.1

