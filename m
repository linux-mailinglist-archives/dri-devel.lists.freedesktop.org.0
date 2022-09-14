Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 624E25B896E
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 15:47:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C85810E91E;
	Wed, 14 Sep 2022 13:47:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5453110E91D;
 Wed, 14 Sep 2022 13:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663163243; x=1694699243;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=AbbpJQRoHzCPC9FuDp2OOdePPV7CP5RMw0+tM19yp94=;
 b=fNoxgeZ3yh3Tjkofrq1Uac1pVZRyuEACPAygx84Bsdi+6Rqm9Mo7OGC4
 56CjZ56kK84RkcjTlVY8p7Mxl5EQnlV4pEZShcJS5wCVJjKga+sYg0ZLI
 ljWRP8n/j+lRFBi3y6+FBFSyiM90TMjiklHkL+FVCeJvOUv2TSSTRnnvE
 168Z4P30dNBpi8dDhcAPTNxZM1yKDmGtCs4yvoVQAjK0bS7zCR1VFH1Jm
 UBp1PWMqjy3vP/64frhSUqWwGgQY3kWG884Po/dUxPgWMOrgrou8Tq4+F
 IyRuS5APsUL/k7jsQZMr8d0D64byXxLiEsPeAZfiBSO2F5QOO7HD8z+tE g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10470"; a="362394483"
X-IronPort-AV: E=Sophos;i="5.93,315,1654585200"; d="scan'208";a="362394483"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2022 06:47:22 -0700
X-IronPort-AV: E=Sophos;i="5.93,315,1654585200"; d="scan'208";a="647396551"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.25.8])
 ([10.213.25.8])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2022 06:47:19 -0700
Message-ID: <acfbd345-e0e8-263c-ac7e-06d8419cdc90@intel.com>
Date: Wed, 14 Sep 2022 15:47:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.2
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Fix return type of mode_valid
 function hook
Content-Language: en-US
To: Nathan Huckleberry <nhuck@google.com>
References: <20220913205531.155046-1-nhuck@google.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20220913205531.155046-1-nhuck@google.com>
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
Cc: Nick Desaulniers <ndesaulniers@google.com>,
 Dan Carpenter <error27@gmail.com>, David Airlie <airlied@linux.ie>,
 Tom Rix <trix@redhat.com>, intel-gfx@lists.freedesktop.org,
 llvm@lists.linux.dev, Lucas De Marchi <lucas.demarchi@intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Nathan Chancellor <nathan@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13.09.2022 22:55, Nathan Huckleberry wrote:
> All of the functions used for intel_dvo_dev_ops.mode_valid have a return
> type of enum drm_mode_status, but the mode_valid field in the struct
> definition has a return type of int.
> 
> The mismatched return type breaks forward edge kCFI since the underlying
> function definitions do not match the function hook definition.
> 
> The return type of the mode_valid field should be changed from int to
> enum drm_mode_status.
> 
> Reported-by: Dan Carpenter <error27@gmail.com>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1703
> Cc: llvm@lists.linux.dev
> Signed-off-by: Nathan Huckleberry <nhuck@google.com>

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

> ---
>   drivers/gpu/drm/i915/display/intel_dvo_dev.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dvo_dev.h b/drivers/gpu/drm/i915/display/intel_dvo_dev.h
> index d96c3cc46e50..50205f064d93 100644
> --- a/drivers/gpu/drm/i915/display/intel_dvo_dev.h
> +++ b/drivers/gpu/drm/i915/display/intel_dvo_dev.h
> @@ -75,8 +75,8 @@ struct intel_dvo_dev_ops {
>   	 *
>   	 * \return MODE_OK if the mode is valid, or another MODE_* otherwise.
>   	 */
> -	int (*mode_valid)(struct intel_dvo_device *dvo,
> -			  struct drm_display_mode *mode);
> +	enum drm_mode_status (*mode_valid)(struct intel_dvo_device *dvo,
> +					   struct drm_display_mode *mode);
>   
>   	/*
>   	 * Callback for preparing mode changes on an output

