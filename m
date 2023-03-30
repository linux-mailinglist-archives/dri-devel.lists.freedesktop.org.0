Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DFFD6D07E2
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 16:16:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37E0C10EE6D;
	Thu, 30 Mar 2023 14:16:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A44A610E3D5
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 14:16:41 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id EC1E3660318A;
 Thu, 30 Mar 2023 15:16:39 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1680185800;
 bh=dxC6MHx3NJXRAEW1ywTcNfOZX7I8dn5v2i9D/PKGK9c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lxDdzA/skgD2ZgYdNlhX2IjyvEpd6f4YTDdMHHtsEDnq4u3PwMSSw+jGBl2NgXFOv
 fH4mkU7RvKer8Fz4LPpZdqJ/SpAkgocyp0wbF8XDnNRs1xF1zngb/WTffZibApmXK9
 wcMF08O+71aHB/mjQlkigk+uwSGmwssq5A0aJY0naSk5PgwGh7n6xxiqsogSq7Tgl7
 5ngx85N5LQ9KSB6HOVHe0ucb3hWFkndrBOFVIJPfWiCmb4r0L5woxvsw/5Q9t5x7xZ
 N7x0H4VlheGIcQpatW3ETkuOlzs11cYH9cEH6R5Jm60AJF9bbu6AN/nlOEzih51gfd
 7BCMvtRa1IJSA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH v1 5/8] drm/mediatek: dp: Change logging to dev for
 mtk_dp_aux_transfer()
Date: Thu, 30 Mar 2023 16:16:28 +0200
Message-Id: <20230330141631.190528-7-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230330141631.190528-1-angelogioacchino.delregno@collabora.com>
References: <20230330141631.190528-1-angelogioacchino.delregno@collabora.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, wenst@chromium.org, matthias.bgg@gmail.com,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Change logging from drm_{err,info}() to dev_{err,info}() in functions
mtk_dp_aux_transfer() and mtk_dp_aux_do_transfer(): this will be
essential to avoid getting NULL pointer kernel panics if any kind
of error happens during AUX transfers happening before the bridge
is attached.

This may potentially start happening in a later commit implementing
aux-bus support, as AUX transfers will be triggered from the panel
driver (for EDID) before the mtk-dp bridge gets attached, and it's
done in preparation for the same.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index ac21eca0e20e..19b145cf2e05 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -849,7 +849,7 @@ static int mtk_dp_aux_do_transfer(struct mtk_dp *mtk_dp, bool is_read, u8 cmd,
 		u32 phy_status = mtk_dp_read(mtk_dp, MTK_DP_AUX_P0_3628) &
 				 AUX_RX_PHY_STATE_AUX_TX_P0_MASK;
 		if (phy_status != AUX_RX_PHY_STATE_AUX_TX_P0_RX_IDLE) {
-			drm_err(mtk_dp->drm_dev,
+			dev_err(mtk_dp->dev,
 				"AUX Rx Aux hang, need SW reset\n");
 			return -EIO;
 		}
@@ -2061,7 +2061,7 @@ static ssize_t mtk_dp_aux_transfer(struct drm_dp_aux *mtk_aux,
 		is_read = true;
 		break;
 	default:
-		drm_err(mtk_aux->drm_dev, "invalid aux cmd = %d\n",
+		dev_err(mtk_dp->dev, "invalid aux cmd = %d\n",
 			msg->request);
 		ret = -EINVAL;
 		goto err;
@@ -2077,7 +2077,7 @@ static ssize_t mtk_dp_aux_transfer(struct drm_dp_aux *mtk_aux,
 					     to_access);
 
 		if (ret) {
-			drm_info(mtk_dp->drm_dev,
+			dev_info(mtk_dp->dev,
 				 "Failed to do AUX transfer: %d\n", ret);
 			goto err;
 		}
-- 
2.40.0

