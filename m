Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B3DA12D21
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 22:05:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2170210E7E4;
	Wed, 15 Jan 2025 21:05:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HuyL8X67";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AAF810E7E3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 21:05:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 81BB4A42523;
 Wed, 15 Jan 2025 21:04:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E28C1C4CED1;
 Wed, 15 Jan 2025 21:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736975150;
 bh=LYEhfKiFb3CUu2Y0XG8MQHtGxB63YAoqR4SNayCeLEw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=HuyL8X67lHaMg3QzkZ+S2IcqG5bq7H6ZKlVTLrZ2pDfegot/+DeezP7oNXPiiEmXv
 AQwYJtEALWWaNZ/Z7ne2Cto5rZP6o8GZsiHzA61EqMALYOiPKZMWyqV7ApkQS/SD6k
 jIk/Z/NaGNwZj/SHUkH0zkMkLy0Jaub6X9y6GZ/EUzCGiaAxyx5JOfzRrWCOXXxNlG
 a1+MlkwpADg0lcX+5ZaWxbP+GlS+SrYboqT31cmeoLPvQygua3My9aL6pRn9ag/Ef3
 ejTfCpQ5/5zNErda0dbwLMrRnpm+AcHS8ODyuzDWT/K4eo7jsVw6r9SUNdVUe3W8wX
 zC/z6jrT77atA==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 15 Jan 2025 22:05:10 +0100
Subject: [PATCH 03/29] drm/atomic-helper: Change parameter name of
 drm_atomic_helper_commit_tail()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-bridge-connector-v1-3-9a2fecd886a6@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2624; i=mripard@kernel.org;
 h=from:subject:message-id; bh=LYEhfKiFb3CUu2Y0XG8MQHtGxB63YAoqR4SNayCeLEw=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOkdymIq/Z+2dFso7rYXb7iv/MPiT1rNg3QpxWve2nz3j
 s09J9bVMZWFQZiTQVZMkeWJTNjp5e2LqxzsV/6AmcPKBDKEgYtTACYiN4Ox3mvd4a18fBNvhVnt
 dwtncuRJCYmWtA2ROfFH+XDmp4J/7zKfWj81+iDC6NbvkDCl42wYY8OzLMlIRuUDkw5vX1q0Psp
 ++7aoQzbuUjPLl+nwMyWw8lu4SUfwCKct9A/ikuSMC5+pAQA=
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
2.47.1

