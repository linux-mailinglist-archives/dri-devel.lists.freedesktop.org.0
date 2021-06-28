Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0AB3B5BCC
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jun 2021 11:54:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B7BE6E40C;
	Mon, 28 Jun 2021 09:54:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0BB9A6E40C
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jun 2021 09:54:28 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9AEA41FB;
 Mon, 28 Jun 2021 02:54:28 -0700 (PDT)
Received: from [10.57.8.89] (unknown [10.57.8.89])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 862B33F694;
 Mon, 28 Jun 2021 02:54:27 -0700 (PDT)
Subject: Re: [PATCH] drm/rockchip: Check iommu itself instead of it's parent
 for device_is_available
To: Andy Yan <andy.yan@rock-chips.com>, hjc@rock-chips.com, heiko@sntech.de,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org
References: <20210627084737.309163-1-andy.yan@rock-chips.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <66fb4977-4e6f-f7ed-0dac-18710ebd782a@arm.com>
Date: Mon, 28 Jun 2021 10:54:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210627084737.309163-1-andy.yan@rock-chips.com>
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
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-06-27 09:47, Andy Yan wrote:
> When iommu itself is disabled in dts, we should
> fallback to non-iommu buffer, check iommu parent
> is meanless here.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> ---
> 
>   drivers/gpu/drm/rockchip/rockchip_drm_drv.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> index 212bd87c0c4a..0d20c8cc1ffa 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> @@ -366,7 +366,7 @@ static int rockchip_drm_platform_of_probe(struct device *dev)
>   		}
>   
>   		iommu = of_parse_phandle(port->parent, "iommus", 0);
> -		if (!iommu || !of_device_is_available(iommu->parent)) {
> +		if (!iommu || !of_device_is_available(iommu)) {

Just wondering, could you use device_iommu_mapped() to avoid poking at 
the DT at all here, or is it that you need to check remote graph 
endpoints whose struct device may not be ready yet?

Robin.

>   			DRM_DEV_DEBUG(dev,
>   				      "no iommu attached for %pOF, using non-iommu buffers\n",
>   				      port->parent);
> 
