Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DA067B078
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 11:59:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D86210E789;
	Wed, 25 Jan 2023 10:59:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9EAB910E0DF;
 Wed, 25 Jan 2023 10:59:30 +0000 (UTC)
Received: from 8bytes.org
 (p200300c27714bc0086ad4f9d2505dd0d.dip0.t-ipconnect.de
 [IPv6:2003:c2:7714:bc00:86ad:4f9d:2505:dd0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPSA id EA1A7262E65;
 Wed, 25 Jan 2023 11:59:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
 s=default; t=1674644369;
 bh=T38KYBmqOO/YysbFxidRcHI2EqxeKT2mSwZbXhYqf1E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=xjLIYBe2Reb4sUbyDIO/QWp7US6P8C31V+nRPiKC12bUvIf7ZM2sEz6rexMly82MG
 SdqC2ipNyx624847dznAPsTr5JegX+avBcrYfRuhpCCtUCj00j5UMMKFv2s5yqcp78
 M0y7wdWzVXQ3svUwvlcuJMoxQJuspChvYRhYbBD4VgYfSxytDzzifVhHBhI3LbACxs
 T3fe0NZnfc4OI4+mzTVEq4TCO9vBUsWz4/KYFySgVFLjFM48o+FEL/Pas2FYAxM+s5
 h6WCzD311EPYK4UyWDMAMAz7XrOhVE163Ksfw3L/LtMiYeejlNUntipX85M2JSVOt+
 8KBgiGtflHGcg==
Date: Wed, 25 Jan 2023 11:59:27 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v3 00/10] Let iommufd charge IOPTE allocations to the
 memory cgroup
Message-ID: <Y9ELj1yKsE58mlgi@8bytes.org>
References: <0-v3-76b587fe28df+6e3-iommu_map_gfp_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0-v3-76b587fe28df+6e3-iommu_map_gfp_jgg@nvidia.com>
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
Cc: kvm@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-remoteproc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-s390@vger.kernel.org,
 Matthew Rosato <mjrosato@linux.ibm.com>, linux-rdma@vger.kernel.org,
 ath10k@lists.infradead.org, iommu@lists.linux.dev,
 Christian Borntraeger <borntraeger@linux.ibm.com>, ath11k@lists.infradead.org,
 linux-media@vger.kernel.org, Kevin Tian <kevin.tian@intel.com>,
 Niklas Schnelle <schnelle@linux.ibm.com>, linux-arm-msm@vger.kernel.org,
 Alex Williamson <alex.williamson@redhat.com>, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 23, 2023 at 04:35:53PM -0400, Jason Gunthorpe wrote:
> Jason Gunthorpe (10):
>   iommu: Add a gfp parameter to iommu_map()
>   iommu: Remove iommu_map_atomic()
>   iommu: Add a gfp parameter to iommu_map_sg()
>   iommu/dma: Use the gfp parameter in __iommu_dma_alloc_noncontiguous()
>   iommufd: Use GFP_KERNEL_ACCOUNT for iommu_map()
>   iommu/intel: Add a gfp parameter to alloc_pgtable_page()
>   iommu/intel: Support the gfp argument to the map_pages op
>   iommu/intel: Use GFP_KERNEL in sleepable contexts
>   iommu/s390: Push the gfp parameter to the kmem_cache_alloc()'s
>   iommu/s390: Use GFP_KERNEL in sleepable contexts

Merged into branch iommu-memory-accounting and merged that branch into
core.

The merge commit contains your cover-letter descriptions. Given all
tests pass I will push it out later today.

Regards,

	Joerg
