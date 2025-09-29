Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDC3BAAA29
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 23:18:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3093210E4AD;
	Mon, 29 Sep 2025 21:18:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="AoVB7n49";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE56710E4AD
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 21:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759180674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tBEzt7vDi7cQon8pe4PxgzLkANUC3bHfRN0ntBJldU8=;
 b=AoVB7n49DgHSo37MjaQllW4eGuNjjEw5pl3xaRFAwSHzydcdRsI6sMss4RD3X8SS9MbZgr
 XZjqXGZhRDPmC5on4UlhesH1Z1cmoVeZeeGJ4si/ZvLfQ+Or70e550TUXxBebcIQnGCqyI
 KZHynBGNJ8c9VOBpXNpr1FY54WZH/XA=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-573-XGZzpCJvPn2WBgdgKHpcQA-1; Mon, 29 Sep 2025 17:17:53 -0400
X-MC-Unique: XGZzpCJvPn2WBgdgKHpcQA-1
X-Mimecast-MFC-AGG-ID: XGZzpCJvPn2WBgdgKHpcQA_1759180673
Received: by mail-il1-f200.google.com with SMTP id
 e9e14a558f8ab-4272d0bebf0so9061255ab.0
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 14:17:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759180673; x=1759785473;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tBEzt7vDi7cQon8pe4PxgzLkANUC3bHfRN0ntBJldU8=;
 b=SqRjiXPY3khzDrpolBCsHnX9GxhV7e0VUaheTJuYT2zakIEbjM/7QsXzuIPNDb1SHg
 VCWpHvl2G3mtDZ9KmxpBbssZ/XKkyjVMazz6a+Na4/NNtxXpLcwHk2ohiKVIGxErrX67
 6jHu1TrBg+DEeLoUZHLF+YCYdCtr7uZcN0LQAqcSRpZIMwx9f/RHDWXc+QFudGQ9I8Tr
 SwTE4cc8QtSR1qTllQu0p7juEnXOj7oHWo959ibhif9bBhDnaTXmw0bZFtgbs1JznHFh
 c++62qgbz3u8McwJSW6gC9Ld09dReEgt6/vqzpk2RHGGltLJEOLAb6HkeInAlTGrxXcW
 4MqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWeRrFGDyoxQX+wgb/wtO6OFxmzZMFeijiOULV4/uWIDVIzmNkyvQbOsb1rx4SScK7j4GkJxbnI0Xo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxlXYW+gHO/BybFmzV8uBL4KNFPa11ih19oNvTIGt/qP1GWMFyu
 w2OqKqbH21ZAecO49JxliEHPveQCuMUSYegBKVstNYce5Vpb1Nad+xHqtVGNZBnIIX1GzmTKugq
 8uR1vjMfXv2fCuIssTKDS0J7tZsyiA40rcEJp/HNGs+wyN8t+zNah0hkFoSS+pGzbWNYQqA==
X-Gm-Gg: ASbGncs4UGWrdPOS+oVXhIREFootbf6TRJ6kEyygRGSxHKlxmWC4NRcq2bDL8hcRjTA
 +zQ20HrDAtriJ8rsVnLPG8LoAITdosgT7yy5bH1MMQJqrSZqJlo/RYBstMEQAsWFz9ZfLJCNDme
 qLDpgVDjwHz6PWQDiw3FG09AdNcMMm5k3HY6iiIXoxcEXH841zLZXi44kNwVrFrE3O9b8DKnPk2
 WZXoWiNr+x39uKcpuFpRaVmmxGlO/KWsa4lYamJJCcitVwkRJupZBCYfRX2B/XTLOlHOK4r0z5V
 uZbX622xiTkiAxBupcBY0Ekcw1qntqy2fnLoJBrIFaw=
X-Received: by 2002:a05:6e02:1523:b0:425:9068:4ff with SMTP id
 e9e14a558f8ab-425955c8eb5mr97782445ab.1.1759180672729; 
 Mon, 29 Sep 2025 14:17:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFTF4nahZRRX2gicTqxhxWdWKeUzRDCgsQQuCRfxHGJ4HNrczL75firr5hrFe4LKeaKRuPCNA==
X-Received: by 2002:a05:6e02:1523:b0:425:9068:4ff with SMTP id
 e9e14a558f8ab-425955c8eb5mr97782155ab.1.1759180672251; 
 Mon, 29 Sep 2025 14:17:52 -0700 (PDT)
Received: from redhat.com ([38.15.36.11]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-425c05476fasm62141985ab.43.2025.09.29.14.17.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Sep 2025 14:17:51 -0700 (PDT)
Date: Mon, 29 Sep 2025 15:17:49 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: Leon Romanovsky <leonro@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org,
 iommu@lists.linux.dev, Jens Axboe <axboe@kernel.dk>, Joerg Roedel
 <joro@8bytes.org>, kvm@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mm@kvack.org, linux-pci@vger.kernel.org,
 Logan Gunthorpe <logang@deltatee.com>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, Sumit
 Semwal <sumit.semwal@linaro.org>, Vivek Kasireddy
 <vivek.kasireddy@intel.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v4 10/10] vfio/pci: Add dma-buf export support for MMIO
 regions
Message-ID: <20250929151749.2007b192.alex.williamson@redhat.com>
In-Reply-To: <53f3ea1947919a5e657b4f83e74ca53aa45814d4.1759070796.git.leon@kernel.org>
References: <cover.1759070796.git.leon@kernel.org>
 <53f3ea1947919a5e657b4f83e74ca53aa45814d4.1759070796.git.leon@kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pj3B1vWLJZ4DMgdac55OVKASfjwhyLuLn9sMjQmKnFk_1759180673
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Sun, 28 Sep 2025 17:50:20 +0300
Leon Romanovsky <leon@kernel.org> wrote:
> +static int validate_dmabuf_input(struct vfio_pci_core_device *vdev,
> +				 struct vfio_device_feature_dma_buf *dma_buf,
> +				 struct vfio_region_dma_range *dma_ranges,
> +				 struct p2pdma_provider **provider)
> +{
> +	struct pci_dev *pdev = vdev->pdev;
> +	u32 bar = dma_buf->region_index;
> +	resource_size_t bar_size;
> +	u64 sum;
> +	int i;
> +
> +	if (dma_buf->flags)
> +		return -EINVAL;
> +	/*
> +	 * For PCI the region_index is the BAR number like  everything else.
> +	 */
> +	if (bar >= VFIO_PCI_ROM_REGION_INDEX)
> +		return -ENODEV;
> +
> +	*provider = pcim_p2pdma_provider(pdev, bar);
> +	if (!provider)

This needs to be IS_ERR_OR_NULL() or the function needs to settle on a
consistent error return value regardless of CONFIG_PCI_P2PDMA.

> +		return -EINVAL;
> +
> +	bar_size = pci_resource_len(pdev, bar);

We get to this feature via vfio_pci_core_ioctl_feature(), which is used
by several variant drivers, some of which mangle the BAR size exposed
to the user, ex. hisi_acc.  I'm afraid this might actually be giving
dmabuf access to a portion of the BAR that isn't exposed otherwise.

> +	for (i = 0; i < dma_buf->nr_ranges; i++) {
> +		u64 offset = dma_ranges[i].offset;
> +		u64 len = dma_ranges[i].length;
> +
> +		if (!PAGE_ALIGNED(offset) || !PAGE_ALIGNED(len))
> +			return -EINVAL;
> +
> +		if (check_add_overflow(offset, len, &sum) || sum > bar_size)
> +			return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +int vfio_pci_core_feature_dma_buf(struct vfio_pci_core_device *vdev, u32 flags,
> +				  struct vfio_device_feature_dma_buf __user *arg,
> +				  size_t argsz)
> +{
> +	struct vfio_device_feature_dma_buf get_dma_buf = {};
> +	struct vfio_region_dma_range *dma_ranges;
> +	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
> +	struct p2pdma_provider *provider;
> +	struct vfio_pci_dma_buf *priv;
> +	int ret;
> +
> +	ret = vfio_check_feature(flags, argsz, VFIO_DEVICE_FEATURE_GET,
> +				 sizeof(get_dma_buf));
> +	if (ret != 1)
> +		return ret;
> +
> +	if (copy_from_user(&get_dma_buf, arg, sizeof(get_dma_buf)))
> +		return -EFAULT;
> +
> +	if (!get_dma_buf.nr_ranges)
> +		return -EINVAL;
> +
> +	dma_ranges = memdup_array_user(&arg->dma_ranges, get_dma_buf.nr_ranges,
> +				       sizeof(*dma_ranges));
> +	if (IS_ERR(dma_ranges))
> +		return PTR_ERR(dma_ranges);
> +
> +	ret = validate_dmabuf_input(vdev, &get_dma_buf, dma_ranges, &provider);
> +	if (ret)
> +		return ret;

goto err_free_ranges;

Thanks,
Alex

