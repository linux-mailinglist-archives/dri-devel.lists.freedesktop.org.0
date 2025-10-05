Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DEDEBBCE33
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 01:55:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7765110E0F1;
	Sun,  5 Oct 2025 23:55:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dNmIR7td";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B67A710E0F1
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Oct 2025 23:55:51 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 9FAAC11AE;
 Mon,  6 Oct 2025 01:54:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1759708456;
 bh=H6DUy7gUUFzf7L9G58j7/brWtZ1vdQDbJMU7TIx2b+s=;
 h=From:To:Cc:Subject:Date:From;
 b=dNmIR7tdjJz+LYW1VSS0Y7dcW6TLI9FViOmnzeC7yViytgHDpSdGEyPvjxxFapuUk
 /7SrVAUPeep41iQdUU0CO2lK/t60W+xSkisdTPazs+fjlf4VOx7zUpZkyO2Smt6BZg
 4PKwXuHeKlgX/7HSFG41gdaqodKY/AakpMeTU2bw=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Cc: Alexey Charkov <alchark@gmail.com>, Algea Cao <algea.cao@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Cenk Uluisik <cenk.uluisik@googlemail.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Heiko Stuebner <heiko@sntech.de>, Jimmy Hon <honyuenkwun@gmail.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Muhammed Efe Cetin <efectn@6tel.net>,
 Ondrej Jirman <megi@xff.cz>, Rob Herring <robh@kernel.org>,
 Sandy Huang <hjc@rock-chips.com>
Subject: [PATCH v2 0/5] arm64: dts: rockchip: Add device tree for the Orange
 Pi CM5 Base board
Date: Mon,  6 Oct 2025 02:55:36 +0300
Message-ID: <20251005235542.1017-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
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

Hello,

This patch series adds a device tree for the Orange Pi CM5 Base board
from Xunlong. This is a combination of a compute module and a carrier
board, so the device tree is split in two files.

The work is based on a combination of upstream device trees for other
RK3588-based Orange Pi boards and the downstream device tree, all
checked against the available schematics for the carrier board. The
compute module schematics is unfortunately not available.

The series starts with three patches that add a new tmds-enable-gpios
property to the rk3588-dw-hdmi-qp DT binding (1/5) and update the driver
accordingly (2/5 and 3/5). Those patches have been authored by Cristian
Ciocaltea as part of a larger series, I have incorporated them here
as-is.

Patch 4/5 then add a new compatible for the board to arm/rockchip.yaml.
The last patch (5/5) adds the device tree for the board.

Patches 2/5 and 3/5 could be merged separately through the DRM tree,
but patch 1/5 needs to be merged with the device tree in 5/5 to avoid
introducing DT validation warnings. I'd appreciate advice from the DT
maintainers regarding how to handle this, as I have been told before
that DT bindings and DT sources can't be merged through the same tree.

Cristian Ciocaltea (3):
  dt-bindings: display: rk3588-dw-hdmi-qp: Add tmds-enable-gpios
    property
  drm/rockchip: dw_hdmi_qp: Improve error handling with dev_err_probe()
  drm/rockchip: dw_hdmi_qp: Fixup usage of enable_gpio member in main
    struct

Laurent Pinchart (2):
  dt-bindings: arm: rockchip: Add Orange Pi CM5 Base
  arm64: dts: rockchip: Add rk3588s-orangepi-cm5-base device tree

 .../devicetree/bindings/arm/rockchip.yaml     |   6 +
 .../rockchip/rockchip,rk3588-dw-hdmi-qp.yaml  |  10 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../rockchip/rk3588s-orangepi-cm5-base.dts    | 346 +++++++++++++
 .../dts/rockchip/rk3588s-orangepi-cm5.dtsi    | 473 ++++++++++++++++++
 .../gpu/drm/rockchip/dw_hdmi_qp-rockchip.c    |  70 ++-
 6 files changed, 864 insertions(+), 42 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-cm5-base.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-cm5.dtsi


base-commit: e5f0a698b34ed76002dc5cff3804a61c80233a7a
-- 
Regards,

Laurent Pinchart

