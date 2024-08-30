Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F413C965876
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 09:30:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6514410E83C;
	Fri, 30 Aug 2024 07:30:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D117610E83C
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 07:30:20 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.17])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Ww8tg1WGZz1j7jD;
 Fri, 30 Aug 2024 15:30:03 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
 by mail.maildlp.com (Postfix) with ESMTPS id B90591A0188;
 Fri, 30 Aug 2024 15:30:16 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 30 Aug
 2024 15:30:16 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <thierry.reding@gmail.com>, <mperttunen@nvidia.com>, <airlied@gmail.com>, 
 <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-tegra@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next v2] gpu: host1x: Use
 for_each_available_child_of_node_scoped()
Date: Fri, 30 Aug 2024 15:38:24 +0800
Message-ID: <20240830073824.3539690-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemh500013.china.huawei.com (7.202.181.146)
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

Avoids the need for manual cleanup of_node_put() in early exits
from the loop.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
v2:
- Split out from the patch set.
---
 drivers/gpu/host1x/bus.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
index 8e09d6d328d2..344cc9e741c1 100644
--- a/drivers/gpu/host1x/bus.c
+++ b/drivers/gpu/host1x/bus.c
@@ -41,7 +41,6 @@ static int host1x_subdev_add(struct host1x_device *device,
 			     struct device_node *np)
 {
 	struct host1x_subdev *subdev;
-	struct device_node *child;
 	int err;
 
 	subdev = kzalloc(sizeof(*subdev), GFP_KERNEL);
@@ -56,13 +55,12 @@ static int host1x_subdev_add(struct host1x_device *device,
 	mutex_unlock(&device->subdevs_lock);
 
 	/* recursively add children */
-	for_each_child_of_node(np, child) {
+	for_each_child_of_node_scoped(np, child) {
 		if (of_match_node(driver->subdevs, child) &&
 		    of_device_is_available(child)) {
 			err = host1x_subdev_add(device, driver, child);
 			if (err < 0) {
 				/* XXX cleanup? */
-				of_node_put(child);
 				return err;
 			}
 		}
@@ -90,17 +88,14 @@ static void host1x_subdev_del(struct host1x_subdev *subdev)
 static int host1x_device_parse_dt(struct host1x_device *device,
 				  struct host1x_driver *driver)
 {
-	struct device_node *np;
 	int err;
 
-	for_each_child_of_node(device->dev.parent->of_node, np) {
+	for_each_child_of_node_scoped(device->dev.parent->of_node, np) {
 		if (of_match_node(driver->subdevs, np) &&
 		    of_device_is_available(np)) {
 			err = host1x_subdev_add(device, driver, np);
-			if (err < 0) {
-				of_node_put(np);
+			if (err < 0)
 				return err;
-			}
 		}
 	}
 
-- 
2.34.1

