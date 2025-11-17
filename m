Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88591C6568F
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 18:16:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F59710E37A;
	Mon, 17 Nov 2025 17:16:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="UGOUP5Rk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF95610E39C
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 17:16:21 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id
 d75a77b69052e-4ee1a3ef624so10487091cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 09:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1763399780; x=1764004580; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=P1EKuTl21MaZwOVAnrWkECo68IZFcqZRr/UNlppTPmo=;
 b=UGOUP5RkoZ6em/udnWdq0BPQiVWqRTU4wbdHf1hAOzswRuVVqseV81mTt8Yu51Z3US
 vJMrIY6TlXUyYwedEcZAp53neXe96UqVgEv+KO3Vxn3ZDIjS7mqiZgHK10yF6T74HWON
 a13q4pT0Z1w9GW64W0NnwEevBwWZU6aL8SLqZkcJKUCUsJM52lRH9Z4rCnDMwO6CH9QQ
 pcbnI8c/tsRW0iO0s7lbb70rEImLNot8AptP4NonqFsSIA9AnTru5D6aj+LDFtjW2mY9
 adztLlhczzqqjP9QoOtjtqL84y/HiqpBNJrHXGaBo4z8D7wi8fLj6Gf62mFUcHKOiLsi
 3SSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763399780; x=1764004580;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=P1EKuTl21MaZwOVAnrWkECo68IZFcqZRr/UNlppTPmo=;
 b=RCV1mRDsdtp85yQ63bmEXLmdFzSOFfamowcdQwph0NcngZ5HwXfUZaQq9cvmhqdQ74
 81tFIArVtdBuZFs4cU8I6GGnCSCItUjNu+EITCfxA1FsEMwuTQIauYzqVmG+RalEX3rx
 E3ZIa9u7NhEe7umAsBhjaYo5aEIJ948NZjIuT/Nfi4lo92TXF+VFzKzyTb4IU3iUT5Mg
 DGhyiu5Lfgg6OdMa2PhS6ZEYqsk79cNw0VOAR/5BJGvIhn+qIkpyvZj1LAR7GfMnMc8v
 zD7de8cZkDgzm+zJmwzW1IOWdTKnFX7YZD7GdQZYBrKOOT1xcN2/96lzjU5w3Us9hrMv
 LmgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQECY4otV8LaGiG0heyzPW0C/oEuCxI3ts9I07UNoEOHFdtsr6VRZ5Xa6iSsNVXFut/dg/J6yk5jI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yww/0oiNSSxDmrYvywOhEDQCfD53U/wRY5daEsCwszR8Eih8qqy
 YGtZQRUqnft8Gu3D4GDgHqzaXJz7qkGqLNFxntH8NnpwuE9G1hW6Wp5Rl8mYc3IjoG8=
X-Gm-Gg: ASbGncun7eaVKpAKikCYRCWw5Ul7t3aRSiAKGuh9h7uHgphSFPQK/Mt2Y6H4EQdJKdv
 mvfMU3SKkZ0AXKPwpYIqpWi/gaZFc4buIh4BYOi6Dz5q+lTAHqgY0/1krR+wJVXXLsZLEsNoPV7
 yl5f3iKzvcf+348xZ9P1mSSFtS7UGHE8aqZKgTZlfM2aMmnX5jWM/ItZHWeHhnf/WeGUfjmLa7H
 GxVodKju/tKKXw8MOBprWg1IFOzp0IPWDSA2Te/hx/BT2h9hEvyfKGjMr2+Fb6I40J3/97ti2c3
 TXHxwUW24MEagM1W4SemD5tT+Fg+U0gHmXugxvEiyZiRSmne8E7A1a6ozC2jfWHFAMH1v299DGc
 A6maSIfmY3q1rDxN3qt7IKEWSgJVlDmMkX72nIeGdGuVs6onqV6OO3Mwc5gk5za5KX9wCoIINoU
 Cf6U5EvaYaUEWUtdjxFQvjn1HD4EvyYEPO+D6Ar5yxaEgRoWy/uM0xGC7+
X-Google-Smtp-Source: AGHT+IHdomOA3fXFLRj5Qifi24Z8ILoy1R2tZQWL9HXByV1pnhKykseLX/aaxM1vhUTUzCoPwrvJjg==
X-Received: by 2002:a05:622a:22aa:b0:4ec:ef20:ac52 with SMTP id
 d75a77b69052e-4edfc87511cmr159168241cf.79.1763399780286; 
 Mon, 17 Nov 2025 09:16:20 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.120.4]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4ee1c21ea34sm32656311cf.30.2025.11.17.09.16.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Nov 2025 09:16:19 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1vL2pv-000000005PX-0G4a;
 Mon, 17 Nov 2025 13:16:19 -0400
Date: Mon, 17 Nov 2025 13:16:19 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alex Williamson <alex@shazbot.org>
Cc: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Leon Romanovsky <leon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Logan Gunthorpe <logang@deltatee.com>, Jens Axboe <axboe@kernel.dk>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Sumit Semwal <sumit.semwal@linaro.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Ankit Agrawal <ankita@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>,
 Kevin Tian <kevin.tian@intel.com>,
 Krishnakant Jaju <kjaju@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, iommu@lists.linux.dev,
 linux-mm@kvack.org, linux-doc@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, kvm@vger.kernel.org,
 linux-hardening@vger.kernel.org, Alex Mastro <amastro@fb.com>,
 Nicolin Chen <nicolinc@nvidia.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [PATCH v7 00/11] vfio/pci: Allow MMIO regions to be exported
 through dma-buf
Message-ID: <20251117171619.GB17968@ziepe.ca>
References: <20251106-dmabuf-vfio-v7-0-2503bf390699@nvidia.com>
 <20251110134218.5e399b0f.alex@shazbot.org>
 <da399efa-ad5b-4bdc-964d-b6cc4a4fc55d@amd.com>
 <20251117083620.4660081a.alex@shazbot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251117083620.4660081a.alex@shazbot.org>
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

On Mon, Nov 17, 2025 at 08:36:20AM -0700, Alex Williamson wrote:
> On Tue, 11 Nov 2025 09:54:22 +0100
> Christian König <christian.koenig@amd.com> wrote:
> 
> > On 11/10/25 21:42, Alex Williamson wrote:
> > > On Thu,  6 Nov 2025 16:16:45 +0200
> > > Leon Romanovsky <leon@kernel.org> wrote:
> > >   
> > >> Changelog:
> > >> v7:
> > >>  * Dropped restore_revoke flag and added vfio_pci_dma_buf_move
> > >>    to reverse loop.
> > >>  * Fixed spelling errors in documentation patch.
> > >>  * Rebased on top of v6.18-rc3.
> > >>  * Added include to stddef.h to vfio.h, to keep uapi header file independent.  
> > > 
> > > I think we're winding down on review comments.  It'd be great to get
> > > p2pdma and dma-buf acks on this series.  Otherwise it's been posted
> > > enough that we'll assume no objections.  Thanks,  
> > 
> > Already have it on my TODO list to take a closer look, but no idea when that will be.
> > 
> > This patch set is on place 4 or 5 on a rather long list of stuff to review/finish.
> 
> Hi Christian,
> 
> Gentle nudge.  Leon posted v8[1] last week, which is not drawing any
> new comments.  Do you foresee having time for review that I should
> still hold off merging for v6.19 a bit longer?  Thanks,

I really want this merged this cycle, along with the iommufd part,
which means it needs to go into your tree by very early next week on a
shared branch so I can do the iommufd part on top.

It is the last blocking kernel piece to conclude the viommu support
roll out into qemu for iommufd which quite a lot of people have been
working on for years now.

IMHO there is nothing profound in the dmabuf patch, it was written by
the expert in the new DMA API operation, and doesn't form any
troublesome API contracts. It is also the same basic code as from the
v1 in July just moved into dmabuf .c files instead of vfio .c files at
Christoph's request.

My hope is DRM folks will pick up the baton and continue to improve
this to move other drivers away from dma_map_resource(). Simona told
me people have wanted DMA API improvements for ages, now we have them,
now is the time!

Any remarks after the fact can be addressed incrementally.

If there are no concrete technical remarks please take it. 6 months is
long enough to wait for feedback.

Thanks,
Jason
