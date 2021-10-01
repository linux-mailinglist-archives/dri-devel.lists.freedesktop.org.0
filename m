Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F7F41F326
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 19:31:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F05566EE63;
	Fri,  1 Oct 2021 17:31:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99C5D6EE6E
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 17:31:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id EA7451F452CD
Date: Fri, 1 Oct 2021 13:31:48 -0400
From: Alyssa Rosenzweig <alyssa@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Joerg Roedel <joro@8bytes.org>, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 1/5] [RFC]iommu: Add a IOMMU_DEVONLY protection flag
Message-ID: <YVdGBLTApSccrr/6@maud>
References: <20211001143427.1564786-1-boris.brezillon@collabora.com>
 <20211001143427.1564786-2-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211001143427.1564786-2-boris.brezillon@collabora.com>
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

> The IOMMU_DEVONLY flag allows the caller to flag a mappings backed by
> device-private buffers. That means other devices or CPUs are not
> expected to access the physical memory region pointed by the mapping,
> and the MMU driver can safely restrict the shareability domain to the
> device itself.
> 
> Will be used by the ARM MMU driver to flag Mali mappings accessed only
> by the GPU as Inner-shareable.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  include/linux/iommu.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index d2f3435e7d17..db14781b522f 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -31,6 +31,13 @@
>   * if the IOMMU page table format is equivalent.
>   */
>  #define IOMMU_PRIV	(1 << 5)
> +/*
> + * Mapping is only accessed by the device behind the iommu. That means other
> + * devices or CPUs are not expected to access this physical memory region,
> + * and the MMU driver can safely restrict the shareability domain to the
> + * device itself.
> + */
> +#define IOMMU_DEVONLY	(1 << 6)
>  
>  struct iommu_ops;
>  struct iommu_group;

This seems totally reasonable to me, but it is well-known that I'm not
on good terms with the iommu subsystem. Let's wait for Robin to NAK :-P
