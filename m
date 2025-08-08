Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A67B1E636
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 12:13:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 197E910E903;
	Fri,  8 Aug 2025 10:13:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="LUVjSOe5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C771410E901
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Aug 2025 10:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1754648007;
 bh=s3BM36TPLO4he8p//ofFrkXqrEKAP/WY1uhVOEof9OM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=LUVjSOe5WOjsSbFrFKFnfNFzZzJYwOZxe4kZA9Gr03h1ZD3ZtlnQiSA5OMYHqapam
 Agis8MsjqiRfpGSquVJ4xbkr36qxfCEZPnVZe3flxpRZM7VjAbkK3qXqiDMqWs5M3q
 FiyHAKQn3SCSBYDOwN5b+7gm8Xrs5rh8wCT1cxNPpIf8DYMYJRmlGHRRJvGFrfJ4B/
 QbqXFx3cAdRh7gWr/Xl9IpoWi7nf3x8AfTt0obscUx9lp7En0rZSwrS3M5QYCGrzfL
 KqiI49Dkpe+pMNlTcWScVgKnAi1eMbYa4+JZD8iM1oYS1iwN5ZvMUADoA4QBy1Kms5
 izWFT0LsphyBQ==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr
 [83.113.51.247])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: laeyraud)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 069E117E1322;
 Fri,  8 Aug 2025 12:13:26 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Fri, 08 Aug 2025 12:12:16 +0200
Subject: [PATCH v10 06/10] drm/mediatek: mtk_hdmi_common: Assign DDC
 adapter pointer to bridge
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-mediatek-drm-hdmi-v2-v10-6-21ea82eec1f6@collabora.com>
References: <20250808-mediatek-drm-hdmi-v2-v10-0-21ea82eec1f6@collabora.com>
In-Reply-To: <20250808-mediatek-drm-hdmi-v2-v10-0-21ea82eec1f6@collabora.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 CK Hu <ck.hu@mediatek.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754648002; l=1180;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=WCs5up/nLCv/PFqKtFYLxciy/pVVBfJhFHTlCQDh0VE=;
 b=JR03wGNtxVt1b7sWoZEQaCW/HE0g3poxLjeRNlW+WL0MbQWm9qli/Bn7bxtdQZDFlGsydIex/
 tPy4IIwCnk1Aao60Kr4Rvts2+8drxYXg9jDGSyK5YW3mjzw4mM2Dg5T
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
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

From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

In preparation for adding the new HDMI TX v2 IP driver, assign the
pointer to the DDC adapter to struct drm_bridge during probe.

This commit brings no functional changes.

Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi_common.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
index 989479fdfe40952762a1b63797bf602b520dcac5..3b589706d61b1e0e4aa66d0c81253b8aeb70c0d3 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
@@ -412,7 +412,9 @@ struct mtk_hdmi *mtk_hdmi_common_probe(struct platform_device *pdev)
 	hdmi->bridge.of_node = pdev->dev.of_node;
 	hdmi->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID
 			 | DRM_BRIDGE_OP_HPD;
+
 	hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
+	hdmi->bridge.ddc = hdmi->ddc_adpt;
 	hdmi->bridge.vendor = "MediaTek";
 	hdmi->bridge.product = "On-Chip HDMI";
 

-- 
2.50.1

