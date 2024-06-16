Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5858A909C7D
	for <lists+dri-devel@lfdr.de>; Sun, 16 Jun 2024 10:29:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95A7E10E1CA;
	Sun, 16 Jun 2024 08:29:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UXd+1hKZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A5FE10E1AA
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jun 2024 08:29:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2C0B060C72;
 Sun, 16 Jun 2024 08:29:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3F11AC4AF62;
 Sun, 16 Jun 2024 08:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718526555;
 bh=gLCaZE610rsmKqqdbcEc8ost1ZTS13TyJe0ZZJvoHZg=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=UXd+1hKZ0BVdFf3sECRMmtUHQEmL0xGKfimQV0TgklP42K38C7FMB5931tiMADQhB
 GYJRWfMfnArgUEnsIUkg83lwMHarrFZS3A67gmbayBtr+hC/kuj46Zadn21wTW9VbD
 NPGvfT9lugINow1k6UxOnkhjGwgwEM1SXtads9lPIbJOIKK0n83wVLRU7sdmvVHS0+
 6ABLECN9A2LW1aiYRe4+vOwvNW4Hr0LFYurQakJF1BwI61eEZ/Sor8IbPVhBNjd8xI
 O2eRBzpcRH7wyoutudXYxBNks+LtLyaP/7HqwspchyYlM0kc+Aqjv7gZKtmjmW3wTG
 BcB0rS5orWeTA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 37205C2BA15;
 Sun, 16 Jun 2024 08:29:15 +0000 (UTC)
From: Hsiao Chien Sung via B4 Relay
 <devnull+shawn.sung.mediatek.com@kernel.org>
Date: Sun, 16 Jun 2024 16:29:18 +0800
Subject: [PATCH 08/13] drm/mediatek: Support RGBA8888 and RGBX8888 in OVL
 on MT8195
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240616-mediatek-drm-next-v1-8-7e8f9cf785d8@mediatek.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718526553; l=841;
 i=shawn.sung@mediatek.com; s=20240616; h=from:subject:message-id;
 bh=+M7/ziTHyUjzVsIkA+lS1U5EWG9ZgvZdQWr6HMIP4HE=;
 b=gJuRLhb/os/1rMsyV7dGCSEg52neTkCIAzjcbk5s6ct4W+UtNk8qcSQChx6TeNnogk/Xc8ssK
 0hQB4Q/YYu+BxMuftvTNHO9nX2+7OdcuZo8IUfOhBYyYHekGiy7x61G
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

Support RGBA8888 and RGBX8888 formats in OVL on MT8195.

Reviewed-by: CK Hu <ck.hu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index d970cdce06bc..738244a6164e 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -114,6 +114,8 @@ static const u32 mt8195_formats[] = {
 	DRM_FORMAT_XBGR8888,
 	DRM_FORMAT_XBGR2101010,
 	DRM_FORMAT_ABGR2101010,
+	DRM_FORMAT_RGBX8888,
+	DRM_FORMAT_RGBA8888,
 	DRM_FORMAT_RGBX1010102,
 	DRM_FORMAT_RGBA1010102,
 	DRM_FORMAT_RGB888,

-- 
Git-146)


