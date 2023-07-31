Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5FF7696CF
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jul 2023 14:53:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 859ED898C4;
	Mon, 31 Jul 2023 12:53:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAF85898C4
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 12:53:39 +0000 (UTC)
Received: from dggpeml500025.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RDymn1XSMzVjtZ;
 Mon, 31 Jul 2023 20:51:53 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.202) by
 dggpeml500025.china.huawei.com (7.185.36.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 31 Jul 2023 20:53:34 +0800
From: Zhu Wang <wangzhu9@huawei.com>
To: <hjc@rock-chips.com>, <heiko@sntech.de>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-rockchip@lists.infradead.org>, 
 <u.kleine-koenig@pengutronix.de>, <arnd@arndb.de>
Subject: [PATCH -next] drm/rockchip: remove redundant of_match_ptr
Date: Mon, 31 Jul 2023 20:53:04 +0800
Message-ID: <20230731125304.87059-1-wangzhu9@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.174.202]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpeml500025.china.huawei.com (7.185.36.35)
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
Cc: wangzhu9@huawei.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver depends on CONFIG_OF, so it is not necessary to use
of_match_ptr here.

Even for drivers that do not depend on CONFIG_OF, it's almost always
better to leave out the of_match_ptr(), since the only thing it can
possibly do is to save a few bytes of .text if a driver can be used both
with and without it. Hence we remove of_match_ptr.

Signed-off-by: Zhu Wang <wangzhu9@huawei.com>
---
 drivers/gpu/drm/rockchip/cdn-dp-core.c       | 2 +-
 drivers/gpu/drm/rockchip/rockchip_lvds.c     | 2 +-
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/rockchip/cdn-dp-core.c
index a29fbafce393..278f1997aec3 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
+++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
@@ -1250,7 +1250,7 @@ struct platform_driver cdn_dp_driver = {
 	.driver = {
 		   .name = "cdn-dp",
 		   .owner = THIS_MODULE,
-		   .of_match_table = of_match_ptr(cdn_dp_dt_ids),
+		   .of_match_table = cdn_dp_dt_ids,
 		   .pm = &cdn_dp_pm_ops,
 	},
 };
diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.c b/drivers/gpu/drm/rockchip/rockchip_lvds.c
index 582859387792..f0f47e9abf5a 100644
--- a/drivers/gpu/drm/rockchip/rockchip_lvds.c
+++ b/drivers/gpu/drm/rockchip/rockchip_lvds.c
@@ -752,6 +752,6 @@ struct platform_driver rockchip_lvds_driver = {
 	.remove_new = rockchip_lvds_remove,
 	.driver = {
 		   .name = "rockchip-lvds",
-		   .of_match_table = of_match_ptr(rockchip_lvds_dt_ids),
+		   .of_match_table = rockchip_lvds_dt_ids,
 	},
 };
diff --git a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
index 62b573f282a7..fcd4cf3072cd 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
+++ b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
@@ -274,6 +274,6 @@ struct platform_driver vop2_platform_driver = {
 	.remove_new = vop2_remove,
 	.driver = {
 		.name = "rockchip-vop2",
-		.of_match_table = of_match_ptr(vop2_dt_match),
+		.of_match_table = vop2_dt_match,
 	},
 };
-- 
2.17.1

