Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C712B3B05
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 02:08:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26FAA89F19;
	Mon, 16 Nov 2020 01:07:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A5796E9DF
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Nov 2020 21:33:17 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id u19so16121933lfr.7
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Nov 2020 13:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h8MxeHCuATJ53PU3I8a6+czrbv101Npis+Hx7wYKzuk=;
 b=E175ZaO5saZJgpUFcFDwuW78olO2XrOuQzlEEbEJg1BvpqE4a7qwch7OanQfFjeL4o
 ghVsnHGG13jbuGP89iiXo0M+uwar9l6qqtBQBxfY/C4A/+5km1O3bSZIjwXl9HAEPcRh
 ADTQTHcsJIRKE1UEXwho0rBcIjXBxzTfNTJ9U+LbdkzCJgRVj6nSx/OMuvLcoTRM6UGr
 ky7YVrZAaM5qB8gCYOudoT2zvTBtq5s2VJ1JGFpT7uhJJFs4QmsTf4+nMZxGNc3C88RE
 TWgoZ2FrtSFTXzFZHdKxXhZAeAzvFTXoT7sx8kmuhxhsKHnsFFAYOmt/BdAQtOd2TmLM
 Pt4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h8MxeHCuATJ53PU3I8a6+czrbv101Npis+Hx7wYKzuk=;
 b=LU1Wsqh1Jq0YJ3P8NAPYjdfIQz+FEAt5tXGAChxib0W7FSKdL6R3yFySbf9S6wziHr
 u632uQCZ3grkhTp6JHp36OzGzBOhzjpW5JhBLC0LfO0a4OaR9smD44jgHoxu43e8ynBs
 4pyfGgOcWdHnwVNDEMYuQ7nTZhoPHo/XCVRAr+2Zuu7FXCD5YHAnB/+nGNCwT8Vpb5pc
 +KbK3YxQYumIQve8CefPi3HoPzd7gIhiBFpgR8Ku/ttT4Jzs+0oAT2bbHSh4CVXq7CJx
 QP0NBSHLr4MigS4oJRInEXTVEdWG9/yUARQ9uXt7upIkdnMBZR373w7hhs2KWwP7z65P
 YnUg==
X-Gm-Message-State: AOAM533Z4y0/QY+bzFPWDEKo28ODvDucBFxXuhmarQONECx9Epr4WPeq
 31HGrTsRhqqUm0m2QD7ldJ8=
X-Google-Smtp-Source: ABdhPJw3I34vHvS+uGktSMHOB5ZzWOMlk40iewa5kpkKZ8zqF+Fcp9wbTvoQJOR09JFzFR3j3itg+g==
X-Received: by 2002:a19:c181:: with SMTP id r123mr4843928lff.335.1605475995788; 
 Sun, 15 Nov 2020 13:33:15 -0800 (PST)
Received: from localhost.localdomain (109-252-193-159.dynamic.spd-mgts.ru.
 [109.252.193.159])
 by smtp.gmail.com with ESMTPSA id o3sm2462055lfo.217.2020.11.15.13.33.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Nov 2020 13:33:15 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Mikko Perttunen <cyndis@kapsi.fi>,
 Viresh Kumar <vireshk@kernel.org>, Peter Geis <pgwipeout@gmail.com>,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v9 00/17] Introduce memory interconnect for NVIDIA Tegra SoCs
Date: Mon, 16 Nov 2020 00:29:05 +0300
Message-Id: <20201115212922.4390-1-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 16 Nov 2020 01:07:21 +0000
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series brings initial support for memory interconnect to Tegra20,
Tegra30 and Tegra124 SoCs.

For the starter only display controllers and devfreq devices are getting
interconnect API support, others could be supported later on. The display
controllers have the biggest demand for interconnect API right now because
dynamic memory frequency scaling can't be done safely without taking into
account bandwidth requirement from the displays. In particular this series
fixes distorted display output on T30 Ouya and T124 TK1 devices.

Changelog:

v9: - Squashed "memory: tegra30-emc: Factor out clk initialization" into
      patch "tegra30: Support interconnect framework".
      Suggested by Krzysztof Kozlowski.

    - Improved Kconfig in the patch "memory: tegra124-emc: Make driver modular"
      by adding CONFIG_TEGRA124_CLK_EMC entry, which makes clk-driver changes
      to look a bit more cleaner. Suggested by Krzysztof Kozlowski.

    - Dropped voltage regulator support from ICC and DT patches for now
      because there is a new discussion about using a power domain abstraction
      for controlling the regulator, which is likely to happen.

    - Replaced direct "operating-points-v2" property checking in EMC drivers
      with checking of a returned error code from dev_pm_opp_of_add_table().
      Note that I haven't touched T20 EMC driver because it's very likely
      that we'll replace that code with a common helper soon anyways.
      Suggested by Viresh Kumar.

    - The T30 DT patches now include EMC OPP changes for Ouya board, which
      is available now in linux-next.

Dmitry Osipenko (17):
  memory: tegra30: Support interconnect framework
  memory: tegra124-emc: Make driver modular
  memory: tegra124-emc: Continue probing if timings are missing in
    device-tree
  memory: tegra124: Support interconnect framework
  drm/tegra: dc: Support memory bandwidth management
  drm/tegra: dc: Extend debug stats with total number of events
  PM / devfreq: tegra30: Support interconnect and OPPs from device-tree
  PM / devfreq: tegra30: Separate configurations per-SoC generation
  PM / devfreq: tegra20: Deprecate in a favor of emc-stat based driver
  ARM: tegra: Correct EMC registers size in Tegra20 device-tree
  ARM: tegra: Add interconnect properties to Tegra20 device-tree
  ARM: tegra: Add interconnect properties to Tegra30 device-tree
  ARM: tegra: Add interconnect properties to Tegra124 device-tree
  ARM: tegra: Add nvidia,memory-controller phandle to Tegra20 EMC
    device-tree
  ARM: tegra: Add EMC OPP properties to Tegra20 device-trees
  ARM: tegra: Add EMC OPP and ICC properties to Tegra30 EMC and ACTMON
    device-tree nodes
  ARM: tegra: Add EMC OPP and ICC properties to Tegra124 EMC and ACTMON
    device-tree nodes

 MAINTAINERS                                   |   1 -
 arch/arm/boot/dts/tegra124-apalis-emc.dtsi    |   8 +
 .../arm/boot/dts/tegra124-jetson-tk1-emc.dtsi |   8 +
 arch/arm/boot/dts/tegra124-nyan-big-emc.dtsi  |  10 +
 .../arm/boot/dts/tegra124-nyan-blaze-emc.dtsi |  10 +
 .../boot/dts/tegra124-peripherals-opp.dtsi    | 419 ++++++++++++++++++
 arch/arm/boot/dts/tegra124.dtsi               |  31 ++
 .../boot/dts/tegra20-acer-a500-picasso.dts    |   5 +
 arch/arm/boot/dts/tegra20-colibri.dtsi        |   4 +
 arch/arm/boot/dts/tegra20-paz00.dts           |   4 +
 .../arm/boot/dts/tegra20-peripherals-opp.dtsi |  92 ++++
 arch/arm/boot/dts/tegra20.dtsi                |  33 +-
 ...30-asus-nexus7-grouper-memory-timings.dtsi |  12 +
 arch/arm/boot/dts/tegra30-ouya.dts            |   8 +
 .../arm/boot/dts/tegra30-peripherals-opp.dtsi | 383 ++++++++++++++++
 arch/arm/boot/dts/tegra30.dtsi                |  33 +-
 drivers/clk/tegra/Kconfig                     |   3 +
 drivers/clk/tegra/Makefile                    |   2 +-
 drivers/clk/tegra/clk-tegra124-emc.c          |  41 +-
 drivers/clk/tegra/clk-tegra124.c              |  26 +-
 drivers/clk/tegra/clk.h                       |  18 +-
 drivers/devfreq/Kconfig                       |  10 -
 drivers/devfreq/Makefile                      |   1 -
 drivers/devfreq/tegra20-devfreq.c             | 210 ---------
 drivers/devfreq/tegra30-devfreq.c             | 154 ++++---
 drivers/gpu/drm/tegra/Kconfig                 |   1 +
 drivers/gpu/drm/tegra/dc.c                    | 359 +++++++++++++++
 drivers/gpu/drm/tegra/dc.h                    |  19 +
 drivers/gpu/drm/tegra/drm.c                   |  14 +
 drivers/gpu/drm/tegra/hub.c                   |   3 +
 drivers/gpu/drm/tegra/plane.c                 | 121 +++++
 drivers/gpu/drm/tegra/plane.h                 |  15 +
 drivers/memory/tegra/Kconfig                  |   5 +-
 drivers/memory/tegra/tegra124-emc.c           | 382 ++++++++++++++--
 drivers/memory/tegra/tegra124.c               |  82 +++-
 drivers/memory/tegra/tegra30-emc.c            | 349 ++++++++++++++-
 drivers/memory/tegra/tegra30.c                | 173 +++++++-
 include/linux/clk/tegra.h                     |   8 +
 include/soc/tegra/emc.h                       |  16 -
 39 files changed, 2699 insertions(+), 374 deletions(-)
 create mode 100644 arch/arm/boot/dts/tegra124-peripherals-opp.dtsi
 create mode 100644 arch/arm/boot/dts/tegra20-peripherals-opp.dtsi
 create mode 100644 arch/arm/boot/dts/tegra30-peripherals-opp.dtsi
 delete mode 100644 drivers/devfreq/tegra20-devfreq.c
 delete mode 100644 include/soc/tegra/emc.h

-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
