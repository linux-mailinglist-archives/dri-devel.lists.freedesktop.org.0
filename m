Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2BicDiHtoWlDxQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 20:14:41 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D6A1BC893
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 20:14:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A31CA10EBED;
	Fri, 27 Feb 2026 19:14:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jmIjWIO2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B15E010EBED
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 19:14:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 671FD40B36;
 Fri, 27 Feb 2026 19:14:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E282C116C6;
 Fri, 27 Feb 2026 19:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772219676;
 bh=yCcv7q2kK1JFxQC/UoEe5O2F1n8FApkUcBadl1XBu48=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jmIjWIO2zglTwenOHs2LlHMgpyCUoct1j5Kzv6T3/cMxOVc2pEhVuzKLllxi3bh63
 G0GlUQx8lfKA3ExBy8Pj9VbVeSVd4gzqgjiuBrx0RNVo5LaMxpk57w7uRhZlmvP6Zp
 P3XXBZxd3BoxR8LDp9Rg0asySiItvksrB7O3KKHhYE2JtP9SWqoYN+6rzw+5s4WEXi
 Zq9drH7V5cMWZR+KdEzRh0o1cCVGu5gnV8Sfka7tJMQJoNZkzz4rFP7k+2FGZL0J5F
 VQNmQ93W3BFxdQ5z4+3vy7HAs3tOS0IAXRBUIc8cWev14b8hQkB7rpnsc/qOZCYniS
 l/qs3EDRnlaJg==
Date: Fri, 27 Feb 2026 13:14:32 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org, 
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, 
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de, 
 ekansh.gupta@oss.qualcomm.com, stable@kernel.org
Subject: Re: [PATCH v1] misc: fastrpc: Add reference counting for
 fastrpc_user structure
Message-ID: <qoknqyxewirettcqlymmvnrrn5mft4ugf6zthvgmpeoapotct6@dundgjyvtjj2>
References: <20260226151121.818852-1-anandu.e@oss.qualcomm.com>
 <r4b67y3zbhclkdskbyobtypkrz5pszykvt2hitntvdimanuwe5@34uqxkc34ub7>
 <07d585fe-dfd1-41c9-9c58-b2f9893e572e@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <07d585fe-dfd1-41c9-9c58-b2f9893e572e@oss.qualcomm.com>
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
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[andersson@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:anandu.e@oss.qualcomm.com,m:srini@kernel.org,m:linux-arm-msm@vger.kernel.org,m:gregkh@linuxfoundation.org,m:quic_bkumar@quicinc.com,m:linux-kernel@vger.kernel.org,m:quic_chennak@quicinc.com,m:arnd@arndb.de,m:ekansh.gupta@oss.qualcomm.com,m:stable@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 80D6A1BC893
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 07:52:00PM +0530, Anandu Krishnan E wrote:
> 
> 
> On 2/26/2026 11:20 PM, Bjorn Andersson wrote:
> > On Thu, Feb 26, 2026 at 08:41:21PM +0530, Anandu Krishnan E wrote:
> > > Add reference counting using kref to the fastrpc_user structure to
> > > prevent use-after-free issues when contexts are freed from workqueue
> > > after device release.
> > Please follow
> > https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
> > and start your commit message by clearly establishing the problem, once
> > that's done you can describe the technical solution.
> sure,  will update the commit message and send as patch v2.
> > 
> > > The issue occurs when fastrpc_device_release() frees the user structure
> > > while invoke contexts are still pending in the workqueue. When the
> > > workqueue later calls fastrpc_context_free(), it attempts to access
> > > buf->fl->cctx in fastrpc_buf_free(), leading to a use-after-free:
> > But why does it do that?
> > 
> > The reason why we need buf->fl->cctx in this context is because we need
> > to mask out the DMA address from the buf->dma_addr (remove the SID bits).
> > 
> > If we instead split "dma_addr" into two separate members of struct
> > fastrpc_buf, one dma_addr_t dma_addr and one u64 iova_with_sid (?), then
> > it would be clear throughout the driver which address space we're
> > talking about (is it the SID-adjusted iova space or the dma_addr_t in
> > the particular DMA context).
> > 
> > In addition to making this aspect of the driver easier to follow, you no
> > longer need to call fastrpc_ipa_to_dma_addr() in fastrpc_buf_free() (or
> > anywhere else for that matter).
> > 
> > You can just pass buf->dma_addr directly to dma_free_coherent().
> > 
> > You're isolating the fact that the firmware needs to see "SID |
> > dma_addr" to just two places in the driver.
> I agree with the refactoring direction you’re suggesting, and
> separating the address spaces does make the driver easier
> to reason about.
> 
> That said, the UAF isn’t limited to the buffer
> free path. fastrpc_context_free() also calls fastrpc_map_put(),
> which reaches fastrpc_free_map() and still dereferences fl, so
> addressing only the buffer side doesn’t fully resolve the lifetime issue.
> So the reference counting is still needed. I will update the scenario in
> commit message as well.
> 

I presume you're referring to the "vmid" we need to rebuild the
src_perms for use in fastrpc_free_map()?

I think the relevant question to ask there is if it's really a property
of the "fastrpc file context". It seems to me that we could solve that
by storing the src_perms in the fastrpc_map once we've done the
qcom_scm_assign_mem() call in fastrpc_map_attach() - so that we can free
that object without having to reach out to objects of other lifetimes.

> If you think it makes sense, I can take the address‑space refactoring
> as a separate follow‑up patch and keep this change focused on fixing
> the lifetime issue.

The chance of you fixing one lifetime issue by introducing one or more
worries me, I'm only familiar with the driver, so I wouldn't be able to
say with confidence without investing more time fully understand the
various lifetimes. So if we're going that path, I'd like someone else to
step up and tell me that it's good.

On the other hand, the two changes I presented above are logically
simple to make, follow, and review - and they don't complicate the
driver further. So that would still be _my_ preferred choice.

[..]
> > > diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> > > index 47356a5d5804..3ababcf327d7 100644
> > > --- a/drivers/misc/fastrpc.c
> > > +++ b/drivers/misc/fastrpc.c
> > > @@ -310,6 +310,8 @@ struct fastrpc_user {
> > >   	spinlock_t lock;
> > >   	/* lock for allocations */
> > >   	struct mutex mutex;
> > > +	/* Reference count */
> > > +	struct kref refcount;
> > >   };
> > >   /* Extract SMMU PA from consolidated IOVA */
> > > @@ -497,15 +499,36 @@ static void fastrpc_channel_ctx_put(struct fastrpc_channel_ctx *cctx)
> > >   	kref_put(&cctx->refcount, fastrpc_channel_ctx_free);
> > >   }
> > > +static void fastrpc_user_free(struct kref *ref)
> > > +{
> > > +	struct fastrpc_user *fl = container_of(ref, struct fastrpc_user, refcount);
> > Unrelated question, what does the "fl" abbreviation actually mean? I
> > presume 'f' is for "fastrpc", but what is 'l'?
> fl is short for fastrpc file.
> 

Hmm, okay. Thank you for clarifying.

Regards,
Bjorn

> Regards,
> Anandu
> > 
> > Regards,
> > Bjorn
> > > +
> > > +	fastrpc_channel_ctx_put(fl->cctx);
> > > +	mutex_destroy(&fl->mutex);
> > > +	kfree(fl);
> > > +}
> > > +
> > > +static void fastrpc_user_get(struct fastrpc_user *fl)
> > > +{
> > > +	kref_get(&fl->refcount);
> > > +}
> > > +
> > > +static void fastrpc_user_put(struct fastrpc_user *fl)
> > > +{
> > > +	kref_put(&fl->refcount, fastrpc_user_free);
> > > +}
> > > +
> > >   static void fastrpc_context_free(struct kref *ref)
> > >   {
> > >   	struct fastrpc_invoke_ctx *ctx;
> > >   	struct fastrpc_channel_ctx *cctx;
> > > +	struct fastrpc_user *fl;
> > >   	unsigned long flags;
> > >   	int i;
> > >   	ctx = container_of(ref, struct fastrpc_invoke_ctx, refcount);
> > >   	cctx = ctx->cctx;
> > > +	fl = ctx->fl;
> > >   	for (i = 0; i < ctx->nbufs; i++)
> > >   		fastrpc_map_put(ctx->maps[i]);
> > > @@ -521,6 +544,8 @@ static void fastrpc_context_free(struct kref *ref)
> > >   	kfree(ctx->olaps);
> > >   	kfree(ctx);
> > > +	/* Release the reference taken in fastrpc_context_alloc() */
> > > +	fastrpc_user_put(fl);
> > >   	fastrpc_channel_ctx_put(cctx);
> > >   }
> > > @@ -628,6 +653,8 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
> > >   	/* Released in fastrpc_context_put() */
> > >   	fastrpc_channel_ctx_get(cctx);
> > > +	/* Take a reference to user, released in fastrpc_context_free() */
> > > +	fastrpc_user_get(user);
> > >   	ctx->sc = sc;
> > >   	ctx->retval = -1;
> > > @@ -658,6 +685,7 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
> > >   	spin_lock(&user->lock);
> > >   	list_del(&ctx->node);
> > >   	spin_unlock(&user->lock);
> > > +	fastrpc_user_put(user);
> > >   	fastrpc_channel_ctx_put(cctx);
> > >   	kfree(ctx->maps);
> > >   	kfree(ctx->olaps);
> > > @@ -1606,11 +1634,9 @@ static int fastrpc_device_release(struct inode *inode, struct file *file)
> > >   	}
> > >   	fastrpc_session_free(cctx, fl->sctx);
> > > -	fastrpc_channel_ctx_put(cctx);
> > > -
> > > -	mutex_destroy(&fl->mutex);
> > > -	kfree(fl);
> > >   	file->private_data = NULL;
> > > +	/* Release the reference taken in fastrpc_device_open */
> > > +	fastrpc_user_put(fl);
> > >   	return 0;
> > >   }
> > > @@ -1654,6 +1680,7 @@ static int fastrpc_device_open(struct inode *inode, struct file *filp)
> > >   	spin_lock_irqsave(&cctx->lock, flags);
> > >   	list_add_tail(&fl->user, &cctx->users);
> > >   	spin_unlock_irqrestore(&cctx->lock, flags);
> > > +	kref_init(&fl->refcount);
> > >   	return 0;
> > >   }
> > > -- 
> > > 2.34.1
> > > 
> > > 
> 
