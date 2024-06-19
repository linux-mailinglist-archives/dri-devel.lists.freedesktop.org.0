Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FA790F439
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 18:39:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1498B10ED3F;
	Wed, 19 Jun 2024 16:39:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JxzNB/Zu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55AA210ED2F
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 16:38:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 81538CE2075;
 Wed, 19 Jun 2024 16:38:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4D9B6C4AF14;
 Wed, 19 Jun 2024 16:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718815125;
 bh=EtQ1Ljp0e0PGTRkBm4qGcollTC1guPOqORbt4l0xNrc=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=JxzNB/ZuybPVoPtKTj9TW9j8qgJB27fuXFGS1oQA5/KBwpCKt8XzVTwiHuR5H9Tt2
 SFxl8/NZw2PF51FOM8Q0pTCjmUZcY2gKqQm9/ks9S7arl/95hV8Uk+TgSZx3KlN87B
 XGNzptPXWXIRTec20UGsT4xvyaWsNbF7ZtE2N5HmyUDrC+8FqUCOK/6puv/U8WWJcw
 t/mYbozXt5Hl8LBQhexeThaVfuQKCMwUomGteQ1MaEpBvBuHo3ly+K2U/09VqsbPNw
 aY6qIk23gNWbiDQFDKkGPP6Qmhg0K57c4OC6A5y794AWKa5DwS7Y/xhNkvSuxutf+B
 Td8C6nupfEYVw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 42B87C2BB85;
 Wed, 19 Jun 2024 16:38:45 +0000 (UTC)
From: Hsiao Chien Sung via B4 Relay
 <devnull+shawn.sung.mediatek.com@kernel.org>
Date: Thu, 20 Jun 2024 00:38:49 +0800
Subject: [PATCH v3 09/14] drm/mediatek: Add new color format MACROs in OVL
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240620-igt-v3-9-a9d62d2e2c7e@mediatek.com>
References: <20240620-igt-v3-0-a9d62d2e2c7e@mediatek.com>
In-Reply-To: <20240620-igt-v3-0-a9d62d2e2c7e@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 CK Hu <ck.hu@mediatek.com>, Bibby Hsieh <bibby.hsieh@mediatek.com>, 
 Daniel Kurtz <djkurtz@chromium.org>, Mao Huang <littlecvr@chromium.org>, 
 "Nancy.Lin" <nancy.lin@mediatek.com>
Cc: YT Shen <yt.shen@mediatek.com>, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Hsiao Chien Sung <shawn.sung@mediatek.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718815123; l=2232;
 i=shawn.sung@mediatek.com; s=20240616; h=from:subject:message-id;
 bh=KGjuxOTeaeQJ/coPucc6FKKJb8sUdPSBSXtke+B/fBI=;
 b=mJ+gW1gLHwshZkTbNUY0XOFyBs9HlcB+VSxqO8CA7iGj7RSicbr/TuWM20n/lxPNEDWvsxfVy
 O55Q/YzWXewAUBMR/GanirV+8UZWJ5+iI4MiPExVovcW6LwyokP7FIl
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

Define new color formats to hide the bit operation in the MACROs to make
the switch statement more concise.
Change the MACROs to align the naming rule in DRM.

Reviewed-by: CK Hu <ck.hu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 26b598b9f71f..33c332b29381 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -55,8 +55,10 @@
 #define OVL_CON_BYTE_SWAP	BIT(24)
 #define OVL_CON_MTX_YUV_TO_RGB	(6 << 16)
 #define OVL_CON_CLRFMT_RGB	(1 << 12)
-#define OVL_CON_CLRFMT_RGBA8888	(2 << 12)
-#define OVL_CON_CLRFMT_ARGB8888	(3 << 12)
+#define OVL_CON_CLRFMT_ARGB8888	(2 << 12)
+#define OVL_CON_CLRFMT_RGBA8888	(3 << 12)
+#define OVL_CON_CLRFMT_ABGR8888	(OVL_CON_CLRFMT_RGBA8888 | OVL_CON_BYTE_SWAP)
+#define OVL_CON_CLRFMT_BGRA8888	(OVL_CON_CLRFMT_ARGB8888 | OVL_CON_BYTE_SWAP)
 #define OVL_CON_CLRFMT_UYVY	(4 << 12)
 #define OVL_CON_CLRFMT_YUYV	(5 << 12)
 #define OVL_CON_CLRFMT_RGB565(ovl)	((ovl)->data->fmt_rgb565_is_0 ? \
@@ -377,18 +379,18 @@ static unsigned int ovl_fmt_convert(struct mtk_disp_ovl *ovl, unsigned int fmt)
 		return OVL_CON_CLRFMT_RGB888(ovl) | OVL_CON_BYTE_SWAP;
 	case DRM_FORMAT_RGBX8888:
 	case DRM_FORMAT_RGBA8888:
-		return OVL_CON_CLRFMT_ARGB8888;
+		return OVL_CON_CLRFMT_RGBA8888;
 	case DRM_FORMAT_BGRX8888:
 	case DRM_FORMAT_BGRA8888:
 	case DRM_FORMAT_BGRA1010102:
-		return OVL_CON_CLRFMT_ARGB8888 | OVL_CON_BYTE_SWAP;
+		return OVL_CON_CLRFMT_BGRA8888;
 	case DRM_FORMAT_XRGB8888:
 	case DRM_FORMAT_ARGB8888:
 	case DRM_FORMAT_ARGB2101010:
-		return OVL_CON_CLRFMT_RGBA8888;
+		return OVL_CON_CLRFMT_ARGB8888;
 	case DRM_FORMAT_XBGR8888:
 	case DRM_FORMAT_ABGR8888:
-		return OVL_CON_CLRFMT_RGBA8888 | OVL_CON_BYTE_SWAP;
+		return OVL_CON_CLRFMT_ABGR8888;
 	case DRM_FORMAT_UYVY:
 		return OVL_CON_CLRFMT_UYVY | OVL_CON_MTX_YUV_TO_RGB;
 	case DRM_FORMAT_YUYV:

-- 
Git-146)


