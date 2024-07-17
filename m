Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47587933658
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2024 07:24:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BBCF10E91E;
	Wed, 17 Jul 2024 05:24:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cT+EVE30";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84A9610E91E
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2024 05:24:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9110961362;
 Wed, 17 Jul 2024 05:24:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 10677C32782;
 Wed, 17 Jul 2024 05:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721193886;
 bh=Vp7p44aMYOx+W/3oDa9KRPvAbAMMO3I7LRS7pOl1nxQ=;
 h=From:Subject:Date:To:Cc:Reply-To:From;
 b=cT+EVE30qqDOPx77JlU6a1Rc6BS16f7s8CdRdhMoTqSNwhvY7VCV4u3JSxrT6wqdt
 CfPSe/EcjaFA6c9jU7sA8YFLz1toAnOM3jxfKxuQXnXZuMm9Mu0pXPQ8OW638zusZ2
 8xt4QwwvjwFYiRNCiUUoO7JCOeKKvc7U3uVt7gBVRw4LAn0XQ5fr9njx8nfuyXiMA5
 1duOE+R/RqxmePhI/I5zKlDVSEc/xar5fhCaW6Kk7Dm/OItA7LbK7QowStJ0CwwLd/
 DLR+hr3jz0KjbOSWLai8q+xeodfSN3lRvyBhx/jcrxfO/6TsLKYA3FjYu1P4+C8YPa
 KlpoH69Hlbh+w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id EBE29C3DA4B;
 Wed, 17 Jul 2024 05:24:45 +0000 (UTC)
From: Hsiao Chien Sung via B4 Relay
 <devnull+shawn.sung.mediatek.com@kernel.org>
Subject: [PATCH v4 0/5] Support alpha blending in MTK display driver
Date: Wed, 17 Jul 2024 13:24:40 +0800
Message-Id: <20240717-alpha-blending-v4-0-4b1c806c0749@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJhVl2YC/33OQQ6CMBAF0KuYrq0ZBmjBlfcwLkoZoBELabHRG
 O5uhYWJIS7/JP/9eTFPzpBnx92LOQrGm8HGkO13THfKtsRNHTNDwAxkAlz1Y6d41ZOtjW05CIl
 lnksoRMpiqVKeeOWU1V2s2Xvfx+PoqDGPZeV8ibkzfhrccxkNyee6+gJhlXlIOHCJQgJI1Arhd
 KPaqImuBz3c2AcJ+C1uPBYwCnVW5ZCTKAtQG0L6X0ijgEWpk0I2pRbNjzDP8xsk0D81PwEAAA=
 =
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>, 
 CK Hu <ck.hu@mediatek.com>, Hsiao Chien Sung <shawn.sung@mediatek.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721193884; l=1512;
 i=shawn.sung@mediatek.com; s=20240710; h=from:subject:message-id;
 bh=Vp7p44aMYOx+W/3oDa9KRPvAbAMMO3I7LRS7pOl1nxQ=;
 b=+A8fttIjotYhj8wUeKovyfjjqKhR+tv2ri5BcloeuhTVq31xjLyG3wh3H8ppI9q8gkU+M8u50
 U6OUuROaJmgAEsuPzXOHDTTy2Z54rv7ObsgnLk9nciTQ6u+5Db778DJ
X-Developer-Key: i=shawn.sung@mediatek.com; a=ed25519;
 pk=VRlGZ3diQkQtpDd8fCL9/mx+TpZStm08pg8UPaG1NGc=
X-Endpoint-Received: by B4 Relay for shawn.sung@mediatek.com/20240710 with
 auth_id=184
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

Support "Pre-multiplied" and "None" blend mode on MediaTek's chips by
adding correct blend mode property when the planes init.
Before this patch, only the "Coverage" mode (default) is supported.

Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>
---
Changes in v4:
- Add more information to the commit message
- Link to v3: https://lore.kernel.org/r/20240710-alpha-blending-v3-0-289c187f9c6f@mediatek.com

Changes in v3:
- Remove the Change-Id
- Link to v2: https://lore.kernel.org/r/20240710-alpha-blending-v2-0-d4b505e6980a@mediatek.com

Changes in v2:
- Remove unnecessary codes
- Add more information to the commit message
- Link to v1: https://lore.kernel.org/r/20240620-blend-v1-0-72670072ca20@mediatek.com

---
Hsiao Chien Sung (5):
      drm/mediatek: Support "None" blending in OVL
      drm/mediatek: Support "None" blending in Mixer
      drm/mediatek: Support "Pre-multiplied" blending in OVL
      drm/mediatek: Support "Pre-multiplied" blending in Mixer
      drm/mediatek: Support alpha blending in display driver

 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 36 +++++++++++++++++++++++++--------
 drivers/gpu/drm/mediatek/mtk_ethdr.c    | 13 +++++++++---
 drivers/gpu/drm/mediatek/mtk_plane.c    | 11 ++++++++++
 3 files changed, 49 insertions(+), 11 deletions(-)
---
base-commit: 8ad49a92cff4bab13eb2f2725243f5f31eff3f3b
change-id: 20240710-alpha-blending-067295570863

Best regards,
-- 
Hsiao Chien Sung <shawn.sung@mediatek.com>


