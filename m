Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9F9C6EDAA
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 14:25:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF1C510E602;
	Wed, 19 Nov 2025 13:25:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="RL52T6gi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C82510E602
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 13:25:13 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id
 d75a77b69052e-4ed75832448so81985681cf.2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 05:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1763558713; x=1764163513; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=7FcA8gVt6NKvMsMWTMSBQuU8SYBlABMNBdbtn9F9iv8=;
 b=RL52T6gi5Uu8WHSF7iy2Im8ZMuXi5I8n8MUuhSM9OmuRcoZvSOPup+6CidX6JRl9vs
 oEJBdHI6Bh4Xwwt+OXGui+MIagIyhCj10JrpeGzu6IpaQpwVFhywEoulEhvvYEwqC+3U
 4O7y8G+ZztMIqG17Q/PznM3vjWJiWzKj+xuyf7qg/xuLs8nmtnBLDr11KVHsDHblfZ4e
 /neC4tSo9gbareEDMLDyhkt1akdg0w7bzBL6c61yTj2MXH1fl2lgZn4q9N4etyj8YvcN
 WpAMhMvKJJf080qECwvRPXMQ91O8UaPBsEynpltydRV+QbRJdsyLRX43wLOJNT7g1Bqh
 BZgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763558713; x=1764163513;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7FcA8gVt6NKvMsMWTMSBQuU8SYBlABMNBdbtn9F9iv8=;
 b=o6IlBNvH1pSZjj/Nnb0LdyWxD6GyB9UG2uXPNJBoicvWMK9TVYCDKIpPPHB2VfbnTp
 XuhmMuCdIXLKoIBqIxg/c2xVqzJpc/XmTLX3FXdV0sFkDDckFLJQ2B0y3W8v4tz2xWvd
 j/gHybVQH608q1SjPKv/JYW6A6rv9FTqI/AKOM2r+eftd+1/5ralVxKmBV6os/Ru9AGt
 lMU0IzNqLEHl9oKvlA9I6L05E2PQuEH/1gMVi4wTJR02Ms5az7+Xw5A6kGIBauNJpkhL
 VZnOzRiU5v19b2lFOtL9M6imuGqFhQqtib4dzjio+dkUfDKgB5mVCD1/6E+lSqAy1lsy
 eFTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbSlQJkqq+ppxf5Y45a6h9ovmPKQ/5vsOj0JLoYw8FmoX0/sr9z4LB1W4G6xe1YhThiweCKj7NYFA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwAMzHn2ZU/d9WtaN+DpNw46WeWR6Q4cTZRgUobO4PXJd5PIIUk
 jWiQ7uUdiuXCHyqUzpLMID5Wkp19x51kor1AXGxqlBu/HDpM41QEuC+askstVEusi3c=
X-Gm-Gg: ASbGnctBYWQEepSZsD7zJjRvbuaczcDVA8HSJwQsi1QCGTf3rkMiXvqjySYRhlnG97c
 w6anDoED+iyoL6Boc4GvnT7XiVJhnaKbb8ldmtryGR0ViiQB7EdnO+dsXzUl7gqbl+a9EUomsMc
 6/zrT+Tz+c9emlEoWLbBfMj1Vwdx1jfJdq0I5nNjiyOcAuj8KUqkdbcH6XFXzCWjKZezR6rnC6a
 IS+vwEY9JMtIg3BSyx0b7ynAnAFymJ7GglFUD5VGwOdRdPX0H0C1ZjWX8vPeU8iHuDDrCGZKe7D
 B/wVtfyb7TmuB5O7pCw/TkKFZ2q3L/27n61Gv12eAMycF2voUIJ7Y8XFzFqF/K6oKZE8q872AFW
 4CCk4iu1ZvP0CrcoMbiF6aNUFc0qKG04S7R6HI5zqEbaOlodGjuC34orbRPtxEaUj6JkjWy+E/l
 /YR11VZAByHr3jCmBGUH7RNRbiCNeeBHAdusOqdq7CEXVAsLxZ+l49JEMrkbRW2afBVS2yjw9RB
 BNY+w==
X-Google-Smtp-Source: AGHT+IGcHnQoF5t1hy3jZRVLXrR3AGxUUwufE8qFpbPEJxiBipRIqKgpWukFR+qkVncUWaOAApoSpg==
X-Received: by 2002:a05:622a:1a8d:b0:4ee:219e:e66 with SMTP id
 d75a77b69052e-4ee219e1ccbmr140009891cf.83.1763558712629; 
 Wed, 19 Nov 2025 05:25:12 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.120.4]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-88286588be1sm133530266d6.47.2025.11.19.05.25.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Nov 2025 05:25:11 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1vLiBL-00000000Z6L-0jbP;
 Wed, 19 Nov 2025 09:25:11 -0400
Date: Wed, 19 Nov 2025 09:25:11 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Leon Romanovsky <leon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Logan Gunthorpe <logang@deltatee.com>, Jens Axboe <axboe@kernel.dk>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Sumit Semwal <sumit.semwal@linaro.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Ankit Agrawal <ankita@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>,
 Kevin Tian <kevin.tian@intel.com>, Alex Williamson <alex@shazbot.org>,
 Krishnakant Jaju <kjaju@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, iommu@lists.linux.dev,
 linux-mm@kvack.org, linux-doc@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, kvm@vger.kernel.org,
 linux-hardening@vger.kernel.org, Alex Mastro <amastro@fb.com>,
 Nicolin Chen <nicolinc@nvidia.com>
Subject: Re: [Linaro-mm-sig] [PATCH v8 06/11] dma-buf: provide phys_vec to
 scatter-gather mapping routine
Message-ID: <20251119132511.GK17968@ziepe.ca>
References: <20251111-dmabuf-vfio-v8-0-fd9aa5df478f@nvidia.com>
 <20251111-dmabuf-vfio-v8-6-fd9aa5df478f@nvidia.com>
 <8a11b605-6ac7-48ac-8f27-22df7072e4ad@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8a11b605-6ac7-48ac-8f27-22df7072e4ad@amd.com>
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

On Wed, Nov 19, 2025 at 02:16:57PM +0100, Christian König wrote:
> > +/**
> > + * dma_buf_map - Returns the scatterlist table of the attachment from arrays
> > + * of physical vectors. This funciton is intended for MMIO memory only.
> > + * @attach:	[in]	attachment whose scatterlist is to be returned
> > + * @provider:	[in]	p2pdma provider
> > + * @phys_vec:	[in]	array of physical vectors
> > + * @nr_ranges:	[in]	number of entries in phys_vec array
> > + * @size:	[in]	total size of phys_vec
> > + * @dir:	[in]	direction of DMA transfer
> > + *
> > + * Returns sg_table containing the scatterlist to be returned; returns ERR_PTR
> > + * on error. May return -EINTR if it is interrupted by a signal.
> > + *
> > + * On success, the DMA addresses and lengths in the returned scatterlist are
> > + * PAGE_SIZE aligned.
> > + *
> > + * A mapping must be unmapped by using dma_buf_unmap().
> > + */
> > +struct sg_table *dma_buf_map(struct dma_buf_attachment *attach,
> 
> That is clearly not a good name for this function. We already have overloaded the term *mapping* with something completely different.
> 
> > +			     struct p2pdma_provider *provider,
> > +			     struct dma_buf_phys_vec *phys_vec,
> > +			     size_t nr_ranges, size_t size,
> > +			     enum dma_data_direction dir)
> > +{
> > +	unsigned int nents, mapped_len = 0;
> > +	struct dma_buf_dma *dma;
> > +	struct scatterlist *sgl;
> > +	dma_addr_t addr;
> > +	size_t i;
> > +	int ret;
> > +
> > +	dma_resv_assert_held(attach->dmabuf->resv);
> > +
> > +	if (WARN_ON(!attach || !attach->dmabuf || !provider))
> > +		/* This function is supposed to work on MMIO memory only */
> > +		return ERR_PTR(-EINVAL);
> > +
> > +	dma = kzalloc(sizeof(*dma), GFP_KERNEL);
> > +	if (!dma)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	switch (pci_p2pdma_map_type(provider, attach->dev)) {
> > +	case PCI_P2PDMA_MAP_BUS_ADDR:
> > +		/*
> > +		 * There is no need in IOVA at all for this flow.
> > +		 */
> > +		break;
> > +	case PCI_P2PDMA_MAP_THRU_HOST_BRIDGE:
> > +		dma->state = kzalloc(sizeof(*dma->state), GFP_KERNEL);
> > +		if (!dma->state) {
> > +			ret = -ENOMEM;
> > +			goto err_free_dma;
> > +		}
> > +
> > +		dma_iova_try_alloc(attach->dev, dma->state, 0, size);
> 
> Oh, that is a clear no-go for the core DMA-buf code.
> 
> It's intentionally up to the exporter how to create the DMA
> addresses the importer can work with.

I can't fully understand this remark?

> We could add something like a dma_buf_sg_helper.c or similar and put it in there.

Yes, the intention is this function is an "exporter helper" that an
exporter can call if it wants to help generate the scatterlist.

So your "no-go" is just about what file it is in, not anything about
how it works?

Thanks,
Jason
