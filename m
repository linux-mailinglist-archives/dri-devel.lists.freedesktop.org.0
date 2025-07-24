Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7420B11142
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 20:57:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68C2610E2A3;
	Thu, 24 Jul 2025 18:57:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=grimler.se header.i=@grimler.se header.b="pdy7IY3p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com
 [91.218.175.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBD5310E29D
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 18:57:32 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grimler.se; s=key1;
 t=1753383093;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IiDy4Kqhspm647hepX8y1s6z9FB1aeWSmguTuvv/WIY=;
 b=pdy7IY3pUnKui/Ta8C2Wr1on2JhuiWcv2LIGyHGanxZrRo8OZkhG83VXMGmPjOYr3AHdQt
 mM4wu0v0g02mryRzQl54NXKXf67brGla0YTkYM3DnEqxY71d4ijEPXqOvhkpHO1ZnfLL/t
 SQCf4v4q5BSBg6iu5GMEA/ZQyLKw3xg=
From: Henrik Grimler <henrik@grimler.se>
Date: Thu, 24 Jul 2025 20:50:53 +0200
Subject: [PATCH v2 3/3] drm/bridge: sii9234: use extcon cable detection
 logic to detect MHL
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-exynos4-sii9234-driver-v2-3-faee244f1d40@grimler.se>
References: <20250724-exynos4-sii9234-driver-v2-0-faee244f1d40@grimler.se>
In-Reply-To: <20250724-exynos4-sii9234-driver-v2-0-faee244f1d40@grimler.se>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, replicant@osuosl.org, 
 linux-kernel@vger.kernel.org, Henrik Grimler <henrik@grimler.se>
X-Developer-Signature: v=1; a=openpgp-sha256; l=4838; i=henrik@grimler.se;
 h=from:subject:message-id; bh=2W4tp0oa2XQwld7BwY7rhkBMwuoZwKS4j+VSjCp8d7Q=;
 b=owEBbQGS/pANAwAKAbAHbkkLcWFrAcsmYgBogoCphlDJtFUAS+pTsqCgiQ4LJlV+aTwzDIlOg
 +vU258AoFqJATMEAAEKAB0WIQQsfymul4kfZBmp4s2wB25JC3FhawUCaIKAqQAKCRCwB25JC3Fh
 a6STB/9C+RD2eaYcEnHCFUmxelDgXrIVwITs1EzwPY/05rgDYSQE2RleM1lhcPukWJJblCUfWse
 OFRGvZDjBO8+Z+arNoALsd5B/2TXXX7KwZxzZJshRwqU1uw1kZfRu8sd4cLt0E7oMYCzsn3zmnq
 217BxK38Td/dsOUw208LpMxtSj73U1FnDKdFD7bfzXINry+bsUWXzrfecDwrJkNja4fJjLRnik9
 gTqJR+zn2f447VX3Ohg33awU3X0Hf6Bljo8MpIc4FcAjYAI2pNrM0DbD5FhjNwKCSzXddSQujCH
 Ou08idSHi0MM7joygqj65s4/ZFloITcMGijNjnedBPwatPxM
X-Developer-Key: i=henrik@grimler.se; a=openpgp;
 fpr=2C7F29AE97891F6419A9E2CDB0076E490B71616B
X-Migadu-Flow: FLOW_OUT
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

To use MHL we currently need the MHL chip to be permanently on, which
consumes unnecessary power. Let's use extcon attached to MUIC to enable
the MHL chip only if it detects an MHL cable.

Signed-off-by: Henrik Grimler <henrik@grimler.se>
---
v2: add dependency on extcon. Issue reported by kernel test robot
    <lkp@intel.com>
---
 drivers/gpu/drm/bridge/Kconfig   |  1 +
 drivers/gpu/drm/bridge/sii9234.c | 89 ++++++++++++++++++++++++++++++++++++++--
 2 files changed, 87 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index b9e0ca85226a603a24f90c6879d1499f824060cb..f18a083f6e1c6fe40bde5e65a1548acc61a162ae 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -303,6 +303,7 @@ config DRM_SII902X
 config DRM_SII9234
 	tristate "Silicon Image SII9234 HDMI/MHL bridge"
 	depends on OF
+	select EXTCON
 	help
 	  Say Y here if you want support for the MHL interface.
 	  It is an I2C driver, that detects connection of MHL bridge
diff --git a/drivers/gpu/drm/bridge/sii9234.c b/drivers/gpu/drm/bridge/sii9234.c
index 0e0bb1bf71fdcef788715cfd6fa158a6992def33..4d84ba01ea76816bebdbc29d48a041c9c6cd508e 100644
--- a/drivers/gpu/drm/bridge/sii9234.c
+++ b/drivers/gpu/drm/bridge/sii9234.c
@@ -19,6 +19,7 @@
 
 #include <linux/delay.h>
 #include <linux/err.h>
+#include <linux/extcon.h>
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
@@ -26,6 +27,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/of_graph.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 
@@ -170,8 +172,12 @@ struct sii9234 {
 	struct drm_bridge bridge;
 	struct device *dev;
 	struct gpio_desc *gpio_reset;
-	int i2c_error;
 	struct regulator_bulk_data supplies[4];
+	struct extcon_dev *extcon;
+	struct notifier_block extcon_nb;
+	struct work_struct extcon_wq;
+	int cable_state;
+	int i2c_error;
 
 	struct mutex lock; /* Protects fields below and device registers */
 	enum sii9234_state state;
@@ -864,6 +870,70 @@ static int sii9234_init_resources(struct sii9234 *ctx,
 	return 0;
 }
 
+static void sii9234_extcon_work(struct work_struct *work)
+{
+	struct sii9234 *ctx =
+		container_of(work, struct sii9234, extcon_wq);
+	int state = extcon_get_state(ctx->extcon, EXTCON_DISP_MHL);
+
+	if (state == ctx->cable_state)
+		return;
+
+	ctx->cable_state = state;
+
+	if (state > 0)
+		sii9234_cable_in(ctx);
+	else
+		sii9234_cable_out(ctx);
+}
+
+static int sii9234_extcon_notifier(struct notifier_block *self,
+			unsigned long event, void *ptr)
+{
+	struct sii9234 *ctx =
+		container_of(self, struct sii9234, extcon_nb);
+
+	schedule_work(&ctx->extcon_wq);
+
+	return NOTIFY_DONE;
+}
+
+static int sii9234_extcon_init(struct sii9234 *ctx)
+{
+	struct extcon_dev *edev;
+	struct device_node *musb, *muic;
+	int ret;
+
+	/* Get micro-USB connector node */
+	musb = of_graph_get_remote_node(ctx->dev->of_node, 1, -1);
+	/* Then get micro-USB Interface Controller node */
+	muic = of_get_next_parent(musb);
+
+	if (!muic) {
+		dev_info(ctx->dev,
+			 "no extcon found, switching to 'always on' mode\n");
+		return 0;
+	}
+
+	edev = extcon_find_edev_by_node(muic);
+	of_node_put(muic);
+	if (IS_ERR(edev)) {
+		dev_err_probe(ctx->dev, PTR_ERR(edev),
+			      "invalid or missing extcon\n");
+	}
+
+	ctx->extcon = edev;
+	ctx->extcon_nb.notifier_call = sii9234_extcon_notifier;
+	INIT_WORK(&ctx->extcon_wq, sii9234_extcon_work);
+	ret = extcon_register_notifier(edev, EXTCON_DISP_MHL, &ctx->extcon_nb);
+	if (ret) {
+		dev_err(ctx->dev, "failed to register notifier for MHL\n");
+		return ret;
+	}
+
+	return 0;
+}
+
 static enum drm_mode_status sii9234_mode_valid(struct drm_bridge *bridge,
 					 const struct drm_display_info *info,
 					 const struct drm_display_mode *mode)
@@ -916,12 +986,17 @@ static int sii9234_probe(struct i2c_client *client)
 	if (ret < 0)
 		return ret;
 
+	ret = sii9234_extcon_init(ctx);
+	if (ret < 0)
+		return ret;
+
 	i2c_set_clientdata(client, ctx);
 
 	ctx->bridge.of_node = dev->of_node;
 	drm_bridge_add(&ctx->bridge);
 
-	sii9234_cable_in(ctx);
+	if (!ctx->extcon)
+		sii9234_cable_in(ctx);
 
 	return 0;
 }
@@ -930,7 +1005,15 @@ static void sii9234_remove(struct i2c_client *client)
 {
 	struct sii9234 *ctx = i2c_get_clientdata(client);
 
-	sii9234_cable_out(ctx);
+	if (ctx->extcon) {
+		extcon_unregister_notifier(ctx->extcon, EXTCON_DISP_MHL,
+					   &ctx->extcon_nb);
+		flush_work(&ctx->extcon_wq);
+		if (ctx->cable_state > 0)
+			sii9234_cable_out(ctx);
+	} else {
+		sii9234_cable_out(ctx);
+	}
 	drm_bridge_remove(&ctx->bridge);
 }
 

-- 
2.50.1

