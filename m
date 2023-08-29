Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3C478CA87
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 19:17:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDBB510E3E0;
	Tue, 29 Aug 2023 17:17:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C927D10E3E0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 17:17:25 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-977e0fbd742so598990466b.2
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 10:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693329444; x=1693934244;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2/7c2w13BboV5z1fikWu4cjbkqKZVvr9Va+TjvUs/1w=;
 b=jWHczfs+qI/FpLS2P+bT6p9unqFbqC84TjUu7DfIwKTRCqIm1lTKRD/kNPhBv1Eemw
 pnpKqi+VQuah4wacUn5ruX3VnI7i/LKNG//dRgrjID2qw3arKOiRZzBY9cdavmyX/E/z
 o1iWcv/lpXPRWtE5Uu2LIjQvDwzlEqUmZ6Tuad6fKCKcIpgp9LTukUO/qV3ap7lHuYPK
 b2rj/BdsHS946CwkExqvz3oP97dRAI0uyOcUmhtdJt3sPQ2jrihf+17wfsuMZFWEd0yA
 lPgFCcCQ1osOFswhUS7wpUnm0ytiB5Z3hdAF0704VndEF9U96ERnxyN4bVixDF0orsOs
 sJFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693329444; x=1693934244;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2/7c2w13BboV5z1fikWu4cjbkqKZVvr9Va+TjvUs/1w=;
 b=Yf/QgIDoo+XJ9VUZtCLPh1wxNRvK5iy1Z+PCTNF61/XxGn1EsKoNNRTsnFrOk2BheX
 eb6exzXJ0osLaLpqMZFGZFxbmnlrJfayXEQ+iI368nW8nXqXpys42WmSPGm1W3aUm0aG
 hPOADhJbVIwegv9wbBi3ObOisNzbnkN+8Qxh/2H7NfFV1sPH/WURTAW3FxopzthUtzHA
 nCZ6vDrQCj62LX87sNC8uNXte54h0pAyymCvRF+aAf6YuQ8nPMTSC/mu0f+nvADc6WJk
 Kl92nv2R+KJ3Sr9vEnBAzzXtwbfqr2ppXr+dpNxQVvPHqt8OETJWWASt19zU87fccgZK
 q5eA==
X-Gm-Message-State: AOJu0YyyOqH8Mg6dn58KTg67z12jg2GNjOKGUjU69D6PK+FcNzli43yl
 h9U5QYHIdk1wA+6B7zHWfg==
X-Google-Smtp-Source: AGHT+IHqEv5vbPGO+pV9UFgXiDlKEXLBsErveLz78eAXFP80cY6iVVWrZNSELJQnKOeXamu627nuTw==
X-Received: by 2002:a17:906:114:b0:9a5:d657:47e5 with SMTP id
 20-20020a170906011400b009a5d65747e5mr1356203eje.49.1693329444007; 
 Tue, 29 Aug 2023 10:17:24 -0700 (PDT)
Received: from U4.lan ([2001:9e8:b958:3410:8e0c:ed68:cd6c:7cb8])
 by smtp.gmail.com with ESMTPSA id
 a21-20020a1709062b1500b00993cc1242d4sm6115834ejg.151.2023.08.29.10.17.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 10:17:23 -0700 (PDT)
From: Alex Bee <knaerzche@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Lee Jones <lee@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>
Subject: [PATCH 00/31] Fix and improve Rockchip RK3128 support
Date: Tue, 29 Aug 2023 19:16:16 +0200
Message-ID: <20230829171647.187787-1-knaerzche@gmail.com>
X-Mailer: git-send-email 2.42.0
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Elaine Zhang <zhangqing@rock-chips.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Alex Bee <knaerzche@gmail.com>,
 linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org,
 Johan Jonker <jbx6244@gmail.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi list,

this series fixes some issues I found when testing my "new" RK3128 board
with the mainline kernel and adds some core functionality like SMP bringup,
usb and networking.

The propably most distinctive change is the split up of the DTs for the
different SoCs of this platform: RK3126 and RK3128. Even if I'm not adding
a RK3126 board in this series: I think this change should be done as early
as possible in order to avoid issues in future.
Actually it should have been done like that in the first place.

All patches have been tested on both SoCs:

Patch 01-04 are dt-bindings additions for this SoC platform and the new
board I'm addding here

Patch 05-07 are some clock driver fixes (there is more to do, but I'm
limiting it to the things which can work now)

Patch 08 and 09 adding support for the usb 2 phy found in RK312x platform
to the Rockchip Innosilicon usb phy driver.

Patch 10-14 are DT patches which I did in the "old" rk3128.dtsi in order
to be backportable.

Patch 15 does the aforementioned split-up of the current rk3128.dtsi in
rk312x.dtsi, rk3126.dtsi and rk3128.dtsi

Patch 16-20 adds SMP bringup and cpu frequency scaling

Patch 21-23 adds power controller, GPU and I2S nodes to the RK312x DT

Patch 24-26 adds the second I2S, S/PDIF and gmac nodes to the  RK3128 DT

Patch 27-30 adds fixes for the usb controllers and adds a missing
pincontrol for the sd card detection

Patch 31 finnaly adds a DT for Genatech XPI-3128 board

There are quite some HW blocks which can easily be added for this
platform, but I guess this series is pretty huge already, so that it is
limited to some core devices for now.
I hope the single patches are small enough, that reviewing won't be a
burden ;)

The plan is to sync the DT changes to u-boot after they are merged where
I'm planning to add "full" TPL/SPL for this platform (dram controller/phy
driver is currently missing)

I'm planing the add a RK3126 (tablet) board here as well, but I will have
to add support for RK816 pmic first.

Alex Bee (29):
  dt-bindings: mfd: syscon: Add rockchip,rk3128-qos compatible
  dt-bindings: gpu: mali-utgard: Add Rockchip RK3128 compatible
  dt-bindings: ASoC: rockchip: Add compatible for RK3128 spdif
  dt-bindings: arm: rockchip: Add Geniatech XPI-3128
  clk: rockchip: rk3128: Fix SCLK_SDMMC's clock name
  phy: rockchip-inno-usb2: Split ID interrupt phy registers
  phy: phy-rockchip-inno-usb2: Add RK3128 support
  ARM: dts: rockchip: Fix i2c0 register address for RK3128
  ARM: dts: rockchip: Add missing arm timer interrupt for RK3128
  ARM: dts: rockchip: Add missing quirk for RK3128's dma engine
  ARM: dts: rockchip: Fix timer clocks for RK3128
  ARM: dts: rockchip: Disable non-required timers for RK3128
  ARM: dts: rockchip: Split RK3128 devictree for RK312x SoC family
  ARM: dts: rockchip: Add SRAM node for RK312x
  ARM: dts: rockchip: Add CPU resets for RK312x
  ARM: dts: rockchip: Enable SMP bringup for RK312x
  ARM: dts: rockchip: Switch to operating-points-v2 for RK312x's CPU
  ARM: dts: rockchip: Add extra CPU voltages for RK3126
  ARM: dts: rockchip: add power controller for RK312x
  ARM: dts: rockchip: Add GPU node for RK312x
  ARM: dts: rockchip: Add 2-channel I2S for RK312x
  ARM: dts: rockchip: Add 8-channel I2S for RK3128
  ARM: dts: rockchip: Add spdif for RK3128
  ARM: dts: rockchip: Add gmac for RK3128
  ARM: dts: rockchip: Add dwc2 otg fifo siztes for RK312x
  ARM: dts: rockchip: Add USB host clocks for RK312x
  ARM: dts: rockchip: Make usbphy the parent of SCLK_USB480M for RK312x
  ARM: dts: rockchip: Add sdmmc_det pinctrl for RK312x
  ARM: dts: Add Geniatech XPI-3128 RK3128 board

Finley Xiao (2):
  clk: rockchip: rk3128: Fix aclk_peri_src parent
  clk: rockchip: rk3128: Fix hclk_otg gate

 .../devicetree/bindings/arm/rockchip.yaml     |    5 +
 .../bindings/gpu/arm,mali-utgard.yaml         |    1 +
 .../devicetree/bindings/mfd/syscon.yaml       |    1 +
 .../bindings/sound/rockchip-spdif.yaml        |    1 +
 arch/arm/boot/dts/rockchip/Makefile           |    1 +
 arch/arm/boot/dts/rockchip/rk3126.dtsi        |   36 +
 .../arm/boot/dts/rockchip/rk3128-xpi-3128.dts |  431 +++++++
 arch/arm/boot/dts/rockchip/rk3128.dtsi        |  920 +-------------
 arch/arm/boot/dts/rockchip/rk312x.dtsi        | 1101 +++++++++++++++++
 drivers/clk/rockchip/clk-rk3128.c             |   24 +-
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c |  147 ++-
 11 files changed, 1754 insertions(+), 914 deletions(-)
 create mode 100644 arch/arm/boot/dts/rockchip/rk3126.dtsi
 create mode 100644 arch/arm/boot/dts/rockchip/rk3128-xpi-3128.dts
 create mode 100644 arch/arm/boot/dts/rockchip/rk312x.dtsi


base-commit: 2dde18cd1d8fac735875f2e4987f11817cc0bc2c
-- 
2.42.0

