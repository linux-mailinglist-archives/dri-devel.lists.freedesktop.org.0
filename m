Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9942924CEA5
	for <lists+dri-devel@lfdr.de>; Fri, 21 Aug 2020 09:12:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 449C86EAA5;
	Fri, 21 Aug 2020 07:11:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46BC36E93E
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 12:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1597925584; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H6AaeB90PvxfVY9WrxZtIpss3tNLOtB/nIbF3+2oWDU=;
 b=vdG3dLdP29l0b+5WTSa+a7bQKELcpbNkcBt5KYifC1zXijOJWMYVWaj4wKDywkLpevPwvV
 NxiEnhaTd2cE1wSUvOOQeDxiryKXQfFIE+02B5SaCbWeZfbAld2P9VBYGJtd83odbuPqNH
 JDMRJkliPlN5CVce7xZyVvl9wsRK7m0=
From: Paul Cercueil <paul@crapouillou.net>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 2/2] drm/panel: novatek,
 nt39016: Remove 'dev' field in priv struct
Date: Thu, 20 Aug 2020 14:12:56 +0200
Message-Id: <20200820121256.32037-3-paul@crapouillou.net>
In-Reply-To: <20200820121256.32037-1-paul@crapouillou.net>
References: <20200820121256.32037-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 21 Aug 2020 07:11:07 +0000
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
Cc: Paul Cercueil <paul@crapouillou.net>, od@zcrc.me,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is already a 'struct device' pointer in the drm_panel structure,
that we can access easily from our priv structure, so there's no need
for a separate 'dev' field there.

v2: Don't initialize drm_panel->dev manually, it is done by
drm_panel_init().

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/panel/panel-novatek-nt39016.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt39016.c b/drivers/gpu/drm/panel/panel-novatek-nt39016.c
index daa583030246..f8151fe3ac9a 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt39016.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt39016.c
@@ -56,7 +56,6 @@ struct nt39016_panel_info {
 
 struct nt39016 {
 	struct drm_panel drm_panel;
-	struct device *dev;
 	struct regmap *map;
 	struct regulator *supply;
 	const struct nt39016_panel_info *panel_info;
@@ -124,7 +123,7 @@ static int nt39016_prepare(struct drm_panel *drm_panel)
 
 	err = regulator_enable(panel->supply);
 	if (err) {
-		dev_err(panel->dev, "Failed to enable power supply: %d\n", err);
+		dev_err(drm_panel->dev, "Failed to enable power supply: %d\n", err);
 		return err;
 	}
 
@@ -143,7 +142,7 @@ static int nt39016_prepare(struct drm_panel *drm_panel)
 	err = regmap_multi_reg_write(panel->map, nt39016_panel_regs,
 				     ARRAY_SIZE(nt39016_panel_regs));
 	if (err) {
-		dev_err(panel->dev, "Failed to init registers: %d\n", err);
+		dev_err(drm_panel->dev, "Failed to init registers: %d\n", err);
 		goto err_disable_regulator;
 	}
 
@@ -173,7 +172,7 @@ static int nt39016_enable(struct drm_panel *drm_panel)
 	ret = regmap_write(panel->map, NT39016_REG_SYSTEM,
 			   NT39016_SYSTEM_RESET_N | NT39016_SYSTEM_STANDBY);
 	if (ret) {
-		dev_err(panel->dev, "Unable to enable panel: %d\n", ret);
+		dev_err(drm_panel->dev, "Unable to enable panel: %d\n", ret);
 		return ret;
 	}
 
@@ -193,7 +192,7 @@ static int nt39016_disable(struct drm_panel *drm_panel)
 	err = regmap_write(panel->map, NT39016_REG_SYSTEM,
 			   NT39016_SYSTEM_RESET_N);
 	if (err) {
-		dev_err(panel->dev, "Unable to disable panel: %d\n", err);
+		dev_err(drm_panel->dev, "Unable to disable panel: %d\n", err);
 		return err;
 	}
 
@@ -252,7 +251,6 @@ static int nt39016_probe(struct spi_device *spi)
 	if (!panel)
 		return -ENOMEM;
 
-	panel->dev = dev;
 	spi_set_drvdata(spi, panel);
 
 	panel->panel_info = of_device_get_match_data(dev);
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
