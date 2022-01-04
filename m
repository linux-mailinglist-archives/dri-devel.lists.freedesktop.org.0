Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FE5484F45
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jan 2022 09:25:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFDAE10E74F;
	Wed,  5 Jan 2022 08:24:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FF1310E20D
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jan 2022 07:36:15 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id r17so74288031wrc.3
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jan 2022 23:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5QgurAW0lNK9DtZ5aiYOIjTcb84ucRlepZxkJq+T308=;
 b=GatvyyE/kBqheoYQ/d13MygNqovRYyBIG1SdlHBTM1JWbwgDE3yn5BdZmHzV8HNnvD
 rmimV5S7wUikeOcwGIyS15JbLAw7OU1rycZIfjDo20/Z+pwuC3BigTkotG+zY4Z3RYi2
 e3Na7QyiJiekB7fK2RCVkTJKTz/P8RzAoNvkGvsJH8h2hE7U8ECkMOXtgytKJdpoqgOF
 IUTKXMadctzVM8Lvz9v06fMMeae/oeEe4C8ta1Fai/ggwnhkSQ1ORvJy7e4G5uk+p81v
 nPgtzhQqJCGHo8e/zXUhVqDmmFor3xL5Wzpl6GyWhqpLJmRwhIxS2YHwtQMLBUXGuPg5
 ITsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5QgurAW0lNK9DtZ5aiYOIjTcb84ucRlepZxkJq+T308=;
 b=i2gKfuIgrE3JnxvM+YbXPQoqsKiEGPieXfuqTK6x/1eNhCdIk0ehgpRaduqzPb92VR
 qTaE5sA/rAHlVPe5ChdSm6ILt7x6Tmh/Eg0PLEqzoXauTuwpF4Kr4C+nuYQqtbPO6mtT
 MM1bTkJ/9gkdn8i9jfeAjDwZVxn/8uPFlLEhjyjPqUyMCr/45XoRDRIlU58r01A7r78m
 zLTZW4f85zYUiOFnKc1wbzvCPMdLKSFPUmwn4qO99exET6yLX65TlzoIavTuSCQL3vnh
 kORf5ddTpjNZ362y4fDw7qksffo3BsyBKFfVN54s9uGjvBMcRrpdWzuTr33pIAYgz+ZE
 r07g==
X-Gm-Message-State: AOAM5316VJl/eILYjBoWPDwS9aVC7fmFD0FCiEVeOW7r6+yp+g1SIPu0
 NOFRY7zUDdBlwoVIUHRgsDY=
X-Google-Smtp-Source: ABdhPJwWuBVqvqiAa6SL5fPaQqllfHGw/SdK0Uc5+CN6wLMv/wwUKJbrSULom+MJXNBTgh1mRkzIPw==
X-Received: by 2002:a05:6000:2aa:: with SMTP id
 l10mr42207978wry.518.1641281773701; 
 Mon, 03 Jan 2022 23:36:13 -0800 (PST)
Received: from ownia.. ([103.105.48.220])
 by smtp.gmail.com with ESMTPSA id l12sm43064477wmq.2.2022.01.03.23.36.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 23:36:13 -0800 (PST)
From: Weizhao Ouyang <o451686892@gmail.com>
To: Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Liam Mark <lmark@codeaurora.org>, Laura Abbott <labbott@kernel.org>,
 Brian Starkey <Brian.Starkey@arm.com>,
 John Stultz <john.stultz@linaro.org>, christian.koenig@amd.com
Subject: [PATCH] dma-buf: cma_heap: Fix mutex locking section
Date: Tue,  4 Jan 2022 15:35:45 +0800
Message-Id: <20220104073545.124244-1-o451686892@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 05 Jan 2022 08:24:54 +0000
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
Cc: linaro-mm-sig@lists.linaro.org, Weizhao Ouyang <o451686892@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix cma_heap_buffer mutex locking critical section to protect vmap_cnt
and vaddr.

Fixes: a5d2d29e24be ("dma-buf: heaps: Move heap-helper logic into the cma_heap implementation")
Signed-off-by: Weizhao Ouyang <o451686892@gmail.com>
---
 drivers/dma-buf/heaps/cma_heap.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index 0c05b79870f9..83f02bd51dda 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -124,10 +124,11 @@ static int cma_heap_dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
 	struct cma_heap_buffer *buffer = dmabuf->priv;
 	struct dma_heap_attachment *a;
 
+	mutex_lock(&buffer->lock);
+
 	if (buffer->vmap_cnt)
 		invalidate_kernel_vmap_range(buffer->vaddr, buffer->len);
 
-	mutex_lock(&buffer->lock);
 	list_for_each_entry(a, &buffer->attachments, list) {
 		if (!a->mapped)
 			continue;
@@ -144,10 +145,11 @@ static int cma_heap_dma_buf_end_cpu_access(struct dma_buf *dmabuf,
 	struct cma_heap_buffer *buffer = dmabuf->priv;
 	struct dma_heap_attachment *a;
 
+	mutex_lock(&buffer->lock);
+
 	if (buffer->vmap_cnt)
 		flush_kernel_vmap_range(buffer->vaddr, buffer->len);
 
-	mutex_lock(&buffer->lock);
 	list_for_each_entry(a, &buffer->attachments, list) {
 		if (!a->mapped)
 			continue;
-- 
2.32.0

