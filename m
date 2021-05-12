Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B630537C439
	for <lists+dri-devel@lfdr.de>; Wed, 12 May 2021 17:30:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51A5B6EC3A;
	Wed, 12 May 2021 15:30:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 772916EC3A
 for <dri-devel@lists.freedesktop.org>; Wed, 12 May 2021 15:30:42 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E453131B;
 Wed, 12 May 2021 08:30:41 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DCDAE3F718;
 Wed, 12 May 2021 08:30:40 -0700 (PDT)
Subject: Re: [PATCH 1/1] drm/panfrost: Remove redundant error printing in
 panfrost_device_init()
To: Zhen Lei <thunder.leizhen@huawei.com>, Rob Herring <robh@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <20210511090433.4396-1-thunder.leizhen@huawei.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <dc48db2b-4ffc-a586-c3a3-0f7544ec8107@arm.com>
Date: Wed, 12 May 2021 16:30:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210511090433.4396-1-thunder.leizhen@huawei.com>
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

On 11/05/2021 10:04, Zhen Lei wrote:
> When devm_ioremap_resource() fails, a clear enough error message will be
> printed by its subfunction __devm_ioremap_resource(). The error
> information contains the device name, failure cause, and possibly resource
> information.
> 
> Therefore, remove the error printing here to simplify code and reduce the
> binary size.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>

Reviewed-by: Steven Price <steven.price@arm.com>

I'll push to drm-misc-next.

Thanks,

Steve

> ---
>   drivers/gpu/drm/panfrost/panfrost_device.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
> index fbcf5edbe367521..125ed973feaad0a 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.c
> @@ -238,7 +238,6 @@ int panfrost_device_init(struct panfrost_device *pfdev)
>   	res = platform_get_resource(pfdev->pdev, IORESOURCE_MEM, 0);
>   	pfdev->iomem = devm_ioremap_resource(pfdev->dev, res);
>   	if (IS_ERR(pfdev->iomem)) {
> -		dev_err(pfdev->dev, "failed to ioremap iomem\n");
>   		err = PTR_ERR(pfdev->iomem);
>   		goto out_pm_domain;
>   	}
> 

