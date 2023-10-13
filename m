Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 573207C83B1
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 12:50:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A524E10E5D7;
	Fri, 13 Oct 2023 10:50:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC0B610E5D7;
 Fri, 13 Oct 2023 10:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697194217; x=1728730217;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=LRDq/tYbx0pKmQcqzPEGGQKnAXM5s8G9oE4j7Tq2bSs=;
 b=RGwgbOXrMPSVyAqQ3h1uDY2PXY53h0kfhQJ5ufWnB05pAiLUrlh1iRE5
 ahdeUPwO1bQougPeYCk5booMSvBX7mEaO5RnJ15WA/8LnaQqupr+EhySR
 v/LiProfbJ84bYVJjDW2C34cU4J2TQzDHKbxqFqK5lRUlHvasBFqtwZ/7
 Ta4357FO+TGgynvziGO8PakEyKLT/sA4Nyrcmm75fAHGTQNcl5ra23tDc
 II/Ja4Rgo4psjLqAOc/TJmYlIewemda3W2Z+ZOvv0k3lt/nRDmr8p0MOT
 4r/7lR8bWsQoFeOPeYYFwW672vIAHwUTyKLHU1lb/09/O3ttC8VO1MQv1 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="471388495"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; d="scan'208";a="471388495"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2023 03:50:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="758456407"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; d="scan'208";a="758456407"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmsmga007.fm.intel.com with SMTP; 13 Oct 2023 03:50:12 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 13 Oct 2023 13:50:11 +0300
Date: Fri, 13 Oct 2023 13:50:11 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH] drm/i915: Flush WC GGTT only on required platforms
Message-ID: <ZSkg47slZ25rSQK4@intel.com>
References: <20231013103140.12192-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231013103140.12192-1-nirmoy.das@intel.com>
X-Patchwork-Hint: comment
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, Jonathan Cavitt <jonathan.cavitt@intel.com>,
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org,
 Andi Shyti <andi.shyti@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 John Harrison <john.c.harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 13, 2023 at 12:31:40PM +0200, Nirmoy Das wrote:
> gen8_ggtt_invalidate() is only needed for limitted set of platforms
> where GGTT is mapped as WC

I know there is supposed to be some kind hw snooping of the ggtt
pte writes to invalidate the tlb, but are we sure GFX_FLSH_CNTL
has no other side effects we depend on?

> otherwise this can cause unwanted
> side-effects on XE_HP platforms where GFX_FLSH_CNTL_GEN6 is not
> valid.
> 
> Fixes: d2eae8e98d59 ("drm/i915/dg2: Drop force_probe requirement")
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: John Harrison <john.c.harrison@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: <stable@vger.kernel.org> # v6.2+
> Suggested-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_ggtt.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> index 4d7d88b92632..c2858d434bce 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> @@ -197,13 +197,17 @@ void gen6_ggtt_invalidate(struct i915_ggtt *ggtt)
>  
>  static void gen8_ggtt_invalidate(struct i915_ggtt *ggtt)
>  {
> +	struct drm_i915_private *i915 = ggtt->vm.i915;
>  	struct intel_uncore *uncore = ggtt->vm.gt->uncore;
>  
>  	/*
>  	 * Note that as an uncached mmio write, this will flush the
>  	 * WCB of the writes into the GGTT before it triggers the invalidate.
> +	 *
> +	 * Only perform this when GGTT is mapped as WC, see ggtt_probe_common().
>  	 */
> -	intel_uncore_write_fw(uncore, GFX_FLSH_CNTL_GEN6, GFX_FLSH_CNTL_EN);
> +	if (!IS_GEN9_LP(i915) && GRAPHICS_VER(i915) < 11)
> +		intel_uncore_write_fw(uncore, GFX_FLSH_CNTL_GEN6, GFX_FLSH_CNTL_EN);
>  }
>  
>  static void guc_ggtt_invalidate(struct i915_ggtt *ggtt)
> -- 
> 2.41.0

-- 
Ville Syrjälä
Intel
