Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1720A93BBB
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 19:14:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0FD810E21D;
	Fri, 18 Apr 2025 17:14:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="o3mhSmBh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52DCA10E228;
 Fri, 18 Apr 2025 17:14:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 59EBE4A5DC;
 Fri, 18 Apr 2025 17:14:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54A84C4CEEE;
 Fri, 18 Apr 2025 17:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744996442;
 bh=By9Z3/GOKSo9jX2bX288pITAL8QKbK/wJaL2Y5toa+E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=o3mhSmBhtFASWfZ2KgiYlj9LA0feGsF/AkkLLSTsVzOjwzhRui6ckoIjUD0clMiXV
 fVcpDewtRdZ2lQFbgsE5oAR1OjzVmZlAFoj2c1i8KWqlNlIzfcKumjn1KNwnNTowBV
 Mq8LrA+ihQjZuvb9Caac8zjHo/CEev2NA9mmovs/RUMVqb4XPwApFXqofzpVcmaYdC
 gw5a571GjZkGK8y3YELHQSSQsa6wDJvz1svYHuIV7o8sStTmIVhTqxqf52kc0ve+MA
 LM8/8lJEHe68SlMLEUBw5i6+ag3mnDP02Q93nP1fj1EhJWA0WuZtK1Bi/15McraAHq
 oDPIZqZRwM6LQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
 id DF494CE0F4D; Fri, 18 Apr 2025 10:14:01 -0700 (PDT)
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
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v2 ratelimit 04/14] drm/i915: Avoid open-coded use of
 ratelimit_state structure's ->missed field
Date: Fri, 18 Apr 2025 10:13:49 -0700
Message-Id: <20250418171359.1187719-4-paulmck@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <4edcefb0-cdbd-4422-8a08-ffc091de158e@paulmck-laptop>
References: <4edcefb0-cdbd-4422-8a08-ffc091de158e@paulmck-laptop>
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
ratelimit_state structure's ->missed field, which work, but which also
makes it more difficult to change this field.  Therefore, make use of
the ratelimit_state_get_miss() function instead of directly accessing
the ->missed field.

Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
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

