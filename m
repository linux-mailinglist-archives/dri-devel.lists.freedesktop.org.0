Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F17674F06
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 09:08:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C275210EA6B;
	Fri, 20 Jan 2023 08:07:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21D7810E077
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 10:24:52 +0000 (UTC)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi
 [91.154.32.225])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 816967EC;
 Thu, 19 Jan 2023 11:24:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1674123890;
 bh=2x4uESUSmqIxqrNQ6PKyZwpgxVhEslL7kGp0IzwbORc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=UaoYkpm1dB1q9MZ7stndJa93SUIFpLiSdMubzn3Bv4RTLTA20UU/z32Eja5zHyFOz
 62hW8MR3d8PTZ6inl2kZahgcwv+by998D5pI03kZDJ/R2zjaNAQ/HdKMuYdQwQUbqI
 WLKFu5T2ePpihr2vQbGCsP8N6zB115ShdiKBv4+s=
Message-ID: <fed77104-43d8-e608-a2b8-dbf3d0b32f00@ideasonboard.com>
Date: Thu, 19 Jan 2023 12:24:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 5/6] drm: rcar-du: Fix setting a reserved bit in DPLLCR
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20230117135154.387208-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20230117135154.387208-6-tomi.valkeinen+renesas@ideasonboard.com>
 <Y8hm54mvZEcBaBo8@pendragon.ideasonboard.com>
 <9b2a6b63-3712-3acb-aa17-6d223237c07d@ideasonboard.com>
 <Y8kQCmdyEwOWna5A@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <Y8kQCmdyEwOWna5A@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 20 Jan 2023 08:07:34 +0000
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
Cc: linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/01/2023 11:40, Laurent Pinchart wrote:
> Hi Tomi,
> 
> On Thu, Jan 19, 2023 at 11:17:58AM +0200, Tomi Valkeinen wrote:
>> On 18/01/2023 23:38, Laurent Pinchart wrote:
>>> On Tue, Jan 17, 2023 at 03:51:53PM +0200, Tomi Valkeinen wrote:
>>>> On H3 ES1 two bits in DPLLCR are used to select the DU input dot clock
>>>
>>> s/ES1/ES1.x/
>>>
>>> Same below.
>>
>> Ok. But I do wonder, is there a difference? What's the case when ES1
>> could be mistaken to mean something else?
> 
> It's just for consistency I suppose. No big deal.
> 
>>>> source. These are bits 20 and 21 for DU2, and bits 22 and 23 for DU1. On
>>>> non-ES1, only the higher bits are used (bits 21 and 23), and the lower
>>>> bits are reserved and should be set to 0 (or not set at all).
>>>
>>> How do you not set a bit ? :-)
>>
>> By leaving it to the value the register already has. But as we don't
>> read the register as a base value here, I guess that comment is a bit
>> misleading.
>>
>>>> The current code always sets the lower bits, even on non-ES1.
>>>
>>> I think that's harmless, and not worth making the driver more complex,
>>> but I'll stop fighting.
>>>
>>>> For both DU1 and DU2, on all SoC versions, when writing zeroes to those
>>>> bits the input clock is DCLKIN, and thus there's no difference between
>>>> ES1 and non-ES1.
>>>>
>>>> For DU1, writing 0b10 to the bits (or only writing the higher bit)
>>>> results in using PLL0 as the input clock, so in this case there's also
>>>> no difference between ES1 and non-ES1.
>>>>
>>>> However, for DU2, writing 0b10 to the bits results in using PLL0 as the
>>>> input clock on ES1, whereas on non-ES1 it results in using PLL1. On ES1
>>>> you need to write 0b11 to select PLL1.
>>>>
>>>> The current code always writes 0b11 to PLCS0 field to select PLL1 on all
>>>> SoC versions, which works but causes an illegal (in the sense of not
>>>> allowed by the documentation) write to a reserved bit field.
>>>>
>>>> To remove the illegal bit write on PLSC0 we need to handle the input dot
>>>> clock selection differently for ES1 and non-ES1.
>>>>
>>>> Add a new quirk, RCAR_DU_QUIRK_H3_ES1_PLL, for this, and a new
>>>> rcar_du_device_info entry for the ES1 SoC. Using these, we can always
>>>
>>> The new entry was added in the previous patch already.
>>
>> Indeed.
>>
>>>> set the bit 21 on PLSC0 when choosing the PLL as the source clock, and
>>>> additionally set the bit 20 when on ES1.
>>>>
>>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>>>> ---
>>>>    drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 12 ++++++++++--
>>>>    drivers/gpu/drm/rcar-du/rcar_du_drv.c  |  3 ++-
>>>>    drivers/gpu/drm/rcar-du/rcar_du_drv.h  |  1 +
>>>>    drivers/gpu/drm/rcar-du/rcar_du_regs.h |  3 ++-
>>>>    4 files changed, 15 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
>>>> index f2d3266509cc..8d660a6141bf 100644
>>>> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
>>>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
>>>> @@ -245,12 +245,20 @@ static void rcar_du_crtc_set_display_timing(struct rcar_du_crtc *rcrtc)
>>>>    		       | DPLLCR_N(dpll.n) | DPLLCR_M(dpll.m)
>>>>    		       | DPLLCR_STBY;
>>>>    
>>>> -		if (rcrtc->index == 1)
>>>> +		if (rcrtc->index == 1) {
>>>>    			dpllcr |= DPLLCR_PLCS1
>>>>    			       |  DPLLCR_INCS_DOTCLKIN1;
>>>> -		else
>>>> +		} else {
>>>>    			dpllcr |= DPLLCR_PLCS0
>>>>    			       |  DPLLCR_INCS_DOTCLKIN0;
>>>> +			/*
>>>> +			 * On H3 ES1.x, in addition to setting bit 21 (PLCS0),
>>>> +			 * also bit 20 has to be set to select PLL1 as the
>>>> +			 * clock source.
>>>
>>> I'd add "On ES2 and newer, PLL1 is selected unconditionally.".
>>
>> It's not selected unconditionally, we need to set bit 21. And possibly
>> we need to set bit 20 to 0, although it's not documented what bit 20
>> would do when set to 1.
> 
> We currently set bit 20 to 1 and it works, so I concluded that bit 20 is

Ah, right, we do set it to 1.

> ignored. That's what I meant by PLL1 being selected automatically,
> between PLL0 and PLL1. We still need to select PLL instead of DCLKIN
> with bit 21.
> 
>> And is that "ES2.x"? =)
> 
> Good point :-)
> 
>> How about:
>>
>>    * On ES2.x and newer, PLL1 is selected by setting bit
>>    * 21 (PLCS0) to 1 and keeping the (reserved) bit 20 as
>>    * 0. On H3 ES1.x, in addition to setting bit 21, also
>>    * bit 20 has to be set to select PLL1 as the clock source.
> 
> What I'd like to capture in the comment is that the clock topology is
> 
>          bit 20
>            |     bit 21
>            v       |
>           |\       v
> PLL0 --> |0|     |\
> PLL1 --> |1| --> |1| -->
>           |/  /-> |0|
>               |   |/
> DCLKIN ------/
> 
> on H3 ES1.x, while on newer revisions, bit 20 is ignored and the first
> mux is hardcoded to PLL1.

Isn't that the stuff that's supposed to be found by reading the manual? 
I could, of course, copy the above picture, and draw a similar one for 
ES2+, but that feels like just useless copying of the manual...

Doesn't the above comment already describe why we set the bits as we do? 
I could change the comment to talk about muxes, if you think that's a 
better approach. But, if I recall right, the manuals don't talk about 
muxes, just "set this to X to use PLL1", so my comment above approaches 
from that direction.

Maybe something in this direction, then:

On ES2.x we have a single mux controlled via bit 21, which selects 
between DCLKIN source (bit 21 = 0) and a PLL source (bit 21 = 1), where 
the PLL is always PLL1. On ES1.x we have an additional mux, controlled 
via bit 20, for choosing between PLL0 (bit 20 = 0) and PLL1 (bit 20 = 
1). We always want to use PLL1, so on ES1.x, in addition to setting bit 
21, we need to set the bit 20.

  Tomi

