Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DDE120EE2
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 17:11:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B686C6E5D2;
	Mon, 16 Dec 2019 16:11:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00B5B6E5D2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 16:11:10 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1igsxX-0003nJ-Vx; Mon, 16 Dec 2019 16:11:00 +0000
From: Colin King <colin.king@canonical.com>
To: Sumit Semwal <sumit.semwal@linaro.org>, "Andrew F . Davis" <afd@ti.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Liam Mark <lmark@codeaurora.org>, Laura Abbott <labbott@redhat.com>,
 Brian Starkey <brian.starkey@arm.com>,
 John Stultz <john.stultz@linaro.org>, Sandeep Patil <sspatil@android.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH][next] dma-buf: fix resource leak on -ENOTTY error return path
Date: Mon, 16 Dec 2019 16:10:59 +0000
Message-Id: <20191216161059.269492-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Colin Ian King <colin.king@canonical.com>

The -ENOTTY error return path does not free the allocated
kdata as it returns directly. Fix this by returning via the
error handling label err.

Addresses-Coverity: ("Resource leak")
Fixes: c02a81fba74f ("dma-buf: Add dma-buf heaps framework")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/dma-buf/dma-heap.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
index 4f04d104ae61..80f2f5eac1e4 100644
--- a/drivers/dma-buf/dma-heap.c
+++ b/drivers/dma-buf/dma-heap.c
@@ -157,7 +157,8 @@ static long dma_heap_ioctl(struct file *file, unsigned int ucmd,
 		ret = dma_heap_ioctl_allocate(file, kdata);
 		break;
 	default:
-		return -ENOTTY;
+		ret = -ENOTTY;
+		goto err;
 	}
 
 	if (copy_to_user((void __user *)arg, kdata, out_size) != 0)
-- 
2.24.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
