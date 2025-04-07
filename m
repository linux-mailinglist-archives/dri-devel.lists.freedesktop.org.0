Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 850ABA7E672
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 18:29:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6058610E505;
	Mon,  7 Apr 2025 16:29:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AQsLiNZG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AECFF10E1E7
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 16:29:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5A0856115E;
 Mon,  7 Apr 2025 16:29:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 308BCC4CEDD;
 Mon,  7 Apr 2025 16:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744043357;
 bh=1C6ZG4gfgRFuD1fnDCAECEFIYkJtuil+Y06ILcKyW2w=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=AQsLiNZG/aTcU5wR1SppHAaRoPsJR5YqBvb6TuYXJ2uVPu7NGp0BDKwIrkrkpfdNC
 ceYII2Vjr4+Kr3yjC004BakBTHAGYHQvYPCBM+cpW0IbQ8NsAAG+TQpyHZu5oX9xm2
 1V+UR7mvuWjxituJb/1ZzKFWzdJ7vrTYiWynUf9YzHZrfm6GISoVeWlAVrjKdB48vK
 z30n58TD1LiH0ZPvWSB2zxq6wOVPXDqowpyObOGTIcJ0GyxBMs0N7C7J0fphLcrcsZ
 aBFEcBRXnX7EdktV8EbLDXpGbtUjYYZXbqREVvrUoPNYavd2XXox8REKcg7EqaiijJ
 RnNyGcBXlCFkQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 07 Apr 2025 18:29:07 +0200
Subject: [PATCH v3 1/2] dma-buf: heaps: system: Remove global variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-dma-buf-ecc-heap-v3-1-97cdd36a5f29@kernel.org>
References: <20250407-dma-buf-ecc-heap-v3-0-97cdd36a5f29@kernel.org>
In-Reply-To: <20250407-dma-buf-ecc-heap-v3-0-97cdd36a5f29@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1239; i=mripard@kernel.org;
 h=from:subject:message-id; bh=1C6ZG4gfgRFuD1fnDCAECEFIYkJtuil+Y06ILcKyW2w=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDOmf/4bdZdK44HYnfHtItur/6tT3ezpkQ6dWfPh9KT3YT
 mlf8conHaUsDGJcDLJiiiwxwuZL4k7Net3JxjcPZg4rE8gQBi5OAZiIzmVGhllKEyIVeDf03Z+1
 /kPhlasbTp3w3vrIgENgdZPDpufWT5YyMuzO375gd93Hq7fTzv97zfPxRum8a2x7ti39/nsrR1v
 CwTXsAA==
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

The system heap is storing its struct dma_heap pointer in a global
variable but isn't using it anywhere.

Let's move the global variable into system_heap_create() to make it
local.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/dma-buf/heaps/system_heap.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index 26d5dc89ea1663a0d078e3a5723ca3d8d12b935f..82b1b714300d6ff5f3e543059dd8215ceaa00c69 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -19,12 +19,10 @@
 #include <linux/module.h>
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
 
-static struct dma_heap *sys_heap;
-
 struct system_heap_buffer {
 	struct dma_heap *heap;
 	struct list_head attachments;
 	struct mutex lock;
 	unsigned long len;
@@ -422,10 +420,11 @@ static const struct dma_heap_ops system_heap_ops = {
 };
 
 static int __init system_heap_create(void)
 {
 	struct dma_heap_export_info exp_info;
+	struct dma_heap *sys_heap;
 
 	exp_info.name = "system";
 	exp_info.ops = &system_heap_ops;
 	exp_info.priv = NULL;
 

-- 
2.49.0

