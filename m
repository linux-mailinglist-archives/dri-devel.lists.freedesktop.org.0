Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9557090F435
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 18:39:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E386310ED35;
	Wed, 19 Jun 2024 16:39:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="E/5JCVZ3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 908C510ED2F
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 16:38:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id A24F9CE2069;
 Wed, 19 Jun 2024 16:38:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CB0AFC2BBFC;
 Wed, 19 Jun 2024 16:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718815124;
 bh=1/Deizd7VSTe2iJzo6qC6np7IrGYcl14e1WZr+sIbJg=;
 h=From:Subject:Date:To:Cc:Reply-To:From;
 b=E/5JCVZ3BXVCdiSjx9yM6gRmqvoaNrjaDAZ9UzqD54YJWOUxOuEK6HIVRNA3cb3Zq
 4WHOG1iCPEAQBJAoRLgnEX7YzNacY9eYqfb0xbvDWPhwFcrxdcYcOG3xSz3lKKNgaa
 BVzDrrkH7rehZdbmFjN6PTL1aXaUA2adXUnyrjWp0TZgF4+XMZNUQSyBaamh+F8uVU
 DWE5gKDxVSeCsT7DKH1Hg3e5+0DjDY+qvr3WtBH0o5UiLAH4O1ZMhQLoea8vKyCHvC
 OHpxkPm8+8atc0MSJoscKEDVwAeHSp2c24AFEcQqlZEP7JVaJxobdPQMiZtZ6hx39J
 rk6Pd6JT0/tkw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id AE18CC27C53;
 Wed, 19 Jun 2024 16:38:44 +0000 (UTC)
From: Hsiao Chien Sung via B4 Relay
 <devnull+shawn.sung.mediatek.com@kernel.org>
Subject: [PATCH v3 00/14] This series fixes the errors of MediaTek display
 driver found by IGT.
Date: Thu, 20 Jun 2024 00:38:40 +0800
Message-Id: <20240620-igt-v3-0-a9d62d2e2c7e@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJEJc2YC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHUUlJIzE
 vPSU3UzU4B8JSMDIxMDM0NL3cz0El0TS0NL01QjQxMDkxQloMqCotS0zAqwKdGxtbUATts7MVU
 AAAA=
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 CK Hu <ck.hu@mediatek.com>, Bibby Hsieh <bibby.hsieh@mediatek.com>, 
 Daniel Kurtz <djkurtz@chromium.org>, Mao Huang <littlecvr@chromium.org>, 
 "Nancy.Lin" <nancy.lin@mediatek.com>
Cc: YT Shen <yt.shen@mediatek.com>, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Hsiao Chien Sung <shawn.sung@mediatek.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718815123; l=3450;
 i=shawn.sung@mediatek.com; s=20240616; h=from:subject:message-id;
 bh=1/Deizd7VSTe2iJzo6qC6np7IrGYcl14e1WZr+sIbJg=;
 b=jSxUNwpSULh9lrpbHUH8cTlzzmFaSiiiXN/JGo95ZbDBiwweC8/NdnathsAnu4DUUsl0rdBqS
 W1fy/hLtNqyAnnI5vunPJ8Dp2Lr+D0ZUFHe+rnoexYNx/E+2jypPD2x
X-Developer-Key: i=shawn.sung@mediatek.com; a=ed25519;
 pk=lq1w8BuWDINX+4JHjGHhhbAU5ICP+cL9VCj7wn+cEDA=
X-Endpoint-Received: by B4 Relay for shawn.sung@mediatek.com/20240616 with
 auth_id=172
X-Original-From: Hsiao Chien Sung <shawn.sung@mediatek.com>
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
Reply-To: shawn.sung@mediatek.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
Changes in v3:
- Modify the commit message
- Add a patch to fix destination alpha error in OVL
- Link to v2: https://lore.kernel.org/all/20240619-mediatek-drm-next-v2-0-abf68f46f8d2@mediatek.com

---
Changes in v2:
- Seperate the changes that belong to another repo (driver/soc/mediatek)
- Move the fix patches to the front of the series
- Link to v1: https://lore.kernel.org/r/20240616-mediatek-drm-next-v1-0-7e8f9cf785d8@mediatek.com

---
Hsiao Chien Sung (14):
      drm/mediatek: Add missing plane settings when async update
      drm/mediatek: Disable 9-bit alpha in ETHDR
      drm/mediatek: Fix XRGB setting error in OVL
      drm/mediatek: Fix XRGB setting error in Mixer
      drm/mediatek: Turn off the layers with zero width or height
      drm/mediatek: Add OVL compatible name for MT8195
      drm/mediatek: Add DRM_MODE_ROTATE_0 to rotation property
      drm/mediatek: Add new color format MACROs in OVL
      drm/mediatek: Set DRM mode configs accordingly
      drm/mediatek: Support more 10bit formats in OVL
      drm/mediatek: Support RGBA8888 and RGBX8888 in OVL on MT8195
      drm/mediatek: Support DRM plane alpha in OVL
      drm/mediatek: Support DRM plane alpha in Mixer
      drm/mediatek: Fix XRGB setting error in OVL

 drivers/gpu/drm/mediatek/mtk_ddp_comp.h         |  6 +-
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c         | 93 ++++++++++++++++++-------
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c |  2 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c          | 24 +++++++
 drivers/gpu/drm/mediatek/mtk_drm_drv.h          |  4 ++
 drivers/gpu/drm/mediatek/mtk_ethdr.c            | 27 +++++--
 drivers/gpu/drm/mediatek/mtk_plane.c            |  4 +-
 7 files changed, 126 insertions(+), 34 deletions(-)
---
base-commit: 62fe4b067581d480e863191305f108bebffbc0e9
change-id: 20240615-mediatek-drm-next-ad601b349f23

Best regards,

---
Hsiao Chien Sung (14):
      drm/mediatek: Add missing plane settings when async update
      drm/mediatek: Use 8-bit alpha in ETHDR
      drm/mediatek: Fix XRGB setting error in OVL
      drm/mediatek: Fix XRGB setting error in Mixer
      drm/mediatek: Fix destination alpha error in OVL
      drm/mediatek: Turn off the layers with zero width or height
      drm/mediatek: Add OVL compatible name for MT8195
      drm/mediatek: Add DRM_MODE_ROTATE_0 to rotation property
      drm/mediatek: Add new color format MACROs in OVL
      drm/mediatek: Set DRM mode configs accordingly
      drm/mediatek: Support more 10bit formats in OVL
      drm/mediatek: Support RGBA8888 and RGBX8888 in OVL on MT8195
      drm/mediatek: Support DRM plane alpha in OVL
      drm/mediatek: Support DRM plane alpha in Mixer

 drivers/gpu/drm/mediatek/mtk_ddp_comp.h         |  6 +-
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c         | 95 ++++++++++++++++++-------
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c |  2 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c          | 24 +++++++
 drivers/gpu/drm/mediatek/mtk_drm_drv.h          |  4 ++
 drivers/gpu/drm/mediatek/mtk_ethdr.c            | 27 +++++--
 drivers/gpu/drm/mediatek/mtk_plane.c            |  4 +-
 7 files changed, 127 insertions(+), 35 deletions(-)
---
base-commit: 62fe4b067581d480e863191305f108bebffbc0e9
change-id: 20240619-igt-49195e21404d

Best regards,
-- 
Hsiao Chien Sung <shawn.sung@mediatek.com>


