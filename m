Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAAB26D6BF5
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 20:27:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09D9610E740;
	Tue,  4 Apr 2023 18:27:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2D0A10E740;
 Tue,  4 Apr 2023 18:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680632849; x=1712168849;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=KnO2YvApeiTn7Ru1PSHJ3CBR220BzOr6sxFTg0H8bxU=;
 b=Xl6le2nQIyM0NBizAn2NGMHGpdVURRMRp+Vo1YNIbaY8GktFCOuom65c
 eYa+GYfy8EYgVCM1o1e7QLKr6wZiHXDjooUgJoDGyWqyCGz1JJ6Al+Ztn
 MZPxqiOKKdTxf1saSRyONCBn7qCElPug8UCTT9dwoh6tiqUVYXMBg8EUe
 0PC7Crs6fH75qZfYGnTusdD7RS54hezHV47dyGC2RZfTRG5a6poa4k0DQ
 sTX1C7eZ9pxiqbRuAwoPfpXh/N0i/LnxF5i6W1+DnyEzJXKVIDm6G4IGN
 FdNgY6HQtI79NJTIIptX0fIsbr7sdZHNCSkOP0utsBrjORmZnvGiTythr Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="428556638"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="428556638"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 11:27:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="686470656"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="686470656"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by orsmga002.jf.intel.com with SMTP; 04 Apr 2023 11:27:25 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 04 Apr 2023 21:27:24 +0300
Date: Tue, 4 Apr 2023 21:27:24 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [Intel-gfx] [PATCH v3] drm/i915/mtl: Disable stolen memory
 backed FB for A0
Message-ID: <ZCxsDA86FrHzL7Rk@intel.com>
References: <20230404181342.23362-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230404181342.23362-1-nirmoy.das@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 04, 2023 at 08:13:42PM +0200, Nirmoy Das wrote:
> Stolen memory is not usable for MTL A0 stepping beyond
> certain access size and we have no control over userspace
> access size of /dev/fb which can be backed by stolen memory.
> So disable stolen memory backed fb by setting i915->dsm.usable_size
> to zero.
> 
> v2: remove hsdes reference and fix commit message(Andi)
> v3: use revid as we want to target SOC stepping(Radhakrishna)
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_stolen.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> index 8ac376c24aa2..ee492d823f1b 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> @@ -535,6 +535,14 @@ static int i915_gem_init_stolen(struct intel_memory_region *mem)
>  	/* Basic memrange allocator for stolen space. */
>  	drm_mm_init(&i915->mm.stolen, 0, i915->dsm.usable_size);
>  
> +	/*
> +	 * Access to stolen lmem beyond certain size for MTL A0 stepping
> +	 * would crash the machine. Disable stolen lmem for userspace access
> +	 * by setting usable_size to zero.
> +	 */
> +	if (IS_METEORLAKE(i915) && INTEL_REVID(i915) == 0x0)
> +		i915->dsm.usable_size = 0;

That certainly won't prevent FBC from using stolen.
Are we sure that FBC accesses are fine?

> +
>  	return 0;
>  }
>  
> -- 
> 2.39.0

-- 
Ville Syrjälä
Intel
