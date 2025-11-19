Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E26C71171
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 21:54:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D7B710E68E;
	Wed, 19 Nov 2025 20:54:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VIjVDXdy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7D2B10E68E
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 20:54:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2B41D6000A;
 Wed, 19 Nov 2025 20:54:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F01C5C116C6;
 Wed, 19 Nov 2025 20:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763585664;
 bh=mwbqNvwrxL30F0hMKoNOTqnADhQUlj+4wIXlkWHn4Hs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VIjVDXdygEdThL6V5YLCW0xD9Bt9YdcnAcPcnfKFzoBPmHe9+VFePoeh5FMXypqGq
 V+S+LcEu8/NG3zTr4t6hmJUDNKfHgpg/5fKTjiz9WLK0hEzuCyuIhBVoCD4x4HGrUR
 PKeUcvq5/isvXCO/hBigGUthi/F5yOtPdPUa5qTDD1B7rl5YtLMNm+5eCtnIx/tYkK
 azw8wd+f0pUiG5a3AU2PQZjKxBRPnRZSceZC56Fjq2xd1k9ZVCcY0CJsQX1cbjmlTN
 ZYssUYKWJAULk3czXXwVxGWnbZ5TaxSbT8lqrNnJ8A9uIgw3EwVlIC7JZfCZdOkKHp
 VrP+1F9ywf3WQ==
Date: Wed, 19 Nov 2025 22:54:21 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
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
Message-ID: <20251119205421.GP18335@unreal>
References: <20251111-dmabuf-vfio-v8-0-fd9aa5df478f@nvidia.com>
 <20251111-dmabuf-vfio-v8-6-fd9aa5df478f@nvidia.com>
 <8a11b605-6ac7-48ac-8f27-22df7072e4ad@amd.com>
 <20251119132511.GK17968@ziepe.ca>
 <69436b2a-108d-4a5a-8025-c94348b74db6@amd.com>
 <20251119193114.GP17968@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251119193114.GP17968@ziepe.ca>
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

On Wed, Nov 19, 2025 at 03:31:14PM -0400, Jason Gunthorpe wrote:
> On Wed, Nov 19, 2025 at 02:42:18PM +0100, Christian König wrote:

<...>

> So thanks, we can take the Acked-by and progress here. Interested
> parties can pick it up from this point when time allows.

Christian,

Can you please provide explicit Acked-by?

Thanks
