Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A484F8698
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 19:51:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FE2B10EC03;
	Thu,  7 Apr 2022 17:51:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 769A010EC03
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 17:51:12 +0000 (UTC)
Received: from [IPV6:2a00:5f00:102:0:10b3:10ff:fe5d:4ec1] (unknown
 [IPv6:2a00:5f00:102:0:10b3:10ff:fe5d:4ec1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id A72D61F45BED;
 Thu,  7 Apr 2022 18:51:10 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649353871;
 bh=BM8w1p30B0kfQHenmrawFgD3CQMDeil5XCYiCXhxmj0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ZkLc9cMqzHTOxOGUTmrKf6vegatQR09XbK2itRSvnEyM2PLisAHaf91EjRvUxfpw5
 RyBMCJC2kH/xgVJpC2EHUvIq9O9gx4evaixair/ggQ1t++qR4qQuMOUnJbNoI5YQIl
 fFtvGdFAp5mOV4poUmnwETAVMu6dvqZCmShRL2dJsFXDrqUBpxxgWUDPpm0b5PuXnd
 NUCGXX/k9v5vd81tQtBm3H7DkoPC8+CHjO15t2AA2UdCDa2FcSsEl7NQQnndZFqpfd
 TtueGYKsUCrWPzc2f5scziU0i70NjH5/UceR57b6BQeoXRit6sbkKwGJ65rxegJ/67
 HSYeEPtuvp3dg==
Message-ID: <4cbc5418-b92b-1eed-44cc-82030616cb02@collabora.com>
Date: Thu, 7 Apr 2022 20:51:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] drm/tegra: Stop using iommu_present()
Content-Language: en-US
To: Robin Murphy <robin.murphy@arm.com>, thierry.reding@gmail.com
References: <25247f43672df0aa58c1952bf3df2bf948e9f8ae.1649168393.git.robin.murphy@arm.com>
 <49165024-5f33-b6e6-7ec9-1ede6f562748@collabora.com>
 <0f7bf1c2-7a21-13a0-8734-c53f624e1edd@arm.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <0f7bf1c2-7a21-13a0-8734-c53f624e1edd@arm.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
 dri-devel@lists.freedesktop.org, jonathanh@nvidia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/6/22 21:06, Robin Murphy wrote:
> On 2022-04-06 15:32, Dmitry Osipenko wrote:
>> On 4/5/22 17:19, Robin Murphy wrote:
>>> Remove the pointless check. host1x_drm_wants_iommu() cannot return true
>>> unless an IOMMU exists for the host1x platform device, which at the
>>> moment
>>> means the iommu_present() test could never fail.
>>>
>>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
>>> ---
>>>   drivers/gpu/drm/tegra/drm.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
>>> index 9464f522e257..bc4321561400 100644
>>> --- a/drivers/gpu/drm/tegra/drm.c
>>> +++ b/drivers/gpu/drm/tegra/drm.c
>>> @@ -1149,7 +1149,7 @@ static int host1x_drm_probe(struct
>>> host1x_device *dev)
>>>           goto put;
>>>       }
>>>   -    if (host1x_drm_wants_iommu(dev) &&
>>> iommu_present(&platform_bus_type)) {
>>> +    if (host1x_drm_wants_iommu(dev)) {
>>>           tegra->domain = iommu_domain_alloc(&platform_bus_type);
>>>           if (!tegra->domain) {
>>>               err = -ENOMEM;
>>
>> host1x_drm_wants_iommu() returns true if there is no IOMMU for the
>> host1x platform device of Tegra20/30 SoCs.
> 
> Ah, apparently this is another example of what happens when I write
> patches late on a Friday night...
> 
> So on second look, what we want to ascertain here is whether dev has an
> IOMMU, but only if the host1x parent is not addressing-limited, either
> because it can also use the IOMMU, or because all possible addresses are
> small enough anyway, right? 

Yes

> Are we specifically looking for the host1x
> having a DMA-API-managed domain, or can that also end up using the
> tegra->domain or another unmanaged domain too?

We have host1x DMA that could have:

1. No IOMMU domain, depending on kernel/DT config
2. Managed domain, on newer SoCs
3. Unmanaged domain, on older SoCs

We have Tegra DRM devices which can:

1. Be attached to a shared unmanaged tegra->domain, on older SoCs
2. Have own managed domains, on newer SoCs

> I can't quite figure out
> from the comments whether it's physical addresses, IOVAs, or both that
> we're concerned with here.

Tegra DRM allocates buffers and submits jobs to h/w using host1x's
channel DMA. DRM framebuffers' addresses are inserted into host1x
command buffers by kernel driver and addresses beyond 32bit space need
to be treated specially, we don't support such addresses in upstream.

IOMMU AS is limited to 32bits on Tegra in upstream kernel for pre-T186
SoCs, it hides 64bit addresses from host1x. Post-T186 SoCs have extra
features that allow kernel driver not to bother about addresses.

For newer ARM64 SoCs there is assumption in the Tegra drivers that IOMMU
always presents, to simplify things.
