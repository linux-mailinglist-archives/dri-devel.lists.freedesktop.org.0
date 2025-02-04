Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF50AA27505
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 15:58:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5456B10E674;
	Tue,  4 Feb 2025 14:58:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gBKq90S3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C08F10E674
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 14:58:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C41F3A42821;
 Tue,  4 Feb 2025 14:56:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71F2EC4CEDF;
 Tue,  4 Feb 2025 14:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738681124;
 bh=MeUBQEY53V3JEkFy9fuJOULftLLdFPVUgFUElxlS6tA=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=gBKq90S3mEN50MCjqPEQyu0zWSrcHVIFmyg9W1ru247GWDqDS6tRbX6Hkj1IoE1nj
 5mzEZq0SjY7towv6408mJYZZOpoziIW+KmVOp9vbjzzUdN0Gr4bgUhV0bk1kGZPO6I
 NM3GVfdhPeVVBfPKJLUCAC1TbbBI7pUy9inpKWMWHssPS8iMSK/Ai6B8FjrocDf/j1
 nV9NqxV1CErecaaAHxCn5WXYqdXMk9ni8/Lgtu2n+z0WHaUz5PN0o/+gWHyJ/NBdzl
 YLpOSN7XNYqaezLcPWEF9e7+zJh5QArHl/zflRo9QYh0JivdpSU4eppu6pxmHte0xN
 ghtm8nrx0lm8A==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 04 Feb 2025 15:57:35 +0100
Subject: [PATCH v2 07/35] drm/atomic-helper: Change parameter name of
 drm_atomic_helper_wait_for_dependencies()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-bridge-connector-v2-7-35dd6c834e08@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3009; i=mripard@kernel.org;
 h=from:subject:message-id; bh=MeUBQEY53V3JEkFy9fuJOULftLLdFPVUgFUElxlS6tA=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOmLtF7LZr661fdcqvdtY6bqpBXq23/9r7SLyfL5s4v/d
 tG91PmSHVNYGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAiE04xVuxXa5p65ZRP/d0u
 p4vLLFuV/DUX3+j5XO99M2L3+faD25bcFOnR5V+bdiFh64O+VXezGBveOX64pniw5+StJQ7XGq0
 VVuf8+GXkIdO3MnG5epNrplvmIoWgrj92ItwK1fyau99dbgEA
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

drm_atomic_helper_wait_for_dependencies() waits for all the dependencies
a commit has before going forward with it. It takes the drm_atomic_state
being committed as a parameter.

However, that parameter name is called (and documented) as old_state,
which is pretty confusing. Let's rename that variable as state.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_helper.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 913d94d664d885323ad7e41a6424633c28c787e1..48dc4f18e757549b67940cc5ca4d76812ef13985 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -2411,48 +2411,48 @@ int drm_atomic_helper_setup_commit(struct drm_atomic_state *state,
 }
 EXPORT_SYMBOL(drm_atomic_helper_setup_commit);
 
 /**
  * drm_atomic_helper_wait_for_dependencies - wait for required preceding commits
- * @old_state: atomic state object with old state structures
+ * @state: atomic state object being committed
  *
  * This function waits for all preceding commits that touch the same CRTC as
- * @old_state to both be committed to the hardware (as signalled by
+ * @state to both be committed to the hardware (as signalled by
  * drm_atomic_helper_commit_hw_done()) and executed by the hardware (as signalled
  * by calling drm_crtc_send_vblank_event() on the &drm_crtc_state.event).
  *
  * This is part of the atomic helper support for nonblocking commits, see
  * drm_atomic_helper_setup_commit() for an overview.
  */
-void drm_atomic_helper_wait_for_dependencies(struct drm_atomic_state *old_state)
+void drm_atomic_helper_wait_for_dependencies(struct drm_atomic_state *state)
 {
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *old_crtc_state;
 	struct drm_plane *plane;
 	struct drm_plane_state *old_plane_state;
 	struct drm_connector *conn;
 	struct drm_connector_state *old_conn_state;
 	int i;
 	long ret;
 
-	for_each_old_crtc_in_state(old_state, crtc, old_crtc_state, i) {
+	for_each_old_crtc_in_state(state, crtc, old_crtc_state, i) {
 		ret = drm_crtc_commit_wait(old_crtc_state->commit);
 		if (ret)
 			drm_err(crtc->dev,
 				"[CRTC:%d:%s] commit wait timed out\n",
 				crtc->base.id, crtc->name);
 	}
 
-	for_each_old_connector_in_state(old_state, conn, old_conn_state, i) {
+	for_each_old_connector_in_state(state, conn, old_conn_state, i) {
 		ret = drm_crtc_commit_wait(old_conn_state->commit);
 		if (ret)
 			drm_err(conn->dev,
 				"[CONNECTOR:%d:%s] commit wait timed out\n",
 				conn->base.id, conn->name);
 	}
 
-	for_each_old_plane_in_state(old_state, plane, old_plane_state, i) {
+	for_each_old_plane_in_state(state, plane, old_plane_state, i) {
 		ret = drm_crtc_commit_wait(old_plane_state->commit);
 		if (ret)
 			drm_err(plane->dev,
 				"[PLANE:%d:%s] commit wait timed out\n",
 				plane->base.id, plane->name);

-- 
2.48.0

