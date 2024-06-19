Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E72690F42E
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 18:38:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B33B10ED25;
	Wed, 19 Jun 2024 16:38:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="o9I6UWAR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3681710ED25
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 16:38:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8E3F361EAA;
 Wed, 19 Jun 2024 16:38:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0BB96C4AF0B;
 Wed, 19 Jun 2024 16:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718815125;
 bh=GMUTsruzzAYn0n7hmwAGt8zwytpi3KhL2H6cMAMOTwM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=o9I6UWARKhdQAarnE3m6YUch84ybDp4BeEm27PI45HX+rqb3jBMMzIH8Jhmb/9N40
 TMn9s/1qGLUVAT2iJqPDthvSqAWKpL/bwDsWlEIiz4GYSo7bzxbaCpx9FTwJfmbznI
 RXOdGE/jQhdQ4etIjuATVNnA/8hpz4Z9ca0sAwgXm009zp8i7VQLoXM19wJSwR+RmE
 4p0gfvPmsYDh1VrFvf4uEqtjIqYjlE1n7HRzl4ck0cuhEGSzHr4qfhz1K35ANGe9jr
 aW+Ub066hVO1sz8xnZbtX6awgpNObVsowN9+Hc5Uvo4Y9uyG1UkUH14xeV4dM68pCP
 L4gFKOOVOTApw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 01532C27C53;
 Wed, 19 Jun 2024 16:38:45 +0000 (UTC)
From: Hsiao Chien Sung via B4 Relay
 <devnull+shawn.sung.mediatek.com@kernel.org>
Date: Thu, 20 Jun 2024 00:38:44 +0800
Subject: [PATCH v3 04/14] drm/mediatek: Fix XRGB setting error in Mixer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240620-igt-v3-4-a9d62d2e2c7e@mediatek.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718815123; l=1806;
 i=shawn.sung@mediatek.com; s=20240616; h=from:subject:message-id;
 bh=iVCN8PnNVHs904I6AJ55kOr+V0K7XkkYFUBoVjBPemw=;
 b=YGUI6RWS0nP5fpjX4gax+ewcdTiGdFlfVwGr3KMmRMoWefuqd/Ov64zpSE37WmTC6fSVlfMee
 Ual5RWvPhOuAj9ENdQSkMcZOMniEGfqK685rChC26tStrwq1vx0UuNA
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

Although the alpha channel in XRGB formats can be ignored, ALPHA_CON
must be configured accordingly when using XRGB formats or it will still
affects CRC generation.

Fixes: d886c0009bd0 ("drm/mediatek: Add ETHDR support for MT8195")
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_ethdr.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_ethdr.c b/drivers/gpu/drm/mediatek/mtk_ethdr.c
index d7d16482c947..5c52e514ae30 100644
--- a/drivers/gpu/drm/mediatek/mtk_ethdr.c
+++ b/drivers/gpu/drm/mediatek/mtk_ethdr.c
@@ -153,6 +153,7 @@ void mtk_ethdr_layer_config(struct device *dev, unsigned int idx,
 	unsigned int offset = (pending->x & 1) << 31 | pending->y << 16 | pending->x;
 	unsigned int align_width = ALIGN_DOWN(pending->width, 2);
 	unsigned int alpha_con = 0;
+	bool replace_src_a = false;
 
 	dev_dbg(dev, "%s+ idx:%d", __func__, idx);
 
@@ -167,7 +168,15 @@ void mtk_ethdr_layer_config(struct device *dev, unsigned int idx,
 	if (state->base.fb && state->base.fb->format->has_alpha)
 		alpha_con = MIXER_ALPHA_AEN | MIXER_ALPHA;
 
-	mtk_mmsys_mixer_in_config(priv->mmsys_dev, idx + 1, alpha_con ? false : true,
+	if (state->base.fb && !state->base.fb->format->has_alpha) {
+		/*
+		 * Mixer doesn't support CONST_BLD mode,
+		 * use a trick to make the output equivalent
+		 */
+		replace_src_a = true;
+	}
+
+	mtk_mmsys_mixer_in_config(priv->mmsys_dev, idx + 1, replace_src_a,
 				  MIXER_ALPHA,
 				  pending->x & 1 ? MIXER_INX_MODE_EVEN_EXTEND :
 				  MIXER_INX_MODE_BYPASS, align_width / 2 - 1, cmdq_pkt);

-- 
Git-146)


