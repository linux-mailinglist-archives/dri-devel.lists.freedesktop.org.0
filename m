Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1287C99C9
	for <lists+dri-devel@lfdr.de>; Sun, 15 Oct 2023 17:35:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3800810E0F7;
	Sun, 15 Oct 2023 15:35:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B968C10E0F7
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Oct 2023 15:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=HGu2TaKT3AxH2/KDcfAn+b808o6kLJvW+inbCvMRQfA=; b=TlB9LrBEvBR8U9kbW3JXBYMqhS
 IMRLVtX+gud02KZZLfT6KxH6GIUrTwr65NYCZNPIoyR4ts1bf1BGjZZOCak40c/IDhYMV0UzzNd2I
 uSlOjBjnOCxtVPP9vAbCVi05hFP8XrXAo71uBJWxDyqShQcpVbDaCjFZijgpDgKuG74XWkxvKaX6S
 pE8McOzLpU1Qdpw+iE+5RQeoZsDSv3XouuLZD0+2GIftQgOyNZ0sJ2C7qcpCEP3SggwRZMxdh3w9f
 /bCirbus8+q2Jo4NbwFelF//3rJMdszdGQSEMqNat/Bm8q8RxlTlmuoJ0zPq2Oj8llZkmmLJzpHhn
 +9R+SwvA==;
Received: from [50.53.46.231] (helo=[192.168.254.15])
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qs39D-007Ntb-2R; Sun, 15 Oct 2023 15:35:19 +0000
Message-ID: <35984b5f-d4f5-4d45-9e17-b41140ff78e0@infradead.org>
Date: Sun, 15 Oct 2023 08:35:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/tiny: print 'struct resource *' correctly
Content-Language: en-US
To: Yussef Dalton <yussef.dalton@gmail.com>, tzimmermann@suse.de
References: <20231015131100.331880-1-yussef.dalton@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20231015131100.331880-1-yussef.dalton@gmail.com>
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
Cc: javierm@redhat.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/15/23 06:11, Yussef Dalton wrote:
> Since format specifier %pr refers to a 'struct resource *', there is no
> need to take the address of the 'res' variable since it is already of
> type 'struct resource *'.
> 
> Signed-off-by: Yussef Dalton <yussef.dalton@gmail.com>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  drivers/gpu/drm/tiny/ofdrm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tiny/ofdrm.c b/drivers/gpu/drm/tiny/ofdrm.c
> index 2d999a0facde..6372ab383747 100644
> --- a/drivers/gpu/drm/tiny/ofdrm.c
> +++ b/drivers/gpu/drm/tiny/ofdrm.c
> @@ -1208,13 +1208,13 @@ static struct ofdrm_device *ofdrm_device_create(struct drm_driver *drv,
>  
>  	ret = devm_aperture_acquire_from_firmware(dev, fb_pgbase, fb_pgsize);
>  	if (ret) {
> -		drm_err(dev, "could not acquire memory range %pr: error %d\n", &res, ret);
> +		drm_err(dev, "could not acquire memory range %pr: error %d\n", res, ret);
>  		return ERR_PTR(ret);
>  	}
>  
>  	mem = devm_request_mem_region(&pdev->dev, fb_pgbase, fb_pgsize, drv->name);
>  	if (!mem) {
> -		drm_warn(dev, "could not acquire memory region %pr\n", &res);
> +		drm_warn(dev, "could not acquire memory region %pr\n", res);
>  		return ERR_PTR(-ENOMEM);
>  	}
>  

-- 
~Randy
