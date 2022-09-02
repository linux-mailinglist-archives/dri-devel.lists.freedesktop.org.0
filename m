Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 445E85AB72E
	for <lists+dri-devel@lfdr.de>; Fri,  2 Sep 2022 19:08:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3EF710E6B7;
	Fri,  2 Sep 2022 17:08:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8932B10E469
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Sep 2022 17:08:34 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.93,283,1654527600"; d="scan'208";a="133510976"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie6.idc.renesas.com with ESMTP; 03 Sep 2022 02:08:32 +0900
Received: from localhost.localdomain (unknown [10.226.92.67])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 1E01440078DC;
 Sat,  3 Sep 2022 02:08:28 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 00/10] Add RCar DU lib support
Date: Fri,  2 Sep 2022 18:08:16 +0100
Message-Id: <20220902170826.599262-1-biju.das.jz@bp.renesas.com>
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

Both RZ/G2L and RCar display system uses similar hardware pipeline for
display ie, it uses FCPV, VSPD and DU. Both FCPV and VSPD are almost
similar, but DU there are some differences like it does not have
plane/group registers.

Since the pipeline and software architecture are similar, we can reuse the
DU code for RCar to RZ/G2L as well.

This patch series adds RCar DU lib support(Encoder, vsp and KMS) by moving
common codes with some trivial changes to the lib.

The subsequent patch series will add support for RZ/G2L DU.

Note:
 * This patch series is based on drm-misc-next and du-next
 * The KConfig and Make file depend upon [1]
[1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220829091901.641784-3-biju.das.jz@bp.renesas.com/

v1->v2:
 * Rebased on drm-misc-next and DU-next.
 * Fixed the warning reported by bot for patch#2.

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
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c     | 117 +-----
 drivers/gpu/drm/rcar-du/rcar_du_encoder.h     |  14 +-
 drivers/gpu/drm/rcar-du/rcar_du_encoder_lib.c | 138 +++++++
 drivers/gpu/drm/rcar-du/rcar_du_encoder_lib.h |  30 ++
 drivers/gpu/drm/rcar-du/rcar_du_kms.c         | 358 -----------------
 drivers/gpu/drm/rcar-du/rcar_du_kms.h         |  29 +-
 drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c     | 379 ++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h     |  41 ++
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c         | 258 +-----------
 drivers/gpu/drm/rcar-du/rcar_du_vsp.h         |  26 +-
 drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c     | 286 +++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h     |  52 +++
 15 files changed, 961 insertions(+), 791 deletions(-)
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_encoder_lib.c
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_encoder_lib.h
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h

-- 
2.25.1

