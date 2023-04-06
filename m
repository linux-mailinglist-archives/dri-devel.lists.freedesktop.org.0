Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0306D9D2A
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 18:07:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4798E10EC59;
	Thu,  6 Apr 2023 16:07:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B01910EC5E;
 Thu,  6 Apr 2023 16:07:13 +0000 (UTC)
Received: from workpc.. (109-252-119-170.nat.spd-mgts.ru [109.252.119.170])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 1412B66031DE;
 Thu,  6 Apr 2023 17:07:10 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1680797232;
 bh=i+8ZTN0RqkBszh4mtnmP6dUFSRdIZ0W3HJzBJKtrT90=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JD3kaKCZfu72elUMIMaTzy55WisgCoHuHIk7bt98jXNjZwBf8mC8cTGW5aI7A6sh9
 RcbHeVqfSLlyqPzVVN+Snzq5qkxI58jfDBD6igXWXrEs8ZFTmRod7mEpVb+JD0rY4e
 STMB6FbcN9hD+dvEfu4YuYGfi8jYrX3p9zG8lHg5moNOV/CQQRBRLCYjIbIODA641Z
 g3My4K+RpFyxYb3BD2c6AvX7Y+czPh42DeO/WtFuGoiPexhrlLsBc5g+EvwPFgzioc
 6VNj+QYGZsYpIZ87NYwgfKh3PMgPLZ44XRa0Xxl2RRS2GeRbp8coHz/JmSBCGETjAc
 2jiTJaQSCNqQA==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Liam Mark <lmark@codeaurora.org>, Brian Starkey <Brian.Starkey@arm.com>,
 John Stultz <jstultz@google.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Tomi Valkeinen <tomba@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Tomasz Figa <tfiga@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Amol Maheshwari <amahesh@qti.qualcomm.com>,
 Emil Velikov <emil.l.velikov@gmail.com>
Subject: [PATCH v2 6/7] dma-buf: Change locking policy for mmap()
Date: Thu,  6 Apr 2023 19:06:36 +0300
Message-Id: <20230406160637.541702-7-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230406160637.541702-1-dmitry.osipenko@collabora.com>
References: <20230406160637.541702-1-dmitry.osipenko@collabora.com>
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
Cc: linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, kernel@collabora.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Change locking policy of mmap() callback, making exporters responsible
for handling dma-buf reservation locking. Previous locking policy stated
that dma-buf is locked for both importers and exporters by the dma-buf
core, which caused a deadlock problem for DRM drivers in a case of
self-imported dma-bufs which required to take the lock from the DRM
exporter side.

Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/dma-buf/dma-buf.c | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index aa4ea8530cb3..21916bba77d5 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -131,7 +131,6 @@ static struct file_system_type dma_buf_fs_type = {
 static int dma_buf_mmap_internal(struct file *file, struct vm_area_struct *vma)
 {
 	struct dma_buf *dmabuf;
-	int ret;
 
 	if (!is_dma_buf_file(file))
 		return -EINVAL;
@@ -147,11 +146,7 @@ static int dma_buf_mmap_internal(struct file *file, struct vm_area_struct *vma)
 	    dmabuf->size >> PAGE_SHIFT)
 		return -EINVAL;
 
-	dma_resv_lock(dmabuf->resv, NULL);
-	ret = dmabuf->ops->mmap(dmabuf, vma);
-	dma_resv_unlock(dmabuf->resv);
-
-	return ret;
+	return dmabuf->ops->mmap(dmabuf, vma);
 }
 
 static loff_t dma_buf_llseek(struct file *file, loff_t offset, int whence)
@@ -850,6 +845,7 @@ static struct sg_table * __map_dma_buf(struct dma_buf_attachment *attach,
  *     - &dma_buf_ops.release()
  *     - &dma_buf_ops.begin_cpu_access()
  *     - &dma_buf_ops.end_cpu_access()
+ *     - &dma_buf_ops.mmap()
  *
  * 2. These &dma_buf_ops callbacks are invoked with locked dma-buf
  *    reservation and exporter can't take the lock:
@@ -858,7 +854,6 @@ static struct sg_table * __map_dma_buf(struct dma_buf_attachment *attach,
  *     - &dma_buf_ops.unpin()
  *     - &dma_buf_ops.map_dma_buf()
  *     - &dma_buf_ops.unmap_dma_buf()
- *     - &dma_buf_ops.mmap()
  *     - &dma_buf_ops.vmap()
  *     - &dma_buf_ops.vunmap()
  *
@@ -1463,8 +1458,6 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_end_cpu_access, DMA_BUF);
 int dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma,
 		 unsigned long pgoff)
 {
-	int ret;
-
 	if (WARN_ON(!dmabuf || !vma))
 		return -EINVAL;
 
@@ -1485,11 +1478,7 @@ int dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma,
 	vma_set_file(vma, dmabuf->file);
 	vma->vm_pgoff = pgoff;
 
-	dma_resv_lock(dmabuf->resv, NULL);
-	ret = dmabuf->ops->mmap(dmabuf, vma);
-	dma_resv_unlock(dmabuf->resv);
-
-	return ret;
+	return dmabuf->ops->mmap(dmabuf, vma);
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_mmap, DMA_BUF);
 
-- 
2.39.2

