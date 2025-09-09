Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E182EB4ABF1
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 13:29:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F6DB10E6C5;
	Tue,  9 Sep 2025 11:29:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YvMMI0Gt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8F9C10E6C3
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 11:29:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3756F6021E;
 Tue,  9 Sep 2025 11:29:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 824F6C4CEF4;
 Tue,  9 Sep 2025 11:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757417353;
 bh=NiUJVJPIwoJrZgeHdcg7z4FJZfkN7UdLHGCBvZa3t0s=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=YvMMI0GtaEPGzdqdtr+moUlBaQqDvmTIYvOytA/xE43Zm9JbpMabqqblv5Gt7vOq4
 37KKCkawpKWU8sXOAPmFmsnPN2vUA6b99v3+uRISArG4TcqvxGafhiLK9/3tbZ9f0q
 ehZfmREdraB4nbRKi4WfE39Y9BXNyN+B362G7rFmeK7c0evqNVoBVZCpket8ku3qGE
 qzcyDI+rN/85KqSI33FqC0t74L2pd7LujeYsKoeJwB3vgHIgj0TZGSSr0ZjtIzAMRl
 PyRJUdl+Ttxiv39WLZjl0JNGzqdrjY+piUhcv8UZxuP3JdibCpu4zPqjuZc0okiKsD
 fXT/LW16uSmyA==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 09 Sep 2025 13:27:49 +0200
Subject: [PATCH v3 30/39] drm/tilcdc: Switch to drm_atomic_get_new_crtc_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250909-drm-no-more-existing-state-v3-30-1c7a7d960c33@kernel.org>
References: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
In-Reply-To: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1475; i=mripard@kernel.org;
 h=from:subject:message-id; bh=NiUJVJPIwoJrZgeHdcg7z4FJZfkN7UdLHGCBvZa3t0s=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBkH+PXz5V+nzF8qtolfa76gh/frfX2W01dPjjLZ9eZiR
 0JIeoB2x1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZjItMeMDZOvbZ7/PfD7K2dT
 5+tmzspl2W0FQodOX3uQd6/2z/+3p/wW9gqZloicd7uTtuqSPufV74x1yo+rnqW89DRdUpbdafU
 o4mVN+9p7DQdX7LnBJjmd5fultdHi9xU+RPquObfzTNPmHr2rAA==
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

The tilcdc atomic_check implementation uses the deprecated
drm_atomic_get_existing_crtc_state() helper.

This hook is called as part of the global atomic_check, thus before the
states are swapped. The existing state thus points to the new state, and
we can use drm_atomic_get_new_crtc_state() instead.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
To: Jyri Sarha <jyri.sarha@iki.fi>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/tilcdc/tilcdc_plane.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_plane.c b/drivers/gpu/drm/tilcdc/tilcdc_plane.c
index cf77a8ce7398040814ec20eeffc6da960e36dfc0..aa72ca679598b6617366e89ffb3838ed8b323f2f 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_plane.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_plane.c
@@ -40,12 +40,11 @@ static int tilcdc_plane_atomic_check(struct drm_plane *plane,
 		dev_err(plane->dev->dev, "%s: crtc position must be zero.",
 			__func__);
 		return -EINVAL;
 	}
 
-	crtc_state = drm_atomic_get_existing_crtc_state(state,
-							new_state->crtc);
+	crtc_state = drm_atomic_get_new_crtc_state(state, new_state->crtc);
 	/* we should have a crtc state if the plane is attached to a crtc */
 	if (WARN_ON(!crtc_state))
 		return 0;
 
 	if (crtc_state->mode.hdisplay != new_state->crtc_w ||

-- 
2.50.1

