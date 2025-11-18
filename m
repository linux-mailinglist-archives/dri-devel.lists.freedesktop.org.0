Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61484C69F57
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 15:28:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 305B110E08D;
	Tue, 18 Nov 2025 14:28:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="WceXBbzB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97F9810E08D
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 14:28:52 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id
 6a1803df08f44-882360ca0e2so41303926d6.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 06:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1763476131; x=1764080931; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=35WpspOv1fAWFINmOzi0AcgEQL1oV2/QEYSJcrH4aSg=;
 b=WceXBbzB+NX8IULX7JZi4LiXzVHARjVRXEhAyh0AsPebS+S8ebkSoHM+z4O8oIFLt7
 uEH+mhKY9CUZe41bDLrHZZKpTNnRDeJx9PwdoAb5+aF+7gfPZyKR1idfo5H/P570BhRa
 WmM3llVe2mfzSG1tMSyt0VP554r6fm+HaEYtFwNLpe4+vlGea3Rm5xCX2S+gT7YdsDk4
 czyc/pETjpyalR+BFe1m0cpV1G4cnTnRAiR9BZ+ahKZSMN2muhHV6hX1Y+NY2Pl3fNNN
 PmPysDXQojNeZNaIoMUFaMwJYBxliI/4RmkuzK73QVYLLL6C9mwPqMe7vsclmfG+siYk
 c0xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763476131; x=1764080931;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=35WpspOv1fAWFINmOzi0AcgEQL1oV2/QEYSJcrH4aSg=;
 b=Es/W1zRBAZtcsWBNT/5ppBoRULGMXs0Y7CydH5Ro52TxKeEa30avFqUdEMSnUj164w
 K13IKKLLsICgAlwRhhO8G9kQsOfmscHsT2UWQT4AABT6zG5p08rvVs0a2uw8o/F6GlCb
 oWISZ2jdaEN9WM4zE/qZKNa22hFUBp+8nAPd12SAXuhlj3w4qdqR158e5VsKzTe/J+IA
 zfZlIEwnCKH4adUN4XpMrNrM/lZvm7terwjy70p749u60FbyOX4qenoW6dP+Opwndqls
 WIK/wuzlbjgFISw0KjBbRH+Kc7uvq8JL9Vuw5CAWs9MKY2KA+DgT/zMp6dBBp5Wvd9L8
 F4LA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwnpzX0SDZqgZHJMrXTnX1H7uIq5k1lpS7srkhLYSacEpRW5NA+Hf/iOayvIZqsvT8Jyy3IqoLWv4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzWGQjKto0kPrwX5mz7oWTAIgwFG+oyfWPWNv3ByxW4pSNgYxWz
 XJ/kRqe8uk2DbqmdEA0aaDCed0VE/YhmFi+HU4duJZ5CGd3QpL5cpRSTgQm+9JCPad4=
X-Gm-Gg: ASbGncvRWiTN1PzOYZiv00DAVOuhWtLp+xjB1t4y7wTz6hpd+kV5/UnjILrnld/O5Jg
 qYSyay/Ag5uxFDdwvCSfT6bnSMcmvsqu+XuL4+UsWp3HT06VsmPCbZmQ0i0ikEGsdLMeCzLqbG6
 eNgi+l1/FOEmxGRATACVZMnW7acVvyJBlgtw7xKj2B5XggjsK6c/kJRrBNkqXSno8jrN1UVGkgC
 ReGH55f8z/RwbwSb0JSgeMStAvyLL1Byfjnn8EpGouENuAKvbRcaPgLrK6+XKhZjbR51StfyNCr
 kSMvHrsm2bJNhSpdH2gSzjqOGlSV1UN5NPstHglIqf/Esg8g79tXB3fSKqVqT/l65uCf0iTK4zT
 IhZgdA3KwbCzNTd41gTTOIcLVtvmKJt82pGa2VRl+eivPmTU8dP3tiAItr/GtDZEiEgurYNqbIv
 aOuHlEXipkfBMiBMLM7Svn6O5PVmn7v/yZlTPiTEWoiv1MB4R2LUfNQcxzAzxRzFfqrKo=
X-Google-Smtp-Source: AGHT+IF+NrfSbYwvwiNh+CC3YngHFJHpwzxC37jBlKkv0sHaTL3i1cld4gWS47y25QRA75BxBaWSvQ==
X-Received: by 2002:a05:6214:62a:b0:81b:bf92:8df9 with SMTP id
 6a1803df08f44-8829269e086mr234228876d6.43.1763476131063; 
 Tue, 18 Nov 2025 06:28:51 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.120.4]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8828652efa4sm114860276d6.39.2025.11.18.06.28.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 06:28:50 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1vLMhN-00000000NEc-3Dxs;
 Tue, 18 Nov 2025 10:28:49 -0400
Date: Tue, 18 Nov 2025 10:28:49 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: Leon Romanovsky <leon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Logan Gunthorpe <logang@deltatee.com>, Jens Axboe <axboe@kernel.dk>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Ankit Agrawal <ankita@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>,
 Alex Williamson <alex@shazbot.org>,
 Krishnakant Jaju <kjaju@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>,
 "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Subject: Re: [PATCH v8 10/11] vfio/pci: Add dma-buf export support for MMIO
 regions
Message-ID: <20251118142849.GG17968@ziepe.ca>
References: <20251111-dmabuf-vfio-v8-0-fd9aa5df478f@nvidia.com>
 <20251111-dmabuf-vfio-v8-10-fd9aa5df478f@nvidia.com>
 <BN9PR11MB527610F3240E677BE9720C2B8CD6A@BN9PR11MB5276.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN9PR11MB527610F3240E677BE9720C2B8CD6A@BN9PR11MB5276.namprd11.prod.outlook.com>
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

On Tue, Nov 18, 2025 at 07:33:23AM +0000, Tian, Kevin wrote:
> > From: Leon Romanovsky <leon@kernel.org>
> > Sent: Tuesday, November 11, 2025 5:58 PM
> > 
> > -		if (!new_mem)
> > +		if (!new_mem) {
> >  			vfio_pci_zap_and_down_write_memory_lock(vdev);
> > -		else
> > +			vfio_pci_dma_buf_move(vdev, true);
> > +		} else {
> >  			down_write(&vdev->memory_lock);
> > +		}
> 
> shouldn't we notify move before zapping the bars? otherwise there is
> still a small window in between where the exporter already has the
> mapping cleared while the importer still keeps it...

zapping the VMA and moving/revoking the DMABUF are independent
operations that can happen in any order. They effect different kinds
of users. The VMA zap prevents CPU access from userspace, the DMABUF
move prevents DMA access from devices.

The order has to be like the above because vfio_pci_dma_buf_move()
must be called under the memory lock and
vfio_pci_zap_and_down_write_memory_lock() gets the memory lock..

> > +static void vfio_pci_dma_buf_release(struct dma_buf *dmabuf)
> > +{
> > +	struct vfio_pci_dma_buf *priv = dmabuf->priv;
> > +
> > +	/*
> > +	 * Either this or vfio_pci_dma_buf_cleanup() will remove from the list.
> > +	 * The refcount prevents both.
> 
> which refcount? I thought it's vdev->memory_lock preventing the race...

Refcount on the dmabuf

> > +int vfio_pci_core_fill_phys_vec(struct dma_buf_phys_vec *phys_vec,
> > +				struct vfio_region_dma_range *dma_ranges,
> > +				size_t nr_ranges, phys_addr_t start,
> > +				phys_addr_t len)
> > +{
> > +	phys_addr_t max_addr;
> > +	unsigned int i;
> > +
> > +	max_addr = start + len;
> > +	for (i = 0; i < nr_ranges; i++) {
> > +		phys_addr_t end;
> > +
> > +		if (!dma_ranges[i].length)
> > +			return -EINVAL;
> 
> Looks redundant as there is already a check in validate_dmabuf_input().

Agree

> > +int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32
> > flags,
> > +				  struct vfio_device_feature_dma_buf __user
> > *arg,
> > +				  size_t argsz)
> > +{
> > +	struct vfio_device_feature_dma_buf get_dma_buf = {};
> > +	struct vfio_region_dma_range *dma_ranges;
> > +	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
> > +	struct vfio_pci_dma_buf *priv;
> > +	size_t length;
> > +	int ret;
> > +
> > +	if (!vdev->pci_ops || !vdev->pci_ops->get_dmabuf_phys)
> > +		return -EOPNOTSUPP;
> > +
> > +	ret = vfio_check_feature(flags, argsz, VFIO_DEVICE_FEATURE_GET,
> > +				 sizeof(get_dma_buf));
> > +	if (ret != 1)
> > +		return ret;
> > +
> > +	if (copy_from_user(&get_dma_buf, arg, sizeof(get_dma_buf)))
> > +		return -EFAULT;
> > +
> > +	if (!get_dma_buf.nr_ranges || get_dma_buf.flags)
> > +		return -EINVAL;
> 
> unknown flag bits get -EOPNOTSUPP.

Agree

> > +
> > +void vfio_pci_dma_buf_cleanup(struct vfio_pci_core_device *vdev)
> > +{
> > +	struct vfio_pci_dma_buf *priv;
> > +	struct vfio_pci_dma_buf *tmp;
> > +
> > +	down_write(&vdev->memory_lock);
> > +	list_for_each_entry_safe(priv, tmp, &vdev->dmabufs, dmabufs_elm)
> > {
> > +		if (!get_file_active(&priv->dmabuf->file))
> > +			continue;
> > +
> > +		dma_resv_lock(priv->dmabuf->resv, NULL);
> > +		list_del_init(&priv->dmabufs_elm);
> > +		priv->vdev = NULL;
> > +		priv->revoked = true;
> > +		dma_buf_move_notify(priv->dmabuf);
> > +		dma_resv_unlock(priv->dmabuf->resv);
> > +		vfio_device_put_registration(&vdev->vdev);
> > +		fput(priv->dmabuf->file);
> 
> dma_buf_put(priv->dmabuf), consistent with other places.

Someone else said this, I don't agree, the above got the get via

get_file_active() instead of a dma_buf version..

So we should pair with get_file_active() vs fput().

Christian rejected the idea of adding a dmabuf wrapper for
get_file_active(), oh well.

> > +struct vfio_device_feature_dma_buf {
> > +	__u32	region_index;
> > +	__u32	open_flags;
> > +	__u32   flags;
> 
> Usually the 'flags' field is put in the start (following argsz if existing).

Yeah, but doesn't really matter.

Thanks,
Jason
