Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 185592E11CC
	for <lists+dri-devel@lfdr.de>; Wed, 23 Dec 2020 03:17:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CFE26E8A5;
	Wed, 23 Dec 2020 02:17:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E2536E889
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Dec 2020 02:17:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AEE6623383;
 Wed, 23 Dec 2020 02:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608689855;
 bh=3OlnkbeRb006HDp4K1m/s6+k/SideXMVuox4qq4AGCw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Z4T+u2F57pFM8onnpPk8xkDF1YFBerwNgS5Gt9nOkxkQKer/cFHKOcwpRHuKLq6wD
 FCWLmUeE6DKfP/wbNrC2uCCCBLjKYIQ8QG4xK7rsZfuy1j71r+R75Ym/In+TqxanvF
 +6il2vIyDpUAjwIaviBEvX1fr5uq1hqnPqOu/jErgKDuUfmXqZUr3wgPCdLMIGNb1J
 5Q7Zo36UkQMVXJKKF/DmiMlT8Z+ZlG7S1+uZ0jW85oibrReJkAosCOvgg/iwWC681c
 H6sKDOq++sUs7h/uFkkgNOKWIUD4TNFzl+VYpFnZXT1fnuVDmHdaJGIY5JnfTuNvU8
 lAXAayAOggdtw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 053/217] drm/bridge: lvds-codec: Use
 dev_err_probe for error handling
Date: Tue, 22 Dec 2020 21:13:42 -0500
Message-Id: <20201223021626.2790791-53-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201223021626.2790791-1-sashal@kernel.org>
References: <20201223021626.2790791-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Biju Das <biju.das.jz@bp.renesas.com>, Sasha Levin <sashal@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Biju Das <biju.das.jz@bp.renesas.com>

[ Upstream commit 4178bd5a3c57e107b3df5e17de6dc60cb3890647 ]

dev_err_probe function simplifies error handling. So use the same in probe
function wherever possible.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20201020093655.3584-1-biju.das.jz@bp.renesas.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/bridge/lvds-codec.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lvds-codec.c b/drivers/gpu/drm/bridge/lvds-codec.c
index f52ccffc1bd1d..dcf579a4cf833 100644
--- a/drivers/gpu/drm/bridge/lvds-codec.c
+++ b/drivers/gpu/drm/bridge/lvds-codec.c
@@ -80,7 +80,6 @@ static int lvds_codec_probe(struct platform_device *pdev)
 	struct device_node *panel_node;
 	struct drm_panel *panel;
 	struct lvds_codec *lvds_codec;
-	int ret;
 
 	lvds_codec = devm_kzalloc(dev, sizeof(*lvds_codec), GFP_KERNEL);
 	if (!lvds_codec)
@@ -90,13 +89,9 @@ static int lvds_codec_probe(struct platform_device *pdev)
 	lvds_codec->connector_type = (uintptr_t)of_device_get_match_data(dev);
 
 	lvds_codec->vcc = devm_regulator_get(lvds_codec->dev, "power");
-	if (IS_ERR(lvds_codec->vcc)) {
-		ret = PTR_ERR(lvds_codec->vcc);
-		if (ret != -EPROBE_DEFER)
-			dev_err(lvds_codec->dev,
-				"Unable to get \"vcc\" supply: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(lvds_codec->vcc))
+		return dev_err_probe(dev, PTR_ERR(lvds_codec->vcc),
+				     "Unable to get \"vcc\" supply\n");
 
 	lvds_codec->powerdown_gpio = devm_gpiod_get_optional(dev, "powerdown",
 							     GPIOD_OUT_HIGH);
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
