Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D0DA8478C
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 17:17:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58B1110E9EC;
	Thu, 10 Apr 2025 15:17:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="NF6ykLkL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C59410E9EC
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 15:17:00 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id 4F38C5801FF
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 14:53:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 61F6E44332;
 Thu, 10 Apr 2025 14:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1744296801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=XACrmFtTTu8N1uzmt+oqhVkqMDjPP2HTNmYVXTmY2dU=;
 b=NF6ykLkLs1mpP3vFcinXnQ4UgHn6oyDIvl+/g3UPJhGU3vw6NaAOXzzzKd0oG7WymyiYBP
 dwCxqXoZKYRlHPLzPkvVODFRETsrQXJC8TWb9PLZPA//LNW9VA++zsi4HB4HOvyQRVTq3o
 iPSxkKU5hDbDVzY7MoyqxMzjowP++qoK0Z1d0YwB8liPGKKS/2NWLoa72n046kXNjuHrEq
 DFoG8kWwH3GMEUp9VBoWx/fcrefgFMkXlB+uCc6Sl2rJnQEdpKcG8dNMg2BFbKQfnzfgmz
 9xOGv9UNDARU2O7BzJULt44+8Peyvq53zQGzI3z0C4LOnTpQOc12503/yCd53g==
From: Bastien Curutchet <bastien.curutchet@bootlin.com>
Subject: [PATCH 0/3] uio/dma-buf: Give UIO users access to DMA addresses.
Date: Thu, 10 Apr 2025 16:53:17 +0200
Message-Id: <20250410-uio-dma-v1-0-6468ace2c786@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF3b92cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDEwML3dLMfN2U3ERdyyQDQ8NUy1TzNIMkJaDqgqLUtMwKsEnRsbW1AFK
 fJGlZAAAA
X-Change-ID: 20250408-uio-dma-9b011e9e7f0b
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdelvddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthejredtredtjeenucfhrhhomhepuegrshhtihgvnhcuvehurhhuthgthhgvthcuoegsrghsthhivghnrdgtuhhruhhttghhvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedvhfegudetkeffheffleehhfejvefhvdetfeefheettdfgkeegueekleeuvdejfeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrdegvddrheegngdpmhgrihhlfhhrohhmpegsrghsthhivghnrdgtuhhruhhttghhvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeelpdhrtghpthhtohepshhumhhithdrshgvmhifrghlsehlihhnrghrohdrohhrghdprhgtphhtthhopegthhhrihhsthhirghnrdhkohgvnhhighesrghmugdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrg
 hdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehlihhnrghrohdqmhhmqdhsihhgsehlihhsthhsrdhlihhnrghrohdrohhrghdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsggrshhtihgvnhdrtghurhhuthgthhgvthessghoohhtlhhinhdrtghomh
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

Hi all,

Many UIO users performing DMA from their UIO device need to access the
DMA addresses of the allocated buffers. There are out-of-tree drivers
that allow to do it but nothing in the mainline.

I know DMA shouldn't be handled by userspace but, IMHO, since UIO
drivers exist, it would be better if they offered a way of doing this.

This patch series use the dma-heap framework which already allows
userspace to allocate DMA buffers. I tried to avoid 'polluting' the
existing heaps to prevent inappropriate uses of this new feature by
introducing a new UIO heap, which is the only one implementing this
behavior.

PATCH 1 allows the creation of heaps that don't implement map/unmap_buf
operations as UIO heap doesn't use them.
PATCH 2 adds the DMA_BUF_IOCTL_GET_DMA_ADDR which transmits the DMA
addresses to userspace.
PATCH 3 implements the UIO heap.

It has been tested with the uio_pci_generic driver on a PowerPC.

Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
---
Bastien Curutchet (3):
      dma-buf: Allow heap that doesn't provide map_buf/unmap_buf
      dma-buf: Add DMA_BUF_IOCTL_GET_DMA_ADDR
      uio: Add UIO_DMABUF_HEAP

 drivers/dma-buf/dma-buf.c    |  29 +++++++++--
 drivers/uio/Kconfig          |   9 ++++
 drivers/uio/Makefile         |   1 +
 drivers/uio/uio.c            |   4 ++
 drivers/uio/uio_heap.c       | 120 +++++++++++++++++++++++++++++++++++++++++++
 include/linux/dma-buf.h      |   1 +
 include/linux/uio_driver.h   |   2 +
 include/uapi/linux/dma-buf.h |   1 +
 8 files changed, 164 insertions(+), 3 deletions(-)
---
base-commit: 5f13fa25acaa4f586aaed12efcf7436e004eeaf2
change-id: 20250408-uio-dma-9b011e9e7f0b

Best regards,
-- 
Bastien Curutchet <bastien.curutchet@bootlin.com>

