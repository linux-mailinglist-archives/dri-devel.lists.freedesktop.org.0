Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7EC243214
	for <lists+dri-devel@lfdr.de>; Thu, 13 Aug 2020 03:29:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A594C6E34D;
	Thu, 13 Aug 2020 01:29:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 261256E2E6
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 01:29:33 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A9FCA2B7;
 Thu, 13 Aug 2020 03:29:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1597282170;
 bh=bd0qYrwzrJ4bHxah62yG+bSosA6MvnK/Qf6Qk4KfRec=;
 h=From:To:Cc:Subject:Date:From;
 b=qA1YrFcfzEx/YVld5LXlgsHPoUO6W2lFzzyWrjAL+0X/PoiJXBR+fRDb3nwNYFPww
 w5xF6VO5XX/Uz2ZKj3gNVJLpSsQM5C/3t8ix/43sPwRQQbeGhAW7RUoQ1msOEXRevN
 nlGAdZ/dXy1ait7uEcxrDl3FnSdlcu1rcHm79+Uk=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/8] drm: mxsfb: Allow overriding bus width
Date: Thu, 13 Aug 2020 04:29:02 +0300
Message-Id: <20200813012910.13576-1-laurent.pinchart@ideasonboard.com>
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Rob Herring <robh+dt@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

This patch series adds support to the mxsfb driver for bus width
override. The need came from a hardware platform where a 18-bpp panel
had the R[5:0], G[5:0] and B[5:0] signals connected to LCD_DATA[7:2],
LCD_DATA[15:10] and LCD_DATA[23:18] instead of LCD_DATA[5:0],
LCD_DATA[11:6] and LCD_DATA[17:12]. The bus width, automatically
configured to 18 by querying the panel, is incorrect in this case, and
needs to be set to 24.

To solve this issue, a new bus-width DT property is added to the mxsfb
DT binding. Patch 1/8 first converts the binding to YAML, with a fix for
the compatible string values in 2/8. Patch 3/8 then adds the new
property, and 4/8 renames the binding file to fsl,lcdif.yaml to match
the usual naming convention. I've kept that patch last to make it easy
to drop should should mxsfb.yaml be preferred.

Patches 5/8 to 6/8 then fix the DT sources to match the LCDIF bindings,
as I noticed during the conversion that the compatible strings were
badly managed (see patch 2/8 for a longer explanation). Patch 7/8 drops
an unused clock from DT sources.

Patch 8/8 finally adds support for the bus-width property to the mxsfb
driver.

Laurent Pinchart (8):
  dt-bindings: display: mxsfb: Convert binding to YAML
  dt-bindings: display: mxsfb: Add and fix compatible strings
  dt-bindings: display: mxsfb: Add a bus-width endpoint property
  dt-bindings: display: mxsfb: Rename to fsl,lcdif.yaml
  ARM: dts: imx: Fix LCDIF compatible strings
  arm64: dts: imx8mq: Fix LCDIF compatible strings
  ARM: dts: imx: Remove unneeded LCDIF disp_axi clock
  drm: mxsfb: Add support for the bus-width DT property

 .../bindings/display/fsl,lcdif.yaml           | 135 ++++++++++++++++++
 .../devicetree/bindings/display/mxsfb.txt     |  87 -----------
 MAINTAINERS                                   |   2 +-
 arch/arm/boot/dts/imx6sl.dtsi                 |   7 +-
 arch/arm/boot/dts/imx6sll.dtsi                |   7 +-
 arch/arm/boot/dts/imx6sx.dtsi                 |   4 +-
 arch/arm/boot/dts/imx6ul.dtsi                 |   7 +-
 arch/arm64/boot/dts/freescale/imx8mq.dtsi     |   2 +-
 drivers/gpu/drm/mxsfb/mxsfb_drv.c             |  26 ++++
 drivers/gpu/drm/mxsfb/mxsfb_drv.h             |   2 +
 drivers/gpu/drm/mxsfb/mxsfb_kms.c             |   8 +-
 11 files changed, 182 insertions(+), 105 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/fsl,lcdif.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/mxsfb.txt

-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
