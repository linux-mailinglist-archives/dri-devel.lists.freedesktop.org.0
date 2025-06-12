Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60211AD7A0E
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 20:56:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CDB910E0E8;
	Thu, 12 Jun 2025 18:56:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="XzC/xsR7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1162910E0A6
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 18:56:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1749754584; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=EdJZfDxsprpXvjM+Msqvvl1RDspq+yjB9A4hg93KgWxptseH4FFSNtHttZfa1cgcz5kNlnLzyywmUD+Sgl2hH44HzK9gHBFlBm3asaHSydn4R+Ch3wwpnnc5tLDvWAbqFHjpoG6BnF/OF7/tky45/4LIwJ1NPCssaAeZnc/+bso=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1749754584;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=iOnbYnaE1YbBtaVTatR6PeV03EiI8qVZV78p6KFGMJk=; 
 b=dD1ImpFvj4DitiIHZ6VirMaIkNElMH+Liqr6H3WikImv1JXhL5B3J/Lf2jb+3E+5ZtpDXMRQg79yx/njiAOLmn+Kqi9x3tNjTdD7M5LFSIp7SeTNfE+TwFYH6pXsMcF9LUmzDgrZP2QO4yG+zvllSyeXFPLnG5FrnaHuFvt7iac=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749754584; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
 bh=iOnbYnaE1YbBtaVTatR6PeV03EiI8qVZV78p6KFGMJk=;
 b=XzC/xsR7Xr/DpJiXhQHzQo5ryxr5+gW5+MLUrocYGyhR0dLCFAp/BzFD1hLwpIkl
 hvQMX1pm8vJpdtfxstY7gf9C0XQ5PLueP//xoPjWNN7aSX8Xfl2rdWZoa7VO7MmoC05
 MSWjuK5+KIi3CAPTZlg7KtbtVH3YNmUUq3yBXeCM=
Received: by mx.zohomail.com with SMTPS id 17497545829051009.0539110789078;
 Thu, 12 Jun 2025 11:56:22 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: [PATCH 00/20] BYEWORD_UPDATE: unifying (most) HIWORD_UPDATE macros
Date: Thu, 12 Jun 2025 20:56:02 +0200
Message-Id: <20250612-byeword-update-v1-0-f4afb8f6313f@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMIiS2gC/yXMQQ6DIBCF4auQWXcaMIqJV2lcIEzbWSh2QFtjv
 LukLr+XvH+HRMKUoFM7CK2cOE4F5qbAv930IuRQDJWuGm2NxmGjb5SAyxxcJqzrxmsi17YmQDn
 NQk/+/YOP/rLQZyndfI0wuETo4zhy7tRq78aieAP9cZw6r1InjQAAAA==
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
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
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

The first patch of the series introduces the two new macros in
bitfield.h, called HWORD_UPDATE and HWORD_UPDATE_CONST. The latter can
be used in initializers.

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

https://lore.kernel.org/all/aD8hB-qJ4Qm6IFuS@yury/ [1]

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
Nicolas Frattaroli (20):
      bitfield: introduce HWORD_UPDATE bitfield macros
      mmc: dw_mmc-rockchip: switch to HWORD_UPDATE macro
      soc: rockchip: grf: switch to HWORD_UPDATE_CONST macro
      media: synopsys: hdmirx: replace macros with bitfield variants
      drm/rockchip: lvds: switch to HWORD_UPDATE macro
      phy: rockchip-emmc: switch to HWORD_UPDATE macro
      drm/rockchip: dsi: switch to HWORD_UPDATE* macros
      drm/rockchip: vop2: switch to HWORD_UPDATE macro
      phy: rockchip-samsung-dcphy: switch to HWORD_UPDATE macro
      drm/rockchip: dw_hdmi_qp: switch to HWORD_UPDATE macro
      drm/rockchip: inno-hdmi: switch to HWORD_UPDATE macro
      phy: rockchip-usb: switch to HWORD_UPDATE macro
      drm/rockchip: dw_hdmi: switch to HWORD_UPDATE* macros
      ASoC: rockchip: i2s-tdm: switch to HWORD_UPDATE_CONST macro
      net: stmmac: dwmac-rk: switch to HWORD_UPDATE macro
      PCI: rockchip: switch to HWORD_UPDATE* macros
      PCI: dw-rockchip: switch to HWORD_UPDATE macro
      PM / devfreq: rockchip-dfi: switch to HWORD_UPDATE macro
      clk: sp7021: switch to HWORD_UPDATE macro
      phy: rockchip-pcie: switch to HWORD_UPDATE macro

 drivers/clk/clk-sp7021.c                           |  21 +--
 drivers/devfreq/event/rockchip-dfi.c               |  26 ++--
 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c    | 142 ++++++++++-----------
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c        |  80 ++++++------
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c     |  68 +++++-----
 drivers/gpu/drm/rockchip/inno_hdmi.c               |  11 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h       |   1 -
 drivers/gpu/drm/rockchip/rockchip_lvds.h           |  21 +--
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c       |  14 +-
 .../media/platform/synopsys/hdmirx/snps_hdmirx.h   |   5 +-
 drivers/mmc/host/dw_mmc-rockchip.c                 |   7 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c     |   3 +-
 drivers/pci/controller/dwc/pcie-dw-rockchip.c      |  39 +++---
 drivers/pci/controller/pcie-rockchip.h             |  35 ++---
 drivers/phy/rockchip/phy-rockchip-emmc.c           |   3 +-
 drivers/phy/rockchip/phy-rockchip-pcie.c           |  72 +++--------
 drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c  |  10 +-
 drivers/phy/rockchip/phy-rockchip-usb.c            |  51 +++-----
 drivers/soc/rockchip/grf.c                         |  35 +++--
 include/linux/bitfield.h                           |  47 +++++++
 sound/soc/rockchip/rockchip_i2s_tdm.h              |   4 +-
 21 files changed, 342 insertions(+), 353 deletions(-)
---
base-commit: d9946fe286439c2aeaa7953b8c316efe5b83d515
change-id: 20250610-byeword-update-445c0eea771d

Best regards,
-- 
Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

