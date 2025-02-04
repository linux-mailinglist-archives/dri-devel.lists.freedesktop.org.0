Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 301D8A27521
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 16:00:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B95610E686;
	Tue,  4 Feb 2025 15:00:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QpxfiVff";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9D7710E686
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 15:00:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 47ACA5C6AB7;
 Tue,  4 Feb 2025 14:59:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A9B5C4CEE4;
 Tue,  4 Feb 2025 15:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738681213;
 bh=lKHEStTN+TqLy8+wMPj1wvgKR413ZvIK95KvL1pe7fU=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=QpxfiVffb+KOD+k91m4xFFZlV+9SKCWKA6eauj5L4qTkzdy7vABxu5foVl743+d2e
 BvzkaUmu4OqwseL+zgizK0avAT/59EpHPv72dv+iO+s/3FWmc2hqM+BLvinb0TQDoj
 Cs++7FP/Rtz9A8tGjMgTQPTHkPhLAiCYFXGgtoP/2Dpkq6T5K7W6PFwnS2U+Y0KLE7
 lh3suOkoborzYgTiQ0BkUOg4/mnnQZqYXfty20wu/IKtPSc1eQodtY99crmxWyls1W
 YNAKv2QzS4jSR51MV5jTxcEDKbH9uY1eDY0J8vvxh2PlTCo+mr1iUu83kjsDASy4zp
 EyYwRJ00jEkSw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 04 Feb 2025 15:57:52 +0100
Subject: [PATCH v2 24/35] drm/atomic-helper: Change parameter name of
 drm_atomic_helper_cleanup_planes()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-bridge-connector-v2-24-35dd6c834e08@kernel.org>
References: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
In-Reply-To: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2219; i=mripard@kernel.org;
 h=from:subject:message-id; bh=lKHEStTN+TqLy8+wMPj1wvgKR413ZvIK95KvL1pe7fU=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOmLtD5/6ehZc64nisnk2ObLF+K2fpktcUBE+p+l+xRGU
 5eYl3IHO6ayMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBE1JQYq9mEGTpVVqqIZDZ1
 /GEwe7xg8wvlR0tXtEpGVE1My0121Slgntda7LYtJvd0//7MgqBQxvrAmJ1t929z639d3br1jIZ
 3YGa3J6OCxK6yjF0T6nhfPuKrOO2cm2pRX6d2sTXhMWd+KgA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

drm_atomic_helper_cleanup_planes() is one of the final part of a commit,
and will free up all plane resources used in the previous commit.  It
takes the drm_atomic_state being committed as a parameter.

However, that parameter name is called (and documented) as old_state,
which is pretty confusing. Let's rename that variable as state.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_helper.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 54df4f792dca8006a855ccc5fd4e279d111480d0..3e6c5992fed09f5962e74844d360193c53915c88 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -2977,28 +2977,28 @@ drm_atomic_helper_disable_planes_on_crtc(struct drm_crtc_state *old_crtc_state,
 EXPORT_SYMBOL(drm_atomic_helper_disable_planes_on_crtc);
 
 /**
  * drm_atomic_helper_cleanup_planes - cleanup plane resources after commit
  * @dev: DRM device
- * @old_state: atomic state object with old state structures
+ * @state: atomic state object being committed
  *
  * This function cleans up plane state, specifically framebuffers, from the old
- * configuration. Hence the old configuration must be perserved in @old_state to
+ * configuration. Hence the old configuration must be perserved in @state to
  * be able to call this function.
  *
  * This function may not be called on the new state when the atomic update
  * fails at any point after calling drm_atomic_helper_prepare_planes(). Use
  * drm_atomic_helper_unprepare_planes() in this case.
  */
 void drm_atomic_helper_cleanup_planes(struct drm_device *dev,
-				      struct drm_atomic_state *old_state)
+				      struct drm_atomic_state *state)
 {
 	struct drm_plane *plane;
 	struct drm_plane_state *old_plane_state;
 	int i;
 
-	for_each_old_plane_in_state(old_state, plane, old_plane_state, i) {
+	for_each_old_plane_in_state(state, plane, old_plane_state, i) {
 		const struct drm_plane_helper_funcs *funcs = plane->helper_private;
 
 		if (funcs->cleanup_fb)
 			funcs->cleanup_fb(plane, old_plane_state);
 	}

-- 
2.48.0

