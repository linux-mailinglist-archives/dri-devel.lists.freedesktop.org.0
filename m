Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5C02A78FE
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 09:21:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 393D26E9DA;
	Thu,  5 Nov 2020 08:20:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2280C89D9B
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 16:49:32 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id 2so23665482ljj.13
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 08:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PnbBGdMdU7ByG7NlVZaelzUtccyvcFQpxgfGRPAGq+Q=;
 b=rIm+a0oUtbiSL8GlOyWflAigGczZUjAA3ONJSyR0QbgtNSjCM40aeR5no/s3Oar6Z8
 eq7k06BTRu0j6RcwagSKjpg59e3L25TTYlyStNo5VBomVoUa1WffJZ3RmQVpRfTCOYZi
 pO0+4pkLEZH7mcB1wlqZ99lkh4kAo+nUhDuLuhwkMBkoEaJ7kV8Y2UtW0SGE4nbVTHPT
 o1LjU77mLQ6lF5rK/rrPgyPZ+V6irPz/SqNFuV26mS65tC7fhox50hLupFhvrrEFqrZ3
 HyMdgGePPmEee4IpBKyxujw23pAxtCM9uNymLe9eTcLlwrZuaO0lC1InUWiqxEgz+jfk
 cQpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PnbBGdMdU7ByG7NlVZaelzUtccyvcFQpxgfGRPAGq+Q=;
 b=kGLh4Hs/ETl5psef2yNvjzYZ2M4QUXQea5bFy0fxUml5YbN5wu87Xwk3Mf4eCV8tw+
 GQwAsTF3FFSMPxFwLZebUIEWcY50iEtTdk195YXY3ZgTp/KulHcPQuAD52fAp4+xZiLU
 Ee+pgLZ+5WPyO/3urgBQ+owJ1JGfTGVvlIHsVmUwiFZBquR9g+XikJl7Y0Mew4oOpf6h
 RqmwMf0L7cTWjx48Lo1CWIV7UauErn0zLfogDC/LvnUBgmy1NyroH5EXGh4q8Eov1st/
 ymHCvyg+Qe1eo6fqoBys+XqCLfX9WtTk7mH5zRb3a1f+OM6imVN47YkR5prpIOrU5LES
 uHqw==
X-Gm-Message-State: AOAM532D8hdvmTTAcLFuaWCiS+7OZNL7nYyMFZH6nDO/Y8guosl0RlV1
 eeYUHD9BQ5X1N8dQW7k8Vt8=
X-Google-Smtp-Source: ABdhPJyoxJhknIeTQez2e/Li8knnLnW+rv/iedaN8jx9gNKG60DnOtYbArPyldohBfsPfxy42x1B3w==
X-Received: by 2002:a2e:8787:: with SMTP id n7mr11464271lji.111.1604508570340; 
 Wed, 04 Nov 2020 08:49:30 -0800 (PST)
Received: from localhost.localdomain (109-252-192-83.dynamic.spd-mgts.ru.
 [109.252.192.83])
 by smtp.gmail.com with ESMTPSA id m2sm454587lfo.25.2020.11.04.08.49.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 08:49:29 -0800 (PST)
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
Subject: [PATCH v7 00/47] Introduce memory interconnect for NVIDIA Tegra SoCs
Date: Wed,  4 Nov 2020 19:48:36 +0300
Message-Id: <20201104164923.21238-1-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 05 Nov 2020 08:20:02 +0000
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

This series brings initial support for memory interconnect to Tegra20,
Tegra30 and Tegra124 SoCs.

For the starter only display controllers and devfreq devices are getting
interconnect API support, others could be supported later on. The display
controllers have the biggest demand for interconnect API right now because
dynamic memory frequency scaling can't be done safely without taking into
account bandwidth requirement from the displays. In particular this series
fixes distorted display output on T30 Ouya and T124 TK1 devices.

Changelog:

v7: - Corrected example in "dt-bindings: host1x: Document new interconnect
      properties".

    - Added "obj-$(CONFIG_ARCH_TEGRA_132_SOC) += clk-tegra124-emc.o"
      to "memory: tegra124-emc: Make driver modular" in order to fix
      ARM64 kernel compilation reported by kernel test robot.

    - Fixed build error reported by kernel test robot which happened due to
      a missing stub for tegra_sku_info for COMPILE_TEST drivers. Added this
      new patch:

        soc/tegra: fuse: Add stub for tegra_sku_info

    - Fixed minor W=1 warning reported by kernel test robot for the
      "drm/tegra: dc: Support memory bandwidth management" patch.

    - Changed TEGRA_MC_ICC_TAG type from a enum to bitmask in order to have
      tags more extensible in the future.

    - Fixed dt_binding_check warning in "dt-bindings: memory: tegra124: mc:
      Document new interconnect property", was reported by kernel bot.

    - Added acks/r-b from Rob Herring, Thierry Reding and Krzysztof Kozlowski
      to the reviewed patches.

    - The EMC "core-supply" property is now explicitly optional in the DT
      bindings. This change was suggested by Krzysztof Kozlowski.

    - Removed unnecessary white-spaces in the device-tree example of the patch:

        dt-bindings: memory: tegra20: emc: Document new interconnect property

      This change was suggested by Krzysztof Kozlowski.

    - Explicitly documented that core-supply is an optional property in patch:

        dt-bindings: memory: tegra20: emc: Document new interconnect property

      This change was suggested by Krzysztof Kozlowski.

    - Replaced underscores with hyphens in the DT node names. Suggested
      by Krzysztof Kozlowski.

    - Added operating-points-v2 to the required properties of the patch:

        dt-bindings: memory: tegra124: emc: Document OPP table and voltage regulator

      This was missed by accident in the v6.

    - Renamed get_memory_controller() to memory_controller_get(). Suggested
      by Krzysztof Kozlowski.

    - Changed internal ICC IDs like it was suggested by Thierry Reding in
      review comment to "memory: tegra-mc: Add interconnect framework".

    - The MC's ICC xlate_extended() now is a per-SoC hook. Suggested by
      Thierry Reding.

    - Corrected and improved the debugfs of the EMC drivers which
      transitioned to OPP table usage. The debug code now uses OPP
      API, which is must-have for voltage scaling, and min/max rate
      limits aren't changed using the clk API because OPP API should
      be used.

    - The tegra20-devfeq driver is removed and replaced with the EMC_STAT
      driver, which is now a part of the T20 EMC driver. Suggested by
      Thierry Reding. Implemented in these patches:

        memory: tegra20-emc: Add devfreq support
        PM / devfreq: tegra20: Deprecate in a favor of emc-stat based driver

    - Reordered patches, like it was suggested by Krzysztof Kozlowski by
      having patches which make smaller improvements before patches which
      add new features.

    - The EMC drivers now query actual DRAM bus width from hardware
      instead of hardcoding the default-expected value.

    - The EMC drivers now properly account clock rate requests from
      different internal sources (ICC, debugfs, etc) by selecting the
      fastest clock rate.

    - There are lots of miscellaneous minor clean-ups and improvements.
      All patches were fully re-tested.

    - Rebased patches on a recent linux-next. Fixed merge conflicts with
      the recent Tegra DRM driver changes.

    - Improved tegra30-devfeq patches by implementing suggestions from
      Chanwoo Choi. Removed unnecessary EPROBE_DEFER handling, added
      clarifying comment for the KHz conversions, improved code that
      touches ARRAY_SIZE.

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

Dmitry Osipenko (47):
  clk: tegra: Export Tegra20 EMC kernel symbols
  soc/tegra: fuse: Export tegra_read_ram_code()
  soc/tegra: fuse: Add stub for tegra_sku_info
  dt-bindings: memory: tegra20: emc: Correct registers range in example
  dt-bindings: memory: tegra20: emc: Document nvidia,memory-controller
    property
  dt-bindings: memory: tegra20: mc: Document new interconnect property
  dt-bindings: memory: tegra20: emc: Document new interconnect property
  dt-bindings: memory: tegra20: emc: Document OPP table and voltage
    regulator
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
  memory: tegra: Add and use devm_tegra_memory_controller_get()
  memory: tegra: Use devm_platform_ioremap_resource()
  memory: tegra: Remove superfluous error messages around
    platform_get_irq()
  memory: tegra: Add missing latency allowness entry for Page Table
    Cache
  memory: tegra-mc: Add interconnect framework
  memory: tegra20-emc: Make driver modular
  memory: tegra20-emc: Continue probing if timings are missing in
    device-tree
  memory: tegra20: Support interconnect framework
  memory: tegra20-emc: Add devfreq support
  memory: tegra30: Add FIFO sizes to memory clients
  memory: tegra30-emc: Make driver modular
  memory: tegra30-emc: Continue probing if timings are missing in
    device-tree
  memory: tegra30: Support interconnect framework
  memory: tegra124-emc: Make driver modular
  memory: tegra124: Support interconnect framework
  drm/tegra: dc: Support memory bandwidth management
  drm/tegra: dc: Extend debug stats with total number of events
  PM / devfreq: tegra30: Support interconnect and OPPs from device-tree
  PM / devfreq: tegra30: Separate configurations per-SoC generation
  PM / devfreq: tegra20: Deprecate in a favor of emc-stat based driver

 .../arm/tegra/nvidia,tegra30-actmon.txt       |  25 +
 .../display/tegra/nvidia,tegra20-host1x.txt   |  68 +++
 .../nvidia,tegra124-emc.yaml                  |  19 +
 .../nvidia,tegra124-mc.yaml                   |   5 +
 .../memory-controllers/nvidia,tegra20-emc.txt |  22 +-
 .../memory-controllers/nvidia,tegra20-mc.txt  |   3 +
 .../nvidia,tegra30-emc.yaml                   |  18 +
 .../memory-controllers/nvidia,tegra30-mc.yaml |   5 +
 arch/arm/boot/dts/tegra124-apalis-emc.dtsi    |   8 +
 .../arm/boot/dts/tegra124-jetson-tk1-emc.dtsi |   8 +
 arch/arm/boot/dts/tegra124-nyan-big-emc.dtsi  |  10 +
 .../arm/boot/dts/tegra124-nyan-blaze-emc.dtsi |  10 +
 .../boot/dts/tegra124-peripherals-opp.dtsi    | 419 ++++++++++++++++
 arch/arm/boot/dts/tegra124.dtsi               |  31 ++
 .../boot/dts/tegra20-acer-a500-picasso.dts    |   7 +
 arch/arm/boot/dts/tegra20-colibri.dtsi        |   4 +
 arch/arm/boot/dts/tegra20-paz00.dts           |   6 +
 .../arm/boot/dts/tegra20-peripherals-opp.dtsi |  92 ++++
 arch/arm/boot/dts/tegra20.dtsi                |  33 +-
 .../tegra30-asus-nexus7-grouper-common.dtsi   |   4 +
 ...30-asus-nexus7-grouper-memory-timings.dtsi |  12 +
 .../arm/boot/dts/tegra30-peripherals-opp.dtsi | 383 +++++++++++++++
 arch/arm/boot/dts/tegra30.dtsi                |  33 +-
 drivers/clk/tegra/Makefile                    |   3 +-
 drivers/clk/tegra/clk-tegra124-emc.c          |  41 +-
 drivers/clk/tegra/clk-tegra124.c              |  27 +-
 drivers/clk/tegra/clk-tegra20-emc.c           |   3 +
 drivers/clk/tegra/clk.h                       |  16 +-
 drivers/devfreq/Kconfig                       |  10 -
 drivers/devfreq/Makefile                      |   1 -
 drivers/devfreq/tegra20-devfreq.c             | 210 --------
 drivers/devfreq/tegra30-devfreq.c             | 164 ++++---
 drivers/gpu/drm/tegra/Kconfig                 |   1 +
 drivers/gpu/drm/tegra/dc.c                    | 359 ++++++++++++++
 drivers/gpu/drm/tegra/dc.h                    |  19 +
 drivers/gpu/drm/tegra/drm.c                   |  14 +
 drivers/gpu/drm/tegra/hub.c                   |   3 +
 drivers/gpu/drm/tegra/plane.c                 | 121 +++++
 drivers/gpu/drm/tegra/plane.h                 |  15 +
 drivers/memory/tegra/Kconfig                  |  14 +-
 drivers/memory/tegra/mc.c                     | 155 +++++-
 drivers/memory/tegra/mc.h                     |  22 +
 drivers/memory/tegra/tegra114.c               |   6 +
 drivers/memory/tegra/tegra124-emc.c           | 378 +++++++++++++--
 drivers/memory/tegra/tegra124.c               |  88 +++-
 drivers/memory/tegra/tegra20-emc.c            | 458 ++++++++++++++++--
 drivers/memory/tegra/tegra20.c                |  77 +++
 drivers/memory/tegra/tegra210-emc-core.c      |  39 +-
 drivers/memory/tegra/tegra30-emc.c            | 353 ++++++++++++--
 drivers/memory/tegra/tegra30.c                | 245 +++++++++-
 drivers/soc/tegra/fuse/tegra-apbmisc.c        |   2 +
 include/dt-bindings/memory/tegra124-mc.h      |  68 +++
 include/dt-bindings/memory/tegra20-mc.h       |  53 ++
 include/dt-bindings/memory/tegra30-mc.h       |  67 +++
 include/linux/clk/tegra.h                     |   8 +
 include/soc/tegra/emc.h                       |  16 -
 include/soc/tegra/fuse.h                      |   4 +
 include/soc/tegra/mc.h                        |  27 ++
 58 files changed, 3852 insertions(+), 460 deletions(-)
 create mode 100644 arch/arm/boot/dts/tegra124-peripherals-opp.dtsi
 create mode 100644 arch/arm/boot/dts/tegra20-peripherals-opp.dtsi
 create mode 100644 arch/arm/boot/dts/tegra30-peripherals-opp.dtsi
 delete mode 100644 drivers/devfreq/tegra20-devfreq.c
 delete mode 100644 include/soc/tegra/emc.h

-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
