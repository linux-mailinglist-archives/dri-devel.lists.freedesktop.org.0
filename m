Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AAB42F5AC8
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 07:45:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15EA189709;
	Thu, 14 Jan 2021 06:45:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3940D89709
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 06:44:59 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1CCCF279;
 Thu, 14 Jan 2021 07:44:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1610606698;
 bh=H1Y9wGIsveto/3vqMzcWXLNQSEdFp0vFQVeOythp8lI=;
 h=From:To:Cc:Subject:Date:From;
 b=BrxUHnvgX+d6pF4xrBTxsymacpsoRSebMomz1Q3J2NVSYdbWQXQuH/4oXqp3eWDAL
 SWzzDPzGUsbGlPK+pxwE1bWdHH1ljYFIKjp7Hq6CsVWXQBBeiApn5weCCcWEbIVTFz
 JnkW+vVWyxLpqaFp2Hi8PcJWLAHks6xePt4eEOJE=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 0/7] dt-bindings: display: Convert DWC HDMI TX bindings to
 YAML
Date: Thu, 14 Jan 2021 08:44:30 +0200
Message-Id: <20210114064437.5793-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
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
Cc: devicetree@vger.kernel.org, Sandy Huang <hjc@rock-chips.com>,
 linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Mark Yao <markyao0591@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

This patch series attempts a conversion of the DWC HDMI TX DT bindings
to YAML.

The DWC HDMI TX is an HDMI transmitter IP core from Synopsys, integrated
in various SoCs with different glue layers. As such, some properties are
defined in a common document, but sometimes need to be overridden by
platform-specific bindings.

Compared to v3, the series incorporates small review feedback, and has
gained patch 1/7 that updated the imx6q(dl) device trees to use 'ports'
nodes. Patch 2/7 then adds a base schema for the common properties,
based on the existing dw_hdmi.txt document. Patches 3/7 to 5/7 then
convert the platform-specific bindings for Renesas, NXP and Rockchip
SoCs. Patch 6/7 replaces the reference to dw_hdmi.txt in the Allwinner
bindings with a reference to the YAML base schema, and patch 7/7 drops
dw_hdmi.txt.

I have volunteered Philipp Zabel and Mark Yao as maintainers for the
i.MX6 and Rockchip bindings respectively. Could you please let me know
if you would prefer a different maintainer, or ack the respective patch
if this is fine with you ?

It seems to be difficult to find a maintainer for the RockChip bindings.
In the event that no maintainer can be found, Rob has recommended to
simply delete the text-based bindings, which I would prefer not being
forced to do in a v5.

Laurent Pinchart (7):
  ARM: dts: imx6q(dl): Move 'port' nodes under 'ports' for HDMI encoder
  dt-bindings: display: bridge: Add YAML schema for Synopsys DW-HDMI
  dt-bindings: display: bridge: renesas,dw-hdmi: Convert binding to YAML
  dt-bindings: display: imx: hdmi: Convert binding to YAML
  dt-bindings: display: rockchip: dw-hdmi: Convert binding to YAML
  dt-bindings: display: sun8i-a83t-dw-hdmi: Reference dw-hdmi YAML
    schema
  dt-bindings: display: bridge: Remove deprecated dw_hdmi.txt

 .../display/allwinner,sun8i-a83t-dw-hdmi.yaml |   4 +-
 .../bindings/display/bridge/dw_hdmi.txt       |  33 ----
 .../display/bridge/renesas,dw-hdmi.txt        |  88 ----------
 .../display/bridge/renesas,dw-hdmi.yaml       | 125 ++++++++++++++
 .../display/bridge/synopsys,dw-hdmi.yaml      |  55 ++++++
 .../bindings/display/imx/fsl,imx6-hdmi.yaml   | 126 ++++++++++++++
 .../devicetree/bindings/display/imx/hdmi.txt  |  65 --------
 .../display/rockchip/dw_hdmi-rockchip.txt     |  74 ---------
 .../display/rockchip/rockchip,dw-hdmi.yaml    | 156 ++++++++++++++++++
 MAINTAINERS                                   |   2 +-
 arch/arm/boot/dts/imx6q.dtsi                  |  20 ++-
 arch/arm/boot/dts/imx6qdl.dtsi                |  25 +--
 12 files changed, 490 insertions(+), 283 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/bridge/dw_hdmi.txt
 delete mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
 create mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.yaml
 create mode 100644 Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/imx/hdmi.txt
 delete mode 100644 Documentation/devicetree/bindings/display/rockchip/dw_hdmi-rockchip.txt
 create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml

-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
