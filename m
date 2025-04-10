Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF3AA8478A
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 17:17:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE3AB10E9D5;
	Thu, 10 Apr 2025 15:17:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="WONdSUJ8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AB1710E9D5
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 15:17:00 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id 108785805BE
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 14:53:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3B06944340;
 Thu, 10 Apr 2025 14:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1744296801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U4BA7fAejlBY9PaU8OYnulpA//8kpOAI95crSo0/NRU=;
 b=WONdSUJ8hAGugdtpL9o6dJ72PwX4ERue/6AhJdlPgrdf8BZlwzcP7lHvl43EWtwWNe7NKf
 CItQ6N5oWCZBFZhVTd3eWTa50iQeviBTw5mc1XgEVijV7HhvFAI5CUWxvZRD3lVwAkp9AI
 U89xIk/qFghdV8dJAjt8Wuefj3ddKtC6RVffHEO9Wg5ZtOqOPo+mkW3eTNVt3A0T217rJo
 rF4rGJe2f/+QDIoRPbyYrQGiYnQBhCnty2xEmXjZDzUn52m2l3wke/BQJyOrZhqWV83kzo
 HxsTAhOkOb1BIHp3+LBjUA1n7Nv1ikRc8Vn4m2nITwrQypcRJIf7U4t5y1/4mQ==
From: Bastien Curutchet <bastien.curutchet@bootlin.com>
Date: Thu, 10 Apr 2025 16:53:18 +0200
Subject: [PATCH 1/3] dma-buf: Allow heap that doesn't provide map_buf/unmap_buf
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-uio-dma-v1-1-6468ace2c786@bootlin.com>
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

dma_buf_export() rejects the creation of dma_buf that don't implement
the map/unmap_buf operations while these operations aren't needed if the
buffer isn't shared by the user.

Allow dma_buf to be created even if these operations aren't implemented.
Add a check of their existence before using them.

Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
---
 drivers/dma-buf/dma-buf.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 5baa83b855156516a0a766bee0789b122473efb3..398418bd9731ad7a3a1f12eaea6a155fa77a22fe 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -631,8 +631,6 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
 	int ret;
 
 	if (WARN_ON(!exp_info->priv || !exp_info->ops
-		    || !exp_info->ops->map_dma_buf
-		    || !exp_info->ops->unmap_dma_buf
 		    || !exp_info->ops->release))
 		return ERR_PTR(-EINVAL);
 
@@ -796,6 +794,9 @@ static struct sg_table *__map_dma_buf(struct dma_buf_attachment *attach,
 	struct sg_table *sg_table;
 	signed long ret;
 
+	if (!attach->dmabuf->ops->map_dma_buf)
+		return ERR_PTR(-EINVAL);
+
 	sg_table = attach->dmabuf->ops->map_dma_buf(attach, direction);
 	if (IS_ERR_OR_NULL(sg_table))
 		return sg_table;
@@ -1002,7 +1003,8 @@ static void __unmap_dma_buf(struct dma_buf_attachment *attach,
 	/* uses XOR, hence this unmangles */
 	mangle_sg_table(sg_table);
 
-	attach->dmabuf->ops->unmap_dma_buf(attach, sg_table, direction);
+	if (attach->dmabuf->ops->unmap_dma_buf)
+		attach->dmabuf->ops->unmap_dma_buf(attach, sg_table, direction);
 }
 
 /**

-- 
2.49.0

