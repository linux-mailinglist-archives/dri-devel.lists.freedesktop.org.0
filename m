Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D2AA77E9A
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 17:12:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F171E10E5D0;
	Tue,  1 Apr 2025 15:12:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Hr8lUFde";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FBA410E119
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 15:12:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 661B144DF6;
 Tue,  1 Apr 2025 15:12:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CA2EC4CEE9;
 Tue,  1 Apr 2025 15:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743520356;
 bh=27MxOwa0fmEfX/9H4+tLla6KG4vQ8w1k90H6/5GWbIg=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Hr8lUFdexJsRLQMvm29VTlAGCQO0L1pZLvDlAwjxZ4bpErfqzIpjLBq2OtOXxzRh9
 VFBC7Opxicgqb6+hrI0Y/HxJapJuGmLLJ9TGRvNGkwkQqnIz4BO8mMFMw++YK4hbJW
 o6PIJhEo05AWLoAdMyGcdIBi9BBqEr6CzCVmGDWVLCFpaHiu0Bs276XRKu97e1VgCB
 atGqBUF5fCLolrotK3MCo0KjkWouPGlD6hl4n4kqI7pFmXBUNzNcVotkL0bbPyYwEl
 SWq0xGv3MDWv08TASTLKCqNWi48TWDmdk5xuuykpkFnBPcJHhlIho8dIaG0DckpUhV
 bN9rth5Lj2aIg==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 01 Apr 2025 17:12:21 +0200
Subject: [PATCH v2 1/2] dma-buf: heaps: system: Remove global variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250401-dma-buf-ecc-heap-v2-1-043fd006a1af@kernel.org>
References: <20250401-dma-buf-ecc-heap-v2-0-043fd006a1af@kernel.org>
In-Reply-To: <20250401-dma-buf-ecc-heap-v2-0-043fd006a1af@kernel.org>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Mattijs Korpershoek <mkorpershoek@kernel.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1768; i=mripard@kernel.org;
 h=from:subject:message-id; bh=27MxOwa0fmEfX/9H4+tLla6KG4vQ8w1k90H6/5GWbIg=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDOlvmCKKlxsyzbi2ILc0RZkjiSUqyWlmZ6HH8/Jalmvej
 Vu3HC/tKGVhEONikBVTZIkRNl8Sd2rW6042vnkwc1iZQIYwcHEKwEQWCzMyLHeP6tMWm3gqIU5A
 UbhhDs/yqbXrpDjCDqULiC5quRJ8gOF/uaKY3q+X4RlO8p3brr/5UuO2eduaf2vilOfuWLKNSz2
 IFwA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

The system heap has been using its struct dma_heap pointer but wasn't
using it anywhere.

Since we'll need additional parameters to attach to that heap type,
let's create a private structure and set it as the dma_heap drvdata,
removing the global variable in the process.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/dma-buf/heaps/system_heap.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index 26d5dc89ea1663a0d078e3a5723ca3d8d12b935f..adf422eaa33a52794f952d9d4260b8743d37f421 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -19,11 +19,13 @@
 #include <linux/module.h>
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
 
-static struct dma_heap *sys_heap;
+struct system_heap {
+	struct dma_heap *heap;
+};
 
 struct system_heap_buffer {
 	struct dma_heap *heap;
 	struct list_head attachments;
 	struct mutex lock;
@@ -422,17 +424,22 @@ static const struct dma_heap_ops system_heap_ops = {
 };
 
 static int __init system_heap_create(void)
 {
 	struct dma_heap_export_info exp_info;
+	struct system_heap *sys_heap;
+
+	sys_heap = kzalloc(sizeof(*sys_heap), GFP_KERNEL);
+	if (!sys_heap)
+		return -ENOMEM;
 
 	exp_info.name = "system";
 	exp_info.ops = &system_heap_ops;
-	exp_info.priv = NULL;
+	exp_info.priv = sys_heap;
 
-	sys_heap = dma_heap_add(&exp_info);
-	if (IS_ERR(sys_heap))
-		return PTR_ERR(sys_heap);
+	sys_heap->heap = dma_heap_add(&exp_info);
+	if (IS_ERR(sys_heap->heap))
+		return PTR_ERR(sys_heap->heap);
 
 	return 0;
 }
 module_init(system_heap_create);

-- 
2.49.0

