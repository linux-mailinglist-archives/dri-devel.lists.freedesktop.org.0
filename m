Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B27729350C6
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2024 18:40:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 205CA10EA42;
	Thu, 18 Jul 2024 16:40:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kw78aeuQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BF3A10EA3D;
 Thu, 18 Jul 2024 16:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721320848; x=1752856848;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=iwMo4uGnFLCSgWMjbiYPbhUl8wXBNtFC1eoC4nOEuF0=;
 b=kw78aeuQ1CPSiWGlS1m5yrOnsUJJatslG/3GQDJ9rFHvfaNs18C2AoFz
 Ztg58hMEG9BY4mEi1OLXamhdjixrIY4poRwaHkMcY/NuAnCRBgBOc1Ql4
 X+GURg6djaqg/MvauWNhXOND51VdfTG5Z83XM2QtDeh4YgpjQWVB9WIhg
 G5HDR8Fu8N3xMg66Eo/k0FD1mW3a8BiA3bss5FN6RYvjB+1JduS4gqcu7
 k45CxFgbNvjbM/Wj9fSsimEEPZv+NG5fk4LPSaIVfhbb03PDoyCYgXzRG
 LTMmQ2i5jOPubTU5qfnMPrizWgY08CPUDRprfm6bD5eOOPdFoO2fWfhFW A==;
X-CSE-ConnectionGUID: RJJkomO6RsazvM6n7cmiJA==
X-CSE-MsgGUID: EangzGMXSKqvjqEVFl10Jg==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="36436735"
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; d="scan'208";a="36436735"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 09:40:48 -0700
X-CSE-ConnectionGUID: j27FFOJ8S9+cfe3TS/nqDQ==
X-CSE-MsgGUID: ADhaGWStQTWH33VDQZ6OLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; d="scan'208";a="81461264"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO [10.245.244.207])
 ([10.245.244.207])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 09:40:47 -0700
Message-ID: <b0af2f0f-40c6-455e-8c74-ee075950867e@intel.com>
Date: Thu, 18 Jul 2024 17:40:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] drm/xe/migrate: Clear CCS when clearing bo on xe2
To: Nirmoy Das <nirmoy.das@intel.com>, dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
References: <20240704081841.30212-1-nirmoy.das@intel.com>
 <20240704081841.30212-3-nirmoy.das@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
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

On 04/07/2024 09:18, Nirmoy Das wrote:
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

I assume this uses coherency 1way+ mode for that pat index? We could 
potentially use coh_none instead, for the case where bo.cpu_caching != 
wb. In theory that should be faster, but could be ignored for now.

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
>   			emit_copy_ccs(gt, bb, clear_L0_ofs, true,
>   				      m->cleared_mem_ofs, false, clear_L0);
>   			flush_flags = MI_FLUSH_DW_CCS;
