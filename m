Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC4A6ADE34
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 13:00:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4B7410E468;
	Tue,  7 Mar 2023 12:00:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D28F10E468
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 11:59:59 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pZVyN-0006T7-KM; Tue, 07 Mar 2023 12:59:15 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pZVyF-002TEW-9a; Tue, 07 Mar 2023 12:59:07 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pZVyE-002yig-5U; Tue, 07 Mar 2023 12:59:06 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Icenowy Zheng <uwu@icenowy.me>, Justin Chen <justinpopo6@gmail.com>,
 Al Cooper <alcooperx@gmail.com>, Pratyush Yadav <p.yadav@ti.com>,
 Rahul T R <r-ravikumar@ti.com>, Swapnil Jakhade <sjakhade@cadence.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Liu Ying <victor.liu@nxp.com>,
 Yuan Can <yuancan@huawei.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Miaoqian Lin <linmq006@gmail.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Heiko Stuebner <heiko@sntech.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Amelie Delaunay <amelie.delaunay@foss.st.com>,
 Dan Carpenter <error27@gmail.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>, JC Kuo <jckuo@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Roger Quadros <rogerq@kernel.org>,
 Matt Ranostay <mranostay@ti.com>, Sinthu Raja <sinthu.raja@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Tanmay Patil <t-patil@ti.com>,
 Siddharth Vadapalli <s-vadapalli@ti.com>, Lv Ruyi <lv.ruyi@zte.com.cn>
Subject: [PATCH 00/31] phy: Convert to platform remove callback returning void
Date: Tue,  7 Mar 2023 12:58:29 +0100
Message-Id: <20230307115900.2293120-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=5818;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=MYs5JN8sdLbdhFqX1o8FkbSoO7sfiFpKaRQbsKFPJqQ=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkByZ3qXmeqAA+C0xt3Tbnmc2ihyUokkXi7q3YR
 NmSTiOqsGOJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAcmdwAKCRDB/BR4rcrs
 CQWGB/411PW1y2WnaZUJlgvVPVtj4QZujEz8AqlBRHTptyhx5CaQGlPe5Xdx6F1Q5b+kPwyAdD9
 /HAdHufSEHfPbZGDUn4HLokWRJ8EGqimHminkBYxmUvdoH5XYFmaQwZ6a88+sD124laNpghG7TD
 rX6oqjXAt4PTE/fQrGyqD/tWwDxLRZpczwfFESmWk28IPcjCEOQQP+2oSas8Mef2Oc8JJQWBCvl
 YDEq69SPXLHguNB1ZudTCSbi4KAzJ9LHrwEWqumQjr2K3Du5Gg91o9+6EaSl2YQGu5XnPFgmqQ3
 cWA/IVc9vOXlx2ruwlHvEB1wcclx//PSUSpKGg2356dPcYJG
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-rockchip@lists.infradead.org,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 NXP Linux Team <linux-imx@nxp.com>, kernel@pengutronix.de,
 linux-phy@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

this patch series adapts the platform drivers below drivers/phy to use the
.remove_new() callback. Compared to the traditional .remove() callback
.remove_new() returns no value. This is a good thing because the driver core
doesn't (and cannot) cope for errors during remove. The only effect of a
non-zero return value in .remove() is that the driver core emits a warning. The
device is removed anyhow and an early return from .remove() usually yields a
resource leak.

By changing the remove callback to return void driver authors cannot
reasonably assume any more that there is some kind of cleanup later.

All drivers in drivers/spmi returned zero unconditionally in their remove
callback, so they could all be converted trivially to .remove_new().

Note that this series depends on commit 5c5a7680e67b ("platform: Provide
a remove callback that returns no value") which is included in v6.3-rc1.

Best regards
Uwe

Uwe Kleine-König (31):
  phy: allwinner: phy-sun4i-usb: Convert to platform remove callback
    returning void
  phy: broadcom: phy-brcm-usb: Convert to platform remove callback
    returning void
  phy: cadence: cdns-dphy: Convert to platform remove callback returning
    void
  phy: cadence: phy-cadence-sierra: Convert to platform remove callback
    returning void
  phy: cadence: phy-cadence-torrent: Convert to platform remove callback
    returning void
  phy: freescale: phy-fsl-imx8qm-lvds-phy: Convert to platform remove
    callback returning void
  phy: intel: phy-intel-lgm-combo: Convert to platform remove callback
    returning void
  phy: mediatek: phy-mtk-mipi-dsi: Convert to platform remove callback
    returning void
  phy: motorola: phy-cpcap-usb: Convert to platform remove callback
    returning void
  phy: motorola: phy-mapphone-mdm6600: Convert to platform remove
    callback returning void
  phy: phy-lgm-usb: Convert to platform remove callback returning void
  phy: qualcomm: phy-qcom-apq8064-sata: Convert to platform remove
    callback returning void
  phy: qualcomm: phy-qcom-eusb2-repeater: Convert to platform remove
    callback returning void
  phy: qualcomm: phy-qcom-ipq806x-sata: Convert to platform remove
    callback returning void
  phy: renesas: phy-rcar-gen3-pcie: Convert to platform remove callback
    returning void
  phy: renesas: phy-rcar-gen3-usb2: Convert to platform remove callback
    returning void
  phy: renesas: phy-rcar-gen3-usb3: Convert to platform remove callback
    returning void
  phy: renesas: r8a779f0-ether-serdes: Convert to platform remove
    callback returning void
  phy: rockchip: phy-rockchip-inno-csidphy: Convert to platform remove
    callback returning void
  phy: rockchip: phy-rockchip-inno-dsidphy: Convert to platform remove
    callback returning void
  phy: rockchip: phy-rockchip-inno-hdmi: Convert to platform remove
    callback returning void
  phy: rockchip: phy-rockchip-typec: Convert to platform remove callback
    returning void
  phy: st: phy-stm32-usbphyc: Convert to platform remove callback
    returning void
  phy: tegra: xusb: Convert to platform remove callback returning void
  phy: ti: phy-am654-serdes: Convert to platform remove callback
    returning void
  phy: ti: phy-da8xx-usb: Convert to platform remove callback returning
    void
  phy: ti: phy-dm816x-usb: Convert to platform remove callback returning
    void
  phy: ti: phy-j721e-wiz: Convert to platform remove callback returning
    void
  phy: ti: phy-omap-usb2: Convert to platform remove callback returning
    void
  phy: ti: phy-ti-pipe3: Convert to platform remove callback returning
    void
  phy: ti: phy-twl4030-usb: Convert to platform remove callback
    returning void

 drivers/phy/allwinner/phy-sun4i-usb.c            | 6 ++----
 drivers/phy/broadcom/phy-brcm-usb.c              | 6 ++----
 drivers/phy/cadence/cdns-dphy.c                  | 6 ++----
 drivers/phy/cadence/phy-cadence-sierra.c         | 6 ++----
 drivers/phy/cadence/phy-cadence-torrent.c        | 6 ++----
 drivers/phy/freescale/phy-fsl-imx8qm-lvds-phy.c  | 6 ++----
 drivers/phy/intel/phy-intel-lgm-combo.c          | 5 ++---
 drivers/phy/mediatek/phy-mtk-mipi-dsi.c          | 5 ++---
 drivers/phy/motorola/phy-cpcap-usb.c             | 6 ++----
 drivers/phy/motorola/phy-mapphone-mdm6600.c      | 6 ++----
 drivers/phy/phy-lgm-usb.c                        | 6 ++----
 drivers/phy/qualcomm/phy-qcom-apq8064-sata.c     | 6 ++----
 drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c   | 8 +++-----
 drivers/phy/qualcomm/phy-qcom-ipq806x-sata.c     | 6 ++----
 drivers/phy/renesas/phy-rcar-gen3-pcie.c         | 6 ++----
 drivers/phy/renesas/phy-rcar-gen3-usb2.c         | 6 ++----
 drivers/phy/renesas/phy-rcar-gen3-usb3.c         | 6 ++----
 drivers/phy/renesas/r8a779f0-ether-serdes.c      | 6 ++----
 drivers/phy/rockchip/phy-rockchip-inno-csidphy.c | 6 ++----
 drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c | 6 ++----
 drivers/phy/rockchip/phy-rockchip-inno-hdmi.c    | 6 ++----
 drivers/phy/rockchip/phy-rockchip-typec.c        | 6 ++----
 drivers/phy/st/phy-stm32-usbphyc.c               | 6 ++----
 drivers/phy/tegra/xusb.c                         | 6 ++----
 drivers/phy/ti/phy-am654-serdes.c                | 6 ++----
 drivers/phy/ti/phy-da8xx-usb.c                   | 6 ++----
 drivers/phy/ti/phy-dm816x-usb.c                  | 6 ++----
 drivers/phy/ti/phy-j721e-wiz.c                   | 6 ++----
 drivers/phy/ti/phy-omap-usb2.c                   | 6 ++----
 drivers/phy/ti/phy-ti-pipe3.c                    | 6 ++----
 drivers/phy/ti/phy-twl4030-usb.c                 | 6 ++----
 31 files changed, 63 insertions(+), 123 deletions(-)

base-commit: fe15c26ee26efa11741a7b632e9f23b01aca4cc6
-- 
2.39.1

