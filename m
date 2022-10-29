Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86CBC611FB1
	for <lists+dri-devel@lfdr.de>; Sat, 29 Oct 2022 05:16:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AF3110E21E;
	Sat, 29 Oct 2022 03:16:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6992610E21E
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Oct 2022 03:16:00 +0000 (UTC)
Received: from dggpemm500021.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MzkvY6zmKzVjJ2;
 Sat, 29 Oct 2022 11:11:05 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500021.china.huawei.com (7.185.36.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sat, 29 Oct 2022 11:15:57 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Sat, 29 Oct
 2022 11:15:56 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH -next] drm: xlnx: zynqmp_dpsub: fix missing
 clk_disable_unprepare() in error path in zynqmp_dpsub_init_clocks()
Date: Sat, 29 Oct 2022 11:15:00 +0800
Message-ID: <20221029031500.1725489-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
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
Cc: laurent.pinchart@ideasonboard.com, hyun.kwon@xilinx.com,
 yangyingliang@huawei.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If get video or audio clock failed, it should call clk_disable_unprepare()
in error path.

Fixes: c979296ef60c ("drm: xlnx: zynqmp_dpsub: Move audio clk from zynqmp_disp to zynqmp_dpsub")
Fixes: 1682ade66308 ("drm: xlnx: zynqmp_dpsub: Move pclk from zynqmp_disp to zynqmp_dpsub")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
index bab862484d42..50abe222fcc3 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
@@ -109,16 +109,19 @@ static int zynqmp_dpsub_init_clocks(struct zynqmp_dpsub *dpsub)
 	 * live PL video clock isn't valid.
 	 */
 	dpsub->vid_clk = devm_clk_get(dpsub->dev, "dp_live_video_in_clk");
-	if (!IS_ERR(dpsub->vid_clk))
+	if (!IS_ERR(dpsub->vid_clk)) {
 		dpsub->vid_clk_from_ps = false;
-	else if (PTR_ERR(dpsub->vid_clk) == -EPROBE_DEFER)
-		return PTR_ERR(dpsub->vid_clk);
+	} else if (PTR_ERR(dpsub->vid_clk) == -EPROBE_DEFER) {
+		ret = PTR_ERR(dpsub->vid_clk);
+		goto err_disable_clk;
+	}
 
 	if (IS_ERR_OR_NULL(dpsub->vid_clk)) {
 		dpsub->vid_clk = devm_clk_get(dpsub->dev, "dp_vtc_pixel_clk_in");
 		if (IS_ERR(dpsub->vid_clk)) {
 			dev_err(dpsub->dev, "failed to init any video clock\n");
-			return PTR_ERR(dpsub->vid_clk);
+			ret = PTR_ERR(dpsub->vid_clk);
+			goto err_disable_clk;
 		}
 		dpsub->vid_clk_from_ps = true;
 	}
@@ -142,6 +145,11 @@ static int zynqmp_dpsub_init_clocks(struct zynqmp_dpsub *dpsub)
 
 	dev_info(dpsub->dev, "audio disabled due to missing clock\n");
 	return 0;
+
+err_disable_clk:
+	clk_disable_unprepare(dpsub->apb_clk);
+
+	return ret;
 }
 
 static int zynqmp_dpsub_parse_dt(struct zynqmp_dpsub *dpsub)
-- 
2.25.1

