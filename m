Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D358875FBF1
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 18:24:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B889610E33B;
	Mon, 24 Jul 2023 16:24:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D21510E337;
 Mon, 24 Jul 2023 16:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690215872; x=1721751872;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=UrlDO9w/AnWLaZUBmhVjpnmqS7Elf1R30ZuiU+UuJds=;
 b=e/RnSFkd843BXVuZa3DBcF0OAfX3TXzbdBSMk79dzVf58E0OKlBhGUvv
 l3xaQeWC3K6u2qd0+Pk22qiainlxrfZeT04aCAd7JcF9mGPX0GSS5bOS1
 hwYsoCF9ft2FCLYQRo1f7kSkjLsivV+38pX0EqdCNmU0qkBuysCcBQiTj
 i0vtEnR37tynD9reaLNaOL7Iho1C/hORUK7OpZmPe0FmJXTdkPqnTL0ca
 tiC02nk0TpjVwV+Q69kAidSfB6YzswO2m8b5roh6JkmEQ+UVgnkeDJDpT
 +ozW73FgVJkHMvzSZdM4lur+3IKa1OgZ9oS5zu+DjgU1ZTAwgoN1JzGGq A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="347093721"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="347093721"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 09:24:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="755362747"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="755362747"
Received: from gionescu-mobl2.ger.corp.intel.com (HELO intel.com)
 ([10.252.34.175])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 09:24:27 -0700
Date: Mon, 24 Jul 2023 18:24:24 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Fix an error handling path in
 igt_write_huge()
Message-ID: <ZL6luGRLCEQs0HKG@ashyti-mobl2.lan>
References: <7a036b88671312ee9adc01c74ef5b3376f690b76.1689619758.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7a036b88671312ee9adc01c74ef5b3376f690b76.1689619758.git.christophe.jaillet@wanadoo.fr>
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
 dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Matthew Auld <matthew.auld@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christophe,

On Mon, Jul 17, 2023 at 08:49:31PM +0200, Christophe JAILLET wrote:
> All error handling paths go to 'out', except this one. Be consistent and
> also branch to 'out' here.
> 
> Fixes: c10a652e239e ("drm/i915/selftests: Rework context handling in hugepages selftests")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> /!\ Speculative /!\
> 
>    This patch is based on analysis of the surrounding code and should be
>    reviewed with care !
> 
>    If the patch is wrong, maybe a comment in the code could explain why.
> 
> /!\ Speculative /!\
> ---
>  drivers/gpu/drm/i915/gem/selftests/huge_pages.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
> index df6c9a84252c..6b9f6cf50bf6 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
> @@ -1246,8 +1246,10 @@ static int igt_write_huge(struct drm_i915_private *i915,
>  	 * times in succession a possibility by enlarging the permutation array.
>  	 */
>  	order = i915_random_order(count * count, &prng);
> -	if (!order)
> -		return -ENOMEM;
> +	if (!order) {
> +		err = -ENOMEM;
> +		goto out;
> +	}

Looks good:

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Thanks,
Andi
