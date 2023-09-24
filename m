Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A387ACB9A
	for <lists+dri-devel@lfdr.de>; Sun, 24 Sep 2023 21:26:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2966B10E1C1;
	Sun, 24 Sep 2023 19:26:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C73A10E133
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Sep 2023 19:26:16 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-9ae7383b7ecso893673966b.0
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Sep 2023 12:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695583575; x=1696188375; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7GGwz4wHTU6Hq3RRU7lNI3Q1wc2dl9iWY5fWoPCz14w=;
 b=hQYoHHWVuNiOi195lJWawSH/kQ4An5JTdy4Esg7CVJOlB8riT5YX2Jnoyd+sYL3YaO
 5usr0VqqssFVhmxvXzE44tGYSK41XDKyprlBPqdv0rIYXcFTmOxBkWEoY6BG7Kq5TzDs
 WSLgmBP3dKepYpmq+8Y303UJHQN7GlcPWqQRALlHnWk4oCAbeWGN+UVKo8F0LYIpSBMB
 wQxIPqa7FzDNPnhBG9WDY3QCMsMPwxRT8u2arHbw4iIF8qyN2WpfvdvI/mh2zxyWHoUQ
 Tdxt+h/qzDBIqtByUyA2vELekDWHjRhIa1fCuxPvf4JBecgtTH8Z5Qo4cTSvox1B9mBt
 2oWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695583575; x=1696188375;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7GGwz4wHTU6Hq3RRU7lNI3Q1wc2dl9iWY5fWoPCz14w=;
 b=BYo/FbOMMdeY7WSAdV/hU0QCYL8UjKoOZvG5YVJcepMQcib2y881fr8DErtxR7UlWH
 YI+rSyvEBsGrhtbvfcP56rRr7YVewvvnXognWVOgoFGC22i13cSvjz+gfHF4bAgg4fLN
 wHIS/X2uQOjCr02fis/zaeeyD28RqlF4KQrioy/g/KvLs78ZceCFohI1p5masI+W7EK7
 +Y6nzGkig+dddZJ2x3KSoXnxhpFwm57Qotrs9q3EDqtwaxWC6uAcho9Cs2o3N8Z4bEdF
 yCq/4/1sLhfdnyzbKqtbA2U4u28sU1NhkiVGpQR3MA7ypCbTer5YsVLKwT3nC1cO9HAf
 dHjA==
X-Gm-Message-State: AOJu0YzxVbv+QtBX1X/j0rcRBXJB4Qrasnn1/xU4SM8AaHKzSAQsbUcR
 2EiPPDLyTT/6/6AFVdWxwmo=
X-Google-Smtp-Source: AGHT+IGrm0GcL+bThs+FW6loLKtnsAa0IIh3+UexCsckNUEBFlIPvms+brojuoJoSOy/PrKpwCa8JQ==
X-Received: by 2002:a17:907:ea5:b0:9a1:e0b1:e919 with SMTP id
 ho37-20020a1709070ea500b009a1e0b1e919mr13414633ejc.4.1695583574659; 
 Sun, 24 Sep 2023 12:26:14 -0700 (PDT)
Received: from localhost.localdomain (82-149-12-148.dynamic.telemach.net.
 [82.149.12.148]) by smtp.gmail.com with ESMTPSA id
 z21-20020a1709063a1500b0099d0c0bb92bsm5317632eje.80.2023.09.24.12.26.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Sep 2023 12:26:14 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org
Subject: [PATCH 2/7] drm/sun4i: dw-hdmi: Remove double encoder cleanup
Date: Sun, 24 Sep 2023 21:25:59 +0200
Message-ID: <20230924192604.3262187-3-jernej.skrabec@gmail.com>
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

It turns out that comment is wrong - dw hdmi driver never does any
encoder cleanup. In fact, cleanup is done automatically, in destroy
callback of encoder. Even more, encoder memory will be freed when hdmi
device is destroyed. However, encoder will be cleaned up after that, in
drm_mode_config_cleanup(), which is called later. This will cause use
after free bug.

Remove redundant encoder cleanup, switch memory allocation to live as
long as drm object and while at it, check return code of encoder
initialization.

Fixes: b7c7436a5ff0 ("drm/sun4i: Implement A83T HDMI driver")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
index 0b647b030b15..8f8d3bdba5ce 100644
--- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
+++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
@@ -8,6 +8,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 
+#include <drm/drm_managed.h>
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_of.h>
 #include <drm/drm_simple_kms_helper.h>
@@ -107,7 +108,7 @@ static int sun8i_dw_hdmi_bind(struct device *dev, struct device *master,
 	if (!pdev->dev.of_node)
 		return -ENODEV;
 
-	hdmi = devm_kzalloc(&pdev->dev, sizeof(*hdmi), GFP_KERNEL);
+	hdmi = drmm_kzalloc(drm, sizeof(*hdmi), GFP_KERNEL);
 	if (!hdmi)
 		return -ENOMEM;
 
@@ -180,7 +181,9 @@ static int sun8i_dw_hdmi_bind(struct device *dev, struct device *master,
 		goto err_disable_clk_tmds;
 
 	drm_encoder_helper_add(encoder, &sun8i_dw_hdmi_encoder_helper_funcs);
-	drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_TMDS);
+	ret = drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_TMDS);
+	if (ret)
+		goto err_deinit_phy;
 
 	plat_data->mode_valid = hdmi->quirks->mode_valid;
 	plat_data->use_drm_infoframe = hdmi->quirks->use_drm_infoframe;
@@ -189,20 +192,14 @@ static int sun8i_dw_hdmi_bind(struct device *dev, struct device *master,
 	platform_set_drvdata(pdev, hdmi);
 
 	hdmi->hdmi = dw_hdmi_bind(pdev, encoder, plat_data);
-
-	/*
-	 * If dw_hdmi_bind() fails we'll never call dw_hdmi_unbind(),
-	 * which would have called the encoder cleanup.  Do it manually.
-	 */
 	if (IS_ERR(hdmi->hdmi)) {
 		ret = PTR_ERR(hdmi->hdmi);
-		goto cleanup_encoder;
+		goto err_deinit_phy;
 	}
 
 	return 0;
 
-cleanup_encoder:
-	drm_encoder_cleanup(encoder);
+err_deinit_phy:
 	sun8i_hdmi_phy_deinit(hdmi->phy);
 err_disable_clk_tmds:
 	clk_disable_unprepare(hdmi->clk_tmds);
-- 
2.42.0

