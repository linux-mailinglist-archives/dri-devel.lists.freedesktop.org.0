Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDA653BBF0
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 17:56:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38E35112ABE;
	Thu,  2 Jun 2022 15:56:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EB35112ABE
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 15:56:25 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id c196so5117846pfb.1
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jun 2022 08:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Tu7jo/PyJIG6BDHX/FMNU8mRbHE8qx0k2AbAIgv/aSw=;
 b=G4jo1+hJKSw+rgStl1RDyAKlzn6sdzcOvMqZYnRb8VwJFHqt9vu6FxzP5RWkU9flVa
 POSqy3npwwMgIp5CSWeCDD1msIdEE0UJjR37Kg9yk/7pXH7VhI0kAHk/vXVFVy9GnNUI
 7Ra/AA/R/y67VxnW+DDlOf2xtVdkxCiN+0ATosFJ6EvK/2SeZVEujPT0cCnykHN0NBo3
 5BgOwix0MqKOxrPNLprkQVdYsSeIRIywIv8Bq2NGzFpCOZUp8FGQ1iFf4Z+JZAO9jnpY
 WaV40vB+3QAwC94rW6xWVbh2i/NAqfm04HyesLf1jqelyBmJXGDRRXDPlTbh/y7gc5zF
 Uguw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Tu7jo/PyJIG6BDHX/FMNU8mRbHE8qx0k2AbAIgv/aSw=;
 b=S6dxLMurzFsfWmiflnATPAHXJxnOY0i9ug/9t/4FuLnQ3mOuFBgQSlZ8P5UryB0Uij
 OtxsmyNKsShu9bYiFYxKwhhMsXhrxGjTLU6aYhABDaBhKoOgybv8grVFvFq1x43IWqMV
 Pks0g/Z8G42qtHnLjZVPST0YKe9eVWxkJvUXSdik7b8vH6tDTInug8Czdl+AdOF+4JQX
 UKF0kgzAzj5p6aRkYJZ1LeAdp6fQHYzT3DWkYRsKsNpxo8mkEtRvofSg89fZyLDfvhhg
 YaGmqRF2bMH/3+cMTKj30AD3JTMYIvOb2mhIi/W227EYO5ArxiOi1SHEgXptTbHYEFGS
 BLNQ==
X-Gm-Message-State: AOAM5311DIDnLZHOF3F82jzQws9c4mmidyG6bBDST033F1BUqp6I1dLZ
 tBPKjxnqvvQirBQwVcdBKdo=
X-Google-Smtp-Source: ABdhPJwDRdxm8qjdYFCIqC2XRn1Qg5sgd/UC1C6tDrjH0A1hr+j6rW5IwdSM13nzTycWCfPhVjncMQ==
X-Received: by 2002:a05:6a00:815:b0:518:9905:de06 with SMTP id
 m21-20020a056a00081500b005189905de06mr5854249pfk.76.1654185384781; 
 Thu, 02 Jun 2022 08:56:24 -0700 (PDT)
Received: from localhost.localdomain ([202.120.234.246])
 by smtp.googlemail.com with ESMTPSA id
 z15-20020a63b90f000000b003fc95548840sm3548205pge.36.2022.06.02.08.56.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 08:56:23 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/tegra: dc: rgb: Fix refcount leak in tegra_dc_rgb_probe
Date: Thu,  2 Jun 2022 19:56:15 +0400
Message-Id: <20220602155615.43277-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: linmq006@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

of_get_child_by_name() returns a node pointer with refcount
incremented, we should use of_node_put() on it when not need anymore.
So add of_node_put() in error paths.

Fixes: format:d8f4a9eda006 ("drm: Add NVIDIA Tegra20 support")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/gpu/drm/tegra/rgb.c | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/tegra/rgb.c b/drivers/gpu/drm/tegra/rgb.c
index ff8fce36d2aa..cef2b1b72385 100644
--- a/drivers/gpu/drm/tegra/rgb.c
+++ b/drivers/gpu/drm/tegra/rgb.c
@@ -196,12 +196,16 @@ int tegra_dc_rgb_probe(struct tegra_dc *dc)
 	int err;
 
 	np = of_get_child_by_name(dc->dev->of_node, "rgb");
-	if (!np || !of_device_is_available(np))
-		return -ENODEV;
+	if (!np || !of_device_is_available(np)) {
+		err = -ENODEV;
+		goto err_put_node;
+	}
 
 	rgb = devm_kzalloc(dc->dev, sizeof(*rgb), GFP_KERNEL);
-	if (!rgb)
-		return -ENOMEM;
+	if (!rgb) {
+		err = -ENOMEM;
+		goto err_put_node;
+	}
 
 	rgb->output.dev = dc->dev;
 	rgb->output.of_node = np;
@@ -209,31 +213,34 @@ int tegra_dc_rgb_probe(struct tegra_dc *dc)
 
 	err = tegra_output_probe(&rgb->output);
 	if (err < 0)
-		return err;
+		goto err_put_node;
+
 
 	rgb->clk = devm_clk_get(dc->dev, NULL);
 	if (IS_ERR(rgb->clk)) {
 		dev_err(dc->dev, "failed to get clock\n");
-		return PTR_ERR(rgb->clk);
+		err =  PTR_ERR(rgb->clk);
+		goto err_put_node;
 	}
 
 	rgb->clk_parent = devm_clk_get(dc->dev, "parent");
 	if (IS_ERR(rgb->clk_parent)) {
 		dev_err(dc->dev, "failed to get parent clock\n");
-		return PTR_ERR(rgb->clk_parent);
+		err = PTR_ERR(rgb->clk_parent);
+		goto err_put_node;
 	}
 
 	err = clk_set_parent(rgb->clk, rgb->clk_parent);
 	if (err < 0) {
 		dev_err(dc->dev, "failed to set parent clock: %d\n", err);
-		return err;
+		goto err_put_node;
 	}
 
 	rgb->pll_d_out0 = clk_get_sys(NULL, "pll_d_out0");
 	if (IS_ERR(rgb->pll_d_out0)) {
 		err = PTR_ERR(rgb->pll_d_out0);
 		dev_err(dc->dev, "failed to get pll_d_out0: %d\n", err);
-		return err;
+		goto err_put_node;
 	}
 
 	if (dc->soc->has_pll_d2_out0) {
@@ -241,13 +248,17 @@ int tegra_dc_rgb_probe(struct tegra_dc *dc)
 		if (IS_ERR(rgb->pll_d2_out0)) {
 			err = PTR_ERR(rgb->pll_d2_out0);
 			dev_err(dc->dev, "failed to get pll_d2_out0: %d\n", err);
-			return err;
+			goto err_put_node;
 		}
 	}
 
 	dc->rgb = &rgb->output;
 
 	return 0;
+
+err_put_node:
+	of_node_put(np);
+	return err;
 }
 
 int tegra_dc_rgb_remove(struct tegra_dc *dc)
-- 
2.25.1

