Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMMBGd2HoGlvkgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 18:50:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9C31ACE33
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 18:50:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ABE110E992;
	Thu, 26 Feb 2026 17:50:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bIpV6wsP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 811F710E992
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 17:50:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A8FA960131;
 Thu, 26 Feb 2026 17:50:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F91FC116C6;
 Thu, 26 Feb 2026 17:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772128216;
 bh=h96evXjLOQfDF0EU/VaUFVjUDZ2uON/T+W4AXgqNcyI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bIpV6wsP2UUoJ5P9Tht3SkqXBMpOprx16mmDdTjphJt0Z4TvchF8UvE1JdWykiw+T
 1ISdVtxNKciRLrSxtXtlzbFyrWcpBTeBgBeDF1UbRkbGl0fCkXtZPWCq2g9Qj1xrES
 e06laOMurHsBfOj9QpUpoIzT/K25crgFMrmI9rDI2NFDMEE2s00Ao1vAIa+ruZo3Rd
 0y0+X869vQV1GeLgP71oKFhDM7xx/5Q9IAKfiSSNQLXN10y6vpgq9yyR8R7cVfq6ne
 EdgednPvBmawYjYN9R02D4dt/6A+Pg6uwjBRiQMZwROuKpdyq2wceuYAODFJtGSoJp
 RhNkYzajFhJrw==
Date: Thu, 26 Feb 2026 11:50:11 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org, 
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, 
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de, 
 ekansh.gupta@oss.qualcomm.com, stable@kernel.org
Subject: Re: [PATCH v1] misc: fastrpc: Add reference counting for
 fastrpc_user structure
Message-ID: <r4b67y3zbhclkdskbyobtypkrz5pszykvt2hitntvdimanuwe5@34uqxkc34ub7>
References: <20260226151121.818852-1-anandu.e@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226151121.818852-1-anandu.e@oss.qualcomm.com>
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
	FORGED_RECIPIENTS(0.00)[m:anandu.e@oss.qualcomm.com,m:srini@kernel.org,m:linux-arm-msm@vger.kernel.org,m:gregkh@linuxfoundation.org,m:quic_bkumar@quicinc.com,m:linux-kernel@vger.kernel.org,m:quic_chennak@quicinc.com,m:arnd@arndb.de,m:ekansh.gupta@oss.qualcomm.com,m:stable@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[andersson@kernel.org,dri-devel-bounces@lists.freedesktop.org];
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
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 7F9C31ACE33
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 08:41:21PM +0530, Anandu Krishnan E wrote:
> Add reference counting using kref to the fastrpc_user structure to
> prevent use-after-free issues when contexts are freed from workqueue
> after device release.

Please follow
https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
and start your commit message by clearly establishing the problem, once
that's done you can describe the technical solution.

> 
> The issue occurs when fastrpc_device_release() frees the user structure
> while invoke contexts are still pending in the workqueue. When the
> workqueue later calls fastrpc_context_free(), it attempts to access
> buf->fl->cctx in fastrpc_buf_free(), leading to a use-after-free:

But why does it do that?

The reason why we need buf->fl->cctx in this context is because we need
to mask out the DMA address from the buf->dma_addr (remove the SID bits).

If we instead split "dma_addr" into two separate members of struct
fastrpc_buf, one dma_addr_t dma_addr and one u64 iova_with_sid (?), then
it would be clear throughout the driver which address space we're
talking about (is it the SID-adjusted iova space or the dma_addr_t in
the particular DMA context).

In addition to making this aspect of the driver easier to follow, you no
longer need to call fastrpc_ipa_to_dma_addr() in fastrpc_buf_free() (or
anywhere else for that matter).

You can just pass buf->dma_addr directly to dma_free_coherent().

You're isolating the fact that the firmware needs to see "SID |
dma_addr" to just two places in the driver.

> 
>   pc : fastrpc_buf_free+0x38/0x80 [fastrpc]
>   lr : fastrpc_context_free+0xa8/0x1b0 [fastrpc]
>   ...
>   fastrpc_context_free+0xa8/0x1b0 [fastrpc]
>   fastrpc_context_put_wq+0x78/0xa0 [fastrpc]
>   process_one_work+0x180/0x450
>   worker_thread+0x26c/0x388
> 
> Implement proper reference counting to fix this:
> - Initialize kref in fastrpc_device_open()
> - Take a reference in fastrpc_context_alloc() for each context
> - Release the reference in fastrpc_context_free() when context is freed
> - Release the initial reference in fastrpc_device_release()

There's no reason to include a checklist of pseudo-code in the commit
message, describe why and the overall design if this isn't obvious.

> 
> This ensures the user structure remains valid as long as there are
> contexts holding references to it, preventing the race condition.
> 

The life cycles at play in this driver is already very hard to reason
about.

> Fixes: 6cffd79504ce ("misc: fastrpc: Add support for dmabuf exporter")
> Cc: stable@kernel.org
> Signed-off-by: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 35 +++++++++++++++++++++++++++++++----
>  1 file changed, 31 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 47356a5d5804..3ababcf327d7 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -310,6 +310,8 @@ struct fastrpc_user {
>  	spinlock_t lock;
>  	/* lock for allocations */
>  	struct mutex mutex;
> +	/* Reference count */
> +	struct kref refcount;
>  };
>  
>  /* Extract SMMU PA from consolidated IOVA */
> @@ -497,15 +499,36 @@ static void fastrpc_channel_ctx_put(struct fastrpc_channel_ctx *cctx)
>  	kref_put(&cctx->refcount, fastrpc_channel_ctx_free);
>  }
>  
> +static void fastrpc_user_free(struct kref *ref)
> +{
> +	struct fastrpc_user *fl = container_of(ref, struct fastrpc_user, refcount);

Unrelated question, what does the "fl" abbreviation actually mean? I
presume 'f' is for "fastrpc", but what is 'l'?

Regards,
Bjorn

> +
> +	fastrpc_channel_ctx_put(fl->cctx);
> +	mutex_destroy(&fl->mutex);
> +	kfree(fl);
> +}
> +
> +static void fastrpc_user_get(struct fastrpc_user *fl)
> +{
> +	kref_get(&fl->refcount);
> +}
> +
> +static void fastrpc_user_put(struct fastrpc_user *fl)
> +{
> +	kref_put(&fl->refcount, fastrpc_user_free);
> +}
> +
>  static void fastrpc_context_free(struct kref *ref)
>  {
>  	struct fastrpc_invoke_ctx *ctx;
>  	struct fastrpc_channel_ctx *cctx;
> +	struct fastrpc_user *fl;
>  	unsigned long flags;
>  	int i;
>  
>  	ctx = container_of(ref, struct fastrpc_invoke_ctx, refcount);
>  	cctx = ctx->cctx;
> +	fl = ctx->fl;
>  
>  	for (i = 0; i < ctx->nbufs; i++)
>  		fastrpc_map_put(ctx->maps[i]);
> @@ -521,6 +544,8 @@ static void fastrpc_context_free(struct kref *ref)
>  	kfree(ctx->olaps);
>  	kfree(ctx);
>  
> +	/* Release the reference taken in fastrpc_context_alloc() */
> +	fastrpc_user_put(fl);
>  	fastrpc_channel_ctx_put(cctx);
>  }
>  
> @@ -628,6 +653,8 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
>  
>  	/* Released in fastrpc_context_put() */
>  	fastrpc_channel_ctx_get(cctx);
> +	/* Take a reference to user, released in fastrpc_context_free() */
> +	fastrpc_user_get(user);
>  
>  	ctx->sc = sc;
>  	ctx->retval = -1;
> @@ -658,6 +685,7 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
>  	spin_lock(&user->lock);
>  	list_del(&ctx->node);
>  	spin_unlock(&user->lock);
> +	fastrpc_user_put(user);
>  	fastrpc_channel_ctx_put(cctx);
>  	kfree(ctx->maps);
>  	kfree(ctx->olaps);
> @@ -1606,11 +1634,9 @@ static int fastrpc_device_release(struct inode *inode, struct file *file)
>  	}
>  
>  	fastrpc_session_free(cctx, fl->sctx);
> -	fastrpc_channel_ctx_put(cctx);
> -
> -	mutex_destroy(&fl->mutex);
> -	kfree(fl);
>  	file->private_data = NULL;
> +	/* Release the reference taken in fastrpc_device_open */
> +	fastrpc_user_put(fl);
>  
>  	return 0;
>  }
> @@ -1654,6 +1680,7 @@ static int fastrpc_device_open(struct inode *inode, struct file *filp)
>  	spin_lock_irqsave(&cctx->lock, flags);
>  	list_add_tail(&fl->user, &cctx->users);
>  	spin_unlock_irqrestore(&cctx->lock, flags);
> +	kref_init(&fl->refcount);
>  
>  	return 0;
>  }
> -- 
> 2.34.1
> 
> 
