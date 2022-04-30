Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A142E5159EC
	for <lists+dri-devel@lfdr.de>; Sat, 30 Apr 2022 04:52:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 799F310E319;
	Sat, 30 Apr 2022 02:52:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E73D10E319
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Apr 2022 02:52:16 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 2265683F05;
 Sat, 30 Apr 2022 04:52:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1651287134;
 bh=O1KvsJglA30U9ZaS3wIowH15gRaBoAg55R/eCU5TFos=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gBXuyxH5BKKyvjJSiFsdNY0Uo6AXnZSUpmlfV/DWhSlXLLZ1DA//+0TAKJpNDfVSP
 DtApyFVL0ecbvjWnAwNY0Fgzd+tQkumIU3Egq2a5fEK1tThcVv/rcFbq/L0I/0wn9A
 Qcdo7FYIdWZunN5tXL59xksv0EFMEjjRRB5TnKxFhIYBb3fQV2EfEp2+dlbe8qeogy
 VvrrF8HLawzRYwrgeTexPU2rO5vKpSLR6anDR1HK9dX0/60rGNXdVyYJ/f1KXwuggs
 aRE+1pWnXogTO/AIFPdiL5DZiIr/+DwknHN2tAFfTev0jun+MoF72BxLmLz/TvDi5w
 nQAOiaT+kfQpQ==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] [RFC] drm: bridge: icn6211: Convert to regmap_config bulk
 read/write
Date: Sat, 30 Apr 2022 04:51:45 +0200
Message-Id: <20220430025145.640305-2-marex@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220430025145.640305-1-marex@denx.de>
References: <20220430025145.640305-1-marex@denx.de>
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

Instead of working around the missing bulk register read/write in
regmap_config using regmap_bus callbacks, switch to new regmap_config
read/write callbacks.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
To: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/bridge/chipone-icn6211.c | 38 ++++++++++++++----------
 1 file changed, 22 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/bridge/chipone-icn6211.c
index 45bb89ac3fff..e1f632940e00 100644
--- a/drivers/gpu/drm/bridge/chipone-icn6211.c
+++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
@@ -181,15 +181,6 @@ static const struct regmap_access_table chipone_dsi_writeable_table = {
 	.n_yes_ranges = ARRAY_SIZE(chipone_dsi_writeable_ranges),
 };
 
-static const struct regmap_config chipone_regmap_config = {
-	.reg_bits = 8,
-	.val_bits = 8,
-	.rd_table = &chipone_dsi_readable_table,
-	.wr_table = &chipone_dsi_writeable_table,
-	.cache_type = REGCACHE_RBTREE,
-	.max_register = MIPI_ATE_STATUS(1),
-};
-
 static int chipone_dsi_read(void *context,
 			    const void *reg, size_t reg_size,
 			    void *val, size_t val_size)
@@ -210,11 +201,26 @@ static int chipone_dsi_write(void *context, const void *data, size_t count)
 	return mipi_dsi_generic_write(dsi, data, 2);
 }
 
-static const struct regmap_bus chipone_dsi_regmap_bus = {
-	.read				= chipone_dsi_read,
-	.write				= chipone_dsi_write,
-	.reg_format_endian_default	= REGMAP_ENDIAN_NATIVE,
-	.val_format_endian_default	= REGMAP_ENDIAN_NATIVE,
+static const struct regmap_config chipone_regmap_config = {
+	.name = "chipone-i2c",
+	.reg_bits = 8,
+	.val_bits = 8,
+	.rd_table = &chipone_dsi_readable_table,
+	.wr_table = &chipone_dsi_writeable_table,
+	.cache_type = REGCACHE_RBTREE,
+	.max_register = MIPI_ATE_STATUS(1),
+};
+
+static const struct regmap_config chipone_dsi_regmap_config = {
+	.name = "chipone-dsi",
+	.reg_bits = 8,
+	.val_bits = 8,
+	.rd_table = &chipone_dsi_readable_table,
+	.wr_table = &chipone_dsi_writeable_table,
+	.cache_type = REGCACHE_RBTREE,
+	.max_register = MIPI_ATE_STATUS(1),
+	.read = chipone_dsi_read,
+	.write = chipone_dsi_write,
 };
 
 static inline struct chipone *bridge_to_chipone(struct drm_bridge *bridge)
@@ -691,8 +697,8 @@ static int chipone_dsi_probe(struct mipi_dsi_device *dsi)
 	if (ret)
 		return ret;
 
-	icn->regmap = devm_regmap_init(dev, &chipone_dsi_regmap_bus,
-				       dsi, &chipone_regmap_config);
+	icn->regmap = devm_regmap_init(dev, NULL,
+				       dsi, &chipone_dsi_regmap_config);
 	if (IS_ERR(icn->regmap))
 		return PTR_ERR(icn->regmap);
 
-- 
2.35.1

