Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DB09BA5FC
	for <lists+dri-devel@lfdr.de>; Sun,  3 Nov 2024 15:49:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B88DC10E14A;
	Sun,  3 Nov 2024 14:49:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="K3/cR13p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88CAC10E14A;
 Sun,  3 Nov 2024 14:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=Lb2ng7/SixEzOHLmaoTedF/AVYgSm6k/zzQSWP85gl8=; b=K3/cR13pAWd0yOw7
 sdLeIVszlvV+fbSKXFtUPUa4Z1mNRU/1VcnyxXwIsGsjn8iNLFd5yhv/IhMuTt5F2QjA1oWVhcwWv
 kg9RgDX+VXYtjZ0jsqOjVw5Y8Xt9fFRYisxT5AkmB7D46pOXUePaPcxkD+WSOh1hH4B6kZR/xSMcA
 7nJy+WOo0UqjecwcLM29oL8rKVIB1cOeJtQudZlyjYYJFarMq+paDAqP1vLpDlt0V0sJuJKeK667r
 71zPlvajXbK7P+xzKIJ5cwzOwGnypaRa9EeIgm5eb7B1Ure/R5R+6v0NUDwXZuj1rn0Wi/GIp5eEX
 G89wurU1zmtaYrpZAg==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1t7bv7-00FAyz-1F;
 Sun, 03 Nov 2024 14:49:37 +0000
From: linux@treblig.org
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tursulin@ursulin.net, airlied@gmail.com,
 simona@ffwll.ch
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] drm/i915/gt: Remove unused
 execlists_unwind_incomplete_requests
Date: Sun,  3 Nov 2024 14:49:36 +0000
Message-ID: <20241103144936.238116-1-linux@treblig.org>
X-Mailer: git-send-email 2.47.0
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

From: "Dr. David Alan Gilbert" <linux@treblig.org>

execlists_unwind_incomplete_requests() is unused since 2021's
commit eb5e7da736f3 ("drm/i915/guc: Reset implementation for new GuC
interface")

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/gpu/drm/i915/gt/intel_engine.h               | 3 ---
 drivers/gpu/drm/i915/gt/intel_execlists_submission.c | 9 ---------
 2 files changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine.h b/drivers/gpu/drm/i915/gt/intel_engine.h
index 40269e4c1e31..325da0414d94 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine.h
@@ -126,9 +126,6 @@ execlists_active(const struct intel_engine_execlists *execlists)
 	return active;
 }
 
-struct i915_request *
-execlists_unwind_incomplete_requests(struct intel_engine_execlists *execlists);
-
 static inline u32
 intel_read_status_page(const struct intel_engine_cs *engine, int reg)
 {
diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index 72090f52fb85..4a80ffa1b962 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -405,15 +405,6 @@ __unwind_incomplete_requests(struct intel_engine_cs *engine)
 	return active;
 }
 
-struct i915_request *
-execlists_unwind_incomplete_requests(struct intel_engine_execlists *execlists)
-{
-	struct intel_engine_cs *engine =
-		container_of(execlists, typeof(*engine), execlists);
-
-	return __unwind_incomplete_requests(engine);
-}
-
 static void
 execlists_context_status_change(struct i915_request *rq, unsigned long status)
 {
-- 
2.47.0

