Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAE09961A8
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 10:00:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99CFC10E67E;
	Wed,  9 Oct 2024 08:00:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cw4uHIFN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F304510E67A;
 Wed,  9 Oct 2024 08:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728460847; x=1759996847;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=X5Dfbqv7Nkw22/0CScbgBIGsF0hB+LEpROaW0FgeghM=;
 b=Cw4uHIFNuV4m6IAA37kopDl0D9SyH9KvZBD00ZJF7Tj6yv6HIqLFbB46
 0MMDHIpflrGFw2hW1/84Gqx6+YwTarV5ZDAoWRKaztiIWAkHEevkCXv6W
 8mYoEKsLwK2H9+1r32qMZRdVFu7wvU9uLstdpD30wQwJdzMZ9danTyatF
 Spb72V1DcikfWciQyntUF1YT/vSQMN7rGMpviCMlhTCPzLYVgAivv/cx+
 duzrxFNxPSI2HPsHkBANTZJgecv7xm4LVf66CoxEpZqnt2OGWmF1f0HyV
 Ip79GNEdfMsFLWr3mLSpTjWATBsd3x0PpPATiEiWsV4V4BMSHsxAno07s A==;
X-CSE-ConnectionGUID: 7tf6qqB7Qrmvj9P3cGoCLg==
X-CSE-MsgGUID: 7FUts6RaSzGnou/sSRpE/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="27694029"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="27694029"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 01:00:47 -0700
X-CSE-ConnectionGUID: K98xMOjVSFOEkwHLmsYsCA==
X-CSE-MsgGUID: OR7jKexLTJuREao8BW2T6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="76989952"
Received: from yarbov-mobl2.ger.corp.intel.com (HELO [10.245.131.59])
 ([10.245.131.59])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 01:00:41 -0700
Message-ID: <a156ef31-2614-41c9-9df6-acd6d2fcf6cb@linux.intel.com>
Date: Wed, 9 Oct 2024 10:00:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Fix deference after check
To: "Everest K.C." <everestkc@everestkc.com.np>, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch
Cc: skhan@linuxfoundation.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241008205352.4480-1-everestkc@everestkc.com.np>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20241008205352.4480-1-everestkc@everestkc.com.np>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 10/8/2024 10:53 PM, Everest K.C. wrote:
> The `if (!snapshot->copy)` evaluates to True only when `snapshot->copy`
> is Null. Thus, derefrencing `snapshot->copy` inside this if block is
> equivalent to Null pointer derefrencing.
> The `if` condition is now changed to evaluate to true only when
> `snapshot->copy` is not Null.
> This issue was reported by Coverity Scan.
>
> Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>

Fixes: d8ce1a977226 ("drm/xe/guc: Use a two stage dump for GuC logs and add more info")

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_log.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
> index 7fbc56cceaba..4e1a5e8ba1e3 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log.c
> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
> @@ -122,7 +122,7 @@ void xe_guc_log_snapshot_free(struct xe_guc_log_snapshot *snapshot)
>  	if (!snapshot)
>  		return;
>  
> -	if (!snapshot->copy) {
> +	if (snapshot->copy) {
>  		for (i = 0; i < snapshot->num_chunks; i++)
>  			kfree(snapshot->copy[i]);
>  		kfree(snapshot->copy);
