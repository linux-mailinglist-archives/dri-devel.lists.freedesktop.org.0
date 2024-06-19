Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CE890F0A1
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 16:32:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7270A10ECCF;
	Wed, 19 Jun 2024 14:32:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KHo3JVfm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2EE110ECCA
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 14:32:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 036DE61E53;
 Wed, 19 Jun 2024 14:32:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BCC5BC4AF11;
 Wed, 19 Jun 2024 14:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718807534;
 bh=RcmQcMTGb3TjjetIygkqxi2DFEmz4EZHzeWqu6F7toc=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=KHo3JVfmCxOaL63n6fJLsKP8lVeBOGVeMJICLHVttOLOgkG91Bxyn8mIMcFD7KHkr
 xlaMuabrd0PRI9oLSR9qYHRcC8wWpTcHVUmn1l96iVmLT6VMZBxvzZNNVHfUryscpl
 czLMx71uZ3heD79GApGA1qKXUTk0fBtOmSMo0/lbY5rok5pRB33v0BZyDAzC/b3tZL
 SSa32A/lX2ySTNLKdfS0kOrKsqsw9cYe5KC5rROGVSHZFZ6d+MvqTSFVAzW8XPqnhD
 6xXkNAVWyXnKVydMcI+q4FZ4FKYmevfRtQybc1QJ/hyLy12AhMh/j6E6vIt2Sf63rH
 I7D/0FovnsLtQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id B1AFCC27C53;
 Wed, 19 Jun 2024 14:32:14 +0000 (UTC)
From: Hsiao Chien Sung via B4 Relay
 <devnull+shawn.sung.mediatek.com@kernel.org>
Date: Wed, 19 Jun 2024 22:30:49 +0800
Subject: [PATCH v2 08/14] drm/mediatek: Add new color format MACROs in OVL
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240619-mediatek-drm-next-v2-8-abf68f46f8d2@mediatek.com>
References: <20240619-mediatek-drm-next-v2-0-abf68f46f8d2@mediatek.com>
In-Reply-To: <20240619-mediatek-drm-next-v2-0-abf68f46f8d2@mediatek.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718807531; l=2232;
 i=shawn.sung@mediatek.com; s=20240616; h=from:subject:message-id;
 bh=oUVv7apF4+nnjxXV56NKRfwr0Y4AFgBqQp/J41EVF8c=;
 b=CurnOUQgY9U6U5M2zMATgsFC1vs0x2x3pnYy8evYWtiNqeVJKwC9GAWJg9+fl9t91UoRWXXQu
 C1C7qcO6aT0AMidpUF7y6DA+NhN+R6yOWP+msh/CWnG2qQLIHQbVxMp
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
index 880ef61ccc92..3724f77c5b6b 100644
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
@@ -369,18 +371,18 @@ static unsigned int ovl_fmt_convert(struct mtk_disp_ovl *ovl, unsigned int fmt)
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


