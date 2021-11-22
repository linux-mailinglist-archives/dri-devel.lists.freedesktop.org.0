Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCCB458D01
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 12:08:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B0B76E0DB;
	Mon, 22 Nov 2021 11:08:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FCFF6E0DB
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 11:08:33 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id gt5so13566127pjb.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 03:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=r3BsV1GTEqKXRyiYvYJGLvk2Pn1r3f4nsDFd9biBydc=;
 b=APqXzT+zadmpYq9XewB4Hxtxw2cFZymST7E4a8Ff9UdwuRgpWx9lTe53jJVda6Adu0
 KQO96VWw9lOKubLh15GUKl2EWg3hZ4kYQwOeqXIRENbzfM8e/bE4HOEM1vUApRpUmHZX
 HtuTHt/R+0RwD8/bQ2zy5/TXGRtZzjNxZZKe3mVv5liLwRC3jL1cwRDaJ7e9um/te3wh
 hlkH1Zm+Zs4lV0jPODxLw0ubCpIV9TDCGAOEjST4TsMv6GOAlX/5fcHMy5O5rBmjNyt8
 3UK+axs8zvTmpRSietmqLcjCO1SRGUHaxOpsajyPEGdygQlCX0OkPqgtm43URr7qGsIu
 qqFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=r3BsV1GTEqKXRyiYvYJGLvk2Pn1r3f4nsDFd9biBydc=;
 b=f9lubZxAheLDB1fhEOuykxiYYr+OZ/bGUBOzQEz+wfjODAu/lwhZr4OS199mJjKcw6
 YcvGr/K8OkFmTckOlwgS2X2DyZEfKustH4+6TMXleY874rGI6lwL6hrnQ7T8GARaw2F8
 nBJGtnDX7PW7OvSbTeJBcZm2dgRNwokNLcN0vSbDoPLwkTAqVELvUHRqmc3Ckpgwlghj
 oUU4MhkI4TS9RpWB8E7krzT0IygMVqkLAWHho33t5EzgstnZxAkL2yNRJ827nzOXEt5I
 gPm+azmkBXnPcEytEffuEtKDqRXEaQA1VWH9M7aH7ads81A5XfspxFCqQ5Vc5XbMxkTj
 WkYA==
X-Gm-Message-State: AOAM532rukyka68f4KBfxWRgI2dkHKsJPTzl5so/Kgq+cz+mobh32RjR
 CZPKp2CexIb5KCIKuN/JSlf8pw==
X-Google-Smtp-Source: ABdhPJy9uqTeKGDE2WvyoBL+W3QZz3Y0/gkcwR4vQfRwPr0FI5APvxamrkxamDcP1aJbG1p46s9cEw==
X-Received: by 2002:a17:90a:5d8b:: with SMTP id
 t11mr29665906pji.8.1637579312795; 
 Mon, 22 Nov 2021 03:08:32 -0800 (PST)
Received: from tyrell.hq.igel.co.jp (napt.igel.co.jp. [219.106.231.132])
 by smtp.gmail.com with ESMTPSA id h6sm9572816pfh.82.2021.11.22.03.08.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Nov 2021 03:08:32 -0800 (PST)
From: Shunsuke Mie <mie@igel.co.jp>
To: Zhu Yanjun <zyjzyj2000@gmail.com>
Subject: [RFC PATCH v4 1/2] RDMA/umem: Change for rdma devices has not dma
 device
Date: Mon, 22 Nov 2021 20:08:16 +0900
Message-Id: <20211122110817.33319-2-mie@igel.co.jp>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211122110817.33319-1-mie@igel.co.jp>
References: <20211122110817.33319-1-mie@igel.co.jp>
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
Cc: dhobsong@igel.co.jp, taki@igel.co.jp, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 etom@igel.co.jp, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Doug Ledford <dledford@redhat.com>, Shunsuke Mie <mie@igel.co.jp>,
 Alex Deucher <alexander.deucher@amd.com>, Sean Hefty <sean.hefty@intel.com>,
 Maor Gottlieb <maorg@nvidia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Jianxin Xiong <jianxin.xiong@intel.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Current implementation requires a dma device for RDMA driver to use
dma-buf memory space as RDMA buffer. However, software RDMA drivers has
not dma device and copy RDMA data using CPU instead of hardware.

This patch changes to be hold a dma-buf on struct ib_umem_dmabuf. This
allows the software RDMA driver to map dma-buf memory for CPU memory
accessing.

Signed-off-by: Shunsuke Mie <mie@igel.co.jp>
---
 drivers/infiniband/core/umem_dmabuf.c | 20 ++++++++++++++++----
 include/rdma/ib_umem.h                |  1 +
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/infiniband/core/umem_dmabuf.c b/drivers/infiniband/core/umem_dmabuf.c
index e824baf4640d..ebbb0a259fd4 100644
--- a/drivers/infiniband/core/umem_dmabuf.c
+++ b/drivers/infiniband/core/umem_dmabuf.c
@@ -117,9 +117,6 @@ struct ib_umem_dmabuf *ib_umem_dmabuf_get(struct ib_device *device,
 	if (check_add_overflow(offset, (unsigned long)size, &end))
 		return ret;
 
-	if (unlikely(!ops || !ops->move_notify))
-		return ret;
-
 	dmabuf = dma_buf_get(fd);
 	if (IS_ERR(dmabuf))
 		return ERR_CAST(dmabuf);
@@ -133,6 +130,8 @@ struct ib_umem_dmabuf *ib_umem_dmabuf_get(struct ib_device *device,
 		goto out_release_dmabuf;
 	}
 
+	umem_dmabuf->dmabuf = dmabuf;
+
 	umem = &umem_dmabuf->umem;
 	umem->ibdev = device;
 	umem->length = size;
@@ -143,6 +142,13 @@ struct ib_umem_dmabuf *ib_umem_dmabuf_get(struct ib_device *device,
 	if (!ib_umem_num_pages(umem))
 		goto out_free_umem;
 
+	/* Software RDMA drivers has not dma device. Just get dmabuf from fd */
+	if (!device->dma_device)
+		goto done;
+
+	if (unlikely(!ops || !ops->move_notify))
+		goto out_free_umem;
+
 	umem_dmabuf->attach = dma_buf_dynamic_attach(
 					dmabuf,
 					device->dma_device,
@@ -152,6 +158,7 @@ struct ib_umem_dmabuf *ib_umem_dmabuf_get(struct ib_device *device,
 		ret = ERR_CAST(umem_dmabuf->attach);
 		goto out_free_umem;
 	}
+done:
 	return umem_dmabuf;
 
 out_free_umem:
@@ -165,13 +172,18 @@ EXPORT_SYMBOL(ib_umem_dmabuf_get);
 
 void ib_umem_dmabuf_release(struct ib_umem_dmabuf *umem_dmabuf)
 {
-	struct dma_buf *dmabuf = umem_dmabuf->attach->dmabuf;
+	struct dma_buf *dmabuf = umem_dmabuf->dmabuf;
+
+	if (!umem_dmabuf->attach)
+		goto free_dmabuf;
 
 	dma_resv_lock(dmabuf->resv, NULL);
 	ib_umem_dmabuf_unmap_pages(umem_dmabuf);
 	dma_resv_unlock(dmabuf->resv);
 
 	dma_buf_detach(dmabuf, umem_dmabuf->attach);
+
+free_dmabuf:
 	dma_buf_put(dmabuf);
 	kfree(umem_dmabuf);
 }
diff --git a/include/rdma/ib_umem.h b/include/rdma/ib_umem.h
index 5ae9dff74dac..11c0cf7e0dd8 100644
--- a/include/rdma/ib_umem.h
+++ b/include/rdma/ib_umem.h
@@ -32,6 +32,7 @@ struct ib_umem {
 struct ib_umem_dmabuf {
 	struct ib_umem umem;
 	struct dma_buf_attachment *attach;
+	struct dma_buf *dmabuf;
 	struct sg_table *sgt;
 	struct scatterlist *first_sg;
 	struct scatterlist *last_sg;
-- 
2.17.1

