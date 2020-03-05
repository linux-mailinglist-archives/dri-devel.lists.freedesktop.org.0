Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 462CB17B7E6
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 09:03:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B9AB6EC78;
	Fri,  6 Mar 2020 08:03:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5AC446E09C
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2020 10:05:12 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C89F331B;
 Thu,  5 Mar 2020 02:05:11 -0800 (PST)
Received: from [10.37.12.115] (unknown [10.37.12.115])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 73E993F6C4;
 Thu,  5 Mar 2020 02:05:07 -0800 (PST)
Subject: Re: [PATCH] drm/exynos: Fix memory leak and release IOMMU mapping
 structures
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
References: <CGME20200304220106eucas1p232aae5af79945664c4586930a9412eda@eucas1p2.samsung.com>
 <20200304220022.8003-1-lukasz.luba@arm.com>
 <684ef9fb-eafb-22d3-40c1-50f596211d85@samsung.com>
From: Lukasz Luba <lukasz.luba@arm.com>
Message-ID: <1044756c-39cf-9fea-4338-40e5a68349a9@arm.com>
Date: Thu, 5 Mar 2020 10:05:03 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <684ef9fb-eafb-22d3-40c1-50f596211d85@samsung.com>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 06 Mar 2020 08:03:01 +0000
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
Cc: jy0922.shim@samsung.com, b.zolnierkie@samsung.com, airlied@linux.ie,
 sw0312.kim@samsung.com, krzk@kernel.org, a.hajda@samsung.com,
 kyungmin.park@samsung.com, kgene@kernel.org, Dietmar.Eggemann@arm.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

On 3/5/20 7:07 AM, Marek Szyprowski wrote:
> Hi Lukasz,
> 
> On 04.03.2020 23:00, Lukasz Luba wrote:
>> There is a memory leak which left some objects not freed. The reference
>> counter of mapping: 'mapping->kref' was 2 when calling
>> arm_iommu_detach_device(), so the release_iommu_mapping() won't be called.
>> Since the old mapping structure is not going to be used any more (because
>> it is detached and new one attached), call arm_iommu_release_mapping()
>> to trigger cleanup.
> 
> This will break IOMMU support in Exynos DRM if deferred probe happens.
> Here is a proper fix:

I forgot about the deferred probe.

> 
> https://patchwork.kernel.org/patch/11415715/
> 
> The mapping initially created by DMA-mapping framework should be
> attached back when Exynos DRM releases the subdev device.
> 

Indeed, as you responded in that thread with the example, there is
more dependencies and attaching back the old mapping will work.

I am going add my reviewed-by to your patch.

Regards,
Lukasz
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
