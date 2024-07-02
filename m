Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B79923AAB
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 11:51:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A801110E197;
	Tue,  2 Jul 2024 09:51:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 302 seconds by postgrey-1.36 at gabe;
 Tue, 02 Jul 2024 09:51:43 UTC
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7372110E197
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2024 09:51:43 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="6.09,178,1716217200"; d="scan'208";a="213970912"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie6.idc.renesas.com with ESMTP; 02 Jul 2024 18:46:39 +0900
Received: from localhost.localdomain (unknown [10.226.93.72])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 48CFE40031F9;
 Tue,  2 Jul 2024 18:46:33 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 0/9] Add support for RZ/G2UL DU IP
Date: Tue,  2 Jul 2024 10:46:10 +0100
Message-ID: <20240702094630.41485-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
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

This patch series aims to add support for RZ/G2UL DU.

The LCD controller is composed of Frame Compression Processor (FCPVD),
Video Signal Processor (VSPD), and Display Unit (DU).

The output of LCDC is connected display parallel interface (DPI) and
supports a maximum resolution of WXGA along with 2 RPFs to support the
blending of two picture layers and raster operations (ROPs)

It is similar to LCDC IP on RZ/G2L SoCs, but does not have DSI interface.

Biju Das (9):
  media: dt-bindings: media: renesas,vsp1: Document RZ/G2UL VSPD
    bindings
  media: dt-bindings: media: renesas,fcp: Document RZ/G2UL FCPVD
    bindings
  dt-bindings: display: renesas,rzg2l-du: Document RZ/G2UL DU bindings
  clk: renesas: r9a07g043: Add LCDC clock and reset entries
  drm: renesas: rz-du: Add RZ/G2UL DU Support
  arm64: dts: renesas: r9a07g043u: Add vspd node
  arm64: dts: renesas: r9a07g043u: Add fcpvd node
  arm64: dts: renesas: r9a07g043u: Add DU node
  arm64: dts: renesas: r9a07g043u11-smarc: Enable DU

 .../bindings/display/renesas,rzg2l-du.yaml    |  32 ++++-
 .../bindings/media/renesas,fcp.yaml           |   2 +
 .../bindings/media/renesas,vsp1.yaml          |   1 +
 arch/arm64/boot/dts/renesas/r9a07g043u.dtsi   |  49 ++++++++
 .../boot/dts/renesas/r9a07g043u11-smarc.dts   | 111 ++++++++++++++++++
 drivers/clk/renesas/r9a07g043-cpg.c           |  12 ++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c |   9 +-
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  |  11 ++
 8 files changed, 223 insertions(+), 4 deletions(-)

-- 
2.43.0

