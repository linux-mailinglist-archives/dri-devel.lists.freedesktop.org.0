Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1504E651DE9
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 10:47:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0138E10E371;
	Tue, 20 Dec 2022 09:46:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DB7C10E371
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 09:46:51 +0000 (UTC)
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1p7ZAr-0007jf-0g; Tue, 20 Dec 2022 10:44:37 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/imx: ipuv3-plane: reuse local variable height in
 atomic_update
Date: Tue, 20 Dec 2022 10:44:30 +0100
Message-Id: <20221220094430.3469811-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
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
Cc: kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the already existing local variable height = drm_rect_height() >> 16
to replace other occurrences of the same value.

Suggested-by: Lucas Stach <l.stach@pengutronix.de>
Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c b/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
index 80142d9a4a55..dade8b59feae 100644
--- a/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
+++ b/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
@@ -618,6 +618,7 @@ static void ipu_plane_atomic_update(struct drm_plane *plane,
 		width = ipu_src_rect_width(new_state);
 	else
 		width = drm_rect_width(&new_state->src) >> 16;
+	height = drm_rect_height(&new_state->src) >> 16;
 
 	eba = drm_plane_state_to_eba(new_state, 0);
 
@@ -628,9 +629,9 @@ static void ipu_plane_atomic_update(struct drm_plane *plane,
 	if (ipu_state->use_pre) {
 		axi_id = ipu_chan_assign_axi_id(ipu_plane->dma);
 		ipu_prg_channel_configure(ipu_plane->ipu_ch, axi_id, width,
-					  drm_rect_height(&new_state->src) >> 16,
-					  fb->pitches[0], fb->format->format,
-					  fb->modifier, &eba);
+					  height, fb->pitches[0],
+					  fb->format->format, fb->modifier,
+					  &eba);
 	}
 
 	if (!old_state->fb ||
@@ -684,7 +685,6 @@ static void ipu_plane_atomic_update(struct drm_plane *plane,
 
 	ipu_dmfc_config_wait4eot(ipu_plane->dmfc, width);
 
-	height = drm_rect_height(&new_state->src) >> 16;
 	info = drm_format_info(fb->format->format);
 	ipu_calculate_bursts(width, info->cpp[0], fb->pitches[0],
 			     &burstsize, &num_bursts);
@@ -747,8 +747,7 @@ static void ipu_plane_atomic_update(struct drm_plane *plane,
 		ipu_cpmem_set_burstsize(ipu_plane->ipu_ch, 16);
 
 		ipu_cpmem_zero(ipu_plane->alpha_ch);
-		ipu_cpmem_set_resolution(ipu_plane->alpha_ch, width,
-					 drm_rect_height(&new_state->src) >> 16);
+		ipu_cpmem_set_resolution(ipu_plane->alpha_ch, width, height);
 		ipu_cpmem_set_format_passthrough(ipu_plane->alpha_ch, 8);
 		ipu_cpmem_set_high_priority(ipu_plane->alpha_ch);
 		ipu_idmac_set_double_buffer(ipu_plane->alpha_ch, 1);

base-commit: 4b6cb2b67da883bc5095ee6d77f951f1cd7a1c24
-- 
2.30.2

