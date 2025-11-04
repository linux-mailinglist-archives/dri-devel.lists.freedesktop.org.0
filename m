Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2574DC32C56
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 20:26:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FA9E10E32A;
	Tue,  4 Nov 2025 19:26:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="DlPZ1Hzi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0C2F10E32A
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 19:26:18 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id
 af79cd13be357-88f2aebce7fso648613285a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Nov 2025 11:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1762284378; x=1762889178; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=b3vZ52GkNsJGLOkvon3L18RWVKcEn1c510aPuA199YI=;
 b=DlPZ1HziKX/eip8RuxEzt5JNKOgrbJGm1Ip9y9GxNizyL+MMxnlKHtmFrC9kBAVqDX
 Pcvg77FgcGBEw6XKjHA3xohG3pcZGoLjS8ZYivItAPXQ3EWUlVSooBHce/SGxQqUoQ/N
 huINx5kw4jE/Wwh6R4i6yt8O1menbVHUb4gI89w6PCFqZqpyQKWr2NLQz3UaPkknbzSn
 qbxDvTzrEt7uPqd6YuH7Dd0MsiyvK6z3j7gb3nJCcS7fMyPe8JnxwrUzKyD6fV7tFBZS
 /FErcs95Ljurv6vHbK5xUEr5s96w0lDmwsqDaDBNj8bWAunP4kxhsaN0EJChsMIfy2AN
 HGFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762284378; x=1762889178;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b3vZ52GkNsJGLOkvon3L18RWVKcEn1c510aPuA199YI=;
 b=X0+yCfW9R58a7IsKoDzQ+458d1vBto3jKW6uTPl5QafiC20mNP0xgbr4SOkJUNQwqN
 zkBShRl6Pzl6Ik/3GdshbWT1xrYOyUsUeFY6/vSTsMYDqVQqanZRvAjdG8JT1BFccqG9
 1wExsRqd2t3GahYoZgu56I2SfRXhNfd4aCRyoETMzALmvFcuW4EaHAHjUMJdNAdPorLP
 wQP0jOgoaDeHjA3onbZSuBTEoYQJ4dD3SqgT6GglT+prrDJTWZGzUZ5aYMf3+ntgDBzw
 NWkBGZ8KyKrkbEQ/PEWCsbetag2lwLKxjL98wMTKdmalVWqqp812f7ZhCrVXdS17y670
 Nb/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4fFmyvK15SxhcmhRRZkYRyMRhUgy2YosfNf7kMTvnnXMygPjQGVMXjlgZ9N34BEAeLtDIdVdUdc8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxrSZ7pnwUnCe00WedB0djxUVyIS2krsz+KUVNR43rfVHGt6Ngu
 svjAlrVe5ajuGPQVWBqG+xnkmB4YMulzIB6mZ976/FFc6EtRn8pD5C2e/HnMoMNiS9Y=
X-Gm-Gg: ASbGncsHGIznPu9I8N6o+TP50eTiiYeAOiVsb5LQaYyxw992JX3C5ZztK2P3f6vLHAS
 ytsJdbWK2LEbjxcD/BrXMhNc7t1ahPzyTpAclq1fzzrIbWG2P4c/AEUC9a3xTMwc6t0S4PGO3TS
 PfAlRROmgpjzGG58ZOL2aA/Qcypc9dSu3ihhGqfvSVCVuGwxOa/o8xoY7uGm1g7u6Gltx+3PbkX
 RbnuLA8smqiccQ6wBt1KvDtr0kNJtUoDSTDGT+wk1LihlHdhj5vFXanANWlkF2tTMo0UGmqPcgC
 WXvQLVXn+kTBRq27Uh+nQFRk+FGHPRu7jDihM1f8zAigmAoepn7YogR9kPClqaM+v6wKdgQY28T
 QpwPAT8ToVZIGVitDdo0DDiUwJIQv8WAfLm34G8oUbJO+kh2+lfmnESZYv3DNtFPSj1Lym27TcB
 t5Oe3OgEogm384zeHkTTFXiB/Ujch/eaKWrkziOO3tgdUoKw==
X-Google-Smtp-Source: AGHT+IFUVGYM+r9VlnujjXwSiyntNScv3JSZn85Gft/uvY+ZvhCxVbalAnSefdp5Rhr2H4+z2gOTFg==
X-Received: by 2002:a05:620a:2a06:b0:86f:aee8:fcbc with SMTP id
 af79cd13be357-8b220b9ef27mr103417385a.79.1762284377655; 
 Tue, 04 Nov 2025 11:26:17 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.120.4]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8b0f7bb3e33sm250495385a.39.2025.11.04.11.26.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Nov 2025 11:26:16 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1vGMfY-000000073Bk-1Ldv;
 Tue, 04 Nov 2025 15:26:16 -0400
Date: Tue, 4 Nov 2025 15:26:16 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Leon Romanovsky <leon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Logan Gunthorpe <logang@deltatee.com>, Jens Axboe <axboe@kernel.dk>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Alex Williamson <alex.williamson@redhat.com>, Kees Cook <kees@kernel.org>,
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
 linux-hardening@vger.kernel.org,
 Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [PATCH v6 00/11] vfio/pci: Allow MMIO regions to be exported
 through dma-buf
Message-ID: <20251104192616.GJ1204670@ziepe.ca>
References: <20251102-dmabuf-vfio-v6-0-d773cff0db9f@nvidia.com>
 <aQpRz74RurfhZK15@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQpRz74RurfhZK15@Asurada-Nvidia>
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

On Tue, Nov 04, 2025 at 11:19:43AM -0800, Nicolin Chen wrote:
> On Sun, Nov 02, 2025 at 10:00:48AM +0200, Leon Romanovsky wrote:
> > Changelog:
> > v6:
> >  * Fixed wrong error check from pcim_p2pdma_init().
> >  * Documented pcim_p2pdma_provider() function.
> >  * Improved commit messages.
> >  * Added VFIO DMA-BUF selftest.
> >  * Added __counted_by(nr_ranges) annotation to struct vfio_device_feature_dma_buf.
> >  * Fixed error unwind when dma_buf_fd() fails.
> >  * Document latest changes to p2pmem.
> >  * Removed EXPORT_SYMBOL_GPL from pci_p2pdma_map_type.
> >  * Moved DMA mapping logic to DMA-BUF.
> >  * Removed types patch to avoid dependencies between subsystems.
> >  * Moved vfio_pci_dma_buf_move() in err_undo block.
> >  * Added nvgrace patch.
> 
> I have verified this v6 using Jason's iommufd dmabuf branch:
> https://github.com/jgunthorpe/linux/commits/iommufd_dmabuf/
> 
> by drafting a QEMU patch on top of Shameer's vSMMU v5 series:
> https://github.com/nicolinc/qemu/commits/wip/iommufd_dmabuf/
> 
> with that, I see GPU BAR memory be correctly fetched in the QEMU:
> vfio_region_dmabuf Device 0009:01:00.0, region "0009:01:00.0 BAR 0", offset: 0x0, size: 0x1000000
> vfio_region_dmabuf Device 0009:01:00.0, region "0009:01:00.0 BAR 2", offset: 0x0, size: 0x44f00000
> vfio_region_dmabuf Device 0009:01:00.0, region "0009:01:00.0 BAR 4", offset: 0x0, size: 0x17a0000000

Great thanks! This means we finally have a solution to that follow_pfn
lifetime problem in type 1! What a long journey :)

For those following along this same flow will be used with KVM to
allow it to map VFIO as well. Confidential Compute will require this
because some arches can't put confidential MMIO (or RAM) into a VMA.

Jason
