Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9C1A66A54
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 07:20:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B91C10E061;
	Tue, 18 Mar 2025 06:20:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="QCzYi/YY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
 by gabe.freedesktop.org (Postfix) with ESMTP id E62CB10E061
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 06:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=JeIAn
 ytvxe2YyCl42o/5nXwhjEdd0ZygLFlQfAIddWE=; b=QCzYi/YYsE3GHKZoE6oVc
 IhOAsmnobcdTUX6LNC2eQjxgTydY8WpgbYLrol1/1ByB3GAQdfk6y1YfWnAe6+WK
 JAklvx6E527Mvfq5tOcjPg2ZEgiuT53wOuzYKZhc/DN01lI64JW7ydfC/nzjGBHs
 CmuhsORUMTahDNftYWcEls=
Received: from ProDesk.. (unknown [])
 by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id
 _____wD3_+qpENlnvx6pAA--.16708S2; 
 Tue, 18 Mar 2025 14:20:29 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: hjc@rock-chips.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, derek.foreman@collabora.com,
 Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH] drm/rockchip: vop2: Make overlay layer select register
 configuration take effect by vsync
Date: Tue, 18 Mar 2025 14:20:17 +0800
Message-ID: <20250318062024.4555-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3_+qpENlnvx6pAA--.16708S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tw1kWw1rAr4UJF48JFy3twb_yoW8ZF43pr
 nxAry2gFZ2kF4qqrnF9F98Zr1fJwsFya1fKF9akasruas2yw1DWwnxuas8ArsxJr17Ar4j
 k39xJrW5AF42vr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jx_-PUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0gQUXmfZEI4ElgAAsu
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

Because the layer/window enable/disable is take effect by vsync, if the
overlay configuration of these layers does not follow vsync and
takes effect immediately instead, when multiple layers are dynamically
enable/disable, inconsistent display contents may be seen on the screen.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h | 1 +
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 5 ++++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
index 680bedbb770e..fc3ecb9fcd95 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
@@ -710,6 +710,7 @@ enum dst_factor_mode {
 
 #define VOP2_COLOR_KEY_MASK				BIT(31)
 
+#define RK3568_OVL_CTRL__LAYERSEL_REGDONE_SEL		GENMASK(31, 30)
 #define RK3568_OVL_CTRL__LAYERSEL_REGDONE_IMD		BIT(28)
 #define RK3568_OVL_CTRL__YUV_MODE(vp)			BIT(vp)
 
diff --git a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
index 0a2840cbe8e2..32c4ed685739 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
+++ b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
@@ -2070,7 +2070,10 @@ static void rk3568_vop2_setup_layer_mixer(struct vop2_video_port *vp)
 	struct rockchip_crtc_state *vcstate = to_rockchip_crtc_state(vp->crtc.state);
 
 	ovl_ctrl = vop2_readl(vop2, RK3568_OVL_CTRL);
-	ovl_ctrl |= RK3568_OVL_CTRL__LAYERSEL_REGDONE_IMD;
+	ovl_ctrl &= ~RK3568_OVL_CTRL__LAYERSEL_REGDONE_IMD;
+	ovl_ctrl &= ~RK3568_OVL_CTRL__LAYERSEL_REGDONE_SEL;
+	ovl_ctrl |= FIELD_PREP(RK3568_OVL_CTRL__LAYERSEL_REGDONE_SEL, vp->id);
+
 	if (vcstate->yuv_overlay)
 		ovl_ctrl |= RK3568_OVL_CTRL__YUV_MODE(vp->id);
 	else
-- 
2.43.0

