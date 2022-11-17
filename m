Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC21862DAA6
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 13:26:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15DE010E0FF;
	Thu, 17 Nov 2022 12:26:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CF5010E0FF
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 12:26:08 +0000 (UTC)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id DD0D06E0;
 Thu, 17 Nov 2022 13:26:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1668687966;
 bh=wczldhj/MtZKX+Mqby6sqUs855O+uKSjKoeQPC0x8gI=;
 h=From:To:Cc:Subject:Date:From;
 b=TqKVjyYKlM0G+jYSUzmR30+1RNKaSMvcMgvqF+eKLVEKvaThE5ZGaH9AROVFoEhoQ
 hA6kYkhSr36DiCru/QeZVYKqZe5AaiAl0yqE5ABONu8gYlZnrxk2AEqV1Y07y4aMYG
 dH9G6L78/HAGfEPhBlACHmUC1b8WkTW4Dcwdu6uE=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/8] Renesas V4H DSI & DP output support
Date: Thu, 17 Nov 2022 14:25:39 +0200
Message-Id: <20221117122547.809644-1-tomi.valkeinen@ideasonboard.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

These add support for DSI on V4H SoC (r8a779g0) and DP for Whitehawk
board.

The last patch is a hack, but needed to get the DSI working. It is still
unclear what the register write does, and as that patch is needed to get
the DSI working, this series is not ready yet. But all the rest of the
patches are ready for review.

 Tomi

Tomi Valkeinen (8):
  dt-bindings: display: renesas,du: Provide bindings for r8a779g0
  dt-bindings: display: bridge: renesas,dsi-csi2-tx: Add r8a779g0
  clk: renesas: r8a779g0: Add display related clocks
  arm64: dts: renesas: r8a779g0: Add display related data
  arm64: dts: renesas: white-hawk-cpu: Add DP output support
  drm: rcar-du: Add r8a779g0 support
  drm: rcar-du: dsi: Add r8A779g0 support
  HACK: drm: rcar-du: dsi: use-extal-clk hack

 .../display/bridge/renesas,dsi-csi2-tx.yaml   |   3 +-
 .../bindings/display/renesas,du.yaml          |   2 +
 .../dts/renesas/r8a779g0-white-hawk-cpu.dtsi  |  94 ++++
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi     | 129 +++++
 drivers/clk/renesas/r8a779g0-cpg-mssr.c       |  14 +
 drivers/gpu/drm/rcar-du/rcar_du_drv.c         |  22 +
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c       | 488 ++++++++++++++----
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi_regs.h  |   6 +-
 8 files changed, 651 insertions(+), 107 deletions(-)

-- 
2.34.1

