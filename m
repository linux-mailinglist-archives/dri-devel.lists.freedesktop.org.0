Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB1F947F26
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2024 18:22:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9842F10E247;
	Mon,  5 Aug 2024 16:22:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 499D810E248
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2024 16:22:04 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="6.09,265,1716217200"; d="scan'208";a="218709707"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie6.idc.renesas.com with ESMTP; 06 Aug 2024 01:22:01 +0900
Received: from localhost.localdomain (unknown [10.226.92.197])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 273BC4009400;
 Tue,  6 Aug 2024 00:52:44 +0900 (JST)
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
Subject: [PATCH v3 0/4] Add support for RZ/G2UL Display Unit
Date: Mon,  5 Aug 2024 16:52:34 +0100
Message-ID: <20240805155242.151661-1-biju.das.jz@bp.renesas.com>
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

 .../bindings/display/renesas,rzg2l-du.yaml    |  35 +++++-
 arch/arm64/boot/dts/renesas/r9a07g043u.dtsi   |  19 +++
 .../boot/dts/renesas/r9a07g043u11-smarc.dts   | 109 ++++++++++++++++++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c |   8 +-
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  |  18 ++-
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h  |   5 +-
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c  |   4 +-
 7 files changed, 188 insertions(+), 10 deletions(-)

-- 
2.43.0

