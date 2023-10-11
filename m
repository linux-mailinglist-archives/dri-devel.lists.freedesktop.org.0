Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2C37C538A
	for <lists+dri-devel@lfdr.de>; Wed, 11 Oct 2023 14:20:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7200810E5A1;
	Wed, 11 Oct 2023 12:20:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE6DC10E5A1;
 Wed, 11 Oct 2023 12:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697026840; x=1728562840;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=ysDMd2jKNUiAWvI/yjNNE5UuFrDA/buDVF6keQFEZqU=;
 b=hmmfdoCf0ZAM/kvlC70Hwbe+Vw5E4/nFGgpBf3+TEmUOicNrTj8mnjyn
 I57xlb3VNel4QbzDfxRQ2ln2WNRE9Nu55F9LrCp05Cr/OHaEG0+QK/lab
 nocDjPN81WJeqCT0NADEOL4rNhKP34NCnIB4PI6exvnhDRGmNvmsJdWe9
 +0fQSytcuB21A5YtHXjA02I33RbDeGO2kNxs+rTuujFVLbLkXGBr2RCJ6
 skD43iVYc3bUAJGx6fE00sthC0BctTiAfe8SrWKZ+zZIsIJN/E8x86bLI
 lbuJvEwHMl5GkcYCXk6KUcj9ReHGVtfrk/2Yr8BYNKT3cidHUBYOC7Eri w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="383509338"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; d="scan'208";a="383509338"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 05:20:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="757538481"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; d="scan'208";a="757538481"
Received: from bjvanakk-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.42.111])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 05:20:38 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915: Prevent potential UAF in engine_init_common
In-Reply-To: <20231011115451.12521-1-nirmoy.das@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231011115451.12521-1-nirmoy.das@intel.com>
Date: Wed, 11 Oct 2023 15:20:34 +0300
Message-ID: <87fs2h4agd.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: dri-devel@lists.freedesktop.org, Oak Zeng <oak.zeng@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 11 Oct 2023, Nirmoy Das <nirmoy.das@intel.com> wrote:
> If measure_breadcrumb_dw() returns an error and bce isn't created,
> this commit ensures that intel_engine_destroy_pinned_context()
> is not called with a NULL bce.

So it's a potential NULL pointer dereference, not use after free like
the subject says. Please fix the subject.

BR,
Jani.


>
> Fixes: b35274993680 ("drm/i915: Create a kernel context for GGTT updates")
> Cc: Oak Zeng <oak.zeng@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_engine_cs.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> index 179d9546865b..4a11219e560e 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> @@ -1491,7 +1491,8 @@ static int engine_init_common(struct intel_engine_cs *engine)
>  	return 0;
>  
>  err_bce_context:
> -	intel_engine_destroy_pinned_context(bce);
> +	if (bce)
> +		intel_engine_destroy_pinned_context(bce);
>  err_ce_context:
>  	intel_engine_destroy_pinned_context(ce);
>  	return ret;

-- 
Jani Nikula, Intel
