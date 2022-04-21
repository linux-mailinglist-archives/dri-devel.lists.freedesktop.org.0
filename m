Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D2F509A00
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 09:57:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C420410F4AB;
	Thu, 21 Apr 2022 07:57:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0785710F49D;
 Thu, 21 Apr 2022 07:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650527821; x=1682063821;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=cE8WTgy5ECF47TMzRrbashFPxU3H/xNSvuDxHsysfSU=;
 b=fE0rFn4FSeocsXiIU+tPZjZU262OaRbbCwcGD7cc+fFt2zy0fr+6WERK
 pyDLdEmOQL7FOKDC4yn/+lIYs0jhhCVcI4mzT9dO+C2dHxAVa/sL52SUU
 ue3IsLNmNLYMmzIggO/EwzzO/YB1wgkledsdJrPERK9yUEYswRMlSIUZY
 1Fsy6kv31V6pdgyLT5R9eVByVwj/m+3Tatr9cX43XgArCmv7Cshc2DUjK
 I1foDB9OwZ8qSNHieYfbpGF4tkeg5f+InhTsfgUKoW4mL4dxlCMGZsyKg
 d2gWDrCsZpufNVcwO6PpkotNFegI4o9L34JyjG7/nLD/EXOjaQaLnLAdi A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10323"; a="350720117"
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; d="scan'208";a="350720117"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 00:57:00 -0700
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; d="scan'208";a="530161645"
Received: from bshawkat-mobl.ger.corp.intel.com (HELO [10.251.215.159])
 ([10.251.215.159])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 00:56:58 -0700
Message-ID: <84d4003e-626e-31f3-56da-c9344bc34c19@linux.intel.com>
Date: Thu, 21 Apr 2022 09:56:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 1/2] drm/i915/selftests: fixup min_alignment usage
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220406193037.1060769-1-matthew.auld@intel.com>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <20220406193037.1060769-1-matthew.auld@intel.com>
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

On 4/6/2022 9:30 PM, Matthew Auld wrote:
> Trying to cast the region id into the region type doesn't work too well,
> since the i915_vm_min_alignment() won't give us the correct value for
> the stolen-lmem case.
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Nirmoy Das <nirmoy.das@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/selftests/i915_gem_gtt.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
> index 5c9bfa409ff5..bccc49a8ab5e 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
> @@ -1150,7 +1150,7 @@ static int misaligned_pin(struct i915_address_space *vm,
>   		flags |= PIN_GLOBAL;
>   
>   	for_each_memory_region(mr, vm->i915, id) {
> -		u64 min_alignment = i915_vm_min_alignment(vm, (enum intel_memory_type)id);
> +		u64 min_alignment = i915_vm_min_alignment(vm, mr->type);
>   		u64 size = min_alignment;
>   		u64 addr = round_down(hole_start + (hole_size / 2), min_alignment);
>   
