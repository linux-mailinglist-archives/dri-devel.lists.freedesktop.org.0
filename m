Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B64A5593019
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 15:40:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30C5DC83B1;
	Mon, 15 Aug 2022 13:40:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAB10C8302
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 13:39:49 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1oNaJn-00008Q-Vx; Mon, 15 Aug 2022 15:39:48 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1oNaJi-003vmS-9y; Mon, 15 Aug 2022 15:39:44 +0200
Received: from sha by dude02.red.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1oNaJj-00H003-Tc; Mon, 15 Aug 2022 15:39:43 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/rockchip: vop2: Fix eDP/HDMI sync polarities
Date: Mon, 15 Aug 2022 15:39:42 +0200
Message-Id: <20220815133942.4051532-1-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Michael Riesch <michael.riesch@wolfvision.net>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sandy Huang <hjc@rock-chips.com>,
 kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The hsync/vsync polarities were not honoured for the eDP and HDMI ports.
Add the register settings to configure the polarities as requested by the
DRM_MODE_FLAG_PHSYNC/DRM_MODE_FLAG_PVSYNC flags.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index e4631f515ba42..f9aa8b96c6952 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1439,11 +1439,15 @@ static void rk3568_set_intf_mux(struct vop2_video_port *vp, int id,
 		die &= ~RK3568_SYS_DSP_INFACE_EN_HDMI_MUX;
 		die |= RK3568_SYS_DSP_INFACE_EN_HDMI |
 			   FIELD_PREP(RK3568_SYS_DSP_INFACE_EN_HDMI_MUX, vp->id);
+		dip &= ~RK3568_DSP_IF_POL__HDMI_PIN_POL;
+		dip |= FIELD_PREP(RK3568_DSP_IF_POL__HDMI_PIN_POL, polflags);
 		break;
 	case ROCKCHIP_VOP2_EP_EDP0:
 		die &= ~RK3568_SYS_DSP_INFACE_EN_EDP_MUX;
 		die |= RK3568_SYS_DSP_INFACE_EN_EDP |
 			   FIELD_PREP(RK3568_SYS_DSP_INFACE_EN_EDP_MUX, vp->id);
+		dip &= ~RK3568_DSP_IF_POL__EDP_PIN_POL;
+		dip |= FIELD_PREP(RK3568_DSP_IF_POL__EDP_PIN_POL, polflags);
 		break;
 	case ROCKCHIP_VOP2_EP_MIPI0:
 		die &= ~RK3568_SYS_DSP_INFACE_EN_MIPI0_MUX;
-- 
2.30.2

