Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECAF1C69AC
	for <lists+dri-devel@lfdr.de>; Wed,  6 May 2020 09:03:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA8726E822;
	Wed,  6 May 2020 07:02:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3716F6E287
 for <dri-devel@lists.freedesktop.org>; Wed,  6 May 2020 06:19:39 +0000 (UTC)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 64528F2DB9A8FB5C990B;
 Wed,  6 May 2020 14:19:36 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.487.0; Wed, 6 May 2020
 14:19:30 +0800
From: Jason Yan <yanaijie@huawei.com>
To: <sumit.semwal@linaro.org>, <afd@ti.com>, <benjamin.gaignard@linaro.org>,
 <lmark@codeaurora.org>, <labbott@redhat.com>, <Brian.Starkey@arm.com>,
 <john.stultz@linaro.org>, <seanpaul@chromium.org>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] dma-buf: heaps: Remove Unneeded variable "ret" in
 dma_heap_dma_buf_begin_cpu_access()
Date: Wed, 6 May 2020 14:18:51 +0800
Message-ID: <20200506061851.19745-1-yanaijie@huawei.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 06 May 2020 07:02:40 +0000
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
Cc: Jason Yan <yanaijie@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following coccicheck warning:

drivers/dma-buf/heaps/heap-helpers.c:203:5-8: Unneeded variable: "ret".
Return "0" on line 216

Signed-off-by: Jason Yan <yanaijie@huawei.com>
---
 drivers/dma-buf/heaps/heap-helpers.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/dma-buf/heaps/heap-helpers.c b/drivers/dma-buf/heaps/heap-helpers.c
index 9f964ca3f59c..c82872501ba2 100644
--- a/drivers/dma-buf/heaps/heap-helpers.c
+++ b/drivers/dma-buf/heaps/heap-helpers.c
@@ -200,7 +200,6 @@ static int dma_heap_dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
 {
 	struct heap_helper_buffer *buffer = dmabuf->priv;
 	struct dma_heaps_attachment *a;
-	int ret = 0;
 
 	mutex_lock(&buffer->lock);
 
@@ -213,7 +212,7 @@ static int dma_heap_dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
 	}
 	mutex_unlock(&buffer->lock);
 
-	return ret;
+	return 0;
 }
 
 static int dma_heap_dma_buf_end_cpu_access(struct dma_buf *dmabuf,
-- 
2.21.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
