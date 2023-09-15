Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F857A17E0
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 09:58:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAC6610E16A;
	Fri, 15 Sep 2023 07:58:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDB2C10E16A
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Sep 2023 07:58:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E8E4161F11;
 Fri, 15 Sep 2023 07:58:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D4B6C433C9;
 Fri, 15 Sep 2023 07:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694764691;
 bh=t+ZshDk3vSry1uc6hCwYDbU+R1dULuj35xmF6dRVMrk=;
 h=From:To:Cc:Subject:Date:From;
 b=rvwj7lj8FTEWHvf1wUbhIc8CK5XVM4UyBTKgXnVGlvnMvDvIiuwrT/7wJJHf8L0/j
 DQLpHPOpajgELw/genwY5AfrHU5D1bHCuW6T49J9ge+LlUSOPyhj7o9KzuqPyblGT4
 iBeGAJoKwE5SH581mv/T5N5N1tit9oDbbA4VThjaayi07QnsmCLKIFl/rIQvc0lfUQ
 JEb+NxHkp8yCmzPRNnSUk11iIZijw9jWj90cvNjn2WzJPll/L01f1DCDP7JJVJit+l
 03onA6v36HsZ/+RKmw/UU+AOoCqlTnxeWDIm7kfiuGeBOIxMSvceyppdQTViv7Yp1p
 P5P33W5K4xkuA==
From: Michael Walle <mwalle@kernel.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] drm/mediatek: dsi: Fix EOTp generation
Date: Fri, 15 Sep 2023 09:57:56 +0200
Message-Id: <20230915075756.263591-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.2
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
Cc: Michael Walle <mwalle@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Jitao Shi <jitao.shi@mediatek.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The commit c87d1c4b5b9a ("drm/mediatek: dsi: Use symbolized register
definition") inverted the logic of the control bit. Maybe it was because
of the bad naming which was fixed in commit 0f3b68b66a6d ("drm/dsi: Add
_NO_ to MIPI_DSI_* flags disabling features"). In any case, the logic
wrong and there will be no EOTp on the DSI link by default. Fix it.

Fixes: c87d1c4b5b9a ("drm/mediatek: dsi: Use symbolized register definition")
Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index d67e5c61a9b9..8024b20f6b13 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -407,7 +407,7 @@ static void mtk_dsi_rxtx_control(struct mtk_dsi *dsi)
 	if (dsi->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS)
 		tmp_reg |= HSTX_CKLP_EN;
 
-	if (!(dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET))
+	if (dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET)
 		tmp_reg |= DIS_EOT;
 
 	writel(tmp_reg, dsi->regs + DSI_TXRX_CTRL);
-- 
2.39.2

