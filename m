Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A62C6BECC
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 00:03:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4966D10E54F;
	Tue, 18 Nov 2025 23:02:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="eopravqT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F7DA10E54C
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 23:02:56 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id
 af79cd13be357-8b2ed01ba15so233887185a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 15:02:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1763506975; x=1764111775; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=V9774m00qC+l22EqhxH404c/5WuwECoHlv+7tMAloKg=;
 b=eopravqTpAefVWPlx39ZKeOFeeqgGvr1nkAI8QHU38qYWIgcQ4vNSJ51Y/Au4ildHd
 ZzU0e3nnSFiudBqwbXOjHrZaLMyAszBjTh5ltNP7OaARxzul6xWvDiqZNKXuxbv5k5/d
 alSb/a8V03Pl8Z8s4jYZL3PEMIVUazJmYqKb3mKzFORmEBiLByKpjx/DfGq0B9xQtijv
 xklKSp+p6bKKOeSOCLoDSyJ15M1SsmA+Alvu4lo+slzIY1KahuxcLMa/kD1KP0dx7xj+
 YwupTGRuAVe2+0jxO7IbzSmChHW+iA4N6y28aO4Y1GHM0ZfEG/2crYpAuizyTCvDEu7Q
 /KhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763506975; x=1764111775;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V9774m00qC+l22EqhxH404c/5WuwECoHlv+7tMAloKg=;
 b=mTqV0XSusVNo96TYlMVAXP9ccRQRDnnxaakN8iDUy8APO5SOFp3qUbOsM+0vSmRYn6
 0ByZduLpR9OFC0gF4GrvPE6swqZWcYPWgs1SC3s0V1KzjKMYXSWCPaZOaAnYBzvWhHx3
 Dt2qJWOBH0ygvZFqVqx1jWHOiSoNDP1nCQ8ufmyZM3i9GyRRdR3q9mI2yHq1hXRjDWOo
 RIdk+CXGrxaddHLTUhqOslh7+Amzdc6tEVlerfHfIW0ROnzCcKNwCv/lTPKpv47ajcFi
 1Km7eF2o2Pa8IlHTUeerSCsWinVSDUQG6bZfSBjuRExp66O7zpTTEGR4lOhe2kbBwYe8
 iC1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQVmSwhYNqrE7+wykHdtIUUL2C9DlhsrMqdav9bDMkFqE5EOU9DOfskrtJ7TpucF9adHV4bep/aPg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxnoixFpdzaqNDnCg2EHG1eRXLiiNz7i09S4gbw7jgMBf7lHLSi
 R8F9A3MaOPY+j+mfmI7k9wePT3aaoIbmgHKynj0XoghdsFB6efAXdMjla7bPqZAoH2A=
X-Gm-Gg: ASbGncv+Ac2Wt+R/45q22L1bn5mcOAkQWXPQC6wyKx5EyiuzK063eBkZumoDJ1qB6Z1
 Z5sgSqpxo+rPrZC2VcC6+i0dsrPsPBxPL+D+ACNK+VLdAICSPOtVVchtVeHEQYEZS6U7nfdeApC
 aR6/VbjdqKBxjgtSlVVzrDiN+HT8i2ZHY0DoCPmFvxDOZIpP7AewAeIF5uLq9gicXwEKy+CElqj
 RmdUXyMkqbUye0ncSn4H3EFp3VWm+STsLE0RZqCTpluJoAqHtWQtzUknsjf/qFmPuYuGRAihrGE
 kySCPDdBpbi6QTBTSN8vuZD7pkImBL5US9Ekvr6qt/mUdG+GelLtKieJc7nkgISUfbORf2Pk9Kq
 UO+wzFAXVDS5ZG8/BKbHcGU2DB6xH6wWLdOp+b6x+/TvHqWCvMIdiMHuo/7D6i8/Z/PfmW+tlcg
 byVNu8paQwnYQMhRMsS+ltm0tEArz+gS0eGkgVDhmNxPfYA+QxYbgkEDtz
X-Google-Smtp-Source: AGHT+IE7qxNdGTB3O4Cyd9l/l5kqP+7hVSaobWOJQOGThUG/TNMz01RlkEIy242KlmPT6y0A+36Y2Q==
X-Received: by 2002:a05:620a:4454:b0:8b2:eab0:629a with SMTP id
 af79cd13be357-8b2eab06506mr1265910785a.70.1763506975311; 
 Tue, 18 Nov 2025 15:02:55 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.120.4]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8b2da3e4cf4sm883665285a.10.2025.11.18.15.02.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 15:02:54 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1vLUiq-00000000W6g-43N6;
 Tue, 18 Nov 2025 19:02:52 -0400
Date: Tue, 18 Nov 2025 19:02:52 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
 Logan Gunthorpe <logang@deltatee.com>, Jens Axboe <axboe@kernel.dk>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
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
 linux-hardening@vger.kernel.org, Alex Mastro <amastro@fb.com>,
 Nicolin Chen <nicolinc@nvidia.com>
Subject: Re: [PATCH v8 06/11] dma-buf: provide phys_vec to scatter-gather
 mapping routine
Message-ID: <20251118230252.GJ17968@ziepe.ca>
References: <20251111-dmabuf-vfio-v8-0-fd9aa5df478f@nvidia.com>
 <20251111-dmabuf-vfio-v8-6-fd9aa5df478f@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251111-dmabuf-vfio-v8-6-fd9aa5df478f@nvidia.com>
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

On Tue, Nov 11, 2025 at 11:57:48AM +0200, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> Add dma_buf_map() and dma_buf_unmap() helpers to convert an array of
> MMIO physical address ranges into scatter-gather tables with proper
> DMA mapping.
> 
> These common functions are a starting point and support any PCI
> drivers creating mappings from their BAR's MMIO addresses. VFIO is one
> case, as shortly will be RDMA. We can review existing DRM drivers to
> refactor them separately. We hope this will evolve into routines to
> help common DRM that include mixed CPU and MMIO mappings.
> 
> Compared to the dma_map_resource() abuse this implementation handles
> the complicated PCI P2P scenarios properly, especially when an IOMMU
> is enabled:
> 
>  - Direct bus address mapping without IOVA allocation for
>    PCI_P2PDMA_MAP_BUS_ADDR, using pci_p2pdma_bus_addr_map(). This
>    happens if the IOMMU is enabled but the PCIe switch ACS flags allow
>    transactions to avoid the host bridge.
> 
>    Further, this handles the slightly obscure, case of MMIO with a
>    phys_addr_t that is different from the physical BAR programming
>    (bus offset). The phys_addr_t is converted to a dma_addr_t and
>    accommodates this effect. This enables certain real systems to
>    work, especially on ARM platforms.
> 
>  - Mapping through host bridge with IOVA allocation and DMA_ATTR_MMIO
>    attribute for MMIO memory regions (PCI_P2PDMA_MAP_THRU_HOST_BRIDGE).
>    This happens when the IOMMU is enabled and the ACS flags are forcing
>    all traffic to the IOMMU - ie for virtualization systems.
> 
>  - Cases where P2P is not supported through the host bridge/CPU. The
>    P2P subsystem is the proper place to detect this and block it.
> 
> Helper functions fill_sg_entry() and calc_sg_nents() handle the
> scatter-gather table construction, splitting large regions into
> UINT_MAX-sized chunks to fit within sg->length field limits.
> 
> Since the physical address based DMA API forbids use of the CPU list
> of the scatterlist this will produce a mangled scatterlist that has
> a fully zero-length and NULL'd CPU list. The list is 0 length,
> all the struct page pointers are NULL and zero sized. This is stronger
> and more robust than the existing mangle_sg_table() technique. It is
> a future project to migrate DMABUF as a subsystem away from using
> scatterlist for this data structure.
> 
> Tested-by: Alex Mastro <amastro@fb.com>
> Tested-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
>  drivers/dma-buf/dma-buf.c | 235 ++++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/dma-buf.h   |  18 ++++
>  2 files changed, 253 insertions(+)

I've looked at this enough times now, the logic for DMA mapping and
the construction of the scatterlist is good:

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
