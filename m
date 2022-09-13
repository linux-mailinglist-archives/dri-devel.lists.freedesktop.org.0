Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E34F65B6E1E
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 15:15:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F2C710E703;
	Tue, 13 Sep 2022 13:15:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A36BF10E705
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Sep 2022 13:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=r1BbAaIYphXM8kEX7BlFmPYXKRn9fe68imxk+A0IPao=; b=JZS0LSq3xIHEhZihIIoyptxrNo
 Q4z0lwtzclSGTyB+6/2p3dl9/YJabgcEtdhFfJHwr7+U/PMhpuH2j1CKIoDbQglQesrjEDuRhQRNj
 EfsLeBOpiMFEv9LE3da6nMQtaD6/VCqbn9n96cH1p9MMz7ZXTu1EorVcv/Oj0IpTTFMaGol3YgDfY
 d6QrRJfE6P5nXo2vb5p8lkM5TfeR41AXw67AypyrW3mBjwzXBy1tNOqotrG1jnaLyNZcCrZYmvdWg
 CXH5iwrEeRNadszT8elmqb+c6lj1GPcUpPnD7XtZHkttA9KdzIq0jiKm+aTMylAWxJnbtNpEvdnJx
 /JhN0E8w==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70]
 helo=toshino.localdomain) by mail.kapsi.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <cyndis@kapsi.fi>)
 id 1oY5kg-00EVnM-JY; Tue, 13 Sep 2022 16:14:58 +0300
From: Mikko Perttunen <cyndis@kapsi.fi>
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Hunter <jonathanh@nvidia.com>
Subject: [PATCH v2 0/8] Support for NVDEC on Tegra234
Date: Tue, 13 Sep 2022 16:14:38 +0300
Message-Id: <20220913131447.2877280-1-cyndis@kapsi.fi>
X-Mailer: git-send-email 2.37.0
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
Cc: devicetree@vger.kernel.org, Sameer Pujar <spujar@nvidia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>, linux-tegra@vger.kernel.org,
 Ashish Mhetre <amhetre@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mikko Perttunen <mperttunen@nvidia.com>

v2:
* Updated patches 1,3 based on comments
* Added Acked-by to patch 2

Original message:

Hi all,

this series adds support for the HW video decoder, NVDEC,
on Tegra234 (Orin). The main change is a switch from Falcon
to RISC-V for the internal microcontroller, which brings along
a change in how the engine is booted. Otherwise it is backwards
compatible with earlier versions.

In previous iterations, firmware was simply loaded from disk and
written into engine internal memory. Now, the engine has a
bootrom that loads the firmware from a carveout where it has been
loaded by the system bootloader; however, we still need to tell it
where that carveout is loaded and some offsets into it. For that,
the first patch adds a new memory controller API to query the
carveout address. The offsets are read from device tree -- the
expectation is that at flashing time (when the firmware is also
flashed), the flasher also delivers a device tree overlay with
values corresponding to the flashed firmware.

The currently available Linux for Tegra release doesn't yet
include this device tree overlay flashing, and the firmware version
it contains is incompatible with this series. The plan is to fix
that for the next Linux for Tegra release, but if necessary, we
can postpone merging of this series to once those changes are
available.

Thanks!
Mikko

Mikko Perttunen (8):
  memory: tegra: Add API for retrieving carveout bounds
  dt-bindings: Add headers for NVDEC on Tegra234
  dt-bindings: Add bindings for Tegra234 NVDEC
  arm64: tegra: Add NVDEC on Tegra234
  gpu: host1x: Add stream ID register data for NVDEC on Tegra234
  drm/tegra: nvdec: Support multiple clocks
  drm/tegra: Add code for booting RISC-V based engines
  drm/tegra: Add Tegra234 support to NVDEC driver

 .../gpu/host1x/nvidia,tegra234-nvdec.yaml     | 154 ++++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra234.dtsi      |  27 +++
 drivers/gpu/drm/tegra/Makefile                |   3 +-
 drivers/gpu/drm/tegra/drm.c                   |   1 +
 drivers/gpu/drm/tegra/nvdec.c                 | 171 +++++++++++++++---
 drivers/gpu/drm/tegra/riscv.c                 | 106 +++++++++++
 drivers/gpu/drm/tegra/riscv.h                 |  30 +++
 drivers/gpu/host1x/dev.c                      |  12 ++
 drivers/memory/tegra/mc.c                     |  25 +++
 drivers/memory/tegra/tegra234.c               |   5 +
 include/dt-bindings/clock/tegra234-clock.h    |   4 +
 include/dt-bindings/memory/tegra234-mc.h      |   3 +
 .../dt-bindings/power/tegra234-powergate.h    |   1 +
 include/dt-bindings/reset/tegra234-reset.h    |   1 +
 include/soc/tegra/mc.h                        |  11 ++
 15 files changed, 528 insertions(+), 26 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra234-nvdec.yaml
 create mode 100644 drivers/gpu/drm/tegra/riscv.c
 create mode 100644 drivers/gpu/drm/tegra/riscv.h

-- 
2.37.0

