Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0D9D3A970
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 13:50:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B63AD10E447;
	Mon, 19 Jan 2026 12:50:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="idC4crhL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FAF810E447
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 12:50:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5757543473;
 Mon, 19 Jan 2026 12:50:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D700AC19423;
 Mon, 19 Jan 2026 12:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768827048;
 bh=mFDSWjULiqNb4gYo6mmddAEfUmh3dS6FOXzRW85kLjw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=idC4crhLYbxoscVFDse2tbGOEbsjK3e9NFbSRSsalnTZAsewRqY8XTTj6+qOeYnKq
 CRg8OEJOg5orxYcBKRUnbACJEtcSun4JPowYvtsvKmsE1jtfrFK0EXGdwjMy25UftI
 ASDKkDkGzvCasLT/71PluJz5tg3ee9dg/U3Wxvhe9rVO+Fvxuk4E2JPXfG4lylLJDE
 kxR2lVsQSlIU3m3c3wuEB7/LEZut+D1juqebOD2+IOzJII/WjZW5FaH8lDZkHNudUS
 rGoYZuHtz3qj6NcgwSfXU/9Q6kJnjxVg85+kLQE9Hsoo6oNZVNr7kIUbZOaITUCeWQ
 Mu0yFA2UTkcWg==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 19 Jan 2026 13:50:09 +0100
Subject: [PATCH v3 13/15] drm/tegra: Switch private_obj initialization to
 atomic_create_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-drm-private-obj-reset-v3-13-b931abe3a5e3@redhat.com>
References: <20260119-drm-private-obj-reset-v3-0-b931abe3a5e3@redhat.com>
In-Reply-To: <20260119-drm-private-obj-reset-v3-0-b931abe3a5e3@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2438; i=mripard@redhat.com;
 h=from:subject:message-id; bh=mFDSWjULiqNb4gYo6mmddAEfUmh3dS6FOXzRW85kLjw=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJl5GvVMx0X6r8bfz5ldbM4SqNLVym3Xwvhi/zfuQ0VJ6
 0SYe7Z2TGVhEOZkkBVTZHkiE3Z6efviKgf7lT9g5rAygQxh4OIUgIkw7WJs2Ln4nJiyj4TJZJcF
 8Xo3DnsefZ0UkP/lr2Ubt9zEfBvFQJX+Dysv8LuoC3AkP05dePEkY8NC4zvf7y1UUZtsPuWLt9b
 HRuvq8085b4RHhnmJikw2rY1cf90k3Pfvl7jwgq+Xle4tSAAA
X-Developer-Key: i=mripard@redhat.com; a=openpgp;
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
established one relying on a atomic_create_state implementation, let's
migrate this instance to the new pattern.

Signed-off-by: Maxime Ripard <mripard@kernel.org>

---

Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org
---
 drivers/gpu/drm/tegra/hub.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
index c924ffba409426cdc8719b208c74908d0e9fc544..e8cc4382532fffaea99020755ad78d3252613c26 100644
--- a/drivers/gpu/drm/tegra/hub.c
+++ b/drivers/gpu/drm/tegra/hub.c
@@ -823,11 +823,26 @@ static void tegra_display_hub_destroy_state(struct drm_private_obj *obj,
 		to_tegra_display_hub_state(state);
 
 	kfree(hub_state);
 }
 
+static struct drm_private_state *
+tegra_display_hub_create_state(struct drm_private_obj *obj)
+{
+	struct tegra_display_hub_state *hub_state;
+
+	hub_state = kzalloc(sizeof(*hub_state), GFP_KERNEL);
+	if (!hub_state)
+		return ERR_PTR(-ENOMEM);
+
+	__drm_atomic_helper_private_obj_create_state(obj, &hub_state->base);
+
+	return &hub_state->base;
+}
+
 static const struct drm_private_state_funcs tegra_display_hub_state_funcs = {
+	.atomic_create_state = tegra_display_hub_create_state,
 	.atomic_duplicate_state = tegra_display_hub_duplicate_state,
 	.atomic_destroy_state = tegra_display_hub_destroy_state,
 };
 
 static struct tegra_display_hub_state *
@@ -939,17 +954,12 @@ void tegra_display_hub_atomic_commit(struct drm_device *drm,
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
2.52.0

