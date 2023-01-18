Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC77671A53
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 12:19:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1811010E719;
	Wed, 18 Jan 2023 11:19:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0512710E718
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 11:19:09 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E85DE1477;
 Wed, 18 Jan 2023 03:19:50 -0800 (PST)
Received: from [10.57.77.192] (unknown [10.57.77.192])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0E7A43F445;
 Wed, 18 Jan 2023 03:19:06 -0800 (PST)
Message-ID: <55689951-d9df-3f5e-4edc-23c86259ef2f@arm.com>
Date: Wed, 18 Jan 2023 11:19:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] drm/panfrost: fix GENERIC_ATOMIC64 dependency
Content-Language: en-GB
To: Steven Price <steven.price@arm.com>, Arnd Bergmann <arnd@kernel.org>,
 Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>
References: <20230117164456.1591901-1-arnd@kernel.org>
 <18260f9c-2e2e-1210-7203-ac3b79f7da2a@arm.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <18260f9c-2e2e-1210-7203-ac3b79f7da2a@arm.com>
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
Cc: Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?Q?Adri=c3=a1n_Larumbe?= <adrian.larumbe@collabora.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-01-18 11:09, Steven Price wrote:
> On 17/01/2023 16:44, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>>
>> On ARMv5 and earlier, a randconfig build can still run into
>>
>> WARNING: unmet direct dependencies detected for IOMMU_IO_PGTABLE_LPAE
>>    Depends on [n]: IOMMU_SUPPORT [=y] && (ARM [=y] || ARM64 || COMPILE_TEST [=y]) && !GENERIC_ATOMIC64 [=y]
>>    Selected by [y]:
>>    - DRM_PANFROST [=y] && HAS_IOMEM [=y] && DRM [=y] && (ARM [=y] || ARM64 || COMPILE_TEST [=y] && !GENERIC_ATOMIC64 [=y]) && MMU [=y]
>>
>> Rework the dependencies to always require a working cmpxchg64.
>>
>> Fixes: db594ba3fcf9 ("drm/panfrost: depend on !GENERIC_ATOMIC64 when using COMPILE_TEST")
> 
> Looking at db594ba3fcf9 - it states:
> 
>>      Since panfrost has a 'select' on IOMMU_IO_PGTABLE_LPAE we must depend on
>>      the same set of flags. Otherwise IOMMU_IO_PGTABLE_LPAE will be forced on
>>      even though it cannot build (no support for cmpxchg64).
> 
> And at the time the dependencies on IOMMU_IO_PGTABLE_LPAE were exactly
> these.
> 
> However d286a58bc8f4 ("iommu: Tidy up io-pgtable dependencies")
> (currently in the iommu tree) changed the depends to split the
> !GENERIC_ATOMIC64 out. So we could argue that really that's the commit
> that should be blamed in the fixes line.

Oh bum... indeed this is entirely my fault for forgetting about our one 
"foreign" io-pgtable user in that commit, sorry about that.

> However there's no harm in this being backported further than it
> strictly needs to be, and it's clearly better having the
> !GENERIC_ATOMIC64 split out. So I'll merge this to drm-misc-fixes.

Thanks both!

Robin.

> 
> Reviewed-by: Steven Price <steven.price@arm.com>
> 
> Thanks!
> 
> Steve
> 
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>> ---
>>   drivers/gpu/drm/panfrost/Kconfig | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/panfrost/Kconfig b/drivers/gpu/drm/panfrost/Kconfig
>> index 079600328be1..e6403a9d66ad 100644
>> --- a/drivers/gpu/drm/panfrost/Kconfig
>> +++ b/drivers/gpu/drm/panfrost/Kconfig
>> @@ -3,7 +3,8 @@
>>   config DRM_PANFROST
>>   	tristate "Panfrost (DRM support for ARM Mali Midgard/Bifrost GPUs)"
>>   	depends on DRM
>> -	depends on ARM || ARM64 || (COMPILE_TEST && !GENERIC_ATOMIC64)
>> +	depends on ARM || ARM64 || COMPILE_TEST
>> +	depends on !GENERIC_ATOMIC64    # for IOMMU_IO_PGTABLE_LPAE
>>   	depends on MMU
>>   	select DRM_SCHED
>>   	select IOMMU_SUPPORT
> 
