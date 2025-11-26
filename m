Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C85EDC89F2C
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 14:12:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 186A210E239;
	Wed, 26 Nov 2025 13:12:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="3NTwmRlT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B3BF10E0F6
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 13:12:51 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-2980343d9d1so158395ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 05:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1764162771; x=1764767571;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=v7j/p6bUr5Xuh7DTD99aQLTt37H/gN4j/r6C1+HVuuw=;
 b=3NTwmRlTosC4O4FoPUbCv2fPCPayfFkRQtHlrGCkTZD2m+CDVRqXe+VwUReAEo02oS
 FgkRiciE897hT+JOubReFXk3eOIlVqRBLTQK4EZqFs9+FnTL5hXdfXP7jSaO3ASFEWIo
 h32BP1W7RJlCNtPLl2lBofAvNlObAMvWsuTewcb19OaLkmXTNzVtQ5kBu8xA1iF+/OXY
 NN5YJY3g6fwL+vvXjyY3zPcO3pybJ9GPUI0weoPpKSB55biFOpzJDJPJ8owBaNkb56sc
 av4SBQ4Yh/V7mhXcnR5Ztv01oJWXiPhQXb1rVbzxxJYsw78tt+pc6F8ufzHjm63xQuRg
 Gtyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764162771; x=1764767571;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v7j/p6bUr5Xuh7DTD99aQLTt37H/gN4j/r6C1+HVuuw=;
 b=tiUtIaVj819HqtXepZGF3kepXa/yU3+84UcyctEcVSpUxWCBDFQ1xTyyqxgP5/SkJI
 f0Buly6YLelV2OvoFPkxasCN0rOmx2xxG4/NLB/pyMURrQkLE/wK1IHaJRgG46eGYoeA
 DfpD0cJ4iLZX4GZE6z1BU5Vpwl3E//gGFUfywmxcjbQI/FNaTPoE9TPGOscLdVxIiACU
 m6EUHH0+gRL+GtmB4dxAO2XlUh42JUGcV9SJvHx7UBwG6flb0pzTtNWwGwenK+XkXuod
 fp1R/NWo0oAu8VQE+Glo2cszjIEFyMauVbrRNHI6nkjAYOCRvvA+VUKR1MjqTd1QWUQB
 n7uA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBlSj+b9CZ+/ke3RVNAhmWDaKLPb7rw9mi3z16ccm3NfT8lJQK3YB0lJ1KmAYu57Dozx66+Dfva60=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxhkquRcTb9Tg5hKQ7l7vGWMZ8P+PXYIRPJWP/NLP4LnP6fQeWj
 TCOPKy7ZPvoCydtI1CSWPZJSgp1g/tgCjdvd3OWttUduV6EqusMjJjnakPZA8njN+g==
X-Gm-Gg: ASbGncs8TkIh0zzD+oSsmZTsyOfIU880e/yE+1y/XrNp3+8jaip+j3JTzR2qI2bTeWu
 MCdtvSQ8VH+t1usv1xTy4leugWDaktTe/iW3JKwYbrFR2Am4QZsgwZ3q3zdf2C04A6vPpcvojdo
 pHopvYMoSdxzlnH51vaJGUlxrh1Bg09wHP7BCdMPPXBeIzZ1+j6K9q8i4Nm0tYDldNCOhp8xeio
 Xv+IknDOyB30d805c7zx6UgEECmJ343eaIHzJdSkgdurQTdYvRltRsnffiDkJEOdQuYccrCXs4P
 Jpv+ycrfF06fK5xlDK9fdKMbOBpP0PxfQDYFNWc5C2beeb8izZvDfInJtcC0MPw9R0GCEtJDv7C
 S1uqMkoryFWkrKl0C5Ti13bBtJL1fTuSQVWGuCfQyCHX4IlnVR+cjuS1t7ijGQB/hVaHmH22ag1
 8sqjbc4Ef8gckzHXh6thX26S5ML5VTv8kbrsVd/tVvwfRo+G1c
X-Google-Smtp-Source: AGHT+IHJIOBgKlL+CS0ZpKtYX5Djx07PEo4PrDI8k+TVBWbcqpi0p7MakMMReKQUlItaKRJKERuBaA==
X-Received: by 2002:a17:902:cf07:b0:26d:72f8:8cfa with SMTP id
 d9443c01a7336-29bba9e8a00mr1709325ad.13.1764162769984; 
 Wed, 26 Nov 2025 05:12:49 -0800 (PST)
Received: from google.com (164.210.142.34.bc.googleusercontent.com.
 [34.142.210.164]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29b5b105e4csm194769895ad.2.2025.11.26.05.12.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Nov 2025 05:12:49 -0800 (PST)
Date: Wed, 26 Nov 2025 13:12:40 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Alex Mastro <amastro@fb.com>
Cc: Leon Romanovsky <leon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Logan Gunthorpe <logang@deltatee.com>, Jens Axboe <axboe@kernel.dk>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Andrew Morton <akpm@linux-foundation.org>,
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Ankit Agrawal <ankita@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>,
 Kevin Tian <kevin.tian@intel.com>, Alex Williamson <alex@shazbot.org>,
 Krishnakant Jaju <kjaju@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, iommu@lists.linux.dev,
 linux-mm@kvack.org, linux-doc@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, kvm@vger.kernel.org,
 linux-hardening@vger.kernel.org, Nicolin Chen <nicolinc@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v9 06/11] dma-buf: provide phys_vec to scatter-gather
 mapping routine
Message-ID: <aSb8yH6fSlwk1oZZ@google.com>
References: <20251120-dmabuf-vfio-v9-0-d7f71607f371@nvidia.com>
 <20251120-dmabuf-vfio-v9-6-d7f71607f371@nvidia.com>
 <aSZHO6otK0Heh+Qj@devgpu015.cco6.facebook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aSZHO6otK0Heh+Qj@devgpu015.cco6.facebook.com>
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

On Tue, Nov 25, 2025 at 04:18:03PM -0800, Alex Mastro wrote:
> On Thu, Nov 20, 2025 at 11:28:25AM +0200, Leon Romanovsky wrote:
> > +static struct scatterlist *fill_sg_entry(struct scatterlist *sgl, size_t length,
> > +					 dma_addr_t addr)
> > +{
> > +	unsigned int len, nents;
> > +	int i;
> > +
> > +	nents = DIV_ROUND_UP(length, UINT_MAX);
> > +	for (i = 0; i < nents; i++) {
> > +		len = min_t(size_t, length, UINT_MAX);
> > +		length -= len;
> > +		/*
> > +		 * DMABUF abuses scatterlist to create a scatterlist
> > +		 * that does not have any CPU list, only the DMA list.
> > +		 * Always set the page related values to NULL to ensure
> > +		 * importers can't use it. The phys_addr based DMA API
> > +		 * does not require the CPU list for mapping or unmapping.
> > +		 */
> > +		sg_set_page(sgl, NULL, 0, 0);
> > +		sg_dma_address(sgl) = addr + i * UINT_MAX;
> 
> (i * UINT_MAX) happens in 32-bit before being promoted to dma_addr_t for
> addition with addr. Overflows for i >=2 when length >= 8 GiB. Needs a cast:
> 
> 		sg_dma_address(sgl) = addr + (dma_addr_t)i * UINT_MAX;
> 
> Discovered this while debugging why dma-buf import was failing for
> an 8 GiB dma-buf using my earlier toy program [1]. It was surfaced by
> ib_umem_find_best_pgsz() returning 0 due to malformed scatterlist, which bubbles
> up as an EINVAL.
>

Thanks a lot for testing & reporting this!

However, I believe the casting approach is a little fragile (and
potentially prone to issues depending on how dma_addr_t is sized on
different platforms). Thus, approaching this with accumulation seems
better as it avoids the multiplication logic entirely, maybe something
like the following (untested) diff ?

--- a/drivers/dma-buf/dma-buf-mapping.c
+++ b/drivers/dma-buf/dma-buf-mapping.c
@@ -252,14 +252,14 @@ static struct scatterlist *fill_sg_entry(struct scatterlist *sgl, size_t length,
 	nents = DIV_ROUND_UP(length, UINT_MAX);
 	for (i = 0; i < nents; i++) {
 		len = min_t(size_t, length, UINT_MAX);
-		length -= len;
 		/*
 		 * DMABUF abuses scatterlist to create a scatterlist
 		 * that does not have any CPU list, only the DMA list.
 		 * Always set the page related values to NULL to ensure
 		 * importers can't use it. The phys_addr based DMA API
 		 * does not require the CPU list for mapping or unmapping.
 		 */
 		sg_set_page(sgl, NULL, 0, 0);
-		sg_dma_address(sgl) = addr + i * UINT_MAX;
+		sg_dma_address(sgl) = addr;
 		sg_dma_len(sgl) = len;
+
+		addr += len;
+		length -= len;
 		sgl = sg_next(sgl);
 	}

Thanks,
Praan
