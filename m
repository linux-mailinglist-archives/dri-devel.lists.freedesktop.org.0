Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C974C6B7222
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 10:10:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A52D610E089;
	Mon, 13 Mar 2023 09:10:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4496A10E089;
 Mon, 13 Mar 2023 09:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678698630; x=1710234630;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=XrV2lc4dSpvvrQS3aofxnFXVSslWlrjDMIZz8qmT81w=;
 b=FYJ0AC41UMkennP9g9QinTFtXC57ZKTw+ex6soUvAgKuZ725+MC9e1i5
 Q3WmtSAjmzlGFQ+vrjA1Z/Bc3Jnq3eVyXqYNcaWgmDlfSKKpZCCTw2QZz
 tIwNvWvLcSHv6CRFEuq1vewWN9Bi2PsU1VqblDBhbmv57/nAmvR8kxEYm
 YZzM2M9IEUTC7JuLAMQ+2V/egnpFrLf8CgVdTIVHA0/vJaASoHl6z2ACX
 6IbgU1cTB+McKOyzPz9wHMBGvUtAUkDHsFKuoPG0KhYc1BbTxBRkShz00
 3tn11ZyRYayxDFvIW7apY53KKBVbFim7R8kXznDsCVgt1TbYQEOUrwMeX w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="401967933"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400"; d="scan'208";a="401967933"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 02:10:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="711052229"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400"; d="scan'208";a="711052229"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by orsmga001.jf.intel.com with SMTP; 13 Mar 2023 02:10:27 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 13 Mar 2023 11:10:26 +0200
Date: Mon, 13 Mar 2023 11:10:26 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH 1/3] drm/i915: Remove redundant check for DG1
Message-ID: <ZA7oghE7c6eM/Dkr@intel.com>
References: <20230306204954.753739-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230306204954.753739-1-lucas.demarchi@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 06, 2023 at 12:49:52PM -0800, Lucas De Marchi wrote:
> dg1_gt_workarounds_init() is only ever called for DG1, so there is no
> point checking it again.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_workarounds.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> index 32aa1647721a..eb6cc4867d67 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> @@ -1472,21 +1472,15 @@ gen12_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
>  static void
>  dg1_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
>  {
> -	struct drm_i915_private *i915 = gt->i915;
> -

Looks like you pushed some stale version of this patch which
didn't remove this variable. Now the CONFIG_DRM_I915_WERROR=y
build is broken.

Did you lose that from your pre-push build .config?

>  	gen12_gt_workarounds_init(gt, wal);
>  
>  	/* Wa_1409420604:dg1 */
> -	if (IS_DG1(i915))
> -		wa_mcr_write_or(wal,
> -				SUBSLICE_UNIT_LEVEL_CLKGATE2,
> -				CPSSUNIT_CLKGATE_DIS);
> +	wa_mcr_write_or(wal, SUBSLICE_UNIT_LEVEL_CLKGATE2,
> +			CPSSUNIT_CLKGATE_DIS);
>  
>  	/* Wa_1408615072:dg1 */
>  	/* Empirical testing shows this register is unaffected by engine reset. */
> -	if (IS_DG1(i915))
> -		wa_write_or(wal, UNSLICE_UNIT_LEVEL_CLKGATE2,
> -			    VSUNIT_CLKGATE_DIS_TGL);
> +	wa_write_or(wal, UNSLICE_UNIT_LEVEL_CLKGATE2, VSUNIT_CLKGATE_DIS_TGL);
>  }
>  
>  static void
> -- 
> 2.39.0

-- 
Ville Syrjälä
Intel
