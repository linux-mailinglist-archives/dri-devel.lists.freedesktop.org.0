Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1168E4D86AC
	for <lists+dri-devel@lfdr.de>; Mon, 14 Mar 2022 15:17:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFC0010E2C4;
	Mon, 14 Mar 2022 14:17:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B44A510E430
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Mar 2022 14:17:40 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1nTlVS-0004zK-Bl; Mon, 14 Mar 2022 15:17:06 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nTlVI-000f2h-Bp; Mon, 14 Mar 2022 15:16:55 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nTlVG-0097ab-9N; Mon, 14 Mar 2022 15:16:54 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Lars Povlsen <lars.povlsen@microchip.com>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 UNGLinuxDriver@microchip.com, linux-hwmon@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, Matt Mackall <mpm@selenic.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Oleksij Rempel <linux@rempel-privat.de>, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v8 02/16] clk: Provide new devm_clk helpers for prepared and
 enabled clocks
Date: Mon, 14 Mar 2022 15:16:29 +0100
Message-Id: <20220314141643.22184-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220314141643.22184-1-u.kleine-koenig@pengutronix.de>
References: <20220314141643.22184-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=6580; i=uwe@kleine-koenig.org;
 h=from:subject; bh=jqwSnvDQbBb4RgD/N+2Gw8Lk4ZgGlEcniX5xP+ormpg=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBiL03vygZ14+FklBjEtfsr0n5Fj7pM3zCRBT9hjlOo
 D6x0wfOJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYi9N7wAKCRDB/BR4rcrsCW0OB/
 43XIdPZ3YEVyeJcVZVgIWqjU0WCMAkdNPd+cU39oxeA5WcvEM+r2wINAXO9SjYVP4eV60bVzYVmWWP
 /4qbeio/xVurdJ7Ut2JGUCHJFu6SPC4ClqX2SoQ/JgYpWKUthuRTck4jK/kt92O+Rx8MXx3VYb58Te
 WdLCTWqtr7pFF4DaX9T5+yuCky8m4NUbi3kaBeCxn5rVPZlXNv0IEn1k9Xkeb5VWYhGIzPb277tXWL
 2BwknXn7RuNCQErT4IAfGPlnO1EMkKZxvhHJ3f5GuCKo9hh7+mqbcb2+7anljvY6nbic3kSBAgO8Kc
 UpsFmFTmEF329SWkaIlHjE4yXN1sYB
X-Developer-Key: i=uwe@kleine-koenig.org; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Tomislav Denis <tomislav.denis@avl.com>, linux-iio@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-i2c@vger.kernel.org,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 linux-clk@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-rtc@vger.kernel.org, Michal Simek <michal.simek@xilinx.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andy Gross <agross@kernel.org>,
 Alexandru Ardelean <aardelean@deviqon.com>,
 Keguang Zhang <keguang.zhang@gmail.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>, linux-pwm@vger.kernel.org,
 kernel@pengutronix.de, linux-arm-msm@vger.kernel.org,
 Anand Ashok Dumbre <anand.ashok.dumbre@xilinx.com>,
 Vladimir Zapolskiy <vz@mleia.com>, linux-gpio@vger.kernel.org,
 =?utf-8?q?Andr=C3=A9_Gustavo_Nakagomi_Lopez?= <andregnl@usp.br>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 linux-amlogic@lists.infradead.org,
 Amireddy Mallikarjuna reddy <mallikarjunax.reddy@linux.intel.com>,
 linux-mips@vger.kernel.org, linux-spi@vger.kernel.org,
 Cai Huoqing <caihuoqing@baidu.com>, linux-crypto@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, dmaengine@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When a driver keeps a clock prepared (or enabled) during the whole
lifetime of the driver, these helpers allow to simplify the drivers.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Alexandru Ardelean <aardelean@deviqon.com>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/clk/clk-devres.c | 31 ++++++++++++++
 include/linux/clk.h      | 90 +++++++++++++++++++++++++++++++++++++++-
 2 files changed, 120 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-devres.c b/drivers/clk/clk-devres.c
index fb7761888b30..4707fe718f0b 100644
--- a/drivers/clk/clk-devres.c
+++ b/drivers/clk/clk-devres.c
@@ -67,12 +67,43 @@ struct clk *devm_clk_get(struct device *dev, const char *id)
 }
 EXPORT_SYMBOL(devm_clk_get);
 
+struct clk *devm_clk_get_prepared(struct device *dev, const char *id)
+{
+	return __devm_clk_get(dev, id, clk_get, clk_prepare, clk_unprepare);
+
+}
+EXPORT_SYMBOL(devm_clk_get_prepared);
+
+struct clk *devm_clk_get_enabled(struct device *dev, const char *id)
+{
+	return __devm_clk_get(dev, id, clk_get,
+			      clk_prepare_enable, clk_disable_unprepare);
+
+}
+EXPORT_SYMBOL(devm_clk_get_enabled);
+
 struct clk *devm_clk_get_optional(struct device *dev, const char *id)
 {
 	return __devm_clk_get(dev, id, clk_get_optional, NULL, NULL);
 }
 EXPORT_SYMBOL(devm_clk_get_optional);
 
+struct clk *devm_clk_get_optional_prepared(struct device *dev, const char *id)
+{
+	return __devm_clk_get(dev, id, clk_get_optional,
+			      clk_prepare, clk_unprepare);
+
+}
+EXPORT_SYMBOL(devm_clk_get_optional_prepared);
+
+struct clk *devm_clk_get_optional_enabled(struct device *dev, const char *id)
+{
+	return __devm_clk_get(dev, id, clk_get_optional,
+			      clk_prepare_enable, clk_disable_unprepare);
+
+}
+EXPORT_SYMBOL(devm_clk_get_optional_enabled);
+
 struct clk_bulk_devres {
 	struct clk_bulk_data *clks;
 	int num_clks;
diff --git a/include/linux/clk.h b/include/linux/clk.h
index 266e8de3cb51..b011dbba7109 100644
--- a/include/linux/clk.h
+++ b/include/linux/clk.h
@@ -449,7 +449,7 @@ int __must_check devm_clk_bulk_get_all(struct device *dev,
  * the clock producer.  (IOW, @id may be identical strings, but
  * clk_get may return different clock producers depending on @dev.)
  *
- * Drivers must assume that the clock source is not enabled.
+ * Drivers must assume that the clock source is neither prepared nor enabled.
  *
  * devm_clk_get should not be called from within interrupt context.
  *
@@ -458,6 +458,47 @@ int __must_check devm_clk_bulk_get_all(struct device *dev,
  */
 struct clk *devm_clk_get(struct device *dev, const char *id);
 
+/**
+ * devm_clk_get_prepared - devm_clk_get() + clk_prepare()
+ * @dev: device for clock "consumer"
+ * @id: clock consumer ID
+ *
+ * Returns a struct clk corresponding to the clock producer, or
+ * valid IS_ERR() condition containing errno.  The implementation
+ * uses @dev and @id to determine the clock consumer, and thereby
+ * the clock producer.  (IOW, @id may be identical strings, but
+ * clk_get may return different clock producers depending on @dev.)
+ *
+ * The returned clk (if valid) is prepared. Drivers must however assume that the
+ * clock is not enabled.
+ *
+ * devm_clk_get_prepared should not be called from within interrupt context.
+ *
+ * The clock will automatically be unprepared and freed when the
+ * device is unbound from the bus.
+ */
+struct clk *devm_clk_get_prepared(struct device *dev, const char *id);
+
+/**
+ * devm_clk_get_enabled - devm_clk_get() + clk_prepare_enable()
+ * @dev: device for clock "consumer"
+ * @id: clock consumer ID
+ *
+ * Returns a struct clk corresponding to the clock producer, or valid IS_ERR()
+ * condition containing errno.  The implementation uses @dev and @id to
+ * determine the clock consumer, and thereby the clock producer.  (IOW, @id may
+ * be identical strings, but clk_get may return different clock producers
+ * depending on @dev.)
+ *
+ * The returned clk (if valid) is prepared and enabled.
+ *
+ * devm_clk_get_prepared should not be called from within interrupt context.
+ *
+ * The clock will automatically be disabled, unprepared and freed when the
+ * device is unbound from the bus.
+ */
+struct clk *devm_clk_get_enabled(struct device *dev, const char *id);
+
 /**
  * devm_clk_get_optional - lookup and obtain a managed reference to an optional
  *			   clock producer.
@@ -469,6 +510,29 @@ struct clk *devm_clk_get(struct device *dev, const char *id);
  */
 struct clk *devm_clk_get_optional(struct device *dev, const char *id);
 
+/**
+ * devm_clk_get_optional_prepared - devm_clk_get_optional() + clk_prepare()
+ * @dev: device for clock "consumer"
+ * @id: clock consumer ID
+ *
+ * Behaves the same as devm_clk_get_prepared() except where there is no clock
+ * producer.  In this case, instead of returning -ENOENT, the function returns
+ * NULL.
+ */
+struct clk *devm_clk_get_optional_prepared(struct device *dev, const char *id);
+
+/**
+ * devm_clk_get_optional_enabled - devm_clk_get_optional() +
+ *                                 clk_prepare_enable()
+ * @dev: device for clock "consumer"
+ * @id: clock consumer ID
+ *
+ * Behaves the same as devm_clk_get_enabled() except where there is no clock
+ * producer.  In this case, instead of returning -ENOENT, the function returns
+ * NULL.
+ */
+struct clk *devm_clk_get_optional_enabled(struct device *dev, const char *id);
+
 /**
  * devm_get_clk_from_child - lookup and obtain a managed reference to a
  *			     clock producer from child node.
@@ -813,12 +877,36 @@ static inline struct clk *devm_clk_get(struct device *dev, const char *id)
 	return NULL;
 }
 
+static inline struct clk *devm_clk_get_prepared(struct device *dev,
+						const char *id)
+{
+	return NULL;
+}
+
+static inline struct clk *devm_clk_get_enabled(struct device *dev,
+					       const char *id)
+{
+	return NULL;
+}
+
 static inline struct clk *devm_clk_get_optional(struct device *dev,
 						const char *id)
 {
 	return NULL;
 }
 
+static inline struct clk *devm_clk_get_optional_prepared(struct device *dev,
+							 const char *id)
+{
+	return NULL;
+}
+
+static inline struct clk *devm_clk_get_optional_enabled(struct device *dev,
+							const char *id)
+{
+	return NULL;
+}
+
 static inline int __must_check devm_clk_bulk_get(struct device *dev, int num_clks,
 						 struct clk_bulk_data *clks)
 {
-- 
2.35.1

