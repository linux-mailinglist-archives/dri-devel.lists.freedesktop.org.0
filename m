Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A25B590F504
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 19:27:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1945010ED54;
	Wed, 19 Jun 2024 17:27:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LL/fLTO2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E9E810ED5A
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 17:27:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D254261F24;
 Wed, 19 Jun 2024 17:27:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6281EC4AF0B;
 Wed, 19 Jun 2024 17:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718818032;
 bh=Nao5IZ6gS4htHNI4Bs9XEbYk4qFYkFkjgxxw6oHgg5g=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=LL/fLTO29QX2UaABYk2m4jwVlQpE+Z2f7JkQUuxFbIwkjHAYmrqg3xpJ8y1RfPSk9
 OqRw209EfLXmF31R67OKclMXtzlg2tPyEj5DsjcTBCKzC30lgjm9oMCfiQSW6YtX0H
 q7zwfpenEx5FknB6phOrM0DSyLLMg1o6OCL+SSSRSAY98xcMb9Cx89E3IVhWzTOjqv
 Gk7GOkP+RcMknB7TDFcJD/KhJPQZEQH1j0vBT7WTaPF0isgJM11RFASC9eT9P3aueG
 zprewtlOc6fKGK9WLy6HFMcya8z77ypCfAgq6G+lmUgzo7O2DiA/26cR7+WnjDAW/l
 raBOBxSXKg3Hg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 55424C27C53;
 Wed, 19 Jun 2024 17:27:12 +0000 (UTC)
From: Hsiao Chien Sung via B4 Relay
 <devnull+shawn.sung.mediatek.com@kernel.org>
Date: Thu, 20 Jun 2024 01:27:09 +0800
Subject: [PATCH 4/5] drm/mediatek: Support "Pre-multiplied" blending in Mixer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240620-blend-v1-4-72670072ca20@mediatek.com>
References: <20240620-blend-v1-0-72670072ca20@mediatek.com>
In-Reply-To: <20240620-blend-v1-0-72670072ca20@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Hsiao Chien Sung <shawn.sung@mediatek.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718818030; l=936;
 i=shawn.sung@mediatek.com; s=20240616; h=from:subject:message-id;
 bh=3bQjcoj+V0e9su0dM39EChvPukc7zStbrzEBWWh/Frw=;
 b=tmGg6oENStsgX78tH+bSHouFVDAfE2H7VBaEIK/gPa76rctdyJWSPy0rnc5TkdUO5Jnni8zSK
 fbpepZ4ykebB0sXZivN86VVGHO6snBnajwCVvviUw2iYjuEzcz//B+b
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

Support "Pre-multiplied" alpha blending mode in Mixer.
Before this patch, only the coverage mode is supported.

Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_ethdr.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_ethdr.c b/drivers/gpu/drm/mediatek/mtk_ethdr.c
index 48b714994492..bc43d0d760c1 100644
--- a/drivers/gpu/drm/mediatek/mtk_ethdr.c
+++ b/drivers/gpu/drm/mediatek/mtk_ethdr.c
@@ -177,7 +177,8 @@ void mtk_ethdr_layer_config(struct device *dev, unsigned int idx,
 		alpha_con |= state->base.alpha & MIXER_ALPHA;
 	}
 
-	if (state->base.pixel_blend_mode == DRM_MODE_BLEND_PIXEL_NONE)
+	if (state->base.pixel_blend_mode == DRM_MODE_BLEND_PIXEL_NONE ||
+	    state->base.pixel_blend_mode == DRM_MODE_BLEND_PREMULTI)
 		alpha_con |= PREMULTI_SOURCE;
 	else
 		alpha_con |= NON_PREMULTI_SOURCE;

-- 
Git-146)


