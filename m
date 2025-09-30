Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9681CBAC991
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 13:00:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3BE710E579;
	Tue, 30 Sep 2025 11:00:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Gxy3+9fH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87E4310E576
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 11:00:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6E61840B1D;
 Tue, 30 Sep 2025 11:00:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3E97C4CEF0;
 Tue, 30 Sep 2025 11:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759230045;
 bh=ZrBoHMcX5+7vywVSCsbBRMvbBPVk9bd8tK6xP7bVRhs=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Gxy3+9fHcn58wPP9IRdQwq9GRRkUoV3Pfd6BINFFf0yOyvtzrkyF2lUdFUm1hCL7O
 uTz9nWt66dHUommzUhbBkBjRezGDYQuKseq58Oc7EeCHe5Rh/hqMpLgR8o4j3chyKy
 CRyrJx/to/4TqBpFhrUsw73YrRVSeXvc4KUJo6Uhns2Ebr5dKMZUweadwXPwF2+lX9
 e+b4zrvbJWgH9ChZuKO2FYh756P2Bhzk7hiAU1rUMvMznWRURY7jPc1MG60CQNqH2x
 ZM3dJtMlzzLAkBV+fSaUJBqSgbo5QH6uxeXyylEr0oaivEORN+vA6RQoCaF5Ttz8p/
 iwPfoShUmuOcA==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 30 Sep 2025 12:59:29 +0200
Subject: [PATCH v5 14/39] drm/armada: Switch to drm_atomic_get_new_crtc_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250930-drm-no-more-existing-state-v5-14-eeb9e1287907@kernel.org>
References: <20250930-drm-no-more-existing-state-v5-0-eeb9e1287907@kernel.org>
In-Reply-To: <20250930-drm-no-more-existing-state-v5-0-eeb9e1287907@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 Russell King <linux@armlinux.org.uk>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1345; i=mripard@kernel.org;
 h=from:subject:message-id; bh=ZrBoHMcX5+7vywVSCsbBRMvbBPVk9bd8tK6xP7bVRhs=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBm3d6hu+9iVqHdiZlz2mT42p8DCqXMLpym85bz3R+7nh
 ldHgrYe6pjKwiDMySArpsjyRCbs9PL2xVUO9it/wMxhZQIZwsDFKQAT+dXDWB/zWczzbqtYkvO7
 pqsiipu+bXyQV6D5MEPnwtZL1+4kBL+ffyHaaecNl4mXWAR8eoKqnjE2bM83qVF+elnA0LvS05T
 Nki/06WXJObu3hb+L3J3za/eVe0/S3lYw77F8VrfKOb6vIb0HAA==
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
2.51.0

