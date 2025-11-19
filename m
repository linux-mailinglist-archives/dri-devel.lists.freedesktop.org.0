Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C85C70E00
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 20:45:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 392BC10E089;
	Wed, 19 Nov 2025 19:45:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="KHQmQR5Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D8C310E089
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 19:45:09 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id
 af79cd13be357-8b2ea5a44a9so13057885a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 11:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1763581508; x=1764186308; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ngigizqFoW1/n7l/UtYTJcb/TxX1OBEkHcoOUDKA/VA=;
 b=KHQmQR5ZgQ8lD4FvaH/VPcWbkbFqP/GVQvvXW0pd3e07JxA+OebvqDkXqkUr9kI0iI
 rYuKl2h7BeqUKHVjLndoBaFxKZAdDqakbF6gNPAlGOby20OLAuL2PCJ1zDjPzzrTADEU
 tZxKUxEAoJ3cUgceNf78UU+OpIDomuJpz9x5elUFNRWxz+DfNJ+MT3gOouXLZvgKivbx
 kqFitpXpEavHVcxXvKl3XDdVMCIjYKuQiY1AgSP1hEMz1soXl5jz/bUgyvTct19a33/N
 PJnaN8hT3OOwi81VH5Zg72sh97hiS7OJBMWy5cIDesd0ov3Nv0UpSjIZpKCiANEdhliU
 1tMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763581508; x=1764186308;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ngigizqFoW1/n7l/UtYTJcb/TxX1OBEkHcoOUDKA/VA=;
 b=mr3beNMd2pJ8QhBHaF5hGKvalcYepUDOB24/dy18/n49AEjnRpJ3/F65Pn4ogWpsMG
 c2Es836arG8Jb1Q+zcPJ0oSSOiwOZAPxh/FsUhPWya9beld5778SYjRtpE0SjvcOLz6z
 W+U/eEWVEXTAk6HOUgWNAKO0WFuzESUilyC0T3rsDeD/HX107KxStWYfztq0QBS57y3x
 rWO8MkpwgP2tEKGQ3GJF8tbv/VFKP/Yf+O5uR3O31c+AvVIBbFg8b2B/jQUInNyfciLp
 J2XrHaBswMgw7cgEjuCwVxMTeesO9aUOamGCTlrKR/6i2riSJR1D+ORGk7ZwexW9vEO4
 cVLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBbNALO1cujlXaApbMf/JY5uPmrTvlVRxN1XLlLdrZyPOMMgCSkPfDkts4TftmWBA+jZhMi+nyK1k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YySoOOqeDPjO8T+cW0Mx0A3TRU9kzOQo4GCoYOIc53IOuRlH/cb
 aMF/oLuknXo+4cFPijeHG4sudPUhJ82ru32xD8DTYGgXj3DG1PBHW54K8YctQfAjZGk=
X-Gm-Gg: ASbGnctsq/R9kxcNmAZ2cQpSwi+uqQakLa+4ACh/li99r2fDckcrktVwC5QKmH4aS+C
 pVaDsx4uPVwye8WTr0k2SNx0kHwFE+ArRD2LNjYNlIn/v5Er1omlydkeGfM1O5g9Y7gPhXbYkFs
 J7yqGWn61eJXrSAVgYQnZtHruSTsdXaS17uiPkVxoJx65amZNjh0DGf7r8+Xt7a492M6yayrjcL
 hEHSW2O++yugdcLqGNt6mQAPQ34g2sIaTseeVuNJbbd+PwU+jAN+1PnoZKby64okhDY1C59BbrK
 QwtrCmCR1nMP+rwseTBPl4oJeJlsRF+8FaPsu0c5QoQejbSSqehEihlUi56qJAug3eu48YUv8ve
 zvnHvAuySmbGPUNJ9Q54uAksfSG4mfjZPIOAf+RzDchkXq8KMfMKeAn6BAz4/w8pwvixoRl/W1m
 VAemRI2JRLtmhCPoDYqj2Htf3sdxVHUcCxE1tKSf49crzcQxCyqlvc0McX
X-Google-Smtp-Source: AGHT+IHM2All3T5KCtKB0YCjHC7VAw8938Pjcsqc0YyXScERh5oSqA8kZNdUfx1RTYUHZ+fIhtYAoA==
X-Received: by 2002:a05:620a:44d4:b0:893:31da:1028 with SMTP id
 af79cd13be357-8b3274b5313mr86654885a.90.1763581507903; 
 Wed, 19 Nov 2025 11:45:07 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.120.4]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8846e447272sm1944186d6.5.2025.11.19.11.45.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Nov 2025 11:45:07 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1vLo70-00000000bcb-3TE0;
 Wed, 19 Nov 2025 15:45:06 -0400
Date: Wed, 19 Nov 2025 15:45:06 -0400
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
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH v8 05/11] PCI/P2PDMA: Document DMABUF model
Message-ID: <20251119194506.GS17968@ziepe.ca>
References: <20251111-dmabuf-vfio-v8-0-fd9aa5df478f@nvidia.com>
 <20251111-dmabuf-vfio-v8-5-fd9aa5df478f@nvidia.com>
 <9798b34c-618b-4e89-82b0-803bc655c82b@amd.com>
 <20251119133529.GL17968@ziepe.ca>
 <ad36ef4e-a485-4bbf-aaa9-67cd517ca018@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ad36ef4e-a485-4bbf-aaa9-67cd517ca018@amd.com>
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

On Wed, Nov 19, 2025 at 03:06:18PM +0100, Christian König wrote:
> On 11/19/25 14:35, Jason Gunthorpe wrote:
> > On Wed, Nov 19, 2025 at 10:18:08AM +0100, Christian König wrote:
> >>> +As this is not well-defined or well-supported in real HW the kernel defaults to
> >>> +blocking such routing. There is an allow list to allow detecting known-good HW,
> >>> +in which case P2P between any two PCIe devices will be permitted.
> >>
> >> That section sounds not correct to me. 
> > 
> > It is correct in that it describes what the kernel does right now.
> > 
> > See calc_map_type_and_dist(), host_bridge_whitelist(), cpu_supports_p2pdma().
> 
> Well I'm the one who originally suggested that whitelist and the description still doesn't sound correct to me.
> 
> I would write something like "The PCIe specification doesn't define the forwarding of transactions between hierarchy domains...."

Ok

> The previous text was actually much better than this summary since
> now it leaves out the important information where all of this is
> comes from.

Well, IMHO, it doesn't "come from" anywhere, this is all
implementation specific behaviors..

> > ARM SOCs are frequently not supporting even on server CPUs.
>
> IIRC ARM actually has a validation program for this, but I've forgotten the name of it again.

I suspect you mean SBSA, and I know at least one new SBSA approved
chip that doesn't have working P2P through the host bridge.. :(
 
> Randy should know the name of it and I think mentioning the status
> of the vendors here would be a good idea.

I think refer to the kernel code is best for what is currently permitted..

> The documentation makes it sound like DMA-buf is limited to not
> using struct pages and direct I/O, but that is not true.

Okay, I see what you mean, the intention was to be very strong and say
if you are not using struct pages then you must using DMABUF or
something like it to control lifetime. Not to say that was the only
way how DMABUF can be used.

Leon let's try to clarify that a bit more

Jason
