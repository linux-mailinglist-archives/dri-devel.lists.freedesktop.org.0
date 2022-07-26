Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25DB45817A2
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 18:42:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 113F618B18F;
	Tue, 26 Jul 2022 16:42:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id D050812A685
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 16:42:16 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.93,194,1654527600"; d="scan'208";a="129198076"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie6.idc.renesas.com with ESMTP; 27 Jul 2022 01:42:14 +0900
Received: from localhost.localdomain (unknown [10.226.92.4])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 5A1704004CE0;
 Wed, 27 Jul 2022 01:42:11 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 00/10] Add RCar DU lib support
Date: Tue, 26 Jul 2022 17:41:58 +0100
Message-Id: <20220726164208.1048444-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 dri-devel@lists.freedesktop.org, Biju Das <biju.das@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Biju Das <biju.das.jz@bp.renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Adding RCar DU lib support(Encoder, vsp and KMS) proved that it can save
50% code saving on RZ/G2L compared to patch series [1].

The current patchset contains just movement of codes with some trivial changes.

The subsequent patch series will have more additions to vsp and kms library.
There is also plan to add library support for DU DRM and DU CRTC
(Not yet ready/tested), which will further increase the common code.

Current patch set + subsequent patch sets are tested on both RZ/G2M, RZ/G1N and
RZ/G2L.

[1] https://lore.kernel.org/linux-renesas-soc/OS0PR01MB59226CE75483AD2B96833B3786949@OS0PR01MB5922.jpnprd01.prod.outlook.com/T/#t

Biju Das (10):
  drm: rcar-du: Add RZ/G2L reset and clocks to struct rcar_du_crtc
  drm: rcar-du: Add encoder lib support
  drm: rcar-du: Add kms lib support
  drm: rcar-du: Add vsp lib support
  drm: rcar-du: Move rcar_du_vsp_atomic_begin()
  drm: rcar-du: Move rcar_du_vsp_atomic_flush()
  drm: rcar-du: Move vsp rcar_du_vsp_{map,unmap}_fb()
  drm: rcar-du: Move rcar_du_dumb_create()
  drm: rcar-du: Move rcar_du_gem_prime_import_sg_table()
  drm: rcar-du: Add rcar_du_lib_vsp_init()

 drivers/gpu/drm/rcar-du/Kconfig               |  10 +
 drivers/gpu/drm/rcar-du/Makefile              |   4 +
 drivers/gpu/drm/rcar-du/rcar_du_crtc.h        |  10 +
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c     | 120 +-----
 drivers/gpu/drm/rcar-du/rcar_du_encoder.h     |  14 +-
 drivers/gpu/drm/rcar-du/rcar_du_encoder_lib.c | 138 ++++++
 drivers/gpu/drm/rcar-du/rcar_du_encoder_lib.h |  30 ++
 drivers/gpu/drm/rcar-du/rcar_du_kms.c         | 356 ----------------
 drivers/gpu/drm/rcar-du/rcar_du_kms.h         |  31 +-
 drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c     | 394 ++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h     |  42 ++
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c         | 249 +----------
 drivers/gpu/drm/rcar-du/rcar_du_vsp.h         |  66 +--
 drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c     | 288 +++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h     |  93 +++++
 15 files changed, 1020 insertions(+), 825 deletions(-)
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_encoder_lib.c
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_encoder_lib.h
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h

-- 
2.25.1

