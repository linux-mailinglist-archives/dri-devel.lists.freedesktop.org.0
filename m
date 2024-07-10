Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B7292CD85
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 10:53:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 444D810E703;
	Wed, 10 Jul 2024 08:52:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mIVsdcf9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ACE110E703
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 08:52:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CF7E761741;
 Wed, 10 Jul 2024 08:52:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 818F6C32781;
 Wed, 10 Jul 2024 08:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720601574;
 bh=PhMCKB+xJTR+gWnIW4XNQs4NwAAVWihotq9v6lufwcc=;
 h=From:Subject:Date:To:Cc:Reply-To:From;
 b=mIVsdcf9Wq8E3d8aADG4+Ad/topqdU/CzpA38t5GjNHBmlgrzJ7vQPmrlq+1NNZ60
 5b64GvL5nk4XMFsyiQ3gIVvODP2fIWuRx1Niho4Y1gs9wEg/IYqgi5z4pvkF/tnIwP
 ux8eyIsDwT5fN74oki5yn5pTldkTGGlFLzDs4O2tI39uMw9cVQymbgHlmqfMlH9aNB
 d81d/dzO3Pbm6KdNvXnecazvXxfrkwnC5hQMBTMzvrhNy30aBdPOwHjNR+RSH5Hf/a
 CiRrE4VJu21uxO6COyZLhWcyTgLp18i0fJtXc9v/g03+F8v65/G7kFX9vOw4iu4h5s
 le0CBuq0+5+aQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 71CFDC3DA42;
 Wed, 10 Jul 2024 08:52:54 +0000 (UTC)
From: Hsiao Chien Sung via B4 Relay
 <devnull+shawn.sung.mediatek.com@kernel.org>
Subject: [PATCH v3 0/5] Support alpha blending in MTK display driver
Date: Wed, 10 Jul 2024 16:52:50 +0800
Message-Id: <20240710-alpha-blending-v3-0-289c187f9c6f@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOJLjmYC/22OQQ6CMBREr2K6tubzgRZceQ/jotAvNEIhLTYaw
 t0tsDAxLmeS92Zm5skZ8ux8mJmjYLwZbAzp8cDqVtmGuNExMwTMQCbAVTe2ilcdWW1sw0FILPN
 cQiFSFqFKeeKVU7ZuI2afXRfL0dHdvLaV6y3m1vhpcO9tNCRru/sFwm7mIeHAJQoJILFWCJeet
 FETPU710LNVEvAL/jkWMBp0VuWQkygLUD+GZVk+xAF9pv0AAAA=
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>, 
 CK Hu <ck.hu@mediatek.com>, Hsiao Chien Sung <shawn.sung@mediatek.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720601573; l=1352;
 i=shawn.sung@mediatek.com; s=20240710; h=from:subject:message-id;
 bh=PhMCKB+xJTR+gWnIW4XNQs4NwAAVWihotq9v6lufwcc=;
 b=0Y6YJ9l6hxNTlX0eT4eoJURDFUA2bVcNpmPnbtUiNExoTDahpGjBRDE/4MJ2UbOapU7x5pPeU
 EEEFzTpFXvMBWiv6eU0YelHHmhb3XA8smpTagNVshdUtYeK+kQZXD6S
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


