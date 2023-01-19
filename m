Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8166737AE
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 12:59:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3379410E91E;
	Thu, 19 Jan 2023 11:59:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B525E10E91D;
 Thu, 19 Jan 2023 11:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674129579; x=1705665579;
 h=message-id:date:mime-version:cc:subject:to:references:
 from:in-reply-to:content-transfer-encoding;
 bh=5iljU3ubicNtm4iB5o/W1SF+gNSsJnJBGq8FDgyaBeE=;
 b=nyBQzx/7hPPaIuyVULYmDaVpB8M6VrlCYsttgbfYd94fwm6PbPUgRBRG
 pznr5Nb0K7Uxd01M2kRl8AcJ5Xwxfev1cZyV2EQXMPNE22lGrmzjBZt5J
 /dow7zx4QNK/vu8MazONny6gNshRKbx1ssw7q/Qiky5v10jyuqRKc7D5g
 QLJgXmS0ksg6tC7L0a25MFn6mH3Qp2+CccHBBczwp53RhiKfSlZoE88JF
 neAZF2u+u2vsDqMwzYTQy+k97OzBE8oNi4iZlhEHA6dH91Am5ZuiaycnU
 hALqroSsJqZHgHNC/oTjjBlNJeIvs7qqD+v848iQ9iltFhFfmouzI/9Tp w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="352522355"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; d="scan'208";a="352522355"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 03:59:38 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="833967799"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; d="scan'208";a="833967799"
Received: from blu2-mobl.ccr.corp.intel.com (HELO [10.252.185.248])
 ([10.252.185.248])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 03:59:31 -0800
Message-ID: <54887e93-22a1-496a-838c-ad6a8b4a830f@linux.intel.com>
Date: Thu, 19 Jan 2023 19:59:28 +0800
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
 <e44077a7-e275-4e34-b7ad-3e1382ea974d@linux.intel.com>
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <e44077a7-e275-4e34-b7ad-3e1382ea974d@linux.intel.com>
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

On 2023/1/19 19:57, Baolu Lu wrote:
> On 2023/1/19 2:00, Jason Gunthorpe wrote:
>> Flow it down to alloc_pgtable_page() via pfn_to_dma_pte() and
>> __domain_mapping().
>>
>> Signed-off-by: Jason Gunthorpe<jgg@nvidia.com>
> 
> Irrelevant to this patch, GFP_ATOMIC could be changed to GFP_KERNEL in
> some places. I will follow up further to clean it up.

It has been done in the next patch. Sorry for the noise.

Best regards,
baolu
