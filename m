Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94821A9460E
	for <lists+dri-devel@lfdr.de>; Sun, 20 Apr 2025 02:30:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C75310E1B4;
	Sun, 20 Apr 2025 00:30:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gqJbf+De";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92F1410E1B4
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Apr 2025 00:30:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 7D422A48609;
 Sun, 20 Apr 2025 00:24:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 59682C4CEE7;
 Sun, 20 Apr 2025 00:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745109012;
 bh=lFsiqVIeYeqhHXcEjTCFxaRVC5Dt8c2tiWMgb1QT3HA=;
 h=From:Date:Subject:To:Cc:Reply-To:From;
 b=gqJbf+DeUMUSRzjCItVwNpi8nQdXP0CMVX5fSfnEMKSHvv/+a1NB64gMjtkIH3Tq+
 WNmUtx8I5WGXswas34sIAmMTitqfGTU8WhKU1zmE3LsmCXQlGRO9Fl0X1pkEcdCB9t
 Y80a2XV0jL40C7jLrh+/t+gc4vCbeC+wTW/W2YfDYr5sSa4yM2yPTBcofszzZH6Fjp
 DMRHyYgS5CRVzR5x6gM4MgPALwUxwLuueo+D88p8dUxzUZe2EMJzlgKUt0hjxLshgI
 dpMlKo6wkX0LApxf/EP292sOBBPMsIlS6P09wA7r+DqlMZGJHb08AjhP729ihRyCH9
 R1FHIc2s2o1jw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 4D51DC369CF;
 Sun, 20 Apr 2025 00:30:12 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Sat, 19 Apr 2025 19:30:02 -0500
Subject: [PATCH] drm/tegra: Assign plane type before registration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250419-tegra-drm-primary-v1-1-b91054fb413f@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAlABGgC/x3MOwqAMBBF0a3I1A5EUUS3IhbRvOgUfpiIKJK9G
 yxPce9LASoI1GUvKS4Jsm8JRZ7RtNhtBotLptKUtamKlk/MatnpyofKavXhCVXjMcI76yl1h8L
 L/T/7IcYPfS/jYGMAAAA=
X-Change-ID: 20250419-tegra-drm-primary-ce47febefdaf
To: Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Thierry Reding <treding@nvidia.com>, 
 Aaron Kling <webgeek1234@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745109011; l=3395;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=2G8UkSlgwDeChFlfMMABWHEAXMgLzztWjpyaOPbKpVg=;
 b=5SgytgEJbkPisD/RHBHH6irE+mqOTQ2Ld0kkRR7fsi+WTpG1T6fpPWy5RZKmNCanrOc94c8fx
 G/84KB4qIX9CHhOZagae0TMnmaUU7Qvy9Eb2UPx5Y/LUL8lFNeRhTUk
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
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
Reply-To: webgeek1234@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

Changes to a plane's type after it has been registered aren't propagated
to userspace automatically. This could possibly be achieved by updating
the property, but since we can already determine which type this should
be before the registration, passing in the right type from the start is
a much better solution.

Suggested-by: Aaron Kling <webgeek1234@gmail.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
Cc: stable@vger.kernel.org
---
Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 drivers/gpu/drm/tegra/dc.c  | 12 ++++++++----
 drivers/gpu/drm/tegra/hub.c |  4 ++--
 drivers/gpu/drm/tegra/hub.h |  3 ++-
 3 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 798507a8ae56d6789feb95dccdd23b2e63d9c148..56f12dbcee3e93ff5e4804e5fe9b23f160073ebf 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -1321,10 +1321,16 @@ static struct drm_plane *tegra_dc_add_shared_planes(struct drm_device *drm,
 		if (wgrp->dc == dc->pipe) {
 			for (j = 0; j < wgrp->num_windows; j++) {
 				unsigned int index = wgrp->windows[j];
+				enum drm_plane_type type;
+
+				if (primary)
+					type = DRM_PLANE_TYPE_OVERLAY;
+				else
+					type = DRM_PLANE_TYPE_PRIMARY;
 
 				plane = tegra_shared_plane_create(drm, dc,
 								  wgrp->index,
-								  index);
+								  index, type);
 				if (IS_ERR(plane))
 					return plane;
 
@@ -1332,10 +1338,8 @@ static struct drm_plane *tegra_dc_add_shared_planes(struct drm_device *drm,
 				 * Choose the first shared plane owned by this
 				 * head as the primary plane.
 				 */
-				if (!primary) {
-					plane->type = DRM_PLANE_TYPE_PRIMARY;
+				if (!primary)
 					primary = plane;
-				}
 			}
 		}
 	}
diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
index fa6140fc37fb16df4b150e5ae9d8148f8f446cd7..8f779f23dc0904d38b14d3f3a928a07fc9e601ad 100644
--- a/drivers/gpu/drm/tegra/hub.c
+++ b/drivers/gpu/drm/tegra/hub.c
@@ -755,9 +755,9 @@ static const struct drm_plane_helper_funcs tegra_shared_plane_helper_funcs = {
 struct drm_plane *tegra_shared_plane_create(struct drm_device *drm,
 					    struct tegra_dc *dc,
 					    unsigned int wgrp,
-					    unsigned int index)
+					    unsigned int index,
+					    enum drm_plane_type type)
 {
-	enum drm_plane_type type = DRM_PLANE_TYPE_OVERLAY;
 	struct tegra_drm *tegra = drm->dev_private;
 	struct tegra_display_hub *hub = tegra->hub;
 	struct tegra_shared_plane *plane;
diff --git a/drivers/gpu/drm/tegra/hub.h b/drivers/gpu/drm/tegra/hub.h
index 23c4b2115ed1e36e8d2d6ed614a6ead97eb4c441..a66f18c4facc9df96ea8b9f54239b52f06536d12 100644
--- a/drivers/gpu/drm/tegra/hub.h
+++ b/drivers/gpu/drm/tegra/hub.h
@@ -80,7 +80,8 @@ void tegra_display_hub_cleanup(struct tegra_display_hub *hub);
 struct drm_plane *tegra_shared_plane_create(struct drm_device *drm,
 					    struct tegra_dc *dc,
 					    unsigned int wgrp,
-					    unsigned int index);
+					    unsigned int index,
+					    enum drm_plane_type type);
 
 int tegra_display_hub_atomic_check(struct drm_device *drm,
 				   struct drm_atomic_state *state);

---
base-commit: 119009db267415049182774196e3cce9e13b52ef
change-id: 20250419-tegra-drm-primary-ce47febefdaf

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>


