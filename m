Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 031BE4CEC8E
	for <lists+dri-devel@lfdr.de>; Sun,  6 Mar 2022 18:39:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9009010EB75;
	Sun,  6 Mar 2022 17:39:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A37CD10EB77
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Mar 2022 17:39:22 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 429C9482;
 Sun,  6 Mar 2022 18:39:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1646588361;
 bh=ywoVmQNqU9OcRFUjFQv8ux4/JC1YVycOwhZKUoi+QXY=;
 h=From:To:Cc:Subject:Date:From;
 b=S20ihGSyDvtZrPojmqTCirUA4Wt3g6Oo9v3J1+oqjVyht/DRyQQYonGg9RN+zUR70
 EOQAgBAxTKYih0l/3lxryFmZjATdk+fjHXVWZvlCc7Au67NoSPrqOUwy36pasAeBhN
 RzXnxIR33vlNEXRDh2vfiqBdtpE2taN2TsOcdugI=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: devicetree@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/3] dt-bindings: Add macros for video interface bus types
Date: Sun,  6 Mar 2022 19:39:02 +0200
Message-Id: <20220306173905.22990-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Jacopo Mondi <jacopo@jmondi.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Rob Herring <robh+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Eugen Hristev <eugen.hristev@microchip.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

This small patch series is the result of me getting a bus-type numerical
value wrong in a device tree file and spending too long debugging the
issue. Hopefully there's nothing controversial here.

Compared to v1, the PARALLEL bus type has been renamed to BT601, and
patch 3/3 now converts existing DT sources. See individual patches for a
detailed changelog.

I can split patch 3/3 per architecture or per board if desired, but
given that this is a mechanical change, and the patch is fairly small,
I'd rather keep it as-is and merge it as part of the series.

When writing 3/3 I noticed that the anx7625 bindings and the
corresponding driver badly misuse the bus type (mapping CCP2 to mean
MIPI DPI, and PARALLEL - now BT601 - to mean MIPI DSI). This misuse
hasn't reached a released mainline kernel as it got merged in v5.17-rc1,
so there may still be a chance to fix it. Let's discuss this in [1],
I'll update this series and rebase it on v5.18-rc1 once released based
on the outcome of the discussion.

[1] https://lore.kernel.org/all/YiTruiCIkyxs3jTC@pendragon.ideasonboard.com/

Laurent Pinchart (3):
  dt-bindings: media: Add macros for video interface bus types
  dt-bindings: Use new video interface bus type macros in examples
  ARM: dts: Use new media bus type macros

 .../display/bridge/analogix,anx7625.yaml         |  3 ++-
 .../devicetree/bindings/media/i2c/mipi-ccs.yaml  |  3 ++-
 .../bindings/media/i2c/ovti,ov772x.yaml          |  3 ++-
 .../bindings/media/marvell,mmp2-ccic.yaml        |  3 ++-
 .../bindings/media/microchip,xisc.yaml           |  3 ++-
 .../devicetree/bindings/media/st,stm32-dcmi.yaml |  4 +++-
 arch/arm/boot/dts/imx6ul-14x14-evk.dtsi          |  4 +++-
 arch/arm/boot/dts/omap3-n900.dts                 |  5 +++--
 arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts  | 11 +++++++----
 .../r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi    |  4 +++-
 .../r8a7742-iwg21d-q7-dbcm-ov7725-single.dtsi    |  4 +++-
 arch/arm/boot/dts/stm32429i-eval.dts             |  3 ++-
 arch/arm/boot/dts/stm32mp157c-ev1.dts            |  3 ++-
 include/dt-bindings/media/video-interfaces.h     | 16 ++++++++++++++++
 14 files changed, 52 insertions(+), 17 deletions(-)
 create mode 100644 include/dt-bindings/media/video-interfaces.h

-- 
Regards,

Laurent Pinchart

