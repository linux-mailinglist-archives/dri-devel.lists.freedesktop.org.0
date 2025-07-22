Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36193B0D5F5
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 11:27:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43E7D10E643;
	Tue, 22 Jul 2025 09:27:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fZfm9RJR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFF4510E643
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 09:27:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 867AD44712;
 Tue, 22 Jul 2025 09:27:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65517C4CEEB;
 Tue, 22 Jul 2025 09:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753176469;
 bh=VTOBb6nBpFUj+KE94TVU4rw/yZM3+SNTYOwcbQSppQk=;
 h=From:To:Cc:Subject:Date:From;
 b=fZfm9RJRju+Gpg+NyeURunZ6YiGhcnGfuCO8h42Yt4aULE8qFDRd8xlxe2mIo+EWs
 4to72BKo0RmUSeM53nqddAMDXTqIZTJQ9c9yEF5Wm/hHhrBqz+L743AbsT00c+Nut9
 bwIsZCVwM2krBfhDKFP2QrbPqTp5DMMeaQLxXTsdltvtrcP9i83X45RRDl+09qc9f0
 LceOfe6B+gfLLR7qyY4ZB7870VzlI/9TIMcp/6m7a64XEFscAOKCAVKQAoVkFIYAjA
 /H9RxmjBREAZxIysVW5rv89rZXoSfsyg2ggakyCJTQgYbcGJvsWrekNoSl6+7yBkr9
 XSBHkJtyBfnMQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
 (envelope-from <johan@kernel.org>) id 1ue9He-0000000007G-3858;
 Tue, 22 Jul 2025 11:27:38 +0200
From: Johan Hovold <johan@kernel.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Johan Hovold <johan@kernel.org>, stable@vger.kernel.org,
 "Nancy.Lin" <nancy.lin@mediatek.com>
Subject: [PATCH] drm/mediatek: fix device leaks at bind
Date: Tue, 22 Jul 2025 11:27:22 +0200
Message-ID: <20250722092722.425-1-johan@kernel.org>
X-Mailer: git-send-email 2.49.1
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

Make sure to drop the references to the sibling platform devices and
their child drm devices taken by of_find_device_by_node() and
device_find_child() when initialising the driver data during bind().

Fixes: 1ef7ed48356c ("drm/mediatek: Modify mediatek-drm for mt8195 multi mmsys support")
Cc: stable@vger.kernel.org	# 6.4
Cc: Nancy.Lin <nancy.lin@mediatek.com>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 7c0c12dde488..33b83576af7e 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -395,10 +395,12 @@ static bool mtk_drm_get_all_drm_priv(struct device *dev)
 			continue;
 
 		drm_dev = device_find_child(&pdev->dev, NULL, mtk_drm_match);
+		put_device(&pdev->dev);
 		if (!drm_dev)
 			continue;
 
 		temp_drm_priv = dev_get_drvdata(drm_dev);
+		put_device(drm_dev);
 		if (!temp_drm_priv)
 			continue;
 
-- 
2.49.1

