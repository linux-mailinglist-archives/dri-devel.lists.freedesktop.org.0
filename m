Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4A7606078
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 14:42:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 330E810E8CB;
	Thu, 20 Oct 2022 12:42:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3BE4610EB66
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 12:42:37 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B814AED1;
 Thu, 20 Oct 2022 05:42:42 -0700 (PDT)
Received: from [10.57.5.187] (unknown [10.57.5.187])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6F37B3F67D;
 Thu, 20 Oct 2022 05:42:35 -0700 (PDT)
Message-ID: <493de78c-fce5-231b-20d3-6c5c6f53d51e@arm.com>
Date: Thu, 20 Oct 2022 13:42:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH] gpu: host1x: Avoid trying to use GART on Tegra20
Content-Language: en-GB
To: Jon Hunter <jonathanh@nvidia.com>, thierry.reding@gmail.com
References: <ee0278cae0443d4ff407d6db38f4d9b33d477e8f.1666200021.git.robin.murphy@arm.com>
 <9b79d517-f242-6619-5f13-eee65f01c57a@nvidia.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <9b79d517-f242-6619-5f13-eee65f01c57a@nvidia.com>
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
Cc: linux-tegra@vger.kernel.org, iommu@lists.linux.dev,
 Dmitry Osipenko <digetx@gmail.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-10-20 13:25, Jon Hunter wrote:
> Hi Robin,
> 
> On 19/10/2022 18:23, Robin Murphy wrote:
>> Since commit c7e3ca515e78 ("iommu/tegra: gart: Do not register with
>> bus") quite some time ago, the GART driver has effectively disabled
>> itself to avoid issues with the GPU driver expecting it to work in ways
>> that it doesn't. As of commit 57365a04c921 ("iommu: Move bus setup to
>> IOMMU device registration") that bodge no longer works, but really the
>> GPU driver should be responsible for its own behaviour anyway. Make the
>> workaround explicit.
>>
>> Reported-by: Jon Hunter <jonathanh@nvidia.com>
>> Suggested-by: Dmitry Osipenko <digetx@gmail.com>
>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
>> ---
>>   drivers/gpu/host1x/dev.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
>> index a13fd9441edc..1cae8eea92cf 100644
>> --- a/drivers/gpu/host1x/dev.c
>> +++ b/drivers/gpu/host1x/dev.c
>> @@ -352,6 +352,10 @@ static struct iommu_domain 
>> *host1x_iommu_attach(struct host1x *host)
>>       if (!host1x_wants_iommu(host) || domain)
>>           return domain;
>> +    /* Our IOMMU usage policy doesn't currently play well with GART */
>> +    if (of_machine_is_compatible("nvidia,tegra20"))
>> +        return NULL;
>> +
>>       host->group = iommu_group_get(host->dev);
>>       if (host->group) {
>>           struct iommu_domain_geometry *geometry;
> 
> 
> Thanks for sending. I gave this a quick test, but I still see ...
> 
> [    2.901739] tegra-gr2d 54140000.gr2d: failed to attach to domain: -19
> [    2.908373] drm drm: failed to initialize 54140000.gr2d: -19

Urgh, of course it's the same-but-different logic in host1x_drm_probe() 
that matters for that one. Am I allowed to mention how much these 
drivers drive me to despair?

v2 coming soon...

Thanks,
Robin.
