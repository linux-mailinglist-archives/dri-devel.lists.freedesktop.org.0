Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 188D164050F
	for <lists+dri-devel@lfdr.de>; Fri,  2 Dec 2022 11:48:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4471110E6C4;
	Fri,  2 Dec 2022 10:48:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE73F10E012
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 09:56:50 +0000 (UTC)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 563D22D9;
 Thu,  1 Dec 2022 10:56:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1669888609;
 bh=lU6WFQO+ANPHh+59bZX1mhx10a4JQsmhkgd4Z7i9JxY=;
 h=From:To:Cc:Subject:Date:From;
 b=wFBq5XU4Uso7tqsIOn7UU1ogQtahSun3K7AO/aos19wrZ0271qTViOzDEKMEUhbY1
 j5k2q5Sc4y+lWCytRFzFRs1X90Rvv1K+qU8vf5ga8TSCJfk7SgAhcsYiUOCXQwyWRI
 PC6YqQyiNeVNKl7cXU5knXqbmfMnT3ZMPUXaC25s=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/7] Renesas V4H DSI & DP output support
Date: Thu,  1 Dec 2022 11:56:24 +0200
Message-Id: <20221201095631.89448-1-tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 02 Dec 2022 10:48:00 +0000
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Hi,

These add support for DSI on V4H SoC (r8a779g0) and DP for Whitehawk
board.

I'm sending the full series for clarity.

Changes to v4:

- Changes in "clk: renesas: r8a779g0: Add display related clocks":
	* Fix formatting
	* Use R8A779G0_CLK_VIOBUSD2 as the source for all video related
	  clocks.

 Tomi

Tomi Valkeinen (7):
  dt-bindings: display: renesas,du: Provide bindings for r8a779g0
  dt-bindings: display: bridge: renesas,dsi-csi2-tx: Add r8a779g0
  clk: renesas: r8a779g0: Add display related clocks
  arm64: dts: renesas: r8a779g0: Add display related nodes
  arm64: dts: renesas: white-hawk-cpu: Add DP output support
  drm: rcar-du: Add r8a779g0 support
  drm: rcar-du: dsi: Add r8A779g0 support

 .../display/bridge/renesas,dsi-csi2-tx.yaml   |   3 +-
 .../bindings/display/renesas,du.yaml          |   2 +
 .../dts/renesas/r8a779g0-white-hawk-cpu.dtsi  |  94 ++++
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi     | 130 +++++
 drivers/clk/renesas/r8a779g0-cpg-mssr.c       |   9 +
 drivers/gpu/drm/rcar-du/rcar_du_drv.c         |  22 +
 drivers/gpu/drm/rcar-du/rcar_du_group.c       |   2 +-
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c       | 497 +++++++++++++-----
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi_regs.h  |   6 +-
 9 files changed, 635 insertions(+), 130 deletions(-)

-- 
2.34.1

