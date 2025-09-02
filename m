Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9AFB3FA8B
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 11:35:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2D4510E61E;
	Tue,  2 Sep 2025 09:35:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WfXk+dP5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A997910E61C
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 09:35:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6939340A88;
 Tue,  2 Sep 2025 09:35:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA8DDC4CEFA;
 Tue,  2 Sep 2025 09:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756805729;
 bh=mqWSQbJqHDiXrBM4SmNZvnq7i3Un1SEdRRue821a+JM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=WfXk+dP57A8ulnt89Zz/908hdkTpcMCcuj0rghN0Oz1TqPYf5t4q+MfOyhtmvVBWN
 vNRn00gUlZi4UZKSlHpgm6kp8KAIoJTWPvMeyn530yecUQ0jNsFgies4NbeZwMkc5q
 2Nn2Pvwrd4/SNeIkvn+TuhJfbD65Vi3jrIB/T4dzGLlDdPBrs4KrNlnzh0a+7PYoEG
 ojt2U3dK673DVlnyP50cVp2Vq4coGXgGajVyBdMCOMAGvsNrHfcHhIo6XFDYJDtsaX
 oVte2RYd+TbYDNFPIBiKheIaPhbAoKVdG/Ckp8Tphym7K8Ej6LY/i9FD2HARng3PCw
 eXu6VwQGqD8Yw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 02 Sep 2025 11:35:00 +0200
Subject: [PATCH v2 01/37] drm/atomic: Convert
 drm_atomic_get_connector_state() to use new connector state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-drm-no-more-existing-state-v2-1-de98fc5f6d66@kernel.org>
References: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
In-Reply-To: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1466; i=mripard@kernel.org;
 h=from:subject:message-id; bh=mqWSQbJqHDiXrBM4SmNZvnq7i3Un1SEdRRue821a+JM=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnbdvn4tJ2sljA9Uv36TPrKI0850n2OMs7RufFdmWGhl
 laFnXZtx1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZgIuyNjfcQRxf0+VoxajGV+
 PEaPb6i4bKrf7ZujJZW09f4kOQaONacd+Kc4V83f80fkxPWHkVHnGBt6Pwou2ywjM0swnqUoX3l
 3+dX5DFPNq2/MOHZV5kHAxarpLC3iDP1vHdfNTFqgy609ywAA
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

