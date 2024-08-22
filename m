Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9966A95BBC6
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 18:23:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ABD610EB5F;
	Thu, 22 Aug 2024 16:23:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 292D510EB5F
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 16:23:29 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="6.10,167,1719846000"; d="scan'208";a="220284611"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie6.idc.renesas.com with ESMTP; 23 Aug 2024 01:23:28 +0900
Received: from localhost.localdomain (unknown [10.226.92.15])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 403FC4007CF2;
 Fri, 23 Aug 2024 01:23:23 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v4 0/4] Add support for RZ/G2UL Display Unit
Date: Thu, 22 Aug 2024 17:23:13 +0100
Message-ID: <20240822162320.5084-1-biju.das.jz@bp.renesas.com>
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

v3->v4:
 * Restored the ports property for RZ/G2UL and described port@0 for the
   DPI interface in bindings patch.
 * Restored tags from Geert and Conor as the change is trivial
   (Replaced port 1->0 from v2).
 * Used "&" instead of "==" in rzg2l_du_start_stop() for scalability.
 * Restored port variable in struct rzg2l_du_output_routing
 * Updated rzg2l_du_encoders_init() to handle port based on hardware indices.
 * Restored ports property in du node and used port@0 for connected
   DPI interface.
v2->v3:
 * Split patch series based on subsystem from DU patch series [1].
 * Replaced ports->port property for RZ/G2UL as it supports only DPI
   and retained ports property for RZ/{G2L,V2L} as it supports both DSI
   and DPI output interface.
 * Added missing blank line before example.
 * Dropped tags from Conor and Geert as there are new changes in bindings
 * Avoided the line break in rzg2l_du_start_stop() for rstate.
 * Replaced port->du_output in  struct rzg2l_du_output_routing and
   dropped using the port number to indicate the output type in
   rzg2l_du_encoders_init().
 * Updated rzg2l_du_r9a07g043u_info and rzg2l_du_r9a07g044_info.

 [1] https://lore.kernel.org/all/20240709135152.185042-1-biju.das.jz@bp.renesas.com/
v1->v2:
 * Updated cover letter header "DU IP->Display Unit".
 * Updated commit description related to non ABI breakage for patch#3.
 * Added Ack from Conor for binding patches.

Biju Das (4):
  dt-bindings: display: renesas,rzg2l-du: Document RZ/G2UL DU bindings
  drm: renesas: rz-du: Add RZ/G2UL DU Support
  arm64: dts: renesas: r9a07g043u: Add DU node
  arm64: dts: renesas: r9a07g043u11-smarc: Enable DU

 .../bindings/display/renesas,rzg2l-du.yaml    |  32 ++++-
 arch/arm64/boot/dts/renesas/r9a07g043u.dtsi   |  25 ++++
 .../boot/dts/renesas/r9a07g043u11-smarc.dts   | 111 ++++++++++++++++++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c |   8 +-
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  |  11 ++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c  |   3 +-
 6 files changed, 185 insertions(+), 5 deletions(-)

-- 
2.43.0

