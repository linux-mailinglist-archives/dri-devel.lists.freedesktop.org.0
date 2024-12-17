Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9464B9F4FCA
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 16:44:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A249C10EA03;
	Tue, 17 Dec 2024 15:44:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="TXYb7j8I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [IPv6:2a01:4f8:201:9162::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCC3210E9F9
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 15:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1734450266;
 bh=vD8T5R3i/xb217YiGqCPRSsxlhMnzbBTogkNqWoL7vY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TXYb7j8Ix20ZURydgQwuCSVb+Z+/QIr+legbkI4aqFsMsnTp9rT+4o2SLRaY/PxPi
 AJ55Q+so+G3HdulK43EzI1IaVhJ1pzbHp9u8bDiBVYUwvE5LC06BXKmukU6lp4G5+G
 4dyQDDaEGzOBlAdFU/QOf9g982ltVxwQxGbjjqF0Ozvi36j5EnYD6LBQGR+DjQipdW
 GF9hTDEzGCX6DhARxv3AboBknvF3dxxr9gt5VHwjjgRUdY3QII78wECdJ+nfGOoGIQ
 hvBVzCyXbf99bFUJCWurPgxJ11g7TIYCe2nQVGbdVtMLRr5U6VJQCuyQZwvp67RriA
 lod4IgvgSIFjA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 5B3BA17E3786;
 Tue, 17 Dec 2024 16:44:25 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 ck.hu@mediatek.com, jitao.shi@mediatek.com, jie.qiu@mediatek.com,
 junzhi.zhao@mediatek.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, dmitry.baryshkov@linaro.org
Subject: [PATCH v3 25/33] drm/mediatek: mtk_hdmi: Remove goto in
 mtk_hdmi_clk_enable_audio()
Date: Tue, 17 Dec 2024 16:43:37 +0100
Message-ID: <20241217154345.276919-26-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241217154345.276919-1-angelogioacchino.delregno@collabora.com>
References: <20241217154345.276919-1-angelogioacchino.delregno@collabora.com>
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

If the clk_prepare_enable() call for the SPDIF clock fails, just
disable and unprepare the clock in the error check branch and
return immediately instead of jumping to the end with a goto,
slightly reducing code size.

This commit brings no functional changes.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 7e4536391cfb..dbcb9fb09edd 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1095,13 +1095,12 @@ static int mtk_hdmi_clk_enable_audio(struct mtk_hdmi *hdmi)
 		return ret;
 
 	ret = clk_prepare_enable(hdmi->clk[MTK_HDMI_CLK_AUD_SPDIF]);
-	if (ret)
-		goto err;
+	if (ret) {
+		clk_disable_unprepare(hdmi->clk[MTK_HDMI_CLK_AUD_BCLK]);
+		return ret;
+	}
 
 	return 0;
-err:
-	clk_disable_unprepare(hdmi->clk[MTK_HDMI_CLK_AUD_BCLK]);
-	return ret;
 }
 
 static void mtk_hdmi_clk_disable_audio(struct mtk_hdmi *hdmi)
-- 
2.47.0

