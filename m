Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B82B00779
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 17:47:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 278EE10E226;
	Thu, 10 Jul 2025 15:47:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nsCitNrw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81CFE10E226;
 Thu, 10 Jul 2025 15:47:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 6717FA541DA;
 Thu, 10 Jul 2025 15:47:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70190C4CEE3;
 Thu, 10 Jul 2025 15:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752162454;
 bh=4WrSJ+ZWFh8+ijA+FOmqLX/WnYSK5XlFQU15JIkymfk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=nsCitNrwhBRnpkTRs3pMi4LmgenRr7s8WFPQ22UqIGN37oCMwjTTvPTErvPpJ5y07
 XaqHYTDHpWQO+xGY2Ujo45xi3BIPjGnHhSxZAXTOARrsA8Zjrg6hw7zh1t5Y1Ta2zx
 KkF/sCWB6kjRkKyi7SDc+Z3ihuUI/io/ChkBAny3TnJgkd2GnsG2EqWjnFlUb2YrjS
 4deXEf9WEMwBTLT6A6NxdqFeq6TaqKxHcBIGtgNnuXl4m0K5sHEPLE33R+3LQDfoTS
 bFNwUphQ37pmRWPYpK1gIccxmIavvZTBTpVj0O5saXimTm3MgwK6hwyUdp61+s4vEo
 VSFvBkIhbHnBg==
Message-ID: <37c957be-476a-4ddd-8d52-4474c47cb5e9@kernel.org>
Date: Thu, 10 Jul 2025 17:47:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH resend] drm/i915/bios: Apply vlv_fixup_mipi_sequences() to
 v2 mipi-sequences too
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>
References: <20250703143824.7121-1-hansg@kernel.org>
 <aGetkP3IZ0FYHzAz@intel.com>
 <c2b14619-c981-4caf-a295-2571506cc955@kernel.org>
 <aG_dlWJO-3YwXeub@intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <aG_dlWJO-3YwXeub@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Hi Rodrigo,

On 10-Jul-25 5:34 PM, Rodrigo Vivi wrote:
> On Mon, Jul 07, 2025 at 11:10:59PM +0200, Hans de Goede wrote:
>> Hi Ville,
>>
>> On 4-Jul-25 12:31 PM, Ville Syrjälä wrote:
>>> On Thu, Jul 03, 2025 at 04:38:24PM +0200, Hans de Goede wrote:
>>>> From: Hans de Goede <hdegoede@redhat.com>
>>>>
>>>> It turns out that the fixup from vlv_fixup_mipi_sequences() is necessary
>>>> for some DSI panel's with version 2 mipi-sequences too.
>>>>
>>>> Specifically the Acer Iconia One 8 A1-840 (not to be confused with the
>>>> A1-840FHD which is different) has the following sequences:
>>>>
>>>> BDB block 53 (1284 bytes) - MIPI sequence block:
>>>> 	Sequence block version v2
>>>> 	Panel 0 *
>>>>
>>>> Sequence 2 - MIPI_SEQ_INIT_OTP
>>>> 	GPIO index 9, source 0, set 0 (0x00)
>>>> 	Delay: 50000 us
>>>> 	GPIO index 9, source 0, set 1 (0x01)
>>>> 	Delay: 6000 us
>>>> 	GPIO index 9, source 0, set 0 (0x00)
>>>> 	Delay: 6000 us
>>>> 	GPIO index 9, source 0, set 1 (0x01)
>>>> 	Delay: 25000 us
>>>> 	Send DCS: Port A, VC 0, LP, Type 39, Length 5, Data ff aa 55 a5 80
>>>> 	Send DCS: Port A, VC 0, LP, Type 39, Length 3, Data 6f 11 00
>>>> 	...
>>>> 	Send DCS: Port A, VC 0, LP, Type 05, Length 1, Data 29
>>>> 	Delay: 120000 us
>>>>
>>>> Sequence 4 - MIPI_SEQ_DISPLAY_OFF
>>>> 	Send DCS: Port A, VC 0, LP, Type 05, Length 1, Data 28
>>>> 	Delay: 105000 us
>>>> 	Send DCS: Port A, VC 0, LP, Type 05, Length 2, Data 10 00
>>>> 	Delay: 10000 us
>>>>
>>>> Sequence 5 - MIPI_SEQ_ASSERT_RESET
>>>> 	Delay: 10000 us
>>>> 	GPIO index 9, source 0, set 0 (0x00)
>>>>
>>>> Notice how there is no MIPI_SEQ_DEASSERT_RESET, instead the deassert
>>>> is done at the beginning of MIPI_SEQ_INIT_OTP, which is exactly what
>>>> the fixup from vlv_fixup_mipi_sequences() fixes up.
>>>>
>>>> Extend it to also apply to v2 sequences, this fixes the panel not working
>>>> on the Acer Iconia One 8 A1-840.
>>>
>>> Do we have the full VBT for this machine already in some bug? If not,
>>> please file a new issue with the VBT attached for posterity.
>>
>> I've filed: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14605
>> with the VBT attached and I'll add a Closes: tag pointing to that
>> to the patch while applying it to drm-intel-fixes.
> 
> Hi Hans,
> 
> Thank you so much for all the work here.
> 
> Just one thing here is that in drm-intel and drm-xe branches,
> differently from drm-misc ones, we push to the -next variants, and
> then the maintainers run cherry-pick rounds to propagate to the -fixes ones.

Ok, I'll try to remember that for next time.

> I have just moved it around with a force-push, pushed to drm-intel-next and
> cherry-picked back.

Thank you for fixing things up.

Regards,

Hans




>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>> ---
>>>>  drivers/gpu/drm/i915/display/intel_bios.c | 8 ++++----
>>>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
>>>> index ba7b8938b17c..166ee11831ab 100644
>>>> --- a/drivers/gpu/drm/i915/display/intel_bios.c
>>>> +++ b/drivers/gpu/drm/i915/display/intel_bios.c
>>>> @@ -1938,7 +1938,7 @@ static int get_init_otp_deassert_fragment_len(struct intel_display *display,
>>>>  	int index, len;
>>>>  
>>>>  	if (drm_WARN_ON(display->drm,
>>>> -			!data || panel->vbt.dsi.seq_version != 1))
>>>> +			!data || panel->vbt.dsi.seq_version >= 3))
>>>>  		return 0;
>>>>  
>>>>  	/* index = 1 to skip sequence byte */
>>>> @@ -1961,7 +1961,7 @@ static int get_init_otp_deassert_fragment_len(struct intel_display *display,
>>>>  }
>>>>  
>>>>  /*
>>>> - * Some v1 VBT MIPI sequences do the deassert in the init OTP sequence.
>>>> + * Some v1/v2 VBT MIPI sequences do the deassert in the init OTP sequence.
>>>>   * The deassert must be done before calling intel_dsi_device_ready, so for
>>>>   * these devices we split the init OTP sequence into a deassert sequence and
>>>>   * the actual init OTP part.
>>>> @@ -1972,9 +1972,9 @@ static void vlv_fixup_mipi_sequences(struct intel_display *display,
>>>>  	u8 *init_otp;
>>>>  	int len;
>>>>  
>>>> -	/* Limit this to v1 vid-mode sequences */
>>>> +	/* Limit this to v1/v2 vid-mode sequences */
>>>>  	if (panel->vbt.dsi.config->is_cmd_mode ||
>>>> -	    panel->vbt.dsi.seq_version != 1)
>>>> +	    panel->vbt.dsi.seq_version >= 3)
>>>>  		return;
>>>>  
>>>>  	/* Only do this if there are otp and assert seqs and no deassert seq */
>>>> -- 
>>>> 2.49.0
>>>
>>

