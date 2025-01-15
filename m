Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0589A12D24
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 22:05:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 038C110E7E3;
	Wed, 15 Jan 2025 21:05:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dho65txb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF3BC10E7E3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 21:05:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A9D5D5C5E98;
 Wed, 15 Jan 2025 21:05:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF1E6C4CED1;
 Wed, 15 Jan 2025 21:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736975156;
 bh=CISyuLYjgS5U6UJVRsrpY706ypFUXAyfrCeZtDNy+ro=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=dho65txb30mOBY+FLFNqdz4tizHDyRM/2pCJyDPZTqCxXmR2tjXifulG5lJfrdBGm
 +B+blaj1S/JU5oWgiplprXOd0wr7B1FRo42bedNcd20FOPvOCNrfbBp+ZZb96PnOQo
 TUP3hPGMU17UPWvEsPH/Cpa0iEafqHvE0k/snTGGPa6pv+bjIJe+9C3Bu93t1Yk3X/
 +FLL6P6WRH+S98/GBOCC+O1Xrebf0oQhzn+2m/ybOrYXJjnODT3ExD2WG8hLzdO8IC
 a28wohOV/7/8b81ZcIMR594mZg8a5YwG1YyZZiVqoZWMj8gN/APMH3ztwZpJEB7qiH
 Rwyr3Y7NQzq7Q==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 15 Jan 2025 22:05:12 +0100
Subject: [PATCH 05/29] drm/atomic-helper: Change parameter name of
 drm_atomic_helper_modeset_disables()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-bridge-connector-v1-5-9a2fecd886a6@kernel.org>
References: <20250115-bridge-connector-v1-0-9a2fecd886a6@kernel.org>
In-Reply-To: <20250115-bridge-connector-v1-0-9a2fecd886a6@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2377; i=mripard@kernel.org;
 h=from:subject:message-id; bh=CISyuLYjgS5U6UJVRsrpY706ypFUXAyfrCeZtDNy+ro=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOkdyuJb+LfHB1yo0FxvdMe7p9dGdYE486blYhUhO7gWK
 T7tSzvRMZWFQZiTQVZMkeWJTNjp5e2LqxzsV/6AmcPKBDKEgYtTACZiKcZYKzc39rLWNHvBksUd
 VfHx06U3l9p9XG1c5h3zIbt6446eCXfcDuTX3CnsXbSiYIuqotosxobrJl9/XbDw7bjZpCug43D
 wc7jVwfB1H/olWgwWqzFO/SnAe/bQCTONfBapvXI7vEJ4tgMA
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

drm_atomic_helper_modeset_disables() disables all the outputs affected
by a commit. It takes the drm_atomic_state being committed as a
parameter.

However, that parameter name is called (and documented) as old_state,
which is pretty confusing. Let's rename that variable as state.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_helper.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index cb08fda752c65d6d0c4388bb4bf7054e74a053a8..d5129de2278d5f62c136f8b6c831f903d9e53927 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1427,11 +1427,11 @@ crtc_set_mode(struct drm_device *dev, struct drm_atomic_state *old_state)
 }
 
 /**
  * drm_atomic_helper_commit_modeset_disables - modeset commit to disable outputs
  * @dev: DRM device
- * @old_state: atomic state object with old state structures
+ * @state: atomic state object being committed
  *
  * This function shuts down all the outputs that need to be shut down and
  * prepares them (if required) with the new mode.
  *
  * For compatibility with legacy CRTC helpers this should be called before
@@ -1439,18 +1439,18 @@ crtc_set_mode(struct drm_device *dev, struct drm_atomic_state *old_state)
  * does. But drivers with different needs can group the modeset commits together
  * and do the plane commits at the end. This is useful for drivers doing runtime
  * PM since planes updates then only happen when the CRTC is actually enabled.
  */
 void drm_atomic_helper_commit_modeset_disables(struct drm_device *dev,
-					       struct drm_atomic_state *old_state)
+					       struct drm_atomic_state *state)
 {
-	disable_outputs(dev, old_state);
+	disable_outputs(dev, state);
 
-	drm_atomic_helper_update_legacy_modeset_state(dev, old_state);
-	drm_atomic_helper_calc_timestamping_constants(old_state);
+	drm_atomic_helper_update_legacy_modeset_state(dev, state);
+	drm_atomic_helper_calc_timestamping_constants(state);
 
-	crtc_set_mode(dev, old_state);
+	crtc_set_mode(dev, state);
 }
 EXPORT_SYMBOL(drm_atomic_helper_commit_modeset_disables);
 
 static void drm_atomic_helper_commit_writebacks(struct drm_device *dev,
 						struct drm_atomic_state *old_state)

-- 
2.47.1

