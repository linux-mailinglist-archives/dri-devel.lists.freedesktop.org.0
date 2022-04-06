Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7684F6192
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 16:33:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89BA710E33C;
	Wed,  6 Apr 2022 14:33:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D76289CD9
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 14:33:18 +0000 (UTC)
Received: from [IPV6:2a00:5f00:102:0:10b3:10ff:fe5d:4ec1] (unknown
 [IPv6:2a00:5f00:102:0:10b3:10ff:fe5d:4ec1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 0AB201F439F1;
 Wed,  6 Apr 2022 15:33:15 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649255596;
 bh=0rsiDogHDOb/1j1FR6ke27j7svX8HkOqiOPHX/w8KRQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=SHbmGg8N6CFcgH71/BRGUsJmPHwyVj9z5igl9pJzUW5NCQo9i14d4DUX4hk3EKR5u
 25cKiDMD5A4MU/lnZvHJYISA4Y53a2btqii0TLjJ5lveCIO2tsJUzbPHkIaXoX2pue
 1doJkrKhd3/wN0/fqsz51UOfdard5r2U+18cguHLZEhpb3qGKBgs51lbRcnGXUmhjF
 K/fAp9E9QOno/gMRlDrd7+M21olFnPcfDOdoGN4qVgU1NHtfKQbBx65cfGcYb2Hjt6
 Va1YoGM4OmUDAvB//yzFwh+/Ye70UYcUQYqElKmTnrCb2kuCkMticYS7DKRO5wIjaX
 8Y0pZ8NWuc98Q==
Message-ID: <49165024-5f33-b6e6-7ec9-1ede6f562748@collabora.com>
Date: Wed, 6 Apr 2022 17:32:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] drm/tegra: Stop using iommu_present()
Content-Language: en-US
To: Robin Murphy <robin.murphy@arm.com>, thierry.reding@gmail.com
References: <25247f43672df0aa58c1952bf3df2bf948e9f8ae.1649168393.git.robin.murphy@arm.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <25247f43672df0aa58c1952bf3df2bf948e9f8ae.1649168393.git.robin.murphy@arm.com>
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

On 4/5/22 17:19, Robin Murphy wrote:
> Remove the pointless check. host1x_drm_wants_iommu() cannot return true
> unless an IOMMU exists for the host1x platform device, which at the moment
> means the iommu_present() test could never fail.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  drivers/gpu/drm/tegra/drm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
> index 9464f522e257..bc4321561400 100644
> --- a/drivers/gpu/drm/tegra/drm.c
> +++ b/drivers/gpu/drm/tegra/drm.c
> @@ -1149,7 +1149,7 @@ static int host1x_drm_probe(struct host1x_device *dev)
>  		goto put;
>  	}
>  
> -	if (host1x_drm_wants_iommu(dev) && iommu_present(&platform_bus_type)) {
> +	if (host1x_drm_wants_iommu(dev)) {
>  		tegra->domain = iommu_domain_alloc(&platform_bus_type);
>  		if (!tegra->domain) {
>  			err = -ENOMEM;

host1x_drm_wants_iommu() returns true if there is no IOMMU for the
host1x platform device of Tegra20/30 SoCs.
