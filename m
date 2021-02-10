Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5483164AC
	for <lists+dri-devel@lfdr.de>; Wed, 10 Feb 2021 12:10:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9EC56EC53;
	Wed, 10 Feb 2021 11:10:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAD576EC52
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 11:10:26 +0000 (UTC)
Received: from [95.90.166.74] (helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1l9nO2-0003eN-DW; Wed, 10 Feb 2021 12:10:22 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/6] Support second Image Signal Processor on rk3399
Date: Wed, 10 Feb 2021 12:10:14 +0100
Message-Id: <20210210111020.2476369-1-heiko@sntech.de>
X-Mailer: git-send-email 2.29.2
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
Cc: devicetree@vger.kernel.org, dafna.hirschfeld@collabora.com,
 cmuellner@linux.com, hjc@rock-chips.com, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, helen.koike@collabora.com,
 robh+dt@kernel.org, sebastian.fricke@posteo.net, ezequiel@collabora.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The rk3399 has two ISPs and right now only the first one is usable.
The second ISP is connected to the TXRX dphy on the soc.

The phy of ISP1 is only accessible through the DSI controller's
io-memory, so this series adds support for simply using the dsi
controller is a phy if needed.

That solution is needed at least on rk3399 and rk3288 but no-one
has looked at camera support on rk3288 at all, so right now
only implement the rk3399 specifics.

changes in v2:
- enable grf-clock also for init callback
  to not break if for example hdmi is connected on boot
  and disabled the grf clock during its probe
- add Sebastian's Tested-by
- add Rob's Ack for the phy-cells property

Heiko Stuebner (6):
  drm/rockchip: dsi: add own additional pclk handling
  dt-bindings: display: rockchip-dsi: add optional #phy-cells property
  drm/rockchip: dsi: add ability to work as a phy instead of full dsi
  arm64: dts: rockchip: add #phy-cells to mipi-dsi1
  arm64: dts: rockchip: add cif clk-control pinctrl for rk3399
  arm64: dts: rockchip: add isp1 node on rk3399

 .../display/rockchip/dw_mipi_dsi_rockchip.txt |   1 +
 arch/arm64/boot/dts/rockchip/rk3399.dtsi      |  39 ++
 drivers/gpu/drm/rockchip/Kconfig              |   2 +
 .../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   | 349 ++++++++++++++++++
 4 files changed, 391 insertions(+)

-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
