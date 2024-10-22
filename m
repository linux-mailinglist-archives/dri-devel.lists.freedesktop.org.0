Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7DE9A9C53
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 10:24:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4206410E60F;
	Tue, 22 Oct 2024 08:24:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id A9A4110E610
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 08:24:43 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="6.11,222,1725289200"; d="scan'208";a="222639816"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie5.idc.renesas.com with ESMTP; 22 Oct 2024 17:24:42 +0900
Received: from localhost.localdomain (unknown [10.226.92.236])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 7BF9140078A5;
 Tue, 22 Oct 2024 17:24:36 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 0/2] Improvements/fixes on the DPI interface
Date: Tue, 22 Oct 2024 09:24:22 +0100
Message-ID: <20241022082433.32513-1-biju.das.jz@bp.renesas.com>
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

This patch series aims to add fixes/improvements based on the latest
RZ/G2UL hardware manual

As per Table 33.4 Clock List, the maximum dot clock for the DPI interface
is 83.5 MHz. so, reject modes higher than 83.5 MHz.

Also drop DPI_OE macro as the bit definition is removed from the latest
RZ/G2UL and RZ/G2L hardware manual.

Changes in v2:
 * Added as a patch series as the patches fix the same driver
 * Added Fixes tag for patch#1
 * Moved .mode_valid from crtc to encoder as the new state is not
   available in crtc and instead, we could check renc->output for
   .mode_valid() function of drm_encoder.
 * Dropped rzg2l_du_crtc_atomic_check().

Biju Das (2):
  drm: renesas: rz-du: Drop DU_MCR0_DPI_OE macro
  drm: renesas: rz-du: rzg2l_du_encoder: Fix max dot clock for DPI

 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c  |  8 +-------
 .../gpu/drm/renesas/rz-du/rzg2l_du_encoder.c   | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+), 7 deletions(-)

-- 
2.43.0

