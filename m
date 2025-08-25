Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBE7B338BB
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 10:29:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EF2010E162;
	Mon, 25 Aug 2025 08:29:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="XEZR1DZV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 591F810E162
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 08:29:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1756110534; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Kaj07l+KJHjwgrTN4ypGgxEUJROoxxzaBsZnD3OUf+5LDOOblsn6wic7dsefSAxyPDtLeAFyHyNj4MyNlFgYaJh6rL6EEaK2ap7IFl36mnCWMVIBkFIwFYhJKoaa1dFlSOgEBDriZ5ampiH3TQgtb0HWkQjW9DTEu6oqrrC9lIs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1756110534;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=7Fvpfg+PNyagHR37TkE0ZPNG3x9nZudXe4XKD4LHhxs=; 
 b=OISu4RIgKAxjJ6YaqWywRv+alPbF+6bm5tW49+Hu42Rhbr8YbkOc5FLr6ktF4nBc6maYTwTa467/RzI0MVPBzUdvNcuXS2f6ByaS7WlAi3XL7A2RO+sp5CwMO3m94KBZERAoNX8dZxeokAgVACKgBBlaZV3qMZ7UZnBdmJAim6U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1756110534; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
 bh=7Fvpfg+PNyagHR37TkE0ZPNG3x9nZudXe4XKD4LHhxs=;
 b=XEZR1DZVfgAILwelSAZzqFJzCfY4YMXWOXBkoUa/GooArBWTMLDzJ2m7VYeOvBQT
 itI76enUGOZQyHq6PoqNRc73MEwkuAtpxKglF/vgLCTyD92/uMzRh94Y+ih+OVxXidw
 3qvKuI8g/IPc4ECDUqgjddCkbICkQkC3LnmOsoVU=
Received: by mx.zohomail.com with SMTPS id 1756110531357309.34716059553057;
 Mon, 25 Aug 2025 01:28:51 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: [PATCH v3 00/20] BYEWORD_UPDATE: unifying (most) HIWORD_UPDATE macros
Date: Mon, 25 Aug 2025 10:28:20 +0200
Message-Id: <20250825-byeword-update-v3-0-947b841cdb29@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKQerGgC/2XOTQ6DIBAF4KsY1qUB/E1XvUfTBeJQSVQsINUY7
 16KXTR1+SZ535sVWTAKLLokKzLglVV6CCE9JUi0fHgAVk3IiBGWk4ISXC/w0qbB09hwBzjLckE
 AeFnSBoXSaECqOYK3+54NPKfguv2Iam4BC933yl2SAWaHo12xHH0KrbJOmyU+5GlsfLfZ/7anm
 GCZcVlXskhpKq9Cdx2vteHnMBA5z34Ilh4IFgghqRSk4gzogdi27Q2HCXpbJAEAAA==
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
Changes in v3:
- Rebased onto next-20250825
- Link to v2: https://lore.kernel.org/r/20250623-byeword-update-v2-0-cf1fc08a2e1f@collabora.com

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
 drivers/phy/rockchip/phy-rockchip-pcie.c           |  70 +++-------
 drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c  |  11 +-
 drivers/phy/rockchip/phy-rockchip-usb.c            |  51 +++-----
 drivers/soc/rockchip/grf.c                         |  35 +++--
 include/linux/hw_bitfield.h                        |  62 +++++++++
 sound/soc/rockchip/rockchip_i2s_tdm.h              |   4 +-
 22 files changed, 366 insertions(+), 353 deletions(-)
---
base-commit: 0c5416a62c0e4df1b3f79b5c74c03cd48df51357
change-id: 20250610-byeword-update-445c0eea771d

Best regards,
-- 
Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

