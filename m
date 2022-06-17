Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A082854F1EE
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 09:27:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AA0D11A9F3;
	Fri, 17 Jun 2022 07:27:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D39BF11A9EE
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 07:27:36 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id n20so336833ejz.10
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 00:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VFZwn07Jf42Rg7k/gx/lsnWK8vEpodBGY1nxYIP45Co=;
 b=p1oU7GeoNQu6awHQ0aGj9MhjLXK0wKEVYnKJXK/czTcHCbWD809coenj5JBeIO1lPt
 TqfQ71qu/DpVseqo7ZOJ89CwEcAm2TO/Nmo+rg4U1RlaF/sxCHzmp8jwvn4gtBv42mAW
 j8rS6NoGZo2q54fMem/9hBmMtob7tPi4TeU8NndN3lwmT8cfsUKwYjNjBBB+XBDk0U0f
 o3JDsJKDiBD+3PBUBvGTlDikfLPVhhPZ032STPNWE4vAsWW2cHsxOBlbzYxyr+Y+bWyw
 Yl6bS+FBeLvaUNRz57n2sigJxm+6IVkOiAuWDguM79BKZB/sCevO/d7TzMGm/YjiQLdn
 xXzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VFZwn07Jf42Rg7k/gx/lsnWK8vEpodBGY1nxYIP45Co=;
 b=uC/GzpCFFDlL983nqCeq021NQVLLlGSIR5BLW0wDSf8Dt41+5/79aFe5zreP8lo/F8
 fq3KShFg4H8zODNBIJBUx6HA2JMyHx4RGaL06yepmOKwaRAYnrbwCSDolqQgPjRFuuRH
 WSyJvYtVwDs1rznwElvrj05qpWdjQWa2AoyxQcYrJIhuNqN3d8HSnHZbmxn1kNPRbPL5
 JGvk9IDEl+XrKhYDT8bY+1bzLLxsC0ufy0J0ZNf/6LzAWtBGWX5bhr4HurbvYXk+Ws1o
 xem3XLUgr91iVSeROuDnqxYdeVIRIS/y2JCvAULnyywGgQtfVoG7Xgt1SIzrcWmBNQQE
 sNhA==
X-Gm-Message-State: AJIora+7vKxUcX13zMf8AL5yMqly69zUXuJMUoDhg8R/KEjtRW9yCs/d
 venLtLJihFQldFWeizOanZiwxQXDAyYtlg==
X-Google-Smtp-Source: AGRyM1sqUWRr2IgX7mP5yp58eUlwZ45seC2wUZzYvVtMcnG9xRXijqPFlEHY6srrV4CeDwLouWejYA==
X-Received: by 2002:a17:907:8692:b0:711:d49f:994d with SMTP id
 qa18-20020a170907869200b00711d49f994dmr7812873ejc.578.1655450855721; 
 Fri, 17 Jun 2022 00:27:35 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:d227:8f3c:286a:d9d8])
 by smtp.gmail.com with ESMTPSA id
 n9-20020a170906840900b006fec56a80a8sm1762556ejx.115.2022.06.17.00.27.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jun 2022 00:27:35 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org,
	martin.blumenstingl@googlemail.com
Subject: [PATCH v3 4/6] drm/meson: vclk: add DSI clock config
Date: Fri, 17 Jun 2022 09:27:21 +0200
Message-Id: <20220617072723.1742668-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220617072723.1742668-1-narmstrong@baylibre.com>
References: <20220617072723.1742668-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3768; h=from:subject;
 bh=wVEu88z9Tki+VwSbbtWc3B9clOhCXc+ZkFmWDGthpuw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBirCyrS/tyPj3lnnn7HteF8IVQnViij4BcDf57V2+t
 0uJANG6JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYqwsqwAKCRB33NvayMhJ0SmLEA
 CG35qlOumtls9mivNjWPMKCp0/wz5sEksxVdSfbEF8wJWBnhZNsKMBp/xwx6/zZiD9it5SIAa8wZSz
 sAgkSM9dmFReB6MziDdFqVJfQTCFbJK1FrQhHL4UyulW3wd1TZwjVMulQ3VUsSOMZEVj4FbRkMOEas
 SUI9VfH6I6vAjXnoOnbCJCzpnXaAczTQa+0PVZrArw+0YPJhlCl7m9a6rexnjPukfBXi1Uen1A2tDL
 1VCWWy2XC67I8YKkdAdhcMHNIk8SEUG48yQn1Yd67cZU+djjCIHpARjU4Wzo6RikJcRLSbLH+hVwUf
 bhIFuHb2aW9/w9KY8TIKd/GK7yYN6JT1Xz7mkv9JQ8kquj0ePxMU+dz8/kitu8EUe/e4zWjks0w+lU
 MwQgc0skTGmofkzR5U9MCApU5+gEqfD4SRnKdsBs9A4v/6TdDw1XmL4sgo8Tm9eun4XQ9BRVHyGuwh
 NFA/760V5/jvamDsQaxtwNGXCwOuKbmv+Wc7CemcxnbaXwwSsUxotln3KREDlkVqK0HJ4Q0uEe/3T8
 WGdnSxF3MSBNi/PDN2k2qv9iVndUz5QsVEJ3QFmlGcw2BlpIkSYM72HsrM0Ntt9eC0PwtxJZlssPYS
 vEoZsRijlKN2TxI28TCeEuYrVlxscjUkjwW95b1lDU9ifjZTuMJkXHNg1h6g==
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DSI path used the ENCL pixel encoder, thus this adds a clock
config using the HDMI PLL in order to feed the ENCL encoder via the
VCLK2 path and the CTS_ENCL clock output.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/meson/meson_vclk.c | 47 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/meson/meson_vclk.h |  1 +
 2 files changed, 48 insertions(+)

diff --git a/drivers/gpu/drm/meson/meson_vclk.c b/drivers/gpu/drm/meson/meson_vclk.c
index 2a82119eb58e..5e4d982be1c8 100644
--- a/drivers/gpu/drm/meson/meson_vclk.c
+++ b/drivers/gpu/drm/meson/meson_vclk.c
@@ -55,6 +55,8 @@
 #define VCLK2_DIV_MASK		0xff
 #define VCLK2_DIV_EN		BIT(16)
 #define VCLK2_DIV_RESET		BIT(17)
+#define CTS_ENCL_SEL_MASK	(0xf << 12)
+#define CTS_ENCL_SEL_SHIFT	12
 #define CTS_VDAC_SEL_MASK	(0xf << 28)
 #define CTS_VDAC_SEL_SHIFT	28
 #define HHI_VIID_CLK_CNTL	0x12c /* 0x4b offset in data sheet */
@@ -83,6 +85,7 @@
 #define VCLK_DIV12_EN		BIT(4)
 #define HHI_VID_CLK_CNTL2	0x194 /* 0x65 offset in data sheet */
 #define CTS_ENCI_EN		BIT(0)
+#define CTS_ENCL_EN		BIT(3)
 #define CTS_ENCP_EN		BIT(2)
 #define CTS_VDAC_EN		BIT(4)
 #define HDMI_TX_PIXEL_EN	BIT(5)
@@ -1024,6 +1027,47 @@ static void meson_vclk_set(struct meson_drm *priv, unsigned int pll_base_freq,
 	regmap_update_bits(priv->hhi, HHI_VID_CLK_CNTL, VCLK_EN, VCLK_EN);
 }
 
+static void meson_dsi_clock_config(struct meson_drm *priv, unsigned int freq)
+{
+	meson_hdmi_pll_generic_set(priv, freq * 10);
+
+	/* Setup vid_pll divider value /5 */
+	meson_vid_pll_set(priv, VID_PLL_DIV_5);
+
+	/* Disable VCLK2 */
+	regmap_update_bits(priv->hhi, HHI_VIID_CLK_CNTL, VCLK2_EN, 0);
+
+	/* Setup the VCLK2 divider value /2 */
+	regmap_update_bits(priv->hhi, HHI_VIID_CLK_DIV, VCLK2_DIV_MASK, 2 - 1);
+
+	/* select vid_pll for vclk2 */
+	regmap_update_bits(priv->hhi, HHI_VIID_CLK_CNTL,
+			   VCLK2_SEL_MASK, (0 << VCLK2_SEL_SHIFT));
+
+	/* enable vclk2 gate */
+	regmap_update_bits(priv->hhi, HHI_VIID_CLK_CNTL, VCLK2_EN, VCLK2_EN);
+
+	/* select vclk2_div1 for encl */
+	regmap_update_bits(priv->hhi, HHI_VIID_CLK_DIV,
+			   CTS_ENCL_SEL_MASK, (8 << CTS_ENCL_SEL_SHIFT));
+
+	/* release vclk2_div_reset and enable vclk2_div */
+	regmap_update_bits(priv->hhi, HHI_VIID_CLK_DIV, VCLK2_DIV_EN | VCLK2_DIV_RESET,
+			   VCLK2_DIV_EN);
+
+	/* enable vclk2_div1 gate */
+	regmap_update_bits(priv->hhi, HHI_VIID_CLK_CNTL, VCLK2_DIV1_EN, VCLK2_DIV1_EN);
+
+	/* reset vclk2 */
+	regmap_update_bits(priv->hhi, HHI_VIID_CLK_CNTL, VCLK2_SOFT_RESET, VCLK2_SOFT_RESET);
+	regmap_update_bits(priv->hhi, HHI_VIID_CLK_CNTL, VCLK2_SOFT_RESET, 0);
+
+	/* enable encl_clk */
+	regmap_update_bits(priv->hhi, HHI_VID_CLK_CNTL2, CTS_ENCL_EN, CTS_ENCL_EN);
+
+	usleep_range(10000, 11000);
+}
+
 void meson_vclk_setup(struct meson_drm *priv, unsigned int target,
 		      unsigned int phy_freq, unsigned int vclk_freq,
 		      unsigned int venc_freq, unsigned int dac_freq,
@@ -1050,6 +1094,9 @@ void meson_vclk_setup(struct meson_drm *priv, unsigned int target,
 		meson_vclk_set(priv, phy_freq, 0, 0, 0,
 			       VID_PLL_DIV_5, 2, 1, 1, false, false);
 		return;
+	} else if (target == MESON_VCLK_TARGET_DSI) {
+		meson_dsi_clock_config(priv, phy_freq);
+		return;
 	}
 
 	hdmi_tx_div = vclk_freq / dac_freq;
diff --git a/drivers/gpu/drm/meson/meson_vclk.h b/drivers/gpu/drm/meson/meson_vclk.h
index 60617aaf18dd..1152b3af8d2e 100644
--- a/drivers/gpu/drm/meson/meson_vclk.h
+++ b/drivers/gpu/drm/meson/meson_vclk.h
@@ -17,6 +17,7 @@ enum {
 	MESON_VCLK_TARGET_CVBS = 0,
 	MESON_VCLK_TARGET_HDMI = 1,
 	MESON_VCLK_TARGET_DMT = 2,
+	MESON_VCLK_TARGET_DSI = 3,
 };
 
 /* 27MHz is the CVBS Pixel Clock */
-- 
2.25.1

