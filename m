Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCFEA12D30
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 22:06:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECDCB10E7F0;
	Wed, 15 Jan 2025 21:06:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gLCPylpm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E70B810E7F0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 21:06:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id EE412A4157C;
 Wed, 15 Jan 2025 21:04:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 580E1C4CED1;
 Wed, 15 Jan 2025 21:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736975183;
 bh=imbzOlHPI3T2/bhE2uZ8m8ju5T+B94wxhjoKisesxXk=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=gLCPylpmuzF/4T5+QWVCSPTQowEqlUMYBjtqfW9CUkzgGLxWGtSdg6uht/QizeDpg
 bRWaEorB6HNWH3SkJxQ7gqIm0bb+8lyqZAgT/mb2CjmfMNypRMrhPA2GzlpE9I1vp6
 7O7sECBjz1IeU+clbL3jNQBhvnpsNDZOCHGuqceQkLLvxYcWCeUnHDn+36ncLU0kax
 LZi3Qa6YqsHZExJEbQwBKLp4Q97tqsyMM1tx0sFfDx2Npx/h03hYzpSUw2ifNa4Tey
 ukjmBcUWk4RZRSSJzI+MaV+YTjh/oho25WZCEM/IGrpIUKeRLVN5qd1OnhZLvUgEg5
 DVeYY+r3rXnLg==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 15 Jan 2025 22:05:22 +0100
Subject: [PATCH 15/29] drm/atomic-helper: Change parameter name of
 drm_atomic_helper_commit_writebacks()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-bridge-connector-v1-15-9a2fecd886a6@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1760; i=mripard@kernel.org;
 h=from:subject:message-id; bh=imbzOlHPI3T2/bhE2uZ8m8ju5T+B94wxhjoKisesxXk=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOkdytIzYvzudB9me6oRN6v4rl30R8U/slyHHZf9FrnzI
 pElJW1Dx1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZjIjgeMDRcPfipX+jgj7c/5
 8NSb69MLIoq21qya/HjKi+orhXUv21jm7pA+EOm7aOsa9mD7y/qzAhjr7DTa6gtW2ES8Xedve0r
 nnX4xS4vuQoffFkWbXxXGMag4cu2QDS+WXH9gZ+Dp1bemvT8FAA==
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

drm_atomic_helper_commit_writebacks() updates all writeback connectors
affected by a new commit. It takes the drm_atomic_state being committed
as a parameter.

However, that parameter name is called (and documented) as old_state,
which is pretty confusing. Let's rename that variable as state.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_helper.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index b95e30dee1b4e2ba8991affd1e280a7a36171afd..cf859fa0110ad1154021e970dc262387cf3eb0c8 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1451,26 +1451,26 @@ void drm_atomic_helper_commit_modeset_disables(struct drm_device *dev,
 	crtc_set_mode(dev, state);
 }
 EXPORT_SYMBOL(drm_atomic_helper_commit_modeset_disables);
 
 static void drm_atomic_helper_commit_writebacks(struct drm_device *dev,
-						struct drm_atomic_state *old_state)
+						struct drm_atomic_state *state)
 {
 	struct drm_connector *connector;
 	struct drm_connector_state *new_conn_state;
 	int i;
 
-	for_each_new_connector_in_state(old_state, connector, new_conn_state, i) {
+	for_each_new_connector_in_state(state, connector, new_conn_state, i) {
 		const struct drm_connector_helper_funcs *funcs;
 
 		funcs = connector->helper_private;
 		if (!funcs->atomic_commit)
 			continue;
 
 		if (new_conn_state->writeback_job && new_conn_state->writeback_job->fb) {
 			WARN_ON(connector->connector_type != DRM_MODE_CONNECTOR_WRITEBACK);
-			funcs->atomic_commit(connector, old_state);
+			funcs->atomic_commit(connector, state);
 		}
 	}
 }
 
 /**

-- 
2.47.1

