Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 671D319EE9B
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 01:39:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84C876E047;
	Sun,  5 Apr 2020 23:39:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 361E46E047
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Apr 2020 23:39:50 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 267C4312;
 Mon,  6 Apr 2020 01:39:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1586129988;
 bh=6VchiPVQOO9qDrHUWlvtCiysMW0iF/kHZd2lJ+9uQyY=;
 h=From:To:Cc:Subject:Date:From;
 b=Zm9Vk0ylU9HkwCbDsH8G0VHOWGRR3BCDO0QXoj5NErvyjJ0nuEu0gAuBMU1KPAXTk
 4D9wSeRF3wvGhQf1u5az9pUCy7IRM0GNgMCovaBcpuddN+d6Oqsn8tpmvLhIsmvnGg
 9tS8n3cOpMfpSu9JFjblVd27MXKTp9g/EX/A4rUE=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: devicetree@vger.kernel.org
Subject: [PATCH/RFC 0/6] dt-bindings: display: Convert DWC HDMI TX bindings to
 YAML
Date: Mon,  6 Apr 2020 02:39:29 +0300
Message-Id: <20200405233935.27599-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
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
Cc: Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 Mark Yao <mark.yao@rock-chips.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

This patch series attempts a conversion of the DWC HDMI TX DT bindings
to YAML. I've marked it as RFC as the base schema doesn't work is
intended in this (naive) approach, and I'm not sure how to fix it
properly.

The DWC HDMI TX is an HDMI transmitter IP core from Synopsys, integrated
in various SoCs with different glue layers. As such, some properties are
defined in a common document, but sometimes need to be overridden by
platform-specific bindings.

Patch 1/6 adds a base schema for the common properties, based on the
existing dw_hdmi.txt document. Patches 2/6 to 4/6 then convert the
platformspecific bindings for Renesas, NXP and Rockchip SoCs. Patch 5/6
replaces the reference to dw_hdmi.txt in the Allwinner bindings with a
reference to the YAML base schema, and patch 6/6 drops dw_hdmi.txt.

My attempts at defining properties in the base schema, including it in
the platform-specific schema with an allOf: $ref..., and overridding
properties didn't work, as DT schemas don't define properties in a way
that can be overridden, but instead define validation rules that are all
considered. Both the rules in the base schema and in the
platform-specific schemas are evaluated.

One possible way around this would be to not pull in the whole base
schema, but specific rules. This is however a bit cumbersome to use in
my opinion. Is there a better way to achieve this ?

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
 .../display/bridge/renesas,dw-hdmi.txt        |  86 ---------
 .../display/bridge/renesas,dw-hdmi.yaml       | 142 ++++++++++++++
 .../display/bridge/synopsys,dw-hdmi.yaml      |  68 +++++++
 .../bindings/display/imx/fsl,imx6-hdmi.yaml   | 143 ++++++++++++++
 .../devicetree/bindings/display/imx/hdmi.txt  |  65 -------
 .../display/rockchip/dw_hdmi-rockchip.txt     |  74 --------
 .../display/rockchip/rockchip,dw-hdmi.yaml    | 178 ++++++++++++++++++
 9 files changed, 533 insertions(+), 260 deletions(-)
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
