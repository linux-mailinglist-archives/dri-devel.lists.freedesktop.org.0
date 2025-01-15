Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0B5A12D32
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 22:06:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4E1010E7FB;
	Wed, 15 Jan 2025 21:06:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="V7LKk2IR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE1A610E7FB
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 21:06:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 794285C5E88;
 Wed, 15 Jan 2025 21:05:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BB2AC4CED1;
 Wed, 15 Jan 2025 21:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736975189;
 bh=zx3u1Khvkx4qTNs/PbrVy6WCbYbSdR514iklgqEorIU=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=V7LKk2IRdH5CRt/RnvQYtbiSUuw0J2CgtuxjPfkt/tG2xoWUiQoPwO2PMBkL6QRkH
 lKj5tGw5etcUfkVbJKMhL47KMbPvsyABHU8hirdfraB0bgrP4BMHB19MSRD6Da2CxO
 GnqWO6I6J3jVg7Z6GRcNUkk7a8dFW3vRfnu49ljKIkw7hi63UFGiptLgdPj/sHeB+z
 KWssFN9XQ9rupzA1Zvf3PvuKAGfjvoOLrCqTkh20iBvR+BFxWBP2t9DasRbHt/h8nL
 SDx99zspEMHMe2MbdMaLo9t01x1eaS56QEZe5g+PJ8mP1tDK+cwnyV6O52B8DcMC82
 dCZ2pMOoc+mEA==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 15 Jan 2025 22:05:24 +0100
Subject: [PATCH 17/29] drm/atomic-helper: Change parameter name of
 drm_atomic_helper_commit_hw_done()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-bridge-connector-v1-17-9a2fecd886a6@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2136; i=mripard@kernel.org;
 h=from:subject:message-id; bh=zx3u1Khvkx4qTNs/PbrVy6WCbYbSdR514iklgqEorIU=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOkdyjIVcV3HS19nbuRVq3jPNF18h7p5yvVd5T9L17y7V
 Pk8V3ZPx1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZhIw1TGet8Paqp5oQvEV+Za
 FnfN+ZnKbih+Xu8BY7Uowyv+e7mK5T/cF81e5xHXZexuv+28++k4xobvEl+dHU1cOResOzTtT86
 VdXflN2zXeJZ5vCe86tbPpVVt661n3j4Q6iat3r74K8+dX88B
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

drm_atomic_helper_commit_hw_done() signals hardware completion of a
given commit. It takes the drm_atomic_state being committed as a
parameter.

However, that parameter name is called (and documented) as old_state,
which is pretty confusing. Let's rename that variable as state.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_helper.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 78bc540158b7c64129eb728d8f8d67a6797bd0b3..d642bbc074bd364256409c91649f8d8aa10f5023 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -2501,11 +2501,11 @@ void drm_atomic_helper_fake_vblank(struct drm_atomic_state *state)
 }
 EXPORT_SYMBOL(drm_atomic_helper_fake_vblank);
 
 /**
  * drm_atomic_helper_commit_hw_done - setup possible nonblocking commit
- * @old_state: atomic state object with old state structures
+ * @state: atomic state object being committed
  *
  * This function is used to signal completion of the hardware commit step. After
  * this step the driver is not allowed to read or change any permanent software
  * or hardware modeset state. The only exception is state protected by other
  * means than &drm_modeset_lock locks.
@@ -2514,18 +2514,18 @@ EXPORT_SYMBOL(drm_atomic_helper_fake_vblank);
  * this function is called.
  *
  * This is part of the atomic helper support for nonblocking commits, see
  * drm_atomic_helper_setup_commit() for an overview.
  */
-void drm_atomic_helper_commit_hw_done(struct drm_atomic_state *old_state)
+void drm_atomic_helper_commit_hw_done(struct drm_atomic_state *state)
 {
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
 	struct drm_crtc_commit *commit;
 	int i;
 
-	for_each_oldnew_crtc_in_state(old_state, crtc, old_crtc_state, new_crtc_state, i) {
+	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
 		commit = new_crtc_state->commit;
 		if (!commit)
 			continue;
 
 		/*

-- 
2.47.1

