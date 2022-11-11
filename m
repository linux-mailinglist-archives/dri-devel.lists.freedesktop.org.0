Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0596261F7
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 20:33:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D49310E877;
	Fri, 11 Nov 2022 19:32:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4827510E0E3
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 11:46:34 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id be13so7971428lfb.4
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 03:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8+TGbcI0QMZONMioawRdiUS9+5vmjoD8ChogAY21Oa0=;
 b=K5nlJPYQZx78+Mgn7RBBkCqYmu3Rn6ArgOwGOf2XXY7HAgZoJ9QjWVGhyg1cE6r9Rw
 kEQDEI+qTn83kiYVLHOOLrwoMQ5SCSru6awifHCwiI1tmWgqW7b1oa8ab36hG/fMWV2W
 ciFYrd6x3q5OcT7sYB9b0as4UqBgI9MAe5/vyuoHAKS+qPV89g6qVnLb3NKIrYMFZye3
 rxHA0LvaUTUFkaLK+k7im6nbFwPvI3Ek1hPhrTbUpu4WR+sZQoDcnxBXKugB0Le3HpUc
 TQgeC4cYZWc3HBPSa5vA3e3mgnb2b5GWUkLAmkF2qtIscMbhLPxFP3N2xXIiVGAV8bxm
 BE0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8+TGbcI0QMZONMioawRdiUS9+5vmjoD8ChogAY21Oa0=;
 b=Y0bheCI7qHC5kZ9OhDWbX0dV9KW4KnzOXlJ+HxsKfK7uveP8LDktXYNFCdsuNqDpg4
 K6G3Ury5R3LF4qRmKJ6DUdkLV5jhjPA94LWvcdSTfd5y5NrR0EmY1bCHKXMlNKdIWYFX
 ZE3ZKCCgJ2FrF6w1iXV48u/eG5TyY6nBeuvPgwsLUVolIFJfqrTAI4Er4oVXoOreEPm4
 Amf+kyogGhVq005byX/HVDb568nYlo0DAunxwmbpUNtRlv6vtBgLQMJ7ph+LYwfzUsLN
 LC8c3FlAwO12cbczdn+rbfoOKql+iP3fFHc9pOrlcClTpaN1A9fnJ1PTGk8yn9OkaqJv
 +v0Q==
X-Gm-Message-State: ANoB5pnz1KQekn39YLKClw5gjf9C4Iim4DbG9mFNl8/GUFiii0nyQqsM
 3pylKoaizD3GLQbhRlpTi1g=
X-Google-Smtp-Source: AA0mqf4wiSpCasQPxQc2XZal1V3LS9Za3jYalQQVWS8JERfMTmHASiNZacgz6jFLRAGzfiUbS2gPpA==
X-Received: by 2002:a19:e601:0:b0:4a8:e955:77e7 with SMTP id
 d1-20020a19e601000000b004a8e95577e7mr565011lfh.573.1668167192277; 
 Fri, 11 Nov 2022 03:46:32 -0800 (PST)
Received: from localhost.localdomain ([78.133.163.249])
 by smtp.googlemail.com with ESMTPSA id
 10-20020ac25f4a000000b004979ec19380sm281616lfz.285.2022.11.11.03.46.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 03:46:31 -0800 (PST)
From: Lukasz Wiecaszek <lukasz.wiecaszek@googlemail.com>
X-Google-Original-From: Lukasz Wiecaszek <lukasz.wiecaszek@gmail.com>
To: kraxel@redhat.com
Subject: [PATCH] udmabuf: add vmap method to udmabuf_ops
Date: Fri, 11 Nov 2022 12:45:28 +0100
Message-Id: <20221111114528.608801-1-lukasz.wiecaszek@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 11 Nov 2022 19:32:07 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, Lukasz Wiecaszek <lukasz.wiecaszek@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The reason behind that patch is associated with videobuf2 subsystem
(or more genrally with v4l2 framework) and user created
dma buffers (udmabuf). In some circumstances
when dealing with V4L2_MEMORY_DMABUF buffers videobuf2 subsystem
wants to use dma_buf_vmap() method on the attached dma buffer.
As udmabuf does not have .vmap operation implemented,
such dma_buf_vmap() natually fails.

videobuf2_common: [cap-000000003473b2f1] __vb2_queue_alloc: allocated 3 buffers, 1 plane(s) each
videobuf2_common: [cap-000000003473b2f1] __prepare_dmabuf: buffer for plane 0 changed
videobuf2_common: [cap-000000003473b2f1] __prepare_dmabuf: failed to map dmabuf for plane 0
videobuf2_common: [cap-000000003473b2f1] __buf_prepare: buffer preparation failed: -14

The patch itself seems to be strighforward.
It adds implementation of .vmap method to 'struct dma_buf_ops udmabuf_ops'.
.vmap method itself uses vm_map_ram() to map pages linearly
into the kernel virtual address space (only if such mapping
hasn't been created yet).

Signed-off-by: Lukasz Wiecaszek <lukasz.wiecaszek@gmail.com>
---
 drivers/dma-buf/udmabuf.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 2bcdb935a3ac..8649fcbd05c4 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -12,6 +12,7 @@
 #include <linux/slab.h>
 #include <linux/udmabuf.h>
 #include <linux/hugetlb.h>
+#include <linux/vmalloc.h>
 
 static int list_limit = 1024;
 module_param(list_limit, int, 0644);
@@ -26,6 +27,7 @@ struct udmabuf {
 	struct page **pages;
 	struct sg_table *sg;
 	struct miscdevice *device;
+	void *vaddr;
 };
 
 static vm_fault_t udmabuf_vm_fault(struct vm_fault *vmf)
@@ -57,6 +59,21 @@ static int mmap_udmabuf(struct dma_buf *buf, struct vm_area_struct *vma)
 	return 0;
 }
 
+static int vmap_udmabuf(struct dma_buf *buf, struct dma_buf_map *map)
+{
+	struct udmabuf *ubuf = buf->priv;
+
+	if (!ubuf->vaddr) {
+		ubuf->vaddr = vm_map_ram(ubuf->pages, ubuf->pagecount, -1);
+		if (!ubuf->vaddr)
+			return -EINVAL;
+	}
+
+	dma_buf_map_set_vaddr(map, ubuf->vaddr);
+
+	return 0;
+}
+
 static struct sg_table *get_sg_table(struct device *dev, struct dma_buf *buf,
 				     enum dma_data_direction direction)
 {
@@ -159,6 +176,7 @@ static const struct dma_buf_ops udmabuf_ops = {
 	.unmap_dma_buf	   = unmap_udmabuf,
 	.release	   = release_udmabuf,
 	.mmap		   = mmap_udmabuf,
+	.vmap		   = vmap_udmabuf,
 	.begin_cpu_access  = begin_cpu_udmabuf,
 	.end_cpu_access    = end_cpu_udmabuf,
 };
-- 
2.25.1

