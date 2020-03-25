Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3188E193A74
	for <lists+dri-devel@lfdr.de>; Thu, 26 Mar 2020 09:08:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7984F6E2D6;
	Thu, 26 Mar 2020 08:08:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB75088A3E
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Mar 2020 17:31:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 24ED229699D
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: robh+dt@kernel.org, mark.rutland@arm.com, ck.hu@mediatek.com,
 p.zabel@pengutronix.de, airlied@linux.ie, mturquette@baylibre.com,
 sboyd@kernel.org, ulrich.hecht+renesas@gmail.com,
 laurent.pinchart@ideasonboard.com
Subject: [RESEND PATCH v12 0/5] arm/arm64: mediatek: Fix mt8173 mmsys device
 probing
Date: Wed, 25 Mar 2020 18:31:18 +0100
Message-Id: <20200325173123.3569606-1-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 26 Mar 2020 08:08:32 +0000
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>, dri-devel@lists.freedesktop.org,
 Richard Fontana <rfontana@redhat.com>,
 Collabora Kernel ML <kernel@collabora.com>, linux-clk@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, Weiyi Lu <weiyi.lu@mediatek.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, wens@csie.org,
 linux-arm-kernel@lists.infradead.org, mtk01761 <wendell.lin@mediatek.com>,
 Owen Chen <owen.chen@mediatek.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, frank-w@public-files.de,
 Seiya Wang <seiya.wang@mediatek.com>, sean.wang@mediatek.com,
 Houlong Wei <houlong.wei@mediatek.com>, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Allison Randal <allison@lohutok.net>, Matthias Brugger <mbrugger@suse.com>,
 Fabien Parent <fparent@baylibre.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, matthias.bgg@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Patches rebased on top of a clean 5.6-rc1 branch]

Dear all,

These patches are intended to solve an old standing issue on some
Mediatek devices (mt8173, mt2701 and mt2712 are affected by this issue).

Up to now both drivers, clock and drm are probed with the same device tree
compatible. But only the first driver gets probed, which in effect breaks
graphics on those devices.

The MMSYS (Multimedia subsystem) in Mediatek SoCs has some registers to
control clock gates (which is used in the clk driver) and some registers
to set the routing and enable the differnet blocks of the display
and MDP (Media Data Path) subsystem. On this series the clk driver is
not a pure clock controller but a system controller that can provide
access to the shared registers between the different drivers that need
it (mediatek-drm and mediatek-mdp). Hence the MMSYS clk driver was moved
to drivers/soc/mediatek and is the entry point (parent) which will trigger
the probe of the corresponding mediatek-drm driver.

**IMPORTANT** This series only fixes the issue on mt8173 to make it
simple and as is the only platform I can test. Similar changes should be
applied for mt2701 and mt2712 to have display working.

These patches apply on top of linux-next.

For reference, here are the links to the old discussions:
* v11: https://patchwork.kernel.org/project/linux-mediatek/list/?series=249871
* v10: https://patchwork.kernel.org/project/linux-mediatek/list/?series=248505
* v9: https://patchwork.kernel.org/project/linux-clk/list/?series=247591
* v8: https://patchwork.kernel.org/project/linux-mediatek/list/?series=244891
* v7: https://patchwork.kernel.org/project/linux-mediatek/list/?series=241217
* v6: https://patchwork.kernel.org/project/linux-mediatek/list/?series=213219
* v5: https://patchwork.kernel.org/project/linux-mediatek/list/?series=44063
* v4:
  * https://patchwork.kernel.org/patch/10530871/
  * https://patchwork.kernel.org/patch/10530883/
  * https://patchwork.kernel.org/patch/10530885/
  * https://patchwork.kernel.org/patch/10530911/
  * https://patchwork.kernel.org/patch/10530913/
* v3:
  * https://patchwork.kernel.org/patch/10367857/
  * https://patchwork.kernel.org/patch/10367861/
  * https://patchwork.kernel.org/patch/10367877/
  * https://patchwork.kernel.org/patch/10367875/
  * https://patchwork.kernel.org/patch/10367885/
  * https://patchwork.kernel.org/patch/10367883/
  * https://patchwork.kernel.org/patch/10367889/
  * https://patchwork.kernel.org/patch/10367907/
  * https://patchwork.kernel.org/patch/10367909/
  * https://patchwork.kernel.org/patch/10367905/
* v2: No relevant discussion, see v3
* v1:
  * https://patchwork.kernel.org/patch/10016497/
  * https://patchwork.kernel.org/patch/10016499/
  * https://patchwork.kernel.org/patch/10016505/
  * https://patchwork.kernel.org/patch/10016507/

Best regards,
 Enric

Changes in v12:
- Leave the clocks part in drivers/clk (clk-mt8173-mm)
- Instantiate the clock driver from the mtk-mmsys driver.
- Add default config option to not break anything.
- Removed the Reviewed-by CK tag as changed the organization.

Changes in v10:
- Update the binding documentation for the mmsys system controller.
- Renamed to be generic mtk-mmsys
- Add driver data support to be able to support diferent SoCs
- Select CONFIG_MTK_MMSYS (CK)
- Pass device pointer of mmsys device instead of config regs (CK)
- Match driver data to get display routing.

Changes in v9:
- Move mmsys to drivers/soc/mediatek (CK)
- Introduced a new patch to move routing control into mmsys driver.
- Removed the patch to use regmap as is not needed anymore.
- Do not move the display routing from the drm driver (CK)

Changes in v8:
- Be a builtin_platform_driver like other mediatek mmsys drivers.
- New patch introduced in this series.

Changes in v7:
- Free clk_data->clks as well
- Get rid of private data structure

Enric Balletbo i Serra (3):
  dt-bindings: mediatek: Update mmsys binding to reflect it is a system
    controller
  soc / drm: mediatek: Move routing control to mmsys device
  soc / drm: mediatek: Fix mediatek-drm device probing

Matthias Brugger (2):
  drm/mediatek: Omit warning on probe defers
  clk / soc: mediatek: Move mt8173 MMSYS to platform driver

 .../bindings/arm/mediatek/mediatek,mmsys.txt  |   7 +-
 drivers/clk/mediatek/Kconfig                  |   7 +
 drivers/clk/mediatek/Makefile                 |   1 +
 drivers/clk/mediatek/clk-mt8173-mm.c          | 146 ++++++++
 drivers/clk/mediatek/clk-mt8173.c             | 104 ------
 drivers/gpu/drm/mediatek/Kconfig              |   1 +
 drivers/gpu/drm/mediatek/mtk_disp_color.c     |   5 +-
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c       |   5 +-
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c      |   5 +-
 drivers/gpu/drm/mediatek/mtk_dpi.c            |  12 +-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c       |  19 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp.c        | 259 +-------------
 drivers/gpu/drm/mediatek/mtk_drm_ddp.h        |   7 -
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  45 +--
 drivers/gpu/drm/mediatek/mtk_drm_drv.h        |   2 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c            |   8 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c           |   4 +-
 drivers/soc/mediatek/Kconfig                  |   8 +
 drivers/soc/mediatek/Makefile                 |   1 +
 drivers/soc/mediatek/mtk-mmsys.c              | 335 ++++++++++++++++++
 include/linux/soc/mediatek/mtk-mmsys.h        |  20 ++
 21 files changed, 590 insertions(+), 411 deletions(-)
 create mode 100644 drivers/clk/mediatek/clk-mt8173-mm.c
 create mode 100644 drivers/soc/mediatek/mtk-mmsys.c
 create mode 100644 include/linux/soc/mediatek/mtk-mmsys.h

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
