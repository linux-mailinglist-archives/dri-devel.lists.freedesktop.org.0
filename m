Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WI4XNPqmb2lDEgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 17:02:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 303F746FBD
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 17:02:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F27310E59B;
	Tue, 20 Jan 2026 13:34:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JpEG1sP9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF59D10E00C;
 Tue, 20 Jan 2026 13:34:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B6397439A6;
 Tue, 20 Jan 2026 13:34:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC30AC16AAE;
 Tue, 20 Jan 2026 13:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768916043;
 bh=oLJ2iu9KlHT5QrDdejkQxW6aJLgiN+DqMd8h51OdTRU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JpEG1sP9sdoE2iRilDGuE2cq1/H2M6cDuai69Nw+oSU99dcdoZdWBvI1Ukv0pmCi9
 TsEw1r+DamQwCel7MoQtDe43k96uNEN2EIGYyUqy+LKVNlFKvNVQdDnF9gRgkw6+oE
 Iyr3Ih5rCshWR5ndygaol8Ath9Rlm/yA6Sguxq2x2tSUxefkc1flchRkXEHVN8GCfi
 tJskCUcB7JdPmjSewrBWCzbAo1v7780XPg1+FKbkQX6nJPso+uCdLPziwkOu29i/jw
 mD8HoF6GofHxxX6dhDDXQOlk4BrG8fNLd2RXpMxN3Qn9LCRK7nBxumFh6AjnzbEM7k
 ZfnVnW6TNMaYg==
Date: Tue, 20 Jan 2026 15:33:57 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Alex Williamson <alex@shazbot.org>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 virtualization@lists.linux.dev, intel-xe@lists.freedesktop.org,
 linux-rdma@vger.kernel.org, iommu@lists.linux.dev, kvm@vger.kernel.org
Subject: Re: [PATCH v2 3/4] iommufd: Require DMABUF revoke semantics
Message-ID: <20260120133357.GT13201@unreal>
References: <20260118-dmabuf-revoke-v2-0-a03bb27c0875@nvidia.com>
 <20260118-dmabuf-revoke-v2-3-a03bb27c0875@nvidia.com>
 <20260119165951.GI961572@ziepe.ca> <20260119182300.GO13201@unreal>
 <20260119195444.GL961572@ziepe.ca> <20260120131046.GS13201@unreal>
 <20260120131530.GN961572@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260120131530.GN961572@ziepe.ca>
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
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	FREEMAIL_CC(0.00)[linaro.org,amd.com,gmail.com,ffwll.ch,redhat.com,collabora.com,chromium.org,linux.intel.com,kernel.org,suse.de,intel.com,8bytes.org,arm.com,shazbot.org,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leon@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email]
X-Rspamd-Queue-Id: 303F746FBD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026 at 09:15:30AM -0400, Jason Gunthorpe wrote:
> On Tue, Jan 20, 2026 at 03:10:46PM +0200, Leon Romanovsky wrote:
> > On Mon, Jan 19, 2026 at 03:54:44PM -0400, Jason Gunthorpe wrote:
> > > On Mon, Jan 19, 2026 at 08:23:00PM +0200, Leon Romanovsky wrote:
> > > > On Mon, Jan 19, 2026 at 12:59:51PM -0400, Jason Gunthorpe wrote:
> > > > > On Sun, Jan 18, 2026 at 02:08:47PM +0200, Leon Romanovsky wrote:
> > > > > > From: Leon Romanovsky <leonro@nvidia.com>
> > > > > > 
> > > > > > IOMMUFD does not support page fault handling, and after a call to
> > > > > > .invalidate_mappings() all mappings become invalid. Ensure that
> > > > > > the IOMMUFD DMABUF importer is bound to a revoke‑aware DMABUF exporter
> > > > > > (for example, VFIO).
> > > > > > 
> > > > > > Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> > > > > > ---
> > > > > >  drivers/iommu/iommufd/pages.c | 9 ++++++++-
> > > > > >  1 file changed, 8 insertions(+), 1 deletion(-)
> > > > > > 
> > > > > > diff --git a/drivers/iommu/iommufd/pages.c b/drivers/iommu/iommufd/pages.c
> > > > > > index 76f900fa1687..a5eb2bc4ef48 100644
> > > > > > --- a/drivers/iommu/iommufd/pages.c
> > > > > > +++ b/drivers/iommu/iommufd/pages.c
> > > > > > @@ -1501,16 +1501,22 @@ static int iopt_map_dmabuf(struct iommufd_ctx *ictx, struct iopt_pages *pages,
> > > > > >  		mutex_unlock(&pages->mutex);
> > > > > >  	}
> > > > > >  
> > > > > > -	rc = sym_vfio_pci_dma_buf_iommufd_map(attach, &pages->dmabuf.phys);
> > > > > > +	rc = dma_buf_pin(attach);
> > > > > >  	if (rc)
> > > > > >  		goto err_detach;
> > > > > >  
> > > > > > +	rc = sym_vfio_pci_dma_buf_iommufd_map(attach, &pages->dmabuf.phys);
> > > > > > +	if (rc)
> > > > > > +		goto err_unpin;
> > > > > > +
> > > > > >  	dma_resv_unlock(dmabuf->resv);
> > > > > >  
> > > > > >  	/* On success iopt_release_pages() will detach and put the dmabuf. */
> > > > > >  	pages->dmabuf.attach = attach;
> > > > > >  	return 0;
> > > > > 
> > > > > Don't we need an explicit unpin after unmapping?
> > > > 
> > > > Yes, but this patch is going to be dropped in v3 because of this
> > > > suggestion.
> > > > https://lore.kernel.org/all/a397ff1e-615f-4873-98a9-940f9c16f85c@amd.com
> > > 
> > > That's not right, that suggestion is about changing VFIO. iommufd must
> > > still act as a pinning importer!
> > 
> > There is no change in iommufd, as it invokes dma_buf_dynamic_attach()
> > with a valid &iopt_dmabuf_attach_revoke_ops. The check determining whether
> > iommufd can perform a revoke is handled there.
> 
> iommufd is a pining importer. I did not add a call to pin because it
> only worked with VFIO that would not support it. Now that this series
> fixes it the pin must be added. Don't drop this patch.

No problem, let's keep it.

Thanks
