Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E28FDB802DB
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 16:46:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4B5410E85D;
	Wed, 17 Sep 2025 14:46:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="F5xxtzEP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADBD510E85B
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 14:46:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 656514431B;
 Wed, 17 Sep 2025 14:46:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4103C4CEE7;
 Wed, 17 Sep 2025 14:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758120374;
 bh=z1XF1Rnz3XY6QTs7brP5nMEpkpbd1NvbUtFXrNw26aI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=F5xxtzEPH2NeHcY4IiZG/pC0lwD1PRRG7cGYS7jnLmQgYsiHc45bJht5iDEzGafL2
 hPnWNPNjgbhcNCU7yi7+N+8dP92Ds8BdmGUDSEB/ibQd6BQUoZDsaP/kLuqvOPVlr/
 ETq/7TWDdUNVjXWHXJz3GVdNb6LUKfOYZdTdXLjAyYgiCmuczODofXLFyMmydRAYKj
 Q5YL8eP+vwlQS0hxWJnFDCASogaNMiyw9+tpXUwMrFRieAbLedXij3Qe8rPreHvStf
 O61c2CzhAn0kg2Sxs1wG8zRmLEFxWXxTwMlFVL/qDEsa1BvvUknlvX3daMNtLIakiE
 TQY4U6Dv1l5Lg==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 17 Sep 2025 16:45:42 +0200
Subject: [PATCH v4 01/39] drm/atomic: Convert
 drm_atomic_get_connector_state() to use new connector state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250917-drm-no-more-existing-state-v4-1-5d4b9889c3c8@kernel.org>
References: <20250917-drm-no-more-existing-state-v4-0-5d4b9889c3c8@kernel.org>
In-Reply-To: <20250917-drm-no-more-existing-state-v4-0-5d4b9889c3c8@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1717; i=mripard@kernel.org;
 h=from:subject:message-id; bh=z1XF1Rnz3XY6QTs7brP5nMEpkpbd1NvbUtFXrNw26aI=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBmnTs5fXpi2rPfUJ2uRVo7DM934VLoaPTJK160uWPBt/
 V7mb0LbOqayMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBEpsUz1nD9fTnlnaE3V+Ds
 I7MPp865uuur9IH1qa6u3RKaXTNvvv6aIeGX9v/6b/3n17a/mtN/U4+xYb06B6fQEYFZfuHe6yu
 mCx6N6now92Dz+y1zllSYGH7Mqnyxb/IW8xtGAoxPNn5cdJKRCQA=
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

The drm_atomic_get_connector_state() function calls a hand-rolled
implementation of the deprecated
drm_atomic_get_existing_connector_state() helper to get find if a
connector state had already been allocated and was part of the given
drm_atomic_state.

At the point in time where drm_atomic_get_connector_state() can be
called (ie, during atomic_check), the existing state is the new state
and drm_atomic_get_existing_connector_state() can thus be replaced by
drm_atomic_get_new_connector_state().

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # on imx8mp
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index cd15cf52f0c9144711da5879da57884674aea9e4..6d10a3e40b00c58030e4dc9fdf47bd252cac0189 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1150,12 +1150,13 @@ drm_atomic_get_connector_state(struct drm_atomic_state *state,
 		       sizeof(*state->connectors) * (alloc - state->num_connector));
 
 		state->num_connector = alloc;
 	}
 
-	if (state->connectors[index].state)
-		return state->connectors[index].state;
+	connector_state = drm_atomic_get_new_connector_state(state, connector);
+	if (connector_state)
+		return connector_state;
 
 	connector_state = connector->funcs->atomic_duplicate_state(connector);
 	if (!connector_state)
 		return ERR_PTR(-ENOMEM);
 

-- 
2.50.1

