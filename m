Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA87C6E77DF
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 12:59:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A718010E12D;
	Wed, 19 Apr 2023 10:59:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2C3610E12D;
 Wed, 19 Apr 2023 10:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681901950; x=1713437950;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8JlPXaDQG7V3H8ynyEvTiTc66rhdQGbqZ+h1OiL8KMg=;
 b=cD9Viafm6p4aRCqPuOpAbTTB+JyS03o5Ippp0s3LEq2oHzpYt/5Nuod0
 HukOrt4VHX55rP3YNImXQlCFZDuWQrzvMi3BQ7T9cXKunb+nkRzr7mVnO
 MVCdXs4vXK+ByQnMymrHDkhn5BEg9QeuxgkYFMUz5hSpVSIkZZovjs+Ed
 UdXfO9f0X4R4JX3ccsR/WG1j3pO5GU5NFoeuZ9TBhhPRUbFpi4spNh66F
 bjBc3W1ey9G8gaYdzPKWBQItoyr/y0utT29DTHRvC/dq4SL1nK0nxQe9g
 dFeIgdo2TH/IM5Dxwuf3znJvKwy30jWKIYprL9xVP836G/ygA0mb2oTmM w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="373295749"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="373295749"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 03:59:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="756066315"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="756066315"
Received: from crijnder-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.249.35.137])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 03:59:07 -0700
Date: Wed, 19 Apr 2023 12:59:04 +0200
From: Andi Shyti <andi.shyti@intel.com>
To: fei.yang@intel.com
Subject: Re: [Intel-gfx] [PATCH 4/8] drm/i915/mtl: workaround coherency issue
 for Media
Message-ID: <ZD/JeMMuiJNpBX1B@ashyti-mobl2.lan>
References: <20230417062503.1884465-1-fei.yang@intel.com>
 <20230417062503.1884465-5-fei.yang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230417062503.1884465-5-fei.yang@intel.com>
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

Hi Fei,

> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> @@ -743,6 +743,13 @@ struct i915_vma *intel_guc_allocate_vma(struct intel_guc *guc, u32 size)
>  	if (IS_ERR(obj))
>  		return ERR_CAST(obj);
>  
> +	/*
> +	 * Wa_22016122933: For MTL the shared memory needs to be mapped
> +	 * as WC on CPU side and UC (PAT index 2) on GPU side

Isn't UC PAT index 3?

Andi
