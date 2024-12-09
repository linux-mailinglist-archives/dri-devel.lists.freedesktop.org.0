Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE6D9E93F9
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 13:30:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAF1110E70B;
	Mon,  9 Dec 2024 12:30:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="B0G1QN62";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
 by gabe.freedesktop.org (Postfix) with ESMTP id A71BF10E704
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 12:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=7X6o0
 hpzj2530qDO1Llbx05J6NTctHz1/3MyYnTP84U=; b=B0G1QN62PrVfCuzlO4ilx
 UfQvObXYIcHzTqcufrmCp70HvxRHAQwQ0TvyOQcZ56Jbd9XFe3+1CeBOfFu4dw5g
 0uzsFWeTA9csdet55GFzKx8ij2ILJ/GFh1uSplFd4S5Fy7pWnnFVg9/vuosAjMmT
 0zaLucOAZp7wE79BJ7X+BQ=
Received: from ProDesk.. (unknown [58.22.7.114])
 by gzsmtp1 (Coremail) with SMTP id PCgvCgD3Woe44lZnubZICA--.5849S12;
 Mon, 09 Dec 2024 20:29:58 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: hjc@rock-chips.com, krzk+dt@kernel.org, s.hauer@pengutronix.de,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, derek.foreman@collabora.com,
 detlev.casanova@collabora.com, Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v5 07/18] drm/rockchip: vop2: Check linear format for Cluster
 windows on rk3566/8
Date: Mon,  9 Dec 2024 20:29:20 +0800
Message-ID: <20241209122943.2781431-11-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241209122943.2781431-1-andyshrk@163.com>
References: <20241209122943.2781431-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PCgvCgD3Woe44lZnubZICA--.5849S12
X-Coremail-Antispam: 1Uf129KBjvJXoW7Zr4kKw1ktFWfAFWkXw1rXrb_yoW8Ar45pF
 ZrCrZ0gr4UGrWjgr97JrsxCr4akwn2kay7Jrn3Gw13tFyxtr1DJwn8CF97Cr43Ary7C342
 yF1ftryDWFW2vr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jsa9-UUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqQuwXmdW3c3W3QAAsm
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

The Cluster windows on rk3566/8 only support afbc mode.

Fixes: 604be85547ce ("drm/rockchip: Add VOP2 driver")
Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

---

Changes in v5:
- Added in V5

 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index d7ddeec27c7d..bd8db45eeba6 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1165,6 +1165,7 @@ static int vop2_plane_atomic_check(struct drm_plane *plane,
 	struct vop2_video_port *vp;
 	struct vop2 *vop2;
 	const struct vop2_data *vop2_data;
+	struct vop2_win *win;
 	struct drm_rect *dest = &pstate->dst;
 	struct drm_rect *src = &pstate->src;
 	int min_scale = FRAC_16_16(1, 8);
@@ -1178,6 +1179,7 @@ static int vop2_plane_atomic_check(struct drm_plane *plane,
 	vp = to_vop2_video_port(crtc);
 	vop2 = vp->vop2;
 	vop2_data = vop2->data;
+	win = to_vop2_win(plane);
 
 	cstate = drm_atomic_get_existing_crtc_state(pstate->state, crtc);
 	if (WARN_ON(!cstate))
@@ -1215,6 +1217,16 @@ static int vop2_plane_atomic_check(struct drm_plane *plane,
 		return -EINVAL;
 	}
 
+	if (vop2->data->soc_id == 3568 || vop2->data->soc_id == 3566) {
+		if (vop2_cluster_window(win)) {
+			if (!rockchip_afbc(plane, fb->modifier)) {
+				drm_err(vop2->drm, "Unsupported linear format for %s\n", win->data->name);
+				return -EINVAL;
+			}
+		}
+
+	}
+
 	/*
 	 * Src.x1 can be odd when do clip, but yuv plane start point
 	 * need align with 2 pixel.
-- 
2.34.1

