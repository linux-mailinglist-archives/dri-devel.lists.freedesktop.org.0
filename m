Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A46C52312B
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 13:09:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97A9E10E66D;
	Wed, 11 May 2022 11:09:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B133510E3E6
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 11:09:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id A7E7B1F44DCB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652267343;
 bh=F9aAPWfKvLN/c3HoUZUVVOQ9jz//gwR/ofGKu2nHses=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=W12X3oJhsrpQE2DhSrbaWvWpfAdag8EHWZTe0B4BjVG5fVofba5zM6AwqURgE2xit
 G9sJQhKpL5Lyo4YWhOxwOG8SRrENRfkKeEihosn8zGLLwzAInYCBTg24pri6K5Wkzm
 ROAc6s6qMvVe35i0rWFGctTEGVUhwszS5KdKNRtZWe7E9AaDTDa/gaiIbsp2T604vi
 lQtYbkGWo0zS/4XtbXV/VbB7Ud2LSjWRexmYPIToQz+WYbzOkE/vFnAUFWc0AHLsUW
 NAPHxYUaNdksd30zWcFIl6/+Xto1CdT5o8GmtPsk9k2BN0C2KpYvYXG1TSVRc+KZj6
 n8r2YQnQOZf1w==
Message-ID: <a0c7e954-ee3f-74fd-cfea-9b6dbce924dc@collabora.com>
Date: Wed, 11 May 2022 14:08:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2] drm/tegra: Stop using iommu_present()
Content-Language: en-US
To: Robin Murphy <robin.murphy@arm.com>, thierry.reding@gmail.com
References: <1f7c304a79b8b8dd5d4716786cae7502a0cc31f5.1649684782.git.robin.murphy@arm.com>
 <add31812-50d5-6cb0-3908-143c523abd37@collabora.com>
 <63c021c4-57de-38fe-e48f-a308088d235b@arm.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <63c021c4-57de-38fe-e48f-a308088d235b@arm.com>
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

On 5/4/22 14:52, Robin Murphy wrote:
> On 2022-05-04 01:52, Dmitry Osipenko wrote:
>> On 4/11/22 16:46, Robin Murphy wrote:
>>> @@ -1092,6 +1092,19 @@ static bool host1x_drm_wants_iommu(struct
>>> host1x_device *dev)
>>>       struct host1x *host1x = dev_get_drvdata(dev->dev.parent);
>>>       struct iommu_domain *domain;
>>>   +    /* For starters, this is moot if no IOMMU is available */
>>> +    if (!device_iommu_mapped(&dev->dev))
>>> +        return false;
>>
>> Unfortunately this returns false on T30 with enabled IOMMU because we
>> don't use IOMMU for Host1x on T30 [1] to optimize performance. We can't
>> change it until we will update drivers to support Host1x-dedicated
>> buffers.
> 
> Huh, so is dev->dev here not the DRM device? If it is, and
> device_iommu_mapped() returns false, then the later iommu_attach_group()
> call is going to fail anyway, so there's not much point allocating a
> domain. If it's not, then what the heck is host1x_drm_wants_iommu()
> actually testing for?

The dev->dev is the host1x device and it's the DRM device.

The iommu_attach_group() is called for the DRM sub-devices (clients in
the Tegra driver), which are the devices sitting on the host1x bus.

There is no single GPU device on Tegra, instead it's composed of
independent GPU engines and display controllers that are connected to
the host1x bus.

Host1x also has channel DMA engines that are used by DRM driver. We
don't have dedicated devices for the host1x DMA, there is single host1x
driver that manages host1x bus and DMA.

-- 
Best regards,
Dmitry
