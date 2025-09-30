Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECFFBAC280
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 11:00:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A1B610E296;
	Tue, 30 Sep 2025 09:00:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="B0lc8Tee";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9693F10E296
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 09:00:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3AA7443327;
 Tue, 30 Sep 2025 09:00:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86F3BC4CEF0;
 Tue, 30 Sep 2025 09:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759222853;
 bh=Bz59FJNr6hSVIp1bIOKqTXqbYBhR+8gIiV4mOYWby0Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=B0lc8TeeFVkyKURqnlVC8tfbwXSnH5yhCiwnKUCAVw0XfnT/duR62IEit4doNOgit
 w0LQw67ADMu98aes/9UNSiFxePK8v71jREbYBwtX/hzTPbV9ZNh+ClsZ59o+JePTg3
 7DlSSNkO0ONIVmZkOrw6MQIgp6fEnwHYHtWOw8MrkSOFnIHrN5Kx6VbBkf0YlGbfZl
 MZQKCXYSs/sX24JFCduenUzxV3P1gFAK9MVDaD5Pry90wsMm4HClRFRF0dd4+CpJU+
 CF4BMSEI+7doVyxI4NIwXinKl4wjhKMt6rRd8SGJfdPJXpDQlmUgZ8z+R4E8IeipQt
 +xlwP9a2p+IWQ==
Date: Tue, 30 Sep 2025 12:00:48 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux.dev,
 Jens Axboe <axboe@kernel.dk>, Joerg Roedel <joro@8bytes.org>,
 kvm@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mm@kvack.org,
 linux-pci@vger.kernel.org, Logan Gunthorpe <logang@deltatee.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v4 10/10] vfio/pci: Add dma-buf export support for MMIO
 regions
Message-ID: <20250930090048.GG324804@unreal>
References: <cover.1759070796.git.leon@kernel.org>
 <53f3ea1947919a5e657b4f83e74ca53aa45814d4.1759070796.git.leon@kernel.org>
 <20250929151749.2007b192.alex.williamson@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250929151749.2007b192.alex.williamson@redhat.com>
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

On Mon, Sep 29, 2025 at 03:17:49PM -0600, Alex Williamson wrote:
> On Sun, 28 Sep 2025 17:50:20 +0300
> Leon Romanovsky <leon@kernel.org> wrote:
> > +static int validate_dmabuf_input(struct vfio_pci_core_device *vdev,
> > +				 struct vfio_device_feature_dma_buf *dma_buf,
> > +				 struct vfio_region_dma_range *dma_ranges,
> > +				 struct p2pdma_provider **provider)
> > +{
> > +	struct pci_dev *pdev = vdev->pdev;
> > +	u32 bar = dma_buf->region_index;
> > +	resource_size_t bar_size;
> > +	u64 sum;
> > +	int i;
> > +
> > +	if (dma_buf->flags)
> > +		return -EINVAL;
> > +	/*
> > +	 * For PCI the region_index is the BAR number like  everything else.
> > +	 */
> > +	if (bar >= VFIO_PCI_ROM_REGION_INDEX)
> > +		return -ENODEV;
> > +
> > +	*provider = pcim_p2pdma_provider(pdev, bar);
> > +	if (!provider)
> 
> This needs to be IS_ERR_OR_NULL() or the function needs to settle on a
> consistent error return value regardless of CONFIG_PCI_P2PDMA.

pcim_p2pdma_provider() doesn't return errors after split to _init() and _get().
The more accurate check needs to be if (!*provider) and not what is written.

> 
> > +		return -EINVAL;
> > +
> > +	bar_size = pci_resource_len(pdev, bar);
> 
> We get to this feature via vfio_pci_core_ioctl_feature(), which is used
> by several variant drivers, some of which mangle the BAR size exposed
> to the user, ex. hisi_acc.  I'm afraid this might actually be giving
> dmabuf access to a portion of the BAR that isn't exposed otherwise.

Doe you mean that part?

  1185 static int hisi_acc_vf_qm_init(struct hisi_acc_vf_core_device *hisi_acc_vdev)
  1186 {
...
  1204          * Also the HiSilicon ACC VF devices supported by this driver on
  1205          * HiSilicon hardware platforms are integrated end point devices
  1206          * and the platform lacks the capability to perform any PCIe P2P
  1207          * between these devices.
  1208          */
  1209
  1210         vf_qm->io_base =
  1211                 ioremap(pci_resource_start(vf_dev, VFIO_PCI_BAR2_REGION_INDEX),
  1212                         pci_resource_len(vf_dev, VFIO_PCI_BAR2_REGION_INDEX));
  1213         if (!vf_qm->io_base)
  1214                 return -EIO;
  1215

According to the comment, it doesn't support p2p and in any case we will
fail that platform in vfio_pci_dma_buf_attach() by taking "default" case:

   34         switch (pci_p2pdma_map_type(priv->provider, attachment->dev)) {
   35         case PCI_P2PDMA_MAP_THRU_HOST_BRIDGE:
   36                 break;
   37         case PCI_P2PDMA_MAP_BUS_ADDR:
   38                 /*
   39                  * There is no need in IOVA at all for this flow.
   40                  * We rely on attachment->priv == NULL as a marker
   41                  * for this mode.
   42                  */
   43                 return 0;
   44         default:
   45                 return -EINVAL;
   46         }
   47

> 
> > +	for (i = 0; i < dma_buf->nr_ranges; i++) {
> > +		u64 offset = dma_ranges[i].offset;
> > +		u64 len = dma_ranges[i].length;
> > +
> > +		if (!PAGE_ALIGNED(offset) || !PAGE_ALIGNED(len))
> > +			return -EINVAL;
> > +
> > +		if (check_add_overflow(offset, len, &sum) || sum > bar_size)
> > +			return -EINVAL;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
> > +				  struct vfio_device_feature_dma_buf __user *arg,
> > +				  size_t argsz)
> > +{
> > +	struct vfio_device_feature_dma_buf get_dma_buf = {};
> > +	struct vfio_region_dma_range *dma_ranges;
> > +	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
> > +	struct p2pdma_provider *provider;
> > +	struct vfio_pci_dma_buf *priv;
> > +	int ret;
> > +
> > +	ret = vfio_check_feature(flags, argsz, VFIO_DEVICE_FEATURE_GET,
> > +				 sizeof(get_dma_buf));
> > +	if (ret != 1)
> > +		return ret;
> > +
> > +	if (copy_from_user(&get_dma_buf, arg, sizeof(get_dma_buf)))
> > +		return -EFAULT;
> > +
> > +	if (!get_dma_buf.nr_ranges)
> > +		return -EINVAL;
> > +
> > +	dma_ranges = memdup_array_user(&arg->dma_ranges, get_dma_buf.nr_ranges,
> > +				       sizeof(*dma_ranges));
> > +	if (IS_ERR(dma_ranges))
> > +		return PTR_ERR(dma_ranges);
> > +
> > +	ret = validate_dmabuf_input(vdev, &get_dma_buf, dma_ranges, &provider);
> > +	if (ret)
> > +		return ret;
> 
> goto err_free_ranges;

Thanks

> 
> Thanks,
> Alex
> 
> 
