Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD882528143
	for <lists+dri-devel@lfdr.de>; Mon, 16 May 2022 12:03:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E838110E8F9;
	Mon, 16 May 2022 10:03:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBE9D10E790
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 10:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
 :Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3Jzn6cphth9qhKAq793zx0Yx/XIqS2xmhSwjPF/H8jU=; b=Nh+Ze+gl2ViY855ALjF1OHoLf6
 8Z8kDhCAQ1pioYxfFIMcDB/LPgJiJoa3UrpRBDmOkqVHoNqphVX9A+tR5hF1KfQ3xFzrZyyt2n4xC
 zvPJXj7Sq3k/OqKjXezbnq4kk9fCxA23ObQOhJrBVAfHZbcwGiMT+xGGLbneKs+p6EA0y46hKghBR
 ZIRtK42eozCOfGdRdH/OdX89XqM1dZ0HRCVVgTIg6lyas3budGNGIoi+ELS85fKQrCXXkNmqC77rt
 zHvLgctWTLBi/T8fw9+h7urFyLZSNzWBiFeWv5RvZ7euhyP6e8hi+0KbPieunKUlFPilUQEks9Srb
 SjYKkvQw==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70]
 helo=toshino.localdomain)
 by mail.kapsi.fi with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <cyndis@kapsi.fi>)
 id 1nqXYe-0005yU-Gn; Mon, 16 May 2022 13:02:32 +0300
From: cyndis@kapsi.fi
To: thierry.reding@gmail.com, jonathanh@nvidia.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, digetx@gmail.com
Subject: [PATCH v1 00/13] Host1x support on Tegra234
Date: Mon, 16 May 2022 13:02:00 +0300
Message-Id: <20220516100213.1536571-1-cyndis@kapsi.fi>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
 Mikko Perttunen <mperttunen@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mikko Perttunen <mperttunen@nvidia.com>

Hi all,

This series adds support for Host1x and VIC on the recently released
Tegra234 (Orin) SoC. It's split into the following parts:

* Device tree binding updates
* Cleanup in host1x driver
* Add programming of new registers and old registers that now need to
  be programmed to a non-reset value
* Tegra234 device data and headers
* Rewrite of the job opcode sequence, and related patches to
  support MLOCKs on Tegra186+.

The rewrite of the job opcode sequence brings Tegra186, Tegra194 and
Tegra234 support to a 'full-featured' status that is necessary to
support all host1x features in the future. This should not have any
impact on older SoCs.

This series should be applied on top of the Host1x context isolation
series.

Tested on Jetson AGX Xavier and Jetson AGX Orin.

Thanks,
Mikko

Mikko Perttunen (13):
  dt-bindings: Add bindings for Tegra234 Host1x and VIC
  dt-bindings: Add headers for Host1x and VIC on Tegra234
  arm64: tegra: Add Host1x and VIC on Tegra234
  gpu: host1x: Deduplicate hardware headers
  gpu: host1x: Simplify register mapping and add common aperture
  gpu: host1x: Program virtualization tables
  gpu: host1x: Allow reset to be missing
  gpu: host1x: Program interrupt destinations on Tegra234
  gpu: host1x: Tegra234 device data and headers
  gpu: host1x: Rewrite job opcode sequence
  gpu: host1x: Add MLOCK release code on Tegra234
  gpu: host1x: Use RESTART_W to skip timed out jobs on Tegra186+
  drm/tegra: vic: Add Tegra234 support

 .../display/tegra/nvidia,tegra124-vic.yaml    |   1 +
 .../display/tegra/nvidia,tegra20-host1x.yaml  | 108 +++++++++--
 arch/arm64/boot/dts/nvidia/tegra234.dtsi      |  46 +++++
 drivers/gpu/drm/tegra/drm.c                   |   1 +
 drivers/gpu/drm/tegra/vic.c                   |  12 ++
 drivers/gpu/host1x/Makefile                   |   3 +-
 drivers/gpu/host1x/cdma.c                     |  19 +-
 drivers/gpu/host1x/dev.c                      | 112 +++++++----
 drivers/gpu/host1x/dev.h                      |  11 ++
 drivers/gpu/host1x/hw/cdma_hw.c               |  34 ++++
 drivers/gpu/host1x/hw/channel_hw.c            | 144 ++++++++------
 drivers/gpu/host1x/hw/host1x01_hardware.h     | 114 +----------
 drivers/gpu/host1x/hw/host1x02_hardware.h     | 113 +----------
 drivers/gpu/host1x/hw/host1x04_hardware.h     | 113 +----------
 drivers/gpu/host1x/hw/host1x05_hardware.h     | 113 +----------
 drivers/gpu/host1x/hw/host1x06_hardware.h     | 128 +------------
 drivers/gpu/host1x/hw/host1x07_hardware.h     | 128 +------------
 drivers/gpu/host1x/hw/host1x08.c              |  33 ++++
 drivers/gpu/host1x/hw/host1x08.h              |  15 ++
 drivers/gpu/host1x/hw/host1x08_hardware.h     |  21 ++
 drivers/gpu/host1x/hw/hw_host1x08_channel.h   |  11 ++
 drivers/gpu/host1x/hw/hw_host1x08_common.h    |  11 ++
 .../gpu/host1x/hw/hw_host1x08_hypervisor.h    |   9 +
 drivers/gpu/host1x/hw/hw_host1x08_uclass.h    | 181 ++++++++++++++++++
 drivers/gpu/host1x/hw/hw_host1x08_vm.h        |  36 ++++
 drivers/gpu/host1x/hw/intr_hw.c               |  11 ++
 drivers/gpu/host1x/hw/opcodes.h               | 150 +++++++++++++++
 include/dt-bindings/clock/tegra234-clock.h    |   4 +
 include/dt-bindings/memory/tegra234-mc.h      |   5 +
 .../dt-bindings/power/tegra234-powergate.h    |   1 +
 include/dt-bindings/reset/tegra234-reset.h    |   1 +
 31 files changed, 877 insertions(+), 812 deletions(-)
 create mode 100644 drivers/gpu/host1x/hw/host1x08.c
 create mode 100644 drivers/gpu/host1x/hw/host1x08.h
 create mode 100644 drivers/gpu/host1x/hw/host1x08_hardware.h
 create mode 100644 drivers/gpu/host1x/hw/hw_host1x08_channel.h
 create mode 100644 drivers/gpu/host1x/hw/hw_host1x08_common.h
 create mode 100644 drivers/gpu/host1x/hw/hw_host1x08_hypervisor.h
 create mode 100644 drivers/gpu/host1x/hw/hw_host1x08_uclass.h
 create mode 100644 drivers/gpu/host1x/hw/hw_host1x08_vm.h
 create mode 100644 drivers/gpu/host1x/hw/opcodes.h

-- 
2.36.1

