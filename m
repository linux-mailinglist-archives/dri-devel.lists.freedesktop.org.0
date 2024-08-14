Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CAA951D25
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 16:31:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2661910E4AB;
	Wed, 14 Aug 2024 14:31:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NlOE+jHP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EC6D10E0A8;
 Wed, 14 Aug 2024 14:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723645907; x=1755181907;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ece2LISgpsyxAalVTQxdjHbikjzU+k456YkSRh2ebjQ=;
 b=NlOE+jHPfWl0P4kSj9Qt9xImrqomXuZQ99xFx+wAMgslRnvVDvlGxsP0
 9qsernu3BLq48ZB9jOOX7/1bbPyr/IK2mhRq1HMYPPowlzZcrtfY2b99k
 +479JmygVYjdeUUPH7h5JBSt9u1aLVAQ00IWF5/jV/BBzxoAt8pB0C6C/
 9bAh1SmS17nF1bDIfG/V73yUxsn3tzWdgsxfzCEiMCeF/jP/d6UbkkyHw
 roV5dcd8+UbX1Tc9CN1O8COhigee1OQH2mWhJ40YrLuoCk8AxOlTqnz4+
 m7QZ0PS0MvW8DmyU6Oc/fu+oTWBvPZH7gDHb4g2eDmdnXnc7Hrq8bB356 g==;
X-CSE-ConnectionGUID: guFnLm9dQRGYZKuMen2vVQ==
X-CSE-MsgGUID: JfYXurqyQJuok19o93E+3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="32443265"
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; d="scan'208";a="32443265"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 07:31:46 -0700
X-CSE-ConnectionGUID: gKFjBre2Tue0ILURhYDNbw==
X-CSE-MsgGUID: 7xi9mmheRpqhktKXRXOL0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; d="scan'208";a="59000902"
Received: from olympicsflex3.amr.corp.intel.com (HELO [10.245.245.31])
 ([10.245.245.31])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 07:31:43 -0700
Message-ID: <0ceebb29-9242-4d8a-afcc-111b5f96c154@intel.com>
Date: Wed, 14 Aug 2024 15:31:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/buddy: fix issue that force_merge cannot free all
 roots
To: "Lin.Cao" <lincao12@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com, Arunpravin.PaneerSelvam@amd.com
Cc: Horace.Chen@amd.com
References: <20240813094451.1478481-1-lincao12@amd.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240813094451.1478481-1-lincao12@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 13/08/2024 10:44, Lin.Cao wrote:
> If buddy manager have more than one roots and each root have sub-block
> need to be free. When drm_buddy_fini called, the first loop of
> force_merge will merge and free all of the sub block of first root,
> which offset is 0x0 and size is biggest(more than have of the mm size).
> In subsequent force_merge rounds, if we use 0 as start and use remaining
> mm size as end, the block of other roots will be skipped in
> __force_merge function. It will cause the other roots can not be freed.
> 
> Solution: use roots' offset as the start could fix this issue.

Were you able to take a look at the test side for this? See previous 
reply: 
https://lore.kernel.org/dri-devel/3fdd9175-832a-4113-8aaa-6039925c5a4d@intel.com/

Patch itself is good, but would be good to understand why the test for 
this is not failing, and try to improve that also.

> 
> Signed-off-by: Lin.Cao <lincao12@amd.com>
> ---
>   drivers/gpu/drm/drm_buddy.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
> index 94f8c34fc293..b3f0dd652088 100644
> --- a/drivers/gpu/drm/drm_buddy.c
> +++ b/drivers/gpu/drm/drm_buddy.c
> @@ -324,7 +324,7 @@ EXPORT_SYMBOL(drm_buddy_init);
>    */
>   void drm_buddy_fini(struct drm_buddy *mm)
>   {
> -	u64 root_size, size;
> +	u64 root_size, size, start;
>   	unsigned int order;
>   	int i;
>   
> @@ -332,7 +332,8 @@ void drm_buddy_fini(struct drm_buddy *mm)
>   
>   	for (i = 0; i < mm->n_roots; ++i) {
>   		order = ilog2(size) - ilog2(mm->chunk_size);
> -		__force_merge(mm, 0, size, order);
> +		start = drm_buddy_block_offset(mm->roots[i]);
> +		__force_merge(mm, start, start + size, order);
>   
>   		WARN_ON(!drm_buddy_block_is_free(mm->roots[i]));
>   		drm_block_free(mm, mm->roots[i]);
