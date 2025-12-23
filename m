Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A51FCDA64C
	for <lists+dri-devel@lfdr.de>; Tue, 23 Dec 2025 20:46:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8901A10E04F;
	Tue, 23 Dec 2025 19:46:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="dQ1cVjck";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D14A010E04F
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 19:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1766519186;
 bh=DsNXs1aJQccVr90Um4OPsrkOwKn/wYgaO1rvK+xVKFM=;
 h=From:Subject:Date:To:Cc:From;
 b=dQ1cVjcklyhGmSVvKJWC4MbWA9eKtmcZ9C0BcFi36rR6S7n14rK7SNeTI76qwytP1
 +8B8iQROhFaQ8KA+NTRRLQaCGusnBm9ZDaW3odtwrYz21XKthQ0QBdl1MioJ0EWL9e
 0i4fysfaXrXxFe9Ni8QCEu03NAhp/JmWUwPW8gWj0X6DInbz+u5/DYWvu2pxKUCoNt
 8pSyK/UR37jABIAsB4WyYWX5IiMuzzCLTbu37vf3FLxL8b+/O+ZBL9W6B18Kq8mLv4
 RXBCjNs3oRv5TQeZoQjpxYGRxw1Z2B4wGIqRjOKBCgdKIZL3KB3NV0tO3xdQEIMs6c
 Y0bpbYnBi2abA==
Received: from [127.0.1.1] (unknown
 [IPv6:2804:1b1:f803:74:81c8:6a7a:6e11:8f81])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nfraprado)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 9AC4D17E0C2E;
 Tue, 23 Dec 2025 20:46:20 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Subject: [PATCH 00/11] Plane Color Pipeline support for MediaTek
Date: Tue, 23 Dec 2025 16:44:41 -0300
Message-Id: <20251223-mtk-ovl-pre-blend-colorops-v1-0-0cb99bd0ab33@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIACnxSmkC/x3MQQqEMAxA0atI1gZsh6L1KuLC2owGayOtiCDef
 cosH3z+A5kSU4a+eiDRxZklFqi6gnmd4kLIvhh0o43SyuJ+bihXwCMRukDR4yxBkhwZrXGt013
 38dZAGZTky/d/Pozv+wPQf+wfbAAAAA==
X-Change-ID: 20251219-mtk-ovl-pre-blend-colorops-95b7b2883d95
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 daniels@collabora.com, ariel.dalessandro@collabora.com, 
 kernel@collabora.com, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.3
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

This series implements a plane color pipeline for MediaTek platforms,
specifically for MT8195-compatible SoCs.

The pipeline is composed of the following blocks:

Inverse Gamma -> RGB to RGB Color Space Conversion (R2R CSC) -> Gamma
(1D Curve)       (3x3 Matrix)                                   (1D Curve) 

The curves supported by Inverse Gamma are:
* scRGB
* BT.709

The curves supported by Gamma are:
* scRGB
* BT.709
* BT.2020
* HLG

Given the lack of support for writeback connectors on the MediaTek KMS
driver, combined with limited hardware documentation, I haven't been
able to verify the correctness of each curve, only that they were
visually sane (gamma curves made the image on the display brighter,
while inverse gamma made it darker).

This series depends on "drm: Color pipeline teardown and follow-up
fixes/improvements" [1].

This series was tested on the MT8195-Tomato Chromebook.

Regarding the support of color operations in OVL for different SoCs:
* it's not supported by MT8183, and presumably also not by older
  generations
* On MT8192 it's supported by ovl0 and ovl_2l0, but not ovl_2l2 (despite
  the same compatible as ovl_2l0).

For this series I'm only enabling it on MT8195 since that's the one
where I can readily test.

[1] https://lore.kernel.org/all/20251219065614.190834-1-chaitanya.kumar.borah@intel.com/#t

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
Nícolas F. R. A. Prado (11):
      drm/mediatek: Introduce DDP plane_colorops_init() hook
      drm/mediatek: Initialize colorops when creating plane
      drm/mediatek: ovl: Add supports_plane_colorops flag
      drm/mediatek: ovl: Enable per-plane color operations on MT8195
      drm/mediatek: ovl: Implement support for Inverse Gamma
      drm/mediatek: Add plane_colorops_init() DDP hook for OVL
      drm/colorop: Introduce HLG EOTF
      drm/mediatek: ovl: Implement support for Gamma
      drm/colorop: Introduce 3x3 Matrix
      drm/mediatek: ovl: Enable support for R2R Color Space Conversion
      drm/mediatek: Check 3x3 Matrix colorop has DATA set

 drivers/gpu/drm/drm_atomic.c            |   1 +
 drivers/gpu/drm/drm_atomic_uapi.c       |   3 +
 drivers/gpu/drm/drm_colorop.c           |  22 +++
 drivers/gpu/drm/mediatek/mtk_crtc.c     |  36 +++-
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c |   1 +
 drivers/gpu/drm/mediatek/mtk_ddp_comp.h |   2 +
 drivers/gpu/drm/mediatek/mtk_disp_drv.h |   1 +
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 287 ++++++++++++++++++++++++++++++++
 include/drm/drm_colorop.h               |  13 ++
 include/uapi/drm/drm_mode.h             |  16 ++
 10 files changed, 381 insertions(+), 1 deletion(-)
---
base-commit: 1783cdadb70e74a30dfee250f8c2dc13b4e61128
change-id: 20251219-mtk-ovl-pre-blend-colorops-95b7b2883d95

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>

