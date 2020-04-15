Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1054A1AAC3D
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 17:49:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 295036EA20;
	Wed, 15 Apr 2020 15:49:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 835F66EA20
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 15:49:51 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id w65so126918pfc.12
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 08:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3TcYtFb955DdLUqQ4wh/jHw6PTVA4MVFQZ5AAMLk1uI=;
 b=Q+2H5HRGqXKyuO953mqNSWSWuP0Jcv8K05M9H+z/d6VxWaJnyz6OwL5VqxYVisCc3E
 6J4MhvDrnhPaWQsT13ScrFZugoYK/gqrWykjAndpdJkUTE3APxxsojgE1jOwEhzeoEwo
 Z6N3eOZLbKC+BXFfyy3hEZZIOMDmc8M9ksf9o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3TcYtFb955DdLUqQ4wh/jHw6PTVA4MVFQZ5AAMLk1uI=;
 b=GlNnzdxyp6Wg3NVVUR3miYmTos39idf2kcvyAKxFD9vOnSHHw9Krv9sCbDmWzhtChj
 a6q1Th06ZdOdQ9oRLvdGzFPtfDefMaQLtjcTAWOV9iZ3fzW58CBi/vJqTj2dKGh/ZEKx
 kFoPwAriRyg2570/COyGwv8ivkBEldgDfWqQobBwPJDgdmXP+MSC4N24T95vH1zQaWbl
 ppYfQsy8wajJMLPBMw+QtI6ngwZ7I9480vZy0bqHinCLHxu0QI5WeGNh/vWyOJBZy6vx
 eMYwGhUErVPAN80dM3TzzL6b6UAC4NYVWuzPw/ZGHWozVE8lChD5HzT7mDDum6s/8ccg
 llQw==
X-Gm-Message-State: AGi0PubmdLEHs0H4WTnpglNaZlcENxfbf8Oh1SNyqe/OKqkT/tAzRPKU
 G7qTEZGJoF3QHcd4Chf1oIg+Bg==
X-Google-Smtp-Source: APiQypJLeNa5uw5VJSbOSg64EhAnxZefyNQeVYOHS3PESCrfw0xwE/dGys7uupMVLlpw6DBGbzXF+g==
X-Received: by 2002:aa7:81c3:: with SMTP id c3mr9311089pfn.12.1586965790965;
 Wed, 15 Apr 2020 08:49:50 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id x27sm14382473pfj.74.2020.04.15.08.49.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 08:49:50 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 narmstrong@baylibre.com, a.hajda@samsung.com,
 Laurent.pinchart@ideasonboard.com, spanda@codeaurora.org
Subject: [PATCH 3/3] drm/bridge: ti-sn65dsi86: Allow one of the bridge GPIOs
 to be HPD
Date: Wed, 15 Apr 2020 08:48:41 -0700
Message-Id: <20200415084758.3.Ia50267a5549392af8b37e67092ca653a59c95886@changeid>
X-Mailer: git-send-email 2.26.0.110.g2183baf09c-goog
In-Reply-To: <20200415084758.1.Ifcdc4ecb12742a27862744ee1e8753cb95a38a7f@changeid>
References: <20200415084758.1.Ifcdc4ecb12742a27862744ee1e8753cb95a38a7f@changeid>
MIME-Version: 1.0
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
Cc: robdclark@chromium.org, devicetree@vger.kernel.org, jernej.skrabec@siol.net,
 jeffrey.l.hugo@gmail.com, linux-arm-msm@vger.kernel.org, jonas@kwiboo.se,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, bjorn.andersson@linaro.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As talked about in commit c2bfc223882d ("drm/bridge: ti-sn65dsi86:
Remove the mystery delay"), the normal HPD pin on ti-sn65dsi86 is
kinda useless, at least for embedded DisplayPort (eDP).  However,
despite the fact that the actual HPD pin on the bridge is mostly
useless for eDP, the concept of HPD for eDP still makes sense.  It
allows us to optimize out a hardcoded delay that many panels need if
HPD isn't hooked up.  Panel timing diagrams show HPD as one of the
events to measure timing from and we have to assume the worst case if
we can't actually read HPD.

One way to use HPD for eDP without using the mostly useless HPD pin on
ti-sn65dsi86 is to route the panel's HPD somewhere else in the system,
like to a GPIO.  This works great because eDP panels aren't physically
hotplugged.  That means the debouncing logic that caused us problems
wasn't really needed and a raw GPIO works great.

As per the above, a smart board designer would realize the value of
HPD and choose to route it to a GPIO somewhere on the board to avoid
the silly sn65dsi86 debouncing.  While said "smart designer" could
theoretically route HPD anywhere on the board, a really smart designer
would realize that there are several GPIOs on the bridge itself that
are nearly useless for anything but this purpose and route HPD to one
of those.

Specifically, to argue that the GPIOs on the bridge are mostly useless
for non-bridge-related things:
- You need to power on the bridge to use them.  Ideally a system only
  powers on the bridge when the screen is on which means you could
  only use the GPIOs on the bridge when the screen is on (or you're
  willing to burn a bunch of extra power).
- You need to control the GPIOs via i2c commands, which means that you
  can only use these GPIOs for drivers that can call
  gpio_set_value_cansleep().

With the above, let's assume that:
- If someone was going to route the HPD to a GPIO they'd use one of
  the GPIOs on the bridge.
- There's not lots of value exposing the GPIOs on the bridge through
  the normal Linux GPIO framework because nobody will likely use them
  for something non-bridge-related.

As you can probably guess from the above arguments, this patch adds
the ability to use one of the bridge's GPIOs as the HPD pin but it
doesn't add it in the completely generic (and a bit heavier) way of
going through the GPIO subsystem.  This means:
- With this patch you can't use bridge GPIOs for non-bridge purposes.
- With this patch you can't use a different GPIO in the SoC for HPD.

Despite the above limitations, which keep the code simpler, we still
use the generic GPIO device tree bindings.  If someone later has a
need to relax some of the restrictions here, it would just need a code
patch.  We wouldn't need to change the device tree bindings.

This patch has been tested on a board that is not yet mainline.  On
the hardware I have:
- Panel spec says HPD could take up to 200 ms to come up, so without
  HPD hooked up we need to delay 200 ms.
- On my board the panel is powered by the same rail as the
  touchscreen.  By chance of probe order the touchscreen comes up
  first.  This means by the time we check HPD in ti_sn_bridge_enable()
  it's already up.  Thus we can use the panel on 200 ms earlier.
- If I hack out the touscreen, I see that I wait ~31 ms for HPD to go
  high.  This means I save ~169 ms of delay.
- If I measure HPD on this pane it comes up ~56 ms after the panel is
  powered.  The delta between 31 and 56 ms is because the panel
  regulator is turned on at the end of ti_sn_bridge_pre_enable() in
  drm_panel_prepare().  There is apparently some time between that and
  ti_sn_bridge_enable().

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 107 ++++++++++++++++++++++++++
 1 file changed, 107 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 6ad688b320ae..187b2bdd0cb4 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -54,6 +54,13 @@
 #define  BPP_18_RGB				BIT(0)
 #define SN_HPD_DISABLE_REG			0x5C
 #define  HPD_DISABLE				BIT(0)
+#define SN_GPIO_IO_REG				0x5E
+#define  SN_GPIO_INPUT_SHIFT			4
+#define  SN_GPIO_OUTPUT_SHIFT			0
+#define SN_GPIO_CTRL_REG			0x5F
+#define  SN_GPIO_MUX_INPUT			0
+#define  SN_GPIO_MUX_OUTPUT			1
+#define  SN_GPIO_MUX_SPECIAL			2
 #define SN_AUX_WDATA_REG(x)			(0x64 + (x))
 #define SN_AUX_ADDR_19_16_REG			0x74
 #define SN_AUX_ADDR_15_8_REG			0x75
@@ -102,6 +109,7 @@ struct ti_sn_bridge {
 	struct gpio_desc		*enable_gpio;
 	struct regulator_bulk_data	supplies[SN_REGULATOR_SUPPLY_NUM];
 	int				dp_lanes;
+	int				hpd_gpio_pin;
 };
 
 static const struct regmap_range ti_sn_bridge_volatile_ranges[] = {
@@ -120,6 +128,45 @@ static const struct regmap_config ti_sn_bridge_regmap_config = {
 	.cache_type = REGCACHE_NONE,
 };
 
+/**
+ * ti_sn_read_gpio() - Read a GPIO pin.
+ * @pdata: Platform data.
+ * @gpio_num: The GPIO to read.  This is 1-based to match the pin names so
+ *            valid values are 1-4.
+ *
+ * This function assumes the pin direction / muxing is already configured.
+ *
+ * Return: 0 if the pin is low; 1 if the pin is high; -error upon failure
+ */
+static int ti_sn_read_gpio(struct ti_sn_bridge *pdata, int gpio_num)
+{
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(pdata->regmap, SN_GPIO_IO_REG, &val);
+	if (ret)
+		return ret;
+
+	return (val >> (SN_GPIO_INPUT_SHIFT + gpio_num - 1)) & 1;
+}
+
+/**
+ * ti_sn_setup_mux() - Setup a GPIO pinmux.
+ * @pdata: Platform data.
+ * @gpio_num: The GPIO to setup.  This is 1-based to match the pin names so
+ *            valid values are 1-4.
+ * @val: The mux value; One of the SN_GPIO_MUX_... constants.
+ *
+ * Return: 0 if success; either error.
+ */
+static int ti_sn_setup_mux(struct ti_sn_bridge *pdata, int gpio_num, int val)
+{
+	int shift = (gpio_num - 1) * 2;
+
+	return regmap_update_bits(pdata->regmap, SN_GPIO_CTRL_REG,
+				  0x3 << shift, val << shift);
+}
+
 static void ti_sn_bridge_write_u16(struct ti_sn_bridge *pdata,
 				   unsigned int reg, u16 val)
 {
@@ -658,6 +705,11 @@ static int ti_sn_link_training(struct ti_sn_bridge *pdata, int dp_rate_idx,
 	return ret;
 }
 
+static bool ti_sn_read_hpd_gpio(struct ti_sn_bridge *pdata)
+{
+	return ti_sn_read_gpio(pdata, pdata->hpd_gpio_pin) == 1;
+}
+
 static void ti_sn_bridge_enable(struct drm_bridge *bridge)
 {
 	struct ti_sn_bridge *pdata = bridge_to_ti_sn_bridge(bridge);
@@ -666,6 +718,25 @@ static void ti_sn_bridge_enable(struct drm_bridge *bridge)
 	int dp_rate_idx;
 	unsigned int val;
 	int ret = -EINVAL;
+	bool hpd_asserted;
+
+	/*
+	 * On some designs HPD could be routed to one of the GPIOs on the
+	 * bridge.  In that case, delay up to 2 seconds waiting for HPD to be
+	 * asserted.
+	 */
+	if (pdata->hpd_gpio_pin) {
+		ret = ti_sn_setup_mux(pdata, pdata->hpd_gpio_pin,
+				      SN_GPIO_MUX_INPUT);
+		if (ret) {
+			DRM_ERROR("failed to setup HPD mux\n");
+			return;
+		}
+
+		ret = readx_poll_timeout(ti_sn_read_hpd_gpio, pdata,
+					 hpd_asserted, hpd_asserted,
+					 1000, 2000000);
+	}
 
 	/*
 	 * Run with the maximum number of lanes that the DP sink supports.
@@ -874,6 +945,40 @@ static int ti_sn_bridge_parse_dsi_host(struct ti_sn_bridge *pdata)
 	return 0;
 }
 
+static void ti_sn_probe_hpd_gpio(struct ti_sn_bridge *pdata)
+{
+	struct device_node *np = pdata->dev->of_node;
+	int num_elems;
+	u32 hpd_gpio_pin;
+
+	num_elems = of_property_count_u32_elems(np, "hpd-gpios");
+
+	/* It's optional, so no worries if it's not there */
+	if (num_elems == -EINVAL)
+		return;
+
+	if (num_elems != 3) {
+		dev_warn(pdata->dev,
+			 "Unexpected hpd-gpios count (%d); ignoring\n",
+			 num_elems);
+		return;
+	}
+
+	/*
+	 * Right now, we only support using one of our own GPIOs for
+	 * this, but our device tree bindings are more generic.  Confirm
+	 * we're actually a client of ourselves.
+	 */
+	if (of_parse_phandle(np, "hpd-gpios", 0) != np) {
+		dev_warn(pdata->dev,
+			 "Only bridge-local hpd-gpios supported; ignoring\n");
+		return;
+	}
+
+	if (!of_property_read_u32_index(np, "hpd-gpios", 1, &hpd_gpio_pin))
+		pdata->hpd_gpio_pin = hpd_gpio_pin;
+}
+
 static int ti_sn_bridge_probe(struct i2c_client *client,
 			      const struct i2c_device_id *id)
 {
@@ -916,6 +1021,8 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
 		return ret;
 	}
 
+	ti_sn_probe_hpd_gpio(pdata);
+
 	ret = ti_sn_bridge_parse_regulators(pdata);
 	if (ret) {
 		DRM_ERROR("failed to parse regulators\n");
-- 
2.26.0.110.g2183baf09c-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
