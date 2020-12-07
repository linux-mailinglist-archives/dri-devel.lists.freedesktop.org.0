Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1812D146E
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 16:09:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82DB189A4F;
	Mon,  7 Dec 2020 15:09:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB20A89A4F
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 15:09:43 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1kmI8v-0006O4-Im; Mon, 07 Dec 2020 15:09:37 +0000
From: Colin King <colin.king@canonical.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>,
 chunhui dai <chunhui.dai@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH][next] drm/mediatek: avoid dereferencing a null hdmi_phy on an
 error message
Date: Mon,  7 Dec 2020 15:09:37 +0000
Message-Id: <20201207150937.170435-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Colin Ian King <colin.king@canonical.com>

Currently there is a null pointer check for hdmi_phy that implies it
may be null, however a dev_err messages dereferences this potential null
pointer.  Avoid a null pointer dereference by only emitting the dev_err
message if hdmi_phy is non-null.  It is a moot point if the error message
needs to be printed at all, but since this is a relatively new piece of
code it may be useful to keep the message in for the moment in case there
are unforseen errors that need to be reported.

Addresses-Coverity: ("Dereference after null check")
Fixes: be28b6507c46 ("drm/mediatek: separate hdmi phy to different file")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/phy/mediatek/phy-mtk-hdmi.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-hdmi.c b/drivers/phy/mediatek/phy-mtk-hdmi.c
index c5c61f5a9ea0..5184054783c7 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi.c
@@ -84,8 +84,9 @@ mtk_hdmi_phy_dev_get_ops(const struct mtk_hdmi_phy *hdmi_phy)
 	    hdmi_phy->conf->hdmi_phy_disable_tmds)
 		return &mtk_hdmi_phy_dev_ops;
 
-	dev_err(hdmi_phy->dev, "Failed to get dev ops of phy\n");
-		return NULL;
+	if (hdmi_phy)
+		dev_err(hdmi_phy->dev, "Failed to get dev ops of phy\n");
+			return NULL;
 }
 
 static void mtk_hdmi_phy_clk_get_data(struct mtk_hdmi_phy *hdmi_phy,
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
