Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A89EEC8AD4A
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 17:08:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FF5B10E176;
	Wed, 26 Nov 2025 16:08:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fb.com header.i=@fb.com header.b="CATY9ftr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F79810E176
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 16:08:53 +0000 (UTC)
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 5AQEPbd43733913;
 Wed, 26 Nov 2025 08:08:31 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=s2048-2025-q2; bh=oZmYh6YpHcTCE9H3NEMw
 SXw1R9ZP1diRqyx6ns/UxKM=; b=CATY9ftrmS7XqrrPh2Kw2+U4yOLTDIOhQo4t
 fT++bE5QnXUTTDj1SISKs+UQWWlWXESUt4Vk/Uw4ZSdu3sXkySe9GBFHO/GtOEWQ
 411l/Uycz4QsElZjqmNLTTOC03Bk3xrahRxGe2dTAYG3Xw8/u0qaXvlwf4Qf+gzA
 RQRz/m6jwIWn7OkNdO9JgYCJ3G1u1eeNgwfmMCUjXO0Y/Z5VrkUOlbGe0Sigp71N
 fPi2jhyinHmV7dk2u+LQ68tQs+O+aJ2d0sCNzYiAXKyb0pPsIXMYGocj6ADUHnCK
 VMnCClf+dI7uC/6KbcFfIu8b90bADDeEXqso0Amh6UxzsGo6vA==
Received: from mail.thefacebook.com ([163.114.134.16])
 by m0089730.ppops.net (PPS) with ESMTPS id 4ap3a78uqy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 26 Nov 2025 08:08:31 -0800 (PST)
Received: from devgpu015.cco6.facebook.com (2620:10d:c085:208::7cb7) by
 mail.thefacebook.com (2620:10d:c08b:78::c78f) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Wed, 26 Nov 2025 16:08:29 +0000
Date: Wed, 26 Nov 2025 08:08:24 -0800
From: Alex Mastro <amastro@fb.com>
To: Pranjal Shrivastava <praan@google.com>
CC: Leon Romanovsky <leon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Logan Gunthorpe <logang@deltatee.com>, Jens Axboe <axboe@kernel.dk>, Robin
 Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon
 <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Jason
 Gunthorpe <jgg@ziepe.ca>, Andrew Morton <akpm@linux-foundation.org>,
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Kees Cook
 <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Ankit
 Agrawal <ankita@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>, Shameer
 Kolothum <skolothumtho@nvidia.com>, Kevin Tian <kevin.tian@intel.com>, Alex
 Williamson <alex@shazbot.org>,
 Krishnakant Jaju <kjaju@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
 <linux-pci@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-block@vger.kernel.org>, <iommu@lists.linux.dev>,
 <linux-mm@kvack.org>, <linux-doc@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <kvm@vger.kernel.org>,
 <linux-hardening@vger.kernel.org>, Nicolin Chen <nicolinc@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v9 06/11] dma-buf: provide phys_vec to scatter-gather
 mapping routine
Message-ID: <aScl+LCPN2TiN7Pd@devgpu015.cco6.facebook.com>
References: <20251120-dmabuf-vfio-v9-0-d7f71607f371@nvidia.com>
 <20251120-dmabuf-vfio-v9-6-d7f71607f371@nvidia.com>
 <aSZHO6otK0Heh+Qj@devgpu015.cco6.facebook.com>
 <aSb8yH6fSlwk1oZZ@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aSb8yH6fSlwk1oZZ@google.com>
X-Originating-IP: [2620:10d:c085:208::7cb7]
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDEzMiBTYWx0ZWRfX3bFJkIqQfPcn
 LWbsluc+XiO7FtO07pm/tzene/bBlAJbYXetaCM2lBsQPJ7MYrk9CERNphaL5xKMK0Fnvy9OfVQ
 Y+bU9q7WY0Uh4Ys8J+otFMneIfwxv0xQluXqaIjHKTPEMVRe0iLSwQwQAHlspppJcXBPJ55pvJz
 JZGujlxTRi2Y6L0eYmj2p7cT3nMIZvFmJX5h1nMX2rkgpOumcUuD7Oe2fNXk47TY9k+6i3mWPRm
 +1gsqEAXdsAGhXv5RuZTmDTEo722fCpYhIfmTOQnzXGxfUvfRTUYuIHNc7jrvUJJ3yy8os7MmWa
 fQzyxL3akPGWodtrtHsYmp6smX1T/MBPHuER3U7LA5bJUfQjB0xkE91sw0JPQLAlnjtXtOu0oRF
 6D5ufStP6OnrcDNfC66Kegl4bp3vwg==
X-Authority-Analysis: v=2.4 cv=AJKKJ3lP c=1 sm=1 tr=0 ts=692725ff cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=B5NVPXpBE_52QoX4XTUA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: jOyqyM0SasvNGLs4etkYDuX4vfn-Z9b2
X-Proofpoint-GUID: jOyqyM0SasvNGLs4etkYDuX4vfn-Z9b2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
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

On Wed, Nov 26, 2025 at 01:12:40PM +0000, Pranjal Shrivastava wrote:
> On Tue, Nov 25, 2025 at 04:18:03PM -0800, Alex Mastro wrote:
> > On Thu, Nov 20, 2025 at 11:28:25AM +0200, Leon Romanovsky wrote:
> > > +static struct scatterlist *fill_sg_entry(struct scatterlist *sgl, size_t length,
> > > +					 dma_addr_t addr)
> > > +{
> > > +	unsigned int len, nents;
> > > +	int i;
> > > +
> > > +	nents = DIV_ROUND_UP(length, UINT_MAX);
> > > +	for (i = 0; i < nents; i++) {
> > > +		len = min_t(size_t, length, UINT_MAX);
> > > +		length -= len;
> > > +		/*
> > > +		 * DMABUF abuses scatterlist to create a scatterlist
> > > +		 * that does not have any CPU list, only the DMA list.
> > > +		 * Always set the page related values to NULL to ensure
> > > +		 * importers can't use it. The phys_addr based DMA API
> > > +		 * does not require the CPU list for mapping or unmapping.
> > > +		 */
> > > +		sg_set_page(sgl, NULL, 0, 0);
> > > +		sg_dma_address(sgl) = addr + i * UINT_MAX;
> > 
> > (i * UINT_MAX) happens in 32-bit before being promoted to dma_addr_t for
> > addition with addr. Overflows for i >=2 when length >= 8 GiB. Needs a cast:
> > 
> > 		sg_dma_address(sgl) = addr + (dma_addr_t)i * UINT_MAX;
> > 
> > Discovered this while debugging why dma-buf import was failing for
> > an 8 GiB dma-buf using my earlier toy program [1]. It was surfaced by
> > ib_umem_find_best_pgsz() returning 0 due to malformed scatterlist, which bubbles
> > up as an EINVAL.
> >
> 
> Thanks a lot for testing & reporting this!
> 
> However, I believe the casting approach is a little fragile (and
> potentially prone to issues depending on how dma_addr_t is sized on
> different platforms). Thus, approaching this with accumulation seems
> better as it avoids the multiplication logic entirely, maybe something
> like the following (untested) diff ?

If the function input range is well-formed, then all values in
[addr..addr+length) must be expressible by dma_addr_t, so I don't think overflow
after casting is possible as long as nents is valid.

That said, `nents = DIV_ROUND_UP(length, UINT_MAX)` is simply broken on any
system where size_t is 32b. I don't know if that's a practical consideration for
these code paths though.

> 
> --- a/drivers/dma-buf/dma-buf-mapping.c
> +++ b/drivers/dma-buf/dma-buf-mapping.c
> @@ -252,14 +252,14 @@ static struct scatterlist *fill_sg_entry(struct scatterlist *sgl, size_t length,
>  	nents = DIV_ROUND_UP(length, UINT_MAX);
>  	for (i = 0; i < nents; i++) {
>  		len = min_t(size_t, length, UINT_MAX);
> -		length -= len;
>  		/*
>  		 * DMABUF abuses scatterlist to create a scatterlist
>  		 * that does not have any CPU list, only the DMA list.
>  		 * Always set the page related values to NULL to ensure
>  		 * importers can't use it. The phys_addr based DMA API
>  		 * does not require the CPU list for mapping or unmapping.
>  		 */
>  		sg_set_page(sgl, NULL, 0, 0);
> -		sg_dma_address(sgl) = addr + i * UINT_MAX;
> +		sg_dma_address(sgl) = addr;
>  		sg_dma_len(sgl) = len;
> +
> +		addr += len;
> +		length -= len;
>  		sgl = sg_next(sgl);
>  	}
> 
> Thanks,
> Praan
