Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A12A2A34316
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 15:44:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19F0310EAE6;
	Thu, 13 Feb 2025 14:44:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="u9r7L+4X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 569C710EAE6
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 14:44:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3D631A4201C;
 Thu, 13 Feb 2025 14:43:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAF02C4CEE2;
 Thu, 13 Feb 2025 14:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739457890;
 bh=cq/b70rH1OkT5CCWHkeHkd8zWfSlShUs5TFSxIGHrrw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=u9r7L+4XQxDe5LSo2dL5seamc/t/sDbe6hlwOoEkUJXVsPKgUpa6bKRrLDcI5yJrB
 wAl+EP8Muct+41dJQvoDKa5gEZl2OijcVzZ0XHYZYb/y8N3ahwRwwaFeQlVh6qixVJ
 WUdzp5Y+DXvLZ1flW5LVQ9Xq48ZoKjlvc2kNy/EgU0sWY1p0kv6fG7VN65vy12Y+TD
 oNuFq14hLbtgscnbKvSU5TG9V9aR+0ZH70ohm7BR9NcLHYBFBVe5tkPICRbKZ5TCiD
 uyY0NVaEd0M6cTZWCos+BxTH1qo+k3tJE+yA0/jcRoPBzjgCkJjU3CJCjGlp+tcI/F
 VPQOaUXtMjNtA==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 13 Feb 2025 15:43:39 +0100
Subject: [PATCH v3 20/37] drm/atomic-helper: Change parameter name of
 drm_atomic_helper_commit_writebacks()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-bridge-connector-v3-20-e71598f49c8f@kernel.org>
References: <20250213-bridge-connector-v3-0-e71598f49c8f@kernel.org>
In-Reply-To: <20250213-bridge-connector-v3-0-e71598f49c8f@kernel.org>
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
 h=from:subject:message-id; bh=cq/b70rH1OkT5CCWHkeHkd8zWfSlShUs5TFSxIGHrrw=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOnrWOUurDO9ocOVMF/k5/X/zppWvq9mM2RMY37KW1th1
 vRvprZ+x1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZiIuhBjw4k/GWUqdx3SP/34
 YVj+rZp7adW3igtvZu9Iyzf6uU5Z7H5S/8bDK6RcIufaNdofvrH4E2NDb8zjDu57H53sTj7cFSq
 /mFN0yRzx6P01TD1v2bOWXLqyyWdv+JmLmt2vjF8dd8o94XUGAA==
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
index 1fc15d4ab096ada43969f5d9f0c74a4384208582..b8bdbbba8555d4ede22821625579430649149267 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1461,26 +1461,26 @@ void drm_atomic_helper_commit_modeset_disables(struct drm_device *dev,
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
2.48.0

