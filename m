Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2284A4BC175
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 21:56:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5763010E14F;
	Fri, 18 Feb 2022 20:56:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB23A10E14F;
 Fri, 18 Feb 2022 20:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645217773; x=1676753773;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=gCWzRHU3FmfqP6z4ucIUIRXirwWZn1bTYNHU7ZQCx5s=;
 b=WPFGQvct3MGgtjVGXhy9/z3Q224h6L7J9CHPvgOBxrR7gB6KfCsIsgIC
 BgcD2CgsR1ajcCczs0Ajc+WAYDm2lr+m862cTJp6MJpd36qLacnWwsPvb
 TWc970wPpLGnKAmvL7HmQfIN3Cm9F3De6e6F3zUuyT3xoroaEEpQiKgUC
 26848hsaCrwemO7t4Yz+E2+TdyF4NfXUJel4EI4aP4H+GTfBEiyBXwmqN
 gzwPCyVeyJrUMaqD8UlwuDa5JUePNskfIQXPBap/uJSE9BHmVTgUnFp8d
 Eai+mULSX0m8+svubJIRDn3BX8r1AeGIcbK5PDTBC8LTcxhnwuYdwpvGV g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10262"; a="248800897"
X-IronPort-AV: E=Sophos;i="5.88,379,1635231600"; d="scan'208";a="248800897"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 12:56:13 -0800
X-IronPort-AV: E=Sophos;i="5.88,379,1635231600"; d="scan'208";a="705521519"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 12:56:12 -0800
Date: Fri, 18 Feb 2022 12:50:22 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH v3 13/16] drm/i915/guc: Convert capture list to iosys_map
Message-ID: <20220218205021.GA3475@jons-linux-dev-box>
References: <20220216174147.3073235-1-lucas.demarchi@intel.com>
 <20220216174147.3073235-14-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220216174147.3073235-14-lucas.demarchi@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 16, 2022 at 09:41:44AM -0800, Lucas De Marchi wrote:
> Use iosys_map to write the fields ads.capture_*.
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> index c3c31b679e79..ec0ccdf98dfa 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> @@ -580,7 +580,7 @@ static void guc_init_golden_context(struct intel_guc *guc)
>  	GEM_BUG_ON(guc->ads_golden_ctxt_size != total_size);
>  }
>  
> -static void guc_capture_list_init(struct intel_guc *guc, struct __guc_ads_blob *blob)
> +static void guc_capture_list_init(struct intel_guc *guc)
>  {
>  	int i, j;
>  	u32 addr_ggtt, offset;
> @@ -592,11 +592,11 @@ static void guc_capture_list_init(struct intel_guc *guc, struct __guc_ads_blob *
>  
>  	for (i = 0; i < GUC_CAPTURE_LIST_INDEX_MAX; i++) {
>  		for (j = 0; j < GUC_MAX_ENGINE_CLASSES; j++) {
> -			blob->ads.capture_instance[i][j] = addr_ggtt;
> -			blob->ads.capture_class[i][j] = addr_ggtt;
> +			ads_blob_write(guc, ads.capture_instance[i][j], addr_ggtt);
> +			ads_blob_write(guc, ads.capture_class[i][j], addr_ggtt);
>  		}
>  
> -		blob->ads.capture_global[i] = addr_ggtt;
> +		ads_blob_write(guc, ads.capture_global[i], addr_ggtt);
>  	}
>  }
>  
> @@ -636,7 +636,7 @@ static void __guc_ads_init(struct intel_guc *guc)
>  	base = intel_guc_ggtt_offset(guc, guc->ads_vma);
>  
>  	/* Capture list for hang debug */
> -	guc_capture_list_init(guc, blob);
> +	guc_capture_list_init(guc);
>  
>  	/* ADS */
>  	blob->ads.scheduler_policies = base + ptr_offset(blob, policies);
> -- 
> 2.35.1
> 
