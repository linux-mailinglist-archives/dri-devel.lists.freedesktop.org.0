Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1D792CDFF
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 11:14:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BBF410E70F;
	Wed, 10 Jul 2024 09:14:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LL9y3v3Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 927C610E70F;
 Wed, 10 Jul 2024 09:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720602891; x=1752138891;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=qlw/hTHDGR15W4QZv8VHInn6/232EcbGKDtwdqtowjI=;
 b=LL9y3v3Z44EWILjWy0oQjUISfb7aR+HxR5Wnk2Jr93VG0JuB043NfaSy
 TPjihAnaZGw9FSYTkzyHxzVJW68VudCImlVnxk5AwT4YI1XBl3uKEBfSh
 6KE1/KRIxA0d7pbdqdDcKGJIEI6qwV1FNQvXrxuOCYM2CNpMdrbMod9K5
 IqSXUDNGlHP2YItGIFTBWuy1sPMpycRu9x1C4CwZ5zei7Gax0baX6RSig
 uj62B7sA/ETfRRCrYIvrYjwdZ5uTKVTKxc5+H4vdjFqwgERLrtPhZPdcq
 uQ2H6T+MUVYyyXIyX7evQSR2pnujvS0CtUSXIbaDRhYUW4cSN7AsQobFr g==;
X-CSE-ConnectionGUID: AU9sZEaqR4iSj6zH2H8UKw==
X-CSE-MsgGUID: 66FogHK0R5yKFl0neTZ6rg==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="21726074"
X-IronPort-AV: E=Sophos;i="6.09,197,1716274800"; d="scan'208";a="21726074"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2024 02:14:51 -0700
X-CSE-ConnectionGUID: 0/AUlrpmQV2mxHvj2lnloQ==
X-CSE-MsgGUID: uIfaTutcS3yKEarGe0gQuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,197,1716274800"; d="scan'208";a="79316678"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.94.254.89])
 ([10.94.254.89])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2024 02:14:49 -0700
Message-ID: <e9cfae8a-3fee-4c6d-b84d-34070237387f@linux.intel.com>
Date: Wed, 10 Jul 2024 11:14:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] drm/xe/migrate: Clear CCS when clearing bo on xe2
To: Nirmoy Das <nirmoy.das@intel.com>, dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>
References: <20240704081841.30212-1-nirmoy.das@intel.com>
 <20240704081841.30212-3-nirmoy.das@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240704081841.30212-3-nirmoy.das@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 7/4/2024 10:18 AM, Nirmoy Das wrote:
> Clearing bo with uncompress PTE will trigger a CCS clearing as well
> for XE2, so skip emit_copy_ccs() when on xe2 when clearing bo.
>
> v2: When clearing BO, CCS clear happens with all command as long
>      as PTEs are uncompress.
>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_migrate.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index e0a3f6921572..cc8beed2bf8e 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -1061,7 +1061,8 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>   		if (clear_vram && xe_migrate_allow_identity(clear_L0, &src_it))
>   			xe_res_next(&src_it, clear_L0);
>   		else
> -			emit_pte(m, bb, clear_L0_pt, clear_vram, clear_ccs,
> +			/* Use uncompressed pte so clear happens in the real memory. */
> +			emit_pte(m, bb, clear_L0_pt, clear_vram, false,
>   				 &src_it, clear_L0, dst);
>   
>   		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
> @@ -1070,7 +1071,9 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>   		if (clear_bo_data)
>   			emit_clear(gt, bb, clear_L0_ofs, clear_L0, XE_PAGE_SIZE, clear_vram);
>   
> -		if (xe_device_has_flat_ccs(xe)) {
> +		/* Clearing BO with uncompress PTE will clear CCS metadata as well on XE2 */
> +		if (xe_device_has_flat_ccs(xe) && clear_ccs &&
> +		    !(clear_bo_data && GRAPHICS_VERx100(gt_to_xe(gt)) >= 2000)) {

Looking into Akshata's recent patch made me realized that I missed out 
on reducing batch_size when this condition is not met.


>   			emit_copy_ccs(gt, bb, clear_L0_ofs, true,
>   				      m->cleared_mem_ofs, false, clear_L0);
>   			flush_flags = MI_FLUSH_DW_CCS;
