Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KHeAElwpdmm/MgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 15:31:56 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B45280FD2
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 15:31:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33A5010E375;
	Sun, 25 Jan 2026 14:31:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WTkvRXxY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9E9210E0A2
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 14:31:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B754F60018;
 Sun, 25 Jan 2026 14:31:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EA87C4CEF1;
 Sun, 25 Jan 2026 14:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769351508;
 bh=zOgHA3zT5qhfU5Vq32Czc4u+R9VVf3Wq9HUKcNzPAUY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WTkvRXxYCq4rqRUu+Nur148XeKAbzwYqqq8/4hg4ggEgXsF+jL1OM7oJidh+/dg6C
 daVMADVeejXPxRnV8zcl3+D83OEtOX43pZ8Ima/DfvRmwEiKYYZhPYl+Fwf2T7VZa7
 iPrzbYqAQG+kUMC7eWSkJTjO2EoCAHTnrxob+QZ+JmLQYyLa7Pd5C1QmdP9eTj32Lg
 /3ErVTrVEwYm8QER1ULPCTDnxeIFvlEIjc/jSqH0wcRlTwaWJmFSJpmRzY+8pLKD70
 99rBtzDkK3iF7OOmyg90juuFBs0DSKYQmrOa3Mhu37AJHVuOgGmBesMjrKiCiwYJr0
 Ni7TchE2YtFZg==
Date: Sun, 25 Jan 2026 16:31:43 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Edward Srouji <edwards@nvidia.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Yishai Hadas <yishaih@nvidia.com>
Subject: Re: [PATCH rdma-next 1/2] RDMA/uverbs: Add DMABUF object type and
 operations
Message-ID: <20260125143143.GF13967@unreal>
References: <20260108-dmabuf-export-v1-0-6d47d46580d3@nvidia.com>
 <20260108-dmabuf-export-v1-1-6d47d46580d3@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260108-dmabuf-export-v1-1-6d47d46580d3@nvidia.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:edwards@nvidia.com,m:jgg@ziepe.ca,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:linux-kernel@vger.kernel.org,m:linux-rdma@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:yishaih@nvidia.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[leon@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leon@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 9B45280FD2
X-Rspamd-Action: no action

On Thu, Jan 08, 2026 at 01:11:14PM +0200, Edward Srouji wrote:
> From: Yishai Hadas <yishaih@nvidia.com>
> 
> Expose DMABUF functionality to userspace through the uverbs interface,
> enabling InfiniBand/RDMA devices to export PCI based memory regions
> (e.g. device memory) as DMABUF file descriptors. This allows
> zero-copy sharing of RDMA memory with other subsystems that support the
> dma-buf framework.
> 
> A new UVERBS_OBJECT_DMABUF object type and allocation method were
> introduced.
> 
> During allocation, uverbs invokes the driver to supply the
> rdma_user_mmap_entry associated with the given page offset (pgoff).
> 
> Based on the returned rdma_user_mmap_entry, uverbs requests the driver
> to provide the corresponding physical-memory details as well as the
> driver’s PCI provider information.
> 
> Using this information, dma_buf_export() is called; if it succeeds,
> uobj->object is set to the underlying file pointer returned by the
> dma-buf framework.
> 
> The file descriptor number follows the standard uverbs allocation flow,
> but the file pointer comes from the dma-buf subsystem, including its own
> fops and private data.
> 
> Because of this, alloc_begin_fd_uobject() must handle cases where
> fd_type->fops is NULL, and both alloc_commit_fd_uobject() and
> alloc_abort_fd_uobject() must account for whether filp->private_data
> exists, since it is only populated after a successful dma_buf_export().
> 
> When an mmap entry is removed, uverbs iterates over its associated
> DMABUFs, marks them as revoked, and calls dma_buf_move_notify() so that
> their importers are notified.
> 
> The same procedure applies during the disassociate flow; final cleanup
> occurs when the application closes the file.
> 
> Signed-off-by: Yishai Hadas <yishaih@nvidia.com>
> Signed-off-by: Edward Srouji <edwards@nvidia.com>
> ---
>  drivers/infiniband/core/Makefile                  |   1 +
>  drivers/infiniband/core/device.c                  |   2 +
>  drivers/infiniband/core/ib_core_uverbs.c          |  19 +++
>  drivers/infiniband/core/rdma_core.c               |  63 ++++----
>  drivers/infiniband/core/rdma_core.h               |   1 +
>  drivers/infiniband/core/uverbs.h                  |  10 ++
>  drivers/infiniband/core/uverbs_std_types_dmabuf.c | 172 ++++++++++++++++++++++
>  drivers/infiniband/core/uverbs_uapi.c             |   1 +
>  include/rdma/ib_verbs.h                           |   9 ++
>  include/rdma/uverbs_types.h                       |   1 +
>  include/uapi/rdma/ib_user_ioctl_cmds.h            |  10 ++
>  11 files changed, 263 insertions(+), 26 deletions(-)

<...>

> +static struct sg_table *
> +uverbs_dmabuf_map(struct dma_buf_attachment *attachment,
> +		  enum dma_data_direction dir)
> +{
> +	struct ib_uverbs_dmabuf_file *priv = attachment->dmabuf->priv;
> +
> +	dma_resv_assert_held(priv->dmabuf->resv);
> +
> +	if (priv->revoked)
> +		return ERR_PTR(-ENODEV);
> +
> +	return dma_buf_phys_vec_to_sgt(attachment, priv->provider,
> +				       &priv->phys_vec, 1, priv->phys_vec.len,
> +				       dir);
> +}
> +
> +static void uverbs_dmabuf_unmap(struct dma_buf_attachment *attachment,
> +				struct sg_table *sgt,
> +				enum dma_data_direction dir)
> +{
> +	dma_buf_free_sgt(attachment, sgt, dir);
> +}

Unfortunately, it is not enough. Exporters should count their
map<->unmap calls and make sure that they are equal.

See this VFIO change https://lore.kernel.org/kvm/20260124-dmabuf-revoke-v5-4-f98fca917e96@nvidia.com/

Thanks
