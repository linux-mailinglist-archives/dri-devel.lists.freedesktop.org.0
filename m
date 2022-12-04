Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 529DB641EE7
	for <lists+dri-devel@lfdr.de>; Sun,  4 Dec 2022 19:35:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3768E10E058;
	Sun,  4 Dec 2022 18:34:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A970710E029
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Dec 2022 14:01:14 +0000 (UTC)
Received: from canpemm500010.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4NQ7XG58DxzqSrc
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Dec 2022 21:57:02 +0800 (CST)
Received: from localhost.localdomain (10.175.112.70) by
 canpemm500010.china.huawei.com (7.192.105.118) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sun, 4 Dec 2022 22:01:09 +0800
From: Wang Yufen <wangyufen@huawei.com>
To: <p.zabel@pengutronix.de>, <airlied@gmail.com>, <daniel@ffwll.ch>
Subject: [PATCH] gpu: ipu-v3: fix refcount leak in ipu_add_client_devices()
Date: Sun, 4 Dec 2022 22:01:01 +0800
Message-ID: <1670162461-29521-1-git-send-email-wangyufen@huawei.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.112.70]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 canpemm500010.china.huawei.com (7.192.105.118)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sun, 04 Dec 2022 18:34:46 +0000
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
Cc: Wang Yufen <wangyufen@huawei.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The node returned by of_graph_get_port_by_id() with refcount incremented,
of_node_put() needs be called when finish using it. So add it in the
error path in ipu_add_client_devices().

Fixes: 17e052175039 ("gpu: ipu-v3: Do not bail out on missing optional port nodes")
Signed-off-by: Wang Yufen <wangyufen@huawei.com>
---
 drivers/gpu/ipu-v3/ipu-common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/ipu-v3/ipu-common.c b/drivers/gpu/ipu-v3/ipu-common.c
index 1183185..80587f5 100644
--- a/drivers/gpu/ipu-v3/ipu-common.c
+++ b/drivers/gpu/ipu-v3/ipu-common.c
@@ -1164,6 +1164,7 @@ static int ipu_add_client_devices(struct ipu_soc *ipu, unsigned long ipu_base)
 
 		pdev = platform_device_alloc(reg->name, id++);
 		if (!pdev) {
+			of_node_put(of_node);
 			ret = -ENOMEM;
 			goto err_register;
 		}
-- 
1.8.3.1

