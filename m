Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A12B7DAE00
	for <lists+dri-devel@lfdr.de>; Sun, 29 Oct 2023 20:46:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B96A610E19F;
	Sun, 29 Oct 2023 19:46:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6B82A10E19F
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Oct 2023 19:46:15 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8Cxc_CEtj5lv5s1AA--.39348S3;
 Mon, 30 Oct 2023 03:46:12 +0800 (CST)
Received: from openarena.loongson.cn (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8AxXNx+tj5lKq02AA--.51878S7; 
 Mon, 30 Oct 2023 03:46:12 +0800 (CST)
From: Sui Jingfeng <suijingfeng@loongson.cn>
To: Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 5/8] drm/loongson: Using vbios for the LS7A2000 output
 initialization
Date: Mon, 30 Oct 2023 03:46:04 +0800
Message-Id: <20231029194607.379459-6-suijingfeng@loongson.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231029194607.379459-1-suijingfeng@loongson.cn>
References: <20231029194607.379459-1-suijingfeng@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8AxXNx+tj5lKq02AA--.51878S7
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW3Gr4UAw4kGw45JF4DZw1rKrX_yoWxtw4Dpr
 sxtrZ3Jr1kZF1Fyr1kAr1kX34YyrWvkFySy3s29w1Sy34fJr90qF47tr1UW3WUJa9Y9r12
 vrsrXw4ak3WUC3gCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUk0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
 Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
 8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv67AK
 xVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64
 vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
 jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2I
 x0cI8IcVAFwI0_Xr0_Ar1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK
 8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I
 0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUcCD7UUUUU
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For LS7A2000, the built-in VGA encoder is transparent. Connect another
external transmitter with this internal VGA encoder is not sane, thus is
not allowed. Because there are two internal encoders hardware resource on
the first display pipe, call loongson_vbios_query_encoder_info() to know
what exatly the output configutaion is. Either VGA or HDMI display output
interface, but not both. And formal products should not export three
display connector interfaces. As the hardware has two-way I2Cs and two
CRTCs. So with this observation, we can untangle more.

If there a need to extend(transform) the output interface type, then the
internal HDMI phy MUST be enabled and initialized. External transmitters
must take the HDMI signal as input, this is the only choices. Such as
lt6711(HDMI to eDP), lt8619(HDMI to LVDS) etc.

Before apply this patch, ls7a2000_output_init() is simplified function
which assumed that there is no external display bridge attached. This
naive abstraction no longer suit the needs in the long run. Hence, switch
to call the newly implemented lsdc_output_init() function, which allow us
model the external encoder as a drm display bridge. The driver of this drm
display bridge should reside in the same kernel module with drm/loongson.
We will attach it by ourself, and rely on the VBIOS tell us which display
pipe has what display bridge connected.

Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/gpu/drm/loongson/lsdc_output_7a2000.c | 154 ++++++++++++++----
 1 file changed, 124 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/loongson/lsdc_output_7a2000.c b/drivers/gpu/drm/loongson/lsdc_output_7a2000.c
index ce3dabec887e..bf558b61802b 100644
--- a/drivers/gpu/drm/loongson/lsdc_output_7a2000.c
+++ b/drivers/gpu/drm/loongson/lsdc_output_7a2000.c
@@ -501,6 +501,126 @@ static const struct drm_encoder_helper_funcs ls7a2000_encoder_helper_funcs = {
 	.atomic_mode_set = ls7a2000_hdmi_atomic_mode_set,
 };
 
+/* The built-in tranparent VGA encoder is only available on display pipe 0 */
+static void ls7a2000_pipe0_vga_encoder_reset(struct drm_encoder *encoder)
+{
+	struct lsdc_device *ldev = to_lsdc(encoder->dev);
+	u32 val = PHY_CLOCK_POL | PHY_CLOCK_EN | PHY_DATA_EN;
+
+	lsdc_wreg32(ldev, LSDC_CRTC0_DVO_CONF_REG, val);
+
+	/*
+	 * The firmware set LSDC_HDMIx_CTRL_REG blindly to use hardware I2C,
+	 * which is may not works because of hardware bug. We using built-in
+	 * GPIO emulated I2C instead of the hardware I2C here.
+	 */
+	lsdc_ureg32_clr(ldev, LSDC_HDMI0_INTF_CTRL_REG, HW_I2C_EN);
+
+	mdelay(20);
+}
+
+static const struct drm_encoder_funcs ls7a2000_pipe0_vga_encoder_funcs = {
+	.reset = ls7a2000_pipe0_vga_encoder_reset,
+	.destroy = drm_encoder_cleanup,
+};
+
+static const struct lsdc_output_desc ls7a2000_vga_pipe0 = {
+	.pipe = 0,
+	.encoder_type = DRM_MODE_ENCODER_DAC,
+	.connector_type = DRM_MODE_CONNECTOR_VGA,
+	.encoder_funcs = &ls7a2000_pipe0_vga_encoder_funcs,
+	.encoder_helper_funcs = &lsdc_pipe0_hdmi_encoder_helper_funcs,
+	.connector_funcs = &lsdc_connector_funcs,
+	.connector_helper_funcs = &lsdc_connector_helper_funcs,
+	.name = "VGA-0",
+};
+
+static const struct lsdc_output_desc ls7a2000_hdmi_pipe0 = {
+	.pipe = 0,
+	.encoder_type = DRM_MODE_ENCODER_TMDS,
+	.connector_type = DRM_MODE_CONNECTOR_HDMIA,
+	.encoder_funcs = &lsdc_pipe0_hdmi_encoder_funcs,
+	.encoder_helper_funcs = &lsdc_pipe0_hdmi_encoder_helper_funcs,
+	.connector_funcs = &lsdc_pipe0_hdmi_connector_funcs,
+	.connector_helper_funcs = &lsdc_connector_helper_funcs,
+	.name = "HDMI-0",
+};
+
+static const struct lsdc_output_desc ls7a2000_hdmi_pipe1 = {
+	.pipe = 1,
+	.encoder_type = DRM_MODE_ENCODER_TMDS,
+	.connector_type = DRM_MODE_CONNECTOR_HDMIA,
+	.encoder_funcs = &lsdc_pipe1_hdmi_encoder_funcs,
+	.encoder_helper_funcs = &lsdc_pipe1_hdmi_encoder_helper_funcs,
+	.connector_funcs = &lsdc_pipe1_hdmi_connector_funcs,
+	.connector_helper_funcs = &lsdc_connector_helper_funcs,
+	.name = "HDMI-1",
+};
+
+/*
+ * For LS7A2000, the built-in VGA encoder is transparent. If there are
+ * external encoder exist, then the internal HDMI encoder MUST be enabled
+ * and initialized. As the internal HDMI encoder is always connected, so
+ * only the transmitters which take HDMI signal (such as HDMI to eDP, HDMI
+ * to LVDS, etc) are usable with.
+ */
+const struct lsdc_output_desc *
+ls7a2000_query_output_configuration(struct drm_device *ddev, unsigned int pipe)
+{
+	enum loongson_vbios_encoder_name encoder_name = 0;
+	bool ret;
+
+	ret = loongson_vbios_query_encoder_info(ddev, pipe, NULL,
+						&encoder_name, NULL);
+	if (!ret)
+		goto bailout;
+
+	if (pipe == 0) {
+		switch (encoder_name) {
+		case ENCODER_CHIP_INTERNAL_HDMI:
+			return &ls7a2000_hdmi_pipe0;
+
+		/*
+		 * For LS7A2000, the built-in VGA encoder is transparent.
+		 */
+		case ENCODER_CHIP_INTERNAL_VGA:
+			return &ls7a2000_vga_pipe0;
+
+		/*
+		 * External display bridge exists, the internal HDMI encoder
+		 * MUST be enabled and initialized. Please add a drm bridge
+		 * driver, and attach to this encoder.
+		 */
+		default:
+			return &ls7a2000_hdmi_pipe0;
+		}
+	}
+
+	if (pipe == 1) {
+		switch (encoder_name) {
+		case ENCODER_CHIP_INTERNAL_HDMI:
+			return &ls7a2000_hdmi_pipe1;
+
+		/*
+		 * External display bridge exists, the internal HDMI encoder
+		 * MUST be enabled and initialized. Please add a drm bridge
+		 * driver, and attach it to this encoder.
+		 */
+		default:
+			return &ls7a2000_hdmi_pipe1;
+		}
+	}
+
+bailout:
+	if (pipe == 0)
+		return &ls7a2000_vga_pipe0;
+
+	if (pipe == 1)
+		return &ls7a2000_hdmi_pipe1;
+
+	return NULL;
+}
+
 /*
  * For LS7A2000:
  *
@@ -517,36 +637,10 @@ int ls7a2000_output_init(struct drm_device *ddev,
 			 unsigned int pipe)
 {
 	struct lsdc_output *output = &dispipe->output;
-	struct drm_encoder *encoder = &output->encoder;
-	struct drm_connector *connector = &output->connector;
-	int ret;
-
-	ret = drm_encoder_init(ddev, encoder, &ls7a2000_encoder_funcs[pipe],
-			       DRM_MODE_ENCODER_TMDS, "encoder-%u", pipe);
-	if (ret)
-		return ret;
-
-	encoder->possible_crtcs = BIT(pipe);
-
-	drm_encoder_helper_add(encoder, &ls7a2000_encoder_helper_funcs);
-
-	ret = drm_connector_init_with_ddc(ddev, connector,
-					  &ls7a2000_hdmi_connector_funcs[pipe],
-					  DRM_MODE_CONNECTOR_HDMIA, ddc);
-	if (ret)
-		return ret;
 
-	drm_info(ddev, "display pipe-%u has HDMI %s\n", pipe, pipe ? "" : "and/or VGA");
+	output->descp = ls7a2000_query_output_configuration(ddev, pipe);
+	if (!output->descp)
+		return -EINVAL;
 
-	drm_connector_helper_add(connector, &ls7a2000_connector_helpers);
-
-	drm_connector_attach_encoder(connector, encoder);
-
-	connector->polled = DRM_CONNECTOR_POLL_CONNECT |
-			    DRM_CONNECTOR_POLL_DISCONNECT;
-
-	connector->interlace_allowed = 0;
-	connector->doublescan_allowed = 0;
-
-	return 0;
+	return lsdc_output_init(ddev, dispipe, ddc, pipe);
 }
-- 
2.34.1

