Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A13D0A27509
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 15:59:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E0B610E67A;
	Tue,  4 Feb 2025 14:59:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mA2oNx9R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A45F10E67C
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 14:59:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DF2305C6A78;
 Tue,  4 Feb 2025 14:58:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BFF1C4CEDF;
 Tue,  4 Feb 2025 14:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738681141;
 bh=Ycz8KszU5PhE6Y06PY1gRYTNUqmaJHlgy7DhraBLhtk=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=mA2oNx9RnZhykWrDK3Scgh0mBKlkWA7Wqc7o5e5ytvJdXmCmpV1NV14Xpf+WTO2Xd
 z/51t56tPXnAomZi4s2KKcfWBnOhAu1dT+j4aCtm+M2D9LIfCqQhFG7Y+VtmDX8/+9
 Pfum0xO4fZQLNMAIMdq6tpsIX9FvuWSvKP87EOlr9nP58AWcuGUHXf/Ym+fMozWxTF
 9I9flEwjeW+O6B20thXRT/sajlBfqPOecpP5JZSZ8mxd74g8N40QpcppyHfgPrwibk
 aSXxIvR+6rDUN1YWh4jyCyAEWCAcZ8q2uuXfliZVxnOvwFY5Y8YoLPhqH1x0L49poY
 pUfesxXhcsH2g==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 04 Feb 2025 15:57:37 +0100
Subject: [PATCH v2 09/35] drm/atomic-helper: Change parameter name of
 drm_atomic_helper_commit_tail_rpm()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-bridge-connector-v2-9-35dd6c834e08@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2531; i=mripard@kernel.org;
 h=from:subject:message-id; bh=Ycz8KszU5PhE6Y06PY1gRYTNUqmaJHlgy7DhraBLhtk=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOmLtN5s3fGfY6fPoy/ss61PJ56K95tu5u4kHn6mIM0xu
 v5MUsmFjqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjCR5qeM9d59MRe5uj5J6KhV
 WVcWrdHz5zjvl62hsO9pWm3l7Lbmgi/lcQmxVoe8i0/PU7He+FeQseHyv0nOzLsfcWmeXF9w4Zg
 OF3Nv23O7Q+anxbqFi4sfZFkbNXfkscydWXRZ4De/uJW6PgA=
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

drm_atomic_helper_commit_tail_rpm() is the final part of an atomic
commit, and is given the state being committed as a parameter.

However, that parameter is named old_state, but documented as the "new
modeset state" which is all super confusing.

Let's rename that parameter to state.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_helper.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index c80d2ee0247a5316dd103d6178c7fa96eb366c9a..cb08fda752c65d6d0c4388bb4bf7054e74a053a8 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1789,36 +1789,36 @@ void drm_atomic_helper_commit_tail(struct drm_atomic_state *state)
 }
 EXPORT_SYMBOL(drm_atomic_helper_commit_tail);
 
 /**
  * drm_atomic_helper_commit_tail_rpm - commit atomic update to hardware
- * @old_state: new modeset state to be committed
+ * @state: new modeset state to be committed
  *
  * This is an alternative implementation for the
  * &drm_mode_config_helper_funcs.atomic_commit_tail hook, for drivers
  * that support runtime_pm or need the CRTC to be enabled to perform a
  * commit. Otherwise, one should use the default implementation
  * drm_atomic_helper_commit_tail().
  */
-void drm_atomic_helper_commit_tail_rpm(struct drm_atomic_state *old_state)
+void drm_atomic_helper_commit_tail_rpm(struct drm_atomic_state *state)
 {
-	struct drm_device *dev = old_state->dev;
+	struct drm_device *dev = state->dev;
 
-	drm_atomic_helper_commit_modeset_disables(dev, old_state);
+	drm_atomic_helper_commit_modeset_disables(dev, state);
 
-	drm_atomic_helper_commit_modeset_enables(dev, old_state);
+	drm_atomic_helper_commit_modeset_enables(dev, state);
 
-	drm_atomic_helper_commit_planes(dev, old_state,
+	drm_atomic_helper_commit_planes(dev, state,
 					DRM_PLANE_COMMIT_ACTIVE_ONLY);
 
-	drm_atomic_helper_fake_vblank(old_state);
+	drm_atomic_helper_fake_vblank(state);
 
-	drm_atomic_helper_commit_hw_done(old_state);
+	drm_atomic_helper_commit_hw_done(state);
 
-	drm_atomic_helper_wait_for_vblanks(dev, old_state);
+	drm_atomic_helper_wait_for_vblanks(dev, state);
 
-	drm_atomic_helper_cleanup_planes(dev, old_state);
+	drm_atomic_helper_cleanup_planes(dev, state);
 }
 EXPORT_SYMBOL(drm_atomic_helper_commit_tail_rpm);
 
 static void commit_tail(struct drm_atomic_state *state)
 {

-- 
2.48.0

