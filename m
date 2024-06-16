Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE7E909C83
	for <lists+dri-devel@lfdr.de>; Sun, 16 Jun 2024 10:29:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADC7510E268;
	Sun, 16 Jun 2024 08:29:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oB/nmopM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5200A10E223
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jun 2024 08:29:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id CE6C8CE0B53;
 Sun, 16 Jun 2024 08:29:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D83F2C4AF1D;
 Sun, 16 Jun 2024 08:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718526554;
 bh=Rxn1gnGGokSSuKzKIeIUyeSaIESIT/g/wWVSlGfjLDk=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=oB/nmopMltO0EzxN7IWfWOREtAtuBDPyJoyDW1OHbY3/tPGezT2N39kjs99BtMKkk
 /OdZsUi0y6XMzHpcBfWQyD/dBKU7IvUUvylmaC8x+SU4N+CjCKiGg+V6RsZZuSClpn
 kqtVL7ODGCLoeiT7dDSR3+gcaWjc1X4Tm+S9WV+CRRYGaOCNlynOs4nmNYjA9Gr2TC
 8SzE34f1NHI68o6/PjwpuQoESbDMXqfmHuMW5qkhLjD7ewFz0QvcLGm0E9sk86NwD/
 cl5bd2yYFRogWTWDOHB3GUs2vdpE0IMgSwX1wtiQAPH4/WFEwpEHQi7/OXrMd6p41n
 79WBVJOaxXbgQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id C512BC2BA15;
 Sun, 16 Jun 2024 08:29:14 +0000 (UTC)
From: Hsiao Chien Sung via B4 Relay
 <devnull+shawn.sung.mediatek.com@kernel.org>
Date: Sun, 16 Jun 2024 16:29:11 +0800
Subject: [PATCH 01/13] soc: mediatek: Disable 9-bit alpha in ETHDR
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240616-mediatek-drm-next-v1-1-7e8f9cf785d8@mediatek.com>
References: <20240616-mediatek-drm-next-v1-0-7e8f9cf785d8@mediatek.com>
In-Reply-To: <20240616-mediatek-drm-next-v1-0-7e8f9cf785d8@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 CK Hu <ck.hu@mediatek.com>, Bibby Hsieh <bibby.hsieh@mediatek.com>, 
 Daniel Kurtz <djkurtz@chromium.org>, YT Shen <yt.shen@mediatek.com>, 
 Mao Huang <littlecvr@chromium.org>, "Nancy.Lin" <nancy.lin@mediatek.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Hsiao Chien Sung <shawn.sung@mediatek.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718526553; l=2103;
 i=shawn.sung@mediatek.com; s=20240616; h=from:subject:message-id;
 bh=AhpL6mafGPf92ATlXUF9GJd5xSZP0P96bzGL4snlDgc=;
 b=wItu85Eor8vZDTd2CEgLbljnmpGnci2Gj9uQnt0nUPAZYN+tofn1d7wu0+uu4ryK64HWsaHAM
 7xOuKPpTiFkCxlEy11K8dLZRwBcUGjA6kbqDe+Fh9CG9L6KWA6cHKaw
X-Developer-Key: i=shawn.sung@mediatek.com; a=ed25519;
 pk=lq1w8BuWDINX+4JHjGHhhbAU5ICP+cL9VCj7wn+cEDA=
X-Endpoint-Received: by B4 Relay for shawn.sung@mediatek.com/20240616 with
 auth_id=172
X-Original-From: Hsiao Chien Sung <shawn.sung@mediatek.com>
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
Reply-To: shawn.sung@mediatek.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Hsiao Chien Sung <shawn.sung@mediatek.com>

When 9-bit alpha is enabled, its value will be converted from 0-255 to
0-256 (255 = not defined). This is designed for special HDR related
calculation, which should be disabled by default, otherwise, alpha
blending will not work correctly.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_ethdr.c | 3 +--
 drivers/soc/mediatek/mtk-mmsys.c     | 1 +
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_ethdr.c b/drivers/gpu/drm/mediatek/mtk_ethdr.c
index 156c6ff547e8..d7d16482c947 100644
--- a/drivers/gpu/drm/mediatek/mtk_ethdr.c
+++ b/drivers/gpu/drm/mediatek/mtk_ethdr.c
@@ -50,7 +50,6 @@
 
 #define MIXER_INX_MODE_BYPASS			0
 #define MIXER_INX_MODE_EVEN_EXTEND		1
-#define DEFAULT_9BIT_ALPHA			0x100
 #define	MIXER_ALPHA_AEN				BIT(8)
 #define	MIXER_ALPHA				0xff
 #define ETHDR_CLK_NUM				13
@@ -169,7 +168,7 @@ void mtk_ethdr_layer_config(struct device *dev, unsigned int idx,
 		alpha_con = MIXER_ALPHA_AEN | MIXER_ALPHA;
 
 	mtk_mmsys_mixer_in_config(priv->mmsys_dev, idx + 1, alpha_con ? false : true,
-				  DEFAULT_9BIT_ALPHA,
+				  MIXER_ALPHA,
 				  pending->x & 1 ? MIXER_INX_MODE_EVEN_EXTEND :
 				  MIXER_INX_MODE_BYPASS, align_width / 2 - 1, cmdq_pkt);
 
diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index f370f4ec4b88..938240714e54 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -236,6 +236,7 @@ void mtk_mmsys_mixer_in_config(struct device *dev, int idx, bool alpha_sel, u16
 
 	mtk_mmsys_update_bits(mmsys, MT8195_VDO1_MIXER_IN1_ALPHA + (idx - 1) * 4, ~0,
 			      alpha << 16 | alpha, cmdq_pkt);
+	mtk_mmsys_update_bits(mmsys, MT8195_VDO1_HDR_TOP_CFG, BIT(15 + idx), 0, cmdq_pkt);
 	mtk_mmsys_update_bits(mmsys, MT8195_VDO1_HDR_TOP_CFG, BIT(19 + idx),
 			      alpha_sel << (19 + idx), cmdq_pkt);
 	mtk_mmsys_update_bits(mmsys, MT8195_VDO1_MIXER_IN1_PAD + (idx - 1) * 4,

-- 
Git-146)


