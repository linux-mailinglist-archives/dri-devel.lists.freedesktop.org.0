Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F52C8D4343
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 04:01:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E20C110E07F;
	Thu, 30 May 2024 02:01:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eQloIB07";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7E3E10E236
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 02:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717034475; x=1748570475;
 h=message-id:date:mime-version:cc:subject:to:references:
 from:in-reply-to:content-transfer-encoding;
 bh=z8p2Fbv7q51FsTbE9Q6ou8CNMBaz3vo4l9U9rPdC/fQ=;
 b=eQloIB07xk7bWidVKWBLmJKM+f7L8p5yH0sPXC0AsUkN0d0XhcjQmDBL
 CAmEoaz5WAv0KfE1sceese5arqQZvd8hlG+H85R4fhtggMqS2xFVlicBK
 lNfsIoHRbqsL0qkklC3xfOUxpJmQLES4itvdrbpUTOk6U5g9TomNoB4Ji
 YmyOYTup+0fY0n1fLD403SYelfL/xUe1u7s34dE4kUp6SJ2ciPDAxb9VH
 wcT4Jwgzc+hI6nq7Qygh2X4srf0xPmnlqO1wtSHq1rURUuQqnx+UbieLU
 9Vkfdmj/eUnBf5q88B0uPxNWbMC62zrF4xyMWx+JfFPRqiiYrn7+daJfV A==;
X-CSE-ConnectionGUID: msLL5t/2Txm9KHoTma4S2w==
X-CSE-MsgGUID: jFGoNHZlThG5y2iro+65xQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="13604240"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="13604240"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 19:01:15 -0700
X-CSE-ConnectionGUID: TQJC9/b/QlCc2uUz6FLNVg==
X-CSE-MsgGUID: bbMexaIEQZisW9zr+4pHDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="35737900"
Received: from unknown (HELO [10.239.159.127]) ([10.239.159.127])
 by fmviesa010.fm.intel.com with ESMTP; 29 May 2024 19:01:11 -0700
Message-ID: <dc9fa861-628f-4a96-ae37-e419b23c6ea0@linux.intel.com>
Date: Thu, 30 May 2024 09:59:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: baolu.lu@linux.intel.com, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Kalle Valo <kvalo@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>, mst@redhat.com,
 Jason Wang <jasowang@redhat.com>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, iommu@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/20] iommu: Add iommu_paging_domain_alloc() interface
To: Yi Liu <yi.l.liu@intel.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>
References: <20240529053250.91284-1-baolu.lu@linux.intel.com>
 <20240529053250.91284-6-baolu.lu@linux.intel.com>
 <eedb1df0-e745-4b48-9261-faa0ff320ee9@intel.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <eedb1df0-e745-4b48-9261-faa0ff320ee9@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/29/24 5:04 PM, Yi Liu wrote:
> On 2024/5/29 13:32, Lu Baolu wrote:
>> Commit <17de3f5fdd35> ("iommu: Retire bus ops") removes iommu ops from
>> bus. The iommu subsystem no longer relies on bus for operations. So the
>> bus parameter in iommu_domain_alloc() is no longer relevant.
>>
>> Add a new interface named iommu_paging_domain_alloc(), which explicitly
>> indicates the allocation of a paging domain for DMA managed by a kernel
>> driver. The new interface takes a device pointer as its parameter, that
>> better aligns with the current iommu subsystem.
> 
> you may want to move this patch before patch 03/04.

Emm, why?

Best regards,
baolu
