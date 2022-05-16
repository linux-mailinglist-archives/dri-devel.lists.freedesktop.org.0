Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F963527F47
	for <lists+dri-devel@lfdr.de>; Mon, 16 May 2022 10:09:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09D7610E683;
	Mon, 16 May 2022 08:09:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9064510E683;
 Mon, 16 May 2022 08:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652688559; x=1684224559;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=rtmUfwRobNgOUKCu8Kndc1nh8Fab/4DtVLws8E6mHNY=;
 b=mYXcj/hZ1zJCt872DWlCRSI+eMcHnuMUj6M5MetjM+Q1aVJ3MAaunOYX
 nlUMLbgddgLBTcjY5wxA+DgrQJiv/owspWZuXxnpdTNwbhGdHJxaa1nJN
 8ZBXHX7boESZUSSbZuh2aph3GjLT+t/0g+OXcwYnKY4wAxYkBSXhpwgeW
 eRyH7fk48uWgPzt3JISG+2aiElbNZ0Fp22DEJl8A8cR5XlMK1fCUeqqmC
 jV14iPtohSLoNgdJE7g5n8UDScQj9TKjPXhePmpu3xkv6r6g2IXDuHw3+
 gRHWXRoTlN1rmCu5EQxKx2KP9tp6aZw+WLlaEtOXhOry8zxtBTh2N3cwB A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10348"; a="252835945"
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; d="scan'208";a="252835945"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2022 01:09:15 -0700
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; d="scan'208";a="741135054"
Received: from jrozansk-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.130.253])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2022 01:09:13 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc/rc: Use i915_probe_error
 instead of drm_error
In-Reply-To: <b8f729f5f04adf6203c192b9226fc80ffb53a6d3.camel@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220506054142.5025-1-vinay.belgaumkar@intel.com>
 <b8f729f5f04adf6203c192b9226fc80ffb53a6d3.camel@intel.com>
Date: Mon, 16 May 2022 11:09:09 +0300
Message-ID: <87y1z1hpay.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 13 May 2022, "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com> wrote:
> Nit: not sure why we use ERR_PTR for int when calling func was also returning an int.
> Anyway, that was how the original code was, so:

%pe on an error pointer prints the symbolic error name if
CONFIG_SYMBOLIC_ERRNAME=y and the errno is known, decimal error code
otherwise. It's not obvious, basically all the non-standard printf
formats are a bit mysterious, but there's also no neat alternative.


BR,
Jani.


>
> Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com>
>
>
> On Thu, 2022-05-05 at 22:41 -0700, Vinay Belgaumkar wrote:
>> To avoid false positives in error injection cases.
>> 
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>  drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c | 5 ++---
>>  1 file changed, 2 insertions(+), 3 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
>> index e00661fb0853..8f8dd05835c5 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
>> @@ -49,7 +49,6 @@ static int guc_action_control_gucrc(struct intel_guc *guc, bool enable)
>>  static int __guc_rc_control(struct intel_guc *guc, bool enable)
>>  {
>>  	struct intel_gt *gt = guc_to_gt(guc);
>> -	struct drm_device *drm = &guc_to_gt(guc)->i915->drm;
>>  	int ret;
>>  
>>  	if (!intel_uc_uses_guc_rc(&gt->uc))
>> @@ -60,8 +59,8 @@ static int __guc_rc_control(struct intel_guc *guc, bool enable)
>>  
>>  	ret = guc_action_control_gucrc(guc, enable);
>>  	if (ret) {
>> -		drm_err(drm, "Failed to %s GuC RC (%pe)\n",
>> -			str_enable_disable(enable), ERR_PTR(ret));
>> +		i915_probe_error(guc_to_gt(guc)->i915, "Failed to %s GuC RC (%pe)\n",
>> +				 str_enable_disable(enable), ERR_PTR(ret));
>>  		return ret;
>>  	}
>>  
>> -- 
>> 2.35.1
>> 
>

-- 
Jani Nikula, Intel Open Source Graphics Center
