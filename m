Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE32A3E985
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 02:00:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D95A10E02B;
	Fri, 21 Feb 2025 01:00:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 639F210E02B
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 01:00:14 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 788BE1BA8;
 Thu, 20 Feb 2025 17:00:31 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com
 [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 15BA43F59E;
 Thu, 20 Feb 2025 17:00:10 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-pm@vger.kernel.org
Subject: [PATCH 0/5] arm64: sunxi: h616: Enable Mali GPU
Date: Fri, 21 Feb 2025 00:57:57 +0000
Message-ID: <20250221005802.11001-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The Allwinner H616/H618/H313/H700 SoCs contain a Mali G32 MP2 GPU. This
IP is from the Bifrost family and is already supported by the panfrost
driver, so enabling support for 3D graphics on this SoC is rather
straight-forward.
However Allwinner added some bits in the PRCM block, that control the
power domain for the GPU - on top of its power *supply*.

This series enables the Mali GPU on those SoCs, by first introducing a
power domain driver for that SoC (patch 1/5: DT binding, patch 2/5:
the actual driver). For the Mali GPU to work we literally need to flip a
single bit (the BSP does this in the bootloader), and this full featured
power domain driver is admittedly a bit over the top for that purpose.
However it seems to be the right thing to do architecturally, and while
at it I added the other power domains (for analogue, PLLs, and the
management core), even though we won't use them in Linux and they would
be always on. I have a simpler version of the driver which just covers
this single bit controlling the GPU, please let me know if you prefer
that.
Please also note that this supersedes an RFC patch I sent a year ago,
which included this power domain in the R-CCU driver:
https://lore.kernel.org/linux-sunxi/20240225160616.15001-1-andre.przywara@arm.com/T/#u

The rest of the patches enable the Mali GPU on the DT side: patch 3/5
adds the compatible string to the Mali DT binding, while patch 4/5 adds
the purely SoC specific DT nodes, for both the power domain and the Mali
GPU. The final patch 5/5 then enables the GPU on all existing H616-family
boards.

There seems to be an existing problem with powering up the GPU, after it
has been turned off by the kernel. Chances are this is a problem with the
proper power-up (or power-down) sequence, where clock gates, reset lines
and the power domain must be asserted in a specific order.
A workaround used so far downstream is to keep the power domain enabled,
by ignoring the power-off request. Observing any assumed "proper" sequence
is a bit more tricky, since there is no Allwinner specific glue driver
or anything, so things would need be changed in the generic panfrost
code, where they have the potential of breaking other Mali users.
I would be interested in hearing opinions about this.

Cheers,
Andre

Andre Przywara (5):
  dt-bindings: power: Add Allwinner H6/H616 PRCM PPU
  pmdomain: sunxi: add H6 PRCM PPU driver
  dt-bindings: gpu: mali-bifrost: Add Allwinner H616 compatible
  arm64: dts: allwinner: h616: Add Mali GPU node
  arm64: dts: allwinner: h616: enable Mali GPU for all boards

 .../bindings/gpu/arm,mali-bifrost.yaml        |   1 +
 .../power/allwinner,sun50i-h6-prcm-ppu.yaml   |  42 ++++
 .../dts/allwinner/sun50i-h313-tanix-tx1.dts   |   5 +
 .../sun50i-h616-bigtreetech-cb1.dtsi          |   5 +
 .../allwinner/sun50i-h616-orangepi-zero.dtsi  |   4 +
 .../allwinner/sun50i-h616-orangepi-zero2.dts  |   4 +
 .../dts/allwinner/sun50i-h616-x96-mate.dts    |   5 +
 .../arm64/boot/dts/allwinner/sun50i-h616.dtsi |  21 ++
 .../sun50i-h618-longan-module-3h.dtsi         |   5 +
 .../allwinner/sun50i-h618-orangepi-zero2w.dts |   5 +
 .../allwinner/sun50i-h618-orangepi-zero3.dts  |   4 +
 .../sun50i-h618-transpeed-8k618-t.dts         |   5 +
 .../sun50i-h618-yuzukihd-chameleon.dts        |   5 +
 .../sun50i-h700-anbernic-rg35xx-2024.dts      |   5 +
 drivers/pmdomain/sunxi/Kconfig                |  10 +
 drivers/pmdomain/sunxi/Makefile               |   1 +
 drivers/pmdomain/sunxi/sun50i-h6-prcm-ppu.c   | 191 ++++++++++++++++++
 17 files changed, 318 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/allwinner,sun50i-h6-prcm-ppu.yaml
 create mode 100644 drivers/pmdomain/sunxi/sun50i-h6-prcm-ppu.c

-- 
2.46.3

