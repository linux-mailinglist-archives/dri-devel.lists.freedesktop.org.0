Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8C434135A
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 04:08:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEA796E96B;
	Fri, 19 Mar 2021 03:08:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 535 seconds by postgrey-1.36 at gabe;
 Fri, 19 Mar 2021 03:08:01 UTC
Received: from mail-m118208.qiye.163.com (mail-m118208.qiye.163.com
 [115.236.118.208])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EB4D6E96B
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 03:08:01 +0000 (UTC)
Received: from vivo-HP-ProDesk-680-G4-PCI-MT.vivo.xyz (unknown
 [58.250.176.229])
 by mail-m118208.qiye.163.com (Hmail) with ESMTPA id 339CAE0213;
 Fri, 19 Mar 2021 10:59:02 +0800 (CST)
From: Wang Qing <wangqing@vivo.com>
To: Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dma-buf: use wake_up_process() instead of wake_up_state()
Date: Fri, 19 Mar 2021 10:58:54 +0800
Message-Id: <1616122734-11581-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZHhhJHkIeHxpDQh8eVkpNSk1KSUlMT0lOTUhVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hKTFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Mgw6Txw6Lj8POU4UCB84Eko9
 GToKFE9VSlVKTUpNSklJTE9JQ0tDVTMWGhIXVQwaFRwKEhUcOw0SDRRVGBQWRVlXWRILWUFZTkNV
 SU5LVUpMTVVJSUJZV1kIAVlBSkxNTTcG
X-HM-Tid: 0a78486c06cb2c17kusn339cae0213
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
Cc: Wang Qing <wangqing@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Using wake_up_process() is more simpler and friendly, 
and it is more convenient for analysis and statistics

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 drivers/dma-buf/dma-fence.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index 7475e09..de51326
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -655,7 +655,7 @@ dma_fence_default_wait_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
 	struct default_wait_cb *wait =
 		container_of(cb, struct default_wait_cb, base);
 
-	wake_up_state(wait->task, TASK_NORMAL);
+	wake_up_process(wait->task);
 }
 
 /**
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
