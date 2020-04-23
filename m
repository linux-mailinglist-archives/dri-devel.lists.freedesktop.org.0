Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C101B673C
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 00:52:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9282C6EA6B;
	Thu, 23 Apr 2020 22:52:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7F7D6E8D9
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 15:34:45 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1587656086; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=7zKcNNqXZLFwySEN7UTUx0psj2bpz+OKnMmIQWq6Ask=;
 b=nYwpyRWFXoz/rEKSwQkFQzHJJTgPefl3U39ehH/PTcQ6VEeObL1Dxd+kJFaor5ZkomiU4IH8
 +qo6MvJdm5HcQLGoavP2rZ++sRFovVW1O64vsp9aFM/LSkRVqH3NCG0DzS6tYbmHfTgvFIlJ
 8+Lj6+bLs+WCc99zViUl3nfg30k=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ea1b594.7fd97c108ab0-smtp-out-n03;
 Thu, 23 Apr 2020 15:34:44 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 8043AC44788; Thu, 23 Apr 2020 15:34:43 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from kgunda-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kgunda)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 0B5D5C4478C;
 Thu, 23 Apr 2020 15:34:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0B5D5C4478C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=kgunda@codeaurora.org
From: Kiran Gunda <kgunda@codeaurora.org>
To: bjorn.andersson@linaro.org, jingoohan1@gmail.com, lee.jones@linaro.org,
 b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org,
 daniel.thompson@linaro.org, jacek.anaszewski@gmail.com, pavel@ucw.cz,
 robh+dt@kernel.org, mark.rutland@arm.com, robh@kernel.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-fbdev@vger.kernel.org
Subject: [PATCH V6 4/4] backlight: qcom-wled: Add support for WLED5 peripheral
 that is present on PM8150L PMICs
Date: Thu, 23 Apr 2020 21:03:37 +0530
Message-Id: <1587656017-27911-5-git-send-email-kgunda@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1587656017-27911-1-git-send-email-kgunda@codeaurora.org>
References: <1587656017-27911-1-git-send-email-kgunda@codeaurora.org>
X-Mailman-Approved-At: Thu, 23 Apr 2020 22:50:35 +0000
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
Cc: Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
 Kiran Gunda <kgunda@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Subbaraman Narayanamurthy <subbaram@codeaurora.org>

PM8150L WLED supports the following:
    - Two modulators and each sink can use any of the modulator
    - Multiple CABC selection options from which one can be selected/enabled
    - Multiple brightness width selection (12 bits to 15 bits)

Signed-off-by: Subbaraman Narayanamurthy <subbaram@codeaurora.org>
Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
---
 drivers/video/backlight/qcom-wled.c | 378 +++++++++++++++++++++++++++++++++++-
 1 file changed, 376 insertions(+), 2 deletions(-)

diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
index 7b0095e..c25c311 100644
--- a/drivers/video/backlight/qcom-wled.c
+++ b/drivers/video/backlight/qcom-wled.c
@@ -15,16 +15,21 @@
 
 /* From DT binding */
 #define WLED_MAX_STRINGS				4
+#define MOD_A						0
+#define MOD_B						1
 
 #define WLED_DEFAULT_BRIGHTNESS				2048
 #define WLED_SOFT_START_DLY_US				10000
 #define WLED3_SINK_REG_BRIGHT_MAX			0xFFF
+#define WLED5_SINK_REG_BRIGHT_MAX_12B			0xFFF
+#define WLED5_SINK_REG_BRIGHT_MAX_15B			0x7FFF
 
 /* WLED3/WLED4 control registers */
 #define WLED3_CTRL_REG_FAULT_STATUS			0x08
 #define  WLED3_CTRL_REG_ILIM_FAULT_BIT			BIT(0)
 #define  WLED3_CTRL_REG_OVP_FAULT_BIT			BIT(1)
 #define  WLED4_CTRL_REG_SC_FAULT_BIT			BIT(2)
+#define  WLED5_CTRL_REG_OVP_PRE_ALARM_BIT		BIT(4)
 
 #define WLED3_CTRL_REG_INT_RT_STS			0x10
 #define  WLED3_CTRL_REG_OVP_FAULT_STATUS		BIT(1)
@@ -40,6 +45,7 @@
 
 #define WLED3_CTRL_REG_OVP				0x4d
 #define  WLED3_CTRL_REG_OVP_MASK			GENMASK(1, 0)
+#define  WLED5_CTRL_REG_OVP_MASK			GENMASK(3, 0)
 
 #define WLED3_CTRL_REG_ILIMIT				0x4e
 #define  WLED3_CTRL_REG_ILIMIT_MASK			GENMASK(2, 0)
@@ -101,6 +107,44 @@
 
 #define WLED4_SINK_REG_BRIGHT(n)			(0x57 + (n * 0x10))
 
+/* WLED5 specific control registers */
+#define WLED5_CTRL_REG_OVP_INT_CTL			0x5f
+#define  WLED5_CTRL_REG_OVP_INT_TIMER_MASK		GENMASK(2, 0)
+
+/* WLED5 specific sink registers */
+#define WLED5_SINK_REG_MOD_A_EN				0x50
+#define WLED5_SINK_REG_MOD_B_EN				0x60
+#define  WLED5_SINK_REG_MOD_EN_MASK			BIT(7)
+
+#define WLED5_SINK_REG_MOD_A_SRC_SEL			0x51
+#define WLED5_SINK_REG_MOD_B_SRC_SEL			0x61
+#define  WLED5_SINK_REG_MOD_SRC_SEL_HIGH		0
+#define  WLED5_SINK_REG_MOD_SRC_SEL_EXT			0x03
+#define  WLED5_SINK_REG_MOD_SRC_SEL_MASK		GENMASK(1, 0)
+
+#define WLED5_SINK_REG_MOD_A_BRIGHTNESS_WIDTH_SEL	0x52
+#define WLED5_SINK_REG_MOD_B_BRIGHTNESS_WIDTH_SEL	0x62
+#define  WLED5_SINK_REG_BRIGHTNESS_WIDTH_12B		0
+#define  WLED5_SINK_REG_BRIGHTNESS_WIDTH_15B		1
+
+#define WLED5_SINK_REG_MOD_A_BRIGHTNESS_LSB		0x53
+#define WLED5_SINK_REG_MOD_A_BRIGHTNESS_MSB		0x54
+#define WLED5_SINK_REG_MOD_B_BRIGHTNESS_LSB		0x63
+#define WLED5_SINK_REG_MOD_B_BRIGHTNESS_MSB		0x64
+
+#define WLED5_SINK_REG_MOD_SYNC_BIT			0x65
+#define  WLED5_SINK_REG_SYNC_MOD_A_BIT			BIT(0)
+#define  WLED5_SINK_REG_SYNC_MOD_B_BIT			BIT(1)
+#define  WLED5_SINK_REG_SYNC_MASK			GENMASK(1, 0)
+
+/* WLED5 specific per-'string' registers below */
+#define WLED5_SINK_REG_STR_FULL_SCALE_CURR(n)		(0x72 + (n * 0x10))
+
+#define WLED5_SINK_REG_STR_SRC_SEL(n)			(0x73 + (n * 0x10))
+#define  WLED5_SINK_REG_SRC_SEL_MOD_A			0
+#define  WLED5_SINK_REG_SRC_SEL_MOD_B			1
+#define  WLED5_SINK_REG_SRC_SEL_MASK			GENMASK(1, 0)
+
 struct wled_var_cfg {
 	const u32 *values;
 	u32 (*fn)(u32);
@@ -125,6 +169,8 @@ struct wled_config {
 	u32 num_strings;
 	u32 string_i_limit;
 	u32 enabled_strings[WLED_MAX_STRINGS];
+	u32 mod_sel;
+	u32 cabc_sel;
 	bool cs_out_en;
 	bool ext_gen;
 	bool cabc;
@@ -150,6 +196,7 @@ struct wled {
 	u32 version;
 	bool disabled_by_short;
 	bool has_short_detect;
+	bool cabc_disabled;
 	int short_irq;
 	int ovp_irq;
 
@@ -222,6 +269,28 @@ static int wled4_set_brightness(struct wled *wled, u16 brightness)
 	return 0;
 }
 
+static int wled5_set_brightness(struct wled *wled, u16 brightness)
+{
+	int rc, offset;
+	u16 low_limit = wled->max_brightness * 1 / 1000;
+	u8 v[2];
+
+	/* WLED5's lower limit is 0.1% */
+	if (brightness < low_limit)
+		brightness = low_limit;
+
+	v[0] = brightness & 0xff;
+	v[1] = (brightness >> 8) & 0x7f;
+
+	offset = (wled->cfg.mod_sel == MOD_A) ?
+		  WLED5_SINK_REG_MOD_A_BRIGHTNESS_LSB :
+		  WLED5_SINK_REG_MOD_B_BRIGHTNESS_LSB;
+
+	rc = regmap_bulk_write(wled->regmap, wled->sink_addr + offset,
+			       v, 2);
+	return rc;
+}
+
 static void wled_ovp_work(struct work_struct *work)
 {
 	struct wled *wled = container_of(work,
@@ -279,6 +348,24 @@ static int wled3_sync_toggle(struct wled *wled)
 	return rc;
 }
 
+static int wled5_sync_toggle(struct wled *wled)
+{
+	int rc;
+	u8 val;
+
+	val = (wled->cfg.mod_sel == MOD_A) ? WLED5_SINK_REG_SYNC_MOD_A_BIT :
+					     WLED5_SINK_REG_SYNC_MOD_B_BIT;
+	rc = regmap_update_bits(wled->regmap,
+				wled->sink_addr + WLED5_SINK_REG_MOD_SYNC_BIT,
+				WLED5_SINK_REG_SYNC_MASK, val);
+	if (rc < 0)
+		return rc;
+
+	return regmap_update_bits(wled->regmap,
+				  wled->sink_addr + WLED5_SINK_REG_MOD_SYNC_BIT,
+				  WLED5_SINK_REG_SYNC_MASK, 0);
+}
+
 static int wled_ovp_fault_status(struct wled *wled, bool *fault_set)
 {
 	int rc;
@@ -304,7 +391,11 @@ static int wled_ovp_fault_status(struct wled *wled, bool *fault_set)
 	if (int_rt_sts & WLED3_CTRL_REG_OVP_FAULT_STATUS)
 		*fault_set = true;
 
-	if (fault_sts & WLED3_CTRL_REG_OVP_FAULT_BIT)
+	if (wled->version == 4 && (fault_sts & WLED3_CTRL_REG_OVP_FAULT_BIT))
+		*fault_set = true;
+
+	if (wled->version == 5 && (fault_sts & (WLED3_CTRL_REG_OVP_FAULT_BIT |
+				   WLED5_CTRL_REG_OVP_PRE_ALARM_BIT)))
 		*fault_set = true;
 
 	if (*fault_set)
@@ -319,6 +410,26 @@ static int wled4_ovp_delay(struct wled *wled)
 	return WLED_SOFT_START_DLY_US;
 }
 
+static int wled5_ovp_delay(struct wled *wled)
+{
+	int rc, delay_us;
+	u32 val;
+	u8 ovp_timer_ms[8] = {1, 2, 4, 8, 12, 16, 20, 24};
+
+	/* For WLED5, get the delay based on OVP timer */
+	rc = regmap_read(wled->regmap, wled->ctrl_addr +
+			 WLED5_CTRL_REG_OVP_INT_CTL, &val);
+	if (rc < 0)
+		delay_us =
+		ovp_timer_ms[val & WLED5_CTRL_REG_OVP_INT_TIMER_MASK] * 1000;
+	else
+		delay_us = 2 * WLED_SOFT_START_DLY_US;
+
+	dev_dbg(wled->dev, "delay_time_us: %d\n", delay_us);
+
+	return delay_us;
+}
+
 static int wled_update_status(struct backlight_device *bl)
 {
 	struct wled *wled = bl_get_data(bl);
@@ -381,6 +492,31 @@ static int wled4_cabc_config(struct wled *wled, bool enable)
 	return 0;
 }
 
+static int wled5_cabc_config(struct wled *wled, bool enable)
+{
+	int rc, offset;
+	u8 reg;
+
+	if (wled->cabc_disabled)
+		return 0;
+
+	reg = enable ? wled->cfg.cabc_sel : 0;
+	offset = (wled->cfg.mod_sel == MOD_A) ? WLED5_SINK_REG_MOD_A_SRC_SEL :
+						WLED5_SINK_REG_MOD_B_SRC_SEL;
+
+	rc = regmap_update_bits(wled->regmap, wled->sink_addr + offset,
+				WLED5_SINK_REG_MOD_SRC_SEL_MASK, reg);
+	if (rc < 0) {
+		pr_err("Error in configuring CABC rc=%d\n", rc);
+		return rc;
+	}
+
+	if (!wled->cfg.cabc_sel)
+		wled->cabc_disabled = true;
+
+	return 0;
+}
+
 #define WLED_SHORT_DLY_MS			20
 #define WLED_SHORT_CNT_MAX			5
 #define WLED_SHORT_RESET_CNT_DLY_US		USEC_PER_SEC
@@ -646,6 +782,23 @@ static bool wled4_auto_detection_required(struct wled *wled)
 	return false;
 }
 
+static bool wled5_auto_detection_required(struct wled *wled)
+{
+	if (!wled->cfg.auto_detection_enabled)
+		return false;
+
+	/*
+	 * Unlike WLED4, WLED5 has OVP fault density interrupt configuration
+	 * i.e. to count the number of OVP alarms for a certain duration before
+	 * triggering OVP fault interrupt. By default, number of OVP fault
+	 * events counted before an interrupt is fired is 32 and the time
+	 * interval is 12 ms. If we see one OVP fault interrupt, then that
+	 * should qualify for a real OVP fault condition to run auto detection
+	 * algorithm.
+	 */
+	return true;
+}
+
 static int wled_auto_detection_at_init(struct wled *wled)
 {
 	int rc;
@@ -921,6 +1074,119 @@ static const struct wled_config wled4_config_defaults = {
 	.auto_detection_enabled = false,
 };
 
+static int wled5_setup(struct wled *wled)
+{
+	int rc, temp, i, j, offset;
+	u8 sink_en = 0;
+	u16 addr;
+	u32 val;
+
+	rc = regmap_update_bits(wled->regmap,
+				wled->ctrl_addr + WLED3_CTRL_REG_OVP,
+				WLED5_CTRL_REG_OVP_MASK, wled->cfg.ovp);
+	if (rc < 0)
+		return rc;
+
+	rc = regmap_update_bits(wled->regmap,
+				wled->ctrl_addr + WLED3_CTRL_REG_ILIMIT,
+				WLED3_CTRL_REG_ILIMIT_MASK,
+				wled->cfg.boost_i_limit);
+	if (rc < 0)
+		return rc;
+
+	rc = regmap_update_bits(wled->regmap,
+				wled->ctrl_addr + WLED3_CTRL_REG_FREQ,
+				WLED3_CTRL_REG_FREQ_MASK,
+				wled->cfg.switch_freq);
+	if (rc < 0)
+		return rc;
+
+	/* Per sink/string configuration */
+	for (i = 0; i < wled->cfg.num_strings; ++i) {
+		j = wled->cfg.enabled_strings[i];
+		addr = wled->sink_addr +
+				WLED4_SINK_REG_STR_FULL_SCALE_CURR(j);
+		rc = regmap_update_bits(wled->regmap, addr,
+					WLED4_SINK_REG_STR_FULL_SCALE_CURR_MASK,
+					wled->cfg.string_i_limit);
+		if (rc < 0)
+			return rc;
+
+		addr = wled->sink_addr + WLED5_SINK_REG_STR_SRC_SEL(j);
+		rc = regmap_update_bits(wled->regmap, addr,
+					WLED5_SINK_REG_SRC_SEL_MASK,
+					wled->cfg.mod_sel == MOD_A ?
+					WLED5_SINK_REG_SRC_SEL_MOD_A :
+					WLED5_SINK_REG_SRC_SEL_MOD_B);
+
+		temp = j + WLED4_SINK_REG_CURR_SINK_SHFT;
+		sink_en |= 1 << temp;
+	}
+
+	rc = wled5_cabc_config(wled, wled->cfg.cabc_sel ? true : false);
+	if (rc < 0)
+		return rc;
+
+	/* Enable one of the modulators A or B based on mod_sel */
+	addr = wled->sink_addr + WLED5_SINK_REG_MOD_A_EN;
+	val = (wled->cfg.mod_sel == MOD_A) ? WLED5_SINK_REG_MOD_EN_MASK : 0;
+	rc = regmap_update_bits(wled->regmap, addr,
+				WLED5_SINK_REG_MOD_EN_MASK, val);
+	if (rc < 0)
+		return rc;
+
+	addr = wled->sink_addr + WLED5_SINK_REG_MOD_B_EN;
+	val = (wled->cfg.mod_sel == MOD_B) ? WLED5_SINK_REG_MOD_EN_MASK : 0;
+	rc = regmap_update_bits(wled->regmap, addr,
+				WLED5_SINK_REG_MOD_EN_MASK, val);
+	if (rc < 0)
+		return rc;
+
+	offset = (wled->cfg.mod_sel == MOD_A) ?
+		  WLED5_SINK_REG_MOD_A_BRIGHTNESS_WIDTH_SEL :
+		  WLED5_SINK_REG_MOD_B_BRIGHTNESS_WIDTH_SEL;
+
+	addr = wled->sink_addr + offset;
+	val = (wled->max_brightness == WLED5_SINK_REG_BRIGHT_MAX_15B) ?
+		 WLED5_SINK_REG_BRIGHTNESS_WIDTH_15B :
+		 WLED5_SINK_REG_BRIGHTNESS_WIDTH_12B;
+	rc = regmap_write(wled->regmap, addr, val);
+	if (rc < 0)
+		return rc;
+
+	rc = regmap_update_bits(wled->regmap,
+				wled->sink_addr + WLED4_SINK_REG_CURR_SINK,
+				WLED4_SINK_REG_CURR_SINK_MASK, sink_en);
+	if (rc < 0)
+		return rc;
+
+	/* This updates only FSC configuration in WLED5 */
+	rc = wled->wled_sync_toggle(wled);
+	if (rc < 0) {
+		pr_err("Failed to toggle sync reg rc:%d\n", rc);
+		return rc;
+	}
+
+	rc = wled_auto_detection_at_init(wled);
+	if (rc < 0)
+		return rc;
+
+	return 0;
+}
+
+static const struct wled_config wled5_config_defaults = {
+	.boost_i_limit = 5,
+	.string_i_limit = 10,
+	.ovp = 4,
+	.num_strings = 4,
+	.switch_freq = 11,
+	.mod_sel = 0,
+	.cabc_sel = 0,
+	.cabc = false,
+	.external_pfet = false,
+	.auto_detection_enabled = false,
+};
+
 static const u32 wled3_boost_i_limit_values[] = {
 	105, 385, 525, 805, 980, 1260, 1400, 1680,
 };
@@ -939,6 +1205,16 @@ static const struct wled_var_cfg wled4_boost_i_limit_cfg = {
 	.size = ARRAY_SIZE(wled4_boost_i_limit_values),
 };
 
+static inline u32 wled5_boost_i_limit_values_fn(u32 idx)
+{
+	return 525 + (idx * 175);
+}
+
+static const struct wled_var_cfg wled5_boost_i_limit_cfg = {
+	.fn = wled5_boost_i_limit_values_fn,
+	.size = 8,
+};
+
 static const u32 wled3_ovp_values[] = {
 	35, 32, 29, 27,
 };
@@ -957,6 +1233,21 @@ static const struct wled_var_cfg wled4_ovp_cfg = {
 	.size = ARRAY_SIZE(wled4_ovp_values),
 };
 
+static inline u32 wled5_ovp_values_fn(u32 idx)
+{
+	/*
+	 * 0000 - 38.5 V
+	 * 0001 - 37 V ..
+	 * 1111 - 16 V
+	 */
+	return 38500 - (idx * 1500);
+}
+
+static const struct wled_var_cfg wled5_ovp_cfg = {
+	.fn = wled5_ovp_values_fn,
+	.size = 16,
+};
+
 static u32 wled3_num_strings_values_fn(u32 idx)
 {
 	return idx + 1;
@@ -996,6 +1287,14 @@ static const struct wled_var_cfg wled4_string_i_limit_cfg = {
 	.size = ARRAY_SIZE(wled4_string_i_limit_values),
 };
 
+static const struct wled_var_cfg wled5_mod_sel_cfg = {
+	.size = 2,
+};
+
+static const struct wled_var_cfg wled5_cabc_sel_cfg = {
+	.size = 4,
+};
+
 static u32 wled_values(const struct wled_var_cfg *cfg, u32 idx)
 {
 	if (idx >= cfg->size)
@@ -1072,6 +1371,44 @@ static int wled_configure(struct wled *wled)
 		},
 	};
 
+	const struct wled_u32_opts wled5_opts[] = {
+		{
+			.name = "qcom,current-boost-limit",
+			.val_ptr = &cfg->boost_i_limit,
+			.cfg = &wled5_boost_i_limit_cfg,
+		},
+		{
+			.name = "qcom,current-limit-microamp",
+			.val_ptr = &cfg->string_i_limit,
+			.cfg = &wled4_string_i_limit_cfg,
+		},
+		{
+			.name = "qcom,ovp-millivolt",
+			.val_ptr = &cfg->ovp,
+			.cfg = &wled5_ovp_cfg,
+		},
+		{
+			.name = "qcom,switching-freq",
+			.val_ptr = &cfg->switch_freq,
+			.cfg = &wled3_switch_freq_cfg,
+		},
+		{
+			.name = "qcom,num-strings",
+			.val_ptr = &cfg->num_strings,
+			.cfg = &wled4_num_strings_cfg,
+		},
+		{
+			.name = "qcom,modulator-sel",
+			.val_ptr = &cfg->mod_sel,
+			.cfg = &wled5_mod_sel_cfg,
+		},
+		{
+			.name = "qcom,cabc-sel",
+			.val_ptr = &cfg->cabc_sel,
+			.cfg = &wled5_cabc_sel_cfg,
+		},
+	};
+
 	const struct wled_bool_opts bool_opts[] = {
 		{ "qcom,cs-out", &cfg->cs_out_en, },
 		{ "qcom,ext-gen", &cfg->ext_gen, },
@@ -1122,6 +1459,26 @@ static int wled_configure(struct wled *wled)
 		wled->sink_addr = be32_to_cpu(*prop_addr);
 		break;
 
+	case 5:
+		u32_opts = wled5_opts;
+		size = ARRAY_SIZE(wled5_opts);
+		*cfg = wled5_config_defaults;
+		wled->wled_set_brightness = wled5_set_brightness;
+		wled->wled_sync_toggle = wled5_sync_toggle;
+		wled->wled_cabc_config = wled5_cabc_config;
+		wled->wled_ovp_delay = wled5_ovp_delay;
+		wled->wled_auto_detection_required =
+					wled5_auto_detection_required;
+		wled->max_string_count = 4;
+
+		prop_addr = of_get_address(dev->of_node, 1, NULL, NULL);
+		if (!prop_addr) {
+			dev_err(wled->dev, "invalid IO resources\n");
+			return -EINVAL;
+		}
+		wled->sink_addr = be32_to_cpu(*prop_addr);
+		break;
+
 	default:
 		dev_err(wled->dev, "Invalid WLED version\n");
 		return -EINVAL;
@@ -1275,6 +1632,10 @@ static int wled_probe(struct platform_device *pdev)
 	if (rc)
 		return rc;
 
+	val = WLED3_SINK_REG_BRIGHT_MAX;
+	of_property_read_u32(pdev->dev.of_node, "max-brightness", &val);
+	wled->max_brightness = val;
+
 	switch (wled->version) {
 	case 3:
 		wled->cfg.auto_detection_enabled = false;
@@ -1294,6 +1655,18 @@ static int wled_probe(struct platform_device *pdev)
 		}
 		break;
 
+	case 5:
+		wled->has_short_detect = true;
+		if (wled->cfg.cabc_sel)
+			wled->max_brightness = WLED5_SINK_REG_BRIGHT_MAX_12B;
+
+		rc = wled5_setup(wled);
+		if (rc) {
+			dev_err(&pdev->dev, "wled5_setup failed\n");
+			return rc;
+		}
+		break;
+
 	default:
 		dev_err(wled->dev, "Invalid WLED version\n");
 		break;
@@ -1315,7 +1688,7 @@ static int wled_probe(struct platform_device *pdev)
 	memset(&props, 0, sizeof(struct backlight_properties));
 	props.type = BACKLIGHT_RAW;
 	props.brightness = val;
-	props.max_brightness = WLED3_SINK_REG_BRIGHT_MAX;
+	props.max_brightness = wled->max_brightness;
 	bl = devm_backlight_device_register(&pdev->dev, wled->name,
 					    &pdev->dev, wled,
 					    &wled_ops, &props);
@@ -1338,6 +1711,7 @@ static const struct of_device_id wled_match_table[] = {
 	{ .compatible = "qcom,pm8941-wled", .data = (void *)3 },
 	{ .compatible = "qcom,pmi8998-wled", .data = (void *)4 },
 	{ .compatible = "qcom,pm660l-wled", .data = (void *)4 },
+	{ .compatible = "qcom,pm8150l-wled", .data = (void *)5 },
 	{}
 };
 MODULE_DEVICE_TABLE(of, wled_match_table);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
 a Linux Foundation Collaborative Project
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
