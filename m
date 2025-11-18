Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03FD9C6A297
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 15:59:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34C5710E4D7;
	Tue, 18 Nov 2025 14:59:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="SNtwVBx9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5094010E4D7
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 14:59:38 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id
 d75a77b69052e-4ed75832448so70335671cf.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 06:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1763477977; x=1764082777; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=6zUAnqwUQ7mMEKfAAq0Pm8CCEggD/qceLgK2oNv/WhY=;
 b=SNtwVBx9R5bwEihzDnwVayeyKFwGVqOR7Wwy8yeaaPX//2BViFRRQrsaSfiuK4bbRi
 v++2yd7jRBFdCaKdAj5mRnXQEL9qybfodCrin2B+vxy1Xm7Tf/SZgnBkmpuyQckrWnlh
 i+bHcY0CSGIQgo33lw1ioGrj+67tO98IQ6gUejsvNE/f5gQ1uYNkDDVJVKqw3ZrpiNWi
 hP9Ol0z+keQZ0qVhw8Kz+C3udpqSjOBfX8MQlO68LcgP0p9xkLtYQ3IroxKDifjqPusd
 JWiyT6ZAAi6/Iw4xvUOnDa6/0O9/MwU58v/4r4g5eNi9l5rnTaqHwIq2z5l6wK5128GH
 KBaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763477977; x=1764082777;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6zUAnqwUQ7mMEKfAAq0Pm8CCEggD/qceLgK2oNv/WhY=;
 b=dr2iSv9JfvaNaGwBwlriGA3ZpPhNULJfoOyVpd1Av67P4D8sGRqVXwknTTCrmxK/vZ
 6qWxsTFP6uZ3ygQsHxPohDVXRXh0MswQzefx7YaySRghrRbtvxM/FyjVftwd8qf2zygY
 VGjr4Jly45lJf5Ck84C5AdB4yBR2LNThsNTz4us7CusgJLfF7Yu9pxouu7DSoEoWkd8v
 fOjslu77SZ6UY0Ddg6d29IR+PmiFNH80lwX0Qpg6a+tzMWRhF64EaG7hkn37Uxa7jM/7
 T8gSTE+LCqOq27K51LlxrYUgoPaauEEEIaWXKwhxZxOUV3w3nKH0WWW+avZtouxweExQ
 iFgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6dQlKtZu0DLTFmUIMwkn/NfNJN3O1CZgnx/3XOlRu3pktOERXgJHH0BvD/MV3nHfFKjuPm7IQ5R4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyxmWaHyQJhXRK0xiZnKw/hf1eJBy17QAZKLdOMqZDfWChuX/XI
 /XNhvY9so/y8U2PyoYtNaEo40Wgp0fkHwROZQ2q3fsMcBb545q6H4U925nM8/F1cQjE=
X-Gm-Gg: ASbGnctBL8I9xvg/ABDq8yaMGv7Nm42yutWEnKYArxTemU0IDAM0HXdy1AXfpadoAxf
 iwmKZWgfFGrkifOVwmK56l0swarQMGnWtNDNrAiN25xTSaXeZWt/y3I8/IY4Wxoo03hjpWhwLmd
 VCFWiJhM99C1me8MxFzTybISUr+u+Hk0g0731g2AUmwIw+X5ufihlNTqsw7H9rhyiUEuwt2tmZ5
 FSwY04l9exFywUhwj+6VK+9l26+15F7dets55c1f0FGQgM65TwydrEroJRaBpnBHpWncDO1plK6
 1iPaGryzG8xTy/JOvB63C8Qex9YSZlh/J/JIBlmZ0i2REdjxaf+poaHIw43ftvYYcyQn2sgGRWb
 TRDJwApyuuX8yQoRAoBc9DAjmPP/Dg/W/jtAmzNMAXpcasMcd9G1lBkxHwyiXwLkfElU3kI39yG
 0tUw1Vgffau3bKyVNtAaYsfR93L6GexhP0IN8swruz15M9MG67TTxqNYjQ58LqYHAVQLw=
X-Google-Smtp-Source: AGHT+IFmOGfhY23WsMGsPUUjQKfSR05e4XRcukJGt61kp9ViFdOBWiVKVUUuzQ+TB82GrGuUAmTsrw==
X-Received: by 2002:a05:622a:1a08:b0:4ee:1563:2829 with SMTP id
 d75a77b69052e-4ee15632a6bmr144570871cf.72.1763477977218; 
 Tue, 18 Nov 2025 06:59:37 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.120.4]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4ee275abad5sm34184941cf.14.2025.11.18.06.59.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 06:59:36 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1vLNB9-00000000NQI-239J;
 Tue, 18 Nov 2025 10:59:35 -0400
Date: Tue, 18 Nov 2025 10:59:35 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Alex Williamson <alex@shazbot.org>, Leon Romanovsky <leon@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
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
Message-ID: <20251118145935.GI17968@ziepe.ca>
References: <20251106-dmabuf-vfio-v7-0-2503bf390699@nvidia.com>
 <20251110134218.5e399b0f.alex@shazbot.org>
 <da399efa-ad5b-4bdc-964d-b6cc4a4fc55d@amd.com>
 <20251117083620.4660081a.alex@shazbot.org>
 <20251117171619.GB17968@ziepe.ca>
 <3599880e-5b50-4bad-949b-0d3b1fb25f3f@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3599880e-5b50-4bad-949b-0d3b1fb25f3f@amd.com>
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

On Tue, Nov 18, 2025 at 03:37:41PM +0100, Christian König wrote:

> Skimming over it my only concern is patch #6 which adds the helper
> to the common DMA-buf code and that in turn would need an in-deep
> review which I currently don't have time for.

I think you should trust Leon on the implementation. He knows what he
is doing here when it comes to the DMA API, since he made all the
patches so far to use it.

Please consider just reviewing the exported function signature:

+struct sg_table *dma_buf_map(struct dma_buf_attachment *attach,
+			     struct p2pdma_provider *provider,
+			     struct dma_buf_phys_vec *phys_vec,
+			     size_t nr_ranges, size_t size,
+			     enum dma_data_direction dir)

If issues are discovered inside the implementation later on then Leon
will be available to fix them.

The code is intended to implement that basic function signature which
can be thought of as dma_map_resource() done correctly for PCI
devices.

> So if we could keep those inside the VFIO driver for now I think
> that should be good to go.

That was several versions ago. Christoph is very strongly against
this, he wants to see the new DMA API used by wrapper functions in
subsytems related to how the subsystem's data structures work rather
than proliferate into drivers. I agree with this, so we need to go in
this direction.

Other options, like put the code in the DMA API area, are also not
going to be agreed because we really don't want this weird DMABUF use
of no-struct page scatterlist to leak out beyond DMABUF.

So, this is the start of a DMA mapping helper API for DMABUF related
data structures, it introduces a simplified mapping entry point for
drivers that only use MMIO.

As I said I expect this API surface to progress as other DRM drivers
are updated (hopefully DRM community will take on this), but there is
nothing wrong with starting by having a basic entry point for a narrow
use case.

Thanks,
Jason
