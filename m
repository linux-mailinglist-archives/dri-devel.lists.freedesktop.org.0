Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B08DF74D34B
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 12:27:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 841D110E10A;
	Mon, 10 Jul 2023 10:26:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4855210E10A
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 10:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688984816; x=1720520816;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=lmv0G8hZetKfnEAWnNAaFa2Izy9izfDDhRQBoU/UakU=;
 b=HNTKLlj0ueJsqa/5b1QHoQBUp3y8GldUhvGlUQSb2mYWGZwHYfsf1xgP
 Fi0jeN84KajFuKXQP2tysYluN7noHLvLn5xSJs7HJMs/lrpuBFzAKvx+O
 ANk9wBn+/vID+sptqkTGFqjHC9NpFy/WO48+HCQj4JEkX6SxQDVCAl4Ff
 F1mlUpKSVB/8ZEeMDKccCwsdvAsUuk3JGzEvu9Tbl1/21maC+YCXST40B
 bSdJ80pPD2aEvk3d663xlXsoW7IEavFUOC5PLzESWoly9vIEAeSWIWdvA
 LRmleGzetftgT7std6qDCJ3hcrY5s2SnkU/tQ8CZ1bWVXFrBjSnjFmz7H A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="344634885"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="344634885"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2023 03:26:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="810771133"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="810771133"
Received: from stoicaan-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.52.170])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2023 03:26:52 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Sui Jingfeng <suijingfeng@loongson.cn>, Sui Jingfeng
 <suijingfeng@loongson.cn>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, Li Yi
 <liyi@loongson.cn>
Subject: Re: [PATCH] drm/loongson: Fix two warnings because of passing wrong
 type
In-Reply-To: <20230710100931.255234-1-suijingfeng@loongson.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230710100931.255234-1-suijingfeng@loongson.cn>
Date: Mon, 10 Jul 2023 13:26:49 +0300
Message-ID: <87h6qcjc46.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: loongson-kernel@lists.loongnix.cn, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 10 Jul 2023, Sui Jingfeng <suijingfeng@loongson.cn> wrote:
> When accessing I/O memory, we should pass '__iomem *' type instead of
> 'void *' simply, otherwise sparse tests will complain. After applied
> this patch, the following two sparse warnings got fixed.

Usually the commit message should explain why it's okay to cast away the
warning.

Because realistically this doesn't "fix" the warning, this merely hides
it.

BR,
Jani.

>
> 1) drivers/gpu/drm/loongson/lsdc_benchmark.c:27:35:
>    sparse:     expected void volatile [noderef] __iomem *
>    sparse:     got void *kptr
>
> 2) drivers/gpu/drm/loongson/lsdc_benchmark.c:42:51:
>    sparse:     expected void const volatile [noderef] __iomem *
>    sparse:     got void *kptr
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202307100243.v3hv6aes-lkp@intel.com/
> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> ---
>  drivers/gpu/drm/loongson/lsdc_benchmark.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/loongson/lsdc_benchmark.c b/drivers/gpu/drm/loongson/lsdc_benchmark.c
> index b088646a2ff9..36e352820bdb 100644
> --- a/drivers/gpu/drm/loongson/lsdc_benchmark.c
> +++ b/drivers/gpu/drm/loongson/lsdc_benchmark.c
> @@ -24,7 +24,7 @@ static void lsdc_copy_gtt_to_vram_cpu(struct lsdc_bo *src_bo,
>  	lsdc_bo_kmap(dst_bo);
>  
>  	while (n--)
> -		memcpy_toio(dst_bo->kptr, src_bo->kptr, size);
> +		memcpy_toio((void __iomem *)dst_bo->kptr, src_bo->kptr, size);
>  
>  	lsdc_bo_kunmap(src_bo);
>  	lsdc_bo_kunmap(dst_bo);
> @@ -39,7 +39,7 @@ static void lsdc_copy_vram_to_gtt_cpu(struct lsdc_bo *src_bo,
>  	lsdc_bo_kmap(dst_bo);
>  
>  	while (n--)
> -		memcpy_fromio(dst_bo->kptr, src_bo->kptr, size);
> +		memcpy_fromio(dst_bo->kptr, (void __iomem *)src_bo->kptr, size);
>  
>  	lsdc_bo_kunmap(src_bo);
>  	lsdc_bo_kunmap(dst_bo);

-- 
Jani Nikula, Intel Open Source Graphics Center
