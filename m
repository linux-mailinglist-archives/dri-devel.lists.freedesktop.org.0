Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE8FAE499E
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 18:06:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9508310E002;
	Mon, 23 Jun 2025 16:06:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="Ur91gAI5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A09610E002
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 16:06:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1750694752; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=ALvgrtg+SBpE7ZZ5IkKOvEGS2SR4IufJdiOtiRVy68FjasB3QJgnA6RvY/N+EWWViRfyhEVxnTbdcTnv2v5XfDJzm7WEQ0UnzaDPAyseLdjkl1hb650UOTbiPdDATgqwdQ0m5LpepSWI3r6mky17Jk1JFGkOO2tMYLrNthhObwc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1750694752;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=OBRKd+xA4VsUyeckNojrdNQY/i5zR4hbYSAkGkUAxmI=; 
 b=f3ISUawrfRo5+VIsmDCuLxBzcU2wsRYh8AzkHPaZdDI7cgoz33XFITfsgEElgM9NSiGaUM3OQfm+dYsD9LIHYxcv+/b6ZROeF56zQHjEWzyGwaqBBxO33FdbDSPb6iXhG6JZJ0LIg+Xrl2mcrBRdGxRMwgFHPpAjRG9/ITc6ZEA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750694752; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
 bh=OBRKd+xA4VsUyeckNojrdNQY/i5zR4hbYSAkGkUAxmI=;
 b=Ur91gAI5Pg4ujGe9cgYtIhXeRdyWF4npt8XEVb3xB6c3gzjKDMoCcqGXSa540LUH
 6uxd/EWPKNeFn3LrQ2TzaIZiMHsCyJroUlVvMjiRyJDgSkbfLlkadlnnc8+V/IkF3gU
 4xPwrh5EMDEFFEwzxIcgQctKEDXccsek567/7Rjw=
Received: by mx.zohomail.com with SMTPS id 1750694748824857.0971844130715;
 Mon, 23 Jun 2025 09:05:48 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: [PATCH v2 00/20] BYEWORD_UPDATE: unifying (most) HIWORD_UPDATE macros
Date: Mon, 23 Jun 2025 18:05:28 +0200
Message-Id: <20250623-byeword-update-v2-0-cf1fc08a2e1f@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEh7WWgC/12OzQ6DIBAGX8XsuTSAf42nvkfjAWSpJCoW0GqM7
 16qPfU4m8x8u4FHZ9BDlWzgcDbe2CECvyTQtGJ4IjEqMnDKc1owSuSKb+sUmUYlApIsyxuKKMq
 SKYjS6FCb5Qg+6pMdvqbYDecRpPBIGtv3JlTJgEsgZ5un8BVa44N16/HQzA7jt83/t2dGKNGZ0
 PKmi5Sl+t7YrhPSOnGNA1Dv+/4BLKkE/uEAAAA=
X-Change-ID: 20250610-byeword-update-445c0eea771d
To: Yury Norov <yury.norov@gmail.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
 Jaehoon Chung <jh80.chung@samsung.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
 Shreeya Patel <shreeya.patel@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Shawn Lin <shawn.lin@rock-chips.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
 MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, Qin Jian <qinjian@cqplus1.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
 linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org, 
 linux-sound@vger.kernel.org, netdev@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-pci@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, llvm@lists.linux.dev, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
X-Mailer: b4 0.14.2
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

This series was spawned by [1], where I was asked to move every instance
of HIWORD_UPDATE et al that I could find to a common macro in the same
series that I am introducing said common macro.

The first patch of the series introduces a new header file,
hw_bitfield.h, which contains two new macros: FIELD_PREP_WM16 and
FIELD_PREP_WM16_CONST. The latter can be used in initializers.

I've cheekily added the hw_bitfield.h header to the BITMAP API section
of the MAINTAINERS file.

This macro definition checks that the mask fits, and that the value fits
in the mask. Like FIELD_PREP, it also shifts the value up to the mask,
so turning off a bit does not require using the mask as a value. Masks
are also required to be contiguous, like with FIELD_PREP.

For each definition of such a macro, the driver(s) that used it were
evaluated for three different treatments:
 - full conversion to the new macro, for cases where replacing the
   implementation of the old macro wouldn't have worked, or where the
   conversion was trivial. These are the most complex patches in this
   series, as they sometimes have to pull apart definitions of masks
   and values due to the new semantics, which require a contiguous
   mask and shift the value for us.
 - replacing the implementation of the old macro with an instance of the
   new macro, done where I felt it made the patch much easier to review
   because I didn't want to drop a big diff on people.
 - skipping conversion entirely, usually because the mask is
   non-constant and it's not trivial to make it constant. Sometimes an
   added complication is that said non-constant mask is either used in a
   path where runtime overhead may not be desirable, or in an
   initializer.

Left out of conversion:
 - drivers/mmc/host/sdhci-of-arasan.c: mask is non-constant.
 - drivers/phy/rockchip/phy-rockchip-inno-csidphy.c: mask is
   non-constant likely by way of runtime pointer dereferencing, even if
   struct and members are made const.
 - drivers/clk/rockchip/clk.h: way too many clock drivers use non-const
   masks in the context of an initializer.

I will not be addressing these 3 remaining users in this series, as
implementing a runtime checked version on top of this and verifying that
it doesn't cause undue overhead just for 3 stragglers is a bit outside
the scope of wanting to get my RK3576 PWM series unblocked. Please have
mercy.

In total, I count 19 different occurrences of such a macro fixed out of
22 I found. The vast majority of these patches have either undergone
static testing to ensure the values end up the same during development,
or have been verified to not break the device the driver is for at
runtime. Only a handful are just compile-tested, and the individual
patches remark which ones those are.

This took a lot of manual work as this wasn't really something that
could be automated: code had to be refactored to ensure masks were
contiguous, made sense to how the hardware actually works and to human
readers, were constant, and that the code uses unshifted values.

Please note that I will not be resending the whole series again for
purely subjective cosmetic changes. This series touches a lot of
subsystems, which means many clashing tastes. You've had a week's notice
to get any low-effort naming nitpicks out of the way after v1. If you as
a maintainer are unhappy with a commit prefix or such, then you have my
express permission to modify it while applying the patch, so that I
don't need to bombard everyone else's inboxes again.

https://lore.kernel.org/all/aD8hB-qJ4Qm6IFuS@yury/ [1]

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
Changes in v2:
- rebase onto next-20250623. This involved solving two conflicts in
  pcie-dw-rockchip.
- move new macros to a new hw_bitfield.h, and rename them to
  FIELD_PREP_WM16*. All patches in the series have been updated to use
  the new names.
- hw_bitfield.h: fix macro param re-use in FIELD_PREP_WM16. I don't know
  if there's any way to do the same in FIELD_PREP_WM16_CONST, but the
  bitfield.h FIELD_PREP functions don't do it for either, so I'm already
  strictly better anyway.
- hw_bitfield.h: remove whitespace after cast operators.
- change newly introduced U literal suffixes to UL, as they are more
  commonly used in the kernel.
- pcie-dw-rockchip: remove the legacy mode flag, as it's unused.
- Link to v1: https://lore.kernel.org/r/20250612-byeword-update-v1-0-f4afb8f6313f@collabora.com

---
Nicolas Frattaroli (20):
      bitmap: introduce hardware-specific bitfield operations
      mmc: dw_mmc-rockchip: switch to FIELD_PREP_WM16 macro
      soc: rockchip: grf: switch to FIELD_PREP_WM16_CONST macro
      media: synopsys: hdmirx: replace macros with bitfield variants
      drm/rockchip: lvds: switch to FIELD_PREP_WM16 macro
      phy: rockchip-emmc: switch to FIELD_PREP_WM16 macro
      drm/rockchip: dsi: switch to FIELD_PREP_WM16* macros
      drm/rockchip: vop2: switch to FIELD_PREP_WM16 macro
      phy: rockchip-samsung-dcphy: switch to FIELD_PREP_WM16 macro
      drm/rockchip: dw_hdmi_qp: switch to FIELD_PREP_WM16 macro
      drm/rockchip: inno-hdmi: switch to FIELD_PREP_WM16 macro
      phy: rockchip-usb: switch to FIELD_PREP_WM16 macro
      drm/rockchip: dw_hdmi: switch to FIELD_PREP_WM16* macros
      ASoC: rockchip: i2s-tdm: switch to FIELD_PREP_WM16_CONST macro
      net: stmmac: dwmac-rk: switch to FIELD_PREP_WM16 macro
      PCI: rockchip: Switch to FIELD_PREP_WM16* macros
      PCI: dw-rockchip: Switch to FIELD_PREP_WM16 macro
      PM / devfreq: rockchip-dfi: switch to FIELD_PREP_WM16 macro
      clk: sp7021: switch to FIELD_PREP_WM16 macro
      phy: rockchip-pcie: switch to FIELD_PREP_WM16 macro

 MAINTAINERS                                        |   1 +
 drivers/clk/clk-sp7021.c                           |  22 ++--
 drivers/devfreq/event/rockchip-dfi.c               |  27 ++--
 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c    | 142 ++++++++++-----------
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c        |  80 ++++++------
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c     |  68 +++++-----
 drivers/gpu/drm/rockchip/inno_hdmi.c               |  11 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h       |   1 -
 drivers/gpu/drm/rockchip/rockchip_lvds.h           |  21 +--
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c       |  15 ++-
 .../media/platform/synopsys/hdmirx/snps_hdmirx.h   |   6 +-
 drivers/mmc/host/dw_mmc-rockchip.c                 |   9 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c     |   3 +-
 drivers/pci/controller/dwc/pcie-dw-rockchip.c      |  42 +++---
 drivers/pci/controller/pcie-rockchip.h             |  35 ++---
 drivers/phy/rockchip/phy-rockchip-emmc.c           |   3 +-
 drivers/phy/rockchip/phy-rockchip-pcie.c           |  72 +++--------
 drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c  |  11 +-
 drivers/phy/rockchip/phy-rockchip-usb.c            |  51 +++-----
 drivers/soc/rockchip/grf.c                         |  35 +++--
 include/linux/hw_bitfield.h                        |  62 +++++++++
 sound/soc/rockchip/rockchip_i2s_tdm.h              |   4 +-
 22 files changed, 367 insertions(+), 354 deletions(-)
---
base-commit: 0491b8f4897c1ed267446959628592fd1cf8107d
change-id: 20250610-byeword-update-445c0eea771d

Best regards,
-- 
Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

