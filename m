Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 541A971FD39
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 11:11:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E78310E63E;
	Fri,  2 Jun 2023 09:11:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CECC210E63E
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jun 2023 09:11:49 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:158c:2ccf:1f70:e136])
 by baptiste.telenet-ops.be with bizsmtp
 id 49Bg2A00L1tRZS8019BgSY; Fri, 02 Jun 2023 11:11:46 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1q50ob-00BvaU-4t;
 Fri, 02 Jun 2023 11:11:40 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1q50ou-00ASIR-8C;
 Fri, 02 Jun 2023 11:11:40 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 Jyri Sarha <jyri.sarha@iki.fi>, Tomi Valkeinen <tomba@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH 3/3] drm: Fix references to drm_plane_helper_check_state()
Date: Fri,  2 Jun 2023 11:11:36 +0200
Message-Id: <2408d7841c91e98e9a2b24b1b4df9b2b865519a6.1685696114.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1685696114.git.geert+renesas@glider.be>
References: <cover.1685696114.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As of commit a01cb8ba3f628293 ("drm: Move drm_plane_helper_check_state()
into drm_atomic_helper.c"), drm_plane_helper_check_state() no longer
exists, but is part of drm_atomic_helper_check_plane_state().

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Interestingly, all these comments appeared only after the commit that
removed the function...

This is against next-20230602, which does not have the
drivers/gpu/drm/{ => renesas}/rcar-du move yet.

Biju: you're adding a new copy in
drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
---
 drivers/gpu/drm/rcar-du/rcar_du_plane.c | 3 ++-
 drivers/gpu/drm/tidss/tidss_plane.c     | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.c b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
index d759e019218181ce..e445fac8e0b46c21 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
@@ -600,7 +600,8 @@ int __rcar_du_plane_atomic_check(struct drm_plane *plane,
 	if (!state->crtc) {
 		/*
 		 * The visible field is not reset by the DRM core but only
-		 * updated by drm_plane_helper_check_state(), set it manually.
+		 * updated by drm_atomic_helper_check_plane_state(), set it
+		 * manually.
 		 */
 		state->visible = false;
 		*format = NULL;
diff --git a/drivers/gpu/drm/tidss/tidss_plane.c b/drivers/gpu/drm/tidss/tidss_plane.c
index 6bdd6e4a955ab3cc..e1c0ef0c3894c855 100644
--- a/drivers/gpu/drm/tidss/tidss_plane.c
+++ b/drivers/gpu/drm/tidss/tidss_plane.c
@@ -38,7 +38,8 @@ static int tidss_plane_atomic_check(struct drm_plane *plane,
 	if (!new_plane_state->crtc) {
 		/*
 		 * The visible field is not reset by the DRM core but only
-		 * updated by drm_plane_helper_check_state(), set it manually.
+		 * updated by drm_atomic_helper_check_plane_state(), set it
+		 * manually.
 		 */
 		new_plane_state->visible = false;
 		return 0;
-- 
2.34.1

