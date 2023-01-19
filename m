Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 223BF6737BE
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 13:00:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17A0110E93A;
	Thu, 19 Jan 2023 12:00:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A68110E061;
 Thu, 19 Jan 2023 12:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674129653; x=1705665653;
 h=message-id:date:mime-version:cc:subject:to:references:
 from:in-reply-to:content-transfer-encoding;
 bh=a0VAKNGfVX7Xb0tncsnGiNJiQB7rZGtxb86sJ68DmJ0=;
 b=eMBmSPsEDMKrHL99mV9lC4DRORcUPu9bVTFjOEtupFxiWvzdgWQNHTbN
 /3bEBEfSk7hN2e+1yCxjgnvFK06PbsBGWwzUGBEuzZo+NWwWNaZrYc9qX
 y5Pod1jLOrz+TojLlBGy+nbc5mZ+upy0M0t4b9zjRMhn0peExivLGmPpd
 v0JZsiBGnLWViB8UM138SPLlwdUg+mMbQiEBb50549RZY/9hi0w7Fgg4i
 80W/FIXl2soo6mK6VV582uC/b2G4nLyW4P3C2MCBmD7TTmEnM2wIXFE3y
 S/ZVdcdKaY1XVXBKohlhyy8vi+x/ROmH+XuSYlFX8Mc5F98XOYn2+oKYN g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="305638208"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; d="scan'208";a="305638208"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 04:00:52 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="692393552"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; d="scan'208";a="692393552"
Received: from blu2-mobl.ccr.corp.intel.com (HELO [10.252.185.248])
 ([10.252.185.248])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 04:00:46 -0800
Message-ID: <4f93e58d-2406-6b29-d546-02f90c4815b8@linux.intel.com>
Date: Thu, 19 Jan 2023 20:00:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 08/10] iommu/intel: Use GFP_KERNEL in sleepable contexts
Content-Language: en-US
To: Jason Gunthorpe <jgg@nvidia.com>, Joerg Roedel <joro@8bytes.org>,
 Kevin Tian <kevin.tian@intel.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Robin Murphy <robin.murphy@arm.com>
References: <8-v2-ce66f632bd0d+484-iommu_map_gfp_jgg@nvidia.com>
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <8-v2-ce66f632bd0d+484-iommu_map_gfp_jgg@nvidia.com>
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
> These contexts are sleepable, so use the proper annotation. The GFP_ATOMIC
> was added mechanically in the prior patches.
> 
> Signed-off-by: Jason Gunthorpe<jgg@nvidia.com>

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

Best regards,
baolu
