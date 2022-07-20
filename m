Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 091FE57B97A
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 17:22:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 883FB8BB8D;
	Wed, 20 Jul 2022 15:22:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m15114.mail.126.com (m15114.mail.126.com [220.181.15.114])
 by gabe.freedesktop.org (Postfix) with ESMTP id E41F38ADE5
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 15:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=cWI2O
 GZDFSn58v4yKlGBhHryNDMLe2SEMLizU/Hmiy4=; b=IfQ6GZobwGKxU8GYX6rnq
 eOwuqFCMlWxaMhfka92KSNz1poiQO4aHtlbaUYRkS6vMI/gAxH28ix6b1Decorhn
 xI5H+DnuLoAJaB5U5VZnD7ZRzXEr2+Tq+bggFWjx29xKYSNlWcEx/mhs5eeiQoBb
 h7q38/AnTuvs6cObZQKVSU=
Received: from localhost.localdomain (unknown [124.16.139.61])
 by smtp7 (Coremail) with SMTP id DsmowAC3hfGzHdhiFAKLFQ--.23305S2;
 Wed, 20 Jul 2022 23:22:28 +0800 (CST)
From: Liang He <windhl@126.com>
To: p.zabel@pengutronix.de, airlied@linux.ie, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, windhl@126.com
Subject: [PATCH] gpu: ipu-v3: common: Add of_node_put() for reference returned
 by of_graph_get_port_by_id()
Date: Wed, 20 Jul 2022 23:22:27 +0800
Message-Id: <20220720152227.1288413-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DsmowAC3hfGzHdhiFAKLFQ--.23305S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7KrWDXFWDur48Kr17CFyrXrb_yoW8Gr48pF
 4fGFySqrW8Gr4I9Fs7Z347ZrWak3WUKrWUtFW2kFnru3s8ta4vyFy0yas5KrWfJFWUJ3W3
 ZFZxtF4UZ3WDAwUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zi4SotUUUUU=
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi7RVEF1pEAbusIQAAsC
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

In ipu_add_client_devices(), we need to call of_node_put() for
reference returned by of_graph_get_port_by_id() in fail path.

Fixes: 17e052175039 ("gpu: ipu-v3: Do not bail out on missing optional port nodes")
Signed-off-by: Liang He <windhl@126.com>
---
In fact, there may be another problem in following code:
 'reg->pdata.of_node = of_node;'
 'ret = platform_device_add_data(pdev, &reg->pdata,
		       sizeof(reg->pdata));'
The prolbem is that the 'of_node' will first escape into 
global 'reg (i.e., client_reg)' and then 'kmemdup' into 
'pdev->dev.platform_data', so there are totally two copies 
of the reference 'of_node'. 
I do not know if there is any problems as I do not know the 
whole picture of 'platform_device_*'.

As a result, I can only give a fix, adding the of_node_put().

 drivers/gpu/ipu-v3/ipu-common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/ipu-v3/ipu-common.c b/drivers/gpu/ipu-v3/ipu-common.c
index 118318513e2d..c35eac1116f5 100644
--- a/drivers/gpu/ipu-v3/ipu-common.c
+++ b/drivers/gpu/ipu-v3/ipu-common.c
@@ -1165,6 +1165,7 @@ static int ipu_add_client_devices(struct ipu_soc *ipu, unsigned long ipu_base)
 		pdev = platform_device_alloc(reg->name, id++);
 		if (!pdev) {
 			ret = -ENOMEM;
+			of_node_put(of_node);
 			goto err_register;
 		}
 
-- 
2.25.1

