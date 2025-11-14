Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0850AC5B189
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 04:24:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5643510E992;
	Fri, 14 Nov 2025 03:24:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=w_armin@gmx.de header.b="HmX4lbpU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D65A10E992;
 Fri, 14 Nov 2025 03:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1763090633; x=1763695433; i=w_armin@gmx.de;
 bh=Q4vUvQcq2tnJRGmKLq120f5QMyRlcuVxYUcrmWKOs6U=;
 h=X-UI-Sender-Class:From:Subject:Date:Message-Id:MIME-Version:
 Content-Type:Content-Transfer-Encoding:To:Cc:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=HmX4lbpUHEc0dYy8kxSAwz7q399fZc0pHz9eYezR11yePUyAcWcxPjPKlR8ky0XS
 cwtoQqmLoevg4XjPumn+ucYdbEHK22N6wddkOVgPYhv3niJJHZc9fUusV/CcQ0rMe
 8xKaav6jNzLcSHeG+2l5ux8k838fAF5RupCrUqrZc9ai0b8EqNfUVLtW/91S0KJBR
 UY2hOigRgszIZBH6Web3uNRR6pxgljxbGR3UT+xv+vuKgdPv9wUBr+ZeFdCs3TPsi
 dAvdNkQvmObNiNCrwEv/u7TfDS/Vf+iTC9Gr3wbpXn4feP3iQ+GlE0L1GMoLoIz56
 xXGTJgfotk8FVXrVRA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([93.202.247.91]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MTzb8-1vjdGc2phy-00YKis; Fri, 14
 Nov 2025 04:23:52 +0100
From: Armin Wolf <W_Armin@gmx.de>
Subject: [PATCH RFC 0/8] thermal: core: Allow setting the parent device of
 thermal zone/cooling devices
Date: Fri, 14 Nov 2025 04:23:01 +0100
Message-Id: <20251114-thermal-device-v1-0-d8b442aae38b@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-B4-Tracking: v=1; b=H4sIAJagFmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQ0MT3ZKM1KLcxBzdFKDi5FRdM1PTFENjCwsjk2QzJaCmgqLUtMwKsIH
 RSkFuzkqxtbUAKCMckmUAAAA=
X-Change-ID: 20251114-thermal-device-655d138824c6
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Lucas Stach <l.stach@pengutronix.de>, 
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 Christian Gmeiner <christian.gmeiner@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Amit Daniel Kachhap <amit.kachhap@gmail.com>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Len Brown <lenb@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Ido Schimmel <idosch@nvidia.com>, 
 Petr Machata <petrm@nvidia.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Jeff Johnson <jjohnson@kernel.org>, 
 Miri Korenblit <miriam.rachel.korenblit@intel.com>, 
 Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Peter Kaestle <peter@piie.net>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Potnuri Bharat Teja <bharat@chelsio.com>, 
 Sebastian Reichel <sre@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Support Opensource <support.opensource@diasemi.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-tegra@vger.kernel.org, linux-acpi@vger.kernel.org, 
 linux-doc@vger.kernel.org, netdev@vger.kernel.org, 
 linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, 
 ath11k@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, platform-driver-x86@vger.kernel.org, 
 linux-pci@vger.kernel.org, imx@lists.linux.dev, 
 linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Provags-ID: V03:K1:+sQC6XJityyPeqf8ATkjW/K9SbuukJVyXf5EoW8hD1EpHIZtMr3
 X/UKPKjsFSA6l29FTcQBKzyHfVg/DxJJWIOZQNVsKvP0A8yvP9W8VXH4yYuaXnQgsT+ZxAb
 b3nRSrHxe27/nehrCzWDSieaqE7OH03Rdr2segv/ylu8N/fkXG+JtiExAsNPPPoKJXUnPGn
 kn3XOZdNtkPxA6h1kt2pA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:q1yh7z5Kc+U=;RKcBJD6e11WT77XjTrtojbt4RYU
 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
 Fnsxc86w=
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

Drivers registering thermal zone/cooling devices are currently unable
to tell the thermal core what parent device the new thermal zone/
cooling device should have, potentially causing issues with suspend
ordering and making it impossible for user space appications to
associate a given thermal zone device with its parent device.

This patch series aims to fix this issue by extending the functions
used to register thermal zone/cooling devices to also accept a parent
device pointer. The first six patches convert all functions used for
registering cooling devices, while the functions used for registering
thermal zone devices are converted by the remaining two patches.

I tested this series on various devices containing (among others):
- ACPI thermal zones
- ACPI processor devices
- PCIe cooling devices
- Intel Wifi card
- Intel powerclamp
- Intel TCC cooling

I also compile-tested the remaining affected drivers, however i would
still be happy if the relevant maintainers (especially those of the
mellanox ethernet switch driver) could take a quick glance at the
code and verify that i am using the correct device as the parent
device.

This work is also necessary for extending the ACPI thermal zone driver
to support the _TZD ACPI object in the future.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
Armin Wolf (8):
      thermal: core: Allow setting the parent device of cooling devices
      thermal: core: Set parent device in thermal_of_cooling_device_regist=
er()
      ACPI: processor: Stop creating "device" sysfs link
      ACPI: fan: Stop creating "device" sysfs link
      ACPI: video: Stop creating "device" sysfs link
      thermal: core: Set parent device in thermal_cooling_device_register(=
)
      ACPI: thermal: Stop creating "device" sysfs link
      thermal: core: Allow setting the parent device of thermal zone devic=
es

 Documentation/driver-api/thermal/sysfs-api.rst     | 10 ++++-
 drivers/acpi/acpi_video.c                          |  9 +----
 drivers/acpi/fan_core.c                            | 16 ++------
 drivers/acpi/processor_thermal.c                   | 15 +------
 drivers/acpi/thermal.c                             | 33 ++++++---------
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c              |  4 +-
 drivers/net/ethernet/chelsio/cxgb4/cxgb4_thermal.c |  4 +-
 drivers/net/ethernet/mellanox/mlxsw/core_thermal.c | 47 +++++++++++------=
=2D----
 drivers/net/wireless/ath/ath10k/thermal.c          |  2 +-
 drivers/net/wireless/ath/ath11k/thermal.c          |  2 +-
 drivers/net/wireless/intel/iwlwifi/mld/thermal.c   |  6 +--
 drivers/net/wireless/intel/iwlwifi/mvm/tt.c        | 12 +++---
 drivers/net/wireless/mediatek/mt76/mt7915/init.c   |  2 +-
 drivers/net/wireless/mediatek/mt76/mt7996/init.c   |  2 +-
 drivers/platform/x86/acerhdf.c                     |  4 +-
 drivers/power/supply/power_supply_core.c           |  4 +-
 drivers/thermal/armada_thermal.c                   |  2 +-
 drivers/thermal/cpufreq_cooling.c                  |  2 +-
 drivers/thermal/cpuidle_cooling.c                  |  2 +-
 drivers/thermal/da9062-thermal.c                   |  2 +-
 drivers/thermal/devfreq_cooling.c                  |  2 +-
 drivers/thermal/dove_thermal.c                     |  2 +-
 drivers/thermal/imx_thermal.c                      |  2 +-
 .../intel/int340x_thermal/int3400_thermal.c        |  2 +-
 .../intel/int340x_thermal/int3403_thermal.c        |  4 +-
 .../intel/int340x_thermal/int3406_thermal.c        |  2 +-
 .../intel/int340x_thermal/int340x_thermal_zone.c   | 13 +++---
 .../int340x_thermal/processor_thermal_device_pci.c |  7 ++--
 drivers/thermal/intel/intel_pch_thermal.c          |  2 +-
 drivers/thermal/intel/intel_powerclamp.c           |  2 +-
 drivers/thermal/intel/intel_quark_dts_thermal.c    |  2 +-
 drivers/thermal/intel/intel_soc_dts_iosf.c         |  2 +-
 drivers/thermal/intel/intel_tcc_cooling.c          |  2 +-
 drivers/thermal/intel/x86_pkg_temp_thermal.c       |  6 +--
 drivers/thermal/kirkwood_thermal.c                 |  2 +-
 drivers/thermal/pcie_cooling.c                     |  2 +-
 drivers/thermal/renesas/rcar_thermal.c             | 10 +++--
 drivers/thermal/spear_thermal.c                    |  2 +-
 drivers/thermal/tegra/soctherm.c                   |  5 +--
 drivers/thermal/testing/zone.c                     |  2 +-
 drivers/thermal/thermal_core.c                     | 23 +++++++----
 drivers/thermal/thermal_of.c                       |  9 +++--
 include/linux/thermal.h                            | 22 +++++-----
 43 files changed, 145 insertions(+), 162 deletions(-)
=2D--
base-commit: 399fb812cd1532773e6aa985c0949859221341c4
change-id: 20251114-thermal-device-655d138824c6

Best regards,
=2D-=20
Armin Wolf <W_Armin@gmx.de>

