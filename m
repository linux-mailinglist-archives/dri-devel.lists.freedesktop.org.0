Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 742088FA74C
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 03:05:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 246A510E144;
	Tue,  4 Jun 2024 01:05:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G89tGdnv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50B1410E144
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2024 01:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717463099; x=1748999099;
 h=message-id:date:mime-version:cc:subject:to:references:
 from:in-reply-to:content-transfer-encoding;
 bh=P8eBB5Cc87RKZAf0H78uJjnNtiqeWTjcR7eQmw+/CFE=;
 b=G89tGdnvKkjrw1wT5Zi2yHImxJuF9c3Ulokfu5rAoiPNvOMNMXt5js1J
 cG3MuOPt1DZD45xkjrRFWC/HqHxSREgNGoJpbvmNusi6Z9vj/5d0Mw1Wa
 e1Q/SVGKRqFQXRoqJDQv6FALbwZ/jcJcYEryvK68A+ewfo/GJuPzIovMU
 JBAxQ2jUxv7KXxhJ9TgYeMK5lchQ9QTKKv0F0KsgBx38kvSjCo44oAZhz
 NqRfoEZhFHkbDeeRcONOu2bexVljBk2roWHjYLqKdJzZvjJSemllzv1MC
 Xz/vruUhyL906v0Ci6arlEjbUIb3cvfuUrTc7ByzTc6JffFWEGnF4LpVW A==;
X-CSE-ConnectionGUID: kSSvShmGSbG54s3rLllgQA==
X-CSE-MsgGUID: wq2KgOa/RbuhdW5pnrgGrw==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="24562725"
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; d="scan'208";a="24562725"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 18:04:58 -0700
X-CSE-ConnectionGUID: qKwXtPxHQDygtcPp8UG2/A==
X-CSE-MsgGUID: SRYksvRpTWSuBkLTIBhSlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; d="scan'208";a="67883645"
Received: from unknown (HELO [10.239.159.127]) ([10.239.159.127])
 by orviesa002.jf.intel.com with ESMTP; 03 Jun 2024 18:04:54 -0700
Message-ID: <05211393-84dd-4a59-b627-1fc5ab9b1b3d@linux.intel.com>
Date: Tue, 4 Jun 2024 09:02:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: baolu.lu@linux.intel.com, Yi Liu <yi.l.liu@intel.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Kevin Tian <kevin.tian@intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Kalle Valo <kvalo@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>, mst@redhat.com,
 Jason Wang <jasowang@redhat.com>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, iommu@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/20] iommu: Refactoring domain allocation interface
To: Jason Gunthorpe <jgg@ziepe.ca>
References: <20240529053250.91284-1-baolu.lu@linux.intel.com>
 <efd902f6-eafc-4a26-8057-bdd9d7d6e535@intel.com>
 <a1f2c08a-e92f-4080-b55e-8d6dbd94db78@linux.intel.com>
 <20240603133550.GA21513@ziepe.ca>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <20240603133550.GA21513@ziepe.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 6/3/24 9:35 PM, Jason Gunthorpe wrote:
> On Wed, May 29, 2024 at 08:02:12PM +0800, Baolu Lu wrote:
>>>> drivers/infiniband/hw/usnic/usnic_uiom.c:       pd->domain = domain
>>>> = iommu_domain_alloc(dev->bus);
>>>>
>>>> This series leave those cases unchanged and keep iommu_domain_alloc()
>>>> for their usage. But new drivers should not use it anymore.
>>>
>>> does it mean there is still domains allocated via iommu_domain_alloc()
>>> on VT-d platform?
>>
>> I think the drivers mentioned above do not run on x86 platforms, or do
>> they?
> 
> usnic does.. What was preventing converting it?

Nothing, just because it wasn't that obvious. :-) I will convert it in
the next version.

Best regards,
baolu
