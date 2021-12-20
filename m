Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE16047A65C
	for <lists+dri-devel@lfdr.de>; Mon, 20 Dec 2021 09:57:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C6F211329C;
	Mon, 20 Dec 2021 08:57:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 302 seconds by postgrey-1.36 at gabe;
 Mon, 20 Dec 2021 05:48:42 UTC
Received: from out30-57.freemail.mail.aliyun.com
 (out30-57.freemail.mail.aliyun.com [115.124.30.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC3F710E458
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 05:48:42 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R201e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04426;
 MF=xianting.tian@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0V.5MXam_1639979015; 
Received: from localhost(mailfrom:xianting.tian@linux.alibaba.com
 fp:SMTPD_---0V.5MXam_1639979015) by smtp.aliyun-inc.com(127.0.0.1);
 Mon, 20 Dec 2021 13:43:36 +0800
From: Xianting Tian <xianting.tian@linux.alibaba.com>
To: kraxel@redhat.com,
	sumit.semwal@linaro.org,
	christian.koenig@amd.com
Subject: [PATCH] udmabuf: put dmabuf in case of get fd failed
Date: Mon, 20 Dec 2021 13:43:33 +0800
Message-Id: <20211220054333.3041893-1-xianting.tian@linux.alibaba.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 20 Dec 2021 08:57:56 +0000
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
Cc: linaro-mm-sig@lists.linaro.org,
 Xianting Tian <xianting.tian@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It needs call dma_buf_put() to put dmabuf in case of getting
fd failed.

Signed-off-by: Xianting Tian <xianting.tian@linux.alibaba.com>
---
 drivers/dma-buf/udmabuf.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index c57a609db..d77f96995 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -274,8 +274,11 @@ static long udmabuf_create(struct miscdevice *device,
 	flags = 0;
 	if (head->flags & UDMABUF_FLAGS_CLOEXEC)
 		flags |= O_CLOEXEC;
-	return dma_buf_fd(buf, flags);
+	ret = dma_buf_fd(buf, flags);
+	if (ret < 0) {
+		dma_buf_put(buf);
 
+	return ret;
 err:
 	while (pgbuf > 0)
 		put_page(ubuf->pages[--pgbuf]);
-- 
2.17.1

