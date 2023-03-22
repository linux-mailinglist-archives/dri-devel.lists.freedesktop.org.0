Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BEE6C4816
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 11:47:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0459910E906;
	Wed, 22 Mar 2023 10:47:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4F0C10E90E
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 10:47:22 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 lr16-20020a17090b4b9000b0023f187954acso18708967pjb.2
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 03:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1679482042;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Zi5kRr1rKA9wYplZo1eciMlGKtNnjsOD4nLoCcW5ycY=;
 b=j8+Qriw2FxqOOr9uGlvsHYw37O5aqZQgxpfadsVvzBCMVQTTE8TZaEDOZ7k07SKhzg
 na9Xaj7Z3ju8BUKQvTLqFg6fl0uz/rPPJCu0b+rGSE5hQDYgE4lECOVDGa9P/IltEKRH
 njgRrMSBRo04CkZ2RJ6DAsHq0m9PwEj9RYTtA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679482042;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Zi5kRr1rKA9wYplZo1eciMlGKtNnjsOD4nLoCcW5ycY=;
 b=k6S+mlRmHuacWsFhGR+TbLkl9gibNZxrjrqrBpBe5aUOOhYsrwXkUb2oKq1WNxkppZ
 hQ5N1MfLoCdspMvdAxtw2as1nQKDjeSytV6Nkr4PVfe412fHFO+fSRaBI0LGXulmbxEu
 z9fK2jXYV39pBEICOLOLnzPow/tpl8qwbTRo+czv3ivO6MvWy7FsfN/WosoO3cmRz7iT
 HT2AjNhsHgX9D3c7MmOepM63pLa2rKAWD/JGvgdBbCADfGWDWK852b/W3E70eqyz/kVS
 h5fBDqrIXO17bcbCQJ+o8XzsEyuAtzSiNRWbt6Y0JfGPFcD/5X+JHkrpXIe2y+pQi6Le
 KENg==
X-Gm-Message-State: AO0yUKW78aiZzah1XwcsFozLGGf65tUSy3r8uDbjgPbKG6CqPBHLPG/p
 e9vWTYsuVK83nCjXORRmNuCeEw==
X-Google-Smtp-Source: AK7set8sqKKY5MR3zx6z4kZ8AxVP6rSKRQygVLNpE3BtKSadWMuJ+DOa86uCmA8EPH8cK7uMk0pVlw==
X-Received: by 2002:a17:90b:4b51:b0:23d:1aae:29e5 with SMTP id
 mi17-20020a17090b4b5100b0023d1aae29e5mr3333471pjb.20.1679482042307; 
 Wed, 22 Mar 2023 03:47:22 -0700 (PDT)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:343d:79bf:55f9:1da5])
 by smtp.gmail.com with ESMTPSA id
 hg4-20020a17090b300400b002340d317f3esm9508742pjb.52.2023.03.22.03.47.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 03:47:22 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Prashant Malani <pmalani@chromium.org>, Benson Leung <bleung@chromium.org>,
 Guenter Roeck <groeck@chromium.org>
Subject: [PATCH v14 06/10] drm/bridge: Remove redundant i2c_client in
 anx7625/it6505
Date: Wed, 22 Mar 2023 18:46:35 +0800
Message-Id: <20230322104639.221402-7-treapking@chromium.org>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
In-Reply-To: <20230322104639.221402-1-treapking@chromium.org>
References: <20230322104639.221402-1-treapking@chromium.org>
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
Cc: Marek Vasut <marex@denx.de>, chrome-platform@lists.linux.dev,
 =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>, Pin-yen Lin <treapking@chromium.org>,
 Allen Chen <allen.chen@ite.com.tw>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 devicetree@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These two drivers embed a i2c_client in their private driver data, but
only strict device is actually needed. Replace the i2c_client reference
with a struct device one.

Signed-off-by: Pin-yen Lin <treapking@chromium.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---

(no changes since v13)

Changes in v13:
- Update a typo in the commit message
- Collect Reviewed-by tag

Changes in v12:
- New in v12

 drivers/gpu/drm/bridge/analogix/anx7625.c |  96 ++++++++--------
 drivers/gpu/drm/bridge/analogix/anx7625.h |   2 +-
 drivers/gpu/drm/bridge/ite-it6505.c       | 128 +++++++++++-----------
 3 files changed, 113 insertions(+), 113 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 3f6bf7674d32..76d46db3f8dc 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -207,7 +207,7 @@ static int anx7625_read_ctrl_status_p0(struct anx7625_data *ctx)
 
 static int wait_aux_op_finish(struct anx7625_data *ctx)
 {
-	struct device *dev = &ctx->client->dev;
+	struct device *dev = ctx->dev;
 	int val;
 	int ret;
 
@@ -234,7 +234,7 @@ static int wait_aux_op_finish(struct anx7625_data *ctx)
 static int anx7625_aux_trans(struct anx7625_data *ctx, u8 op, u32 address,
 			     u8 len, u8 *buf)
 {
-	struct device *dev = &ctx->client->dev;
+	struct device *dev = ctx->dev;
 	int ret;
 	u8 addrh, addrm, addrl;
 	u8 cmd;
@@ -427,7 +427,7 @@ static int anx7625_odfc_config(struct anx7625_data *ctx,
 			       u8 post_divider)
 {
 	int ret;
-	struct device *dev = &ctx->client->dev;
+	struct device *dev = ctx->dev;
 
 	/* Config input reference clock frequency 27MHz/19.2MHz */
 	ret = anx7625_write_and(ctx, ctx->i2c.rx_p1_client, MIPI_DIGITAL_PLL_16,
@@ -477,7 +477,7 @@ static int anx7625_set_k_value(struct anx7625_data *ctx)
 
 static int anx7625_dsi_video_timing_config(struct anx7625_data *ctx)
 {
-	struct device *dev = &ctx->client->dev;
+	struct device *dev = ctx->dev;
 	unsigned long m, n;
 	u16 htotal;
 	int ret;
@@ -575,7 +575,7 @@ static int anx7625_dsi_video_timing_config(struct anx7625_data *ctx)
 static int anx7625_swap_dsi_lane3(struct anx7625_data *ctx)
 {
 	int val;
-	struct device *dev = &ctx->client->dev;
+	struct device *dev = ctx->dev;
 
 	/* Swap MIPI-DSI data lane 3 P and N */
 	val = anx7625_reg_read(ctx, ctx->i2c.rx_p1_client, MIPI_SWAP);
@@ -592,7 +592,7 @@ static int anx7625_api_dsi_config(struct anx7625_data *ctx)
 
 {
 	int val, ret;
-	struct device *dev = &ctx->client->dev;
+	struct device *dev = ctx->dev;
 
 	/* Swap MIPI-DSI data lane 3 P and N */
 	ret = anx7625_swap_dsi_lane3(ctx);
@@ -657,7 +657,7 @@ static int anx7625_api_dsi_config(struct anx7625_data *ctx)
 
 static int anx7625_dsi_config(struct anx7625_data *ctx)
 {
-	struct device *dev = &ctx->client->dev;
+	struct device *dev = ctx->dev;
 	int ret;
 
 	DRM_DEV_DEBUG_DRIVER(dev, "config dsi.\n");
@@ -689,7 +689,7 @@ static int anx7625_dsi_config(struct anx7625_data *ctx)
 
 static int anx7625_api_dpi_config(struct anx7625_data *ctx)
 {
-	struct device *dev = &ctx->client->dev;
+	struct device *dev = ctx->dev;
 	u16 freq = ctx->dt.pixelclock.min / 1000;
 	int ret;
 
@@ -720,7 +720,7 @@ static int anx7625_api_dpi_config(struct anx7625_data *ctx)
 
 static int anx7625_dpi_config(struct anx7625_data *ctx)
 {
-	struct device *dev = &ctx->client->dev;
+	struct device *dev = ctx->dev;
 	int ret;
 
 	DRM_DEV_DEBUG_DRIVER(dev, "config dpi\n");
@@ -765,7 +765,7 @@ static int anx7625_read_flash_status(struct anx7625_data *ctx)
 static int anx7625_hdcp_key_probe(struct anx7625_data *ctx)
 {
 	int ret, val;
-	struct device *dev = &ctx->client->dev;
+	struct device *dev = ctx->dev;
 	u8 ident[FLASH_BUF_LEN];
 
 	ret = anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
@@ -815,7 +815,7 @@ static int anx7625_hdcp_key_probe(struct anx7625_data *ctx)
 static int anx7625_hdcp_key_load(struct anx7625_data *ctx)
 {
 	int ret;
-	struct device *dev = &ctx->client->dev;
+	struct device *dev = ctx->dev;
 
 	/* Select HDCP 1.4 KEY */
 	ret = anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
@@ -843,7 +843,7 @@ static int anx7625_hdcp_key_load(struct anx7625_data *ctx)
 static int anx7625_hdcp_disable(struct anx7625_data *ctx)
 {
 	int ret;
-	struct device *dev = &ctx->client->dev;
+	struct device *dev = ctx->dev;
 
 	dev_dbg(dev, "disable HDCP 1.4\n");
 
@@ -864,7 +864,7 @@ static int anx7625_hdcp_enable(struct anx7625_data *ctx)
 {
 	u8 bcap;
 	int ret;
-	struct device *dev = &ctx->client->dev;
+	struct device *dev = ctx->dev;
 
 	ret = anx7625_hdcp_key_probe(ctx);
 	if (ret) {
@@ -922,7 +922,7 @@ static int anx7625_hdcp_enable(struct anx7625_data *ctx)
 static void anx7625_dp_start(struct anx7625_data *ctx)
 {
 	int ret;
-	struct device *dev = &ctx->client->dev;
+	struct device *dev = ctx->dev;
 	u8 data;
 
 	if (!ctx->display_timing_valid) {
@@ -955,7 +955,7 @@ static void anx7625_dp_start(struct anx7625_data *ctx)
 
 static void anx7625_dp_stop(struct anx7625_data *ctx)
 {
-	struct device *dev = &ctx->client->dev;
+	struct device *dev = ctx->dev;
 	int ret;
 	u8 data;
 
@@ -1020,7 +1020,7 @@ static int sp_tx_aux_rd(struct anx7625_data *ctx, u8 len_cmd)
 static int sp_tx_get_edid_block(struct anx7625_data *ctx)
 {
 	int c = 0;
-	struct device *dev = &ctx->client->dev;
+	struct device *dev = ctx->dev;
 
 	sp_tx_aux_wr(ctx, 0x7e);
 	sp_tx_aux_rd(ctx, 0x01);
@@ -1042,7 +1042,7 @@ static int edid_read(struct anx7625_data *ctx,
 		     u8 offset, u8 *pblock_buf)
 {
 	int ret, cnt;
-	struct device *dev = &ctx->client->dev;
+	struct device *dev = ctx->dev;
 
 	for (cnt = 0; cnt <= EDID_TRY_CNT; cnt++) {
 		sp_tx_aux_wr(ctx, offset);
@@ -1073,7 +1073,7 @@ static int segments_edid_read(struct anx7625_data *ctx,
 {
 	u8 cnt;
 	int ret;
-	struct device *dev = &ctx->client->dev;
+	struct device *dev = ctx->dev;
 
 	/* Write address only */
 	ret = anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
@@ -1128,7 +1128,7 @@ static int sp_tx_edid_read(struct anx7625_data *ctx,
 	u8 i, j;
 	int g_edid_break = 0;
 	int ret;
-	struct device *dev = &ctx->client->dev;
+	struct device *dev = ctx->dev;
 
 	/* Address initial */
 	ret = anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
@@ -1235,7 +1235,7 @@ static int sp_tx_edid_read(struct anx7625_data *ctx,
 
 static void anx7625_power_on(struct anx7625_data *ctx)
 {
-	struct device *dev = &ctx->client->dev;
+	struct device *dev = ctx->dev;
 	int ret, i;
 
 	if (!ctx->pdata.low_power_mode) {
@@ -1271,7 +1271,7 @@ static void anx7625_power_on(struct anx7625_data *ctx)
 
 static void anx7625_power_standby(struct anx7625_data *ctx)
 {
-	struct device *dev = &ctx->client->dev;
+	struct device *dev = ctx->dev;
 	int ret;
 
 	if (!ctx->pdata.low_power_mode) {
@@ -1301,7 +1301,7 @@ static void anx7625_config(struct anx7625_data *ctx)
 
 static void anx7625_disable_pd_protocol(struct anx7625_data *ctx)
 {
-	struct device *dev = &ctx->client->dev;
+	struct device *dev = ctx->dev;
 	int ret;
 
 	/* Reset main ocm */
@@ -1321,7 +1321,7 @@ static void anx7625_disable_pd_protocol(struct anx7625_data *ctx)
 static int anx7625_ocm_loading_check(struct anx7625_data *ctx)
 {
 	int ret;
-	struct device *dev = &ctx->client->dev;
+	struct device *dev = ctx->dev;
 
 	/* Check interface workable */
 	ret = anx7625_reg_read(ctx, ctx->i2c.rx_p0_client,
@@ -1367,7 +1367,7 @@ static void anx7625_power_on_init(struct anx7625_data *ctx)
 
 static void anx7625_init_gpio(struct anx7625_data *platform)
 {
-	struct device *dev = &platform->client->dev;
+	struct device *dev = platform->dev;
 
 	DRM_DEV_DEBUG_DRIVER(dev, "init gpio\n");
 
@@ -1407,7 +1407,7 @@ static void anx7625_stop_dp_work(struct anx7625_data *ctx)
 static void anx7625_start_dp_work(struct anx7625_data *ctx)
 {
 	int ret;
-	struct device *dev = &ctx->client->dev;
+	struct device *dev = ctx->dev;
 
 	if (ctx->hpd_high_cnt >= 2) {
 		DRM_DEV_DEBUG_DRIVER(dev, "filter useless HPD\n");
@@ -1459,7 +1459,7 @@ static int _anx7625_hpd_polling(struct anx7625_data *ctx,
 				unsigned long wait_us)
 {
 	int ret, val;
-	struct device *dev = &ctx->client->dev;
+	struct device *dev = ctx->dev;
 
 	/* Interrupt mode, no need poll HPD status, just return */
 	if (ctx->pdata.intp_irq)
@@ -1493,7 +1493,7 @@ static int anx7625_wait_hpd_asserted(struct drm_dp_aux *aux,
 				     unsigned long wait_us)
 {
 	struct anx7625_data *ctx = container_of(aux, struct anx7625_data, aux);
-	struct device *dev = &ctx->client->dev;
+	struct device *dev = ctx->dev;
 	int ret;
 
 	pm_runtime_get_sync(dev);
@@ -1526,7 +1526,7 @@ static void anx7625_dp_adjust_swing(struct anx7625_data *ctx)
 
 static void dp_hpd_change_handler(struct anx7625_data *ctx, bool on)
 {
-	struct device *dev = &ctx->client->dev;
+	struct device *dev = ctx->dev;
 
 	/* HPD changed */
 	DRM_DEV_DEBUG_DRIVER(dev, "dp_hpd_change_default_func: %d\n",
@@ -1546,7 +1546,7 @@ static void dp_hpd_change_handler(struct anx7625_data *ctx, bool on)
 static int anx7625_hpd_change_detect(struct anx7625_data *ctx)
 {
 	int intr_vector, status;
-	struct device *dev = &ctx->client->dev;
+	struct device *dev = ctx->dev;
 
 	status = anx7625_reg_write(ctx, ctx->i2c.tcpc_client,
 				   INTR_ALERT_1, 0xFF);
@@ -1594,7 +1594,7 @@ static void anx7625_work_func(struct work_struct *work)
 
 	mutex_lock(&ctx->lock);
 
-	if (pm_runtime_suspended(&ctx->client->dev))
+	if (pm_runtime_suspended(ctx->dev))
 		goto unlock;
 
 	event = anx7625_hpd_change_detect(ctx);
@@ -1738,7 +1738,7 @@ static ssize_t anx7625_aux_transfer(struct drm_dp_aux *aux,
 				    struct drm_dp_aux_msg *msg)
 {
 	struct anx7625_data *ctx = container_of(aux, struct anx7625_data, aux);
-	struct device *dev = &ctx->client->dev;
+	struct device *dev = ctx->dev;
 	u8 request = msg->request & ~DP_AUX_I2C_MOT;
 	int ret = 0;
 
@@ -1764,7 +1764,7 @@ static ssize_t anx7625_aux_transfer(struct drm_dp_aux *aux,
 
 static struct edid *anx7625_get_edid(struct anx7625_data *ctx)
 {
-	struct device *dev = &ctx->client->dev;
+	struct device *dev = ctx->dev;
 	struct s_edid_data *p_edid = &ctx->slimport_edid_p;
 	int edid_num;
 	u8 *edid;
@@ -1800,7 +1800,7 @@ static struct edid *anx7625_get_edid(struct anx7625_data *ctx)
 
 static enum drm_connector_status anx7625_sink_detect(struct anx7625_data *ctx)
 {
-	struct device *dev = &ctx->client->dev;
+	struct device *dev = ctx->dev;
 
 	DRM_DEV_DEBUG_DRIVER(dev, "sink detect\n");
 
@@ -2009,7 +2009,7 @@ static const struct hdmi_codec_ops anx7625_codec_ops = {
 
 static void anx7625_unregister_audio(struct anx7625_data *ctx)
 {
-	struct device *dev = &ctx->client->dev;
+	struct device *dev = ctx->dev;
 
 	if (ctx->audio_pdev) {
 		platform_device_unregister(ctx->audio_pdev);
@@ -2045,7 +2045,7 @@ static int anx7625_register_audio(struct device *dev, struct anx7625_data *ctx)
 static int anx7625_attach_dsi(struct anx7625_data *ctx)
 {
 	struct mipi_dsi_device *dsi;
-	struct device *dev = &ctx->client->dev;
+	struct device *dev = ctx->dev;
 	struct mipi_dsi_host *host;
 	const struct mipi_dsi_device_info info = {
 		.type = "anx7625",
@@ -2098,7 +2098,7 @@ static void hdcp_check_work_func(struct work_struct *work)
 
 	dwork = to_delayed_work(work);
 	ctx = container_of(dwork, struct anx7625_data, hdcp_work);
-	dev = &ctx->client->dev;
+	dev = ctx->dev;
 
 	if (!ctx->connector) {
 		dev_err(dev, "HDCP connector is null!");
@@ -2125,7 +2125,7 @@ static void hdcp_check_work_func(struct work_struct *work)
 static int anx7625_connector_atomic_check(struct anx7625_data *ctx,
 					  struct drm_connector_state *state)
 {
-	struct device *dev = &ctx->client->dev;
+	struct device *dev = ctx->dev;
 	int cp;
 
 	dev_dbg(dev, "hdcp state check\n");
@@ -2170,7 +2170,7 @@ static int anx7625_bridge_attach(struct drm_bridge *bridge,
 {
 	struct anx7625_data *ctx = bridge_to_anx7625(bridge);
 	int err;
-	struct device *dev = &ctx->client->dev;
+	struct device *dev = ctx->dev;
 
 	DRM_DEV_DEBUG_DRIVER(dev, "drm attach\n");
 	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
@@ -2214,7 +2214,7 @@ anx7625_bridge_mode_valid(struct drm_bridge *bridge,
 			  const struct drm_display_mode *mode)
 {
 	struct anx7625_data *ctx = bridge_to_anx7625(bridge);
-	struct device *dev = &ctx->client->dev;
+	struct device *dev = ctx->dev;
 
 	DRM_DEV_DEBUG_DRIVER(dev, "drm mode checking\n");
 
@@ -2235,7 +2235,7 @@ static void anx7625_bridge_mode_set(struct drm_bridge *bridge,
 				    const struct drm_display_mode *mode)
 {
 	struct anx7625_data *ctx = bridge_to_anx7625(bridge);
-	struct device *dev = &ctx->client->dev;
+	struct device *dev = ctx->dev;
 
 	DRM_DEV_DEBUG_DRIVER(dev, "drm mode set\n");
 
@@ -2281,7 +2281,7 @@ static bool anx7625_bridge_mode_fixup(struct drm_bridge *bridge,
 				      struct drm_display_mode *adj)
 {
 	struct anx7625_data *ctx = bridge_to_anx7625(bridge);
-	struct device *dev = &ctx->client->dev;
+	struct device *dev = ctx->dev;
 	u32 hsync, hfp, hbp, hblanking;
 	u32 adj_hsync, adj_hfp, adj_hbp, adj_hblanking, delta_adj;
 	u32 vref, adj_clock;
@@ -2399,7 +2399,7 @@ static int anx7625_bridge_atomic_check(struct drm_bridge *bridge,
 				       struct drm_connector_state *conn_state)
 {
 	struct anx7625_data *ctx = bridge_to_anx7625(bridge);
-	struct device *dev = &ctx->client->dev;
+	struct device *dev = ctx->dev;
 
 	dev_dbg(dev, "drm bridge atomic check\n");
 
@@ -2413,7 +2413,7 @@ static void anx7625_bridge_atomic_enable(struct drm_bridge *bridge,
 					 struct drm_bridge_state *state)
 {
 	struct anx7625_data *ctx = bridge_to_anx7625(bridge);
-	struct device *dev = &ctx->client->dev;
+	struct device *dev = ctx->dev;
 	struct drm_connector *connector;
 
 	dev_dbg(dev, "drm atomic enable\n");
@@ -2440,7 +2440,7 @@ static void anx7625_bridge_atomic_disable(struct drm_bridge *bridge,
 					  struct drm_bridge_state *old)
 {
 	struct anx7625_data *ctx = bridge_to_anx7625(bridge);
-	struct device *dev = &ctx->client->dev;
+	struct device *dev = ctx->dev;
 
 	dev_dbg(dev, "drm atomic disable\n");
 
@@ -2454,7 +2454,7 @@ static enum drm_connector_status
 anx7625_bridge_detect(struct drm_bridge *bridge)
 {
 	struct anx7625_data *ctx = bridge_to_anx7625(bridge);
-	struct device *dev = &ctx->client->dev;
+	struct device *dev = ctx->dev;
 
 	DRM_DEV_DEBUG_DRIVER(dev, "drm bridge detect\n");
 
@@ -2465,7 +2465,7 @@ static struct edid *anx7625_bridge_get_edid(struct drm_bridge *bridge,
 					    struct drm_connector *connector)
 {
 	struct anx7625_data *ctx = bridge_to_anx7625(bridge);
-	struct device *dev = &ctx->client->dev;
+	struct device *dev = ctx->dev;
 
 	DRM_DEV_DEBUG_DRIVER(dev, "drm bridge get edid\n");
 
@@ -2490,7 +2490,7 @@ static const struct drm_bridge_funcs anx7625_bridge_funcs = {
 static int anx7625_register_i2c_dummy_clients(struct anx7625_data *ctx,
 					      struct i2c_client *client)
 {
-	struct device *dev = &ctx->client->dev;
+	struct device *dev = ctx->dev;
 
 	ctx->i2c.tx_p0_client = devm_i2c_new_dummy_device(dev, client->adapter,
 							  TX_P0_ADDR >> 1);
@@ -2591,7 +2591,7 @@ static int anx7625_i2c_probe(struct i2c_client *client)
 
 	pdata = &platform->pdata;
 
-	platform->client = client;
+	platform->dev = &client->dev;
 	i2c_set_clientdata(client, platform);
 
 	pdata->supplies[0].supply = "vdd10";
diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.h b/drivers/gpu/drm/bridge/analogix/anx7625.h
index 14f33d6be289..5af819611ebc 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.h
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.h
@@ -458,7 +458,7 @@ struct anx7625_data {
 	int hdcp_cp;
 	/* Lock for work queue */
 	struct mutex lock;
-	struct i2c_client *client;
+	struct device *dev;
 	struct anx7625_i2c_client i2c;
 	struct i2c_client *last_client;
 	struct timer_list hdcp_timer;
diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index bc451b2a77c2..d4bc388b68ac 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -404,7 +404,7 @@ struct debugfs_entries {
 struct it6505 {
 	struct drm_dp_aux aux;
 	struct drm_bridge bridge;
-	struct i2c_client *client;
+	struct device *dev;
 	struct it6505_drm_dp_link link;
 	struct it6505_platform_data pdata;
 	/*
@@ -508,7 +508,7 @@ static int it6505_read(struct it6505 *it6505, unsigned int reg_addr)
 {
 	unsigned int value;
 	int err;
-	struct device *dev = &it6505->client->dev;
+	struct device *dev = it6505->dev;
 
 	if (!it6505->powered)
 		return -ENODEV;
@@ -526,7 +526,7 @@ static int it6505_write(struct it6505 *it6505, unsigned int reg_addr,
 			unsigned int reg_val)
 {
 	int err;
-	struct device *dev = &it6505->client->dev;
+	struct device *dev = it6505->dev;
 
 	if (!it6505->powered)
 		return -ENODEV;
@@ -546,7 +546,7 @@ static int it6505_set_bits(struct it6505 *it6505, unsigned int reg,
 			   unsigned int mask, unsigned int value)
 {
 	int err;
-	struct device *dev = &it6505->client->dev;
+	struct device *dev = it6505->dev;
 
 	if (!it6505->powered)
 		return -ENODEV;
@@ -564,7 +564,7 @@ static int it6505_set_bits(struct it6505 *it6505, unsigned int reg,
 static void it6505_debug_print(struct it6505 *it6505, unsigned int reg,
 			       const char *prefix)
 {
-	struct device *dev = &it6505->client->dev;
+	struct device *dev = it6505->dev;
 	int val;
 
 	if (!drm_debug_enabled(DRM_UT_DRIVER))
@@ -583,7 +583,7 @@ static int it6505_dpcd_read(struct it6505 *it6505, unsigned long offset)
 {
 	u8 value;
 	int ret;
-	struct device *dev = &it6505->client->dev;
+	struct device *dev = it6505->dev;
 
 	ret = drm_dp_dpcd_readb(&it6505->aux, offset, &value);
 	if (ret < 0) {
@@ -597,7 +597,7 @@ static int it6505_dpcd_write(struct it6505 *it6505, unsigned long offset,
 			     u8 datain)
 {
 	int ret;
-	struct device *dev = &it6505->client->dev;
+	struct device *dev = it6505->dev;
 
 	ret = drm_dp_dpcd_writeb(&it6505->aux, offset, datain);
 	if (ret < 0) {
@@ -610,7 +610,7 @@ static int it6505_dpcd_write(struct it6505 *it6505, unsigned long offset,
 static int it6505_get_dpcd(struct it6505 *it6505, int offset, u8 *dpcd, int num)
 {
 	int ret;
-	struct device *dev = &it6505->client->dev;
+	struct device *dev = it6505->dev;
 
 	ret = drm_dp_dpcd_read(&it6505->aux, offset, dpcd, num);
 
@@ -627,7 +627,7 @@ static void it6505_dump(struct it6505 *it6505)
 {
 	unsigned int i, j;
 	u8 regs[16];
-	struct device *dev = &it6505->client->dev;
+	struct device *dev = it6505->dev;
 
 	for (i = 0; i <= 0xff; i += 16) {
 		for (j = 0; j < 16; j++)
@@ -666,7 +666,7 @@ static int it6505_read_word(struct it6505 *it6505, unsigned int reg)
 
 static void it6505_calc_video_info(struct it6505 *it6505)
 {
-	struct device *dev = &it6505->client->dev;
+	struct device *dev = it6505->dev;
 	int hsync_pol, vsync_pol, interlaced;
 	int htotal, hdes, hdew, hfph, hsyncw;
 	int vtotal, vdes, vdew, vfph, vsyncw;
@@ -910,7 +910,7 @@ static int it6505_aux_wait(struct it6505 *it6505)
 {
 	int status;
 	unsigned long timeout;
-	struct device *dev = &it6505->client->dev;
+	struct device *dev = it6505->dev;
 
 	timeout = jiffies + msecs_to_jiffies(AUX_WAIT_TIMEOUT_MS) + 1;
 
@@ -1125,7 +1125,7 @@ static int it6505_get_edid_block(void *data, u8 *buf, unsigned int block,
 				 size_t len)
 {
 	struct it6505 *it6505 = data;
-	struct device *dev = &it6505->client->dev;
+	struct device *dev = it6505->dev;
 	enum aux_cmd_reply reply;
 	int offset, ret, aux_retry = 100;
 
@@ -1185,7 +1185,7 @@ static int it6505_send_video_infoframe(struct it6505 *it6505,
 {
 	u8 buffer[HDMI_INFOFRAME_HEADER_SIZE + HDMI_AVI_INFOFRAME_SIZE];
 	int err;
-	struct device *dev = &it6505->client->dev;
+	struct device *dev = it6505->dev;
 
 	err = hdmi_avi_infoframe_pack(frame, buffer, sizeof(buffer));
 	if (err < 0) {
@@ -1215,7 +1215,7 @@ static void it6505_get_extcon_property(struct it6505 *it6505)
 {
 	int err;
 	union extcon_property_value property;
-	struct device *dev = &it6505->client->dev;
+	struct device *dev = it6505->dev;
 
 	if (it6505->extcon && !it6505->lane_swap_disabled) {
 		err = extcon_get_property(it6505->extcon, EXTCON_DISP_DP,
@@ -1368,7 +1368,7 @@ static void it6505_enable_audio_source(struct it6505 *it6505)
 
 static void it6505_enable_audio_infoframe(struct it6505 *it6505)
 {
-	struct device *dev = &it6505->client->dev;
+	struct device *dev = it6505->dev;
 	u8 audio_info_ca[] = { 0x00, 0x00, 0x01, 0x03, 0x07, 0x0B, 0x0F, 0x1F };
 
 	DRM_DEV_DEBUG_DRIVER(dev, "infoframe channel_allocation:0x%02x",
@@ -1397,7 +1397,7 @@ static void it6505_disable_audio(struct it6505 *it6505)
 
 static void it6505_enable_audio(struct it6505 *it6505)
 {
-	struct device *dev = &it6505->client->dev;
+	struct device *dev = it6505->dev;
 	int regbe;
 
 	DRM_DEV_DEBUG_DRIVER(dev, "start");
@@ -1432,7 +1432,7 @@ static bool it6505_use_step_train_check(struct it6505 *it6505)
 
 static void it6505_parse_link_capabilities(struct it6505 *it6505)
 {
-	struct device *dev = &it6505->client->dev;
+	struct device *dev = it6505->dev;
 	struct it6505_drm_dp_link *link = &it6505->link;
 	int bcaps;
 
@@ -1545,7 +1545,7 @@ static void it6505_lane_count_setup(struct it6505 *it6505)
 
 static void it6505_link_training_setup(struct it6505 *it6505)
 {
-	struct device *dev = &it6505->client->dev;
+	struct device *dev = it6505->dev;
 
 	if (it6505->enable_enhanced_frame)
 		it6505_set_bits(it6505, REG_DATA_MUTE_CTRL,
@@ -1696,7 +1696,7 @@ it6505_step_cr_train(struct it6505 *it6505,
 					FORCE_CR_DONE);
 			return true;
 		}
-		DRM_DEV_DEBUG_DRIVER(&it6505->client->dev, "cr not done");
+		DRM_DEV_DEBUG_DRIVER(it6505->dev, "cr not done");
 
 		if (it6505_check_max_voltage_swing_reached(lane_level_config,
 							   it6505->lane_count))
@@ -1773,7 +1773,7 @@ it6505_step_eq_train(struct it6505 *it6505,
 					FORCE_EQ_DONE);
 			return true;
 		}
-		DRM_DEV_DEBUG_DRIVER(&it6505->client->dev, "eq not done");
+		DRM_DEV_DEBUG_DRIVER(it6505->dev, "eq not done");
 
 		for (i = 0; i < it6505->lane_count; i++) {
 			lane_voltage_pre_emphasis->voltage_swing[i] =
@@ -1808,7 +1808,7 @@ static bool it6505_link_start_step_train(struct it6505 *it6505)
 		.pre_emphasis = { 0 },
 	};
 
-	DRM_DEV_DEBUG_DRIVER(&it6505->client->dev, "start");
+	DRM_DEV_DEBUG_DRIVER(it6505->dev, "start");
 	err = it6505_drm_dp_link_configure(it6505);
 
 	if (err < 0)
@@ -1842,7 +1842,7 @@ static void it6505_reset_hdcp(struct it6505 *it6505)
 
 static void it6505_start_hdcp(struct it6505 *it6505)
 {
-	struct device *dev = &it6505->client->dev;
+	struct device *dev = it6505->dev;
 
 	DRM_DEV_DEBUG_DRIVER(dev, "start");
 	it6505_reset_hdcp(it6505);
@@ -1870,7 +1870,7 @@ static bool it6505_hdcp_is_ksv_valid(u8 *ksv)
 
 static void it6505_hdcp_part1_auth(struct it6505 *it6505)
 {
-	struct device *dev = &it6505->client->dev;
+	struct device *dev = it6505->dev;
 	u8 hdcp_bcaps;
 
 	it6505_set_bits(it6505, REG_RESET_CTRL, HDCP_RESET, 0x00);
@@ -1911,7 +1911,7 @@ static int it6505_sha1_digest(struct it6505 *it6505, u8 *sha1_input,
 	struct shash_desc *desc;
 	struct crypto_shash *tfm;
 	int err;
-	struct device *dev = &it6505->client->dev;
+	struct device *dev = it6505->dev;
 
 	tfm = crypto_alloc_shash("sha1", 0, 0);
 	if (IS_ERR(tfm)) {
@@ -1936,7 +1936,7 @@ static int it6505_sha1_digest(struct it6505 *it6505, u8 *sha1_input,
 
 static int it6505_setup_sha1_input(struct it6505 *it6505, u8 *sha1_input)
 {
-	struct device *dev = &it6505->client->dev;
+	struct device *dev = it6505->dev;
 	u8 binfo[2];
 	int down_stream_count, i, err, msg_count = 0;
 
@@ -2000,7 +2000,7 @@ static int it6505_setup_sha1_input(struct it6505 *it6505, u8 *sha1_input)
 
 static bool it6505_hdcp_part2_ksvlist_check(struct it6505 *it6505)
 {
-	struct device *dev = &it6505->client->dev;
+	struct device *dev = it6505->dev;
 	u8 av[5][4], bv[5][4];
 	int i, err;
 
@@ -2033,7 +2033,7 @@ static void it6505_hdcp_wait_ksv_list(struct work_struct *work)
 {
 	struct it6505 *it6505 = container_of(work, struct it6505,
 					     hdcp_wait_ksv_list);
-	struct device *dev = &it6505->client->dev;
+	struct device *dev = it6505->dev;
 	unsigned int timeout = 5000;
 	u8 bstatus = 0;
 	bool ksv_list_check;
@@ -2075,7 +2075,7 @@ static void it6505_hdcp_work(struct work_struct *work)
 {
 	struct it6505 *it6505 = container_of(work, struct it6505,
 					     hdcp_work.work);
-	struct device *dev = &it6505->client->dev;
+	struct device *dev = it6505->dev;
 	int ret;
 	u8 link_status[DP_LINK_STATUS_SIZE] = { 0 };
 
@@ -2116,7 +2116,7 @@ static void it6505_hdcp_work(struct work_struct *work)
 
 static void it6505_show_hdcp_info(struct it6505 *it6505)
 {
-	struct device *dev = &it6505->client->dev;
+	struct device *dev = it6505->dev;
 	int i;
 	u8 *sha1 = it6505->sha1_input;
 
@@ -2150,7 +2150,7 @@ static void it6505_stop_link_train(struct it6505 *it6505)
 
 static void it6505_link_train_ok(struct it6505 *it6505)
 {
-	struct device *dev = &it6505->client->dev;
+	struct device *dev = it6505->dev;
 
 	it6505->link_state = LINK_OK;
 	/* disalbe mute enable avi info frame */
@@ -2169,7 +2169,7 @@ static void it6505_link_train_ok(struct it6505 *it6505)
 
 static void it6505_link_step_train_process(struct it6505 *it6505)
 {
-	struct device *dev = &it6505->client->dev;
+	struct device *dev = it6505->dev;
 	int ret, i, step_retry = 3;
 
 	DRM_DEV_DEBUG_DRIVER(dev, "Start step train");
@@ -2207,7 +2207,7 @@ static void it6505_link_step_train_process(struct it6505 *it6505)
 static void it6505_link_training_work(struct work_struct *work)
 {
 	struct it6505 *it6505 = container_of(work, struct it6505, link_works);
-	struct device *dev = &it6505->client->dev;
+	struct device *dev = it6505->dev;
 	int ret;
 
 	DRM_DEV_DEBUG_DRIVER(dev, "it6505->sink_count: %d",
@@ -2255,7 +2255,7 @@ static void it6505_remove_edid(struct it6505 *it6505)
 
 static int it6505_process_hpd_irq(struct it6505 *it6505)
 {
-	struct device *dev = &it6505->client->dev;
+	struct device *dev = it6505->dev;
 	int ret, dpcd_sink_count, dp_irq_vector, bstatus;
 	u8 link_status[DP_LINK_STATUS_SIZE];
 
@@ -2319,7 +2319,7 @@ static int it6505_process_hpd_irq(struct it6505 *it6505)
 
 static void it6505_irq_hpd(struct it6505 *it6505)
 {
-	struct device *dev = &it6505->client->dev;
+	struct device *dev = it6505->dev;
 	int dp_sink_count;
 
 	it6505->hpd_state = it6505_get_sink_hpd_status(it6505);
@@ -2381,7 +2381,7 @@ static void it6505_irq_hpd(struct it6505 *it6505)
 
 static void it6505_irq_hpd_irq(struct it6505 *it6505)
 {
-	struct device *dev = &it6505->client->dev;
+	struct device *dev = it6505->dev;
 
 	DRM_DEV_DEBUG_DRIVER(dev, "hpd_irq interrupt");
 
@@ -2391,7 +2391,7 @@ static void it6505_irq_hpd_irq(struct it6505 *it6505)
 
 static void it6505_irq_scdt(struct it6505 *it6505)
 {
-	struct device *dev = &it6505->client->dev;
+	struct device *dev = it6505->dev;
 	bool data;
 
 	data = it6505_get_video_status(it6505);
@@ -2406,7 +2406,7 @@ static void it6505_irq_scdt(struct it6505 *it6505)
 
 static void it6505_irq_hdcp_done(struct it6505 *it6505)
 {
-	struct device *dev = &it6505->client->dev;
+	struct device *dev = it6505->dev;
 
 	DRM_DEV_DEBUG_DRIVER(dev, "hdcp done interrupt");
 	it6505->hdcp_status = HDCP_AUTH_DONE;
@@ -2415,7 +2415,7 @@ static void it6505_irq_hdcp_done(struct it6505 *it6505)
 
 static void it6505_irq_hdcp_fail(struct it6505 *it6505)
 {
-	struct device *dev = &it6505->client->dev;
+	struct device *dev = it6505->dev;
 
 	DRM_DEV_DEBUG_DRIVER(dev, "hdcp fail interrupt");
 	it6505->hdcp_status = HDCP_AUTH_IDLE;
@@ -2425,14 +2425,14 @@ static void it6505_irq_hdcp_fail(struct it6505 *it6505)
 
 static void it6505_irq_aux_cmd_fail(struct it6505 *it6505)
 {
-	struct device *dev = &it6505->client->dev;
+	struct device *dev = it6505->dev;
 
 	DRM_DEV_DEBUG_DRIVER(dev, "AUX PC Request Fail Interrupt");
 }
 
 static void it6505_irq_hdcp_ksv_check(struct it6505 *it6505)
 {
-	struct device *dev = &it6505->client->dev;
+	struct device *dev = it6505->dev;
 
 	DRM_DEV_DEBUG_DRIVER(dev, "HDCP event Interrupt");
 	schedule_work(&it6505->hdcp_wait_ksv_list);
@@ -2440,7 +2440,7 @@ static void it6505_irq_hdcp_ksv_check(struct it6505 *it6505)
 
 static void it6505_irq_audio_fifo_error(struct it6505 *it6505)
 {
-	struct device *dev = &it6505->client->dev;
+	struct device *dev = it6505->dev;
 
 	DRM_DEV_DEBUG_DRIVER(dev, "audio fifo error Interrupt");
 
@@ -2450,7 +2450,7 @@ static void it6505_irq_audio_fifo_error(struct it6505 *it6505)
 
 static void it6505_irq_link_train_fail(struct it6505 *it6505)
 {
-	struct device *dev = &it6505->client->dev;
+	struct device *dev = it6505->dev;
 
 	DRM_DEV_DEBUG_DRIVER(dev, "link training fail interrupt");
 	schedule_work(&it6505->link_works);
@@ -2458,7 +2458,7 @@ static void it6505_irq_link_train_fail(struct it6505 *it6505)
 
 static void it6505_irq_video_fifo_error(struct it6505 *it6505)
 {
-	struct device *dev = &it6505->client->dev;
+	struct device *dev = it6505->dev;
 
 	DRM_DEV_DEBUG_DRIVER(dev, "video fifo overflow interrupt");
 	it6505->auto_train_retry = AUTO_TRAIN_RETRY;
@@ -2469,7 +2469,7 @@ static void it6505_irq_video_fifo_error(struct it6505 *it6505)
 
 static void it6505_irq_io_latch_fifo_overflow(struct it6505 *it6505)
 {
-	struct device *dev = &it6505->client->dev;
+	struct device *dev = it6505->dev;
 
 	DRM_DEV_DEBUG_DRIVER(dev, "IO latch fifo overflow interrupt");
 	it6505->auto_train_retry = AUTO_TRAIN_RETRY;
@@ -2486,7 +2486,7 @@ static bool it6505_test_bit(unsigned int bit, const unsigned int *addr)
 static irqreturn_t it6505_int_threaded_handler(int unused, void *data)
 {
 	struct it6505 *it6505 = data;
-	struct device *dev = &it6505->client->dev;
+	struct device *dev = it6505->dev;
 	static const struct {
 		int bit;
 		void (*handler)(struct it6505 *it6505);
@@ -2538,7 +2538,7 @@ static irqreturn_t it6505_int_threaded_handler(int unused, void *data)
 
 static int it6505_poweron(struct it6505 *it6505)
 {
-	struct device *dev = &it6505->client->dev;
+	struct device *dev = it6505->dev;
 	struct it6505_platform_data *pdata = &it6505->pdata;
 	int err;
 
@@ -2587,7 +2587,7 @@ static int it6505_poweron(struct it6505 *it6505)
 
 static int it6505_poweroff(struct it6505 *it6505)
 {
-	struct device *dev = &it6505->client->dev;
+	struct device *dev = it6505->dev;
 	struct it6505_platform_data *pdata = &it6505->pdata;
 	int err;
 
@@ -2621,7 +2621,7 @@ static int it6505_poweroff(struct it6505 *it6505)
 
 static enum drm_connector_status it6505_detect(struct it6505 *it6505)
 {
-	struct device *dev = &it6505->client->dev;
+	struct device *dev = it6505->dev;
 	enum drm_connector_status status = connector_status_disconnected;
 	int dp_sink_count;
 
@@ -2682,7 +2682,7 @@ static int it6505_extcon_notifier(struct notifier_block *self,
 static void it6505_extcon_work(struct work_struct *work)
 {
 	struct it6505 *it6505 = container_of(work, struct it6505, extcon_wq);
-	struct device *dev = &it6505->client->dev;
+	struct device *dev = it6505->dev;
 	int state, ret;
 
 	if (it6505->enable_drv_hold)
@@ -2727,11 +2727,11 @@ static void it6505_extcon_work(struct work_struct *work)
 static int it6505_use_notifier_module(struct it6505 *it6505)
 {
 	int ret;
-	struct device *dev = &it6505->client->dev;
+	struct device *dev = it6505->dev;
 
 	it6505->event_nb.notifier_call = it6505_extcon_notifier;
 	INIT_WORK(&it6505->extcon_wq, it6505_extcon_work);
-	ret = devm_extcon_register_notifier(&it6505->client->dev,
+	ret = devm_extcon_register_notifier(it6505->dev,
 					    it6505->extcon, EXTCON_DISP_DP,
 					    &it6505->event_nb);
 	if (ret) {
@@ -2747,7 +2747,7 @@ static int it6505_use_notifier_module(struct it6505 *it6505)
 static void it6505_remove_notifier_module(struct it6505 *it6505)
 {
 	if (it6505->extcon) {
-		devm_extcon_unregister_notifier(&it6505->client->dev,
+		devm_extcon_unregister_notifier(it6505->dev,
 						it6505->extcon,	EXTCON_DISP_DP,
 						&it6505->event_nb);
 
@@ -2760,7 +2760,7 @@ static void __maybe_unused it6505_delayed_audio(struct work_struct *work)
 	struct it6505 *it6505 = container_of(work, struct it6505,
 					     delayed_audio.work);
 
-	DRM_DEV_DEBUG_DRIVER(&it6505->client->dev, "start");
+	DRM_DEV_DEBUG_DRIVER(it6505->dev, "start");
 
 	if (!it6505->powered)
 		return;
@@ -2773,7 +2773,7 @@ static int __maybe_unused it6505_audio_setup_hw_params(struct it6505 *it6505,
 						       struct hdmi_codec_params
 						       *params)
 {
-	struct device *dev = &it6505->client->dev;
+	struct device *dev = it6505->dev;
 	int i = 0;
 
 	DRM_DEV_DEBUG_DRIVER(dev, "%s %d Hz, %d bit, %d channels\n", __func__,
@@ -2857,7 +2857,7 @@ static int it6505_bridge_attach(struct drm_bridge *bridge,
 				enum drm_bridge_attach_flags flags)
 {
 	struct it6505 *it6505 = bridge_to_it6505(bridge);
-	struct device *dev = &it6505->client->dev;
+	struct device *dev = it6505->dev;
 	int ret;
 
 	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
@@ -2921,7 +2921,7 @@ static void it6505_bridge_atomic_enable(struct drm_bridge *bridge,
 					struct drm_bridge_state *old_state)
 {
 	struct it6505 *it6505 = bridge_to_it6505(bridge);
-	struct device *dev = &it6505->client->dev;
+	struct device *dev = it6505->dev;
 	struct drm_atomic_state *state = old_state->base.state;
 	struct hdmi_avi_infoframe frame;
 	struct drm_crtc_state *crtc_state;
@@ -2977,7 +2977,7 @@ static void it6505_bridge_atomic_disable(struct drm_bridge *bridge,
 					 struct drm_bridge_state *old_state)
 {
 	struct it6505 *it6505 = bridge_to_it6505(bridge);
-	struct device *dev = &it6505->client->dev;
+	struct device *dev = it6505->dev;
 
 	DRM_DEV_DEBUG_DRIVER(dev, "start");
 
@@ -2992,7 +2992,7 @@ static void it6505_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 					    struct drm_bridge_state *old_state)
 {
 	struct it6505 *it6505 = bridge_to_it6505(bridge);
-	struct device *dev = &it6505->client->dev;
+	struct device *dev = it6505->dev;
 
 	DRM_DEV_DEBUG_DRIVER(dev, "start");
 
@@ -3003,7 +3003,7 @@ static void it6505_bridge_atomic_post_disable(struct drm_bridge *bridge,
 					      struct drm_bridge_state *old_state)
 {
 	struct it6505 *it6505 = bridge_to_it6505(bridge);
-	struct device *dev = &it6505->client->dev;
+	struct device *dev = it6505->dev;
 
 	DRM_DEV_DEBUG_DRIVER(dev, "start");
 
@@ -3022,7 +3022,7 @@ static struct edid *it6505_bridge_get_edid(struct drm_bridge *bridge,
 					   struct drm_connector *connector)
 {
 	struct it6505 *it6505 = bridge_to_it6505(bridge);
-	struct device *dev = &it6505->client->dev;
+	struct device *dev = it6505->dev;
 
 	if (!it6505->cached_edid) {
 		it6505->cached_edid = drm_do_get_edid(connector, it6505_get_edid_block,
@@ -3074,7 +3074,7 @@ static const struct dev_pm_ops it6505_bridge_pm_ops = {
 static int it6505_init_pdata(struct it6505 *it6505)
 {
 	struct it6505_platform_data *pdata = &it6505->pdata;
-	struct device *dev = &it6505->client->dev;
+	struct device *dev = it6505->dev;
 
 	/* 1.0V digital core power regulator  */
 	pdata->pwr18 = devm_regulator_get(dev, "pwr18");
@@ -3116,7 +3116,7 @@ static int it6505_get_data_lanes_count(const struct device_node *endpoint,
 
 static void it6505_parse_dt(struct it6505 *it6505)
 {
-	struct device *dev = &it6505->client->dev;
+	struct device *dev = it6505->dev;
 	struct device_node *np = dev->of_node, *ep = NULL;
 	int len;
 	u64 link_frequencies;
@@ -3320,7 +3320,7 @@ static void debugfs_create_files(struct it6505 *it6505)
 
 static void debugfs_init(struct it6505 *it6505)
 {
-	struct device *dev = &it6505->client->dev;
+	struct device *dev = it6505->dev;
 
 	it6505->debugfs = debugfs_create_dir(DEBUGFS_DIR_NAME, NULL);
 
@@ -3362,7 +3362,7 @@ static int it6505_i2c_probe(struct i2c_client *client)
 
 	it6505->bridge.of_node = client->dev.of_node;
 	it6505->connector_status = connector_status_disconnected;
-	it6505->client = client;
+	it6505->dev = &client->dev;
 	i2c_set_clientdata(client, it6505);
 
 	/* get extcon device from DTS */
-- 
2.40.0.rc1.284.g88254d51c5-goog

