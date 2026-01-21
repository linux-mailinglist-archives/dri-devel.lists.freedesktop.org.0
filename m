Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8IatCBfkcGk+awAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 15:35:03 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABB0587EE
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 15:35:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 013E810E7CA;
	Wed, 21 Jan 2026 14:35:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pw88pD3p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A82210E7CA
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 14:34:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9E3E060131;
 Wed, 21 Jan 2026 14:34:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8C6BC2BC87;
 Wed, 21 Jan 2026 14:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769006097;
 bh=pfdn826aBJq6GoZoRK28hnebrIu93FmJ21pxnWcB+To=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pw88pD3pIj599kubQk/R1YasM00a+HA7s73AGDXN9olP+sN2rJvb44/7XUUsHpVOI
 jBdGCrlXiD5XbFGpGQJ9KnQsOyhuUkRnsZazZ3b9tC1DI2cpXlR+PirNlL61SLfckO
 9vhRYU0k0jaUvjJUh07Um8hcEtIyEkMzaw5JazY3np8Vm0jw94T7eDAzENQFbiAuVm
 76Oi993Luf/31zPP8cQNOOvDvWKG9bPD5+ZOlKaDpeVT5SSz3F6mSRGlbkPqVUL37v
 +J/ciUqL/3vrW5C4adcoqbLgfvlY31YBOeYjsQr0qZ9T+LUt2mMkohMQ1SnvbYI1/R
 nkL+DxxUJyfGQ==
Date: Wed, 21 Jan 2026 16:34:53 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Alex Williamson <alex@shazbot.org>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev, kvm@vger.kernel.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Yishai Hadas <yishaih@nvidia.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>,
 Ankit Agrawal <ankita@nvidia.com>,
 Matthew Wilcox <willy@infradead.org>, Jens Axboe <axboe@kernel.dk>
Subject: Re: types: reuse common =?utf-8?Q?phys=5Fv?=
 =?utf-8?Q?ec_type_instead_of_DMABUF_open=E2=80=91coded?= variant
Message-ID: <20260121143453.GE13201@unreal>
References: <20260107-convert-to-pvec-v1-1-6e3ab8079708@nvidia.com>
 <20260119133838.66203b01@shazbot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260119133838.66203b01@shazbot.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[leon@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alex@shazbot.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:kvm@vger.kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:jgg@ziepe.ca,m:kevin.tian@intel.com,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:yishaih@nvidia.com,m:skolothumtho@nvidia.com,m:ankita@nvidia.com,m:willy@infradead.org,m:axboe@kernel.dk,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[leon@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 7ABB0587EE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Jan 19, 2026 at 01:38:38PM -0700, Alex Williamson wrote:
> On Wed,  7 Jan 2026 11:14:14 +0200
> Leon Romanovsky <leon@kernel.org> wrote:
> 
> > From: Leon Romanovsky <leonro@nvidia.com>
> > 
> > After commit fcf463b92a08 ("types: move phys_vec definition to common header"),
> > we can use the shared phys_vec type instead of the DMABUF‑specific
> > dma_buf_phys_vec, which duplicated the same structure and semantics.
> > 
> > Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> > ---
> > Alex,
> > 
> > According to diffstat, VFIO is the subsystem with the largest set of changes,
> > so it would be great if you could take it through your tree.
> > 
> > The series is based on the for-7.0/blk-pvec shared branch from Jens:
> > https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git/log/?h=for-7.0/blk-pvec
> 
> Applied to vfio next branch for v6.20/7.0 and pushed tag
> common_phys_vec_via_vfio including this commit and dependency.

Thanks. I will pull it right before the RDMA dma-buf exporter patches are
ready to be merged.

Thanks again.

> Thanks,
> 
> Alex
> 
> 
> > ---
> > Cc: linux-media@vger.kernel.org
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: linaro-mm-sig@lists.linaro.org
> > Cc: linux-kernel@vger.kernel.org
> > Cc: iommu@lists.linux.dev
> > Cc: kvm@vger.kernel.org
> > To: Sumit Semwal <sumit.semwal@linaro.org>
> > To: Christian König <christian.koenig@amd.com>
> > To: Jason Gunthorpe <jgg@ziepe.ca>
> > To: Kevin Tian <kevin.tian@intel.com>
> > To: Joerg Roedel <joro@8bytes.org>
> > To: Will Deacon <will@kernel.org>
> > To: Robin Murphy <robin.murphy@arm.com>
> > To: Yishai Hadas <yishaih@nvidia.com>
> > To: Shameer Kolothum <skolothumtho@nvidia.com>
> > To: Ankit Agrawal <ankita@nvidia.com>
> > To: Alex Williamson <alex@shazbot.org>
> > Cc: Matthew Wilcox <willy@infradead.org>
> > Cc: Jens Axboe <axboe@kernel.dk>
> > ---
> >  drivers/dma-buf/dma-buf-mapping.c       |  6 +++---
> >  drivers/iommu/iommufd/io_pagetable.h    |  2 +-
> >  drivers/iommu/iommufd/iommufd_private.h |  5 ++---
> >  drivers/iommu/iommufd/pages.c           |  4 ++--
> >  drivers/iommu/iommufd/selftest.c        |  2 +-
> >  drivers/vfio/pci/nvgrace-gpu/main.c     |  2 +-
> >  drivers/vfio/pci/vfio_pci_dmabuf.c      |  8 ++++----
> >  include/linux/dma-buf-mapping.h         |  2 +-
> >  include/linux/dma-buf.h                 | 10 ----------
> >  include/linux/vfio_pci_core.h           | 13 ++++++-------
> >  10 files changed, 21 insertions(+), 33 deletions(-)
> > 
> > diff --git a/drivers/dma-buf/dma-buf-mapping.c b/drivers/dma-buf/dma-buf-mapping.c
> > index b7352e609fbd..174677faa577 100644
> > --- a/drivers/dma-buf/dma-buf-mapping.c
> > +++ b/drivers/dma-buf/dma-buf-mapping.c
> > @@ -33,8 +33,8 @@ static struct scatterlist *fill_sg_entry(struct scatterlist *sgl, size_t length,
> >  }
> >  
> >  static unsigned int calc_sg_nents(struct dma_iova_state *state,
> > -				  struct dma_buf_phys_vec *phys_vec,
> > -				  size_t nr_ranges, size_t size)
> > +				  struct phys_vec *phys_vec, size_t nr_ranges,
> > +				  size_t size)
> >  {
> >  	unsigned int nents = 0;
> >  	size_t i;
> > @@ -91,7 +91,7 @@ struct dma_buf_dma {
> >   */
> >  struct sg_table *dma_buf_phys_vec_to_sgt(struct dma_buf_attachment *attach,
> >  					 struct p2pdma_provider *provider,
> > -					 struct dma_buf_phys_vec *phys_vec,
> > +					 struct phys_vec *phys_vec,
> >  					 size_t nr_ranges, size_t size,
> >  					 enum dma_data_direction dir)
> >  {
> > diff --git a/drivers/iommu/iommufd/io_pagetable.h b/drivers/iommu/iommufd/io_pagetable.h
> > index 14cd052fd320..27e3e311d395 100644
> > --- a/drivers/iommu/iommufd/io_pagetable.h
> > +++ b/drivers/iommu/iommufd/io_pagetable.h
> > @@ -202,7 +202,7 @@ struct iopt_pages_dmabuf_track {
> >  
> >  struct iopt_pages_dmabuf {
> >  	struct dma_buf_attachment *attach;
> > -	struct dma_buf_phys_vec phys;
> > +	struct phys_vec phys;
> >  	/* Always PAGE_SIZE aligned */
> >  	unsigned long start;
> >  	struct list_head tracker;
> > diff --git a/drivers/iommu/iommufd/iommufd_private.h b/drivers/iommu/iommufd/iommufd_private.h
> > index eb6d1a70f673..6ac1965199e9 100644
> > --- a/drivers/iommu/iommufd/iommufd_private.h
> > +++ b/drivers/iommu/iommufd/iommufd_private.h
> > @@ -20,7 +20,6 @@ struct iommu_group;
> >  struct iommu_option;
> >  struct iommufd_device;
> >  struct dma_buf_attachment;
> > -struct dma_buf_phys_vec;
> >  
> >  struct iommufd_sw_msi_map {
> >  	struct list_head sw_msi_item;
> > @@ -718,7 +717,7 @@ int __init iommufd_test_init(void);
> >  void iommufd_test_exit(void);
> >  bool iommufd_selftest_is_mock_dev(struct device *dev);
> >  int iommufd_test_dma_buf_iommufd_map(struct dma_buf_attachment *attachment,
> > -				     struct dma_buf_phys_vec *phys);
> > +				     struct phys_vec *phys);
> >  #else
> >  static inline void iommufd_test_syz_conv_iova_id(struct iommufd_ucmd *ucmd,
> >  						 unsigned int ioas_id,
> > @@ -742,7 +741,7 @@ static inline bool iommufd_selftest_is_mock_dev(struct device *dev)
> >  }
> >  static inline int
> >  iommufd_test_dma_buf_iommufd_map(struct dma_buf_attachment *attachment,
> > -				 struct dma_buf_phys_vec *phys)
> > +				 struct phys_vec *phys)
> >  {
> >  	return -EOPNOTSUPP;
> >  }
> > diff --git a/drivers/iommu/iommufd/pages.c b/drivers/iommu/iommufd/pages.c
> > index dbe51ecb9a20..bababd564cf9 100644
> > --- a/drivers/iommu/iommufd/pages.c
> > +++ b/drivers/iommu/iommufd/pages.c
> > @@ -1077,7 +1077,7 @@ static int pfn_reader_user_update_pinned(struct pfn_reader_user *user,
> >  }
> >  
> >  struct pfn_reader_dmabuf {
> > -	struct dma_buf_phys_vec phys;
> > +	struct phys_vec phys;
> >  	unsigned long start_offset;
> >  };
> >  
> > @@ -1460,7 +1460,7 @@ static struct dma_buf_attach_ops iopt_dmabuf_attach_revoke_ops = {
> >   */
> >  static int
> >  sym_vfio_pci_dma_buf_iommufd_map(struct dma_buf_attachment *attachment,
> > -				 struct dma_buf_phys_vec *phys)
> > +				 struct phys_vec *phys)
> >  {
> >  	typeof(&vfio_pci_dma_buf_iommufd_map) fn;
> >  	int rc;
> > diff --git a/drivers/iommu/iommufd/selftest.c b/drivers/iommu/iommufd/selftest.c
> > index 550ff36dec3a..989d8c4c60a7 100644
> > --- a/drivers/iommu/iommufd/selftest.c
> > +++ b/drivers/iommu/iommufd/selftest.c
> > @@ -2002,7 +2002,7 @@ static const struct dma_buf_ops iommufd_test_dmabuf_ops = {
> >  };
> >  
> >  int iommufd_test_dma_buf_iommufd_map(struct dma_buf_attachment *attachment,
> > -				     struct dma_buf_phys_vec *phys)
> > +				     struct phys_vec *phys)
> >  {
> >  	struct iommufd_test_dma_buf *priv = attachment->dmabuf->priv;
> >  
> > diff --git a/drivers/vfio/pci/nvgrace-gpu/main.c b/drivers/vfio/pci/nvgrace-gpu/main.c
> > index 84d142a47ec6..a0f4edd6a30b 100644
> > --- a/drivers/vfio/pci/nvgrace-gpu/main.c
> > +++ b/drivers/vfio/pci/nvgrace-gpu/main.c
> > @@ -784,7 +784,7 @@ nvgrace_gpu_write(struct vfio_device *core_vdev,
> >  static int nvgrace_get_dmabuf_phys(struct vfio_pci_core_device *core_vdev,
> >  				   struct p2pdma_provider **provider,
> >  				   unsigned int region_index,
> > -				   struct dma_buf_phys_vec *phys_vec,
> > +				   struct phys_vec *phys_vec,
> >  				   struct vfio_region_dma_range *dma_ranges,
> >  				   size_t nr_ranges)
> >  {
> > diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
> > index d4d0f7d08c53..9a84c238c013 100644
> > --- a/drivers/vfio/pci/vfio_pci_dmabuf.c
> > +++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
> > @@ -14,7 +14,7 @@ struct vfio_pci_dma_buf {
> >  	struct vfio_pci_core_device *vdev;
> >  	struct list_head dmabufs_elm;
> >  	size_t size;
> > -	struct dma_buf_phys_vec *phys_vec;
> > +	struct phys_vec *phys_vec;
> >  	struct p2pdma_provider *provider;
> >  	u32 nr_ranges;
> >  	u8 revoked : 1;
> > @@ -94,7 +94,7 @@ static const struct dma_buf_ops vfio_pci_dmabuf_ops = {
> >   *    will fail if it is currently revoked
> >   */
> >  int vfio_pci_dma_buf_iommufd_map(struct dma_buf_attachment *attachment,
> > -				 struct dma_buf_phys_vec *phys)
> > +				 struct phys_vec *phys)
> >  {
> >  	struct vfio_pci_dma_buf *priv;
> >  
> > @@ -116,7 +116,7 @@ int vfio_pci_dma_buf_iommufd_map(struct dma_buf_attachment *attachment,
> >  }
> >  EXPORT_SYMBOL_FOR_MODULES(vfio_pci_dma_buf_iommufd_map, "iommufd");
> >  
> > -int vfio_pci_core_fill_phys_vec(struct dma_buf_phys_vec *phys_vec,
> > +int vfio_pci_core_fill_phys_vec(struct phys_vec *phys_vec,
> >  				struct vfio_region_dma_range *dma_ranges,
> >  				size_t nr_ranges, phys_addr_t start,
> >  				phys_addr_t len)
> > @@ -148,7 +148,7 @@ EXPORT_SYMBOL_GPL(vfio_pci_core_fill_phys_vec);
> >  int vfio_pci_core_get_dmabuf_phys(struct vfio_pci_core_device *vdev,
> >  				  struct p2pdma_provider **provider,
> >  				  unsigned int region_index,
> > -				  struct dma_buf_phys_vec *phys_vec,
> > +				  struct phys_vec *phys_vec,
> >  				  struct vfio_region_dma_range *dma_ranges,
> >  				  size_t nr_ranges)
> >  {
> > diff --git a/include/linux/dma-buf-mapping.h b/include/linux/dma-buf-mapping.h
> > index a3c0ce2d3a42..09bde3f748e4 100644
> > --- a/include/linux/dma-buf-mapping.h
> > +++ b/include/linux/dma-buf-mapping.h
> > @@ -9,7 +9,7 @@
> >  
> >  struct sg_table *dma_buf_phys_vec_to_sgt(struct dma_buf_attachment *attach,
> >  					 struct p2pdma_provider *provider,
> > -					 struct dma_buf_phys_vec *phys_vec,
> > +					 struct phys_vec *phys_vec,
> >  					 size_t nr_ranges, size_t size,
> >  					 enum dma_data_direction dir);
> >  void dma_buf_free_sgt(struct dma_buf_attachment *attach, struct sg_table *sgt,
> > diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> > index 0bc492090237..400a5311368e 100644
> > --- a/include/linux/dma-buf.h
> > +++ b/include/linux/dma-buf.h
> > @@ -531,16 +531,6 @@ struct dma_buf_export_info {
> >  	void *priv;
> >  };
> >  
> > -/**
> > - * struct dma_buf_phys_vec - describe continuous chunk of memory
> > - * @paddr:   physical address of that chunk
> > - * @len:     Length of this chunk
> > - */
> > -struct dma_buf_phys_vec {
> > -	phys_addr_t paddr;
> > -	size_t len;
> > -};
> > -
> >  /**
> >   * DEFINE_DMA_BUF_EXPORT_INFO - helper macro for exporters
> >   * @name: export-info name
> > diff --git a/include/linux/vfio_pci_core.h b/include/linux/vfio_pci_core.h
> > index 706877f998ff..2ac288bb2c60 100644
> > --- a/include/linux/vfio_pci_core.h
> > +++ b/include/linux/vfio_pci_core.h
> > @@ -28,7 +28,6 @@
> >  struct vfio_pci_core_device;
> >  struct vfio_pci_region;
> >  struct p2pdma_provider;
> > -struct dma_buf_phys_vec;
> >  struct dma_buf_attachment;
> >  
> >  struct vfio_pci_eventfd {
> > @@ -62,25 +61,25 @@ struct vfio_pci_device_ops {
> >  	int (*get_dmabuf_phys)(struct vfio_pci_core_device *vdev,
> >  			       struct p2pdma_provider **provider,
> >  			       unsigned int region_index,
> > -			       struct dma_buf_phys_vec *phys_vec,
> > +			       struct phys_vec *phys_vec,
> >  			       struct vfio_region_dma_range *dma_ranges,
> >  			       size_t nr_ranges);
> >  };
> >  
> >  #if IS_ENABLED(CONFIG_VFIO_PCI_DMABUF)
> > -int vfio_pci_core_fill_phys_vec(struct dma_buf_phys_vec *phys_vec,
> > +int vfio_pci_core_fill_phys_vec(struct phys_vec *phys_vec,
> >  				struct vfio_region_dma_range *dma_ranges,
> >  				size_t nr_ranges, phys_addr_t start,
> >  				phys_addr_t len);
> >  int vfio_pci_core_get_dmabuf_phys(struct vfio_pci_core_device *vdev,
> >  				  struct p2pdma_provider **provider,
> >  				  unsigned int region_index,
> > -				  struct dma_buf_phys_vec *phys_vec,
> > +				  struct phys_vec *phys_vec,
> >  				  struct vfio_region_dma_range *dma_ranges,
> >  				  size_t nr_ranges);
> >  #else
> >  static inline int
> > -vfio_pci_core_fill_phys_vec(struct dma_buf_phys_vec *phys_vec,
> > +vfio_pci_core_fill_phys_vec(struct phys_vec *phys_vec,
> >  			    struct vfio_region_dma_range *dma_ranges,
> >  			    size_t nr_ranges, phys_addr_t start,
> >  			    phys_addr_t len)
> > @@ -89,7 +88,7 @@ vfio_pci_core_fill_phys_vec(struct dma_buf_phys_vec *phys_vec,
> >  }
> >  static inline int vfio_pci_core_get_dmabuf_phys(
> >  	struct vfio_pci_core_device *vdev, struct p2pdma_provider **provider,
> > -	unsigned int region_index, struct dma_buf_phys_vec *phys_vec,
> > +	unsigned int region_index, struct phys_vec *phys_vec,
> >  	struct vfio_region_dma_range *dma_ranges, size_t nr_ranges)
> >  {
> >  	return -EOPNOTSUPP;
> > @@ -228,6 +227,6 @@ static inline bool is_aligned_for_order(struct vm_area_struct *vma,
> >  }
> >  
> >  int vfio_pci_dma_buf_iommufd_map(struct dma_buf_attachment *attachment,
> > -				 struct dma_buf_phys_vec *phys);
> > +				 struct phys_vec *phys);
> >  
> >  #endif /* VFIO_PCI_CORE_H */
> > 
> > ---
> > base-commit: fcf463b92a08686d1aeb1e66674a72eb7a8bfb9b
> > change-id: 20260107-convert-to-pvec-bf04dfcf3d12
> > 
> > Best regards,
> > --  
> > Leon Romanovsky <leonro@nvidia.com>
> > 
> > 
> 
