Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCED16E5C6E
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 10:47:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 058A110E70B;
	Tue, 18 Apr 2023 08:47:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 637DA10E717;
 Tue, 18 Apr 2023 08:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681807668; x=1713343668;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=nIqUHM4VZSEHuLUoyJ0ioNxn0jbGNhDyuLATbHCITwo=;
 b=XgDmx8m3l2iqre7nLUN0J5PjVJQfkpAJXHxDWaQ1/Yq8hzD5J7hva6EA
 NF732+M0/1D4ka62oZlgeKrLefueVnSIZWGG8L9pyY/oQyBVeue8ufeEe
 YwIrWdqxrr2dNUB9v55R1Wrgofpn3rJHYCY2iNeIaBRf2glQgdoYSTw7H
 hqGplyGJAc316AjEu9mnflpbM0jH6+wktcSvLkwkGUb1VATr+fGZ2GoEd
 P7S8LlhCVxTvgzStXIqXlM6MyJ5dmbb9yixRtyzOaosXYsS+ohZB5deSA
 LoIHgJD/iuxukxx7iXo1G8lJIbOJu+mA9ImDyPL/WCFbamjQ7TN0/zzuM A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="346961092"
X-IronPort-AV: E=Sophos;i="5.99,206,1677571200"; d="scan'208";a="346961092"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2023 01:47:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="668433010"
X-IronPort-AV: E=Sophos;i="5.99,206,1677571200"; d="scan'208";a="668433010"
Received: from ashfaqur-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.251.213.178])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2023 01:47:43 -0700
Date: Tue, 18 Apr 2023 10:47:18 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Daniil Dulov <d.dulov@aladdin.ru>
Subject: Re: [PATCH] drm/amdkfd: Fix potential deallocation of previously
 deallocated memory.
Message-ID: <ZD5ZFoEk92MNQpqD@ashyti-mobl2.lan>
References: <20230418065521.453001-1-d.dulov@aladdin.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230418065521.453001-1-d.dulov@aladdin.ru>
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
Cc: lvc-project@linuxtesting.org, David Airlie <airlied@linux.ie>,
 Felix Kuehling <Felix.Kuehling@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Oak Zeng <ozeng@amd.com>,
 Christian =?iso-8859-15?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniil,

On Mon, Apr 17, 2023 at 11:55:21PM -0700, Daniil Dulov wrote:
> Pointer mqd_mem_obj can be deallocated in kfd_gtt_sa_allocate().
> The function then returns non-zero value, which causes the second deallocation.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Fixes: d1f8f0d17d40 ("drm/amdkfd: Move non-sdma mqd allocation out of init_mqd")
> Signed-off-by: Daniil Dulov <d.dulov@aladdin.ru>
> ---
>  drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
> index 3b6f5963180d..bce11c5b07d6 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
> @@ -119,7 +119,8 @@ static struct kfd_mem_obj *allocate_mqd(struct kfd_dev *kfd,
>  	}
>  
>  	if (retval) {
> -		kfree(mqd_mem_obj);
> +		if (mqd_mem_obj)
> +			kfree(mqd_mem_obj);

I think this is not needed. kfree() returns immediately if
mqd_mem_obj is NULL.

Andi

>  		return NULL;
>  	}
>  
> -- 
> 2.25.1
