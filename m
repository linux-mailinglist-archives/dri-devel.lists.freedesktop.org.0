Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB377E3D2D
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 13:26:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E201B10E57C;
	Tue,  7 Nov 2023 12:26:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A36010E57A
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Nov 2023 12:26:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 7A35BCE0F18;
 Tue,  7 Nov 2023 12:26:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39A60C43391;
 Tue,  7 Nov 2023 12:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699359973;
 bh=rlISWo7mgLCGFzUR9A2oh033QzlDbNnpnaOmv8Vc4/g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LQnt5sWVrt9yaC/8Mmt2E9yLNTBJaogcLvIWjgnkJLUsPMYz1exsZVivJuZU7JTN+
 5NwuxC36JpHxZND/2EdtbLz8moHrb7W4FrxX8PKNLIkZzpkMMCGKs0ixsE/ZUgOPC4
 rkvRZk4apaOJ3UwmfYG/D1gfbygtpWTahDpbGN1/NCcwXrhHioNsxS219Za+fPrR5+
 jguHcPkgUaVWiUia2IhHRDocLLyiOkvaRcTXw6S1oevhGPdF2Mz4UwRdDbRh6l/Qwu
 rQzMU2kpvakwPRjjIF9fg+JP4GwrwA+FD4UwLdrpcC3qRJdz2PQlhStwScXe7+RKeD
 4Zes/s2QK6+zw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.5 27/37] drm/panel: st7703: Pick different reset
 sequence
Date: Tue,  7 Nov 2023 07:21:38 -0500
Message-ID: <20231107122407.3760584-27-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107122407.3760584-1-sashal@kernel.org>
References: <20231107122407.3760584-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.5.10
Content-Transfer-Encoding: 8bit
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
Cc: Sasha Levin <sashal@kernel.org>, neil.armstrong@linaro.org,
 Samuel Holland <samuel@sholland.org>,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Frank Oltmanns <frank@oltmanns.dev>, mripard@kernel.org,
 Ondrej Jirman <megi@xff.cz>, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ondrej Jirman <megi@xff.cz>

[ Upstream commit d12d635bb03c7cb4830acb641eb176ee9ff2aa89 ]

Switching to a different reset sequence, enabling IOVCC before enabling
VCC.

There also needs to be a delay after enabling the supplies and before
deasserting the reset. The datasheet specifies 1ms after the supplies
reach the required voltage. Use 10-20ms to also give the power supplies
some time to reach the required voltage, too.

This fixes intermittent panel initialization failures and screen
corruption during resume from sleep on panel xingbangda,xbd599 (e.g.
used in PinePhone).

Signed-off-by: Ondrej Jirman <megi@xff.cz>
Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
Reported-by: Samuel Holland <samuel@sholland.org>
Reviewed-by: Guido Günther <agx@sigxcpu.org>
Tested-by: Guido Günther <agx@sigxcpu.org>
Signed-off-by: Guido Günther <agx@sigxcpu.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20230211171748.36692-2-frank@oltmanns.dev
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/panel/panel-sitronix-st7703.c | 25 ++++++++++---------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7703.c b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
index 3aa31f3d61574..687749bbec62c 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7703.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
@@ -506,29 +506,30 @@ static int st7703_prepare(struct drm_panel *panel)
 		return 0;
 
 	dev_dbg(ctx->dev, "Resetting the panel\n");
-	ret = regulator_enable(ctx->vcc);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+
+	ret = regulator_enable(ctx->iovcc);
 	if (ret < 0) {
-		dev_err(ctx->dev, "Failed to enable vcc supply: %d\n", ret);
+		dev_err(ctx->dev, "Failed to enable iovcc supply: %d\n", ret);
 		return ret;
 	}
-	ret = regulator_enable(ctx->iovcc);
+
+	ret = regulator_enable(ctx->vcc);
 	if (ret < 0) {
-		dev_err(ctx->dev, "Failed to enable iovcc supply: %d\n", ret);
-		goto disable_vcc;
+		dev_err(ctx->dev, "Failed to enable vcc supply: %d\n", ret);
+		regulator_disable(ctx->iovcc);
+		return ret;
 	}
 
-	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
-	usleep_range(20, 40);
+	/* Give power supplies time to stabilize before deasserting reset. */
+	usleep_range(10000, 20000);
+
 	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
-	msleep(20);
+	usleep_range(15000, 20000);
 
 	ctx->prepared = true;
 
 	return 0;
-
-disable_vcc:
-	regulator_disable(ctx->vcc);
-	return ret;
 }
 
 static const u32 mantix_bus_formats[] = {
-- 
2.42.0

