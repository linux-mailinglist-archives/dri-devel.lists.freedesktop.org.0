Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA4C63523F
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 09:22:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B91710E502;
	Wed, 23 Nov 2022 08:21:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4765610E4F5
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 07:00:26 +0000 (UTC)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 34BC288F;
 Wed, 23 Nov 2022 08:00:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1669186824;
 bh=Knz0JCCrfCqQxJejdfCSEXVWPhZVH+yr9Z4AiAaBvFg=;
 h=From:To:Cc:Subject:Date:From;
 b=oRRanw51554oiR9W7rj4aus04gF+aGASx6InEVVf73OEMWWbYnl1jgaPxSFCiL5w1
 gGYB856SbsrKDl6gJxt1XEON195cLORWienlYPruWVzg1GUpaUTOvhCcroJ6/N5Ska
 w0hCCsucGs5sdv73p3jqDpECgOkBIMHoCgozUSY8=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/7] Renesas V4H DSI & DP output support
Date: Wed, 23 Nov 2022 08:59:39 +0200
Message-Id: <20221123065946.40415-1-tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 23 Nov 2022 08:21:41 +0000
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

Changes in v2:
- A few cosmetic changes
- Increase vspd address range in dts to 0x7000
- Arrange nodes in dts by the block address
- Use gen = 4 for r8a779g0 du
- Drop the CLOCKSET1 hack patch

The CLOCKSET1 patch is apparently not needed to get the DSI & DP
working. Which is baffling, as I'm quite sure it was needed. There are a
few possible explanations: 1) it was never needed and I was just messing
things up, 2) it was needed, but some of my later improvements made it
unnecessary, 3) Whitehawk board firmware was updated in the middle of
the development of this series, possibly the firmware made the patch
unnecessary.

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
 drivers/clk/renesas/r8a779g0-cpg-mssr.c       |  14 +
 drivers/gpu/drm/rcar-du/rcar_du_drv.c         |  22 +
 drivers/gpu/drm/rcar-du/rcar_du_group.c       |   2 +-
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c       | 484 ++++++++++++++----
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi_regs.h  |   6 +-
 9 files changed, 649 insertions(+), 108 deletions(-)

-- 
2.34.1

