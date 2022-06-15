Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 035A354D103
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 20:36:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4230010FF0B;
	Wed, 15 Jun 2022 18:36:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1851 seconds by postgrey-1.36 at gabe;
 Wed, 15 Jun 2022 11:19:44 UTC
Received: from mail-m963.mail.126.com (mail-m963.mail.126.com [123.126.96.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0BFE310E073
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 11:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=qRBqy
 tTLZ34Rt4thGWj9lEN5JpUglvigXgFN4dG4FQ0=; b=CJv5DMjNu1qbzk88jQzZt
 wYvxeUMZXC2JlwDpysvEUok80Emg4pFK38BmU6dTwgMEzaHHwN0zu8VkeDUhYyb0
 qqez4OVvCKvg1GyYOgbd9krmTITdHL8AEZD3kf5dfay//BL+yFqdH1/OzfzW6I1Z
 hpnvAzvaDfYHFqD90IfNJM=
Received: from localhost.localdomain (unknown [124.16.139.61])
 by smtp8 (Coremail) with SMTP id NORpCgD3mZYCualig72aFg--.47285S2;
 Wed, 15 Jun 2022 18:48:36 +0800 (CST)
From: heliang <windhl@126.com>
To: ldewangan@nvidia.com, gregkh@linuxfoundation.org, jirislaby@kernel.org,
 thierry.reding@gmail.com, jonathanh@nvidia.com, p.zabel@pengutronix.de,
 sumit.semwal@linaro.org, christian.koenig@amd.com
Subject: [PATCH] drivers: tty: serial: Add missing of_node_put() in
 serial-tegra.c
Date: Wed, 15 Jun 2022 18:48:33 +0800
Message-Id: <20220615104833.3963552-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: NORpCgD3mZYCualig72aFg--.47285S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrurW3KFyUCryDCw13JFWrZrb_yoW3CFb_Ww
 nrW3s7Xr4j9FsYqanavry3ur9Ivrn8WFnYqF92qas7W345ZF4DJrZ0qrn7J3sF93yxCrW3
 GrsrWFsrAr1DXjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xREWEE7UUUUU==
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbiuAQhF2JVj36C6QAAsn
X-Mailman-Approved-At: Wed, 15 Jun 2022 18:36:18 +0000
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
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-serial@vger.kernel.org, linux-tegra@vger.kernel.org, windhl@126.com,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In tegra_uart_init(), of_find_matching_node() will return a node
pointer with refcount incremented. We should use of_node_put()
when it is not used anymore.

Signed-off-by: heliang <windhl@126.com>
---
 drivers/tty/serial/serial-tegra.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/tty/serial/serial-tegra.c b/drivers/tty/serial/serial-tegra.c
index d942ab152f5a..5c4850a3762c 100644
--- a/drivers/tty/serial/serial-tegra.c
+++ b/drivers/tty/serial/serial-tegra.c
@@ -1667,6 +1667,7 @@ static int __init tegra_uart_init(void)
 	node = of_find_matching_node(NULL, tegra_uart_of_match);
 	if (node)
 		match = of_match_node(tegra_uart_of_match, node);
+	of_node_put(node);
 	if (match)
 		cdata = match->data;
 	if (cdata)
-- 
2.25.1

