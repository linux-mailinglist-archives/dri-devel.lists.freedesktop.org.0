Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6669F2BBA
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 09:25:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B72610E3FE;
	Mon, 16 Dec 2024 08:25:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1059 seconds by postgrey-1.36 at gabe;
 Sun, 15 Dec 2024 22:27:34 UTC
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org
 [IPv6:2a07:2ec0:3002::65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5DA810E00C
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2024 22:27:34 +0000 (UTC)
Received: from local
 by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.98) (envelope-from <daniel@makrotopia.org>)
 id 1tMwo8-000000002oV-1Trq; Sun, 15 Dec 2024 22:09:48 +0000
Date: Sun, 15 Dec 2024 22:09:41 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Justin Green <greenjustin@chromium.org>,
 Frank Wunderlich <frank-w@public-files.de>,
 John Crispin <john@phrozen.org>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Subject: [PATCH] drm/mediatek: only touch DISP_REG_OVL_PITCH_MSB if AFBC is
 supported
Message-ID: <8c001c8e70d93d64d3ee6bf7dc5078d2783d4e32.1734300345.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailman-Approved-At: Mon, 16 Dec 2024 08:25:53 +0000
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

Touching DISP_REG_OVL_PITCH_MSB leads to video overlay on MT2701, MT7623N
and probably other older SoCs being broken.

Only touching it on hardware which actually supports AFBC like it was
before commit c410fa9b07c3 ("drm/mediatek: Add AFBC support to Mediatek
DRM driver") fixes it.

Fixes: c410fa9b07c3 ("drm/mediatek: Add AFBC support to Mediatek DRM driver")
Cc: stable@vger.kernel.org
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index f731d4fbe8b6..321b40a387cd 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -545,7 +545,7 @@ void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
 				      &ovl->cmdq_reg, ovl->regs, DISP_REG_OVL_PITCH_MSB(idx));
 		mtk_ddp_write_relaxed(cmdq_pkt, hdr_pitch, &ovl->cmdq_reg, ovl->regs,
 				      DISP_REG_OVL_HDR_PITCH(ovl, idx));
-	} else {
+	} else if (ovl->data->supports_afbc) {
 		mtk_ddp_write_relaxed(cmdq_pkt,
 				      overlay_pitch.split_pitch.msb,
 				      &ovl->cmdq_reg, ovl->regs, DISP_REG_OVL_PITCH_MSB(idx));
-- 
2.47.1

