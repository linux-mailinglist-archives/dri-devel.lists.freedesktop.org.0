Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A72B2DDF8D
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 09:32:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 022E589836;
	Fri, 18 Dec 2020 08:31:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2B396E1BA
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 18:07:20 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id o13so36629559lfr.3
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 10:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y8fr1iHSIZhCvTc7010qLcNSLREPpbF8f3eo0rKyUiU=;
 b=OaXN2R81hy3iauGi3nHDiXjgf+YsKLP5HbTi040iz+cN2JulD/8v6eeKOpKCmL1q9b
 zA0HXFIEx5FBsVWD96u4eEulgD8AYcHPrEIbvVjT+/WyO0Ta+TJ52ij8PzVE2NxcK6In
 QsO7EV6ABGHpzV9omz3gxY/F1fEkltnETk7GBxgWuvfE9gdp1usS8SMy9cscMuvYP6ih
 DykfzpZeekjpJmF7Yzu3jYMZFmQBG+CReKpfwwWc72QaKHEdThV6cDxY57Jgx36Jgx9/
 MOinM18AY2cDlHIVZCA72FaxD5rXIyH00j6MWNRmpvl4bx84qqyIfp2dExndpCl9zJBC
 bJhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y8fr1iHSIZhCvTc7010qLcNSLREPpbF8f3eo0rKyUiU=;
 b=JzT6NdO6lthH2fORw6TdV4r9o1t1JoA+Lf+/JvZcILKL3uf7MqSxLxSdkYFA2OtPbh
 d9c2+eqt7ImVXsuMQmH+38inViTztvcPcr8mEuHK4dN6c4yFU9aO4zdK4/YOLRwaUGSk
 P7McQ6hCKsQSN5nJ01vmbc0uEtuUNvxN7DKYpFiO0PnYlNPx097h7GI7NjnE/Xb8blgl
 T+9r4rniWO4OUGKp8m7DX2Jfsa9sBg+1NLejHypXTGEFjplOYhCoiB/YwRmbvI7GpVPz
 pNwrign4IzLPjWx8mU9zp1y3BqaRl/PkWDqOBhfZMvhEZ109QaRT3rg3/zLwc2HW9GKy
 9CHQ==
X-Gm-Message-State: AOAM530oelGJhbVfcmWXFThTM3fADOSvrNZ9EmjrFnvPxzs/h3+b5+mF
 UTUesZ4TxVuF40v8/eVDOMA=
X-Google-Smtp-Source: ABdhPJxAsRAMbIzHHj/Ed3LvJkZlf4FF0RfKH5Dp1keOWfcgnzWXvG4XMG7H/toqjj/UbYurNiU/KA==
X-Received: by 2002:a2e:9ad7:: with SMTP id p23mr190619ljj.465.1608228437792; 
 Thu, 17 Dec 2020 10:07:17 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.gmail.com with ESMTPSA id u5sm655596lff.78.2020.12.17.10.07.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 10:07:17 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Peter Geis <pgwipeout@gmail.com>,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Kevin Hilman <khilman@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Viresh Kumar <vireshk@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH v2 00/48] Introduce core voltage scaling for NVIDIA Tegra20/30
 SoCs
Date: Thu, 17 Dec 2020 21:05:50 +0300
Message-Id: <20201217180638.22748-1-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 18 Dec 2020 08:31:48 +0000
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
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Introduce core voltage scaling for NVIDIA Tegra20/30 SoCs, which reduces
power consumption and heating of the Tegra chips. Tegra SoC has multiple
hardware units which belong to a core power domain of the SoC and share
the core voltage. The voltage must be selected in accordance to a minimum
requirement of every core hardware unit.

The minimum core voltage requirement depends on:

  1. Clock enable state of a hardware unit.
  2. Clock frequency.
  3. Unit's internal idling/active state.

This series is tested on Acer A500 (T20), AC100 (T20), Nexus 7 (T30),
Ouya (T30), TK1 (T124) and some others. I also added voltage scaling to
the Ventana (T20) and Cardhu (T30) boards which are tested by NVIDIA's CI
farm. Tegra30 is now couple degrees cooler on Nexus 7 and stays cool on
Ouya (instead of becoming burning hot) while system is idling. It should
be possible to improve this further by implementing a more advanced power
management features for the kernel drivers.

The DVFS support is opt-in for all boards, meaning that older DTBs will
continue to work like they did it before this series. It should be possible
to easily add the core voltage scaling support for Tegra114+ SoCs based on
this grounding work later on, if anyone will want to implement it.

Changelog:

v2: - Replaced Core voltage regulator with a Core power domain. The voltage
      control is now done using GENPD API. This was suggested by Ulf Hansson.

    - Added basic runtime PM and GENPD support to 2d, 3d, host1x and clk
      drivers.

    - Added new core-power-domain and clk-device drivers. Some high-freq
      PLLs and clocks require a higher minimum core voltage and the new
      clk-device driver manages the voltage for these clocks based on
      the clock state.

    - Moved voltage scaling entirely to the new clk-device driver for devices
      which don't require advanced power management, like PWM for example.

    - Added devm_tegra_core_dev_init_opp_table() common helper which sets up
      OPP table for Tegra drivers.

    - Added resource-managed version for OPP API functions, as it was
      discussed previously in the comments to v1.

    - Added new APIs, features and fixed various bugs related to voltage
      scaling and power management done via GENPD API.

Dmitry Osipenko (48):
  dt-bindings: memory: tegra20: emc: Replace core regulator with power
    domain
  dt-bindings: memory: tegra30: emc: Replace core regulator with power
    domain
  dt-bindings: memory: tegra124: emc: Replace core regulator with power
    domain
  dt-bindings: host1x: Document OPP and power domain properties
  media: dt: bindings: tegra-vde: Document OPP and power domain
    properties
  dt-bindings: clock: tegra: Document clocks sub-node
  dt-bindings: arm: tegra: Add binding for core power domain
  regulator: Make regulator_sync_voltage() usable by coupled regulators
  opp: Add dev_pm_opp_sync_regulators()
  opp: Add dev_pm_opp_set_voltage()
  opp: Add dev_pm_opp_find_level_ceil()
  opp: Add dev_pm_opp_get_required_pstate()
  opp: Add resource-managed versions of OPP API functions
  opp: Filter out OPPs based on availability of a required-OPP
  opp: Support set_opp() customization without requiring to use
    regulators
  opp: Handle missing OPP table in dev_pm_opp_xlate_performance_state()
  opp: Correct debug message in _opp_add_static_v2()
  opp: Print OPP level in debug message of _opp_add_static_v2()
  opp: Fix adding OPP entries in a wrong order if rate is unavailable
  PM: domains: Make set_performance_state() callback optional
  PM: domains: Add "performance" column to debug summary
  soc/tegra: pmc: Fix imbalanced clock disabling in error code path
  soc/tegra: pmc: Pulse resets after removing power clamp
  soc/tegra: pmc: Ensure that clock rates aren't too high
  soc/tegra: pmc: Print out domain name when reset fails to acquire
  soc/tegra: Add devm_tegra_core_dev_init_opp_table()
  soc/tegra: Add CONFIG_SOC_TEGRA_COMMON and select PM_OPP by default
  soc/tegra: Introduce core power domain driver
  soc/tegra: pmc: Link domains to the parent Core domain
  soc/tegra: regulators: Fix locking up when voltage-spread is out of
    range
  soc/tegra: regulators: Support Core domain state syncing
  clk: tegra: Support runtime PM, power domain and OPP
  gpu: host1x: Add host1x_channel_stop()
  gpu: host1x: Support power management
  drm/tegra: dc: Support OPP and SoC core voltage scaling
  drm/tegra: gr2d: Correct swapped device-tree compatibles
  drm/tegra: gr2d: Support OPP and power management
  drm/tegra: g3d: Support OPP and power management
  drm/tegra: vic: Stop channel before suspending
  media: staging: tegra-vde: Support OPP and generic power domain
  memory: tegra20-emc: Use devm_tegra_core_dev_init_opp_table()
  memory: tegra30-emc: Use devm_tegra_core_dev_init_opp_table()
  ARM: tegra: Add OPP tables and power domains to Tegra20 device-tree
  ARM: tegra: Add OPP tables and power domains to Tegra30 device-tree
  ARM: tegra: acer-a500: Enable core voltage scaling
  ARM: tegra: ventana: Enable core voltage scaling
  ARM: tegra: ventana: Support CPU voltage scaling and thermal
    throttling
  ARM: tegra: cardhu: Support CPU voltage scaling and thermal throttling

 .../arm/tegra/nvidia,tegra20-core-domain.yaml |   48 +
 .../bindings/clock/nvidia,tegra20-car.txt     |   26 +
 .../bindings/clock/nvidia,tegra30-car.txt     |   26 +
 .../display/tegra/nvidia,tegra20-host1x.txt   |   49 +
 .../bindings/media/nvidia,tegra-vde.txt       |   12 +
 .../nvidia,tegra124-emc.yaml                  |    6 +-
 .../memory-controllers/nvidia,tegra20-emc.txt |    4 +-
 .../nvidia,tegra30-emc.yaml                   |    6 +-
 .../boot/dts/tegra20-acer-a500-picasso.dts    |    8 +-
 arch/arm/boot/dts/tegra20-colibri.dtsi        |    6 +-
 arch/arm/boot/dts/tegra20-harmony.dts         |    6 +-
 arch/arm/boot/dts/tegra20-paz00.dts           |   46 +-
 .../arm/boot/dts/tegra20-peripherals-opp.dtsi |  941 +++++++++++
 arch/arm/boot/dts/tegra20-seaboard.dts        |    6 +-
 arch/arm/boot/dts/tegra20-tamonten.dtsi       |    6 +-
 arch/arm/boot/dts/tegra20-trimslice.dts       |   12 +
 arch/arm/boot/dts/tegra20-ventana.dts         |   78 +-
 arch/arm/boot/dts/tegra20.dtsi                |  220 +++
 .../tegra30-asus-nexus7-grouper-common.dtsi   |    4 +
 arch/arm/boot/dts/tegra30-beaver.dts          |    4 +
 arch/arm/boot/dts/tegra30-cardhu.dtsi         |   81 +-
 arch/arm/boot/dts/tegra30-colibri.dtsi        |   20 +-
 arch/arm/boot/dts/tegra30-ouya.dts            |    4 +
 .../arm/boot/dts/tegra30-peripherals-opp.dtsi | 1412 +++++++++++++++++
 arch/arm/boot/dts/tegra30.dtsi                |  358 +++++
 drivers/base/power/domain.c                   |   33 +-
 drivers/clk/tegra/Makefile                    |    1 +
 drivers/clk/tegra/clk-device.c                |  222 +++
 drivers/clk/tegra/clk-divider.c               |    2 +-
 drivers/clk/tegra/clk-periph-gate.c           |    2 +-
 drivers/clk/tegra/clk-periph.c                |    2 +-
 drivers/clk/tegra/clk-pll.c                   |    2 +-
 drivers/clk/tegra/clk-super.c                 |    4 +-
 drivers/clk/tegra/clk-tegra-periph.c          |  140 +-
 drivers/clk/tegra/clk-tegra114.c              |    1 +
 drivers/clk/tegra/clk-tegra124.c              |    1 +
 drivers/clk/tegra/clk-tegra20-emc.c           |    2 +-
 drivers/clk/tegra/clk-tegra20.c               |  123 +-
 drivers/clk/tegra/clk-tegra210.c              |    1 +
 drivers/clk/tegra/clk-tegra30.c               |  133 +-
 drivers/clk/tegra/clk.c                       |   89 ++
 drivers/clk/tegra/clk.h                       |    7 +
 drivers/gpu/drm/tegra/dc.c                    |   66 +-
 drivers/gpu/drm/tegra/gr2d.c                  |   77 +-
 drivers/gpu/drm/tegra/gr3d.c                  |  264 ++-
 drivers/gpu/drm/tegra/vic.c                   |   15 +
 drivers/gpu/host1x/channel.c                  |    8 +
 drivers/gpu/host1x/dev.c                      |  102 +-
 drivers/memory/tegra/tegra20-emc.c            |   57 +-
 drivers/memory/tegra/tegra30-emc.c            |   57 +-
 drivers/opp/core.c                            |  390 ++++-
 drivers/opp/of.c                              |   34 +-
 drivers/opp/opp.h                             |    2 +-
 drivers/regulator/core.c                      |    6 +
 drivers/soc/tegra/Kconfig                     |   19 +
 drivers/soc/tegra/Makefile                    |    1 +
 drivers/soc/tegra/common.c                    |  137 ++
 drivers/soc/tegra/core-power-domain.c         |  125 ++
 drivers/soc/tegra/pmc.c                       |  122 +-
 drivers/soc/tegra/regulators-tegra20.c        |   19 +-
 drivers/soc/tegra/regulators-tegra30.c        |   20 +-
 drivers/staging/media/tegra-vde/vde.c         |   63 +-
 include/linux/host1x.h                        |    1 +
 include/linux/pm_opp.h                        |   81 +
 include/soc/tegra/common.h                    |   41 +
 65 files changed, 5458 insertions(+), 403 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-core-domain.yaml
 create mode 100644 drivers/clk/tegra/clk-device.c
 create mode 100644 drivers/soc/tegra/core-power-domain.c

-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
