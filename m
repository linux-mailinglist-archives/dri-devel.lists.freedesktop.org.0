Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E78F643FDB7
	for <lists+dri-devel@lfdr.de>; Fri, 29 Oct 2021 16:00:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24B966EA59;
	Fri, 29 Oct 2021 14:00:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 897486EA59
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Oct 2021 13:59:59 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 d72-20020a1c1d4b000000b00331140f3dc8so1788017wmd.1
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Oct 2021 06:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eQW1ZfP0uppKizFrHsbwkJvmM9Bvk3D3IrZDSyCjYKs=;
 b=vuUsnrVsYvbNoZH/e4/gAwEjhSd/BGgQxCI9Zg7Yy2qQELYULiCC4aSjjIkhGAAEXD
 5k0voinJea1cqnTsWADLgeGyoB/P4+P+F1TRe84669Xvo+eTwKLsXbti3TGPLmcL8nLe
 7hou1wcASwRQPpExlDd8m55PqbNoKuOOwu2gH2FX9ZtXwyzPo9Zhh/bH+l26sqqo7UO7
 ALVXBM/IXh7ItKT6OHLmW9c1IsXMfaIExnQv2VjZRFet5T/RMMg/axfH+2jXL9y8rN1a
 s8p/qfMVLud32Jd+3PzaUFwTxohUsQvIeVdKrxWkXNvIMF/JY/ytQfpvwCqpvREZo+ex
 6MDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eQW1ZfP0uppKizFrHsbwkJvmM9Bvk3D3IrZDSyCjYKs=;
 b=ObMRZBZU3OxHbtQlGHyNdPFlJUFsMUCjFzQF/W0rul5uBZq/rk+Zkp1q+StVQq/qCL
 x3b8COMPl9BF/Rl+fm6x3kvZdsdEru/2nryB7Kme8BZxn83xEG3AJlwDl+0qJ0KDHg7Y
 HoPEEeFVQFT1zMhXtQx6JW0sNbGHN36D0iajEvlJd0VR0rUj8gIR7hxj91F8H6YQmznA
 wz6w40iWAtHxSftgab/nsHpzM194M5ncJhcozkoJh6dUAukUi52xmXNS2uBF+FCJGJu2
 VTuyJ+I9Tuz+Nfpab4M+/ltmtICFQT1rRAlBuFCYwvYtx0aD/glfNoe8d+6U2ZeEppns
 tK2g==
X-Gm-Message-State: AOAM532EljlQgh0rEDv7X2ZQksnfKjLWQrBkzfNtVEWoacuPRyGRJLVp
 ECCVrXVXLyvadyK8DRGKJ6rJCIfwSzHIVeu6
X-Google-Smtp-Source: ABdhPJwpVEgPPkI/zSK4lpMUwVYrjijvbgxeje/k/4cZ9kdoo9+t4DjrMi4svi9/yVEvIFaacjsgJw==
X-Received: by 2002:a05:600c:4e94:: with SMTP id
 f20mr20301004wmq.52.1635515997808; 
 Fri, 29 Oct 2021 06:59:57 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:a651:7f77:f257:17dc])
 by smtp.gmail.com with ESMTPSA id q18sm8999602wmc.7.2021.10.29.06.59.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 06:59:55 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com,
 robert.foss@linaro.org, jonas@kwiboo.se, jernej.skrabec@gmail.com
Cc: daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH] drm/bridge: dw-hdmi: handle ELD when
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
Date: Fri, 29 Oct 2021 15:59:47 +0200
Message-Id: <20211029135947.3022875-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4764; h=from:subject;
 bh=0QP3cFB9fKKagdZLsyMILZiovdgP4DkvKvAW6aRsEQs=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBhe/4YQaYx/zx/h5049LOKtQeaUtncl2DkuxdhemDl
 XzAHsUGJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYXv+GAAKCRB33NvayMhJ0QY1D/
 97wVWDvDmZpA3YIMODB3DjW7CpZjjK3TdXyCy8nPywIJbyYNML6ouF8IViPR7e+6QVayRuTVnlv2wu
 ufgr7PWFx4o1dAqzJ9RnLE1GuO+3ECXCp9fIb5GbJ0c3RgYSQpl3O3NpdqpOz55/DDmo6Z8IK2WTNL
 id3617cMdlbRbhhgqT3KIozXczV3ghRp6flfxy5UfGvWbbfTnHSI44uUQNCcwObLaishMVeaNWKIfo
 W/eL6Gduv2UhnjIBtB9fH11bDpaVfcL6k/I9UH2LOELDX+tgHKymA36LEuetjXAavXSmBNZa5p1X1n
 JEiv7y0lfaKQX6r+X0GnUzkDSjIRBtXA9nVgpwxkFSoiQyIzoHophFHgTuGbBPsqRArTipbQ1cGZVj
 AjxAU53OhwroSgmMLffgpJOh8UsEJwQmFLmm8gb4vKxD6LR4d3QgyK5mn3BK07peMPgfBG+YEmSoYW
 h4wvIiXhe6bJRHUdmsQUKIkA5uh0iiqfM6LVjACPg1Lkwgg3WvTYv7bGZ2E3jenb5h0lpiQBn541VW
 mUyDb8Hu07nKdFW3KD6gLHlzFIPAIRJfNKxzeCyNXkUoOpmSzpXPNLevI2nUd1CjJvb/LpjAFrH4yq
 juYS6E2QcqvLqjm1fxPA7fyvomnVNDauI0Z/vs04n4R/YZu1+y2Nmkd0b8yQ==
X-Developer-Key: i=narmstrong@baylibre.com; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The current ELD handling takes the internal connector ELD buffer and
shares it to the I2S and AHB sub-driver.

But with DRM_BRIDGE_ATTACH_NO_CONNECTOR, the connector is created
elsewhere (not not), and an eventual connector is known only
if the bridge chain up to a connector is enabled.

The current dw-hdmi code gets the current connector from
atomic_enable() so use the already stored connector pointer and
replace the buffer pointer with a callback returning the current
connector ELD buffer.

Since a connector is not always available, either pass an empty
ELD to the alsa HDMI driver or don't call snd_pcm_hw_constraint_eld()
in AHB driver.

Reported-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c | 10 +++++++---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-audio.h     |  4 ++--
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c |  9 ++++++++-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c           | 12 ++++++++++--
 4 files changed, 27 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
index d0db1acf11d7..7d2ed0ed2fe2 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
@@ -320,13 +320,17 @@ static int dw_hdmi_open(struct snd_pcm_substream *substream)
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_dw_hdmi *dw = substream->private_data;
 	void __iomem *base = dw->data.base;
+	u8 *eld;
 	int ret;
 
 	runtime->hw = dw_hdmi_hw;
 
-	ret = snd_pcm_hw_constraint_eld(runtime, dw->data.eld);
-	if (ret < 0)
-		return ret;
+	eld = dw->data.get_eld(dw->data.hdmi);
+	if (eld) {
+		ret = snd_pcm_hw_constraint_eld(runtime, eld);
+		if (ret < 0)
+			return ret;
+	}
 
 	ret = snd_pcm_limit_hw_rates(runtime);
 	if (ret < 0)
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-audio.h b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-audio.h
index cb07dc0da5a7..f72d27208ebe 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-audio.h
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-audio.h
@@ -9,15 +9,15 @@ struct dw_hdmi_audio_data {
 	void __iomem *base;
 	int irq;
 	struct dw_hdmi *hdmi;
-	u8 *eld;
+	u8 *(*get_eld)(struct dw_hdmi *hdmi);
 };
 
 struct dw_hdmi_i2s_audio_data {
 	struct dw_hdmi *hdmi;
-	u8 *eld;
 
 	void (*write)(struct dw_hdmi *hdmi, u8 val, int offset);
 	u8 (*read)(struct dw_hdmi *hdmi, int offset);
+	u8 *(*get_eld)(struct dw_hdmi *hdmi);
 };
 
 #endif
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
index feb04f127b55..f50b47ac11a8 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
@@ -135,8 +135,15 @@ static int dw_hdmi_i2s_get_eld(struct device *dev, void *data, uint8_t *buf,
 			       size_t len)
 {
 	struct dw_hdmi_i2s_audio_data *audio = data;
+	u8 *eld;
+
+	eld = audio->get_eld(audio->hdmi);
+	if (eld)
+		memcpy(buf, eld, min_t(size_t, MAX_ELD_BYTES, len));
+	else
+		/* Pass en empty ELD if connector not available */
+		memset(buf, 0, len);
 
-	memcpy(buf, audio->eld, min_t(size_t, MAX_ELD_BYTES, len));
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 62ae63565d3a..54d8fdad395f 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -757,6 +757,14 @@ static void hdmi_enable_audio_clk(struct dw_hdmi *hdmi, bool enable)
 	hdmi_writeb(hdmi, hdmi->mc_clkdis, HDMI_MC_CLKDIS);
 }
 
+static u8 *hdmi_audio_get_eld(struct dw_hdmi *hdmi)
+{
+	if (!hdmi->curr_conn)
+		return NULL;
+
+	return hdmi->curr_conn->eld;
+}
+
 static void dw_hdmi_ahb_audio_enable(struct dw_hdmi *hdmi)
 {
 	hdmi_set_cts_n(hdmi, hdmi->audio_cts, hdmi->audio_n);
@@ -3432,7 +3440,7 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
 		audio.base = hdmi->regs;
 		audio.irq = irq;
 		audio.hdmi = hdmi;
-		audio.eld = hdmi->connector.eld;
+		audio.get_eld = hdmi_audio_get_eld;
 		hdmi->enable_audio = dw_hdmi_ahb_audio_enable;
 		hdmi->disable_audio = dw_hdmi_ahb_audio_disable;
 
@@ -3445,7 +3453,7 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
 		struct dw_hdmi_i2s_audio_data audio;
 
 		audio.hdmi	= hdmi;
-		audio.eld	= hdmi->connector.eld;
+		audio.get_eld	= hdmi_audio_get_eld;
 		audio.write	= hdmi_writeb;
 		audio.read	= hdmi_readb;
 		hdmi->enable_audio = dw_hdmi_i2s_audio_enable;
-- 
2.25.1

