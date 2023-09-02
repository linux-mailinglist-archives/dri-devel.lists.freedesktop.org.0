Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C60790877
	for <lists+dri-devel@lfdr.de>; Sat,  2 Sep 2023 17:22:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05CE310E23E;
	Sat,  2 Sep 2023 15:22:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-19.smtpout.orange.fr
 [80.12.242.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6103410E240
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Sep 2023 15:22:38 +0000 (UTC)
Received: from pop-os.home ([86.243.2.178]) by smtp.orange.fr with ESMTPA
 id cSRzqoXOCUaEwcSSKqaS1v; Sat, 02 Sep 2023 17:22:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1693668156;
 bh=jjFPsVcx6aUbMmjjTF/u/Nl/5KjfB+Ek7/mYBuPCzj4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=lbtQafwZtPk0rru/DCcIwm6Zib9y2qUf/fKFz9Z6mJH1El3xP0nygKYkG6+HeX7R0
 U8No6evW77b9r2wwbUcnl3x+61lYOLdbH3ayfkH/coeSA5mk+XINYxcFgx+uIvU6rT
 XTTvw7DIjf2+ex/+YI5erlayJdzpD4yFo59A/xOLWWk+l4A4gocNnoOhW0zo/MjupT
 L7H/Mw08jzvEI1mworgiyOggh4VJLt6bFVUf4U9wprTmxz84CGRjYXsQd0ynTC0hmh
 EgijffRSpMlo8ex2boLlbZZMesF0CAqGplvDx78rtw6c8aa7OX/B7Ex2ySAfxvmcJ0
 r725vxn4qIWiw==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 02 Sep 2023 17:22:36 +0200
X-ME-IP: 86.243.2.178
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: thierry.reding@gmail.com, mperttunen@nvidia.com, airlied@gmail.com,
 daniel@ffwll.ch, jonathanh@nvidia.com, digetx@gmail.com
Subject: [PATCH 5/6] drm/tegra: rgb: Fix missing clk_put() in the error
 handling paths of tegra_dc_rgb_probe()
Date: Sat,  2 Sep 2023 17:22:12 +0200
Message-Id: <0182895ead4e4730426616b0d9995954c960b634.1693667005.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693667005.git.christophe.jaillet@wanadoo.fr>
References: <cover.1693667005.git.christophe.jaillet@wanadoo.fr>
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
Cc: linux-tegra@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If clk_get_sys(..., "pll_d2_out0") fails, the clk_get_sys() call must be
undone.

Add the missing clk_put and a new 'put_pll_d_out0' label in the error
handling path, and use it.

Fixes: 0c921b6d4ba0 ("drm/tegra: dc: rgb: Allow changing PLLD rate on Tegra30+")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpu/drm/tegra/rgb.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/rgb.c b/drivers/gpu/drm/tegra/rgb.c
index 26d4d87b83de..e277826ab494 100644
--- a/drivers/gpu/drm/tegra/rgb.c
+++ b/drivers/gpu/drm/tegra/rgb.c
@@ -244,7 +244,7 @@ int tegra_dc_rgb_probe(struct tegra_dc *dc)
 		if (IS_ERR(rgb->pll_d2_out0)) {
 			err = PTR_ERR(rgb->pll_d2_out0);
 			dev_err(dc->dev, "failed to get pll_d2_out0: %d\n", err);
-			goto tegra_remove;
+			goto put_pll_d_out0;
 		}
 	}
 
@@ -252,6 +252,8 @@ int tegra_dc_rgb_probe(struct tegra_dc *dc)
 
 	return 0;
 
+put_pll_d_out0:
+	clk_put(rgb->pll_d_out0);
 tegra_remove:
 	tegra_output_remove(&rgb->output);
 	return err;
-- 
2.34.1

