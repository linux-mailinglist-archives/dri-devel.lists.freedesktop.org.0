Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B2C4C3D7E
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 06:03:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A124010E75C;
	Fri, 25 Feb 2022 05:03:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFF3610E75C;
 Fri, 25 Feb 2022 05:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645765432; x=1677301432;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=fs9OMxQ0OTDXo6LgnZd19x1STZJSmW8Su/iuawucDvE=;
 b=Tl5qeqUJMy3OqOp92crJXOAPFiXTAxw51SWyM9rOdX7LWQLsXgnPR5VA
 g7N0C36Z2wPPcCPfyfDmgllhIi41K47++d5BYPYqkxKg/sEFwCyjfRfwk
 Zcz7OoUUfbetUvf9iylp+Xq6deNA9Bw15PijkuIFocJx1ZeBUjppWBPl7
 YopI3660MFPJ+IAvLpWm7c8/HckWCmWWvPLun9qdejG68Y0GzK2KzCg2/
 INTk3vIblWVwUC6NZwOnSVEVqPhmsvszqcQ84BdoyRWCkpkYWIIlWHeKB
 FxPGce2gg4rZoUqLxNtLazRZJBbICWSUokJOf62CxXmdCUkbL9LRw25nd w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="313140045"
X-IronPort-AV: E=Sophos;i="5.90,135,1643702400"; d="scan'208";a="313140045"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 21:03:52 -0800
X-IronPort-AV: E=Sophos;i="5.90,135,1643702400"; d="scan'208";a="777300688"
Received: from rbayati-mobl1.amr.corp.intel.com (HELO localhost)
 ([10.212.246.238])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 21:03:51 -0800
From: Jordan Justen <jordan.l.justen@intel.com>
To: John Harrison <john.c.harrison@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, intel-gfx <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v5 1/4] drm/i915/guc: Add fetch of hwconfig table
In-Reply-To: <621be0f6-63e3-a8fb-93e3-e581bf4b2d4b@intel.com>
References: <20220222103640.1006006-1-jordan.l.justen@intel.com>
 <20220222103640.1006006-2-jordan.l.justen@intel.com>
 <621be0f6-63e3-a8fb-93e3-e581bf4b2d4b@intel.com>
Date: Thu, 24 Feb 2022 21:03:50 -0800
Message-ID: <87y21zh70p.fsf@jljusten-skl>
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Jon Bloomfield <jon.bloomfield@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

John Harrison <john.c.harrison@intel.com> writes:

> On 2/22/2022 02:36, Jordan Justen wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> Implement support for fetching the hardware description table from the
>> GuC. The call is made twice - once without a destination buffer to
>> query the size and then a second time to fill in the buffer.
>>
>> Note that the table is only available on ADL-P and later platforms.
>>
>> v5 (of Jordan's posting):
>>   * Various changes made by Jordan and recommended by Michal
>>     - Makefile ordering
>>     - Adjust "struct intel_guc_hwconfig hwconfig" comment
>>     - Set Copyright year to 2022 in intel_guc_hwconfig.c/.h
>>     - Drop inline from hwconfig_to_guc()
>>     - Replace hwconfig param with guc in __guc_action_get_hwconfig()
>>     - Move zero size check into guc_hwconfig_discover_size()
>>     - Change comment to say zero size offset/size is needed to get size
>>     - Add has_guc_hwconfig to devinfo and drop has_table()
>>     - Change drm_err to notice in __uc_init_hw() and use %pe
>>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>> Acked-by: Jon Bloomfield <jon.bloomfield@intel.com>
>> Signed-off-by: Jordan Justen <jordan.l.justen@intel.com>
>> ---
>>   
>> +	ret = intel_guc_hwconfig_init(&guc->hwconfig);
>> +	if (ret)
>> +		drm_notice(&i915->drm, "Failed to retrieve hwconfig table: %pe\n",
> Why only drm_notice? As you are keen to point out, the UMDs won't work 
> if the table is not available. All the failure paths in your own 
> verification function are 'drm_err'. So why is it only a 'notice' if 
> there is no table at all?

This was requested by Michal in my v3 posting:

https://patchwork.freedesktop.org/patch/472936/?series=99787&rev=3

I don't think that it should be a failure for i915 if it is unable to
read the table, or if the table read is invalid. I think it should be up
to the UMD to react to the missing hwconfig however they think is
appropriate, but I would like the i915 to guarantee & document the
format returned to userspace to whatever extent is feasible.

As you point out there is a discrepancy, and I think I should be
consistent with whatever is used here in my "drm/i915/guc: Verify
hwconfig blob matches supported format" patch.

I guess I'd tend to agree with Michal that "maybe drm_notice since we
continue probe", but I would go along with either if you two want to
discuss further.

> Note that this function is called as part of the reset path. The reset 
> path is not allowed to allocate memory. The table is stored in a 
> dynamically allocated object. Hence the IGT test failure. The table 
> query has to be done elsewhere at driver init time only.

Thanks for clearing this up. I did notice on dg2 that gpu resets were
causing a re-read of the hwconfig from GuC, but it definitely was not
clear to me that there would be a connection to the IGT failure that you
pointed out.

>
>> +			   ERR_PTR(ret));
>> +
>>   	ret = guc_enable_communication(guc);
>>   	if (ret)
>>   		goto err_log_capture;
>> @@ -562,6 +567,8 @@ static void __uc_fini_hw(struct intel_uc *uc)
>>   	if (intel_uc_uses_guc_submission(uc))
>>   		intel_guc_submission_disable(guc);
>>   
>> +	intel_guc_hwconfig_fini(&guc->hwconfig);
>> +
>>   	__uc_sanitize(uc);
>>   }
>>   
>> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
>> index 76e590fcb903..1d31e35a5154 100644
>> --- a/drivers/gpu/drm/i915/i915_pci.c
>> +++ b/drivers/gpu/drm/i915/i915_pci.c
>> @@ -990,6 +990,7 @@ static const struct intel_device_info adl_p_info = {
>>   		BIT(RCS0) | BIT(BCS0) | BIT(VECS0) | BIT(VCS0) | BIT(VCS2),
>>   	.ppgtt_size = 48,
>>   	.dma_mask_size = 39,
>> +	.has_guc_hwconfig = 1,
> Who requested this change? It was previously done this way but the 
> instruction was that i915_pci.c is for hardware features only but that 
> this, as you seem extremely keen about pointing out at every 
> opportunity, is a software feature.

This was requested by Michal as well. I definitely agree it is a
software feature, but I was not aware that "i915_pci.c is for hardware
features only".

Michal, do you agree with this and returning to the previous method for
enabling the feature?

-Jordan
