Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E002CA2A143
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 07:46:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7594C10E443;
	Thu,  6 Feb 2025 06:46:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="nMSH32G3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id 340F110E43F
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 06:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=7AGmm
 OeGuhCMtIUi8EE6fkCLWKyUGJUyO3b2vg9gaNM=; b=nMSH32G3zGOAacQVvA49/
 A22Z2fxDl6HtlcvaZTwex9INvzFAVTRs/7NArldkkC6l2KsrFBjxNowspHkSTkEL
 qZdZ38xp7lZRhlbUDAazPZtmq2QaFiHBnXgQqRH/EfYMQN03pQ1EfrGhTmM6Cxv9
 T5CBbt3ZjBKW/OV5uZ57e0=
Received: from ProDesk.. (unknown [])
 by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id
 _____wD3fyNsWqRnb3bDKQ--.52146S10; 
 Thu, 06 Feb 2025 14:45:12 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: hjc@rock-chips.com, krzk+dt@kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 derek.foreman@collabora.com, detlev.casanova@collabora.com,
 daniel@fooishbar.org, robh@kernel.org, sebastian.reichel@collabora.com,
 Andy Yan <andy.yan@rock-chips.com>,
 Michael Riesch <michael.riesch@wolfvision.net>
Subject: [PATCH v13 08/13] drm/rockchip: vop2: Set plane possible crtcs by
 possible vp mask
Date: Thu,  6 Feb 2025 14:44:36 +0800
Message-ID: <20250206064457.11396-9-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250206064457.11396-1-andyshrk@163.com>
References: <20250206064457.11396-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3fyNsWqRnb3bDKQ--.52146S10
X-Coremail-Antispam: 1Uf129KBjvJXoWxtrW8JFWkXF43Zr17tw45GFg_yoWxKrWUpa
 yxZF13WF4fCr4agry7Ja98ZFyak39xAw4a93ZrKFsxKr15Kry7Wr1UK3Z8Cr1DWFy8Zr1j
 vw43trWDur17trJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jx0eQUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0h-rXmekTP7+uAAAsP
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

From: Andy Yan <andy.yan@rock-chips.com>

In the upcoming VOP of rk3576, a window cannot attach to all Video
Ports, we introduce a possible_vp_mask for every window to indicate
which Video Ports this window can attach to.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
Tested-by: Michael Riesch <michael.riesch@wolfvision.net> # on RK3568
Tested-by: Detlev Casanova <detlev.casanova@collabora.com>
---

(no changes since v1)

 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 18 +++++++++++++++++-
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h |  1 +
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 14 ++++++++++++++
 3 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index d3e21fb00225..6040fd2388d3 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -2310,6 +2310,10 @@ static int vop2_create_crtcs(struct vop2 *vop2)
 			if (win->base.type == DRM_PLANE_TYPE_PRIMARY)
 				continue;
 
+			/* If this win can not attached to this VP */
+			if (!(win->data->possible_vp_mask & BIT(vp->id)))
+				continue;
+
 			if (vop2_is_mirror_win(win))
 				continue;
 
@@ -2341,7 +2345,19 @@ static int vop2_create_crtcs(struct vop2 *vop2)
 
 		win->type = DRM_PLANE_TYPE_OVERLAY;
 
-		possible_crtcs = (1 << nvps) - 1;
+		possible_crtcs = 0;
+		nvp = 0;
+		for (j = 0; j < vop2_data->nr_vps; j++) {
+			vp = &vop2->vps[j];
+
+			if (!vp->crtc.port)
+				continue;
+
+			if (win->data->possible_vp_mask & BIT(vp->id))
+				possible_crtcs |= BIT(nvp);
+			nvp++;
+		}
+
 		ret = vop2_plane_init(vop2, win, possible_crtcs);
 		if (ret) {
 			drm_err(vop2->drm, "failed to init overlay plane %s: %d\n",
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
index 485462749121..33b21248f5cb 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
@@ -167,6 +167,7 @@ struct vop2_win_data {
 	unsigned int phys_id;
 
 	u32 base;
+	u32 possible_vp_mask;
 	enum drm_plane_type type;
 
 	u32 nformats;
diff --git a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
index 248b9e6729e9..47b9ac2965b0 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
+++ b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
@@ -347,6 +347,7 @@ static const struct vop2_win_data rk3568_vop_win_data[] = {
 		.name = "Smart0-win0",
 		.phys_id = ROCKCHIP_VOP2_SMART0,
 		.base = 0x1c00,
+		.possible_vp_mask = BIT(0) | BIT(1) | BIT(2),
 		.formats = formats_smart,
 		.nformats = ARRAY_SIZE(formats_smart),
 		.format_modifiers = format_modifiers,
@@ -360,6 +361,7 @@ static const struct vop2_win_data rk3568_vop_win_data[] = {
 	}, {
 		.name = "Smart1-win0",
 		.phys_id = ROCKCHIP_VOP2_SMART1,
+		.possible_vp_mask = BIT(0) | BIT(1) | BIT(2),
 		.formats = formats_smart,
 		.nformats = ARRAY_SIZE(formats_smart),
 		.format_modifiers = format_modifiers,
@@ -373,6 +375,7 @@ static const struct vop2_win_data rk3568_vop_win_data[] = {
 	}, {
 		.name = "Esmart1-win0",
 		.phys_id = ROCKCHIP_VOP2_ESMART1,
+		.possible_vp_mask = BIT(0) | BIT(1) | BIT(2),
 		.formats = formats_rk356x_esmart,
 		.nformats = ARRAY_SIZE(formats_rk356x_esmart),
 		.format_modifiers = format_modifiers,
@@ -386,6 +389,7 @@ static const struct vop2_win_data rk3568_vop_win_data[] = {
 	}, {
 		.name = "Esmart0-win0",
 		.phys_id = ROCKCHIP_VOP2_ESMART0,
+		.possible_vp_mask = BIT(0) | BIT(1) | BIT(2),
 		.formats = formats_rk356x_esmart,
 		.nformats = ARRAY_SIZE(formats_rk356x_esmart),
 		.format_modifiers = format_modifiers,
@@ -400,6 +404,7 @@ static const struct vop2_win_data rk3568_vop_win_data[] = {
 		.name = "Cluster0-win0",
 		.phys_id = ROCKCHIP_VOP2_CLUSTER0,
 		.base = 0x1000,
+		.possible_vp_mask = BIT(0) | BIT(1) | BIT(2),
 		.formats = formats_cluster,
 		.nformats = ARRAY_SIZE(formats_cluster),
 		.format_modifiers = format_modifiers_afbc,
@@ -415,6 +420,7 @@ static const struct vop2_win_data rk3568_vop_win_data[] = {
 		.name = "Cluster1-win0",
 		.phys_id = ROCKCHIP_VOP2_CLUSTER1,
 		.base = 0x1200,
+		.possible_vp_mask = BIT(0) | BIT(1) | BIT(2),
 		.formats = formats_cluster,
 		.nformats = ARRAY_SIZE(formats_cluster),
 		.format_modifiers = format_modifiers_afbc,
@@ -580,6 +586,7 @@ static const struct vop2_win_data rk3588_vop_win_data[] = {
 		.name = "Cluster0-win0",
 		.phys_id = ROCKCHIP_VOP2_CLUSTER0,
 		.base = 0x1000,
+		.possible_vp_mask = BIT(0) | BIT(1) | BIT(2) | BIT(3),
 		.formats = formats_cluster,
 		.nformats = ARRAY_SIZE(formats_cluster),
 		.format_modifiers = format_modifiers_afbc,
@@ -598,6 +605,7 @@ static const struct vop2_win_data rk3588_vop_win_data[] = {
 		.name = "Cluster1-win0",
 		.phys_id = ROCKCHIP_VOP2_CLUSTER1,
 		.base = 0x1200,
+		.possible_vp_mask = BIT(0) | BIT(1) | BIT(2) | BIT(3),
 		.formats = formats_cluster,
 		.nformats = ARRAY_SIZE(formats_cluster),
 		.format_modifiers = format_modifiers_afbc,
@@ -616,6 +624,7 @@ static const struct vop2_win_data rk3588_vop_win_data[] = {
 		.name = "Cluster2-win0",
 		.phys_id = ROCKCHIP_VOP2_CLUSTER2,
 		.base = 0x1400,
+		.possible_vp_mask = BIT(0) | BIT(1) | BIT(2) | BIT(3),
 		.formats = formats_cluster,
 		.nformats = ARRAY_SIZE(formats_cluster),
 		.format_modifiers = format_modifiers_afbc,
@@ -634,6 +643,7 @@ static const struct vop2_win_data rk3588_vop_win_data[] = {
 		.name = "Cluster3-win0",
 		.phys_id = ROCKCHIP_VOP2_CLUSTER3,
 		.base = 0x1600,
+		.possible_vp_mask = BIT(0) | BIT(1) | BIT(2) | BIT(3),
 		.formats = formats_cluster,
 		.nformats = ARRAY_SIZE(formats_cluster),
 		.format_modifiers = format_modifiers_afbc,
@@ -651,6 +661,7 @@ static const struct vop2_win_data rk3588_vop_win_data[] = {
 	}, {
 		.name = "Esmart0-win0",
 		.phys_id = ROCKCHIP_VOP2_ESMART0,
+		.possible_vp_mask = BIT(0) | BIT(1) | BIT(2) | BIT(3),
 		.formats = formats_esmart,
 		.nformats = ARRAY_SIZE(formats_esmart),
 		.format_modifiers = format_modifiers,
@@ -667,6 +678,7 @@ static const struct vop2_win_data rk3588_vop_win_data[] = {
 	}, {
 		.name = "Esmart1-win0",
 		.phys_id = ROCKCHIP_VOP2_ESMART1,
+		.possible_vp_mask = BIT(0) | BIT(1) | BIT(2) | BIT(3),
 		.formats = formats_esmart,
 		.nformats = ARRAY_SIZE(formats_esmart),
 		.format_modifiers = format_modifiers,
@@ -684,6 +696,7 @@ static const struct vop2_win_data rk3588_vop_win_data[] = {
 		.name = "Esmart2-win0",
 		.phys_id = ROCKCHIP_VOP2_ESMART2,
 		.base = 0x1c00,
+		.possible_vp_mask = BIT(0) | BIT(1) | BIT(2) | BIT(3),
 		.formats = formats_esmart,
 		.nformats = ARRAY_SIZE(formats_esmart),
 		.format_modifiers = format_modifiers,
@@ -699,6 +712,7 @@ static const struct vop2_win_data rk3588_vop_win_data[] = {
 	}, {
 		.name = "Esmart3-win0",
 		.phys_id = ROCKCHIP_VOP2_ESMART3,
+		.possible_vp_mask = BIT(0) | BIT(1) | BIT(2) | BIT(3),
 		.formats = formats_esmart,
 		.nformats = ARRAY_SIZE(formats_esmart),
 		.format_modifiers = format_modifiers,
-- 
2.34.1

