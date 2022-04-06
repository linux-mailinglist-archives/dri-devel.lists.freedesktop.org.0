Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4474F6893
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 20:07:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A8E010E194;
	Wed,  6 Apr 2022 18:07:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7F07C10E152
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 18:07:03 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0CDC912FC;
 Wed,  6 Apr 2022 11:07:03 -0700 (PDT)
Received: from [10.57.41.19] (unknown [10.57.41.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0A4A23F718;
 Wed,  6 Apr 2022 11:07:01 -0700 (PDT)
Message-ID: <0f7bf1c2-7a21-13a0-8734-c53f624e1edd@arm.com>
Date: Wed, 6 Apr 2022 19:06:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] drm/tegra: Stop using iommu_present()
Content-Language: en-GB
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>, thierry.reding@gmail.com
References: <25247f43672df0aa58c1952bf3df2bf948e9f8ae.1649168393.git.robin.murphy@arm.com>
 <49165024-5f33-b6e6-7ec9-1ede6f562748@collabora.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <49165024-5f33-b6e6-7ec9-1ede6f562748@collabora.com>
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
Cc: linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
 dri-devel@lists.freedesktop.org, jonathanh@nvidia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-04-06 15:32, Dmitry Osipenko wrote:
> On 4/5/22 17:19, Robin Murphy wrote:
>> Remove the pointless check. host1x_drm_wants_iommu() cannot return true
>> unless an IOMMU exists for the host1x platform device, which at the moment
>> means the iommu_present() test could never fail.
>>
>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
>> ---
>>   drivers/gpu/drm/tegra/drm.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
>> index 9464f522e257..bc4321561400 100644
>> --- a/drivers/gpu/drm/tegra/drm.c
>> +++ b/drivers/gpu/drm/tegra/drm.c
>> @@ -1149,7 +1149,7 @@ static int host1x_drm_probe(struct host1x_device *dev)
>>   		goto put;
>>   	}
>>   
>> -	if (host1x_drm_wants_iommu(dev) && iommu_present(&platform_bus_type)) {
>> +	if (host1x_drm_wants_iommu(dev)) {
>>   		tegra->domain = iommu_domain_alloc(&platform_bus_type);
>>   		if (!tegra->domain) {
>>   			err = -ENOMEM;
> 
> host1x_drm_wants_iommu() returns true if there is no IOMMU for the
> host1x platform device of Tegra20/30 SoCs.

Ah, apparently this is another example of what happens when I write 
patches late on a Friday night...

So on second look, what we want to ascertain here is whether dev has an 
IOMMU, but only if the host1x parent is not addressing-limited, either 
because it can also use the IOMMU, or because all possible addresses are 
small enough anyway, right? Are we specifically looking for the host1x 
having a DMA-API-managed domain, or can that also end up using the 
tegra->domain or another unmanaged domain too? I can't quite figure out 
from the comments whether it's physical addresses, IOVAs, or both that 
we're concerned with here.

Thanks,
Robin.
