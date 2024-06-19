Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8172690F503
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 19:27:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C021710ED53;
	Wed, 19 Jun 2024 17:27:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="A8S4pCnd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EF8D10E238
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 17:27:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7D12D61EAF;
 Wed, 19 Jun 2024 17:27:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 24545C2BBFC;
 Wed, 19 Jun 2024 17:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718818032;
 bh=ffa9QQcOJtyAVtiNDqxJ1WmYeHKO0blFbInuddhMTh8=;
 h=From:Subject:Date:To:Cc:Reply-To:From;
 b=A8S4pCndRUUKF92doaVSqCWx3oxLR9/ACVPt0WBE4qI9L9+/z7kSPUhYITiv/WZxG
 dkn02Do3Qgc6M8RXBwGOUgWrbdXUnbNm/4DtNXFJz2VQEx0+4SfNmdg53sa20PKUxv
 A8vMhHk+Xi+MSWxgqSmBnfdNPl2oKI7wxkXwHuyedn/0dcMngDd7Vreg2jpZExd/nh
 svYxo4FxfHyFiuEjnQ7JEP+HvhqIVCTiRWpM6OGed9pxxVzPa+EoUUPD/9nM87e+bH
 R/aneBMvgNY3NWp0V6fMqQLR5bUZ1RudINcrKCQq3I+EXxXWRAbDaY21NUn6GMN/r1
 ZyNX1T1mjX0oA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 0C621C27C53;
 Wed, 19 Jun 2024 17:27:12 +0000 (UTC)
From: Hsiao Chien Sung via B4 Relay
 <devnull+shawn.sung.mediatek.com@kernel.org>
Subject: [PATCH 0/5] Support alpha blending in MTK display driver
Date: Thu, 20 Jun 2024 01:27:05 +0800
Message-Id: <20240620-blend-v1-0-72670072ca20@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOoUc2YC/02OywqDMBBFf0Vm3cAk0Rj9leIij0kbWrVNrAjiv
 zfUTZfncjmcHTKlSBn6aodEa8xxngrwSwXubqYbsegLg0BRoxLI7JMmzzoU0khsnA0tlO8rUYj
 bz3MdTk70/hTdco5gTSbm5nGMS18pEai2qNpGc19rJK0k73gRBo7akg3BOqQO/jP66ozgDRvJR
 7PQg/k0som2hRmvkFtZd0HIfpUwHMcX91ar6NwAAAA=
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Hsiao Chien Sung <shawn.sung@mediatek.com>, CK Hu <ck.hu@mediatek.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718818030; l=1980;
 i=shawn.sung@mediatek.com; s=20240616; h=from:subject:message-id;
 bh=ffa9QQcOJtyAVtiNDqxJ1WmYeHKO0blFbInuddhMTh8=;
 b=Em29vUs75c5lfJAEUFMC1hTlqcCcSmdGQzeYIvo6/AGBCkZ8m4TWer36zaThJfIeZeITw0f32
 v0Vfbb67LuDADyMxoePAZ3AVo1rlmHkOhPrxcUign/xyHGac4mrdNMa
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

Support "Pre-multiplied" and "None" blend mode on MediaTek's chips by
adding correct blend mode property when the planes init.
Before this patch, only the "Coverage" mode (default) is supported.

Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
Hsiao Chien Sung (5):
      drm/mediatek: Support "None" blending in OVL
      drm/mediatek: Support "None" blending in Mixer
      drm/mediatek: Support "Pre-multiplied" blending in OVL
      drm/mediatek: Support "Pre-multiplied" blending in Mixer
      drm/mediatek: Support alpha blending in display driver

 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 36 +++++++++++++++++++++++++--------
 drivers/gpu/drm/mediatek/mtk_ethdr.c    | 14 ++++++++++---
 drivers/gpu/drm/mediatek/mtk_plane.c    | 11 ++++++++++
 3 files changed, 50 insertions(+), 11 deletions(-)
---
base-commit: 62fe4b067581d480e863191305f108bebffbc0e9
change-id: 20240620-blend-9023a305cbf7
prerequisite-change-id: 20240615-mediatek-drm-next-ad601b349f23:v3
prerequisite-patch-id: fdd0efbeca41c69c6fa93a5e49a2f16b3d2e8ef7
prerequisite-patch-id: 24bfda7b207bf9698ab88c7233d9168187aa54bb
prerequisite-patch-id: f2ab4804bbe54091a89b310c2ecd4b65fe031137
prerequisite-patch-id: 26bfe746bda376c070c23c72fcc25949e396d952
prerequisite-patch-id: b0b1589f88a9067b93a1e439e1db9abbde96e9e8
prerequisite-patch-id: 14603755fd2d5b6f0ef8a7843e118d0e8d27f57d
prerequisite-patch-id: 86f89ad0a06705cd2ad2867e9409da5610c9d228
prerequisite-patch-id: bd0b091709980bc6e993055d78573f3979139662
prerequisite-patch-id: 2f4da7b628f9d1f03e045b4c8f04b53eeb133a03
prerequisite-patch-id: 9ee1d1b3c69dc6ca828c21fae9180d2e9b5cd4d5
prerequisite-patch-id: 5c1f57bc1bd2d56061c2b927c9efbc9dad36ab68
prerequisite-patch-id: 05443d9f227599f0784da4006c4c983513654087
prerequisite-patch-id: 694abac72844a2b9753453aa514f9485a47a8f32
prerequisite-patch-id: 99f314c9dc697cb78c57d1311dfe055204b9e7b8

Best regards,
-- 
Hsiao Chien Sung <shawn.sung@mediatek.com>


