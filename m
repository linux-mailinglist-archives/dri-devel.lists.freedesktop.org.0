Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC8CB4ABD7
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 13:28:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89B5710E6B3;
	Tue,  9 Sep 2025 11:28:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bnE781lE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95E9D10E6AF
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 11:28:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 102396021E;
 Tue,  9 Sep 2025 11:28:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B02CC4CEF4;
 Tue,  9 Sep 2025 11:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757417309;
 bh=3d9dYH78yZfGAgZ6MyObiqoeZO2loBXB3X6qJN0sLWM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=bnE781lEIOdTyBuFIE70HjqrPJrG9HAQOQNxynx2dV7vz+gKej02Wa8U1JaYuzcLU
 +FIvCwB0BWh/RM+/FF8SahB0ndWVfciofHOJkThaHHPDbTsbtpWfsXQDU9LuWxi7GD
 IsvVVcOzr45O3IMbludMKaUVkZoK0n1oZxQXfmy0TlQ9ATKUru9NblpFIi7Rs8QlEf
 egUhYhIMH/yMAinSuEEBBEKdYhw9S0u7qS1zxmKd0oipaoyMdWb/cWYdk3Tfw6K1RG
 ykg4Vn7R6Z0OIPiTHJyrZ6ahczEim5v4dcVHeTczfBL2/J8kEO7P12haBjJ57klF8V
 M2sU+kqmSOnYg==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 09 Sep 2025 13:27:33 +0200
Subject: [PATCH v3 14/39] drm/armada: Switch to drm_atomic_get_new_crtc_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250909-drm-no-more-existing-state-v3-14-1c7a7d960c33@kernel.org>
References: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
In-Reply-To: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 Russell King <linux@armlinux.org.uk>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1453; i=mripard@kernel.org;
 h=from:subject:message-id; bh=3d9dYH78yZfGAgZ6MyObiqoeZO2loBXB3X6qJN0sLWM=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBkH+DWu64QsOakmWLzN7srfQqPkB76hUyQXbbr1SPf74
 n9emRWCHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAindmMtTIPb6won2az/tQR
 a16Ox+ZbQ3u47wkJW53OD5SLe9ASbTen+OfGjvZP81ofd8659m37Dcb6qtx3O0y/8PKbb/KLXn9
 KMctO+J799aw2g8z+V9LHuTM0XFLf8mSs91uiu0IjND148zsA
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
index 976b6a271c912421e3fec7525f77234e73a74212..d57f9ad6868fbd102afed2704dd9d411c49713ff 100644
--- a/drivers/gpu/drm/armada/armada_plane.c
+++ b/drivers/gpu/drm/armada/armada_plane.c
@@ -84,11 +84,11 @@ int armada_drm_plane_atomic_check(struct drm_plane *plane,
 	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
 										 plane);
 	struct armada_plane_state *st = to_armada_plane_state(new_plane_state);
 	struct drm_crtc *crtc = new_plane_state->crtc;
 	struct drm_crtc_state *crtc_state =
-		drm_atomic_get_existing_crtc_state(state, crtc);
+		drm_atomic_get_new_crtc_state(state, crtc);
 	bool interlace;
 	int ret;
 
 	if (!new_plane_state->fb || WARN_ON(!new_plane_state->crtc)) {
 		new_plane_state->visible = false;

-- 
2.50.1

