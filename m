Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80AAB769766
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jul 2023 15:22:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEA1C10E253;
	Mon, 31 Jul 2023 13:22:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBE9810E253
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 13:22:39 +0000 (UTC)
Received: from dggpeml500025.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RDzNH64LGzNmhQ;
 Mon, 31 Jul 2023 21:19:11 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.202) by
 dggpeml500025.china.huawei.com (7.185.36.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 31 Jul 2023 21:22:36 +0800
From: Zhu Wang <wangzhu9@huawei.com>
To: <tomi.valkeinen@ideasonboard.com>, <airlied@gmail.com>, <daniel@ffwll.ch>, 
 <dri-devel@lists.freedesktop.org>, <u.kleine-koenig@pengutronix.de>,
 <arnd@arndb.de>
Subject: [PATCH -next] drm/omap: remove redundant of_match_ptr
Date: Mon, 31 Jul 2023 21:22:06 +0800
Message-ID: <20230731132206.104396-1-wangzhu9@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.174.202]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
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
 drivers/gpu/drm/omapdrm/omap_dmm_tiler.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c b/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c
index 9753c1e1f994..99a5dc36f09d 100644
--- a/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c
+++ b/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c
@@ -1214,7 +1214,7 @@ struct platform_driver omap_dmm_driver = {
 	.driver = {
 		.owner = THIS_MODULE,
 		.name = DMM_DRIVER_NAME,
-		.of_match_table = of_match_ptr(dmm_of_match),
+		.of_match_table = dmm_of_match,
 		.pm = &omap_dmm_pm_ops,
 	},
 };
-- 
2.17.1

