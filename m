Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6DA41CBF8B
	for <lists+dri-devel@lfdr.de>; Sat,  9 May 2020 11:05:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D624F6E2EF;
	Sat,  9 May 2020 09:04:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 301666EB43;
 Fri,  8 May 2020 18:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=el9E5/pENx0u9FAEs3KmKFtgNwsJ96Jy19SzD82IMKw=; b=QcyxHiFX3Qvnnfy7yKCg9MarsW
 HnaAvV+RBs5aYeksWZFzRTfbVCngS/KVSk/Z2epq7u/ZncaW/D5EHvLWIbd4Upk8PsDZ1GqeISScF
 is6nTMQfiBdqkK2onRcwmEVABvhy702qcR0CR+r8xmgfNH8FDBrZj1524gpVEazDTOg1GRkXu3XGa
 xeiiJMQgMbstLgaRBrXfYb262lnovB3/8PTo5W/Tfx+BzivjoeEc+EQHpkW+afHHg+ka+BiWLa/dW
 GC/pkfAO2qM5kIEdGOFnZGQKEWxrixZiT+DIBIRqMUgtmEDVZ0a9OUp7YBAZQQB+8Tf15/lE8vyWY
 tzr0EJFA==;
Received: from [2601:1c0:6280:3f0::19c2]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jX7NH-00018l-SF; Fri, 08 May 2020 18:05:27 +0000
Subject: Re: [PATCH 2/2] nouveau: fix dependencies for DEVICE_PRIVATE
To: Arnd Bergmann <arnd@arndb.de>, Ben Skeggs <bskeggs@redhat.com>,
 Jason Gunthorpe <jgg@ziepe.ca>
References: <20200508144017.3501418-1-arnd@arndb.de>
 <20200508144017.3501418-2-arnd@arndb.de>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <a84bb114-c2c2-b15a-4e00-89e4abd01564@infradead.org>
Date: Fri, 8 May 2020 11:05:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200508144017.3501418-2-arnd@arndb.de>
Content-Language: en-US
X-Mailman-Approved-At: Sat, 09 May 2020 09:04:57 +0000
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
Cc: David Airlie <airlied@linux.ie>, John Hubbard <jhubbard@nvidia.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jason Gunthorpe <jgg@mellanox.com>,
 nouveau@lists.freedesktop.org, Dan Williams <dan.j.williams@intel.com>,
 Ira Weiny <ira.weiny@intel.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/8/20 7:40 AM, Arnd Bergmann wrote:
> CONFIG_DEVICE_PRIVATE cannot be selected in configurations
> without ZONE_DEVICE:
> 
> WARNING: unmet direct dependencies detected for DEVICE_PRIVATE
>   Depends on [n]: ZONE_DEVICE [=n]
>   Selected by [y]:
>   - DRM_NOUVEAU_SVM [=y] && HAS_IOMEM [=y] && DRM_NOUVEAU [=y] && MMU [=y] && STAGING [=y]
> kernel/resource.c:1653:28: error: use of undeclared identifier 'PA_SECTION_SHIFT'
>         size = ALIGN(size, 1UL << PA_SECTION_SHIFT);
>                                   ^
> kernel/resource.c:1654:48: error: use of undeclared identifier 'MAX_PHYSMEM_BITS'
> 
> Add a dependency for Nouveau to avoid broken randconfig builds.
> 
> Fixes: d2c63df2242e ("mm/hmm: make CONFIG_DEVICE_PRIVATE into a select")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

Thanks.

> ---
>  drivers/gpu/drm/nouveau/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/nouveau/Kconfig b/drivers/gpu/drm/nouveau/Kconfig
> index af5793f3e7c2..996ec5475908 100644
> --- a/drivers/gpu/drm/nouveau/Kconfig
> +++ b/drivers/gpu/drm/nouveau/Kconfig
> @@ -87,6 +87,7 @@ config DRM_NOUVEAU_BACKLIGHT
>  config DRM_NOUVEAU_SVM
>  	bool "(EXPERIMENTAL) Enable SVM (Shared Virtual Memory) support"
>  	depends on DRM_NOUVEAU
> +	depends on ZONE_DEVICE
>  	depends on MMU
>  	depends on STAGING
>  	select DEVICE_PRIVATE
> 


-- 
~Randy

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
