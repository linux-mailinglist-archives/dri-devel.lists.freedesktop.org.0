Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DA37FF415
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 16:56:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1522410E377;
	Thu, 30 Nov 2023 15:56:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DAC110E010
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 15:56:38 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 46e09a7af769-6d7e51638e7so662655a34.1
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 07:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701359797; x=1701964597; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pRNLoGhO2BMO9ciLNfM1W1rhqOoDcDjvlbAJTebh+yo=;
 b=JKscnewpHwupgOs2AkyTnOlCukYsVXZYuwvSjnOPFzwNttLXPoZPBh9tIfwwBIUsNU
 3qxFsvy5608BwvcjC4y1q+8wmv6K2Ta9o+MXMlYcicPi4Huy3sii0d7JJBk7dX1hcvCa
 2dxtB/oyM3Er/TtSkYa3YYGoFNGcLumm+ugPHVUSZB26o7cx69O05kLXbuyChCF8j3EL
 hb24lXlAbp3zSxStWHUrMDEkS3A5FUsqG0C25YZTdjagKhjKHQnu8aoq67ytGXCbD3sb
 Dcqu8xzaOhmqcQHYnmG1L0W83X4NIP38fHfFrHsqBq3FaJ13bbmR33/INwX1GD2GVuiQ
 hpmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701359797; x=1701964597;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pRNLoGhO2BMO9ciLNfM1W1rhqOoDcDjvlbAJTebh+yo=;
 b=RnrCl1OjV1VFFHzJPnL1MCAVHvinmVx6Z5qqwM7bQjhrM8vhryLdws3B8noKGUnaLW
 tGhNMBhD3jXHPL1EVyjqOvY515ne8SStJmFaLU3ckCVUECe5G5hY29NED4lkftJVBcjN
 xTWUUcxdrgJLQrgV+MHnP1mb4+QbuPb08OkPkdXvnaRX/D2ZGYxkY/l2Dw+v59y9mZkB
 TOaOrACvNtrWnuCbcfG3V1eWWh4GZJWovVan+sBip3MoP142KB9k+MXvrDxUn3o7qP1c
 +G0dwEkisQ7Q0UFQJoSLCw07Sd2Z8o04CmyoXj9dzsmWyGy1TFz2rR9uj+fVQc53g7SM
 SozA==
X-Gm-Message-State: AOJu0YyQ7ArfozE50FWfDDrbiOwfqgqcja8nE6ksPjw2CRn7ZBiJS3Uj
 JskqQliefXCUIYWxyChJifo=
X-Google-Smtp-Source: AGHT+IFDN2KO5mhmb9kkTeoiK/iTdFDlSusXFHxnNmaSKuAZ/ISuF82jXLCkerZAI+gGVdXWyroc9A==
X-Received: by 2002:a05:6830:2047:b0:6d8:4a96:e4db with SMTP id
 f7-20020a056830204700b006d84a96e4dbmr7537200otp.31.1701359797425; 
 Thu, 30 Nov 2023 07:56:37 -0800 (PST)
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 n25-20020a9d6f19000000b006d7ff27a47esm187852otq.77.2023.11.30.07.56.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Nov 2023 07:56:37 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Subject: [PATCH 2/9] drm/panel: himax-hx8394: Drop shutdown logic
Date: Thu, 30 Nov 2023 09:56:17 -0600
Message-Id: <20231130155624.405575-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130155624.405575-1-macroalpha82@gmail.com>
References: <20231130155624.405575-1-macroalpha82@gmail.com>
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 Chris Morgan <macromorgan@hotmail.com>, krzysztof.kozlowski+dt@linaro.org,
 neil.armstrong@linaro.org, sboyd@kernel.org, sam@ravnborg.org,
 mturquette@baylibre.com, javierm@redhat.com, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, mripard@kernel.org, tzimmermann@suse.de,
 quic_jesszhan@quicinc.com, linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

The driver shutdown is duplicate as it calls drm_unprepare and
drm_disable which are called anyway when associated drivers are
shutdown/removed.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/gpu/drm/panel/panel-himax-hx8394.c | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-himax-hx8394.c b/drivers/gpu/drm/panel/panel-himax-hx8394.c
index 3823ff388b96..d8e590d5e1da 100644
--- a/drivers/gpu/drm/panel/panel-himax-hx8394.c
+++ b/drivers/gpu/drm/panel/panel-himax-hx8394.c
@@ -390,27 +390,11 @@ static int hx8394_probe(struct mipi_dsi_device *dsi)
 	return 0;
 }
 
-static void hx8394_shutdown(struct mipi_dsi_device *dsi)
-{
-	struct hx8394 *ctx = mipi_dsi_get_drvdata(dsi);
-	int ret;
-
-	ret = drm_panel_disable(&ctx->panel);
-	if (ret < 0)
-		dev_err(&dsi->dev, "Failed to disable panel: %d\n", ret);
-
-	ret = drm_panel_unprepare(&ctx->panel);
-	if (ret < 0)
-		dev_err(&dsi->dev, "Failed to unprepare panel: %d\n", ret);
-}
-
 static void hx8394_remove(struct mipi_dsi_device *dsi)
 {
 	struct hx8394 *ctx = mipi_dsi_get_drvdata(dsi);
 	int ret;
 
-	hx8394_shutdown(dsi);
-
 	ret = mipi_dsi_detach(dsi);
 	if (ret < 0)
 		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
@@ -427,7 +411,6 @@ MODULE_DEVICE_TABLE(of, hx8394_of_match);
 static struct mipi_dsi_driver hx8394_driver = {
 	.probe	= hx8394_probe,
 	.remove = hx8394_remove,
-	.shutdown = hx8394_shutdown,
 	.driver = {
 		.name = DRV_NAME,
 		.of_match_table = hx8394_of_match,
-- 
2.34.1

