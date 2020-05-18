Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7936D1D76C2
	for <lists+dri-devel@lfdr.de>; Mon, 18 May 2020 13:23:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FD486E162;
	Mon, 18 May 2020 11:23:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79DFF89FA9
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 11:23:17 +0000 (UTC)
Received: from ziggy.de (unknown [213.195.113.243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E34C7206D4;
 Mon, 18 May 2020 11:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589800997;
 bh=UX5hVzE4RlHU3iDBRST21Nt0Qg+SmpVsaSQorMHrC0s=;
 h=From:To:Cc:Subject:Date:From;
 b=l3a2r826A4ELNWXZVsYarsVjGOrBdK2avwXVLH5up1ebMFSSDndfmDI6oGGUjXct5
 DoGsL3Smh437oCwNPBt09u56feV9t6UK/Nx+r+MlMDnPPZG6r9C/eSupiHhLyZnctK
 RirMJT1/iWD+liNMDCkscrRG5h6d6zE+FK+UMZHs=
From: matthias.bgg@kernel.org
To: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH] drm/mediatek: Delete not used of_device_get_match_data
Date: Mon, 18 May 2020 13:22:54 +0200
Message-Id: <20200518112254.23692-1-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 matthias.bgg@kernel.org, enric.balletbo@collabora.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Matthias Brugger <matthias.bgg@gmail.com>

The driver will be loaded by via a platform device. So we
will need to get the device_node from the parent device.
Depending on this we will set the driver data.
As all this is done later already, just delete the call to
of_device_get_match_data.

Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index e2bb0d19ef99..63ec92ba0e92 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -447,7 +447,6 @@ static int mtk_drm_probe(struct platform_device *pdev)
 	if (!private)
 		return -ENOMEM;
 
-	private->data = of_device_get_match_data(dev);
 	private->mmsys_dev = dev->parent;
 	if (!private->mmsys_dev) {
 		dev_err(dev, "Failed to get MMSYS device\n");
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
