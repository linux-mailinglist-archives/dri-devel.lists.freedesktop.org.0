Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E40002DA8EB
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 09:07:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF4F489B60;
	Tue, 15 Dec 2020 08:06:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C618D89DBC
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 02:38:33 +0000 (UTC)
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Cw2VT2Dh3zhrph;
 Tue, 15 Dec 2020 10:37:53 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.498.0; Tue, 15 Dec 2020 10:38:25 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <sumit.semwal@linaro.org>, <benjamin.gaignard@linaro.org>,
 <lmark@codeaurora.org>, <labbott@redhat.com>, <Brian.Starkey@arm.com>,
 <john.stultz@linaro.org>, <christian.koenig@amd.com>
Subject: [PATCH] dma-buf: system_heap: Use PTR_ERR_OR_ZERO() to simplify code
Date: Tue, 15 Dec 2020 10:38:35 +0800
Message-ID: <1607999915-53034-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 15 Dec 2020 08:06:55 +0000
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
Cc: linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes coccicheck warning:
drivers/dma-buf/heaps/system_heap.c:437:1-3: WARNING: PTR_ERR_OR_ZERO
can be used

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/dma-buf/heaps/system_heap.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index 17e0e9a..c5d8a40 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -434,10 +434,8 @@ static int system_heap_create(void)
 	exp_info.priv = NULL;
 
 	sys_heap = dma_heap_add(&exp_info);
-	if (IS_ERR(sys_heap))
-		return PTR_ERR(sys_heap);
 
-	return 0;
+	return PTR_ERR_OR_ZERO(sys_heap);
 }
 module_init(system_heap_create);
 MODULE_LICENSE("GPL v2");
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
