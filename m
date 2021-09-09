Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A62F405E46
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 23:01:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53FFC6E916;
	Thu,  9 Sep 2021 21:01:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05B966E916
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Sep 2021 21:01:32 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 u11-20020a17090adb4b00b00181668a56d6so2395097pjx.5
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Sep 2021 14:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n006i3IBW2iUEGDiSQzDbT/ZRDF6GTq7cgbwR3bFSGQ=;
 b=DmLMttWEuMDptT4pkUI7EML70x7xxDpq3k4Bd4QKmj6PYOaerM1g4jawU+xW+E3l4h
 XqQjq9OjDcHwFNHbf7zAlzTeduNdvCx+dRFawLlvMv1ZcZmDe2d+oYZ8+SdyVwjSvsHz
 363GXhzw/rR0tjwlk6umJ8aUsmep/ehQge0ds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n006i3IBW2iUEGDiSQzDbT/ZRDF6GTq7cgbwR3bFSGQ=;
 b=AVCpjVdGu5lR5t8UgeRNezyfRe8tW5R7WHsGOdc/kRRK0EwbgzUiaH2rOvlAEfXC+G
 6gznGnwMaxX/b2Z2Nb4k78Zwl2V1COGvOu/S8tg8L3RtmUy9YwPtsplt4aQNQt5W0dL1
 hBBlZ+SUDeqYVGfafedv0HDfzfAkunMjzukBwwL8cLXz/LwctkQKzDJye0WYyNzIqOES
 RyaoamCkpo3XlKoPnQJvX8Qw1y5Ssozq884gmWgZNL/namWIbPLqmc+DgXpz/oV+LSn4
 P2NcwAfV/qvwIJdjYqqbLlxVHZcfWljiEjsH0sAY9cN5GSOS/vgK4cep56/gcg5iuur1
 XS3A==
X-Gm-Message-State: AOAM533KQyrUvINvGWFV/xVwcauvhJnk5nS1K1UP+jzheYhmewdWT/Ve
 yi05nNWr+FuZg+GDUUcEmyT00w==
X-Google-Smtp-Source: ABdhPJzjG7YLOczzbE3Y9qWt5C8gEnPH762+qg5P1jHWQwBpJiTKvjdTN7Ijd0U5T+C2rUT6AUCZpg==
X-Received: by 2002:a17:902:c40e:b0:138:e2f9:6c97 with SMTP id
 k14-20020a170902c40e00b00138e2f96c97mr4522970plk.26.1631221291607; 
 Thu, 09 Sep 2021 14:01:31 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:8da3:b0fb:4261:2c10])
 by smtp.gmail.com with ESMTPSA id l143sm177069pfd.60.2021.09.09.14.01.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 14:01:31 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Cc: devicetree@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Linus W <linus.walleij@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, Steev Klimaszewski <steev@kali.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Al Viro <viro@zeniv.linux.org.uk>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andreas Kemnade <andreas@kemnade.info>,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 Anson Huang <Anson.Huang@nxp.com>, Arnd Bergmann <arnd@arndb.de>,
 Chen-Yu Tsai <wens@csie.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
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
 Jonathan Hunter <jonathanh@nvidia.com>,
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
 Olivier Moysan <olivier.moysan@st.com>, Olof Johansson <olof@lixom.net>,
 Otavio Salvador <otavio@ossystems.com.br>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Razvan Stefanescu <razvan.stefanescu@microchip.com>,
 Robert Richter <rric@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Stefan Wahren <stefan.wahren@i2se.com>,
 Sudeep Holla <sudeep.holla@arm.com>, Tony Lindgren <tony@atomide.com>,
 Viresh Kumar <viresh.kumar@linaro.org>, Vladimir Zapolskiy <vz@mleia.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org,
 =?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>
Subject: [PATCH v4 05/15] ARM: configs: Everyone who had PANEL_SIMPLE now gets
 PANEL_EDP
Date: Thu,  9 Sep 2021 14:00:21 -0700
Message-Id: <20210909135838.v4.5.I02250cd7d4799661b068bcc65849a456ed411734@changeid>
X-Mailer: git-send-email 2.33.0.309.g3052b89438-goog
In-Reply-To: <20210909210032.465570-1-dianders@chromium.org>
References: <20210909210032.465570-1-dianders@chromium.org>
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

