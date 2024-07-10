Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 076C592CD2D
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 10:37:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7575910E686;
	Wed, 10 Jul 2024 08:37:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cAjOYz6F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF64410E19A
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 08:37:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C779C619F4;
 Wed, 10 Jul 2024 08:37:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9158CC32782;
 Wed, 10 Jul 2024 08:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720600642;
 bh=nlmPSyxX9qpxoDNYTGreHvGaR6e8CTjlqGKzsgnia6M=;
 h=From:Subject:Date:To:Cc:Reply-To:From;
 b=cAjOYz6Fbq0FNo/yNWXaqCtiOGQGkOChWPaS62jBM65HmAKku8Te7i/TF/CEfj7FW
 Qxrwfq0qKjatN1ma+kMRNWUYz0v5VIy73aB2dRh6T6yERYqYq2gZqL5FFEEVBQ5gsu
 FJmqSI5Y2y0cr0tO0Pet6+4unLtxsXnU188f7yMmYCf3kIc/WkSDarf16zhdR7sW4J
 Pr8Cp9t9ZwtH5ivBVcufAcljVVWyTqn8aW5B4HVGNxLXPMFuRlDbuHP5mULrIvYdv/
 g1vwta7EGGRuJG1Q8iS4LJQZhLLb1/CK5nxqSNesMTSI14h15ycq6R+1JeIXEhM6Hm
 C+rTru9AkGn8A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 86CB3C3DA45;
 Wed, 10 Jul 2024 08:37:22 +0000 (UTC)
From: Hsiao Chien Sung via B4 Relay
 <devnull+shawn.sung.mediatek.com@kernel.org>
Subject: [PATCH v2 0/5] Support alpha blending in MTK display driver
Date: Wed, 10 Jul 2024 16:37:18 +0800
Message-Id: <20240710-alpha-blending-v2-0-d4b505e6980a@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD5IjmYC/yWNQQ6CMBBFr0K6dsxQpVVX3sOwKGWkE0shLRIN4
 e5WWL6fvP8WkSgyJXErFhFp5sRDyCAPhbDOhI6A28xCojyjLhGMH52BxlNoOXSASstrVWm8qJP
 IUmMSQRNNsC5r4e19HsdIT/5slUed2XGahvjdonP5X/d/JXF/hrkEBC2VRtTSGon3nlo2E72Od
 uhFva7rDwKqYJ67AAAA
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>, 
 CK Hu <ck.hu@mediatek.com>, Hsiao Chien Sung <shawn.sung@mediatek.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720600641; l=1214;
 i=shawn.sung@mediatek.com; s=20240710; h=from:subject:message-id;
 bh=nlmPSyxX9qpxoDNYTGreHvGaR6e8CTjlqGKzsgnia6M=;
 b=BdG6PnMbvs0sjxTdr+ziYt58EoMkDr3qc3N4Se8q7d5oHpLOA7lU7oBNSuFkDExAvdlTPqodq
 DaxQKgl/vNUBHQhTqfjD2UutH4EJr/dRwIIiWRPm9uEcGOlBAnA7c/K
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


