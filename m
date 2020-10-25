Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 054E02987EA
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 09:09:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CC326E96D;
	Mon, 26 Oct 2020 08:09:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81E956E0CA
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 22:17:50 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id 184so9417016lfd.6
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 15:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lS31qqXjb2nZNMfqmorVKbOrq/mtt3uPoJRjR59Ynbg=;
 b=FqrBJE7iHMH6ooAcFQ6eNTa5IqjGgCRuhBBffEGVIgYhsvRoakNcsLFVISTaKRaJpc
 zIrsqjrq7CS30eXUq66XR1cUjk/bp9btwY55Zn3qYCr5Zru/BhWnZxOv+ESk3ACDBJqm
 4qF0t34EYl9JaqAmHv0PHP0GGK5g3eQZMdg5GomqppTWj9Q/TNJCV5zl32//YU6oVqxF
 BLlSGAZ0DBfE+qx4yADs9ViLgZaZ9wWs6YyIBF/6MVVMkiruvFL1AGeLP/KottT9jpNb
 8PkSLc2fo5wv7yTLZHksWsmiQezLmjz9UTsZHJbLl/+8+/9gjR4YdM+Fjsxl1aiO8ohC
 crsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lS31qqXjb2nZNMfqmorVKbOrq/mtt3uPoJRjR59Ynbg=;
 b=FwQD0uoZ/wK24pacIFOYohMZTLmQBHwUJgV6nC+vRW1dj5p+3v6yq6KQlcJnKqM+X4
 lq5rl30MrKz1Zhe60cnTHTjqdJg8eMQvdARUeO5Jrv5L7N0uDsH2R6DhtrV+TS3zCXN9
 tkZd+fDqRxn99eXzQ7RnzQti9KFkMEIbR+tX8Sw7Qo0YMV+Jpug6uTqqLyHPq/F6LopG
 dTb1FWj6pdubIG7U6r4WP8s58az0V3NCMMfVaX/4UDUr7y1N5F5Zyl2wMIIhd5XQ/z+/
 If6Vy4sAbqkmoo2/sMHlHRnh/sTCjLBAmkFxZiMJ33X8Tt6xXUQy856avNujdFvFVmcC
 9F5A==
X-Gm-Message-State: AOAM5304aa8Ri5CKG+GITVEnodNtgFtblsjMLIdupKyWrYKB2Xfp44QJ
 FX38CNZD9KaxVNPgFrWtP2k=
X-Google-Smtp-Source: ABdhPJyoum9/8vjz3AMEGaeRQfpM3ifxVNWuDQSt4eFHVVUNlJaXmct21ZPdSztWbjRpzkZpi84I5g==
X-Received: by 2002:a19:64b:: with SMTP id 72mr3954478lfg.47.1603664268545;
 Sun, 25 Oct 2020 15:17:48 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-186.dynamic.spd-mgts.ru.
 [109.252.193.186])
 by smtp.gmail.com with ESMTPSA id k13sm932423ljh.136.2020.10.25.15.17.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Oct 2020 15:17:47 -0700 (PDT)
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
Subject: [PATCH v6 00/52] Introduce memory interconnect for NVIDIA Tegra SoCs
Date: Mon, 26 Oct 2020 01:16:43 +0300
Message-Id: <20201025221735.3062-1-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 26 Oct 2020 08:08:06 +0000
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

This series brings initial support for memory interconnect to Tegra20,
Tegra30 and Tegra124 SoCs.

For the starter only display controllers and devfreq devices are getting
interconnect API support, others could be supported later on. The display
controllers have the biggest demand for interconnect API right now because
dynamic memory frequency scaling can't be done safely without taking into
account bandwidth requirement from the displays. In particular this series
fixes distorted display output on T30 Ouya and T124 TK1 devices.

Changelog:

v6: - This series was massively reworked in comparison to v5, most of the
      patches that previously got r-b need a new round of a review (!).

    - Added missed clk-rounding to the set() callback of EMC ICC providers.
      Now clk_set_min_rate() doesn't error out on rate overflow.

    - Now peak bandwidth is properly taken into account by the set() callback
      of EMC ICC providers.

    - EMC runs at 2x of the DRAM bus only on Tegra20, this now taken in account
      properly by the EMC ICC set() callbacks.

    - ICC drivers use new icc_sync_state() and xlate_extended().

    - ICC drivers support new TEGRA_MC_ICC_TAG_ISO for ICC paths, which
      conveys to ICC driver that memory path uses isochronous transfers.

    - Added support for memory latency scaling to Tegra30 ICC provider.
      It's required for fixing display FIFO underflows on T30.

    - Added basic interconnect support to Tegra124 drivers.

    - Tegra20/30/124 EMC drivers now support voltage scaling using generic
      OPP API.

    - The display bandwidth management is reworked and improved. It now
      supports both bandwidth and latency allocations. The nv-display is
      now also taken into account properly, i.e. it's kept untouched.
      The extra bandwidth reservation required for ISO clients is moved
      from DC driver to the ICC drivers.

    - Dropped patch that tuned T20 display controller memory client because
      turned out that it kills ~30% of memory bandwidth. It should be possible
      to support client tuning, but it's too complicated for now.

    - Corrected display's cursor and winb-vfilter ICC clients.
      The winb-vfilter was erroneously used in place of cursor's client
      in device-trees.

    - Added devm_tegra_get_memory_controller() and switched drivers to
      use it.

    - Device-tree OPP tables are now supported by memory and devfreq
      drivers.

    - Tegra20-devfeq driver is reworked and now uses EMC-stats instead
      of IMC-stats (which are nearly identical modules) because previously
      I failed to understand how EMC-stats work and succeeded this time,
      thinking that it simply doesn't work. This removes a bit icky dependency
      on using both EMC and MC drivers simultaneously by the devfreq driver.

    - Tegra20-devfeq driver now is a sub-device of the EMC, it also now uses
      interconnect API for driving memory bandwidth.

    - Tegra30-devfreq got interconnect support.

    - Devfreq patches now use dev_err_probe(), which was suggested by
      Chanwoo Choi.

    - Added acks from Chanwoo Choi and Rob Herring to the reviewed and
      unchanged patches.

    - Added tested-by from Peter Geis and Nicolas Chauvet, who tested this
      series on Ouya and TK1 devices, reporting that it fixes display
      corruption on these devices which happened due to insufficient memory
      bandwidth.

    - Added patches to fix T20 EMC registers size.

    - Fixed missing LA entry for PTC in the Tegra MC drivers.

    - New and updated patches in v6:

        dt-bindings: memory: tegra20: emc: Correct registers range in example
        dt-bindings: memory: tegra20: emc: Document nvidia,memory-controller property
        dt-bindings: memory: tegra20: emc: Document OPP table and voltage regulator
        dt-bindings: memory: tegra20: emc: Document mfd-simple compatible and statistics sub-device
        dt-bindings: memory: tegra30: emc: Document OPP table and voltage regulator
        dt-bindings: memory: tegra124: mc: Document new interconnect property
        dt-bindings: memory: tegra124: emc: Document new interconnect property
        dt-bindings: memory: tegra124: emc: Document OPP table and voltage regulator
        dt-bindings: tegra30-actmon: Document OPP and interconnect properties
        dt-bindings: memory: tegra124: Add memory client IDs
        ARM: tegra: Correct EMC registers size in Tegra20 device-tree
        ARM: tegra: Add interconnect properties to Tegra124 device-tree
        ARM: tegra: Add nvidia,memory-controller phandle to Tegra20 EMC device-tree
        ARM: tegra: Add DVFS properties to Tegra20 EMC device-tree node
        ARM: tegra: Add DVFS properties to Tegra30 EMC and ACTMON device-tree nodes
        ARM: tegra: Add DVFS properties to Tegra124 EMC and ACTMON device-tree nodes
        memory: tegra: Add and use devm_tegra_get_memory_controller()
        memory: tegra-mc: Add interconnect framework
        memory: tegra20: Support interconnect framework
        memory: tegra20-emc: Skip parsing of emc-stats DT sub-node
        memory: tegra: Add missing latency allowness entry for Page Table Cache
        memory: tegra: Add FIFO sizes to Tegra30 memory clients
        memory: tegra30: Support interconnect framework
        memory: tegra124-emc: Make driver modular
        memory: tegra124: Support interconnect framework
        memory: tegra: Remove superfluous error messages around platform_get_irq()
        drm/tegra: dc: Support memory bandwidth management
        drm/tegra: dc: Extend debug stats with total number of events
        PM / devfreq: tegra20: Convert to EMC_STAT driver, support interconnect and device-tree
        PM / devfreq: tegra30: Support interconnect and OPPs from device-tree
        PM / devfreq: tegra30: Separate configurations per-SoC generation
        opp: Put interconnect paths outside of opp_table_lock

v5: - The devfreq drivers now won't probe if memory timings aren't specified
      in a device-tree, like was suggested by Chanwoo Choi in a review comment
      to v4. Initially I wanted to always probe the driver even with a single
      fixed memory freq, but after a closer look turned out it can't be done
      easily for Tegra20 driver.

    - The "interconnect: Relax requirement in of_icc_get_from_provider()"
      patch was already applied, hence one less patch in comparison to v4.

    - Renamed display interconnect paths in accordance to the names that
      were used by Thierry Reding in one of his recent patches that supposed
      to update the Host1x's DT binding.

    - Added acks from Chanwoo Choi.

    - Added clarifying comment to tegra_mc_icc_set() about why it's a dummy
      function, this is done in a response to the review comment made by
      Georgi Djakov to v4.

v4: - All drivers that use interconnect API now select it in the Kconfig in
      order to properly express the build dependency.

    - The IS_ENABLED(CONFIG_INTERCONNECT) is dropped now from all patches.

    - Added MODULE_AUTHOR() to the modularized drivers, for completeness.

    - Added missed TEGRA_MC Kconfig dependency for the Tegra20 EMC driver.

    - Added more acks from Rob Herring that I accidentally missed to add in v3.

v3: - Added acks from Rob Herring that were given to some of the v2 patches.

    - Specified name of the TRM documentation chapter in the patch
      "dt-bindings: host1x: Document new interconnect properties", which was
      suggested by Rob Herring in the review comment to v2.

    - Added patches that allow EMC drivers to be compiled as a loadable kernel
      modules. This came up during of the v2 review when Georgi Djakov pointed
      out that interconnect-core could be compiled as a kernel module. Please
      note that the Tegra124 EMC driver is compile-tested only, I don't have
      Tegra124 HW.

    - In the review comment to [1] Stephen Boyd suggested that it will be
      better not to make changes to clk API, which was needed in order to
      avoid clashing of the interconnect driver with the devfreq in regards
      to memory clk-rate rounding.

      [1] https://patchwork.ozlabs.org/project/linux-tegra/patch/20200330231617.17079-3-digetx@gmail.com/

      Stephen Boyd suggested that instead we should provide OPP table via DT.
      I tried to investigate whether this could be done and turned out
      it's a bit complicated. Technically it should be doable, but:

        1. For now we don't fully support voltage scaling of the CORE regulator
           and so OPP table in the DT isn't really needed today. We can
           generate table from the memory timings, which is what Tegra devfreq
           drivers already do.

        2. The OPP table should be defined in the DT for the Memory Controller
           node and then its usage somehow should be shared by both interconnect
           and devfreq drivers. It's not obvious what's the best way to do it.

      So, it will be much better to postpone the DT OPP table addition
      until these questions are resolved. We can infer OPPs from the
      memory timings and we could get the memory rates from the memory
      driver directly, avoiding the problems induced by the clk API usage.
      This idea is implemented in v3, see these patches:

        PM / devfreq: tegra20: Use MC timings for building OPP table
        PM / devfreq: tegra30: Use MC timings for building OPP table

v2: - Instead of a single dma-mem interconnect path, the paths are now
      defined per memory client.

    - The EMC provider now uses #interconnect-cells=<0>.

    - Dropped Tegra124 because there is no enough information about how to
      properly calculate required EMC clock rate for it and I don't have
      hardware for testing. Somebody else will have to work on it.

    - Moved interconnect providers code into drivers/memory/tegra/*.

    - Added "Create tegra20-devfreq device" patch because interconnect
      is not very usable without the devfreq memory auto-scaling since
      memory freq will be fixed to the display's requirement.

Dmitry Osipenko (52):
  clk: tegra: Export Tegra20 EMC kernel symbols
  soc/tegra: fuse: Export tegra_read_ram_code()
  dt-bindings: memory: tegra20: emc: Correct registers range in example
  dt-bindings: memory: tegra20: emc: Document nvidia,memory-controller
    property
  dt-bindings: memory: tegra20: mc: Document new interconnect property
  dt-bindings: memory: tegra20: emc: Document new interconnect property
  dt-bindings: memory: tegra20: emc: Document OPP table and voltage
    regulator
  dt-bindings: memory: tegra20: emc: Document mfd-simple compatible and
    statistics sub-device
  dt-bindings: memory: tegra30: mc: Document new interconnect property
  dt-bindings: memory: tegra30: emc: Document new interconnect property
  dt-bindings: memory: tegra30: emc: Document OPP table and voltage
    regulator
  dt-bindings: memory: tegra124: mc: Document new interconnect property
  dt-bindings: memory: tegra124: emc: Document new interconnect property
  dt-bindings: memory: tegra124: emc: Document OPP table and voltage
    regulator
  dt-bindings: tegra30-actmon: Document OPP and interconnect properties
  dt-bindings: host1x: Document new interconnect properties
  dt-bindings: memory: tegra20: Add memory client IDs
  dt-bindings: memory: tegra30: Add memory client IDs
  dt-bindings: memory: tegra124: Add memory client IDs
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
  memory: tegra: Add and use devm_tegra_get_memory_controller()
  memory: tegra-mc: Add interconnect framework
  memory: tegra20-emc: Make driver modular
  memory: tegra20-emc: Use devm_platform_ioremap_resource()
  memory: tegra20-emc: Continue probing if timings are missing in
    device-tree
  memory: tegra20: Support interconnect framework
  memory: tegra20-emc: Don't parse emc-stats node
  memory: tegra: Add missing latency allowness entry for Page Table
    Cache
  memory: tegra: Add FIFO sizes to Tegra30 memory clients
  memory: tegra30-emc: Make driver modular
  memory: tegra30-emc: Continue probing if timings are missing in
    device-tree
  memory: tegra30: Support interconnect framework
  memory: tegra124-emc: Make driver modular
  memory: tegra124-emc: Use devm_platform_ioremap_resource()
  memory: tegra124: Support interconnect framework
  memory: tegra: Remove superfluous error messages around
    platform_get_irq()
  drm/tegra: dc: Support memory bandwidth management
  drm/tegra: dc: Extend debug stats with total number of events
  opp: Put interconnect paths outside of opp_table_lock
  PM / devfreq: tegra20: Silence deferred probe error
  PM / devfreq: tegra20: Relax Kconfig dependency
  PM / devfreq: tegra20: Convert to EMC_STAT driver, support
    interconnect and device-tree
  PM / devfreq: tegra30: Silence deferred probe error
  PM / devfreq: tegra30: Support interconnect and OPPs from device-tree
  PM / devfreq: tegra30: Separate configurations per-SoC generation

 .../arm/tegra/nvidia,tegra30-actmon.txt       |  25 ++
 .../display/tegra/nvidia,tegra20-host1x.txt   |  68 +++
 .../nvidia,tegra124-emc.yaml                  |  18 +
 .../nvidia,tegra124-mc.yaml                   |   5 +
 .../memory-controllers/nvidia,tegra20-emc.txt |  63 ++-
 .../memory-controllers/nvidia,tegra20-mc.txt  |   3 +
 .../nvidia,tegra30-emc.yaml                   |  18 +
 .../memory-controllers/nvidia,tegra30-mc.yaml |   5 +
 arch/arm/boot/dts/tegra124-apalis-emc.dtsi    |   8 +
 .../arm/boot/dts/tegra124-jetson-tk1-emc.dtsi |   8 +
 arch/arm/boot/dts/tegra124-nyan-big-emc.dtsi  |  10 +
 .../boot/dts/tegra124-peripherals-opp.dtsi    | 419 ++++++++++++++++++
 arch/arm/boot/dts/tegra124.dtsi               |  31 ++
 .../boot/dts/tegra20-acer-a500-picasso.dts    |  12 +
 arch/arm/boot/dts/tegra20-colibri.dtsi        |   8 +
 arch/arm/boot/dts/tegra20-paz00.dts           |  10 +
 .../arm/boot/dts/tegra20-peripherals-opp.dtsi | 181 ++++++++
 arch/arm/boot/dts/tegra20.dtsi                |  42 +-
 .../tegra30-asus-nexus7-grouper-common.dtsi   |  16 +
 .../arm/boot/dts/tegra30-peripherals-opp.dtsi | 383 ++++++++++++++++
 arch/arm/boot/dts/tegra30.dtsi                |  33 +-
 drivers/clk/tegra/Makefile                    |   2 +-
 drivers/clk/tegra/clk-tegra124-emc.c          |  41 +-
 drivers/clk/tegra/clk-tegra124.c              |  27 +-
 drivers/clk/tegra/clk-tegra20-emc.c           |   3 +
 drivers/clk/tegra/clk.h                       |  16 +-
 drivers/devfreq/Kconfig                       |   3 +-
 drivers/devfreq/tegra20-devfreq.c             | 186 ++++----
 drivers/devfreq/tegra30-devfreq.c             | 166 ++++---
 drivers/gpu/drm/tegra/Kconfig                 |   1 +
 drivers/gpu/drm/tegra/dc.c                    | 340 ++++++++++++++
 drivers/gpu/drm/tegra/dc.h                    |  11 +
 drivers/gpu/drm/tegra/drm.c                   |  14 +
 drivers/gpu/drm/tegra/hub.c                   |   3 +
 drivers/gpu/drm/tegra/plane.c                 | 122 +++++
 drivers/gpu/drm/tegra/plane.h                 |  15 +
 drivers/memory/tegra/Kconfig                  |  12 +-
 drivers/memory/tegra/mc.c                     | 184 +++++++-
 drivers/memory/tegra/mc.h                     |  20 +
 drivers/memory/tegra/tegra114.c               |   6 +
 drivers/memory/tegra/tegra124-emc.c           | 235 ++++++++--
 drivers/memory/tegra/tegra124.c               |  37 ++
 drivers/memory/tegra/tegra20-emc.c            | 244 ++++++++--
 drivers/memory/tegra/tegra20.c                |  34 ++
 drivers/memory/tegra/tegra210-emc-core.c      |  39 +-
 drivers/memory/tegra/tegra30-emc.c            | 245 ++++++++--
 drivers/memory/tegra/tegra30.c                | 191 ++++++++
 drivers/opp/core.c                            |  21 +-
 drivers/soc/tegra/fuse/tegra-apbmisc.c        |   2 +
 include/dt-bindings/memory/tegra124-mc.h      |  68 +++
 include/dt-bindings/memory/tegra20-mc.h       |  53 +++
 include/dt-bindings/memory/tegra30-mc.h       |  67 +++
 include/linux/clk/tegra.h                     |   9 +
 include/soc/tegra/emc.h                       |  16 -
 include/soc/tegra/mc.h                        |  26 ++
 55 files changed, 3477 insertions(+), 348 deletions(-)
 create mode 100644 arch/arm/boot/dts/tegra124-peripherals-opp.dtsi
 create mode 100644 arch/arm/boot/dts/tegra20-peripherals-opp.dtsi
 create mode 100644 arch/arm/boot/dts/tegra30-peripherals-opp.dtsi
 delete mode 100644 include/soc/tegra/emc.h

-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
