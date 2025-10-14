Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DDABD93A8
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 14:09:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 338C410E5DB;
	Tue, 14 Oct 2025 12:09:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Phjq7qIv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C8D410E21C
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 12:09:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 665156284F;
 Tue, 14 Oct 2025 12:00:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7473C4CEFE;
 Tue, 14 Oct 2025 12:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760443254;
 bh=AKwDEAhHqInMCYZ96ZfB8oEdNx9B+IhpYViobgcdwCE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Phjq7qIv8qtsW+IT0wHFZuBLiyJ4o/FypDh69Yd4oCUlWxVYdK1bfxpAJyX4B328v
 BmKTKahTwkZ6of5/rsTXOF7z2N5YIs9h5tT8pir/p77i0Y/7AJMPeFyvVzszrqOVrC
 gtR6/iFpW21A+8X9iRrRz+KK9kHOow8itxpyAsqolXaz6QSnSywRXrVrC7H7UyjuM+
 G+mVG1qdmk+6C4bf3rVn0wkIWHmWxRy3T1Uod++2WoNEFezhQyz/r4DTfnFM1c43Di
 EbPbvMBKwikYte6U9DIaEYjw9tz11Iz1d3R4+aZbQw3ZVGY0RmkYpyfb/mQsFX8Jc4
 HOfrJ5N/Sxe+Q==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 14 Oct 2025 11:31:58 +0200
Subject: [PATCH v2 14/16] drm/tegra: Switch private_obj initialization to
 atomic_create_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-drm-private-obj-reset-v2-14-6dd60e985e9d@kernel.org>
References: <20251014-drm-private-obj-reset-v2-0-6dd60e985e9d@kernel.org>
In-Reply-To: <20251014-drm-private-obj-reset-v2-0-6dd60e985e9d@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2438; i=mripard@kernel.org;
 h=from:subject:message-id; bh=AKwDEAhHqInMCYZ96ZfB8oEdNx9B+IhpYViobgcdwCE=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnvrD2T+F1mxyfwv/QM4bupc+Ogw4SDR798efxWce/OK
 TprNgvld0xlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJtKxhrK95IRVhuqbr3i7J
 7sVs9ZclVOx9+JVnJ2Z0H76yJvoCu73dNn2+tpVe3A+M1j9dX3BnMWPDz3kfIk4+shA2s7hQN9V
 qed3BzcFv19nf7NST3bnzys2PjxdvM6/oc+ntmvXgZcix3xKTAA==
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
index 8f779f23dc0904d38b14d3f3a928a07fc9e601ad..52058f7dd92fadd45551447106ebe265975e6d8f 100644
--- a/drivers/gpu/drm/tegra/hub.c
+++ b/drivers/gpu/drm/tegra/hub.c
@@ -822,11 +822,26 @@ static void tegra_display_hub_destroy_state(struct drm_private_obj *obj,
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
@@ -938,17 +953,12 @@ void tegra_display_hub_atomic_commit(struct drm_device *drm,
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

