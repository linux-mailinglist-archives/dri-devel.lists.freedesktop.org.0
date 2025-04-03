Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 906ABA7A14A
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 12:47:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E24710E996;
	Thu,  3 Apr 2025 10:47:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="CVelYyj9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B4E610E996
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Apr 2025 10:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1743677268;
 bh=TWhpXsnRrU8Z0PQfGt/PxD5Exp0UAhzfm4Mm0Yi7U8U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CVelYyj9o+ExGlw4lAPsLPSbcxpwkTm8dYgjCw4bu6ieJmPtAjF9oJGNOdAwH1FBx
 /X0U5zH5ff7Bgmm5QxNgmt6UoVoxcJvVkILr8S6Y6ZGqVTRWgryuzfPUfAv9lC8V6w
 l50EpR6V5fHqFBd05NhQaoCAhgv27U4XCq4yTYTPxqxXgUTaxJQ0KQv4Vff6R/kAs+
 GYJZuQ5Db8GnZFu+IBpNJlunABdDOeDEHCr6QGOSWQ56fSxxM+gSbIMlg62NX+hAGg
 kTkxr2SKZDkACyKHzzgOIvkvXDqGffm6iJBmUKa5CKDYlb5jbeY32dH5z1qY2OR06t
 Xgg3tCBxUmHeA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 284EF17E1034;
 Thu,  3 Apr 2025 12:47:47 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 nancy.lin@mediatek.com, ck.hu@mediatek.com, djkurtz@chromium.org,
 littlecvr@chromium.org, bibby.hsieh@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 wenst@chromium.org, kernel@collabora.com
Subject: [PATCH v2 3/5] drm/mediatek: mtk_drm_drv: Unbind secondary mmsys
 components on err
Date: Thu,  3 Apr 2025 12:47:39 +0200
Message-ID: <20250403104741.71045-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250403104741.71045-1-angelogioacchino.delregno@collabora.com>
References: <20250403104741.71045-1-angelogioacchino.delregno@collabora.com>
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

When calling component_bind_all(), if a component that is included
in the list fails, all of those that have been successfully bound
will be unbound, but this driver has two components lists for two
actual devices, as in, each mmsys instance has its own components
list.

In case mmsys0 (or actually vdosys0) is able to bind all of its
components, but the secondary one fails, all of the components of
the first are kept bound, while the ones of mmsys1/vdosys1 are
correctly cleaned up.

This is not right because, in case of a failure, the components
are re-bound for all of the mmsys/vdosys instances without caring
about the ones that were previously left in a bound state.

Fix that by calling component_unbind_all() on all of the previous
component masters that succeeded binding all subdevices when any
of the other masters errors out.

Fixes: 1ef7ed48356c ("drm/mediatek: Modify mediatek-drm for mt8195 multi mmsys support")
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Link: https://lore.kernel.org/r/20250402083628.20111-4-angelogioacchino.delregno@collabora.com
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 6b31df587507..2d6562b29755 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -482,8 +482,11 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 	for (i = 0; i < private->data->mmsys_dev_num; i++) {
 		drm->dev_private = private->all_drm_private[i];
 		ret = component_bind_all(private->all_drm_private[i]->dev, drm);
-		if (ret)
+		if (ret) {
+			while (--i >= 0)
+				component_unbind_all(private->all_drm_private[i]->dev, drm);
 			return ret;
+		}
 	}
 
 	/*
-- 
2.48.1

