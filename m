Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6181BBDE6
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 14:46:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7FD86E3CE;
	Tue, 28 Apr 2020 12:46:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CED66E063
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 03:17:52 +0000 (UTC)
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id A4163CD85AA8205E4AD0;
 Tue, 28 Apr 2020 11:17:50 +0800 (CST)
Received: from localhost (10.166.215.154) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.487.0; Tue, 28 Apr 2020
 11:17:41 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <matthias.bgg@gmail.com>, <ck.hu@mediatek.com>,
 <enric.balletbo@collabora.com>, <yuehaibing@huawei.com>
Subject: [PATCH v2 -next] soc: mediatek: Fix Kconfig warning
Date: Tue, 28 Apr 2020 11:17:29 +0800
Message-ID: <20200428031729.49372-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
In-Reply-To: <CAAOTY__km=QZQACp8g-Qr+aWZ4r0Yp7O5j7u8ZTpDpTXXfUdNw@mail.gmail.com>
References: <CAAOTY__km=QZQACp8g-Qr+aWZ4r0Yp7O5j7u8ZTpDpTXXfUdNw@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.166.215.154]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 28 Apr 2020 12:46:22 +0000
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
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

WARNING: unmet direct dependencies detected for MTK_MMSYS
  Depends on [n]: (ARCH_MEDIATEK [=y] || COMPILE_TEST [=n]) && COMMON_CLK_MT8173_MMSYS [=n]
  Selected by [y]:
  - DRM_MEDIATEK [=y] && HAS_IOMEM [=y] && DRM [=y] && (ARCH_MEDIATEK [=y] || ARM && COMPILE_TEST [=n]) && COMMON_CLK [=y] && HAVE_ARM_SMCCC [=y] && OF [=y]

Make MTK_MMSYS select COMMON_CLK_MT8173_MMSYS to fix this.

Fixes: 2c758e301ed9 ("soc / drm: mediatek: Move routing control to mmsys device")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
v2: select COMMON_CLK_MT8173_MMSYS instead of adding DRM_MEDIATEK dependency  
---
 drivers/soc/mediatek/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/soc/mediatek/Kconfig b/drivers/soc/mediatek/Kconfig
index e84513318725..7f9da11e1a50 100644
--- a/drivers/soc/mediatek/Kconfig
+++ b/drivers/soc/mediatek/Kconfig
@@ -46,8 +46,7 @@ config MTK_SCPSYS
 
 config MTK_MMSYS
 	bool "MediaTek MMSYS Support"
-	depends on COMMON_CLK_MT8173_MMSYS
-	default COMMON_CLK_MT8173_MMSYS
+	select COMMON_CLK_MT8173_MMSYS
 	help
 	  Say yes here to add support for the MediaTek Multimedia
 	  Subsystem (MMSYS).
-- 
2.17.1


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
