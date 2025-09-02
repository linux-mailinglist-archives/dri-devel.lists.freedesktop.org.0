Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C59DB3FAB2
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 11:36:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B91010E639;
	Tue,  2 Sep 2025 09:36:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OtVuPZAV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86FD910E638
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 09:36:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6BE66438F9;
 Tue,  2 Sep 2025 09:36:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F24BEC4CEED;
 Tue,  2 Sep 2025 09:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756805792;
 bh=TECkBtLq35Vy4sKftWglHljuHnxppemM2WRDh5On8Ng=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=OtVuPZAVW2zDK11H8ATRY5NleIex8GsD0cDa5DDjEVA1vkdyEzol2zl2rwdszKbUh
 5FrIBnX2ms13CoBmOSr+J/IJq3bvHK/7QF7g9OzPpD8j7Kguc28f3lHsAektR/zl4c
 M8o7G8cajq2Mp5oSmTp8MwYy2lGcvoDYCtN6yjMcYbcKWaaK0yXZMFNaUL2pj9zp6j
 qPNNJoMKqPScO9YiLc2oPDTMkXh1llzGU6gAD7sMnLLAgZCINgRoU2TxXGCsTfy928
 hq5l5fv4njShLa0tOCgPZjXl0ZRJf0rIgeZEJcWqLVA7Dx8wJZvGPTN5e+n0auNcHq
 CX2atGC1uCqSg==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 02 Sep 2025 11:35:24 +0200
Subject: [PATCH v2 25/37] drm/omap: Switch to drm_atomic_get_new_crtc_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-drm-no-more-existing-state-v2-25-de98fc5f6d66@kernel.org>
References: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
In-Reply-To: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1292; i=mripard@kernel.org;
 h=from:subject:message-id; bh=TECkBtLq35Vy4sKftWglHljuHnxppemM2WRDh5On8Ng=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnbdoUpJeo/n2kStT7ardBcv26WbdKxtae/PPv4rUONR
 Uv8ZH5xx1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZiImiRjnWaz4/3H+9+J5zEc
 u9k4Y++VyXePiaq825b0jNlhMt+twIUfo1vfX60925qosvqNeenfK4z1cWsjN/9giDFflrZlR3b
 nG/NvguuSJ12+1lmg7atRHu0rY7rI71vLiRcln+RSXj61qrMAAA==
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

The omap atomic_check implementation uses the deprecated
drm_atomic_get_existing_crtc_state() helper.

This hook is called as part of the global atomic_check, thus before the
states are swapped. The existing state thus points to the new state, and
we can use drm_atomic_get_new_crtc_state() instead.

Signed-off-by: Maxime Ripard <mripard@kernel.org>

---
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/omapdrm/omap_plane.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_plane.c b/drivers/gpu/drm/omapdrm/omap_plane.c
index 24a2ded08b454c4f2225e84f7b0ed09ed733d6b7..d74ef6694c10995c7393217a4d81275b36e00e2b 100644
--- a/drivers/gpu/drm/omapdrm/omap_plane.c
+++ b/drivers/gpu/drm/omapdrm/omap_plane.c
@@ -227,11 +227,11 @@ static int omap_plane_atomic_check(struct drm_plane *plane,
 
 	crtc = new_plane_state->crtc ? new_plane_state->crtc : plane->state->crtc;
 	if (!crtc)
 		return 0;
 
-	crtc_state = drm_atomic_get_existing_crtc_state(state, crtc);
+	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 	/* we should have a crtc state if the plane is attached to a crtc */
 	if (WARN_ON(!crtc_state))
 		return 0;
 
 	/*

-- 
2.50.1

