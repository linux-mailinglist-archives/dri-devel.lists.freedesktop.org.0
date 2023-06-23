Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEE673C2AC
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 23:22:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B457D10E6BC;
	Fri, 23 Jun 2023 21:22:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DD2610E6C0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 21:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inria.fr; s=dc;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=v1C6X9Yx4yVXOAdKb8gSIcJ1cJexwLFD0Mhp8hyTXpM=;
 b=ibGdS6fGsGhc/uttTGaoiJpbUVLv1dQE53RQlyqWPi8I8jYsjA4QPhsG
 69vuLyA1lvbPNf9DFQ9xV+59969GQRIT64vAPf+BtV5VoJBI5MAp5KGAg
 4j/AIfruYXqvPQ99dB1Q5fqTn+WPSuJXNvhdtCBICTm1jBC06qptZY2WA c=;
Authentication-Results: mail3-relais-sop.national.inria.fr;
 dkim=none (message not signed) header.i=none;
 spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr;
 dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.01,153,1684792800"; d="scan'208";a="59686164"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.90.48])
 by mail3-relais-sop.national.inria.fr with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2023 23:15:10 +0200
From: Julia Lawall <Julia.Lawall@inria.fr>
To: Sumit Semwal <sumit.semwal@linaro.org>
Subject: [PATCH 06/26] dma-buf: system_heap: use array_size
Date: Fri, 23 Jun 2023 23:14:37 +0200
Message-Id: <20230623211457.102544-7-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230623211457.102544-1-Julia.Lawall@inria.fr>
References: <20230623211457.102544-1-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>, keescook@chromium.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Liam Mark <lmark@codeaurora.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, John Stultz <jstultz@google.com>,
 dri-devel@lists.freedesktop.org, Laura Abbott <labbott@redhat.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use array_size to protect against multiplication overflows.

The changes were done using the following Coccinelle semantic patch:

// <smpl>
@@
    size_t e1,e2;
    expression COUNT;
    identifier alloc = {vmalloc,vzalloc,kvmalloc,kvzalloc};
@@

(
      alloc(
-           (e1) * (e2)
+           array_size(e1, e2)
      ,...)
|
      alloc(
-           (e1) * (COUNT)
+           array_size(COUNT, e1)
      ,...)
)
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/dma-buf/heaps/system_heap.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index ee7059399e9c..fb7867599874 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -221,7 +221,7 @@ static void *system_heap_do_vmap(struct system_heap_buffer *buffer)
 {
 	struct sg_table *table = &buffer->sg_table;
 	int npages = PAGE_ALIGN(buffer->len) / PAGE_SIZE;
-	struct page **pages = vmalloc(sizeof(struct page *) * npages);
+	struct page **pages = vmalloc(array_size(npages, sizeof(struct page *)));
 	struct page **tmp = pages;
 	struct sg_page_iter piter;
 	void *vaddr;

