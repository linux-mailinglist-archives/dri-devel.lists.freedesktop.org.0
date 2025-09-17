Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC15B80320
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 16:47:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84F1910E867;
	Wed, 17 Sep 2025 14:46:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="amCxLbMy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA65610E869
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 14:46:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A267142BA8;
 Wed, 17 Sep 2025 14:46:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D465C4CEF0;
 Wed, 17 Sep 2025 14:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758120410;
 bh=v9X9Cu4HSQ4W+D1wfa82Tw50UlWgDw6zBO52697Yf1k=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=amCxLbMy/w6U3VvboTZeER9q6wkHLIUSz8FH7HEiBRmtHf6PkjMIJEfrhdQUN1DZT
 LocwlT0EdONw0EKopMHdPFEu6VriiIoCYQG+h4l8EXzpP0zmpS7gEPR5Nv6bTd09MZ
 hbrDaEu3UeqcN27q+GT7j2WesJZKRVrm4OarfwyFj9yWCORWDXDJtJ2sjKe3AbbrJS
 h/Wpg0PCQx4d1t+lwtTfY/NxMBQ81QgmSn2W7w1Fmvmjp6ESc/fvlPFzDqMdnTsANV
 +n5H0tpEQFQ46ma2qaXDQA840837LvXh0mDtWrKJr7YJYSJV7EYXWJuF21jR2m1qd7
 kvpBHrwgiDyLw==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 17 Sep 2025 16:45:55 +0200
Subject: [PATCH v4 14/39] drm/armada: Switch to drm_atomic_get_new_crtc_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250917-drm-no-more-existing-state-v4-14-5d4b9889c3c8@kernel.org>
References: <20250917-drm-no-more-existing-state-v4-0-5d4b9889c3c8@kernel.org>
In-Reply-To: <20250917-drm-no-more-existing-state-v4-0-5d4b9889c3c8@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 Russell King <linux@armlinux.org.uk>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1345; i=mripard@kernel.org;
 h=from:subject:message-id; bh=v9X9Cu4HSQ4W+D1wfa82Tw50UlWgDw6zBO52697Yf1k=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBmnTi5VjGO9e+TRtr5oudyCHx6W8zjL7GKOJF5YeMLBi
 f1Ev7dPx1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZgI5xTGhvPllw/Z5vFdnp7i
 F6+fHLCpNOPItLJZFzo7Vy9ed3BLQ/OLvUb8aafvyMVFPGS99JE7i7FhhVUO25UDM/JNuYKq7N+
 GHNQM/bFWnjH+6PeZHyWNzM9u1ed/59JTeudOkpbhmbtzz/ECAA==
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

The armada atomic_check implementation uses the deprecated
drm_atomic_get_existing_crtc_state() helper.

This hook is called as part of the global atomic_check, thus before the
states are swapped. The existing state thus points to the new state, and
we can use drm_atomic_get_new_crtc_state() instead.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
To: Russell King <linux@armlinux.org.uk>
---
 drivers/gpu/drm/armada/armada_plane.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/armada/armada_plane.c b/drivers/gpu/drm/armada/armada_plane.c
index 12a01a51d6fb7dc0e9264d4e4bf6dc4e1b472cb6..dae81ebafdb462b57478f7182e24fe7bc2915698 100644
--- a/drivers/gpu/drm/armada/armada_plane.c
+++ b/drivers/gpu/drm/armada/armada_plane.c
@@ -92,11 +92,11 @@ int armada_drm_plane_atomic_check(struct drm_plane *plane,
 	if (!new_plane_state->fb || WARN_ON(!new_plane_state->crtc)) {
 		new_plane_state->visible = false;
 		return 0;
 	}
 
-	crtc_state = drm_atomic_get_existing_crtc_state(state, crtc);
+	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
 						  0,
 						  INT_MAX, true, false);
 	if (ret)
 		return ret;

-- 
2.50.1

