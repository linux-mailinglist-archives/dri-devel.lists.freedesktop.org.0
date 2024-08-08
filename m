Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C061394B856
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2024 09:57:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1245910E67B;
	Thu,  8 Aug 2024 07:57:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCF5710E67B
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2024 07:57:51 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.88.214])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4WffRN4ftLz1S7LL;
 Thu,  8 Aug 2024 15:53:04 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
 by mail.maildlp.com (Postfix) with ESMTPS id 1A2111A016C;
 Thu,  8 Aug 2024 15:57:49 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemf500003.china.huawei.com
 (7.202.181.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 8 Aug
 2024 15:57:48 +0800
From: Zhang Zekun <zhangzekun11@huawei.com>
To: <alain.volmat@foss.st.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>
CC: <zhangzekun11@huawei.com>
Subject: [PATCH] drm: Using for_each_available_child_of_node to simplify code
 logic
Date: Thu, 8 Aug 2024 15:45:10 +0800
Message-ID: <20240808074510.3792-1-zhangzekun11@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.112.208]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemf500003.china.huawei.com (7.202.181.241)
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

The while loop of of_get_next_available_child() can be replaced by
for_each_available_child_of_node(). Using this helper function to
make code logic more simple.

Signed-off-by: Zhang Zekun <zhangzekun11@huawei.com>
---
 drivers/gpu/drm/sti/sti_drv.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/sti/sti_drv.c b/drivers/gpu/drm/sti/sti_drv.c
index 1799c12babf5..3a2cf3dc880f 100644
--- a/drivers/gpu/drm/sti/sti_drv.c
+++ b/drivers/gpu/drm/sti/sti_drv.c
@@ -239,13 +239,9 @@ static int sti_platform_probe(struct platform_device *pdev)
 
 	devm_of_platform_populate(dev);
 
-	child_np = of_get_next_available_child(node, NULL);
-
-	while (child_np) {
+	for_each_available_child_of_node(node, child_np)
 		drm_of_component_match_add(dev, &match, component_compare_of,
 					   child_np);
-		child_np = of_get_next_available_child(node, child_np);
-	}
 
 	return component_master_add_with_match(dev, &sti_ops, match);
 }
-- 
2.17.1

