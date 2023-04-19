Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF776E785A
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 13:17:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4705110E92F;
	Wed, 19 Apr 2023 11:17:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A49710E16D;
 Wed, 19 Apr 2023 11:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681903052; x=1713439052;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=QZereRYUiZz4yyZ+kkizgJFB9KX/efKkLTB1Bz9yjn8=;
 b=dy9cNO33wJod/P77KK/VJfxosdCiRrmGvbIReiFlD42otNyZtd05zXzR
 xgPEmZCrt96MsrJlpThwG+p5qwTsCQVNXPE5vavtXuKktm/WQKqeD9L0D
 Fat1xOtbLA31nIgTGu8RYpboDeYylOeoKLZwhx4dO/HimEemFw2GAJdd1
 dvULjU62D17vMDvDlNNhb7d4mC3vVD69BMwnRnZcbyLq5P8lesI9J61O0
 oi4nSghGvVVMXE+TwLPwN01jMqhmTLmfQNTXV6Z0Fv4HK2G0pMMSRNewQ
 gcxcfpHuej3kqotUVCeQLplI30eLfdmFN7kRjb0r6FwXRA+yhmBzHwsvo Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="334225558"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="334225558"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 04:17:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="756069901"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="756069901"
Received: from crijnder-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.249.35.137])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 04:17:27 -0700
Date: Wed, 19 Apr 2023 13:17:23 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: fei.yang@intel.com
Subject: Re: [PATCH 6/8] drm/i915: preparation for using PAT index
Message-ID: <ZD/Nw3lb5G7nvqps@ashyti-mobl2.lan>
References: <20230417062503.1884465-1-fei.yang@intel.com>
 <20230417062503.1884465-7-fei.yang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230417062503.1884465-7-fei.yang@intel.com>
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-gfx@lists.freedesktop.org,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Fei,

[...]

> @@ -180,6 +182,14 @@ struct drm_i915_private *mock_gem_device(void)
>  		I915_GTT_PAGE_SIZE_2M;
>  
>  	RUNTIME_INFO(i915)->memory_regions = REGION_SMEM;
> +
> +

double space here, otherwise:

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Andi

> +	/* simply use legacy cache level for mock device */
> +	i915_info = (struct intel_device_info *)INTEL_INFO(i915);
> +	i915_info->max_pat_index = 3;
> +	for (i = 0; i < I915_MAX_CACHE_LEVEL; i++)
> +		i915_info->cachelevel_to_pat[i] = i;
> +
>  	intel_memory_regions_hw_probe(i915);
>  
>  	spin_lock_init(&i915->gpu_error.lock);
> -- 
> 2.25.1
