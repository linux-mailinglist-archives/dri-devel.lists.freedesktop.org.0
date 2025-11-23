Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D6CC7E87E
	for <lists+dri-devel@lfdr.de>; Sun, 23 Nov 2025 23:52:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2B9010E1AB;
	Sun, 23 Nov 2025 22:52:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KQ0b2hy+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0D2610E1A4
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Nov 2025 22:52:04 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-42b3108f41fso2154202f8f.3
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Nov 2025 14:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763938323; x=1764543123; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I7U8WjZVUJLujU3iF7ZJF1k1wei+IEPh96Vfasq7vRA=;
 b=KQ0b2hy+M+sBsjIiUabf6HMXEv+5TKRH6hf5cxbTCN/I3RVqSWWS1uhHtl/9yMthI/
 SAg/jW/jbbw9jmJKy2JdGumIPxP0Zs+Zm9TIKEvlVbfdfcJTYJUcjB9qqTqfJA/SmNp1
 jqTGN19xB5f8qxTUUKTN5iPnyiTgHyxwcnnLWyF04nMlLn/eqikV4R5alfK9peG5k8by
 3EOHyDQlRi6zQ92XCOFg/EZverIroQ9dysVVOwxidhUG0Fygh9pEb48c9DFXxFkTc+er
 JYHH2LPZmXk7LN2OEV/NBCE7WyMKabKEKMg9X3brxt2+0C4DlGF50YSsL2cpKhlfwJly
 DkUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763938323; x=1764543123;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=I7U8WjZVUJLujU3iF7ZJF1k1wei+IEPh96Vfasq7vRA=;
 b=iK7iN1ZmsVV2QyOvYJAtIL2RygfF54Ub1MJ/choYjfBuWVTWov+Lr8h5sG1ee130So
 DAnOe3ZiP+JZHZmNbA7SYyvbho+6mVOR61b+an05OoUVgwPK02d1BdTNlK4oun0q81mo
 s/pYNxWJPorFj7B7l+LZR8vld2UzFnicy2RwIWzJFW7wkzChg4+uxj1LiswW3+LOUsd6
 SpFVJ68+4ubl0tkuttTxIEbUiXxqcEeTskptJOQKHIbWxLDF5+kK9ypwx7zD/Wej+5Pd
 7rE45eYzQJ0o+F4g+yH/bfTu287leMj+4ua7PIxfbPDAC7di28dYB79HC1DkcCqjLTks
 kyAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdJ2pwXyL4ofQQdzkX0Rq7ZO/yHPI65OC/Lu9uqEDTfvNqyOBGnPi+tmq4pY1ODRq0dnT8A7isovU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyZ3RuaNx3tq4h4ZVCyO1l4USSdhz9lc9Yyo4KPD3DT+qGB2n6K
 HZs1t3+hYvTwBnZ9ZtlNpp1u1KioeAtW14PbJStO/YajkXr3ET8cbhUY
X-Gm-Gg: ASbGncuD2MB+iNyfUvlUpcrClVODaztM6d/o1dOxNFccpYzd7UoBlEVwyEDsZ1LivB2
 a+WMmR1cs4X8f/FZfC31U9hVw8y3/oFeki89brvGe2nmwa4kMCM/kqLg2aJI3ubutSJIjaOwTjf
 eeR2gcVjpyQb9V//7ZkvTjFZd+fde5UTioLft1PZse382CtTJvBiTSe3+gbiGusrI6O5bdNq9vv
 zfSX3w3n2IMVzt0/VmGPTSpFIZTt7d9Bezf/UW/aBX9nmA2pQld/AwJGwgQRQzb0uG2dLjJj0DK
 IlPrf+5CHp6NbF2/JtMEFdaAw2My6H+6TLYvOZJ2pG1yxDHhhCcUXQpsL79S8ljxUCCl3C0juXi
 4sXzcaARCKAPbtKRrrqMl4v81F8dvyQhE7dNA9fNh2h0Z6KBs2RwuLjp/E/4fYVdemmK7kmVRL4
 qmjT0FLCWe6/Rwmg==
X-Google-Smtp-Source: AGHT+IHP6prALX51tQ6Iw6dY96wePGFkgrZhEc+sNQdx04+GPwBJksTSC7+04SaYBCnud+M1CKHhfg==
X-Received: by 2002:a05:6000:430e:b0:42b:2e94:5a94 with SMTP id
 ffacd0b85a97d-42cc1cf4540mr9370759f8f.29.1763938323162; 
 Sun, 23 Nov 2025 14:52:03 -0800 (PST)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7fb9190sm24849064f8f.33.2025.11.23.14.51.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Nov 2025 14:52:01 -0800 (PST)
From: Pavel Begunkov <asml.silence@gmail.com>
To: linux-block@vger.kernel.org,
	io-uring@vger.kernel.org
Cc: Vishal Verma <vishal1.verma@intel.com>, tushar.gohad@intel.com,
 Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Pavel Begunkov <asml.silence@gmail.com>, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, David Wei <dw@davidwei.uk>
Subject: [RFC v2 10/11] io_uring/rsrc: add dmabuf-backed buffer registeration
Date: Sun, 23 Nov 2025 22:51:30 +0000
Message-ID: <b38f2c3af8c03ee4fc5f67f97b4412ecd8588924.1763725388.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1763725387.git.asml.silence@gmail.com>
References: <cover.1763725387.git.asml.silence@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add an ability to register a dmabuf backed io_uring buffer. It also
needs know which device to use for attachment, for that it takes
target_fd and extracts the device through the new file op. Unlike normal
buffers, it also retains the target file so that any imports from
ineligible requests can be rejected in next patches.

Suggested-by: Vishal Verma <vishal1.verma@intel.com>
Suggested-by: David Wei <dw@davidwei.uk>
Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
---
 io_uring/rsrc.c | 106 +++++++++++++++++++++++++++++++++++++++++++++++-
 io_uring/rsrc.h |   1 +
 2 files changed, 106 insertions(+), 1 deletion(-)

diff --git a/io_uring/rsrc.c b/io_uring/rsrc.c
index 691f9645d04c..7dfebf459dd0 100644
--- a/io_uring/rsrc.c
+++ b/io_uring/rsrc.c
@@ -10,6 +10,8 @@
 #include <linux/compat.h>
 #include <linux/io_uring.h>
 #include <linux/io_uring/cmd.h>
+#include <linux/dma-buf.h>
+#include <linux/dma_token.h>
 
 #include <uapi/linux/io_uring.h>
 
@@ -802,6 +804,106 @@ bool io_check_coalesce_buffer(struct page **page_array, int nr_pages,
 	return true;
 }
 
+struct io_regbuf_dma {
+	struct dma_token		*token;
+	struct file			*target_file;
+	struct dma_buf			*dmabuf;
+};
+
+static void io_release_reg_dmabuf(void *priv)
+{
+	struct io_regbuf_dma *db = priv;
+
+	dma_token_release(db->token);
+	dma_buf_put(db->dmabuf);
+	fput(db->target_file);
+	kfree(db);
+}
+
+static struct io_rsrc_node *io_register_dmabuf(struct io_ring_ctx *ctx,
+						struct io_uring_reg_buffer *rb,
+						struct iovec *iov)
+{
+	struct dma_token_params params = {};
+	struct io_rsrc_node *node = NULL;
+	struct io_mapped_ubuf *imu = NULL;
+	struct io_regbuf_dma *regbuf = NULL;
+	struct file *target_file = NULL;
+	struct dma_buf *dmabuf = NULL;
+	struct dma_token *token;
+	int ret;
+
+	if (iov->iov_base || iov->iov_len)
+		return ERR_PTR(-EFAULT);
+
+	node = io_rsrc_node_alloc(ctx, IORING_RSRC_BUFFER);
+	if (!node) {
+		ret = -ENOMEM;
+		goto err;
+	}
+
+	imu = io_alloc_imu(ctx, 0);
+	if (!imu) {
+		ret = -ENOMEM;
+		goto err;
+	}
+
+	regbuf = kzalloc(sizeof(*regbuf), GFP_KERNEL);
+	if (!regbuf) {
+		ret = -ENOMEM;
+		goto err;
+	}
+
+	target_file = fget(rb->target_fd);
+	if (!target_file) {
+		ret = -EBADF;
+		goto err;
+	}
+
+	dmabuf = dma_buf_get(rb->dmabuf_fd);
+	if (IS_ERR(dmabuf)) {
+		ret = PTR_ERR(dmabuf);
+		dmabuf = NULL;
+		goto err;
+	}
+
+	params.dmabuf = dmabuf;
+	params.dir = DMA_BIDIRECTIONAL;
+	token = dma_token_create(target_file, &params);
+	if (IS_ERR(token)) {
+		ret = PTR_ERR(token);
+		goto err;
+	}
+
+	regbuf->target_file = target_file;
+	regbuf->token = token;
+	regbuf->dmabuf = dmabuf;
+
+	imu->nr_bvecs = 1;
+	imu->ubuf = 0;
+	imu->len = dmabuf->size;
+	imu->folio_shift = 0;
+	imu->release = io_release_reg_dmabuf;
+	imu->priv = regbuf;
+	imu->flags = IO_IMU_F_DMA;
+	imu->dir = IO_IMU_DEST | IO_IMU_SOURCE;
+	refcount_set(&imu->refs, 1);
+	node->buf = imu;
+	return node;
+err:
+	if (regbuf)
+		kfree(regbuf);
+	if (imu)
+		io_free_imu(ctx, imu);
+	if (node)
+		io_cache_free(&ctx->node_cache, node);
+	if (target_file)
+		fput(target_file);
+	if (dmabuf)
+		dma_buf_put(dmabuf);
+	return ERR_PTR(ret);
+}
+
 static struct io_rsrc_node *io_sqe_buffer_register(struct io_ring_ctx *ctx,
 						   struct io_uring_reg_buffer *rb,
 						   struct iovec *iov,
@@ -817,7 +919,7 @@ static struct io_rsrc_node *io_sqe_buffer_register(struct io_ring_ctx *ctx,
 	bool coalesced = false;
 
 	if (rb->dmabuf_fd != -1 || rb->target_fd != -1)
-		return NULL;
+		return io_register_dmabuf(ctx, rb, iov);
 
 	if (!iov->iov_base)
 		return NULL;
@@ -1117,6 +1219,8 @@ static int io_import_fixed(int ddir, struct iov_iter *iter,
 
 	offset = buf_addr - imu->ubuf;
 
+	if (imu->flags & IO_IMU_F_DMA)
+		return -EOPNOTSUPP;
 	if (imu->flags & IO_IMU_F_KBUF)
 		return io_import_kbuf(ddir, iter, imu, len, offset);
 
diff --git a/io_uring/rsrc.h b/io_uring/rsrc.h
index 7c1128a856ec..280d3988abf3 100644
--- a/io_uring/rsrc.h
+++ b/io_uring/rsrc.h
@@ -30,6 +30,7 @@ enum {
 
 enum {
 	IO_IMU_F_KBUF			= 1,
+	IO_IMU_F_DMA			= 2,
 };
 
 struct io_mapped_ubuf {
-- 
2.52.0

