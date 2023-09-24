Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1837ACBA2
	for <lists+dri-devel@lfdr.de>; Sun, 24 Sep 2023 21:26:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4CAB10E133;
	Sun, 24 Sep 2023 19:26:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21F5710E13D
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Sep 2023 19:26:19 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-9a64619d8fbso638000666b.0
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Sep 2023 12:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695583577; x=1696188377; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MFf1cGltxf8drTRitrLUgd7Y0FznH+yCbskJSQDkt2Q=;
 b=LBQZV2nXrWLC2keBvZ1CqxfqUV+MPxPtMalnksr9IqCmbuJ7Y/8/plWlSNbcmMBsbS
 uGV5lw/Q08KGceftjh8O8qo4Z+cASBXHMbSRAJphaj9LhoPEopoGdAen9r/QzoQX/vbp
 g5xH4iXyUpIBsz6TnHvAkOh2T+iuZyXxJpaAr/8BoZiiyHOb32Z0VQrC7QMEhSK6I615
 rQ9eAZwIlnccWCzrX+xDZ1KgUIjk2oZiiAv11m5viiPsuOLJxkrwcUqui7EBcOUR9yS1
 q/AZ4k1t+KkGFxd2V+zqcv5CIbJubhFYDmLKdfLg3EN8tXBsyuOYbK1yOm0W5IkX0lsk
 IzGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695583577; x=1696188377;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MFf1cGltxf8drTRitrLUgd7Y0FznH+yCbskJSQDkt2Q=;
 b=sQFhAmjpkm6UKoThBIPq1vQ6aGH+vmKf4p2Qn8pmVp2lnsEcEuT9ixfY9RmL3UVw8x
 TGomfiX5ZRiqTzz3BEDRMIOwzNTAmPPsdnruSXsbnjcQHiuXY/8rhULphDkjS/jNK77P
 SPUtnopDtteXow5yr0r56Mh0/No5LOfttgobfb4uRSDaZvC7K4Pl8UMI0KjGluwd3Czi
 sWxxiwybGV41fiQiKMSRO/+mvsAxV85bpDriSl5Szu/TTzoVwgHiXgU3+ib4dFUKhV+H
 b7pA8CMWwObR/K/7W0idtSHdw2k6vyqbvqgQujFwz/tZak9pbMVfWUc7GMirzOujx8uy
 E/Ag==
X-Gm-Message-State: AOJu0Yx65ukLUQE/fhJ81R4/Xlm1QMb/ijiX0SjHt5PJRg8L9i/ifcW2
 y2SDuIl4roTw1B1u8X7OYxA=
X-Google-Smtp-Source: AGHT+IGAhle5kDIIp4WuTj01RyhcLxUc0q31fsjC0IfkTvI/FNrLn/S5IoePIuTCGmzEdhew1ZtvcA==
X-Received: by 2002:a17:906:210a:b0:9a3:c4f4:12de with SMTP id
 10-20020a170906210a00b009a3c4f412demr4134394ejt.37.1695583577533; 
 Sun, 24 Sep 2023 12:26:17 -0700 (PDT)
Received: from localhost.localdomain (82-149-12-148.dynamic.telemach.net.
 [82.149.12.148]) by smtp.gmail.com with ESMTPSA id
 z21-20020a1709063a1500b0099d0c0bb92bsm5317632eje.80.2023.09.24.12.26.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Sep 2023 12:26:17 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org
Subject: [PATCH 5/7] drm/sun4i: dw-hdmi: Split driver registration
Date: Sun, 24 Sep 2023 21:26:02 +0200
Message-ID: <20230924192604.3262187-6-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230924192604.3262187-1-jernej.skrabec@gmail.com>
References: <20230924192604.3262187-1-jernej.skrabec@gmail.com>
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
Cc: samuel@sholland.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is no reason to register two drivers in same place. Using macro
lowers amount of boilerplate code.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c  | 27 +-------------------------
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h  |  2 --
 drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c |  3 ++-
 3 files changed, 3 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
index 93831cdf1917..d93e8ff71aae 100644
--- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
+++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
@@ -378,32 +378,7 @@ static struct platform_driver sun8i_dw_hdmi_pltfm_driver = {
 		.of_match_table = sun8i_dw_hdmi_dt_ids,
 	},
 };
-
-static int __init sun8i_dw_hdmi_init(void)
-{
-	int ret;
-
-	ret = platform_driver_register(&sun8i_dw_hdmi_pltfm_driver);
-	if (ret)
-		return ret;
-
-	ret = platform_driver_register(&sun8i_hdmi_phy_driver);
-	if (ret) {
-		platform_driver_unregister(&sun8i_dw_hdmi_pltfm_driver);
-		return ret;
-	}
-
-	return ret;
-}
-
-static void __exit sun8i_dw_hdmi_exit(void)
-{
-	platform_driver_unregister(&sun8i_dw_hdmi_pltfm_driver);
-	platform_driver_unregister(&sun8i_hdmi_phy_driver);
-}
-
-module_init(sun8i_dw_hdmi_init);
-module_exit(sun8i_dw_hdmi_exit);
+module_platform_driver(sun8i_dw_hdmi_pltfm_driver);
 
 MODULE_AUTHOR("Jernej Skrabec <jernej.skrabec@siol.net>");
 MODULE_DESCRIPTION("Allwinner DW HDMI bridge");
diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
index 18ffc1b4841f..21e010deeb48 100644
--- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
+++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h
@@ -194,8 +194,6 @@ struct sun8i_dw_hdmi {
 	struct reset_control		*rst_ctrl;
 };
 
-extern struct platform_driver sun8i_hdmi_phy_driver;
-
 static inline struct sun8i_dw_hdmi *
 encoder_to_sun8i_dw_hdmi(struct drm_encoder *encoder)
 {
diff --git a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
index 489ea94693ff..f917a979e4a4 100644
--- a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
+++ b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
@@ -729,10 +729,11 @@ static int sun8i_hdmi_phy_probe(struct platform_device *pdev)
 	return 0;
 }
 
-struct platform_driver sun8i_hdmi_phy_driver = {
+static struct platform_driver sun8i_hdmi_phy_driver = {
 	.probe  = sun8i_hdmi_phy_probe,
 	.driver = {
 		.name = "sun8i-hdmi-phy",
 		.of_match_table = sun8i_hdmi_phy_of_table,
 	},
 };
+module_platform_driver(sun8i_hdmi_phy_driver);
-- 
2.42.0

