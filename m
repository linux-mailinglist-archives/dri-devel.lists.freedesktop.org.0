Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEEC63F8F8F
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 22:15:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B76786E8B2;
	Thu, 26 Aug 2021 20:15:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id E69B56E8AF;
 Thu, 26 Aug 2021 20:15:21 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E0BAF106F;
 Thu, 26 Aug 2021 13:15:20 -0700 (PDT)
Received: from [10.57.15.112] (unknown [10.57.15.112])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4A3CE3F5A1;
 Thu, 26 Aug 2021 13:15:19 -0700 (PDT)
Subject: Re: [PATCH 2/3] drm/etnaviv: fix dma configuration of the virtual
 device
To: Lucas Stach <l.stach@pengutronix.de>, Michael Walle <michael@walle.cc>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: "Lukas F . Hartmann" <lukas@mntre.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <20210826121006.685257-1-michael@walle.cc>
 <20210826121006.685257-3-michael@walle.cc>
 <df806090-8a21-33e8-1e01-bd03b6ed64cf@arm.com>
 <b8e3f7c6bec4d01ba05861de6a25c0b7fd432d0a.camel@pengutronix.de>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <01fa99f2-8d19-0cd2-232f-4ba1f3171f24@arm.com>
Date: Thu, 26 Aug 2021 21:15:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <b8e3f7c6bec4d01ba05861de6a25c0b7fd432d0a.camel@pengutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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

On 2021-08-26 16:17, Lucas Stach wrote:
> Am Donnerstag, dem 26.08.2021 um 16:00 +0100 schrieb Robin Murphy:
>> On 2021-08-26 13:10, Michael Walle wrote:
>>> The DMA configuration of the virtual device is inherited from the first
>>> actual etnaviv device. Unfortunately, this doesn't work with an IOMMU:
>>>
>>> [    5.191008] Failed to set up IOMMU for device (null); retaining platform DMA ops
>>>
>>> This is because there is no associated iommu_group with the device. The
>>> group is set in iommu_group_add_device() which is eventually called by
>>> device_add() via the platform bus:
>>>     device_add()
>>>       blocking_notifier_call_chain()
>>>         iommu_bus_notifier()
>>>           iommu_probe_device()
>>>             __iommu_probe_device()
>>>               iommu_group_get_for_dev()
>>>                 iommu_group_add_device()
>>>
>>> Move of_dma_configure() into the probe function, which is called after
>>> device_add(). Normally, the platform code will already call it itself
>>> if .of_node is set. Unfortunately, this isn't the case here.
>>>
>>> Also move the dma mask assignemnts to probe() to keep all DMA related
>>> settings together.
>>
>> I assume the driver must already keep track of the real GPU platform
>> device in order to map registers, request interrupts, etc. correctly -
>> can't it also correctly use that device for DMA API calls and avoid the
>> need for these shenanigans altogether?
>>
> Not without a bigger rework. There's still quite a bit of midlayer
> issues in DRM, where dma-buf imports are dma-mapped and cached via the
> virtual DRM device instead of the real GPU device. Also etnaviv is able
> to coalesce multiple Vivante GPUs in a single system under one virtual
> DRM device, which is used on i.MX6 where the 2D and 3D GPUs are
> separate peripherals, but have the same DMA constraints.

Sure, I wouldn't expect it to be trivial to fix properly, but I wanted 
to point out that this is essentially a hack, relying on an implicit 
side-effect of of_dma_configure() which is already slated for removal. 
As such, I for one am not going to be too sympathetic if it stops 
working in future.

Furthermore, even today it doesn't work in general - it might be OK for 
LS1028A with a single GPU block behind an SMMU, but as soon as you have 
multiple GPU blocks with distinct SMMU StreamIDs, or behind different 
IOMMU instances, then you're stuffed again.

Although in fact I think it's also broken even for LS1028A, since AFAICS 
there's no guarantee that the relevant SMMU instance will actually be 
probed, or the SMMU driver even loaded, when etnaviv_pdev_probe() runs.

> Effectively we would need to handle N devices for the dma-mapping in a
> lot of places instead of only dealing with the one virtual DRM device.
> It would probably be the right thing to anyways, but it's not something
> that can be changed short-term. I'm also not yet sure about the
> performance implications, as we might run into some cache maintenance
> bottlenecks if we dma synchronize buffers to multiple real device
> instead of doing it a single time with the virtual DRM device. I know,
> I know, this has a lot of assumptions baked in that could fall apart if
> someone builds a SoC with multiple Vivante GPUs that have differing DMA
> constraints, but up until now hardware designers have not been *that*
> crazy, fortunately.

I'm not too familiar with the component stuff, but would it be viable to 
just have etnaviv_gpu_platform_probe() set up the first GPU which comes 
along as the master component and fundamental DRM device, then treat any 
subsequent ones as subcomponents as before? That would at least stand to 
be more robust in terms of obviating the of_dma_configure() hack (only 
actual bus code should ever be calling that), even if it won't do 
anything for the multiple IOMMU mapping or differing DMA constraints 
problems.

Thanks,
Robin.
