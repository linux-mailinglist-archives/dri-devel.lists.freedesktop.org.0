Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 411DC557871
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 13:09:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3683410E3C4;
	Thu, 23 Jun 2022 11:09:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EACF910E10D;
 Thu, 23 Jun 2022 11:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655982538; x=1687518538;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=+2Fzm0IiC8LmVdtB96+NVSttwdYC7NP4ky6hE0ZGRnc=;
 b=It+GYYJ3XpztgixGazbRF8ap6IfwC2PnT52MIai4+ix5QaXG3E3XITQ8
 oIuhvrwGpGUXCEn0T8A2QlSXQBRseSluaYkHLKtT1McKM62RDFN7zOzMQ
 ircdUUrpwxPRzwR/KhdPv5ESlq7oMf/eGJpp5KuNz5usx0MdvNhjNgL59
 xq084c9lc67a0kd2Y+DABkqYb9KexQxlPR8TCKNrtoMnHvk914sZwF2he
 FFNFzG6up6QMBmJmQ1ELwq6k29pDVMPwIUDtYMkgzMVEF++5DV8BwrGXn
 sOOywVEkqJFaaZZCTG77GWKtn2Mc2aJHRFKSwp3RO9Fdncogu8Bo99GIk w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10386"; a="260505729"
X-IronPort-AV: E=Sophos;i="5.92,215,1650956400"; d="scan'208";a="260505729"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2022 04:08:58 -0700
X-IronPort-AV: E=Sophos;i="5.92,215,1650956400"; d="scan'208";a="592659100"
Received: from hazegrou-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.251.216.121])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2022 04:08:53 -0700
Date: Thu, 23 Jun 2022 13:08:50 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH 3/6] drm/i915/gt: Skip TLB invalidations once wedged
Message-ID: <YrRJwjkT0raLhQd+@intel.intel>
References: <cover.1655306128.git.mchehab@kernel.org>
 <9d9e663ca8e97becf04e1d4c8cb8a9a1f397a5f1.1655306128.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9d9e663ca8e97becf04e1d4c8cb8a9a1f397a5f1.1655306128.git.mchehab@kernel.org>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Fei Yang <fei.yang@intel.com>, Chris Wilson <chris.p.wilson@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Dave Airlie <airlied@redhat.com>,
 Thomas =?iso-8859-15?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, mauro.chehab@linux.intel.com,
 =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 John Harrison <John.C.Harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mauro,

On Wed, Jun 15, 2022 at 04:27:37PM +0100, Mauro Carvalho Chehab wrote:
> From: Chris Wilson <chris.p.wilson@intel.com>
> 
> Skip all further TLB invalidations once the device is wedged and
> had been reset, as, on such cases, it can no longer process instructions
> on the GPU and the user no longer has access to the TLB's in each engine.
> 
> Fixes: 7938d61591d3 ("drm/i915: Flush TLBs before releasing backing store")
> 
> Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
> Cc: Fei Yang <fei.yang@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: stable@vger.kernel.org
> Acked-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
> 
> See [PATCH 0/6] at: https://lore.kernel.org/all/cover.1655306128.git.mchehab@kernel.org/
> 
>  drivers/gpu/drm/i915/gt/intel_gt.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> index 61b7ec5118f9..fb4fd5273ca4 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -1226,6 +1226,9 @@ void intel_gt_invalidate_tlbs(struct intel_gt *gt)
>  	if (I915_SELFTEST_ONLY(gt->awake == -ENODEV))
>  		return;
>  
> +	if (intel_gt_is_wedged(gt))
> +		return;
> +

This looks familiar :)

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
