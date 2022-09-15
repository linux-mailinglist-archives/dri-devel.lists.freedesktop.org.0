Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C635B9588
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 09:39:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 826DB10E145;
	Thu, 15 Sep 2022 07:39:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1048510EAB0;
 Thu, 15 Sep 2022 07:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663227579; x=1694763579;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=qT4pK26WhnKxnisAOU+dg9Nial+Fkme5ipurw767x5k=;
 b=RzMa89iJ/S0RSC0NIozaptmgJ6JLx4PQC6Znkk9ydsZwkczZnch4Ptmd
 ZeBRdVk1VCCejbcv8KH9CkFg4NcvJ7cH6v1Bkj9SFJZGWBdxWmA6kxrDo
 Lrgg0UxQYtxUcSLULB0PyRwUp7/ubibQSbkX1T2SsOKMqYu790lgXx43m
 3z9efDS3ov2/9qiScl6xtElH7qtZ9U1IfGsufX3xAwY9tm6Rk4hiuHg1M
 jPvK1DJVy+6c+RZ5+pEgZEBUpLKeAey2AClKgtr55sdgdtGFFsiIfppW+
 Q0jCbcrYT4i7Q/pQpEla7OjF9+9zU+CRE+Xb/R0TVKtrBA4BFabxsaZIR Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10470"; a="324901042"
X-IronPort-AV: E=Sophos;i="5.93,317,1654585200"; d="scan'208";a="324901042"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2022 00:39:38 -0700
X-IronPort-AV: E=Sophos;i="5.93,317,1654585200"; d="scan'208";a="685618048"
Received: from edgarisx-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.58.204])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2022 00:39:33 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Nathan Chancellor <nathan@kernel.org>, Nathan Huckleberry
 <nhuck@google.com>
Subject: Re: [PATCH] drm/i915: Fix return type of mode_valid function hook
In-Reply-To: <YyEP7W/yZAyhNtTX@dev-arch.thelio-3990X>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220913205531.155046-1-nhuck@google.com>
 <YyEP7W/yZAyhNtTX@dev-arch.thelio-3990X>
Date: Thu, 15 Sep 2022 10:39:26 +0300
Message-ID: <87v8pp13yp.fsf@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, llvm@lists.linux.dev,
 Dan Carpenter <error27@gmail.com>, David Airlie <airlied@linux.ie>,
 Tom Rix <trix@redhat.com>, intel-gfx@lists.freedesktop.org,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 13 Sep 2022, Nathan Chancellor <nathan@kernel.org> wrote:
> On Tue, Sep 13, 2022 at 01:55:27PM -0700, Nathan Huckleberry wrote:
>> All of the functions used for intel_dvo_dev_ops.mode_valid have a return
>> type of enum drm_mode_status, but the mode_valid field in the struct
>> definition has a return type of int.
>> 
>> The mismatched return type breaks forward edge kCFI since the underlying
>> function definitions do not match the function hook definition.
>> 
>> The return type of the mode_valid field should be changed from int to
>> enum drm_mode_status.
>> 
>> Reported-by: Dan Carpenter <error27@gmail.com>
>> Link: https://github.com/ClangBuiltLinux/linux/issues/1703
>> Cc: llvm@lists.linux.dev
>> Signed-off-by: Nathan Huckleberry <nhuck@google.com>
>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>

Thanks for the patch and reviews, pushed to drm-intel-next.

BR,
Jani.

>
>> ---
>>  drivers/gpu/drm/i915/display/intel_dvo_dev.h | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/i915/display/intel_dvo_dev.h b/drivers/gpu/drm/i915/display/intel_dvo_dev.h
>> index d96c3cc46e50..50205f064d93 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dvo_dev.h
>> +++ b/drivers/gpu/drm/i915/display/intel_dvo_dev.h
>> @@ -75,8 +75,8 @@ struct intel_dvo_dev_ops {
>>  	 *
>>  	 * \return MODE_OK if the mode is valid, or another MODE_* otherwise.
>>  	 */
>> -	int (*mode_valid)(struct intel_dvo_device *dvo,
>> -			  struct drm_display_mode *mode);
>> +	enum drm_mode_status (*mode_valid)(struct intel_dvo_device *dvo,
>> +					   struct drm_display_mode *mode);
>>  
>>  	/*
>>  	 * Callback for preparing mode changes on an output
>> -- 
>> 2.37.2.789.g6183377224-goog
>> 

-- 
Jani Nikula, Intel Open Source Graphics Center
