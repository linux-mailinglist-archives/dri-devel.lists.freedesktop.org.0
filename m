Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3D5C7209C
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 04:41:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85ADF10E6E0;
	Thu, 20 Nov 2025 03:41:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=w_armin@gmx.de header.b="aoqKxpIt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47AD910E6DF
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 03:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1763610078; x=1764214878; i=w_armin@gmx.de;
 bh=EfKyHSgu72E5XtbQRP8q+S271PUWmhxdP5i176j621o=;
 h=X-UI-Sender-Class:From:Subject:Date:Message-Id:MIME-Version:
 Content-Type:Content-Transfer-Encoding:To:Cc:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=aoqKxpItMFG/cGUVVkfB1NhzTpFMPOwqiKqBkxUSdglyjuleis0Y4HhyHY0LUHTP
 wRzVvH7IxSr6a2GcsddK3MvmeVjt3jEnGdwZp4OR7PTI5HxZ5421SPvgzEpDawqwu
 0f7W3SM+Dd6YN6b29vbbaCI29NanKxtyYlM4pe4fxcToFiRu1H6Q7Y/jW4mQt6sZw
 lNMoAGaNhFDgHzG078dSISrf5mH4jVfTkQbVg1sYvP5KlRiCpSJN7rz1oRqdp6gkN
 H23cOPc2JXbFFSX+Mw+IAyRdoZV1KbBfhJ4bbD0lGUbIlMSQ2Nf/m/ZkN0rLg5fhp
 sP1EsXjlcFU6jXzdaQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([93.202.247.91]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MLi8m-1vdav82PvU-00KALa; Thu, 20
 Nov 2025 04:41:18 +0100
From: Armin Wolf <W_Armin@gmx.de>
Subject: [PATCH RFC RESEND 0/8] thermal: core: Allow setting the parent
 device of thermal zone/cooling devices
Date: Thu, 20 Nov 2025 04:41:10 +0100
Message-Id: <20251120-thermal-device-v1-0-bbdad594d57a@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-B4-Tracking: v=1; b=H4sIANaNHmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQ0MT3ZKM1KLcxBzdFKDi5FRdM1PTFENjCwsjk2QzJaCmgqLUtMwKsIH
 RSkFuziCxINdgVz8XpdjaWgB7+urfbwAAAA==
X-Change-ID: 20251114-thermal-device-655d138824c6
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Len Brown <lenb@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Ido Schimmel <idosch@nvidia.com>, 
 Petr Machata <petrm@nvidia.com>
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
X-Provags-ID: V03:K1:UzHmwioHZKfjFpYTePSeoB+nEB5pgRKUwAckErW8vPODyOjizzx
 /feBzdus+6v6o3v+eb2dnxcueQu6ShHFe1TT6Xi/kk8kv5nVS0Y9m+JMn8+ZkS1ADmANUys
 KJE6GDq7jWYTptIpEMYFhITEe/619/61fPiKltwdUQWuLX/fH71JR7y/I3G+rWcTL/yjCgw
 31BGItEd8tKh5IQVLSerA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:7gAiZgF03ew=;ZONVuGAOGDYqPBH8Je3dmeYjmp6
 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
 Q0O7hFL4=
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
base-commit: 653ef66b2c04bcdecaf3d13ea5069c4b1f27d5da
change-id: 20251114-thermal-device-655d138824c6

Best regards,
=2D-=20
Armin Wolf <W_Armin@gmx.de>

