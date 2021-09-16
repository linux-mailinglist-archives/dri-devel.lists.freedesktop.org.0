Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A08740D425
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 09:53:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 801A76EACA;
	Thu, 16 Sep 2021 07:53:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 986 seconds by postgrey-1.36 at gabe;
 Thu, 16 Sep 2021 07:53:41 UTC
Received: from baidu.com (mx24.baidu.com [111.206.215.185])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4BB836EAC9
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 07:53:41 +0000 (UTC)
Received: from BC-Mail-EX08.internal.baidu.com (unknown [172.31.51.48])
 by Forcepoint Email with ESMTPS id 31E261133E30DDCA424E;
 Thu, 16 Sep 2021 15:37:28 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-EX08.internal.baidu.com (172.31.51.48) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Thu, 16 Sep 2021 15:37:27 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Thu, 16 Sep 2021 15:37:26 +0800
From: Cai Huoqing <caihuoqing@baidu.com>
To: <caihuoqing@baidu.com>
CC: Thierry Reding <thierry.reding@gmail.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Jonathan Hunter
 <jonathanh@nvidia.com>, <dri-devel@lists.freedesktop.org>,
 <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/tegra: plane: Improve use of dev_err_probe()
Date: Thu, 16 Sep 2021 15:37:21 +0800
Message-ID: <20210916073722.9110-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BC-Mail-Ex09.internal.baidu.com (172.31.51.49) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
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

Return dev_err_probe() directly, because the return value of
dev_err_probe() is the appropriate error code, and it can
reduce code size, simplify the code.

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 drivers/gpu/drm/tegra/plane.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/tegra/plane.c b/drivers/gpu/drm/tegra/plane.c
index e00ec3f40ec8..e373411b1f0b 100644
--- a/drivers/gpu/drm/tegra/plane.c
+++ b/drivers/gpu/drm/tegra/plane.c
@@ -744,21 +744,17 @@ int tegra_plane_interconnect_init(struct tegra_plane *plane)
 
 	plane->icc_mem = devm_of_icc_get(dev, icc_name);
 	err = PTR_ERR_OR_ZERO(plane->icc_mem);
-	if (err) {
-		dev_err_probe(dev, err, "failed to get %s interconnect\n",
-			      icc_name);
-		return err;
-	}
+	if (err)
+		return dev_err_probe(dev, err, "failed to get %s interconnect\n",
+				     icc_name);
 
 	/* plane B on T20/30 has a dedicated memory client for a 6-tap vertical filter */
 	if (plane->index == 1 && dc->soc->has_win_b_vfilter_mem_client) {
 		plane->icc_mem_vfilter = devm_of_icc_get(dev, "winb-vfilter");
 		err = PTR_ERR_OR_ZERO(plane->icc_mem_vfilter);
-		if (err) {
-			dev_err_probe(dev, err, "failed to get %s interconnect\n",
-				      "winb-vfilter");
-			return err;
-		}
+		if (err)
+			return dev_err_probe(dev, err, "failed to get %s interconnect\n",
+					     "winb-vfilter");
 	}
 
 	return 0;
-- 
2.25.1

