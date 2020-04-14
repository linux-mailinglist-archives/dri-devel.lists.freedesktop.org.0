Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4AC51A81ED
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 17:19:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61E466E1C0;
	Tue, 14 Apr 2020 15:18:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9A9E6E043
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 15:18:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: aratiu) with ESMTPSA id 3117F2A1709
From: Adrian Ratiu <adrian.ratiu@collabora.com>
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-rockchip@lists.infradead.org
Subject: [PATCH v6 6/8] drm: stm: dw-mipi-dsi: let the bridge handle the HW
 version check
Date: Tue, 14 Apr 2020 18:19:53 +0300
Message-Id: <20200414151955.311949-7-adrian.ratiu@collabora.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200414151955.311949-1-adrian.ratiu@collabora.com>
References: <20200414151955.311949-1-adrian.ratiu@collabora.com>
MIME-Version: 1.0
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Adrian Pop <pop.adrian61@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com,
 Arnaud Ferraris <arnaud.ferraris@collabora.com>, linux-imx@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The stm mipi-dsi platform driver added a version test in
commit fa6251a747b7 ("drm/stm: dsi: check hardware version")
so that HW revisions other than v1.3x get rejected. The rockchip
driver had no such check and just assumed register layouts are
v1.3x compatible.

Having such tests was a good idea because only v130/v131 layouts
were supported at the time, however since adding multiple layout
support in the bridge, the version is automatically checked for
all drivers, compatible layouts get picked and unsupported HW is
automatically rejected by the bridge, so there's no use keeping
the test in the stm driver.

The main reason prompting this change is that the stm driver
test immediately disabled the peripheral clock after reading
the version, making the bridge read version 0x0 immediately
after in its own probe(), so we move the clock disabling after
the bridge does the version test.

Tested on STM32F769 and STM32MP1.

Cc: linux-stm32@st-md-mailman.stormreply.com
Reported-by: Adrian Pop <pop.adrian61@gmail.com>
Tested-by: Adrian Pop <pop.adrian61@gmail.com>
Tested-by: Arnaud Ferraris <arnaud.ferraris@collabora.com>
Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
---
New in v6.
---
 drivers/gpu/drm/stm/dw_mipi_dsi-stm.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
index 2e1f2664495d..7218e405d7e2 100644
--- a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
+++ b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
@@ -402,15 +402,6 @@ static int dw_mipi_dsi_stm_probe(struct platform_device *pdev)
 		goto err_dsi_probe;
 	}
 
-	dsi->hw_version = dsi_read(dsi, DSI_VERSION) & VERSION;
-	clk_disable_unprepare(pclk);
-
-	if (dsi->hw_version != HWVER_130 && dsi->hw_version != HWVER_131) {
-		ret = -ENODEV;
-		DRM_ERROR("bad dsi hardware version\n");
-		goto err_dsi_probe;
-	}
-
 	dw_mipi_dsi_stm_plat_data.base = dsi->base;
 	dw_mipi_dsi_stm_plat_data.priv_data = dsi;
 
@@ -423,6 +414,9 @@ static int dw_mipi_dsi_stm_probe(struct platform_device *pdev)
 		goto err_dsi_probe;
 	}
 
+	dsi->hw_version = dsi_read(dsi, DSI_VERSION) & VERSION;
+	clk_disable_unprepare(pclk);
+
 	return 0;
 
 err_dsi_probe:
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
