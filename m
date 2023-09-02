Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE77790878
	for <lists+dri-devel@lfdr.de>; Sat,  2 Sep 2023 17:22:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A22210E240;
	Sat,  2 Sep 2023 15:22:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-19.smtpout.orange.fr
 [80.12.242.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A04A110E242
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Sep 2023 15:22:41 +0000 (UTC)
Received: from pop-os.home ([86.243.2.178]) by smtp.orange.fr with ESMTPA
 id cSRzqoXOCUaEwcSSNqaS2H; Sat, 02 Sep 2023 17:22:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1693668160;
 bh=OK7xakYKxBr5OBglBORqhPQ35WeB7Etk6Y/hw78k0rE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=jfPDQufxycXowrFFVq4JYOWlEkF/8QLgYpiZySc4oG0V2m4I0AxBHEJI231g7/4yg
 duJoGWf7WztP1GLXvCGDm6PTK5vBPIFkbgJ68not8KFy396X3SeL3fT4qkJIw6Imyh
 gBu0Aanea3iOyzAOtYFjY82jbYwxpo/btRwcRonKhR7f9uNjSk7Sve90PWp1gxVyrk
 SgpzheKRROj0H/thlOwHHPSzkAEtvyWKD6OpskQ064G3+O6GxHxd220zwr8U5ptwKP
 90+XJnsDbvmRKO3YIWPh7XFAF2Z0yMfEPpkVGGHI3DmxscUybGRbJc5lQlgO7CKy6z
 CGdpLyzy4UnQg==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 02 Sep 2023 17:22:40 +0200
X-ME-IP: 86.243.2.178
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: thierry.reding@gmail.com, mperttunen@nvidia.com, airlied@gmail.com,
 daniel@ffwll.ch, jonathanh@nvidia.com, digetx@gmail.com
Subject: [PATCH 6/6] drm/tegra: output: Fix missing i2c_put_adapter() in the
 error handling paths of tegra_output_probe()
Date: Sat,  2 Sep 2023 17:22:13 +0200
Message-Id: <b38604178991e1f08b2cda219103be266be2d680.1693667005.git.christophe.jaillet@wanadoo.fr>
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

If an error occurs after a successful of_get_i2c_adapter_by_node() call, it
should be undone by a corresponding i2c_put_adapter().

Add the missing i2c_put_adapter() call.

Fixes: 9be7d864cf07 ("drm/tegra: Implement panel support")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpu/drm/tegra/output.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
index dc2dcb5ca1c8..d7d2389ac2f5 100644
--- a/drivers/gpu/drm/tegra/output.c
+++ b/drivers/gpu/drm/tegra/output.c
@@ -142,8 +142,10 @@ int tegra_output_probe(struct tegra_output *output)
 					GPIOD_IN,
 					"HDMI hotplug detect");
 	if (IS_ERR(output->hpd_gpio)) {
-		if (PTR_ERR(output->hpd_gpio) != -ENOENT)
-			return PTR_ERR(output->hpd_gpio);
+		if (PTR_ERR(output->hpd_gpio) != -ENOENT) {
+			err = PTR_ERR(output->hpd_gpio);
+			goto put_i2c;
+		}
 
 		output->hpd_gpio = NULL;
 	}
@@ -152,7 +154,7 @@ int tegra_output_probe(struct tegra_output *output)
 		err = gpiod_to_irq(output->hpd_gpio);
 		if (err < 0) {
 			dev_err(output->dev, "gpiod_to_irq(): %d\n", err);
-			return err;
+			goto put_i2c;
 		}
 
 		output->hpd_irq = err;
@@ -165,7 +167,7 @@ int tegra_output_probe(struct tegra_output *output)
 		if (err < 0) {
 			dev_err(output->dev, "failed to request IRQ#%u: %d\n",
 				output->hpd_irq, err);
-			return err;
+			goto put_i2c;
 		}
 
 		output->connector.polled = DRM_CONNECTOR_POLL_HPD;
@@ -179,6 +181,12 @@ int tegra_output_probe(struct tegra_output *output)
 	}
 
 	return 0;
+
+put_i2c:
+	if (output->ddc)
+		i2c_put_adapter(output->ddc);
+
+	return err;
 }
 
 void tegra_output_remove(struct tegra_output *output)
-- 
2.34.1

