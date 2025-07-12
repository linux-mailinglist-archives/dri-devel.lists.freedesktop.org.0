Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA45CB0296F
	for <lists+dri-devel@lfdr.de>; Sat, 12 Jul 2025 07:02:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A513A10E083;
	Sat, 12 Jul 2025 05:02:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.b="g3fBSqL3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B43AF10E083
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Jul 2025 05:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=Voc1d95P04gWZr1fFgrqInE7JwmLx8U8/J8TlOkmays=; b=g3fBSqL3v2KAOak+Z1fGiIfC6U
 b51uMUe3zSDhR8aTW0cM/NHK1xv8uDlYOFx/yDCprVViCylMvfienjvRCU5R8k+/+n2LsBYc4oMzf
 HPAWa/2Vx9wbzdaCr6P2xxT7UKhjAN7Z7mUFWINiGbenVY7RXrmS2RgwoTHRWcCZCC8MYgoRSKG2y
 AIN+ufbcRmpp13ya2edOIfyXBaHizz8bISZBwf44IGh4zLBllW9h3+sQhAcFUssxWYPh02tEVo5TQ
 wQAZBqF/GbcKw12axcvttN14XGqXC2yYUkeON/KmNxMdzp7GegFzwNXAmEqYWEvlPx5/gXrPZ45Gt
 xTSzU/2A==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat
 Linux)) id 1uaSNb-00000004bfX-0Kue; Sat, 12 Jul 2025 05:02:31 +0000
Date: Sat, 12 Jul 2025 06:02:31 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: linux-fsdevel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Ofir Bitton <obitton@habana.ai>
Subject: [PATCH 1/2] habanalabs: fix UAF in export_dmabuf()
Message-ID: <20250712050231.GX1880847@ZenIV>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

[dma_buf_fd() fixes; no preferences regarding the tree it goes through -
up to dri folks]

As soon as we'd inserted a file reference into descriptor table, another
thread could close it.  That's fine for the case when all we are doing is
returning that descriptor to userland (it's a race, but it's a userland
race and there's nothing the kernel can do about it).  However, if we
follow fd_install() with any kind of access to objects that would be
destroyed on close (be it the struct file itself or anything destroyed
by its ->release()), we have a UAF.

dma_buf_fd() is a combination of reserving a descriptor and fd_install().
habanalabs export_dmabuf() calls it and then proceeds to access the
objects destroyed on close.  In particular, it grabs an extra reference to
another struct file that will be dropped as part of ->release() for ours;
that "will be" is actually "might have already been".

Fix that by reserving descriptor before anything else and do fd_install()
only when everything had been set up.  As a side benefit, we no longer
have the failure exit with file already created, but reference to
underlying file (as well as ->dmabuf_export_cnt, etc.) not grabbed yet;
unlike dma_buf_fd(), fd_install() can't fail.

Fixes: db1a8dd916aa ("habanalabs: add support for dma-buf exporter")
Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
---
 drivers/accel/habanalabs/common/memory.c | 23 +++++++----------------
 1 file changed, 7 insertions(+), 16 deletions(-)

diff --git a/drivers/accel/habanalabs/common/memory.c b/drivers/accel/habanalabs/common/memory.c
index 601fdbe70179..61472a381904 100644
--- a/drivers/accel/habanalabs/common/memory.c
+++ b/drivers/accel/habanalabs/common/memory.c
@@ -1829,9 +1829,6 @@ static void hl_release_dmabuf(struct dma_buf *dmabuf)
 	struct hl_dmabuf_priv *hl_dmabuf = dmabuf->priv;
 	struct hl_ctx *ctx;
 
-	if (!hl_dmabuf)
-		return;
-
 	ctx = hl_dmabuf->ctx;
 
 	if (hl_dmabuf->memhash_hnode)
@@ -1859,7 +1856,12 @@ static int export_dmabuf(struct hl_ctx *ctx,
 {
 	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
 	struct hl_device *hdev = ctx->hdev;
-	int rc, fd;
+	CLASS(get_unused_fd, fd)(flags);
+
+	if (fd < 0) {
+		dev_err(hdev->dev, "failed to get a file descriptor for a dma-buf, %d\n", fd);
+		return fd;
+	}
 
 	exp_info.ops = &habanalabs_dmabuf_ops;
 	exp_info.size = total_size;
@@ -1872,13 +1874,6 @@ static int export_dmabuf(struct hl_ctx *ctx,
 		return PTR_ERR(hl_dmabuf->dmabuf);
 	}
 
-	fd = dma_buf_fd(hl_dmabuf->dmabuf, flags);
-	if (fd < 0) {
-		dev_err(hdev->dev, "failed to get a file descriptor for a dma-buf, %d\n", fd);
-		rc = fd;
-		goto err_dma_buf_put;
-	}
-
 	hl_dmabuf->ctx = ctx;
 	hl_ctx_get(hl_dmabuf->ctx);
 	atomic_inc(&ctx->hdev->dmabuf_export_cnt);
@@ -1890,13 +1885,9 @@ static int export_dmabuf(struct hl_ctx *ctx,
 	get_file(ctx->hpriv->file_priv->filp);
 
 	*dmabuf_fd = fd;
+	fd_install(take_fd(fd), hl_dmabuf->dmabuf->file);
 
 	return 0;
-
-err_dma_buf_put:
-	hl_dmabuf->dmabuf->priv = NULL;
-	dma_buf_put(hl_dmabuf->dmabuf);
-	return rc;
 }
 
 static int validate_export_params_common(struct hl_device *hdev, u64 addr, u64 size, u64 offset)
-- 
2.39.5

