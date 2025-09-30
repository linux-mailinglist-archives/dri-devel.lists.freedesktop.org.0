Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2056EBAC95B
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 13:00:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7800410E56D;
	Tue, 30 Sep 2025 11:00:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bMwcSbbq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A59010E56D
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 11:00:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 574E3604DA;
 Tue, 30 Sep 2025 11:00:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96345C4CEF0;
 Tue, 30 Sep 2025 11:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759230007;
 bh=5TCtKUWTBGvMOx5rjclWVUp0B09BfnO/SQjfEKMDGVE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=bMwcSbbqGnF/32UbpVOKUs468ILLD1UAyIvBzdLs75YxxzlU9i/6csseiId61wn19
 eKRJk+ucQYbqQjeE8+Wmyw5Lct7Pl8Wn7tjvVi/1b84Nd9kXkztbqHSe7BSB/K2U6d
 KG8AEsm46fPX/MCyBOppU5nbPG8etu/YwwfKgOe672ifyl2Mmsugh38s32IRcxN8r3
 gtsiwBU4INkCJiwWtkpILYElRv4w1FHAQ5oc1R1CXAnkQMOVupfaDPT0Ex7LSO4YCC
 7sT9OZEEd+JUXa/TS9Km1lVzyAhcYZiBKVGU5zzQDxgJbzAhqNvecesknbvkLRuLhA
 PA3ajR+zQxovA==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 30 Sep 2025 12:59:16 +0200
Subject: [PATCH v5 01/39] drm/atomic: Convert
 drm_atomic_get_connector_state() to use new connector state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250930-drm-no-more-existing-state-v5-1-eeb9e1287907@kernel.org>
References: <20250930-drm-no-more-existing-state-v5-0-eeb9e1287907@kernel.org>
In-Reply-To: <20250930-drm-no-more-existing-state-v5-0-eeb9e1287907@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1717; i=mripard@kernel.org;
 h=from:subject:message-id; bh=5TCtKUWTBGvMOx5rjclWVUp0B09BfnO/SQjfEKMDGVE=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBm3dyi8ULHrjYkuXbBknkBT8AMuhbbjrebVzRnbFlgaB
 wa7itR0TGVhEOZkkBVTZHkiE3Z6efviKgf7lT9g5rAygQxh4OIUgIkc6mWsLzPcIm9m7vb44MwD
 DEqH1sibz+j45N0cyn7617VjHnM/2XsIbc33f2h/ofbZ4dJnZ3alMDZ8Osx5WPdTnEZKpoXY3m2
 sgYGnJnzS6NRyWNEo8i3h2IqrHYfYvPTu7mm5c+HuhCW8DnkA
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
2.51.0

