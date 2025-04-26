Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FD0A9D835
	for <lists+dri-devel@lfdr.de>; Sat, 26 Apr 2025 08:14:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFE4910E1D5;
	Sat, 26 Apr 2025 06:14:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kItm1LyY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75A9910E1D5;
 Sat, 26 Apr 2025 06:14:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id BBE85A4D10C;
 Sat, 26 Apr 2025 06:08:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 588B0C4CEE2;
 Sat, 26 Apr 2025 06:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745648042;
 bh=tgnkQjbME95yyx26he3+PrzzkQMxy8GR11SY9HIto2Y=;
 h=From:To:Cc:Subject:Date:From;
 b=kItm1LyY5xe3XMkcah/akXlxaFMBxPlQEXLELtW+ZTB0PCEvXfhO7nJD8tqW5xCPq
 RYXNKKUgo5CtfJoLq5RaUJt7spV6y+vpcO7sqgjjFZ5ssDGtWAQRA66eJwe0kYNjDi
 LrJGf7qcqOJr6sLFCbTXk3+0PeW/K6V8DP2sY3vP9IToZRzEECjPKXVOhlzQbgx/uW
 lFnxwqR/CDp5o7hY6+en4WlUXpAFmYzCAuRy0si4c7U5Y4RFIuJ1i/Xw0LgAmwmBS9
 HXaU7pSvkQTwXKGCHOwdJScRIlLhlhXdVGPkGvQJSN65n0ItpcjG+JHFv0KX4H5TYy
 PxESg/+v7ZFxg==
From: Kees Cook <kees@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Kees Cook <kees@kernel.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matt Roper <matthew.d.roper@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Gnattu OC <gnattuoc@me.com>, Nitin Gote <nitin.r.gote@intel.com>,
 Ranu Maurya <ranu.maurya@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Angus Chen <angus.chen@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Yu Jiaoliang <yujiaoliang@vivo.com>,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: [PATCH] drm/i915/gt: Remove const from struct i915_wa list allocation
Date: Fri, 25 Apr 2025 23:13:58 -0700
Message-Id: <20250426061357.work.749-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1895; i=kees@kernel.org;
 h=from:subject:message-id; bh=tgnkQjbME95yyx26he3+PrzzkQMxy8GR11SY9HIto2Y=;
 b=owGbwMvMwCVmps19z/KJym7G02pJDBk8lcvipJa8W+WvvlcpZW4B19WOZr7wTpaktT2P8/bYz
 1qi0n2xo5SFQYyLQVZMkSXIzj3OxeNte7j7XEWYOaxMIEMYuDgFYCKzeRgZHqX/1Z20lO/fpmST
 CSeKjqsuzK5R+NfpXLpwx6T9HaY+gYwM+4K9Di5fy3b3GQN3+v+q1KpHB+aUti25s6tcaGI61+M
 SBgA=
X-Developer-Key: i=kees@kernel.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
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

In preparation for making the kmalloc family of allocators type aware,
we need to make sure that the returned type from the allocation matches
the type of the variable being assigned. (Before, the allocator would
always return "void *", which can be implicitly cast to any pointer type.)

The assigned type is "struct i915_wa *". The returned type, while
technically matching, will be const qualified. As there is no general
way to remove const qualifiers, adjust the allocation type to match
the assignment.

Signed-off-by: Kees Cook <kees@kernel.org>
---
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: <intel-gfx@lists.freedesktop.org>
Cc: <dri-devel@lists.freedesktop.org>
---
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 116683ebe074..b37e400f74e5 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -156,7 +156,7 @@ static void _wa_add(struct i915_wa_list *wal, const struct i915_wa *wa)
 	if (IS_ALIGNED(wal->count, grow)) { /* Either uninitialized or full. */
 		struct i915_wa *list;
 
-		list = kmalloc_array(ALIGN(wal->count + 1, grow), sizeof(*wa),
+		list = kmalloc_array(ALIGN(wal->count + 1, grow), sizeof(*list),
 				     GFP_KERNEL);
 		if (!list) {
 			drm_err(&i915->drm, "No space for workaround init!\n");
-- 
2.34.1

