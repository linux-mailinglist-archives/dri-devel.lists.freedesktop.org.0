Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6306C70D07
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 20:31:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76EC210E25B;
	Wed, 19 Nov 2025 19:31:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="U3DDc5a7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4987710E25B
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 19:31:17 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id
 d75a77b69052e-4ee1e18fb37so1175621cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 11:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1763580676; x=1764185476; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=h7MnLKcAx1SQL4BtR2OdhLpsdZ14wJj1fNMBVXMaHpI=;
 b=U3DDc5a77TVexvxNvc8t5h8TmxXYbGohthIpiWAsiOtPfJbAAuiMnjeB3jUwgIHYBt
 mkVd0WJ8a/Xhles5Zqguo2zaUnf7+FKjXtp3+N7xqy9CrnGdPrvIBzgqgM9wpOCIlRmB
 aiQ5ZD37ZH/ZEhjClmIIv7bq9a07Ge7COafywSNeVloE3fGidBL+QvePGFmNVaHRXvic
 908nj0ZECKblGRH5mULNZ9OlMG6oPciiB5P5AxoZj1niPNzwn1F0wch1LAjHY8gvN+As
 zP3JDin7AZasd0jVggRzIutA+WpGT4dBPRGQy6poTPvHrVrV1ifjBuhGf9sKlKOiQr87
 J5TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763580676; x=1764185476;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=h7MnLKcAx1SQL4BtR2OdhLpsdZ14wJj1fNMBVXMaHpI=;
 b=NpZhl1XQS17tX1XifBxpu5lr60jxxvRlDnGVOEi5RJMYu5COPJ13cWM6t10ZwWCa/k
 NscC/PFlV/VfQZqsgezS973QJa7LfArfXgPqtzbtDaa+Tj2vwMhhlJCyc2ZIUVhi4zMQ
 UdLUaNZodPLB6im3AOs12D8X3Qd+lCdy0vgj8VEJviFuSEyMhLGzx5eE15SiUfVlAPbA
 ffFRoUpiWCQpsKqhup+oaL8SyujRjx6MUNpu82nJCvbjdEjzeG7NbM/c/XEuBuWprO7V
 bQYdrPksUfZHHTagRGM3kmxLiPIOd9PBeLuxO086xb/b62em1HjvGFmrjL3H0mxqWkrT
 9BkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdT45bF49EovrZaXcD+ELLnlP83b4D97qs9irTJSTJJvWgOOgkfCaRWcjgvUwb7fD5iY0Sfhx7Yyg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz5W3CtxXqLfIsFTWnhdHUMNx9MPo8GnniXWv/DN0Sq04fdMzJC
 +aqjvZUNJ9wgXUUzserNjUUWJa5QVzVEJzm3MuDd6Z/A/MtKvQxTcdpo2V8aUNd5oEQ=
X-Gm-Gg: ASbGncveiasoTO9yoFKtBCelbXJEx9L/hAOsxs7yH4lqD+01sPEwRSo+p38lLybX+gt
 YR9dMiO1O0yzWWHDjFOxHiqF/bL/V9laMSg6mboeiBCTFLoAMeOCMxAeOnAkWrAF+nfjrpUTC+L
 6a8lyRgJjf1cu2cIJ/UjsSkBzgtcE/1Tin+Cgbe6i1ZAYyb6RiXDYU/rto/IYFleUMlQVP41xQU
 Bq8Knzl2aQUSiH01dOcr3uwyh4wWnxNL4V9/UF8QguSkIvS8oWknemEeoybtd07Lf0CT8HKZgwl
 iGXwJmtndQyZ7hX4UX/fon5gWLK71HxZGhEkaz4tHGSkCYHeEr81NUPF9V2j7jp49iWkRRsFcwk
 vMf98LAqBt68jSXonNa6tn/8R9Ikq9O2W90bD00Pu8P5Q1Awl0WJmzFxVSYcc4STGigrsu/77XQ
 5aarlaOOPAmycVY5Ibegd9z8UHwqZ5CvN6/bI475U/yMOfR7/1LFMiEyA9m9bVI9+KpFk=
X-Google-Smtp-Source: AGHT+IH0hpvR5twkqRmVGMRtAcrCxesRIOb4Xizv2z5I0TXHRJV8nSPA0Y9PLt873fJAl178vHWixw==
X-Received: by 2002:ac8:7e4c:0:b0:4ee:4a3a:bd18 with SMTP id
 d75a77b69052e-4ee4a3abe64mr1136891cf.76.1763580675980; 
 Wed, 19 Nov 2025 11:31:15 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.120.4]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4ee48e46ed0sm2807721cf.20.2025.11.19.11.31.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Nov 2025 11:31:15 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1vLnta-00000000bWq-3r3x;
 Wed, 19 Nov 2025 15:31:14 -0400
Date: Wed, 19 Nov 2025 15:31:14 -0400
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
Message-ID: <20251119193114.GP17968@ziepe.ca>
References: <20251111-dmabuf-vfio-v8-0-fd9aa5df478f@nvidia.com>
 <20251111-dmabuf-vfio-v8-6-fd9aa5df478f@nvidia.com>
 <8a11b605-6ac7-48ac-8f27-22df7072e4ad@amd.com>
 <20251119132511.GK17968@ziepe.ca>
 <69436b2a-108d-4a5a-8025-c94348b74db6@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <69436b2a-108d-4a5a-8025-c94348b74db6@amd.com>
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

On Wed, Nov 19, 2025 at 02:42:18PM +0100, Christian König wrote:

> >>> +	case PCI_P2PDMA_MAP_THRU_HOST_BRIDGE:
> >>> +		dma->state = kzalloc(sizeof(*dma->state), GFP_KERNEL);
> >>> +		if (!dma->state) {
> >>> +			ret = -ENOMEM;
> >>> +			goto err_free_dma;
> >>> +		}
> >>> +
> >>> +		dma_iova_try_alloc(attach->dev, dma->state, 0, size);
> >>
> >> Oh, that is a clear no-go for the core DMA-buf code.
> >>
> >> It's intentionally up to the exporter how to create the DMA
> >> addresses the importer can work with.
> > 
> > I can't fully understand this remark?
> 
> The exporter should be able to decide if it actually wants to use
> P2P when the transfer has to go through the host bridge (e.g. when
> IOMMU/bridge routing bits are enabled).

Sure, but this is a simplified helper for exporters that don't have
choices where the memory comes from.

I fully expet to see changes to this to support more use cases,
including the one above. We should do those changes along with users
making use of them so we can evaluate what works best.

> But only take that as Acked-by, I would need at least a day (or
> week) of free time to wrap my head around all the technical details
> again. And that is something I won't have before January or even
> later.

Sure, it is alot, and I think DRM community in general should come up
to speed on the new DMA API and how we are pushing to see P2P work
within Linux.

So thanks, we can take the Acked-by and progress here. Interested
parties can pick it up from this point when time allows.

We can also have a mini-community call to give a summary/etc on these
topics.

Thanks,
Jason
