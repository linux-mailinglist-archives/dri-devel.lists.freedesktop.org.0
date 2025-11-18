Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD2EC69F75
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 15:30:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67C0B10E0BF;
	Tue, 18 Nov 2025 14:30:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="FZ46bjpb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7E7B10E4CB
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 14:30:05 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id
 af79cd13be357-8b1e54aefc5so469860885a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 06:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1763476205; x=1764081005; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=gAj/lhLwXUkQIe838UyunLw5D1V/iLtJCJGMnOEEnt8=;
 b=FZ46bjpbLsto2hiO+0P6LMen53HU1j7dnR/yttJNsjdiKTD4JjrutIQNo+HteCbe4T
 RWvIUdMVw4luNk7AKk7knKST3TejnoAVCqh5Ti//Bm4NxEjLSsFU/Lea/6ir/BtumRrs
 Ex9EXyLgMPADgp6SoO7JxcjHak96TNdevqLX7dMLFS4tS0S4Q7maKSpO5laluMOW5MpS
 0mY4ZLwzdeUmQGlK8jcAZskOQE44IvkG4qTFznLrtW2hBIzXtX6V8YTjREK7crtG5TYt
 mnpxLlBkT93u/wV6ifDMT3dDWCXn67GojqwBsyqIT9Nv9uWiwjuOOFzS7drgpLb6saEH
 yA+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763476205; x=1764081005;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gAj/lhLwXUkQIe838UyunLw5D1V/iLtJCJGMnOEEnt8=;
 b=GqDn4yJoaCrHLBldHA29OGI8nHbgVIyUPFN9tB6nUDpbvAbA/ypwk6//mIG97+SMbs
 E67lyajF6KR/an7C12jnV8X0FmuoogJjfv2d9E19LDUAl0Cswwgt6I/xls2ifSewXiLs
 NzXR1PDHQ6e8WnQmjDj3wxfYuclxsIKlmIseYN/hMby5bHMsBtPX0j3fsz4cjL4pL6Sl
 yM6c+eqHEop8yXRcxf8V2Uo1CO1cP+03pMwj4oF/4gmaijc9a1F6vAX8S/r6NKnzPUM4
 ZTThy90rkjgt870ZAYirsP63oDr9skhmRvR+sFKI1dEzzwXDDcgeG+6vucXZjpIjZQDW
 GjfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwGsHBSmYQOj6yOiCjgzxjNFjG6nn9HPhC8+PAT7c7Qsqohr4b6NAjiR5YsbFma8KhxeShPULmRR8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwZs3h/WM7HTgZOxtMpqD90pE4uR3X0D3XaNfE1q0fahpX24qEr
 AKqimL7I/6EmqWVGnI+wLTc3I3WaNW3yCp6fXuZJEgS22VP2FtpHbBnQn/8k0isYOXk=
X-Gm-Gg: ASbGncuajklj6Q/ASDwyw02IB2WVgtYA2J80GRrO0kMkK89rGZ8QPiI0IYfjLRTyRZg
 buU3tQNF7R2W0sfShsD17xWmXQH4fd/6vM0bazx/RsIRZtL2FZmOHPLKM+ecc2ELhGD98ZTSklt
 f+8MgJhkq92bsNUqLAxppCOtFEkH989J4uIOgtMh7svQrO7PCdeOLIQjLTxQ9+CbXg9oUBP/fbW
 iDyyigacO74oeFfafJo0x8mRJt4DP+xkfOYEsPjXGMNCxoK19jc7zxS7CUJmHNWkxeDmQUW+NaT
 b3n05CArZ37mKOUN9dhRpvU+VfmiFnwPfCHlWAyyfMsbTILcghs9tU1CHlBlSRK1rPiBqoBKzKR
 YCF4xlHiS76JLWIJ5Mp+qLd3s1PmqCAd6fvbLPLIEwxwQnrjVx9M0kWn9XArLIKOCBZhnZC0BFO
 NVLkrnLbsXV0l7ueMaeXgy/HD5a1d3armqqzopr1YDoeGyniWKhVQy97TyOSrgiDLHeNY=
X-Google-Smtp-Source: AGHT+IGl2QxjkDkgi5jKGR6lwtLy9hLDUjSd3xhjzd2vh/OGWRtCENW0fUVdt2sQ45uUuO7DIyidjQ==
X-Received: by 2002:a05:622a:4a15:b0:4ed:df82:ca30 with SMTP id
 d75a77b69052e-4edfc875136mr206770331cf.13.1763476204719; 
 Tue, 18 Nov 2025 06:30:04 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.120.4]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-882862d0944sm115395396d6.9.2025.11.18.06.30.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 06:30:04 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1vLMiZ-00000000NFZ-1yj6;
 Tue, 18 Nov 2025 10:30:03 -0400
Date: Tue, 18 Nov 2025 10:30:03 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Ankit Agrawal <ankita@nvidia.com>
Cc: Leon Romanovsky <leon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Logan Gunthorpe <logang@deltatee.com>, Jens Axboe <axboe@kernel.dk>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Yishai Hadas <yishaih@nvidia.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>,
 Kevin Tian <kevin.tian@intel.com>, Alex Williamson <alex@shazbot.org>,
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
 Alex Mastro <amastro@fb.com>, Nicolin Chen <nicolinc@nvidia.com>
Subject: Re: [PATCH v8 11/11] vfio/nvgrace: Support get_dmabuf_phys
Message-ID: <20251118143003.GH17968@ziepe.ca>
References: <20251111-dmabuf-vfio-v8-0-fd9aa5df478f@nvidia.com>
 <20251111-dmabuf-vfio-v8-11-fd9aa5df478f@nvidia.com>
 <SA1PR12MB7199A8A0D17CDC980F819CC6B0D6A@SA1PR12MB7199.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <SA1PR12MB7199A8A0D17CDC980F819CC6B0D6A@SA1PR12MB7199.namprd12.prod.outlook.com>
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

On Tue, Nov 18, 2025 at 07:59:20AM +0000, Ankit Agrawal wrote:
> +       if (nvdev->resmem.memlength && region_index == RESMEM_REGION_INDEX) {
> +               /*
> +                * The P2P properties of the non-BAR memory is the same as the
> +                * BAR memory, so just use the provider for index 0. Someday
> +                * when CXL gets P2P support we could create CXLish providers
> +                * for the non-BAR memory.
> +                */
> +               mem_region = &nvdev->resmem;
> +       } else if (region_index == USEMEM_REGION_INDEX) {
> +               /*
> +                * This is actually cachable memory and isn't treated as P2P in
> +                * the chip. For now we have no way to push cachable memory
> +                * through everything and the Grace HW doesn't care what caching
> +                * attribute is programmed into the SMMU. So use BAR 0.
> +                */
> +               mem_region = &nvdev->usemem;
> +       }
> +
> 
> Can we replace this with nvgrace_gpu_memregion()?

Yes, looks like

But we need to preserve the comments above as well somehow.

Jason
