Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9789740B8FB
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 22:22:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 169D76E7EC;
	Tue, 14 Sep 2021 20:22:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 842D06E7EC
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 20:22:28 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id dw14so533962pjb.1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 13:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PQtUZ6ojkHQ3HwqSfjxsXDkHGMDoFBQZ9VP3mgFyDIY=;
 b=nElNYCt1nSKsyu0bm017l5GZQIJoXbyA+QdwzRRMrnm6J8fRt+I7PFUR4mXCXTtIO0
 0kgjsJynkK10lIwQ0agbdwjq1Qph4R9BK5WDTxG7t2RgydwFqPcAeRQ23c6+NnP/6X2v
 vir/E/zM2WHJ3AeC8R+pn3cDHAegthjve7fdU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PQtUZ6ojkHQ3HwqSfjxsXDkHGMDoFBQZ9VP3mgFyDIY=;
 b=e0V0EJ6TKR/Sa/tLJJw5Y2QjToOVPxNmSw4fN+/CNdRD/cA1/k05rVVTChw4ydjPfc
 k7ISkPCUl+lRAts7EeKJF1t4JcbfMXbib7Qi1Se+nktedlhLzOGjVFMOQ4Gtlz+Lo9Rt
 Lg9rVruFPyos9S0LtKElxWdJLmSXX46B4wRRSdG/CO1jmO1m4RnF0HkBbcH6emOv8BPv
 8O2BJpWKT7r6r++EHAKhQz2XsiDfbS6ck7tB+1ETHfm7y7HZWFOKvrpzVDbxBGjq33O+
 NHslnVY4e6JgNKT2oyBHWDdIZ+vLQZ+bOKGfrKoW9cbpFnlSNDZM5gS3xPA12FE9DasR
 Ug2g==
X-Gm-Message-State: AOAM530MJ+r5E8E8oqqMcTX0mfwF9zV4cOvhOKIzH8sbxSvRJsbsBO+x
 GG+jZn0B0IvskjdFxcQmAQMc9A==
X-Google-Smtp-Source: ABdhPJy0cP8Dmd9EgX8aE+GlaFkMq74udUigtWe05Gk1na2fsHT/QnVGvoQMAyfI0QrNlZ65IkTsvw==
X-Received: by 2002:a17:90b:1651:: with SMTP id
 il17mr4149269pjb.162.1631650947808; 
 Tue, 14 Sep 2021 13:22:27 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:f38f:9d0f:3eba:f8c4])
 by smtp.gmail.com with ESMTPSA id 141sm12185393pgg.16.2021.09.14.13.22.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 13:22:27 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Cc: devicetree@vger.kernel.org, Steev Klimaszewski <steev@kali.org>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Linus W <linus.walleij@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Maxime Ripard <mripard@kernel.org>,
 Douglas Anderson <dianders@chromium.org>,
 Al Viro <viro@zeniv.linux.org.uk>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andreas Kemnade <andreas@kemnade.info>,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 Anson Huang <Anson.Huang@nxp.com>, Arnd Bergmann <arnd@arndb.de>,
 Chen-Yu Tsai <wens@csie.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Corentin Labbe <clabbe@baylibre.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Dmitry Osipenko <digetx@gmail.com>,
 Emil Velikov <emil.velikov@collabora.com>,
 Eugen Hristev <eugen.hristev@microchip.com>,
 Fabio Estevam <festevam@gmail.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Grygorii Strashko <grygorii.strashko@ti.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Jonathan Hunter <jonathanh@nvidia.com>, Kees Cook <keescook@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Lionel Debieve <lionel.debieve@st.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Magnus Damm <magnus.damm@gmail.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 =?UTF-8?q?Martin=20J=C3=BCcker?= <martin.juecker@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Olivier Moysan <olivier.moysan@st.com>,
 Otavio Salvador <otavio@ossystems.com.br>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Razvan Stefanescu <razvan.stefanescu@microchip.com>,
 Robert Richter <rric@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Stefan Wahren <stefan.wahren@i2se.com>,
 Sudeep Holla <sudeep.holla@arm.com>, Tony Lindgren <tony@atomide.com>,
 Viresh Kumar <viresh.kumar@linaro.org>, Vladimir Zapolskiy <vz@mleia.com>,
 William Cohen <wcohen@redhat.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 =?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>
Subject: [PATCH v5 05/15] ARM: configs: Everyone who had PANEL_SIMPLE now gets
 PANEL_EDP
Date: Tue, 14 Sep 2021 13:21:52 -0700
Message-Id: <20210914132020.v5.5.I02250cd7d4799661b068bcc65849a456ed411734@changeid>
X-Mailer: git-send-email 2.33.0.309.g3052b89438-goog
In-Reply-To: <20210914202202.1702601-1-dianders@chromium.org>
References: <20210914202202.1702601-1-dianders@chromium.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In the patch ("drm/panel-simple-edp: Split eDP panels out of
panel-simple") we will split the PANEL_SIMPLE driver in two. By
default let's give everyone who had the old driver enabled the new
driver too. If folks want to opt-out of one or the other they always
can later.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---

(no changes since v4)

Changes in v4:
- PANEL_SIMPLE_EDP => PANEL_EDP
- Reordered config patches to be before code patch

 arch/arm/configs/at91_dt_defconfig   | 1 +
 arch/arm/configs/exynos_defconfig    | 1 +
 arch/arm/configs/imx_v6_v7_defconfig | 1 +
 arch/arm/configs/lpc32xx_defconfig   | 1 +
 arch/arm/configs/multi_v5_defconfig  | 1 +
 arch/arm/configs/multi_v7_defconfig  | 1 +
 arch/arm/configs/omap2plus_defconfig | 1 +
 arch/arm/configs/qcom_defconfig      | 1 +
 arch/arm/configs/realview_defconfig  | 1 +
 arch/arm/configs/sama5_defconfig     | 1 +
 arch/arm/configs/shmobile_defconfig  | 1 +
 arch/arm/configs/sunxi_defconfig     | 1 +
 arch/arm/configs/tegra_defconfig     | 1 +
 arch/arm/configs/versatile_defconfig | 1 +
 arch/arm/configs/vexpress_defconfig  | 1 +
 15 files changed, 15 insertions(+)

diff --git a/arch/arm/configs/at91_dt_defconfig b/arch/arm/configs/at91_dt_defconfig
index b1564e0aa000..a6310c8abcc3 100644
--- a/arch/arm/configs/at91_dt_defconfig
+++ b/arch/arm/configs/at91_dt_defconfig
@@ -144,6 +144,7 @@ CONFIG_VIDEO_MT9V032=m
 CONFIG_DRM=y
 CONFIG_DRM_ATMEL_HLCDC=y
 CONFIG_DRM_PANEL_SIMPLE=y
+CONFIG_DRM_PANEL_EDP=y
 CONFIG_FB_ATMEL=y
 CONFIG_BACKLIGHT_ATMEL_LCDC=y
 CONFIG_BACKLIGHT_PWM=y
diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index f4e1873912a3..cae09010a799 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -227,6 +227,7 @@ CONFIG_DRM_EXYNOS_DPI=y
 CONFIG_DRM_EXYNOS_DSI=y
 CONFIG_DRM_EXYNOS_HDMI=y
 CONFIG_DRM_PANEL_SIMPLE=y
+CONFIG_DRM_PANEL_EDP=y
 CONFIG_DRM_PANEL_SAMSUNG_LD9040=y
 CONFIG_DRM_PANEL_SAMSUNG_S6E63J0X03=y
 CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0=y
diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
index 079fcd8d1d11..f46cdc4a0ca8 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -280,6 +280,7 @@ CONFIG_DRM=y
 CONFIG_DRM_MSM=y
 CONFIG_DRM_PANEL_LVDS=y
 CONFIG_DRM_PANEL_SIMPLE=y
+CONFIG_DRM_PANEL_EDP=y
 CONFIG_DRM_PANEL_SEIKO_43WVF1G=y
 CONFIG_DRM_TI_TFP410=y
 CONFIG_DRM_DW_HDMI_AHB_AUDIO=m
diff --git a/arch/arm/configs/lpc32xx_defconfig b/arch/arm/configs/lpc32xx_defconfig
index 989bcc84e7fb..6c3e4a141963 100644
--- a/arch/arm/configs/lpc32xx_defconfig
+++ b/arch/arm/configs/lpc32xx_defconfig
@@ -108,6 +108,7 @@ CONFIG_REGULATOR=y
 CONFIG_REGULATOR_FIXED_VOLTAGE=y
 CONFIG_DRM=y
 CONFIG_DRM_PANEL_SIMPLE=y
+CONFIG_DRM_PANEL_EDP=y
 CONFIG_DRM_PL111=y
 CONFIG_FB_MODE_HELPERS=y
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
diff --git a/arch/arm/configs/multi_v5_defconfig b/arch/arm/configs/multi_v5_defconfig
index 80a3ae02d759..fe8d760256a4 100644
--- a/arch/arm/configs/multi_v5_defconfig
+++ b/arch/arm/configs/multi_v5_defconfig
@@ -194,6 +194,7 @@ CONFIG_VIDEO_ATMEL_ISI=m
 CONFIG_DRM=y
 CONFIG_DRM_ATMEL_HLCDC=m
 CONFIG_DRM_PANEL_SIMPLE=y
+CONFIG_DRM_PANEL_EDP=y
 CONFIG_DRM_ASPEED_GFX=m
 CONFIG_FB_IMX=y
 CONFIG_FB_ATMEL=y
diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index d9abaae118dd..610e3453d720 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -699,6 +699,7 @@ CONFIG_DRM_TEGRA=y
 CONFIG_DRM_STM=m
 CONFIG_DRM_STM_DSI=m
 CONFIG_DRM_PANEL_SIMPLE=y
+CONFIG_DRM_PANEL_EDP=y
 CONFIG_DRM_PANEL_SAMSUNG_LD9040=m
 CONFIG_DRM_PANEL_ORISETECH_OTM8009A=m
 CONFIG_DRM_PANEL_RAYDIUM_RM68200=m
diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
index 2ac2418084ab..d933b787d934 100644
--- a/arch/arm/configs/omap2plus_defconfig
+++ b/arch/arm/configs/omap2plus_defconfig
@@ -511,6 +511,7 @@ CONFIG_OMAP2_DSS_DSI=y
 CONFIG_DRM_TILCDC=m
 CONFIG_DRM_PANEL_DSI_CM=m
 CONFIG_DRM_PANEL_SIMPLE=m
+CONFIG_DRM_PANEL_EDP=m
 CONFIG_DRM_PANEL_LG_LB035Q02=m
 CONFIG_DRM_PANEL_NEC_NL8048HL11=m
 CONFIG_DRM_PANEL_SHARP_LS037V7DW01=m
diff --git a/arch/arm/configs/qcom_defconfig b/arch/arm/configs/qcom_defconfig
index 26353cbfa968..0daa9c0d298e 100644
--- a/arch/arm/configs/qcom_defconfig
+++ b/arch/arm/configs/qcom_defconfig
@@ -158,6 +158,7 @@ CONFIG_MEDIA_SUPPORT=y
 CONFIG_DRM=y
 CONFIG_DRM_MSM=m
 CONFIG_DRM_PANEL_SIMPLE=y
+CONFIG_DRM_PANEL_EDP=y
 CONFIG_DRM_ANALOGIX_ANX78XX=m
 CONFIG_FB=y
 CONFIG_FRAMEBUFFER_CONSOLE=y
diff --git a/arch/arm/configs/realview_defconfig b/arch/arm/configs/realview_defconfig
index 4c01e313099f..3ef3521c19db 100644
--- a/arch/arm/configs/realview_defconfig
+++ b/arch/arm/configs/realview_defconfig
@@ -61,6 +61,7 @@ CONFIG_REGULATOR=y
 CONFIG_REGULATOR_FIXED_VOLTAGE=y
 CONFIG_DRM=y
 CONFIG_DRM_PANEL_SIMPLE=y
+CONFIG_DRM_PANEL_EDP=y
 CONFIG_DRM_DISPLAY_CONNECTOR=y
 CONFIG_DRM_SIMPLE_BRIDGE=y
 CONFIG_DRM_PL111=y
diff --git a/arch/arm/configs/sama5_defconfig b/arch/arm/configs/sama5_defconfig
index 17db3b3e2dd3..fe0d7ccc8fb2 100644
--- a/arch/arm/configs/sama5_defconfig
+++ b/arch/arm/configs/sama5_defconfig
@@ -160,6 +160,7 @@ CONFIG_VIDEO_MT9V032=m
 CONFIG_DRM=y
 CONFIG_DRM_ATMEL_HLCDC=y
 CONFIG_DRM_PANEL_SIMPLE=y
+CONFIG_DRM_PANEL_EDP=y
 CONFIG_LCD_CLASS_DEVICE=y
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
 CONFIG_BACKLIGHT_PWM=y
diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
index d9a27e4e0914..b772105039f6 100644
--- a/arch/arm/configs/shmobile_defconfig
+++ b/arch/arm/configs/shmobile_defconfig
@@ -129,6 +129,7 @@ CONFIG_VIDEO_ML86V7667=y
 CONFIG_DRM=y
 CONFIG_DRM_RCAR_DU=y
 CONFIG_DRM_PANEL_SIMPLE=y
+CONFIG_DRM_PANEL_EDP=y
 CONFIG_DRM_DISPLAY_CONNECTOR=y
 CONFIG_DRM_LVDS_CODEC=y
 CONFIG_DRM_SII902X=y
diff --git a/arch/arm/configs/sunxi_defconfig b/arch/arm/configs/sunxi_defconfig
index a60c134c5e04..8ba7935bd039 100644
--- a/arch/arm/configs/sunxi_defconfig
+++ b/arch/arm/configs/sunxi_defconfig
@@ -108,6 +108,7 @@ CONFIG_DRM_SUN4I_HDMI_CEC=y
 CONFIG_DRM_SUN8I_DW_HDMI=y
 CONFIG_DRM_PANEL_LVDS=y
 CONFIG_DRM_PANEL_SIMPLE=y
+CONFIG_DRM_PANEL_EDP=y
 CONFIG_DRM_SIMPLE_BRIDGE=y
 CONFIG_DRM_LIMA=y
 CONFIG_FB_SIMPLE=y
diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/tegra_defconfig
index 3d8d8af9524d..055e35b48706 100644
--- a/arch/arm/configs/tegra_defconfig
+++ b/arch/arm/configs/tegra_defconfig
@@ -204,6 +204,7 @@ CONFIG_DRM_TEGRA=y
 CONFIG_DRM_TEGRA_STAGING=y
 CONFIG_DRM_PANEL_LVDS=y
 CONFIG_DRM_PANEL_SIMPLE=y
+CONFIG_DRM_PANEL_EDP=y
 CONFIG_DRM_LVDS_CODEC=y
 # CONFIG_LCD_CLASS_DEVICE is not set
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
diff --git a/arch/arm/configs/versatile_defconfig b/arch/arm/configs/versatile_defconfig
index b703f4757021..d06aa64e05a1 100644
--- a/arch/arm/configs/versatile_defconfig
+++ b/arch/arm/configs/versatile_defconfig
@@ -57,6 +57,7 @@ CONFIG_GPIO_PL061=y
 CONFIG_DRM=y
 CONFIG_DRM_PANEL_ARM_VERSATILE=y
 CONFIG_DRM_PANEL_SIMPLE=y
+CONFIG_DRM_PANEL_EDP=y
 CONFIG_DRM_DISPLAY_CONNECTOR=y
 CONFIG_DRM_SIMPLE_BRIDGE=y
 CONFIG_DRM_PL111=y
diff --git a/arch/arm/configs/vexpress_defconfig b/arch/arm/configs/vexpress_defconfig
index b5e246dd23f4..947987730eb7 100644
--- a/arch/arm/configs/vexpress_defconfig
+++ b/arch/arm/configs/vexpress_defconfig
@@ -77,6 +77,7 @@ CONFIG_SENSORS_VEXPRESS=y
 CONFIG_REGULATOR_VEXPRESS=y
 CONFIG_DRM=y
 CONFIG_DRM_PANEL_SIMPLE=y
+CONFIG_DRM_PANEL_EDP=y
 CONFIG_DRM_SII902X=y
 CONFIG_DRM_PL111=y
 CONFIG_FB=y
-- 
2.33.0.309.g3052b89438-goog

