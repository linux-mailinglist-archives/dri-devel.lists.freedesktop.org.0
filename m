Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 414A35116E3
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 14:42:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC9B310F405;
	Wed, 27 Apr 2022 12:42:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 610D010F405;
 Wed, 27 Apr 2022 12:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651063331; x=1682599331;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=p5ZMZYZFq5UMrseA9t9TquK1bnFMyt/M5EpZ1XH+Gq8=;
 b=GQmZfsPxlpUoYru3xW66K7umWslO+YrIRihc8dd+cwn9w0hntu6R+xnf
 zPn38lk0LirqLLA6LclY5+d817uMB1gWtrR+WoObU6HmZDpQgn3Mk+XkC
 kzLVL2VWLqgTddH++Ppq77tomk19/lUvoq6NPaZB4T2xzfqqBRBFxqjWC
 eeaiIu68uvs7ZjlkPoBNV4C7aht3dwZdHjcmjuFjHBzRa7xBNEQvM39fJ
 q1fle0QflbaMWPxmUmwolR93p+oTQTtd6UuJX0UQVb5Fxod15WxeUycVs
 jcSynJwG2ghGEYFFR4tRP6LGd+pV2+hoLCQWFjhYr/6iQkOvDUI65QifD A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="328857967"
X-IronPort-AV: E=Sophos;i="5.90,293,1643702400"; d="scan'208";a="328857967"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 05:42:10 -0700
X-IronPort-AV: E=Sophos;i="5.90,293,1643702400"; d="scan'208";a="808013185"
Received: from iqirene-mobl.amr.corp.intel.com (HELO intel.com)
 ([10.255.37.224])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 05:42:10 -0700
Date: Wed, 27 Apr 2022 08:42:02 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: Re: [Intel-gfx] [PATCH 4/4] drm/i915/huc: Don't fail the probe if
 HuC init fails
Message-ID: <Ymk6GmkbyDuqsiCl@intel.com>
References: <20220427002617.1767295-1-daniele.ceraolospurio@intel.com>
 <20220427002617.1767295-5-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220427002617.1767295-5-daniele.ceraolospurio@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 26, 2022 at 05:26:17PM -0700, Daniele Ceraolo Spurio wrote:
> The previous patch introduced new failure cases in the HuC init flow
> that can be hit by simply changing the config, so we want to avoid
> failing the probe in those scenarios. HuC load failure is already
> considered a non-fatal error and we have a way to report to userspace
> if the HuC is not available via a dedicated getparam, so no changes
> in expectation there.
> The error message in the HuC init code has also been lowered to info to
> avoid throwing error message for an expected behavior.
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/uc/intel_huc.c |  2 +-
>  drivers/gpu/drm/i915/gt/uc/intel_uc.c  | 11 ++---------
>  2 files changed, 3 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> index 76a7df7f136fc..3d2e7a6d7c1b7 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> @@ -113,7 +113,7 @@ int intel_huc_init(struct intel_huc *huc)
>  	return 0;
>  
>  out:
> -	i915_probe_error(i915, "failed with %d\n", err);
> +	drm_info(&i915->drm, "HuC init failed with %d\n", err);
>  	return err;
>  }
>  
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> index 0dce94f896a8c..ecf149c5fdb02 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> @@ -323,17 +323,10 @@ static int __uc_init(struct intel_uc *uc)
>  	if (ret)
>  		return ret;
>  
> -	if (intel_uc_uses_huc(uc)) {
> -		ret = intel_huc_init(huc);
> -		if (ret)
> -			goto out_guc;
> -	}
> +	if (intel_uc_uses_huc(uc))
> +		intel_huc_init(huc);
>  
>  	return 0;
> -
> -out_guc:
> -	intel_guc_fini(guc);
> -	return ret;
>  }
>  
>  static void __uc_fini(struct intel_uc *uc)
> -- 
> 2.25.1
> 
