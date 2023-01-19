Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE6667379C
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 12:57:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A186E10E912;
	Thu, 19 Jan 2023 11:57:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87BA310E91D;
 Thu, 19 Jan 2023 11:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674129457; x=1705665457;
 h=message-id:date:mime-version:cc:subject:to:references:
 from:in-reply-to:content-transfer-encoding;
 bh=OOSuI8Ptgbyop0bHqYWl6Cev1ihhKUlYoWWsszEriiM=;
 b=Ld6BNIAxy62CgK+XmkZEcn8u2OyXgy38RzLrI62u+91zbhwkJHL7M/DM
 6qLa4Jgtz/ZYP+Kq6YpEvUjCPAccKhRPgDkNEMUtuQ1rTpPjMPUpqZSOl
 DNt12/diIZKjyxD2dc4yRIaL1QpRBiLaX6hnu8SbQNIBFjH1rrwdRn1LD
 MBlcd8hdxlG7g/3OKpiWe3ldRGFLu2P5tdd8q6LxwkUyHbuSrDm9N9P7v
 K2d2G6jP0ZFCd1vgXbBnlCTViTLds66WXqvfckl8b+CmSxRHpP9OXVuZ2
 SAZrKRw+7liKWUHn+GGoVMvS2zZBpLlUpRTF7HhIWG2vCq7bMVBEgnUdw A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="305637394"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; d="scan'208";a="305637394"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 03:57:29 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="692393155"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; d="scan'208";a="692393155"
Received: from blu2-mobl.ccr.corp.intel.com (HELO [10.252.185.248])
 ([10.252.185.248])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 03:57:23 -0800
Message-ID: <e44077a7-e275-4e34-b7ad-3e1382ea974d@linux.intel.com>
Date: Thu, 19 Jan 2023 19:57:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 07/10] iommu/intel: Support the gfp argument to the
 map_pages op
Content-Language: en-US
To: Jason Gunthorpe <jgg@nvidia.com>, Joerg Roedel <joro@8bytes.org>,
 Kevin Tian <kevin.tian@intel.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Robin Murphy <robin.murphy@arm.com>
References: <7-v2-ce66f632bd0d+484-iommu_map_gfp_jgg@nvidia.com>
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <7-v2-ce66f632bd0d+484-iommu_map_gfp_jgg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: linux-s390@vger.kernel.org, linux-media@vger.kernel.org,
 kvm@vger.kernel.org, nouveau@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Niklas Schnelle <schnelle@linux.ibm.com>,
 linux-remoteproc@vger.kernel.org, iommu@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 Alex Williamson <alex.williamson@redhat.com>, netdev@vger.kernel.org,
 ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 linux-tegra@vger.kernel.org, Christian Borntraeger <borntraeger@linux.ibm.com>,
 virtualization@lists.linux-foundation.org, ath11k@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, baolu.lu@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023/1/19 2:00, Jason Gunthorpe wrote:
> Flow it down to alloc_pgtable_page() via pfn_to_dma_pte() and
> __domain_mapping().
> 
> Signed-off-by: Jason Gunthorpe<jgg@nvidia.com>

Irrelevant to this patch, GFP_ATOMIC could be changed to GFP_KERNEL in
some places. I will follow up further to clean it up.

For this patch,

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

Best regards,
baolu
