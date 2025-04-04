Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F09B4A7BDD5
	for <lists+dri-devel@lfdr.de>; Fri,  4 Apr 2025 15:31:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A6A410EBC5;
	Fri,  4 Apr 2025 13:31:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id AE19510EBBF
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Apr 2025 13:30:56 +0000 (UTC)
X-CSE-ConnectionGUID: ZtlBYCn1TkGm2BQAwGXDAg==
X-CSE-MsgGUID: VA+xeUKjTWu6Icq7FgYE+g==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie5.idc.renesas.com with ESMTP; 04 Apr 2025 22:30:53 +0900
Received: from localhost.localdomain (unknown [10.226.92.131])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id BDF2642A1899;
 Fri,  4 Apr 2025 22:30:49 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Biju Das <biju.das.au@gmail.com>
Subject: [PATCH] drm: renesas: Add zpos,
 alpha and blend properties to RZ/G2L DU
Date: Fri,  4 Apr 2025 14:30:45 +0100
Message-ID: <20250404133047.172080-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for zpos, alpha and blend properties to RZ/G2L DU
driver as the IP supports all these properties.

It is tested by the below modetest commands:

modetest -M rzg2l-du -s 44@42:1920x1080@AR24 -d -P \
37@42:512x300+200+200@XR15

modetest -M rzg2l-du -w {32,37}:alpha:{0,65535}
modetest -M rzg2l-du -w {32,37}:zpos:{0,1}

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c
index 8643ff2eec46..040d4e4aff00 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c
@@ -340,6 +340,15 @@ int rzg2l_du_vsp_init(struct rzg2l_du_vsp *vsp, struct device_node *np,
 
 		drm_plane_helper_add(&plane->plane,
 				     &rzg2l_du_vsp_plane_helper_funcs);
+
+		drm_plane_create_alpha_property(&plane->plane);
+		drm_plane_create_zpos_property(&plane->plane, i, 0,
+					       num_planes - 1);
+
+		drm_plane_create_blend_mode_property(&plane->plane,
+					BIT(DRM_MODE_BLEND_PIXEL_NONE) |
+					BIT(DRM_MODE_BLEND_PREMULTI) |
+					BIT(DRM_MODE_BLEND_COVERAGE));
 	}
 
 	return 0;
-- 
2.43.0

