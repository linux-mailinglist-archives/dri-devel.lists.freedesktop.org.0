Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E536D889C0C
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 12:09:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5822710E77E;
	Mon, 25 Mar 2024 11:09:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="w1JpVev2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C00A210E77E
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 11:09:54 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-a467d8efe78so497454366b.3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 04:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711364993; x=1711969793; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QN+HLjErIB7ZWFmsBfwwzGZ1Ru0jHXqoMDEbQQnTksc=;
 b=w1JpVev2eH2gXQceptuoQXaHD6321kvBxXoYk1DoG/Ht94w94LJhpxBugZFqwtyoMw
 biFEVpgklDEBmsHHBhn8DYHEQ71LsDYwzJQdYSSYHxalwGAHZFD/2X86oudok1ozhg0g
 hU8g5h0ydtv/iH3Zdve2t9hx1m57062Bq50ca+Y5ZCDAiyjiw9QELooqPem2ao2yXeYS
 lqL6VXjmtU6HRPrn+MZo5C1+1W4bDxgZRkiKnbyrhFxN1+HIPwGLwIqlCa8D+PQBkHnB
 9ZRrlIzZe4rNkvKIjjwtoqC2wKzcgaqGX17kllskVyOj2pS1VL/sv43ciiHKW5T59YNl
 fmBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711364993; x=1711969793;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QN+HLjErIB7ZWFmsBfwwzGZ1Ru0jHXqoMDEbQQnTksc=;
 b=Uv4MZJeoI97L3TFpcblid9y0q8g3grS0L4sTcadgDhJmlLaiBL86BLHEdaeMis+hEi
 J0AcWz0pW3mES3WLB6ZgrFEHq8HcD25s7pGl15rivnlZCQ5OQpByDQxyJ6VKzh/43mww
 /o5cLXao5J/iH1dGpX+mTkrIyTDBBzrMc+QZxKNC4EYrR57S8LkCo5Bt7+OcPefXk0oL
 9K9B8db6dyPrqhxUt+mQeYsMibEoHT/t4ujHLmS1cPZn3q+I2T0K4Otu9nANZZZA6VI+
 ARE6tn/VONSul8k6uHTK+vLYln5Jp0/YrK6v6CBOy/Hr2BHvl5sZ6ARJ3r4zVh8Dd2hh
 oaxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuSU+fnFMasCjp1/x0vtqeQCjcOgXmHZQuX1TG01sImePuABL/3dQeG1nbr80fscsc4HbEr8azLGYx3QsjTcmUKY2hoFlBdX1AS0l7hLjk
X-Gm-Message-State: AOJu0YwMZXoX/lFxzn6+81qMei3obvvs5Ys8mNj6ClKensszE+wmGwMq
 yqipSGl3A2YFP+c2BszDdqEXy3XWTYrymFfK2pd45Yxx3PDDTTjVmoOpBVkPJDE=
X-Google-Smtp-Source: AGHT+IFaR7qqVt/MdAABUA3kVVh+oxwB1NqQMB8RLAx1YVR9BjNNzq7Usn4wKSFbZJXfMpwNi74HwA==
X-Received: by 2002:a17:906:1ec9:b0:a46:b764:fc81 with SMTP id
 m9-20020a1709061ec900b00a46b764fc81mr4454449ejj.44.1711364992697; 
 Mon, 25 Mar 2024 04:09:52 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 bw26-20020a170906c1da00b00a4650ec48d0sm2972367ejb.140.2024.03.25.04.09.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Mar 2024 04:09:52 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v11 0/7] drm/meson: add support for MIPI DSI Display
Date: Mon, 25 Mar 2024 12:09:46 +0100
Message-Id: <20240325-amlogic-v6-4-upstream-dsi-ccf-vim3-v11-0-04f55de44604@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHpbAWYC/5XQu27DMAwF0F8JNFeFRL079T+KDrJEJwIcO5ASo
 0Xgfy8ToC94cUbe4VySV9awFmzsZXdlFefSyjTSIOXTjqVDHPfIS6aAgQAljAQej8O0L4nPlmt
 +ObVzxXjkuRWeUs/nclS882hAOpS9joygLjbkXY1jOhA1XoaBwlPFvnzcq9/eaT6Udp7q532TW
 d/ShzpnzQUHEyBBwAhWvQ5ljHV6nuqe3fzZPG4aMo3FzkWdDV21Mu3jpiWzzxBT8NpoByvT/Zp
 eqE2mI9NZABn6ZDrwK9P/mFKKsMn0ZHqJOiLmKMP6n+GPCXqTGcgMBuilWaqAdmVK8Y1qAcJsQ
 qUgNSdhhVPZKCX+qcuyfAE0XgMx5QIAAA==
To: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Nicolas Belin <nbelin@baylibre.com>, 
 Jagan Teki <jagan@amarulasolutions.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 "Lukas F. Hartmann" <lukas@mntre.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=6402;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=KBXorlioJW7tcwKv3p+L3Oz6+Zcw+uy98uixMdmu0fY=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmAVt722X5dHIQQC4applU032j04Zw7+XorMF3Qbg4
 lVZY1V+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZgFbewAKCRB33NvayMhJ0amhEA
 CHY5l5iAzw6SYsHXwnmS/dMpkXI7szeeOZMUTduZgTEp3gRL8+8/i8WCx1GgpmUYunLuvRSwM5RVPh
 ZmDM1P3ymObD7aglnofB4T9caW92mS+0vH6c8eEwWwG42h6b37HMnZHHjGi43tpiEvLr/6/2cdrm89
 /qGlUt4wi/GWBJFu6hPBsjvJD+RpKskk1ZwLCAk7sK/m5on1If5Czjz3+IJ3F2bSyKoiCOjiO7hpXc
 69vvP+ZheT8IdUiKtpb3mcyGQeo3ksEFoPgYyDfFt3qlv8W5Dw3iHEV4ppTVjjTsxwSwXTmsnjcrZu
 mBAWk+9+L98tfAuVYti0FAzMI0ZwuRrNn9NMxdEVSDkDnYkCr3e4DjLCTgORiz3/us3uwetR1LDU+q
 SUionthr1urYCdnjZolaJOJqnqx1JZA1NO74h4k7Sb9WgF4AOkO+vErn3+OOswdm3f3sglXz2/tXMy
 uYc6HyFtDaXoXtiQAeMP4rQjuVR3sl9DmPKE9Kc3LMQ/QfxNpqBQQ9As5jbGAB910Y3m3bY6h1PJkP
 1ywySBeiY0FWU9UFOr+voV/fQsEoU61JRiX1zoii09N5PfmgCRklKYQs8xztKKC+ZVz+esiwrMpVUA
 6/PxHtCbgvMNvgVspqhsqn5nenxdh1S7O35NRcnt74SRLcw7l9Bbh7PAyJYg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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

The Amlogic G12A, G12B & SM1 SoCs embeds a Synopsys DW-MIPI-DSI transceiver (ver 1.21a),
with a custom glue managing the IP resets, clock and data input similar to the DW-HDMI
glue on the same Amlogic SoCs.

This is a follow-up of v5  now the DRM patches are applied, the clk & DT changes
remains for a full DSI support on G12A & SM1 platforms.

The DW-MIPI-DSI transceiver + D-PHY are clocked by the GP0 PLL, and the ENCL encoder + VIU
pixel reader by the VCLK2 clock using the HDMI PLL.

The DW-MIPI-DSI transceiver gets this pixel stream as input clocked with the VCLK2 clock.

An optional "MEAS" clock can be enabled to measure the delay between each vsync feeding the
DW-MIPI-DSI transceiver.

The clock setup has been redesigned to use CCF, a common PLL (GP0) and the VCLK2 clock
path for DSI in preparation of full CCF support and possibly dual display with HDMI.

The change from v5 is that now we use a "VCLK" driver instead of notifier and rely
on CLK_SET_RATE_GATE to ensure the VCLK gate operation are called.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v11:
- Rebased on v6.9-rc1
- Fixed overlay handling/creation
- Link to v10: https://lore.kernel.org/r/20240205-amlogic-v6-4-upstream-dsi-ccf-vim3-v10-0-dc06073d5330@linaro.org

Changes in v10:
- Rename regmap_vclk to meson_clk and add _gate for the gate
- Move COMMON_CLK_MESON_VCLK to following patch
- Remove CLK_SET_RATE_PARENT from g12a_vclk2_sel, keep it only on mipi_dsi_pxclk_sel
- Add more info on commit message to specify how clock setup is designed
- Remove forgotten CLK_IGNORE_UNUSED on g12a_vclk2_input
- Remove useless CLK_SET_RATE_PARENT on g12a_vclk2_div to stop propagatting rate _after_ vclk2_div
- Remove invalid CLK_SET_RATE_GATE on g12a_vclk2 since it's not a divider...
- Drop already applied patches
- move Khadas TS050 changes as an overlay
- Link to v9: https://lore.kernel.org/r/20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-0-95256ed139e6@linaro.org

Changes in v9:
- Colledte reviewed-bys
- Fixed patches 2 & 4, commit messages and bindings format
- Link to v8: https://lore.kernel.org/r/20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-0-81e4aeeda193@linaro.org

Changes in v8:
- Switch vclk clk driver to parm as requested by Jerome
- Added bindings fixes to amlogic,meson-axg-mipi-pcie-analog & amlogic,g12a-mipi-dphy-analog
- Fixed DT errors in vim3 example and MNT Reform DT
- Rebased on next-20231107, successfully tested on VIM3L
- Link to v7: https://lore.kernel.org/r/20230803-amlogic-v6-4-upstream-dsi-ccf-vim3-v7-0-762219fc5b28@linaro.org

Changes in v7:
- Added review tags
- Fixed patch 5 thanks to George
- Link to v6: https://lore.kernel.org/r/20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v6-0-fd2ac9845472@linaro.org

Changes in v6:
- dropped applied DRM patches
- dropped clk private prefix patches
- rebased on top of 20230607-topic-amlogic-upstream-clkid-public-migration-v2-0-38172d17c27a@linaro.org
- re-ordered/cleaned ENCL patches to match clkid public migration
- Added new "vclk" driver
- uses vclk driver instead of notifier
- cleaned VCLK2 clk flags
- add px_clk gating from DSI driver
- Link to v5: https://lore.kernel.org/r/20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-0-56eb7a4d5b8e@linaro.org

Changes in v5:
- Aded PRIV all the G12 internal clk IDS to simplify public exposing
- Fixed the DSI bindings
- Fixed the DSI HSYNC/VSYNC polarity handling
- Fixed the DSI clock setup
- Fixed the DSI phy timings
- Dropped components for DSI, only keeping it for HDMI
- Added MNT Reform 2 CM4 DT
- Dropped already applied PHY fix
- Link to v4: https://lore.kernel.org/r/20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v4-0-2592c29ea263@linaro.org

Changes from v3 at [3]:
- switched all clk setup via CCF
- using single PLL for DSI controller & ENCL encoder
- added ENCL clocks to CCF
- make the VCLK2 clocks configuration by CCF
- fixed probe/bind of DSI controller to work with panels & bridges
- added bit_clk to controller to it can setup the BIT clock aswell
- added fix for components unbind
- added fix for analog phy setup value
- added TS050 timings fix
- dropped previous clk control patch

Changes from v2 at [2]:
- Fixed patch 3
- Added reviews from Jagan
- Rebased on v5.19-rc1

Changes from v1 at [1]:
- fixed DSI host bindings
- add reviewed-by tags for bindings
- moved magic values to defines thanks to Martin's searches
- added proper prefixes to defines
- moved phy_configure to phy_init() dw-mipi-dsi callback
- moved phy_on to a new phy_power_on() dw-mipi-dsi callback
- correctly return phy_init/configure errors to callback returns

[1] https://lore.kernel.org/r/20200907081825.1654-1-narmstrong@baylibre.com
[2] https://lore.kernel.org/r/20220120083357.1541262-1-narmstrong@baylibre.com
[3] https://lore.kernel.org/r/20220617072723.1742668-1-narmstrong@baylibre.com

---
Neil Armstrong (7):
      dt-bindings: arm: amlogic: Document the MNT Reform 2 CM4 adapter with a BPI-CM4 Module
      clk: meson: add vclk driver
      clk: meson: g12a: make VCLK2 and ENCL clock path configurable by CCF
      drm/meson: gate px_clk when setting rate
      arm64: meson: g12-common: add the MIPI DSI nodes
      arm64: meson: khadas-vim3l: add TS050 DSI panel overlay
      arm64: dts: amlogic: meson-g12b-bananapi-cm4: add support for MNT Reform2 with CM4 adaper

 Documentation/devicetree/bindings/arm/amlogic.yaml |   1 +
 arch/arm64/boot/dts/amlogic/Makefile               |   5 +
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi  |  70 ++++
 .../meson-g12b-bananapi-cm4-mnt-reform2.dts        | 384 +++++++++++++++++++++
 .../boot/dts/amlogic/meson-khadas-vim3-ts050.dtso  | 108 ++++++
 drivers/clk/meson/Kconfig                          |   5 +
 drivers/clk/meson/Makefile                         |   1 +
 drivers/clk/meson/g12a.c                           |  72 ++--
 drivers/clk/meson/vclk.c                           | 141 ++++++++
 drivers/clk/meson/vclk.h                           |  51 +++
 drivers/gpu/drm/meson/meson_dw_mipi_dsi.c          |   7 +
 11 files changed, 825 insertions(+), 20 deletions(-)
---
base-commit: 4cece764965020c22cff7665b18a012006359095
change-id: 20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-b8e5217e1f4a

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

