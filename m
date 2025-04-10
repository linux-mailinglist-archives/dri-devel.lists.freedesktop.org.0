Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A2CA8478D
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 17:17:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D012B10E9EE;
	Thu, 10 Apr 2025 15:17:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="L748CGEy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CC6710E9EE
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 15:17:00 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id 96898580151
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 14:53:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B2C5342EF2;
 Thu, 10 Apr 2025 14:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1744296802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b8CmCxrHUmcZpijI8nj3HAO5vWfDAACyJpqlcTZxtes=;
 b=L748CGEy+bq7CQSmVscaBJmhUCt5hr5nzmtNbv90B6S29pA5I4LgEYhAMerlikZ6+MvC+Y
 uZGk/c7hmKfYLigPAicKM4YybY4lLiD3LJFllXkcPq4bOnH30HRQlS6DOabk3Y00DsVJdz
 z+V8QNx/k7MPXn8768jqQ2WCjGroL8oWqXjOSQlPvZpQbEtl6zEbNq4fM5+9qB96ULRRxw
 /6LXTJOdHT4iUanRy/xOuclIhd2KXc04t8s4NczTWekJS/EexVvLObnPG1vgvEQ53yEIt2
 x86DvBzYj/o1ij5o+c6xdOSDlKujPN19uceM2OmQCUWwdHnd9vkDVN9V/AWyWQ==
From: Bastien Curutchet <bastien.curutchet@bootlin.com>
Date: Thu, 10 Apr 2025 16:53:19 +0200
Subject: [PATCH 2/3] dma-buf: Add DMA_BUF_IOCTL_GET_DMA_ADDR
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-uio-dma-v1-2-6468ace2c786@bootlin.com>
References: <20250410-uio-dma-v1-0-6468ace2c786@bootlin.com>
In-Reply-To: <20250410-uio-dma-v1-0-6468ace2c786@bootlin.com>
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 Bastien Curutchet <bastien.curutchet@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdelvddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepuegrshhtihgvnhcuvehurhhuthgthhgvthcuoegsrghsthhivghnrdgtuhhruhhttghhvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedtvdehfffgjeduteekgeekuddvffejueevkeektdeggfetkeeghefffeehudethfenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrdegvddrheegngdpmhgrihhlfhhrohhmpegsrghsthhivghnrdgtuhhruhhttghhvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeelpdhrtghpthhtohepshhumhhithdrshgvmhifrghlsehlihhnrghrohdrohhrghdprhgtphhtthhopegthhhrihhsthhirghnrdhkohgvnhhighesrghmugdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdro
 hhrghdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehlihhnrghrohdqmhhmqdhsihhgsehlihhsthhsrdhlihhnrghrohdrohhrghdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsggrshhtihgvnhdrtghurhhuthgthhgvthessghoohhtlhhinhdrtghomh
X-GND-Sasl: bastien.curutchet@bootlin.com
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

There is no way to transmit the DMA address of a buffer to userspace.
Some UIO users need this to handle DMA from userspace.

Add a new dma_buf_ops operation that returns the DMA address.
Add a new ioctl to transmit this DMA address to userspace.

Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
---
 drivers/dma-buf/dma-buf.c    | 21 +++++++++++++++++++++
 include/linux/dma-buf.h      |  1 +
 include/uapi/linux/dma-buf.h |  1 +
 3 files changed, 23 insertions(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 398418bd9731ad7a3a1f12eaea6a155fa77a22fe..cbbb518981e54e50f479c3d1fcf6da6971f639c1 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -454,6 +454,24 @@ static long dma_buf_import_sync_file(struct dma_buf *dmabuf,
 }
 #endif
 
+static int dma_buf_get_dma_addr(struct dma_buf *dmabuf, u64 __user *arg)
+{
+	u64 addr;
+	int ret;
+
+	if (!dmabuf->ops->get_dma_addr)
+		return -EINVAL;
+
+	ret = dmabuf->ops->get_dma_addr(dmabuf, &addr);
+	if (ret)
+		return ret;
+
+	if (copy_to_user(arg, &addr, sizeof(u64)))
+		return -EFAULT;
+
+	return 0;
+}
+
 static long dma_buf_ioctl(struct file *file,
 			  unsigned int cmd, unsigned long arg)
 {
@@ -504,6 +522,9 @@ static long dma_buf_ioctl(struct file *file,
 		return dma_buf_import_sync_file(dmabuf, (const void __user *)arg);
 #endif
 
+	case DMA_BUF_IOCTL_GET_DMA_ADDR:
+		return dma_buf_get_dma_addr(dmabuf, (u64 __user *)arg);
+
 	default:
 		return -ENOTTY;
 	}
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index 36216d28d8bdc01a9c9c47e27c392413f7f6c5fb..ed4bf15d3ce82e7a86323fff459699a9bc8baa3b 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -285,6 +285,7 @@ struct dma_buf_ops {
 
 	int (*vmap)(struct dma_buf *dmabuf, struct iosys_map *map);
 	void (*vunmap)(struct dma_buf *dmabuf, struct iosys_map *map);
+	int (*get_dma_addr)(struct dma_buf *dmabuf, u64 *addr);
 };
 
 /**
diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.h
index 5a6fda66d9adf01438619e7e67fa69f0fec2d88d..f3aba46942042de6a2e3a4cca3eb3f87175e29c9 100644
--- a/include/uapi/linux/dma-buf.h
+++ b/include/uapi/linux/dma-buf.h
@@ -178,5 +178,6 @@ struct dma_buf_import_sync_file {
 #define DMA_BUF_SET_NAME_B	_IOW(DMA_BUF_BASE, 1, __u64)
 #define DMA_BUF_IOCTL_EXPORT_SYNC_FILE	_IOWR(DMA_BUF_BASE, 2, struct dma_buf_export_sync_file)
 #define DMA_BUF_IOCTL_IMPORT_SYNC_FILE	_IOW(DMA_BUF_BASE, 3, struct dma_buf_import_sync_file)
+#define DMA_BUF_IOCTL_GET_DMA_ADDR	_IOR(DMA_BUF_BASE, 4, __u64 *)
 
 #endif

-- 
2.49.0

