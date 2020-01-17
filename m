Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28082140A7C
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2020 14:14:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E82B6E524;
	Fri, 17 Jan 2020 13:14:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6043E6E524;
 Fri, 17 Jan 2020 13:14:32 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jan 2020 05:14:31 -0800
X-IronPort-AV: E=Sophos;i="5.70,330,1574150400"; d="scan'208";a="214472142"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jan 2020 05:14:28 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Andi Shyti <andi.shyti@intel.com>, Zhang Xiaoxu <zhangxiaoxu5@huawei.com>
Subject: Re: [PATCH] drm/i915: Fix i915_error_state_store error defination
In-Reply-To: <20200117121550.GA3238@intel.intel>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200117073436.6507-1-zhangxiaoxu5@huawei.com>
 <20200117121550.GA3238@intel.intel>
Date: Fri, 17 Jan 2020 15:14:25 +0200
Message-ID: <87tv4ugr7y.fsf@intel.com>
MIME-Version: 1.0
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
Cc: airlied@linux.ie, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rodrigo.vivi@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 17 Jan 2020, Andi Shyti <andi.shyti@intel.com> wrote:
> Hi Zhang,
>
> On Fri, Jan 17, 2020 at 03:34:36PM +0800, Zhang Xiaoxu wrote:
>> Since commit 742379c0c4001 ("drm/i915: Start chopping up the GPU error
>> capture"), function 'i915_error_state_store' was defined and used with
>> only one parameter.
>> 
>> But if no 'CONFIG_DRM_I915_CAPTURE_ERROR', this function was defined
>> with two parameter.
>> 
>> This may lead compile error. This patch fix it.
>> 
>> Reported-by: Hulk Robot <hulkci@huawei.com>
>
> I've never been a fan of non human accounts, we had this discussion
> already in a different mailing list. Could you please find a
> different way of giving credit to your CI system?

I don't actually mind for Reported-by credits. The history is full of
things like:

    Reported-by: kbuild test robot <lkp@intel.com>
    Reported-by: syzbot+ec24e95ea483de0a24da@syzkaller.appspotmail.com

Care to reference the discussion?

BR,
Janid.

>
>> Signed-off-by: Zhang Xiaoxu <zhangxiaoxu5@huawei.com>
>> ---
>>  drivers/gpu/drm/i915/i915_gpu_error.h | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.h b/drivers/gpu/drm/i915/i915_gpu_error.h
>> index 9109004956bd..41c1475e1500 100644
>> --- a/drivers/gpu/drm/i915/i915_gpu_error.h
>> +++ b/drivers/gpu/drm/i915/i915_gpu_error.h
>> @@ -314,8 +314,7 @@ i915_vma_capture_finish(struct intel_gt_coredump *gt,
>>  }
>>  
>>  static inline void
>> -i915_error_state_store(struct drm_i915_private *i915,
>> -		       struct i915_gpu_coredump *error)
>> +i915_error_state_store(struct i915_gpu_coredump *error)
>
> ouch! that's an oversight.
>
> Thanks for your patch,
>
> Reviewed-by: Andi Shyti <andi.shyti@intel.com>
>
> Andi

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
