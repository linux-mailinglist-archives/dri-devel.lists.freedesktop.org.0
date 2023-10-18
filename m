Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B91E7CDAAF
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 13:38:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D84E10E102;
	Wed, 18 Oct 2023 11:38:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 964B510E102;
 Wed, 18 Oct 2023 11:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697629132; x=1729165132;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=92Frp5CdplGsPc4y8TeuGfpCzj1dJMcEcjPZAhwviug=;
 b=OlRUvtKpLWlJqv7vOjlurAyLiq5quDYOPI1XRkc1oO9QT+VCLIElWE61
 EhTOAZ/rI7B8QWPfDuKkHlMv9+yQj7+f/FuHvuHtGXbxysq596hx8tZQe
 yIAV2WP9Fav1Mw/U5n3IvsxgbV5UqOhNFED6sAoGncPw6uZDAfBFyq616
 QOpWi2t25iHf3BANJcdlgZBenbMiucPpGzBrsNIFYuEYA+StRrjhLkU4D
 bf99CS1LW3e4jrktOrOsKeap3g/FHYyCWGflaKeJRNr1FLVJ4k5R388PC
 4QJ5GQ/X9/H/wfLNIN8qs6sj1baTn8ZyMZJDLEZd0Fxp0gTzkqOFdCllb A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="388858005"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; d="scan'208";a="388858005"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2023 04:38:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="822416132"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; d="scan'208";a="822416132"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.249.39.1])
 ([10.249.39.1])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2023 04:38:50 -0700
Message-ID: <84558dd8-3bfa-100d-3bfc-e779ac4e54c8@linux.intel.com>
Date: Wed, 18 Oct 2023 13:38:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2] drm/i915: Prevent potential null-ptr-deref in
 engine_init_common
Content-Language: en-US
To: Nirmoy Das <nirmoy.das@intel.com>, intel-gfx@lists.freedesktop.org
References: <20231011122547.7085-1-nirmoy.das@intel.com>
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20231011122547.7085-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This now merged. CI errors are unrelated.

On 10/11/2023 2:25 PM, Nirmoy Das wrote:
> If measure_breadcrumb_dw() returns an error and bce isn't created,
> this commit ensures that intel_engine_destroy_pinned_context()
> is not called with a NULL bce.
>
> v2: Fix the subject s/UAF/null-ptr-deref(Jani)
>
> Fixes: b35274993680 ("drm/i915: Create a kernel context for GGTT updates")
> Cc: Oak Zeng <oak.zeng@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_engine_cs.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> index 179d9546865b..4a11219e560e 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> @@ -1491,7 +1491,8 @@ static int engine_init_common(struct intel_engine_cs *engine)
>   	return 0;
>   
>   err_bce_context:
> -	intel_engine_destroy_pinned_context(bce);
> +	if (bce)
> +		intel_engine_destroy_pinned_context(bce);
>   err_ce_context:
>   	intel_engine_destroy_pinned_context(ce);
>   	return ret;
