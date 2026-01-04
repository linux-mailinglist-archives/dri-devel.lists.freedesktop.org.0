Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE37CF07D7
	for <lists+dri-devel@lfdr.de>; Sun, 04 Jan 2026 02:47:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8027E10E002;
	Sun,  4 Jan 2026 01:47:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="BQFkcZGp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B830B10E002
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jan 2026 01:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1767491234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tbz55QAFngKi4vXyXWBDlHF0TrS8hK19/MLRgIcCIBc=;
 b=BQFkcZGpnGd5u7C6MJdxdNLlHZZy+DORYmjWrb4WOcgmc/joJG8lxm1EXc1D9QXjiIatT7
 CKmXch+iC8lph3x7c2E8AK9NPYXT/xzZchG2N1CHlaEjife4cwxgUbv9yB5anTAH3cNkJG
 LHE4mvUkAGBFTVS2/QcHv8pVgZ/pzSE=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-319-X6YxGNlRMfOWQGdJqXN29Q-1; Sat,
 03 Jan 2026 20:47:12 -0500
X-MC-Unique: X6YxGNlRMfOWQGdJqXN29Q-1
X-Mimecast-MFC-AGG-ID: X6YxGNlRMfOWQGdJqXN29Q_1767491230
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 7290E1800654; Sun,  4 Jan 2026 01:47:09 +0000 (UTC)
Received: from fedora (unknown [10.72.116.132])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 5984B30001A2; Sun,  4 Jan 2026 01:46:57 +0000 (UTC)
Date: Sun, 4 Jan 2026 09:46:53 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: linux-block@vger.kernel.org, io-uring@vger.kernel.org,
 Vishal Verma <vishal1.verma@intel.com>, tushar.gohad@intel.com,
 Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 David Wei <dw@davidwei.uk>
Subject: Re: [RFC v2 10/11] io_uring/rsrc: add dmabuf-backed buffer
 registeration
Message-ID: <aVnGja6w4e_tgZjK@fedora>
References: <cover.1763725387.git.asml.silence@gmail.com>
 <b38f2c3af8c03ee4fc5f67f97b4412ecd8588924.1763725388.git.asml.silence@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b38f2c3af8c03ee4fc5f67f97b4412ecd8588924.1763725388.git.asml.silence@gmail.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
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

On Sun, Nov 23, 2025 at 10:51:30PM +0000, Pavel Begunkov wrote:
> Add an ability to register a dmabuf backed io_uring buffer. It also
> needs know which device to use for attachment, for that it takes
> target_fd and extracts the device through the new file op. Unlike normal
> buffers, it also retains the target file so that any imports from
> ineligible requests can be rejected in next patches.
> 
> Suggested-by: Vishal Verma <vishal1.verma@intel.com>
> Suggested-by: David Wei <dw@davidwei.uk>
> Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
> ---
>  io_uring/rsrc.c | 106 +++++++++++++++++++++++++++++++++++++++++++++++-
>  io_uring/rsrc.h |   1 +
>  2 files changed, 106 insertions(+), 1 deletion(-)
> 
> diff --git a/io_uring/rsrc.c b/io_uring/rsrc.c
> index 691f9645d04c..7dfebf459dd0 100644
> --- a/io_uring/rsrc.c
> +++ b/io_uring/rsrc.c
> @@ -10,6 +10,8 @@
>  #include <linux/compat.h>
>  #include <linux/io_uring.h>
>  #include <linux/io_uring/cmd.h>
> +#include <linux/dma-buf.h>
> +#include <linux/dma_token.h>
>  
>  #include <uapi/linux/io_uring.h>
>  
> @@ -802,6 +804,106 @@ bool io_check_coalesce_buffer(struct page **page_array, int nr_pages,
>  	return true;
>  }
>  
> +struct io_regbuf_dma {
> +	struct dma_token		*token;
> +	struct file			*target_file;
> +	struct dma_buf			*dmabuf;
> +};
> +
> +static void io_release_reg_dmabuf(void *priv)
> +{
> +	struct io_regbuf_dma *db = priv;
> +
> +	dma_token_release(db->token);
> +	dma_buf_put(db->dmabuf);
> +	fput(db->target_file);
> +	kfree(db);
> +}
> +
> +static struct io_rsrc_node *io_register_dmabuf(struct io_ring_ctx *ctx,
> +						struct io_uring_reg_buffer *rb,
> +						struct iovec *iov)
> +{
> +	struct dma_token_params params = {};
> +	struct io_rsrc_node *node = NULL;
> +	struct io_mapped_ubuf *imu = NULL;
> +	struct io_regbuf_dma *regbuf = NULL;
> +	struct file *target_file = NULL;
> +	struct dma_buf *dmabuf = NULL;
> +	struct dma_token *token;
> +	int ret;
> +
> +	if (iov->iov_base || iov->iov_len)
> +		return ERR_PTR(-EFAULT);
> +
> +	node = io_rsrc_node_alloc(ctx, IORING_RSRC_BUFFER);
> +	if (!node) {
> +		ret = -ENOMEM;
> +		goto err;
> +	}
> +
> +	imu = io_alloc_imu(ctx, 0);
> +	if (!imu) {
> +		ret = -ENOMEM;
> +		goto err;
> +	}
> +
> +	regbuf = kzalloc(sizeof(*regbuf), GFP_KERNEL);
> +	if (!regbuf) {
> +		ret = -ENOMEM;
> +		goto err;
> +	}
> +
> +	target_file = fget(rb->target_fd);
> +	if (!target_file) {
> +		ret = -EBADF;
> +		goto err;
> +	}
> +
> +	dmabuf = dma_buf_get(rb->dmabuf_fd);
> +	if (IS_ERR(dmabuf)) {
> +		ret = PTR_ERR(dmabuf);
> +		dmabuf = NULL;
> +		goto err;
> +	}
> +
> +	params.dmabuf = dmabuf;
> +	params.dir = DMA_BIDIRECTIONAL;
> +	token = dma_token_create(target_file, &params);
> +	if (IS_ERR(token)) {
> +		ret = PTR_ERR(token);
> +		goto err;
> +	}
> +

This way looks less flexible, for example, the same dma-buf may be used
on IOs to multiple disks, then it needs to be registered for each target
file.



Thanks,
Ming

