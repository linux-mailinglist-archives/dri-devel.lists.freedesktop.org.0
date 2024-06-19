Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4205F90F0AB
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 16:32:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C973C10ECD7;
	Wed, 19 Jun 2024 14:32:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EegmEYte";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F06310ECC4
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 14:32:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 326AD61E5F;
 Wed, 19 Jun 2024 14:32:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0F808C4AF4D;
 Wed, 19 Jun 2024 14:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718807535;
 bh=H/xL/aaPV6K8CRmLwrIEXZNxCXF2qf6RiWqeP4TRBnQ=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=EegmEYteY1gHWVTtILoHw2PhGPJPHuKz4aAZQgy2nze85EQ9az7z1XZM+LypdeUrv
 BvWWORmmE96Kv9ZYuzRqcfVkng/0rMiwDoCo76ERlFzMYC3dnDqh9kIh0qUp4+ojxh
 D96IKmuj8eO0oGw/X+/MuUGc0TPApNCksgCWxFKIJTn5nmNRSoy0hnF2ahK7gw2H9C
 elYmMishTalT4VP09fjVplHVkI+1liiMJK/AyZXj2/iJqqiRSvgchYbI6+RIQcOqEC
 VnlqNKemyO+ZRppHQEJSV32WPIdC7JN4QmNG4//FU8IQEW66q/roi1mtDn8xmJaDdH
 fADzNVB7IeG0g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 05DC8C27C53;
 Wed, 19 Jun 2024 14:32:15 +0000 (UTC)
From: Hsiao Chien Sung via B4 Relay
 <devnull+shawn.sung.mediatek.com@kernel.org>
Date: Wed, 19 Jun 2024 22:30:53 +0800
Subject: [PATCH v2 12/14] drm/mediatek: Support DRM plane alpha in OVL
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240619-mediatek-drm-next-v2-12-abf68f46f8d2@mediatek.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718807531; l=1074;
 i=shawn.sung@mediatek.com; s=20240616; h=from:subject:message-id;
 bh=A1tCyNili9ONVchgKYjd+o0ng6Y8jo6rrmL1JAOqRUE=;
 b=rnRBBesRm9lrD0ENLA6aPqPsEUWcRgvzTppHIxL520esIcoOx43LOqcoP3OpMUIS4DG1zkvNQ
 oG/KM2onM+1AeTIJYBt2+umWJhT9AypTPKce2GGgN/shhjiC+8ZdNyA
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

Set the plane alpha according to DRM plane property.

Reviewed-by: CK Hu <ck.hu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 33b58da15ba4..f358dbfed5e3 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -450,8 +450,10 @@ void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
 	}
 
 	con = ovl_fmt_convert(ovl, fmt);
-	if (state->base.fb && state->base.fb->format->has_alpha)
-		con |= OVL_CON_AEN | OVL_CON_ALPHA;
+	if (state->base.fb) {
+		con |= OVL_CON_AEN;
+		con |= state->base.alpha & OVL_CON_ALPHA;
+	}
 
 	/* CONST_BLD must be enabled for XRGB formats although the alpha channel
 	 * can be ignored, or OVL will still read the value from memory.

-- 
Git-146)


