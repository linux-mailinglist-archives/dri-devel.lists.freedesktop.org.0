Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4218EA27507
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 15:59:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B53F810E675;
	Tue,  4 Feb 2025 14:59:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QBi8o8qy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B95310E675
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 14:58:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3A562A4281B;
 Tue,  4 Feb 2025 14:57:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E35CFC4CEE2;
 Tue,  4 Feb 2025 14:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738681138;
 bh=u0tZwRYBi8FRt8hfCImUBhbGvy1Wpg7z7MXlXT4YEzs=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=QBi8o8qy6Luz4OVyRXDFu90gh0UG5ifweuQZcUkUBp1lNwUPIoGg8YuWG1942ITiX
 pofLK0KdSmnHt/qNu9mlc0fBMe4rHAnMqn7tHvlQb8qzqeN6EQoNm+pzNaMbP0zg5l
 5B8CGCpmEXY9txjnjnzVY+azXUZcnW32uz8HzEL5t7ANHsdzc97uReQewvjZd4EmLX
 bSdg3tqHqW0UzPD9xWs2Q/utXbhW/nT9lqNt/0Me7s7gFKIj8pzulPxO5MfyQiFdL7
 99rJxI9zmMNOPFzSf+36l3ULc2haRy3e11kbskYwWEqsbu4sgf6aEBHbAlpo1ibDRP
 EW2Sdxcxfntrw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 04 Feb 2025 15:57:36 +0100
Subject: [PATCH v2 08/35] drm/atomic-helper: Change parameter name of
 drm_atomic_helper_commit_tail()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-bridge-connector-v2-8-35dd6c834e08@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2624; i=mripard@kernel.org;
 h=from:subject:message-id; bh=u0tZwRYBi8FRt8hfCImUBhbGvy1Wpg7z7MXlXT4YEzs=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOmLtN6EG79ufiNhtN3lc9dUC/aNmwwnGP1fYuGY9Ktxw
 aXD/rlqHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAiB2YzVrMmTqidP/drxvyY
 WS89/ydtjap13LryZ38A+35z4dv9bcJHNMo+C63+pL/nq/ZnjR2SKxirmP5/flnh0yRe2tPFJf5
 +xouCwy8UvqfZcq25lLsifMHCY90bmIO/bw6/m5wxR5A7WmQaAA==
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

drm_atomic_helper_commit_tail() is the final part of an atomic commit,
and is given a parameter with the drm_atomic_state being committed.

However, that parameter name is called (and documented) as old_state,
which is pretty confusing. Let's rename that variable as state.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_helper.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 48dc4f18e757549b67940cc5ca4d76812ef13985..c80d2ee0247a5316dd103d6178c7fa96eb366c9a 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1756,38 +1756,38 @@ void drm_atomic_helper_wait_for_flip_done(struct drm_device *dev,
 }
 EXPORT_SYMBOL(drm_atomic_helper_wait_for_flip_done);
 
 /**
  * drm_atomic_helper_commit_tail - commit atomic update to hardware
- * @old_state: atomic state object with old state structures
+ * @state: atomic state object being committed
  *
  * This is the default implementation for the
  * &drm_mode_config_helper_funcs.atomic_commit_tail hook, for drivers
  * that do not support runtime_pm or do not need the CRTC to be
  * enabled to perform a commit. Otherwise, see
  * drm_atomic_helper_commit_tail_rpm().
  *
  * Note that the default ordering of how the various stages are called is to
  * match the legacy modeset helper library closest.
  */
-void drm_atomic_helper_commit_tail(struct drm_atomic_state *old_state)
+void drm_atomic_helper_commit_tail(struct drm_atomic_state *state)
 {
-	struct drm_device *dev = old_state->dev;
+	struct drm_device *dev = state->dev;
 
-	drm_atomic_helper_commit_modeset_disables(dev, old_state);
+	drm_atomic_helper_commit_modeset_disables(dev, state);
 
-	drm_atomic_helper_commit_planes(dev, old_state, 0);
+	drm_atomic_helper_commit_planes(dev, state, 0);
 
-	drm_atomic_helper_commit_modeset_enables(dev, old_state);
+	drm_atomic_helper_commit_modeset_enables(dev, state);
 
-	drm_atomic_helper_fake_vblank(old_state);
+	drm_atomic_helper_fake_vblank(state);
 
-	drm_atomic_helper_commit_hw_done(old_state);
+	drm_atomic_helper_commit_hw_done(state);
 
-	drm_atomic_helper_wait_for_vblanks(dev, old_state);
+	drm_atomic_helper_wait_for_vblanks(dev, state);
 
-	drm_atomic_helper_cleanup_planes(dev, old_state);
+	drm_atomic_helper_cleanup_planes(dev, state);
 }
 EXPORT_SYMBOL(drm_atomic_helper_commit_tail);
 
 /**
  * drm_atomic_helper_commit_tail_rpm - commit atomic update to hardware

-- 
2.48.0

