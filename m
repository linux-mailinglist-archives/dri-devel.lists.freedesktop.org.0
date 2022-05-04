Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC25C51930B
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 02:52:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2564710F0BF;
	Wed,  4 May 2022 00:52:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC85510F0BF
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 00:52:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id A66401F4433E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651625544;
 bh=VHi2JQXOxZVX+vfNBsGibT8B9KC9CmTcEJVV5seb2ME=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=cD2Qkx0zO0rJEAgHvaTzRnevQaJEOKtssl5WeGvASMCSVt+ZXT/dwV5n0FYs09wyE
 0If1OzaemkXfxr5y+tIhvw4gBcrdmKwbFADP+1C7QHw0ZpZgTJOdHp0XWlKp+6dlGa
 Ed+4aPl9r/96lBfpkmb/TmTK162/Ea8Epc2hkhvYAy9uox3LRLEjVRVryVJWoIrqwa
 65O+CcCk4Mz+wwdjqxfF+objr2GbvTMjV9vQjxsfkSLa41uIRtNtdGSf/K2UGJxIK9
 1LAQ71dWYdau3TRiQmse5AkC6HDRb0qkUVNPaTRTYjJrUI54WJYFGJro4mqK9PkgIp
 cd4q6Y4bYQMSQ==
Message-ID: <add31812-50d5-6cb0-3908-143c523abd37@collabora.com>
Date: Wed, 4 May 2022 03:52:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2] drm/tegra: Stop using iommu_present()
Content-Language: en-US
To: Robin Murphy <robin.murphy@arm.com>, thierry.reding@gmail.com
References: <1f7c304a79b8b8dd5d4716786cae7502a0cc31f5.1649684782.git.robin.murphy@arm.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <1f7c304a79b8b8dd5d4716786cae7502a0cc31f5.1649684782.git.robin.murphy@arm.com>
Content-Type: text/plain; charset=UTF-8
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

On 4/11/22 16:46, Robin Murphy wrote:
> @@ -1092,6 +1092,19 @@ static bool host1x_drm_wants_iommu(struct host1x_device *dev)
>  	struct host1x *host1x = dev_get_drvdata(dev->dev.parent);
>  	struct iommu_domain *domain;
>  
> +	/* For starters, this is moot if no IOMMU is available */
> +	if (!device_iommu_mapped(&dev->dev))
> +		return false;

Unfortunately this returns false on T30 with enabled IOMMU because we
don't use IOMMU for Host1x on T30 [1] to optimize performance. We can't
change it until we will update drivers to support Host1x-dedicated buffers.

[1]
https://elixir.bootlin.com/linux/latest/source/drivers/gpu/host1x/dev.c#L258

-- 
Best regards,
Dmitry
