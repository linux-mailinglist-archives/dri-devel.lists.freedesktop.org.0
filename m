Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D69A84F0B7C
	for <lists+dri-devel@lfdr.de>; Sun,  3 Apr 2022 19:10:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AA9B10E8B7;
	Sun,  3 Apr 2022 17:10:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 630B310E8B7
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Apr 2022 17:10:29 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 4C1EB83AEF;
 Sun,  3 Apr 2022 19:10:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1649005827;
 bh=EzaHtqlqnl6v/BpajGKZha1dEh+6XCtBSWIDbAuEjAI=;
 h=From:To:Cc:Subject:Date:From;
 b=h86ez168JBAM+Iq0XZmLaQ9sHM6Bz+Eq4bcg5YhjkQdAXieZbRGCJ8gzPPoHfA17a
 K7wwR0voJtXauT1hfRWwLTecto/jxbve7oT6mRWykbNvysOA/e4RqpOYTIiqlvP07N
 YTR0TANqQH7SRuL0+38mjJUeexXK1lm55wKePADR8Kc6ZT4uDlSg13YnCJSb/IgXYV
 WITnoewiiqIup9Y9W5Jm/9AsJxOxUtbxEAlReIUKOmCvyaRkksbNsbRDDD3xVZ7AOJ
 prk0pe0eoARWfUNMDYMXAcBRozrKADpZliOD2tiAGhiiRvtVk1miW7B1LPPYFF75RW
 fuuATCm2fagIw==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: bridge: icn6211: Convert to regmap
Date: Sun,  3 Apr 2022 19:10:04 +0200
Message-Id: <20220403171004.368464-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>, robert.foss@linaro.org,
 Mark Brown <broonie@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To make debugging easier, convert driver to regmap. Implement read and write
regmap tables for known registers, keep all known register readable and mark
those which are obviously read-only as not writeable.

Use common I2C regmap for the I2C configuration, implement custom regmap bus
for DSI configuration. The later is mandatory as this chip requires one extra
byte set to read access length between register address and data.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
To: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/bridge/Kconfig           |  1 +
 drivers/gpu/drm/bridge/chipone-icn6211.c | 96 ++++++++++++++++++++++--
 2 files changed, 89 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index ee7610c2c1a4d..9d22826dc8545 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -32,6 +32,7 @@ config DRM_CHIPONE_ICN6211
 	select DRM_KMS_HELPER
 	select DRM_MIPI_DSI
 	select DRM_PANEL_BRIDGE
+	select REGMAP_I2C
 	help
 	  ICN6211 is MIPI-DSI/RGB Converter bridge from chipone.
 
diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/bridge/chipone-icn6211.c
index f4b152901d0e8..981ff93155824 100644
--- a/drivers/gpu/drm/bridge/chipone-icn6211.c
+++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
@@ -14,6 +14,7 @@
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
+#include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 
 #define VENDOR_ID		0x00
@@ -134,6 +135,7 @@
 
 struct chipone {
 	struct device *dev;
+	struct regmap *regmap;
 	struct i2c_client *client;
 	struct drm_bridge bridge;
 	struct drm_display_mode mode;
@@ -146,6 +148,77 @@ struct chipone {
 	bool interface_i2c;
 };
 
+static const struct regmap_range chipone_dsi_readable_ranges[] = {
+	regmap_reg_range(VENDOR_ID, VERSION_ID),
+	regmap_reg_range(FIRMWARE_VERSION, PLL_SSC_OFFSET(3)),
+	regmap_reg_range(GPIO_OEN, MIPI_ULPS_CTRL),
+	regmap_reg_range(MIPI_CLK_CHK_VAR, MIPI_T_TA_SURE_PRE),
+	regmap_reg_range(MIPI_T_LPX_SET, MIPI_INIT_TIME_H),
+	regmap_reg_range(MIPI_T_CLK_TERM_EN, MIPI_T_CLK_SETTLE),
+	regmap_reg_range(MIPI_TO_HS_RX_L, MIPI_PHY_(5)),
+	regmap_reg_range(MIPI_PD_RX, MIPI_RST_NUM),
+	regmap_reg_range(MIPI_DBG_SET_(0), MIPI_DBG_SET_(9)),
+	regmap_reg_range(MIPI_DBG_SEL, MIPI_ATE_STATUS_(1)),
+};
+
+static const struct regmap_access_table chipone_dsi_readable_table = {
+	.yes_ranges = chipone_dsi_readable_ranges,
+	.n_yes_ranges = ARRAY_SIZE(chipone_dsi_readable_ranges),
+};
+
+static const struct regmap_range chipone_dsi_writeable_ranges[] = {
+	regmap_reg_range(CONFIG_FINISH, PLL_SSC_OFFSET(3)),
+	regmap_reg_range(GPIO_OEN, MIPI_ULPS_CTRL),
+	regmap_reg_range(MIPI_CLK_CHK_VAR, MIPI_T_TA_SURE_PRE),
+	regmap_reg_range(MIPI_T_LPX_SET, MIPI_INIT_TIME_H),
+	regmap_reg_range(MIPI_T_CLK_TERM_EN, MIPI_T_CLK_SETTLE),
+	regmap_reg_range(MIPI_TO_HS_RX_L, MIPI_PHY_(5)),
+	regmap_reg_range(MIPI_PD_RX, MIPI_RST_NUM),
+	regmap_reg_range(MIPI_DBG_SET_(0), MIPI_DBG_SET_(9)),
+	regmap_reg_range(MIPI_DBG_SEL, MIPI_ATE_STATUS_(1)),
+};
+
+static const struct regmap_access_table chipone_dsi_writeable_table = {
+	.yes_ranges = chipone_dsi_writeable_ranges,
+	.n_yes_ranges = ARRAY_SIZE(chipone_dsi_writeable_ranges),
+};
+
+static const struct regmap_config chipone_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.rd_table = &chipone_dsi_readable_table,
+	.wr_table = &chipone_dsi_writeable_table,
+	.cache_type = REGCACHE_RBTREE,
+	.max_register = MIPI_ATE_STATUS_(1),
+};
+
+static int chipone_dsi_read(void *context,
+			    const void *reg, size_t reg_size,
+			    void *val, size_t val_size)
+{
+	struct mipi_dsi_device *dsi = context;
+	const u16 reg16 = (val_size << 8) | *(u8 *)reg;
+	int ret;
+
+	ret = mipi_dsi_generic_read(dsi, &reg16, 2, val, val_size);
+
+	return ret == val_size ? 0 : -EINVAL;
+}
+
+static int chipone_dsi_write(void *context, const void *data, size_t count)
+{
+	struct mipi_dsi_device *dsi = context;
+
+	return mipi_dsi_generic_write(dsi, data, 2);
+}
+
+static const struct regmap_bus chipone_dsi_regmap_bus = {
+	.read				= chipone_dsi_read,
+	.write				= chipone_dsi_write,
+	.reg_format_endian_default	= REGMAP_ENDIAN_NATIVE,
+	.val_format_endian_default	= REGMAP_ENDIAN_NATIVE,
+};
+
 static inline struct chipone *bridge_to_chipone(struct drm_bridge *bridge)
 {
 	return container_of(bridge, struct chipone, bridge);
@@ -153,18 +226,16 @@ static inline struct chipone *bridge_to_chipone(struct drm_bridge *bridge)
 
 static void chipone_readb(struct chipone *icn, u8 reg, u8 *val)
 {
-	if (icn->interface_i2c)
-		*val = i2c_smbus_read_byte_data(icn->client, reg);
-	else
-		mipi_dsi_generic_read(icn->dsi, (u8[]){reg, 1}, 2, val, 1);
+	int ret, pval;
+
+	ret = regmap_read(icn->regmap, reg, &pval);
+
+	*val = ret ? 0 : pval & 0xff;
 }
 
 static int chipone_writeb(struct chipone *icn, u8 reg, u8 val)
 {
-	if (icn->interface_i2c)
-		return i2c_smbus_write_byte_data(icn->client, reg, val);
-	else
-		return mipi_dsi_generic_write(icn->dsi, (u8[]){reg, val}, 2);
+	return regmap_write(icn->regmap, reg, val);
 }
 
 static void chipone_configure_pll(struct chipone *icn,
@@ -591,6 +662,11 @@ static int chipone_dsi_probe(struct mipi_dsi_device *dsi)
 	if (ret)
 		return ret;
 
+	icn->regmap = devm_regmap_init(dev, &chipone_dsi_regmap_bus,
+				       dsi, &chipone_regmap_config);
+	if (IS_ERR(icn->regmap))
+		return PTR_ERR(icn->regmap);
+
 	icn->interface_i2c = false;
 	icn->dsi = dsi;
 
@@ -616,6 +692,10 @@ static int chipone_i2c_probe(struct i2c_client *client,
 	if (ret)
 		return ret;
 
+	icn->regmap = devm_regmap_init_i2c(client, &chipone_regmap_config);
+	if (IS_ERR(icn->regmap))
+		return PTR_ERR(icn->regmap);
+
 	icn->interface_i2c = true;
 	icn->client = client;
 	dev_set_drvdata(dev, icn);
-- 
2.35.1

