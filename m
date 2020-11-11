Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 997EF2AEA70
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 08:55:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62DAC89EB4;
	Wed, 11 Nov 2020 07:54:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC04289D42
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 01:15:09 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id c9so517588wml.5
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 17:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yWy0jS3uOBmOClD+6tlZ3ZyzkxvorDo2b8v+9CLbSUY=;
 b=ZeXs811qmAd8eFTi3qIsbEfXYdu2cgoWjmZTdwr17unMQcI5e15tFGnNjAor8PUQYv
 ldXZ9w3u4wX2Iij5QDdvNOS0obd/0MgzNaO20nssVCtadSAeyxsdCPzwgQssVx/rl+Zh
 pjZ/+nDS0K5TJnIsM4ZWXEslg3ZhBP+YD38lYww9cleitLMR43ddnfncUUkWLyLs+u28
 RlFBcxgBZRx6NUFWZXtZ1qP2r08q6P4hnvmeoijdDelfgObkGk5MFwiAjYUjIrmzkW+E
 HVxi/DZYNd558CoMlIUhaUTIobalgek/Seeh5kKWxW6YDztIpm/vyFoOXNaO50kUZJhp
 r/Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yWy0jS3uOBmOClD+6tlZ3ZyzkxvorDo2b8v+9CLbSUY=;
 b=VjbS1FRhDxJohW7W5tZIAzi3YMN2vqRwc19KNj9WSsRnlK3SoauAU6OTfJ+yoq0H0X
 lIsioHcXHesMuypRUVq4bLcoAI7+JtLTmTpubg0ryGzpaCHuo7mXvxwSAsr8qg33rniP
 OIwEaBjT3JzzEagJDviZcR+75hEsycp5mQAwdsX601gS1iAGSk2hPg60cvJgZl2cCEpC
 4ftGSGXkizStnjAAZ0OlV4Uis7uY4pcW5+P16s9JrIrpb3tWmKbHa6On9N38ebPE5JDX
 dq9zpV0IS4l0lnKr9hvA3xWInlv8Q3C0hlkdSUbpifnhcP1VUu/CrbXloQKoeEDfQ3m5
 HLJQ==
X-Gm-Message-State: AOAM532pVj4AA10IOyoDw6K/q7DQIOMhQtALaeNpfwpwxo/g02Sh183P
 zaftjanusshfYUaubFe05fE=
X-Google-Smtp-Source: ABdhPJwfFe41HRMpB4RcaGsjLNpSv1VBTsXR2iVFVBGsBpIcOU2lcc40D6Nj2ZSCL+ZpUoRkL1c9xg==
X-Received: by 2002:a1c:bd0b:: with SMTP id n11mr918758wmf.111.1605057308488; 
 Tue, 10 Nov 2020 17:15:08 -0800 (PST)
Received: from localhost.localdomain (109-252-193-159.dynamic.spd-mgts.ru.
 [109.252.193.159])
 by smtp.gmail.com with ESMTPSA id g131sm564329wma.35.2020.11.10.17.15.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 17:15:07 -0800 (PST)
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
Subject: [PATCH v8 00/26] Introduce memory interconnect for NVIDIA Tegra SoCs
Date: Wed, 11 Nov 2020 04:14:30 +0300
Message-Id: <20201111011456.7875-1-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 11 Nov 2020 07:54:43 +0000
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

v8: - Patches that are already applied by Krzysztof Kozlowski not included.

    - Removed tegra20-devfreq.c from MAINTAINERS, suggested by Chanwoo Choi.

    - The patch "memory: tegra20-emc: Add devfreq support" now removes
      PM_OPP for Tegra20 EMC driver from Kconfig, suggested by Chanwoo Choi.

    - Now using devm_devfreq_add_device() for Tegra20 devfreq, suggested by
      Chanwoo Choi.

    - Added acks from Chanwoo Choi. Although, devfreq patches probably
      should go via devfreq tree in order to avoid conflicts with the
      other previously-applied patches by Chanwoo.

    - Dropped superfluous dev_pm_opp_get_opp_table() from patch "devfreq:
      tegra30: Support interconnect and OPPs from device-tree".

    - Silenced another minor W=1 compilation warning reported by kernel
      test robot.

    - Added couple extra minor clean-up changes, including those that will
      ease further code changes. Added these new patches:

        memory: tegra20-emc: Remove IRQ number from error message
        memory: tegra20-emc: Factor out clk initialization
        memory: tegra30-emc: Factor out clk initialization

      Note that some of the new T124 changes are compile-tested only,
      but I expect that we will re-test them fully soon.

    - Added patch that fixes compilation of a non-Tegra kernels.

        memory: tegra: Correct stub of devm_tegra_memory_controller_get()

    - Replaced dev_pm_opp_get_opp_table() with dev_pm_opp_set_clkname(),
      as was suggested by Viresh Kumar in other thread.

    - Added patch that will allow T124 EMC driver to probe even if DT
      doesn't have memory timings, this was missed by accident previously.

        memory: tegra124-emc: Continue probing if timings are missing in device-tree

Dmitry Osipenko (26):
  memory: tegra: Correct stub of devm_tegra_memory_controller_get()
  memory: tegra20-emc: Use dev_pm_opp_set_clkname()
  memory: tegra20-emc: Factor out clk initialization
  memory: tegra20-emc: Add devfreq support
  memory: tegra20-emc: Remove IRQ number from error message
  memory: tegra30: Add FIFO sizes to memory clients
  memory: tegra30-emc: Make driver modular
  memory: tegra30-emc: Continue probing if timings are missing in
    device-tree
  memory: tegra30: Support interconnect framework
  memory: tegra30-emc: Factor out clk initialization
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
  ARM: tegra: Add DVFS properties to Tegra20 EMC device-tree node
  ARM: tegra: Add DVFS properties to Tegra30 EMC and ACTMON device-tree
    nodes
  ARM: tegra: Add DVFS properties to Tegra124 EMC and ACTMON device-tree
    nodes

 MAINTAINERS                                   |   1 -
 arch/arm/boot/dts/tegra124-apalis-emc.dtsi    |   8 +
 .../arm/boot/dts/tegra124-jetson-tk1-emc.dtsi |   8 +
 arch/arm/boot/dts/tegra124-nyan-big-emc.dtsi  |  10 +
 .../arm/boot/dts/tegra124-nyan-blaze-emc.dtsi |  10 +
 .../boot/dts/tegra124-peripherals-opp.dtsi    | 419 ++++++++++++++++++
 arch/arm/boot/dts/tegra124.dtsi               |  31 ++
 .../boot/dts/tegra20-acer-a500-picasso.dts    |   7 +
 arch/arm/boot/dts/tegra20-colibri.dtsi        |   4 +
 arch/arm/boot/dts/tegra20-paz00.dts           |   6 +
 .../arm/boot/dts/tegra20-peripherals-opp.dtsi |  92 ++++
 arch/arm/boot/dts/tegra20.dtsi                |  33 +-
 .../tegra30-asus-nexus7-grouper-common.dtsi   |   4 +
 ...30-asus-nexus7-grouper-memory-timings.dtsi |  12 +
 .../arm/boot/dts/tegra30-peripherals-opp.dtsi | 383 ++++++++++++++++
 arch/arm/boot/dts/tegra30.dtsi                |  33 +-
 drivers/clk/tegra/Makefile                    |   3 +-
 drivers/clk/tegra/clk-tegra124-emc.c          |  41 +-
 drivers/clk/tegra/clk-tegra124.c              |  27 +-
 drivers/clk/tegra/clk.h                       |  16 +-
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
 drivers/memory/tegra/Kconfig                  |   9 +-
 drivers/memory/tegra/mc.c                     |   3 +
 drivers/memory/tegra/tegra124-emc.c           | 395 +++++++++++++++--
 drivers/memory/tegra/tegra124.c               |  82 +++-
 drivers/memory/tegra/tegra20-emc.c            | 192 ++++++--
 drivers/memory/tegra/tegra30-emc.c            | 406 +++++++++++++++--
 drivers/memory/tegra/tegra30.c                | 239 +++++++++-
 include/linux/clk/tegra.h                     |   8 +
 include/soc/tegra/emc.h                       |  16 -
 include/soc/tegra/mc.h                        |   2 +-
 41 files changed, 2971 insertions(+), 436 deletions(-)
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
