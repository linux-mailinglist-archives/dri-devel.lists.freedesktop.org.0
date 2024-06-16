Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA63909C7F
	for <lists+dri-devel@lfdr.de>; Sun, 16 Jun 2024 10:29:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9086310E1BA;
	Sun, 16 Jun 2024 08:29:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pL6gyk10";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F8DF10E1CA
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jun 2024 08:29:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5C29160C7B;
 Sun, 16 Jun 2024 08:29:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 82A2AC4DDE4;
 Sun, 16 Jun 2024 08:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718526555;
 bh=y4L8DPEW0N5VNTT2zRd+oYE4bUJeVmfldTAKxmr2cq4=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=pL6gyk101a9mfx7ZugzjEuVs2OlyU5b8QXjcE2GDGdFdGpFP+sKuICB8/0DwYMq2T
 4rNmwJA0aDTYVkkdx68PKB8RNZ1doI0v9JZ+ZWfog4f+Yf2hxdI3EGpvA0v3Ce9a9L
 mlWY5O0tMsnmi/l9V4ISbiD32HjORMLTf99FIO7yK3aqS5bINIBvDW6cQJxFzg9i8a
 KH1eClwU3XOSKX2Mh04P/rge8mPhD51AS6Ew5sd8iwWsQTw9a4E8KG0k73X3ddYy3E
 6Tfcnyw/f8Dq7fwJIfWIxiI1WMDZFMAQ4YUFGrWYBVpK7IyitztwD3x0tiyYpEz7o8
 wLTf5LCqmT0mg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 7AB4EC2BA16;
 Sun, 16 Jun 2024 08:29:15 +0000 (UTC)
From: Hsiao Chien Sung via B4 Relay
 <devnull+shawn.sung.mediatek.com@kernel.org>
Date: Sun, 16 Jun 2024 16:29:23 +0800
Subject: [PATCH 13/13] drm/mediatek: Support DRM plane alpha in Mixer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240616-mediatek-drm-next-v1-13-7e8f9cf785d8@mediatek.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718526553; l=901;
 i=shawn.sung@mediatek.com; s=20240616; h=from:subject:message-id;
 bh=7ThFleBFmPuW5Sf6NpW0LO1TvAYrv9i7y0k4TPqs4a4=;
 b=0Ex4IiVIAOYPqOVPscuiMW6iSaEiPi9nM1nnfH3Aq7O/HTOiD+BrqezlMqZQrnM23tubAhdL4
 757mf7Ek2kaCrKL2Mnp1PjpKWZE0hysrXjY1x0jxEnHEaPPym8U3juS
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

Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_ethdr.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_ethdr.c b/drivers/gpu/drm/mediatek/mtk_ethdr.c
index a302b12aae3f..16be98cee505 100644
--- a/drivers/gpu/drm/mediatek/mtk_ethdr.c
+++ b/drivers/gpu/drm/mediatek/mtk_ethdr.c
@@ -170,8 +170,10 @@ void mtk_ethdr_layer_config(struct device *dev, unsigned int idx,
 		return;
 	}
 
-	if (state->base.fb && state->base.fb->format->has_alpha)
-		alpha_con = MIXER_ALPHA_AEN | MIXER_ALPHA;
+	if (state->base.fb) {
+		alpha_con |= MIXER_ALPHA_AEN;
+		alpha_con |= state->base.alpha & MIXER_ALPHA;
+	}
 
 	if (state->base.fb && !state->base.fb->format->has_alpha) {
 		/*

-- 
Git-146)


