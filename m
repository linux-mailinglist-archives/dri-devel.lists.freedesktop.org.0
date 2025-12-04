Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADAA9CA30E8
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 10:44:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0652610E8F5;
	Thu,  4 Dec 2025 09:44:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TGkivWV2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D913710E8F5;
 Thu,  4 Dec 2025 09:44:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B274E43446;
 Thu,  4 Dec 2025 09:44:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63216C4CEFB;
 Thu,  4 Dec 2025 09:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764841448;
 bh=zJYjkLwhKv4+fsVtmZeb/zzmVmKPn4lEwq6nm9Ahoxw=;
 h=From:To:Cc:Subject:Date:From;
 b=TGkivWV2vcASpTl6aBgXz7aIjmR9n6D6UN6qnFoWYFZ1RGKpnRVn+MDsaxvYbJ2hS
 PguutkyxDe6JeJj1VnOzysDUt/B7WzYLDAWIKhg4cJ0nlDbvEPiUfXrPlDLMvWaDFG
 mg/yJDHHPp0HNa6KQmDFze1c7eTnlcz3h/0QvUq4gZRnL/kpz75KZZvKn2TEMCQP2U
 6+G+c4xNaxPAeDerpnC6SliK6tbKdxZ3uK5wBTgNd4hTUD5HHFd9E61DRIaD0oXXsV
 6h8DzqRyHe6h0EH6WTu/uPnt1367WnXYnnWEB0/w8N4rLgiwP9Se2eDG/cO6Y/GuBr
 fY3ZnXiFS4qZg==
From: Arnd Bergmann <arnd@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Mika Kahola <mika.kahola@intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/i915/display: Avoid nonliteral printf format string
Date: Thu,  4 Dec 2025 10:43:51 +0100
Message-Id: <20251204094401.1029917-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
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

From: Arnd Bergmann <arnd@arndb.de>

pipe_config_mismatch() takes a printf-style format string and arguments,
not a constant string, so this trigers -Wformat warnings when they are
not disabled:

drivers/gpu/drm/i915/display/intel_display.c: In function 'pipe_config_cx0pll_mismatch':
drivers/gpu/drm/i915/display/intel_display.c:4997:9: error: format not a string literal and no format arguments [-Werror=format-security]
 4997 |         pipe_config_mismatch(p, fastset, crtc, name, chipname);
      |         ^~~~~~~~~~~~~~~~~~~~

drivers/gpu/drm/i915/display/intel_display.c: In function 'pipe_config_lt_phy_pll_mismatch':
drivers/gpu/drm/i915/display/intel_display.c:5027:9: error: format not a string literal and no format arguments [-Werror=format-security]
 5027 |         pipe_config_mismatch(p, fastset, crtc, name, chipname);
      |         ^~~~~~~~~~~~~~~~~~~~

Use either the string literal or the trivial "%s" format so the compiler can
prove this to be used correctly.

Fixes: 45fe957ae769 ("drm/i915/display: Add compare config for MTL+ platforms")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/i915/display/intel_display.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 7b4fd18c60e2..83025d5a4aa9 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -4987,7 +4987,7 @@ pipe_config_cx0pll_mismatch(struct drm_printer *p, bool fastset,
 	struct intel_display *display = to_intel_display(crtc);
 	char *chipname = a->use_c10 ? "C10" : "C20";
 
-	pipe_config_mismatch(p, fastset, crtc, name, chipname);
+	pipe_config_mismatch(p, fastset, crtc, name, "%s", chipname);
 
 	drm_printf(p, "expected:\n");
 	intel_cx0pll_dump_hw_state(display, a);
@@ -5022,9 +5022,8 @@ pipe_config_lt_phy_pll_mismatch(struct drm_printer *p, bool fastset,
 				const struct intel_lt_phy_pll_state *b)
 {
 	struct intel_display *display = to_intel_display(crtc);
-	char *chipname = "LTPHY";
 
-	pipe_config_mismatch(p, fastset, crtc, name, chipname);
+	pipe_config_mismatch(p, fastset, crtc, name, "LTPHY");
 
 	drm_printf(p, "expected:\n");
 	intel_lt_phy_dump_hw_state(display, a);
-- 
2.39.5

