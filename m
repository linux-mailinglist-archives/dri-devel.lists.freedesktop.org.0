Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F712EA534
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jan 2021 07:08:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F3B889F3C;
	Tue,  5 Jan 2021 06:08:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C0F089F45
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jan 2021 06:08:45 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A32603D7;
 Tue,  5 Jan 2021 07:08:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1609826923;
 bh=k/JBWUln97pXxLNozC0mrLlPsnZZtSHeYPo3vG1jYAY=;
 h=From:To:Cc:Subject:Date:From;
 b=LUcFnm+LG+JYtfQnJbIgXXv4RoJvJ2z6SKE4VHert/x7+rKt6b2WuYmu6CjRtpsn+
 h/B7iTxCf1CE1J9YdTBUShM6GqG8DwjcaoRGJQOsQapfpeqXY6pMjc0t2DAagrFZmc
 AyuPwDCQCY+IWfZG6CGy9NNE9W4mwvMGhnKShjhs=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 0/6] dt-bindings: display: Convert DWC HDMI TX bindings to
 YAML
Date: Tue,  5 Jan 2021 08:08:12 +0200
Message-Id: <20210105060818.24158-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
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
 linux-renesas-soc@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 Mark Yao <markyao0591@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

This patch series attempts a conversion of the DWC HDMI TX DT bindings
to YAML. It's mostly identical to v2, with Mark Yao's e-mail address
updated, tags picked, a small MAINTAINERS updated, and the series now
sent to the devicetree@vger.kernel.org mailing list.

The DWC HDMI TX is an HDMI transmitter IP core from Synopsys, integrated
in various SoCs with different glue layers. As such, some properties are
defined in a common document, but sometimes need to be overridden by
platform-specific bindings.

Patch 1/6 adds a base schema for the common properties, based on the
existing dw_hdmi.txt document. Patches 2/6 to 4/6 then convert the
platform-specific bindings for Renesas, NXP and Rockchip SoCs. Patch 5/6
replaces the reference to dw_hdmi.txt in the Allwinner bindings with a
reference to the YAML base schema, and patch 6/6 drops dw_hdmi.txt.

Compared to v1 (sent as an RFC), the base schema now works properly on
all three platforms, and the schemas have been converted to use the OF
graph schema. A more detailed changelog is available in individual
patches.

I have volunteered Philipp Zabel and Mark Yao as maintainers for the
i.MX6 and Rockchip bindings respectively. Please let me know if you
would prefer a different maintainer, or ack the respective patch if this
is fine with you.

Laurent Pinchart (6):
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
 .../display/bridge/renesas,dw-hdmi.yaml       | 128 ++++++++++++++
 .../display/bridge/synopsys,dw-hdmi.yaml      |  58 +++++++
 .../bindings/display/imx/fsl,imx6-hdmi.yaml   | 130 ++++++++++++++
 .../devicetree/bindings/display/imx/hdmi.txt  |  65 -------
 .../display/rockchip/dw_hdmi-rockchip.txt     |  74 --------
 .../display/rockchip/rockchip,dw-hdmi.yaml    | 158 ++++++++++++++++++
 MAINTAINERS                                   |   2 +-
 10 files changed, 477 insertions(+), 263 deletions(-)
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
