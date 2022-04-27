Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77628511058
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 06:58:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7119489CB9;
	Wed, 27 Apr 2022 04:58:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se
 [213.80.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 852C6887AE
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 04:58:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 002C9400F0;
 Wed, 27 Apr 2022 06:58:17 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -3.956
X-Spam-Level: 
X-Spam-Status: No, score=-3.956 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.857,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Authentication-Results: ste-pvt-msa1.bahnhof.se (amavisd-new);
 dkim=pass (1024-bit key) header.d=shipmail.org
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5b08ezDtEk9k; Wed, 27 Apr 2022 06:58:17 +0200 (CEST)
Received: by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id B2079400D6;
 Wed, 27 Apr 2022 06:58:16 +0200 (CEST)
Received: from [192.168.0.209] (h-155-4-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 1070336018C;
 Wed, 27 Apr 2022 06:58:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1651035496; bh=okFCXwH5q3BGcy/4PEl6Dzf1/lPAJDOhGnddiU28/Bk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ans1GR8ex3L5/YIDD2X/P3Xdz7udqOQznNWBBtY6XVgnHms06o40PcLioY3SUrEdK
 MSxdqiX9xv1tZzYZyQK+jJC7pL2Y2+i6XO0cwXtt0up45S5wkAXow0kb2DIs8NLUrS
 6Zo5DQljA94be5Xoajzv6DxT5z1GKnBJQZSMk16M=
Message-ID: <0c57c6a1-be61-81ad-c7a2-cadbd82bf88b@shipmail.org>
Date: Wed, 27 Apr 2022 06:58:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] drm/vmwgfx: Remove unused hugepage support
Content-Language: en-US
To: Zack Rusin <zackr@vmware.com>, dri-devel@lists.freedesktop.org
References: <20220425203152.1314211-1-zack@kde.org>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
In-Reply-To: <20220425203152.1314211-1-zack@kde.org>
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
Cc: krastevm@vmware.com, mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 4/25/22 22:31, Zack Rusin wrote:
> From: Zack Rusin <zackr@vmware.com>
>
> There's no point in explicitly trying to align virtual memory to
> facilitate huge page table entries or huge page memory in buffer objects
> given that they're not being used.
>
> Transparent hugepages support for vram allocations has been gradually
> retired over the last two years making alignment of unmapped areas
> unneeded and pointless.
>
> Signed-off-by: Zack Rusin <zackr@vmware.com>

For the series:

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


> ---
>   drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 13 -------------
>   1 file changed, 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> index 5dc02fd806db..45028e25d490 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> @@ -1423,18 +1423,6 @@ static void vmw_debugfs_resource_managers_init(struct vmw_private *vmw)
>   					    root, "system_mob_ttm");
>   }
>   
> -static unsigned long
> -vmw_get_unmapped_area(struct file *file, unsigned long uaddr,
> -		      unsigned long len, unsigned long pgoff,
> -		      unsigned long flags)
> -{
> -	struct drm_file *file_priv = file->private_data;
> -	struct vmw_private *dev_priv = vmw_priv(file_priv->minor->dev);
> -
> -	return drm_get_unmapped_area(file, uaddr, len, pgoff, flags,
> -				     dev_priv->drm.vma_offset_manager);
> -}
> -
>   static int vmwgfx_pm_notifier(struct notifier_block *nb, unsigned long val,
>   			      void *ptr)
>   {
> @@ -1601,7 +1589,6 @@ static const struct file_operations vmwgfx_driver_fops = {
>   	.compat_ioctl = vmw_compat_ioctl,
>   #endif
>   	.llseek = noop_llseek,
> -	.get_unmapped_area = vmw_get_unmapped_area,
>   };
>   
>   static const struct drm_driver driver = {
