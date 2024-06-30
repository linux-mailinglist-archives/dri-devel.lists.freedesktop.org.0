Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C8E91D31B
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2024 20:36:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60BB310E2B2;
	Sun, 30 Jun 2024 18:36:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=postmarketos.org header.i=@postmarketos.org header.b="rrsPtuwj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com
 [91.218.175.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6840D10E2B3
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jun 2024 18:36:41 +0000 (UTC)
X-Envelope-To: robh@kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
 s=key1; t=1719772599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=aCRUWWr9ZwPe3tG89wMDeKt2B/HIpzAjTdWlwEDozgo=;
 b=rrsPtuwj1u05eQJcnmiVwdlubvsIy3Kl//rCkCSZffHiMFwRpuFvxGRZktmNXqsXObZpD+
 RyMfxBcRcJ4iXFv3UyiPOphCfKe/9361xZv5i0k3XZJ+zGeFwcbA2SUhC0/oyyqbw2b8EX
 76De40NEOOA08dws4lgRuvoO5RxmhWai0sHqkpZoYH0zwSG3UdOgNDnCJbJDLFs3T4eYUw
 yfgaeTXyyhcMbstrlH+JchiJ7WdMpHxKi2MhU8nz1JXXEqeuj7uBzBjiIBbyEqhpiXSedg
 p+fSqGy1BrzsacQDLPQsX2xsGq4NsKgb+dbltMVKNVr5FuaQpdjhLC1MrEgE8A==
X-Envelope-To: conor+dt@kernel.org
X-Envelope-To: neil.armstrong@linaro.org
X-Envelope-To: daniel@ffwll.ch
X-Envelope-To: ~postmarketos/upstreaming@lists.sr.ht
X-Envelope-To: dmitry.torokhov@gmail.com
X-Envelope-To: linux-input@vger.kernel.org
X-Envelope-To: mripard@kernel.org
X-Envelope-To: caleb@postmarketos.org
X-Envelope-To: krzysztof.kozlowski@linaro.org
X-Envelope-To: linux-arm-msm@vger.kernel.org
X-Envelope-To: krzk+dt@kernel.org
X-Envelope-To: dri-devel@lists.freedesktop.org
X-Envelope-To: rydberg@bitmath.org
X-Envelope-To: konrad.dybcio@linaro.org
X-Envelope-To: maarten.lankhorst@linux.intel.com
X-Envelope-To: devicetree@vger.kernel.org
X-Envelope-To: dmitry.baryshkov@linaro.org
X-Envelope-To: tzimmermann@suse.de
X-Envelope-To: frieder.hannenheim@proton.me
X-Envelope-To: airlied@gmail.com
X-Envelope-To: quic_jesszhan@quicinc.com
X-Envelope-To: andersson@kernel.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Caleb Connolly <caleb@postmarketos.org>
Subject: [PATCH v2 0/8] qcom: initial support for the OnePlus 8T
Date: Sun, 30 Jun 2024 20:36:23 +0200
Message-Id: <20240630-oneplus8-v2-0-c4a1f8da74f1@postmarketos.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKilgWYC/0XM0QrCIBTG8VcZ5zrDmaV01XvELsQdN6mmeEyK4
 btng+jy//HxW4EweSQ4dyskLJ58WFqIXQd2NsuEzI+tQXAh+UkIFhaM9ydpprTm/Gitkgah3WN
 C518bdR1az55ySO9NLv13/SHyj5SecXbQGtE6MTqnLjFQfph0wxxoH9IEQ631A1xApoanAAAA
To: Caleb Connolly <caleb@postmarketos.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Henrik Rydberg <rydberg@bitmath.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Frieder Hannenheim <frieder.hannenheim@proton.me>
X-Developer-Signature: v=1; a=openpgp-sha256; l=4478;
 i=caleb@postmarketos.org; h=from:subject:message-id;
 bh=UD8+qzKQsKjZhrLn6zXaLwSngXQfDHuaeiVK6oRk9Lk=;
 b=owEBbQKS/ZANAwAIAQWDMSsZX2S2AcsmYgBmgaWyRznbSdcUMegGzHhYvD0/l2HoNPkhP0xsE
 CoO6ZRS+h6JAjMEAAEIAB0WIQS2UaFGPGq+0GkMVc0FgzErGV9ktgUCZoGlsgAKCRAFgzErGV9k
 th+TD/48o8WNtOxciGAWzmnm9MuOojC5zH9S+tlGVtRHeHhDTqqYv04cH3G/SOyQJ7Vt56+3Q3f
 ZuhKIByi4YAT9xCQcYTY2pCXMU9gqxJiilGbc9iyOUv88IcbpIjpDFx/vqylDzSFqoOlPaG907+
 ECZfHrKCBPcpBSRdtjkS2CcMGi5yO5IB8TPCL60egQd4LmJtk8HEx8lnvvyPGwX8k2y14oGpz49
 Bqt0ZHDNG6maOTlwOIKBHTneM7MxQiz/YzFq55B2zmOkyiRn1UxKQPrMVEPqIeXGCdJ+AzwqqK6
 +071XH8jcUAAqTVNlvjizVkm8O4Vv3jgmNmnLut5O6n7Bdiu7faFzAhQB49ARr5SZyzNj4PVj4O
 XMger/oNVDbEKdsphCcqOHiVyR/JntWLq/GolxTCWqehOYwtOUS2UI82bl5PJS71FPjnd0wXPYo
 yaZrd0m2KAr1yX1zqv5Wc/nia51L6V+ufNW7cx8bH9eOuaDjOOIwCeQQEERecY/mApmKkRHInon
 uwcDW/gVqrkwuuJFCj4gZlYZ1LN41Q44P2w6pr0CKWZRw8ToP+rIfO88Wcs2YmwN8vk+UBndWmJ
 ED2FNjaFexo8oQEGvBDMHU9RfR8k2kovfu9uQZGA9zabsz/oy7PUN2e9kwm/yG1SN98X9V5Xah+
 BHI7aB/KvNzOhnA==
X-Developer-Key: i=caleb@postmarketos.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47
X-Migadu-Flow: FLOW_OUT
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

Add bindings for the SM8250 OnePlus devices, a common devicetree,
touchscreen and display drivers, and a dts for the OnePlus 8T (kebab).

The OnePlus 8 series is made up of 3 flagship smartphones from 2019,
featuring the Qualcomm X55 5G PCIe modem.

This series introduces initial support for the 8T, adding drivers for
the 1080x2400 120Hz DSC panel and the Synaptics TCM Oncell touchscreen.

The panel features a Pixelworks Iris 5 co-processor, what this exactly
does is not very well explained by their website, but as far as we're
concerned it's a chip that sits between the panel and the SoC, we talk
to it over i2c/i3c. The bootloader has some init sequence which can get
the panel working, and if we then reset the panel it becomes impossible
to get it initialized again without adding a driver for this
co-processor.

Note that we can still power down the panel regulators, as long as we
don't toggle the reset pin.

I think it is still useful to accept this panel drivers into
upstream. From a users perspective, the panel is fully functional
just by leaving the reset GPIO alone and keeping the regulator on.

The Synaptics TCM Oncell touchscreens are a new generation of Synaptics
controllers with a totally incompatible firmware compared to the older
rmi4 touchscreens. A new driver is written which currently only supports
the S3908 controller found on the OnePlus 8T. Downstream vendor drivers
suggest that the controller supports custom touch report configuration,
one can define the exact bit packing of the touch reports, however the
combination of controller and firmware available on this device does not
allow for programming in cusotm configs, so for simplicity this initial
driver uses a hardcoded bit packing to decode the touch reports.

With this series, the OnePlus 8T can boot up to GNOME shell, connect to
a wifi network and browse the web with GPU acceleration, with battery
status reporting via the BQ27541 fuel gauge IC.

The touchscreen driver included here is loosely based on a previous
attempt by Frieder Hannenheim which can be found below.

Link: https://lore.kernel.org/lkml/20240327214643.7055-1-friederhannenheim@riseup.net/

---
Changes in v2:
- Panel:
- 	Fix amb655x dt-bindings example
- 	Fully switch to *_multi helpers
- 	Fix regulator refcount handling (skip enabling regulators during
	first prepare() call since they're already powered up).
- DTS:
- 	Add BQ27541 fuel gauge ic
- 	Remove erroneous i2c-ls1 comment
- 	Add chassis-type propery
- 	Don't make panel regulators always-on (not needed)
- 	Describe pielworks iris 5 i2c chip
- Touchscreen:
- 	Fix potential IRQ race condition during probe
- 	Handle big endian hosts correctly
- 	Removed unused macros and generally clean up
- Link to v1: https://lore.kernel.org/r/20240624-oneplus8-v1-0-388eecf2dff7@postmarketos.org

---
Caleb Connolly (8):
      dt-bindings: panel: document Samsung AMB655X
      dt-bindings: input: touchscreen: document synaptics TCM oncell
      dt-bindings: arm: qcom: add OnePlus 8 series
      drm: mipi: add mipi_dsi_generic_write_multi_type()
      drm/mipi-dsi: add set column/page multi helpers
      drm/panel: add driver for samsung amb655x
      Input: touchscreen: add Synaptics TCM oncell S3908
      arm64: dts: qcom: add OnePlus 8T (kebab)

 Documentation/devicetree/bindings/arm/qcom.yaml    |   3 +
 .../bindings/display/panel/samsung,amb655x.yaml    |  63 ++
 .../input/touchscreen/syna,tcm-oncell.yaml         |  68 ++
 MAINTAINERS                                        |  14 +
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 .../arm64/boot/dts/qcom/sm8250-oneplus-common.dtsi | 909 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8250-oneplus-kebab.dts  |  36 +
 drivers/gpu/drm/drm_mipi_dsi.c                     |  40 +
 drivers/gpu/drm/panel/Kconfig                      |   9 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-samsung-amb655x.c      | 399 +++++++++
 drivers/input/touchscreen/Kconfig                  |  11 +
 drivers/input/touchscreen/Makefile                 |   1 +
 drivers/input/touchscreen/synaptics_tcm_oncell.c   | 571 +++++++++++++
 include/drm/drm_mipi_dsi.h                         |  32 +
 15 files changed, 2158 insertions(+)
---
change-id: 20240622-oneplus8-788005cc74ae
base-commit: f76698bd9a8ca01d3581236082d786e9a6b72bb7

// Caleb (they/them)

