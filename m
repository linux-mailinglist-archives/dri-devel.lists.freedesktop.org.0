Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C12BC4B2F
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 14:04:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C58010E7FD;
	Wed,  8 Oct 2025 12:04:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gaAqtzyL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10FFF10E7F3
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 12:04:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E98BD40498;
 Wed,  8 Oct 2025 12:04:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72143C4CEF4;
 Wed,  8 Oct 2025 12:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759925090;
 bh=0gtutMtC7G6Koopz+Hd0U01yUAtxMe8/UQ8i/BOsXd4=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=gaAqtzyL37EYymYORZXEmaI628QkIM/O2Y3FmfrGPvmmIqfWRy2+2UDdcVei1VS16
 3W8nR6iIXm/QxBGfkEvAreQfvaiJAB4P0cW8j7VaHT2TSJHnY4neD/U2tlEHQ/GF2B
 GoasvAd4FLrsQP6HpW6Qvq+VRnQ16ba3bFF5hUIqbc3JcT43wLnzcYDvsSWamZN6k8
 iLQcVRhSi1miJZI/ghy8dc4gov8u5GTPcim86WVWzYe9jzgfiFvYorHAZ7bDcqMrSf
 ywBu+MYQ4XUdj2yGr0cmaSl7xQ7TrQt6kRpqXmoxzXXFgRlrg0FYmBJoMhvKoDz9Xn
 Mu8D1CD+hFrJQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 08 Oct 2025 14:04:11 +0200
Subject: [PATCH 13/16] drm/tegra: Switch private_obj initialization to
 reset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251008-drm-private-obj-reset-v1-13-805ab43ae65a@kernel.org>
References: <20251008-drm-private-obj-reset-v1-0-805ab43ae65a@kernel.org>
In-Reply-To: <20251008-drm-private-obj-reset-v1-0-805ab43ae65a@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2527; i=mripard@kernel.org;
 h=from:subject:message-id; bh=0gtutMtC7G6Koopz+Hd0U01yUAtxMe8/UQ8i/BOsXd4=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnPgi1MrX9MWG/zpXb5w1NnUxat9DSctGfCAne/20ZfX
 NK+Wk2u7JjKwiDMySArpsjyRCbs9PL2xVUO9it/wMxhZQIZwsDFKQATichjrFPt5TBYc2VmdOyO
 oCXSX1nCo3Quchd9LVvoYr9ims255LoZrwXfV+1ZzHHnyl7tLkPPyYwN/z4Wc+6ZLJJwgdlRd3X
 H27hdtzdbXnfKXvpU/+XxzW3y77t+79yXGW37UNctkEnqpYA7AA==
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

The tegra driver relies on a drm_private_obj, that is initialized by
allocating and initializing a state, and then passing it to
drm_private_obj_init.

Since we're gradually moving away from that pattern to the more
established one relying on a reset implementation, let's migrate this
instance to the new pattern.

Signed-off-by: Maxime Ripard <mripard@kernel.org>

---

Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org
---
 drivers/gpu/drm/tegra/hub.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
index 8f779f23dc0904d38b14d3f3a928a07fc9e601ad..6cae71bc3744a22e4b3804b19869e8b16fd60ecd 100644
--- a/drivers/gpu/drm/tegra/hub.c
+++ b/drivers/gpu/drm/tegra/hub.c
@@ -822,13 +822,30 @@ static void tegra_display_hub_destroy_state(struct drm_private_obj *obj,
 		to_tegra_display_hub_state(state);
 
 	kfree(hub_state);
 }
 
+static void tegra_display_hub_reset(struct drm_private_obj *obj)
+{
+	struct tegra_display_hub_state *hub_state;
+
+	if (obj->state) {
+		tegra_display_hub_destroy_state(obj, obj->state);
+		obj->state = NULL;
+	}
+
+	hub_state = kzalloc(sizeof(*hub_state), GFP_KERNEL);
+	if (!hub_state)
+		return;
+
+	__drm_atomic_helper_private_obj_reset(obj, &hub_state->base);
+}
+
 static const struct drm_private_state_funcs tegra_display_hub_state_funcs = {
 	.atomic_duplicate_state = tegra_display_hub_duplicate_state,
 	.atomic_destroy_state = tegra_display_hub_destroy_state,
+	.reset = tegra_display_hub_reset,
 };
 
 static struct tegra_display_hub_state *
 tegra_display_hub_get_state(struct tegra_display_hub *hub,
 			    struct drm_atomic_state *state)
@@ -938,17 +955,12 @@ void tegra_display_hub_atomic_commit(struct drm_device *drm,
 static int tegra_display_hub_init(struct host1x_client *client)
 {
 	struct tegra_display_hub *hub = to_tegra_display_hub(client);
 	struct drm_device *drm = dev_get_drvdata(client->host);
 	struct tegra_drm *tegra = drm->dev_private;
-	struct tegra_display_hub_state *state;
 
-	state = kzalloc(sizeof(*state), GFP_KERNEL);
-	if (!state)
-		return -ENOMEM;
-
-	drm_atomic_private_obj_init(drm, &hub->base, &state->base,
+	drm_atomic_private_obj_init(drm, &hub->base, NULL,
 				    &tegra_display_hub_state_funcs);
 
 	tegra->hub = hub;
 
 	return 0;

-- 
2.51.0

