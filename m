Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87674A62C15
	for <lists+dri-devel@lfdr.de>; Sat, 15 Mar 2025 12:49:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 403CF10E3A6;
	Sat, 15 Mar 2025 11:49:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CADA010E03F
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Mar 2025 05:02:13 +0000 (UTC)
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxhk.zte.com.cn (FangMail) with ESMTPS id 4ZF8H55MX5z5B1KQ;
 Sat, 15 Mar 2025 13:02:09 +0800 (CST)
Received: from xaxapp05.zte.com.cn ([10.99.98.109])
 by mse-fl2.zte.com.cn with SMTP id 52F520VX032049;
 Sat, 15 Mar 2025 13:02:00 +0800 (+08)
 (envelope-from feng.wei8@zte.com.cn)
Received: from mapi (xaxapp04[null]) by mapi (Zmail) with MAPI id mid32;
 Sat, 15 Mar 2025 13:02:01 +0800 (CST)
Date: Sat, 15 Mar 2025 13:02:01 +0800 (CST)
X-Zmail-TransId: 2afb67d509c9ffffffff99c-1b7dd
X-Mailer: Zmail v1.0
Message-ID: <20250315130201758KxKWj6Mb7bgN6SqVrzu94@zte.com.cn>
Mime-Version: 1.0
From: <feng.wei8@zte.com.cn>
To: <sumit.semwal@linaro.org>
Cc: <benjamin.gaignard@collabora.com>, <brian.starkey@arm.com>,
 <jstultz@google.com>, <tjmercier@google.com>,
 <christian.koenig@amd.com>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
 <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIXSBkbWEtYnVmOiBSZXBsYWNlIG5lc3RlZCBtYXgoKSB3aXRoIHNpbmdsZSBtYXgzKCk=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl2.zte.com.cn 52F520VX032049
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 67D509D1.001/4ZF8H55MX5z5B1KQ
X-Mailman-Approved-At: Sat, 15 Mar 2025 11:49:29 +0000
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

From: FengWei <feng.wei8@zte.com.cn>

Use max3() macro instead of nesting max() to simplify the return
statement.

Signed-off-by: FengWei <feng.wei8@zte.com.cn>
---
 drivers/dma-buf/dma-heap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
index 3cbe87d4a464..96cb9ab5731a 100644
--- a/drivers/dma-buf/dma-heap.c
+++ b/drivers/dma-buf/dma-heap.c
@@ -147,7 +147,7 @@ static long dma_heap_ioctl(struct file *file, unsigned int ucmd,
 		in_size = 0;
 	if ((ucmd & kcmd & IOC_OUT) == 0)
 		out_size = 0;
-	ksize = max(max(in_size, out_size), drv_size);
+	ksize = max3(in_size, out_size, drv_size);

 	/* If necessary, allocate buffer for ioctl argument */
 	if (ksize > sizeof(stack_kdata)) {
-- 
2.25.1
