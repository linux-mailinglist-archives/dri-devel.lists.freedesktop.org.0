Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E103F0B9C
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 21:12:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 727C46E921;
	Wed, 18 Aug 2021 19:12:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D9DF6E8BB;
 Wed, 18 Aug 2021 19:12:35 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10080"; a="195985675"
X-IronPort-AV: E=Sophos;i="5.84,332,1620716400"; d="scan'208";a="195985675"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2021 12:12:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,332,1620716400"; d="scan'208";a="521200675"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by FMSMGA003.fm.intel.com with ESMTP; 18 Aug 2021 12:12:33 -0700
Received: from [10.249.134.4] (mwajdecz-MOBL.ger.corp.intel.com [10.249.134.4])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 17IJCWmH032062; Wed, 18 Aug 2021 20:12:32 +0100
Subject: Re: [Intel-gfx] [PATCH 2/4] drm/i915/guc: Print error name on CTB
 (de)registration failure
To: Daniel Vetter <daniel@ffwll.ch>
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <20210701155513.2024-1-michal.wajdeczko@intel.com>
 <20210701155513.2024-3-michal.wajdeczko@intel.com>
 <YR0XFp/Q+f8Todgk@phenom.ffwll.local>
 <7bdb20cf-550f-9c65-5c9b-60cc87de33b2@intel.com>
 <CAKMK7uG5OMMfNq7K1BPKdtgkiiQUjW9updRZgy5xdeE2vPFSbg@mail.gmail.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <c9a65e57-2d98-833c-e89a-b394ffecbeac@intel.com>
Date: Wed, 18 Aug 2021 21:12:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uG5OMMfNq7K1BPKdtgkiiQUjW9updRZgy5xdeE2vPFSbg@mail.gmail.com>
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



On 18.08.2021 18:35, Daniel Vetter wrote:
> On Wed, Aug 18, 2021 at 5:11 PM Michal Wajdeczko
> <michal.wajdeczko@intel.com> wrote:
>>
>>
>>
>> On 18.08.2021 16:20, Daniel Vetter wrote:
>>> On Thu, Jul 01, 2021 at 05:55:11PM +0200, Michal Wajdeczko wrote:
>>>> Instead of plain error value (%d) print more user friendly error
>>>> name (%pe).
>>>>
>>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>> ---
>>>>  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 8 ++++----
>>>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
>>>> index a26bb55c0898..18d52c39f0c2 100644
>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
>>>> @@ -167,8 +167,8 @@ static int ct_register_buffer(struct intel_guc_ct *ct, u32 type,
>>>>      err = guc_action_register_ct_buffer(ct_to_guc(ct), type,
>>>>                                          desc_addr, buff_addr, size);
>>>>      if (unlikely(err))
>>>> -            CT_ERROR(ct, "Failed to register %s buffer (err=%d)\n",
>>>> -                     guc_ct_buffer_type_to_str(type), err);
>>>> +            CT_ERROR(ct, "Failed to register %s buffer (%pe)\n",
>>>> +                     guc_ct_buffer_type_to_str(type), ERR_PTR(err));
>>>
>>> errname() is what you want here, not this convoluted jumping through hoops
>>> to fake an error pointer.
>>
>> nope, I was already trying that shortcut, but errname() is not exported
>> so we fail with
>>
>> ERROR: modpost: "errname" [drivers/gpu/drm/i915/i915.ko] undefined!
>>
>> so unless we add that export we must follow initial approach [1]
> 
> Then we export that function. This is all open source, we can actually
> fix things up, there should _never_ be a need to hack around things
> like this.

simple export might be not sufficient, as this function returns NULL for
unrecognized error codes, and it might be hard to print that code in
plain format, as it %pe does it for us for free.

is that big problem to use ERR_PTR? I'm not the only/first one

see
drivers/net/can/usb/etas_es58x/es58x_core.c
drivers/net/ethernet/freescale/enetc/enetc_pf.c
drivers/net/phy/phylink.c
...

> 
> And yes I'm keenly aware that there's a pile of i915-gem code which
> outright flaunts this principle, but that doesn't mean we should
> continue with that. scripts/get_maintainers.pl can help with finding
> all the people you need to cc on that export patch.

I'm perfectly fine with updating/fixing shared code (did that before,
have few more ideas on my todo-list) but in this case I'm not so sure

-Michal

> -Daniel
> 
>>
>> -Michal
>>
>> [1]
>> https://cgit.freedesktop.org/drm/drm-tip/commit/?id=57f5677e535ba24b8926a7125be2ef8d7f09323c
>>
>>>
>>> With that: Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>>>      return err;
>>>>  }
>>>>
>>>> @@ -195,8 +195,8 @@ static int ct_deregister_buffer(struct intel_guc_ct *ct, u32 type)
>>>>      int err = guc_action_deregister_ct_buffer(ct_to_guc(ct), type);
>>>>
>>>>      if (unlikely(err))
>>>> -            CT_ERROR(ct, "Failed to deregister %s buffer (err=%d)\n",
>>>> -                     guc_ct_buffer_type_to_str(type), err);
>>>> +            CT_ERROR(ct, "Failed to deregister %s buffer (%pe)\n",
>>>> +                     guc_ct_buffer_type_to_str(type), ERR_PTR(err));
>>>>      return err;
>>>>  }
>>>>
>>>> --
>>>> 2.25.1
>>>>
>>>> _______________________________________________
>>>> Intel-gfx mailing list
>>>> Intel-gfx@lists.freedesktop.org
>>>> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
>>>
> 
> 
> 
