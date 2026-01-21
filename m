Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eMIKKTmPcGkaYgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 09:32:57 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CCC539E1
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 09:32:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ED2010E1A8;
	Wed, 21 Jan 2026 08:32:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lUHFr7TG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2EF210E1A8
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 08:32:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D3A0460007;
 Wed, 21 Jan 2026 08:32:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 238F6C16AAE;
 Wed, 21 Jan 2026 08:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768984372;
 bh=/zT/QjwvPkSB24GeDesBZudUrJ0yllxGlSmObH/gtTs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lUHFr7TGAeMAUTrV0mOIsyb1G5GAbPUJMTSRMrIneHR5ny44/ztcAZeCfxtAjn8vK
 eyVgpdPBG9WzQmI6zBlbzTANLSgeSECemT+UHlbu6DtJxxM0Pf2u6NeIEBPuxrHZWP
 om7xQF/CZkIrrSO7THkC0CAy07v9tFe7vrckwWj2uhTpWU+6ten5aVcD0aZoENXBfQ
 QQojJJtaFv5CQAkLFtqZoawL/YWS/LYmOrMjgRM+PquvF5n73IF+VT8HFzY55/b80k
 i6wzEZbfXg+yzDpwEpFU+4x7qStuCs2V7k1+ghigK5/fEhcku8m16Gx0ingiM2IPE4
 nRdh5CgWDr1dA==
Date: Wed, 21 Jan 2026 10:32:46 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Edward Srouji <edwards@nvidia.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Yishai Hadas <yishaih@nvidia.com>
Subject: Re: [PATCH rdma-next 1/2] RDMA/uverbs: Add DMABUF object type and
 operations
Message-ID: <20260121083246.GV13201@unreal>
References: <20260108-dmabuf-export-v1-0-6d47d46580d3@nvidia.com>
 <20260108-dmabuf-export-v1-1-6d47d46580d3@nvidia.com>
 <20260120181520.GS961572@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120181520.GS961572@ziepe.ca>
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jgg@ziepe.ca,m:edwards@nvidia.com,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:linux-kernel@vger.kernel.org,m:linux-rdma@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:yishaih@nvidia.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[leon@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leon@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: 30CCC539E1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026 at 02:15:20PM -0400, Jason Gunthorpe wrote:
> On Thu, Jan 08, 2026 at 01:11:14PM +0200, Edward Srouji wrote:
> >  void rdma_user_mmap_entry_remove(struct rdma_user_mmap_entry *entry)
> >  {
> > +	struct ib_uverbs_dmabuf_file *uverbs_dmabuf, *tmp;
> > +
> >  	if (!entry)
> >  		return;
> >  
> > +	mutex_lock(&entry->dmabufs_lock);
> >  	xa_lock(&entry->ucontext->mmap_xa);
> >  	entry->driver_removed = true;
> >  	xa_unlock(&entry->ucontext->mmap_xa);
> > +	list_for_each_entry_safe(uverbs_dmabuf, tmp, &entry->dmabufs, dmabufs_elm) {
> > +		dma_resv_lock(uverbs_dmabuf->dmabuf->resv, NULL);
> > +		list_del(&uverbs_dmabuf->dmabufs_elm);
> > +		uverbs_dmabuf->revoked = true;
> > +		dma_buf_move_notify(uverbs_dmabuf->dmabuf);
> > +		dma_resv_unlock(uverbs_dmabuf->dmabuf->resv);
> 
> This will need the same wait that Christian pointed out for VFIO..

Yes, something like this is missing
https://lore.kernel.org/all/20260120-dmabuf-revoke-v3-6-b7e0b07b8214@nvidia.com/

<...>

> > +struct ib_uverbs_dmabuf_file {
> > +	struct ib_uobject uobj;
> > +	struct dma_buf *dmabuf;
> > +	struct list_head dmabufs_elm;
> > +	struct rdma_user_mmap_entry *mmap_entry;
> > +	struct dma_buf_phys_vec phys_vec;
> 
> Oh, are we going to have weird merge conflicts with this Leon?

No, Alex created a shared branch with the rename already applied for me.  
I had planned to merge it into the RDMA tree before taking this series, and  
then update dma_buf_phys_vec to phys_vec locally.

> 
> > +static int uverbs_dmabuf_attach(struct dma_buf *dmabuf,
> > +				struct dma_buf_attachment *attachment)
> > +{
> > +	struct ib_uverbs_dmabuf_file *priv = dmabuf->priv;
> > +
> > +	if (!attachment->peer2peer)
> > +		return -EOPNOTSUPP;
> > +
> > +	if (priv->revoked)
> > +		return -ENODEV;
> 
> This should only be checked in map

I disagree with word "only", the more accurate word is "too". There is
no need to allow new importer attach if this exporter is marked as
revoked.

> 
> This should also eventually call the new revoke testing function Leon
> is adding

We will add it once my series will be accepted.

Thanks

> 
> Jason
