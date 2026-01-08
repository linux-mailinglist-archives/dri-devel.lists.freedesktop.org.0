Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82027D0216A
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 11:20:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 361B010E6E8;
	Thu,  8 Jan 2026 10:20:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ZOOZJESj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C5F810E09E
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 10:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1767867612;
 bh=YyeBDlNSLY4ru+W23YyttLQ3wHEda1dN+Y7WEoCQAts=;
 h=From:To:Cc:Subject:Date:From;
 b=ZOOZJESj4giVfU+dJYjFnTOe3lg+laQO/reAJsmJjsh6SiISklOJahmN+7Wa9b3a8
 4j3LOIXvAw17G9kCb6Rwqbm4wP6Yo88RSdIXBMhcZQ8lduNCWWmH2nXLDEDLGMmRNh
 LeHJ9MDtsai+wmu0zkcBJnaXfxWs4T4pTAdUqZ2UmkYLXhYY+0OqOHD8JCpOfXucsr
 r4BRT3rjov2hfxc/j7H2lEbB7W7RbxqFdZutVvYEF1E+CrSFh5WvOSSUe7CzEZab2N
 1S3PDe2tPfWt4SdySOwQet1aOCGiUs1c9xRk5zmgSmLtW5oGMrNshY1fYCQra4lhbe
 /UlAyNpwKBYmg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 4BCA817E1330;
 Thu,  8 Jan 2026 11:20:12 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 bisson.gary@gmail.com, kernel@collabora.com
Subject: [PATCH] drm/mediatek: mtk_dsi: Add support for High Speed (HS) mode
Date: Thu,  8 Jan 2026 11:19:59 +0100
Message-ID: <20260108101959.14872-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.52.0
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

Up until now, the MediaTek DSI Controller has always been working
in Low Power Mode (LPM), as this driver has always ignored the
MIPI_DSI_MSG_USE_LPM flag hence never setting HS mode.

In the current state of the driver the only thing that is needed
to add support for DSI High Speed (HS) transmit is to simply set
the "HSTX" config bit in the configuration register.

Check if flag MIPI_DSI_MSG_USE_LPM is set and, if not, set HSTX.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index e4953d5cb6a8..a90cae9512c5 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -155,6 +155,7 @@
 #define SHORT_PACKET			0
 #define LONG_PACKET			2
 #define BTA				BIT(2)
+#define HSTX				BIT(3)
 #define DATA_ID				GENMASK(15, 8)
 #define DATA_0				GENMASK(23, 16)
 #define DATA_1				GENMASK(31, 24)
@@ -1177,6 +1178,9 @@ static void mtk_dsi_cmdq(struct mtk_dsi *dsi, const struct mipi_dsi_msg *msg)
 	else
 		config = (msg->tx_len > 2) ? LONG_PACKET : SHORT_PACKET;
 
+	if (!(msg->flags & MIPI_DSI_MSG_USE_LPM))
+		config |= HSTX;
+
 	if (msg->tx_len > 2) {
 		cmdq_size = 1 + (msg->tx_len + 3) / 4;
 		cmdq_off = 4;
-- 
2.52.0

