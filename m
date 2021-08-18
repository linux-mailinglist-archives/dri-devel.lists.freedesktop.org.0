Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F5F3F078F
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 17:11:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3636B6E911;
	Wed, 18 Aug 2021 15:11:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9E956E90F;
 Wed, 18 Aug 2021 15:11:21 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10080"; a="277367340"
X-IronPort-AV: E=Sophos;i="5.84,330,1620716400"; d="scan'208";a="277367340"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2021 08:11:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,330,1620716400"; d="scan'208";a="678604955"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by fmsmga006.fm.intel.com with ESMTP; 18 Aug 2021 08:11:19 -0700
Received: from [10.249.134.4] (mwajdecz-MOBL.ger.corp.intel.com [10.249.134.4])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 17IFBIRk029713; Wed, 18 Aug 2021 16:11:18 +0100
Subject: Re: [Intel-gfx] [PATCH 2/4] drm/i915/guc: Print error name on CTB
 (de)registration failure
To: Daniel Vetter <daniel@ffwll.ch>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210701155513.2024-1-michal.wajdeczko@intel.com>
 <20210701155513.2024-3-michal.wajdeczko@intel.com>
 <YR0XFp/Q+f8Todgk@phenom.ffwll.local>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <7bdb20cf-550f-9c65-5c9b-60cc87de33b2@intel.com>
Date: Wed, 18 Aug 2021 17:11:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YR0XFp/Q+f8Todgk@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 18.08.2021 16:20, Daniel Vetter wrote:
> On Thu, Jul 01, 2021 at 05:55:11PM +0200, Michal Wajdeczko wrote:
>> Instead of plain error value (%d) print more user friendly error
>> name (%pe).
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>>  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
>> index a26bb55c0898..18d52c39f0c2 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
>> @@ -167,8 +167,8 @@ static int ct_register_buffer(struct intel_guc_ct *ct, u32 type,
>>  	err = guc_action_register_ct_buffer(ct_to_guc(ct), type,
>>  					    desc_addr, buff_addr, size);
>>  	if (unlikely(err))
>> -		CT_ERROR(ct, "Failed to register %s buffer (err=%d)\n",
>> -			 guc_ct_buffer_type_to_str(type), err);
>> +		CT_ERROR(ct, "Failed to register %s buffer (%pe)\n",
>> +			 guc_ct_buffer_type_to_str(type), ERR_PTR(err));
> 
> errname() is what you want here, not this convoluted jumping through hoops
> to fake an error pointer.

nope, I was already trying that shortcut, but errname() is not exported
so we fail with

ERROR: modpost: "errname" [drivers/gpu/drm/i915/i915.ko] undefined!

so unless we add that export we must follow initial approach [1]

-Michal

[1]
https://cgit.freedesktop.org/drm/drm-tip/commit/?id=57f5677e535ba24b8926a7125be2ef8d7f09323c

> 
> With that: Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>  	return err;
>>  }
>>  
>> @@ -195,8 +195,8 @@ static int ct_deregister_buffer(struct intel_guc_ct *ct, u32 type)
>>  	int err = guc_action_deregister_ct_buffer(ct_to_guc(ct), type);
>>  
>>  	if (unlikely(err))
>> -		CT_ERROR(ct, "Failed to deregister %s buffer (err=%d)\n",
>> -			 guc_ct_buffer_type_to_str(type), err);
>> +		CT_ERROR(ct, "Failed to deregister %s buffer (%pe)\n",
>> +			 guc_ct_buffer_type_to_str(type), ERR_PTR(err));
>>  	return err;
>>  }
>>  
>> -- 
>> 2.25.1
>>
>> _______________________________________________
>> Intel-gfx mailing list
>> Intel-gfx@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
> 
