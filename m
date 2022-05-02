Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6CE517EEE
	for <lists+dri-devel@lfdr.de>; Tue,  3 May 2022 09:31:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2C8610EEEC;
	Tue,  3 May 2022 07:31:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 914 seconds by postgrey-1.36 at gabe;
 Mon, 02 May 2022 17:30:14 UTC
Received: from mail-m971.mail.163.com (mail-m971.mail.163.com [123.126.97.1])
 by gabe.freedesktop.org (Postfix) with ESMTP id D56BA10E570
 for <dri-devel@lists.freedesktop.org>; Mon,  2 May 2022 17:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:Message-ID:MIME-Version; bh=76j0I
 vA+I38dm9XbzmM3FuswAc3dTUCCDmQhUcsk+2Y=; b=Wl+Y3oMk2j9KfVEFnmNLH
 eg6GIloHE8BebBvjaOrJsoqg0fI36q4L9/D5d1age8+6bwL58KX2m/Pxnw+ztwLR
 G6B+/2G04FTD4oDHRVw41oCG+8buoG1VLHJ5V4oZJl3dxIUjFfOyr7EwT6QWPqwR
 14ReLd/MZLV3Tx5vk89Mz8=
Received: from localhost (unknown [49.235.41.28])
 by smtp1 (Coremail) with SMTP id GdxpCgCHteaAEXBicD8XAg--.29129S2;
 Tue, 03 May 2022 01:14:40 +0800 (CST)
Date: Tue, 3 May 2022 01:14:40 +0800
From: Hui Su <suhui_kernel@163.com>
To: sumit.semwal@linaro.org, christian.koenig@amd.com,
 daniel.vetter@ffwll.ch, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drivers/dma-buf: fix the wrong return val
Message-ID: <20220502171440.GA377545@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CM-TRANSID: GdxpCgCHteaAEXBicD8XAg--.29129S2
X-Coremail-Antispam: 1Uf129KBjvdXoWruF45ZFW8trW3GFW3Ar4fXwb_yoWkXrgEgr
 48Xw4xX34vkr45tw1qywn5ZFyxKa4DZrZ5Arn2q3yayry5GrnxWw4ku3Z8A348Xa18WFWv
 9ryfW34FkryUXjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8YNt7UUUUU==
X-Originating-IP: [49.235.41.28]
X-CM-SenderInfo: 5vxk3xhbnh20lho6il2tof0z/1tbiMwD0bVXmBJls4AAAsI
X-Mailman-Approved-At: Tue, 03 May 2022 07:31:12 +0000
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

The function should return the correct value.

Fixes: 64a8f92fd783 ("dma-buf: add dma_fence_unwrap v2")
Signed-off-by: Hui Su <suhui@zeku.com>
---
 drivers/dma-buf/st-dma-fence-unwrap.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma-buf/st-dma-fence-unwrap.c b/drivers/dma-buf/st-dma-fence-unwrap.c
index 039f016b57be..0f156fca9697 100644
--- a/drivers/dma-buf/st-dma-fence-unwrap.c
+++ b/drivers/dma-buf/st-dma-fence-unwrap.c
@@ -157,7 +157,7 @@ static int unwrap_array(void *arg)
 	dma_fence_signal(f1);
 	dma_fence_signal(f2);
 	dma_fence_put(array);
-	return 0;
+	return err;
 }

 static int unwrap_chain(void *arg)
@@ -199,7 +199,7 @@ static int unwrap_chain(void *arg)
 	dma_fence_signal(f1);
 	dma_fence_signal(f2);
 	dma_fence_put(chain);
-	return 0;
+	return err;
 }

 static int unwrap_chain_array(void *arg)
@@ -245,7 +245,7 @@ static int unwrap_chain_array(void *arg)
 	dma_fence_signal(f1);
 	dma_fence_signal(f2);
 	dma_fence_put(chain);
-	return 0;
+	return err;
 }

 int dma_fence_unwrap(void)
--
2.34.1

