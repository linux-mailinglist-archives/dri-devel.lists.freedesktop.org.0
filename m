Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7AD3B912F
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jul 2021 13:30:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A7C089DAB;
	Thu,  1 Jul 2021 11:30:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from srv6.fidu.org (srv6.fidu.org [159.69.62.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AB8A89DAB;
 Thu,  1 Jul 2021 11:30:36 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by srv6.fidu.org (Postfix) with ESMTP id 3029FC80092;
 Thu,  1 Jul 2021 13:30:35 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at srv6.fidu.org
Received: from srv6.fidu.org ([127.0.0.1])
 by localhost (srv6.fidu.org [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id bFWuLJsDeuN6; Thu,  1 Jul 2021 13:30:34 +0200 (CEST)
Received: from [192.168.176.112] (host-88-217-226-44.customer.m-online.net
 [88.217.226.44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: wse@tuxedocomputers.com)
 by srv6.fidu.org (Postfix) with ESMTPSA id 199D3C8008E;
 Thu,  1 Jul 2021 13:30:33 +0200 (CEST)
Subject: Re: [PATCH v4 03/17] drm/uAPI: Add "active bpc" as feedback channel
 for "max bpc" drm property
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20210618091116.14428-1-wse@tuxedocomputers.com>
 <20210618091116.14428-4-wse@tuxedocomputers.com>
 <18bbd0cf-4c37-ce9d-eb63-de4131a201e1@tuxedocomputers.com>
 <11cd3340-46a1-9a6a-88f5-95c225863509@tuxedocomputers.com>
 <20210630112141.319f67eb@eldfell>
 <ca2827b5-9f6f-164b-6b3f-3f01898d3202@tuxedocomputers.com>
 <20210701104256.247538e1@eldfell>
From: Werner Sembach <wse@tuxedocomputers.com>
Message-ID: <b8db0280-f979-26a6-bf1b-148f8c4cc638@tuxedocomputers.com>
Date: Thu, 1 Jul 2021 13:30:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210701104256.247538e1@eldfell>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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
Cc: sunpeng.li@amd.com, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de, rodrigo.vivi@intel.com,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Am 01.07.21 um 09:42 schrieb Pekka Paalanen:
> On Wed, 30 Jun 2021 11:42:10 +0200
> Werner Sembach <wse@tuxedocomputers.com> wrote:
>
>> Am 30.06.21 um 10:21 schrieb Pekka Paalanen:
>>> On Tue, 29 Jun 2021 13:02:05 +0200
>>> Werner Sembach <wse@tuxedocomputers.com> wrote:
>>>  
>>>> Am 28.06.21 um 19:03 schrieb Werner Sembach:  
>>>>> Am 18.06.21 um 11:11 schrieb Werner Sembach:  
>>>>>> Add a new general drm property "active bpc" which can be used by graphic
>>>>>> drivers to report the applied bit depth per pixel back to userspace.
>>>>>>
>>>>>> While "max bpc" can be used to change the color depth, there was no way to
>>>>>> check which one actually got used. While in theory the driver chooses the
>>>>>> best/highest color depth within the max bpc setting a user might not be
>>>>>> fully aware what his hardware is or isn't capable off. This is meant as a
>>>>>> quick way to double check the setup.
>>>>>>
>>>>>> In the future, automatic color calibration for screens might also depend on
>>>>>> this information being available.
>>>>>>
>>>>>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
>>>>>> ---
>>>>>>   drivers/gpu/drm/drm_connector.c | 51 +++++++++++++++++++++++++++++++++
>>>>>>   include/drm/drm_connector.h     |  8 ++++++
>>>>>>   2 files changed, 59 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
>>>>>> index da39e7ff6965..943f6b61053b 100644
>>>>>> --- a/drivers/gpu/drm/drm_connector.c
>>>>>> +++ b/drivers/gpu/drm/drm_connector.c
>>>>>> @@ -1197,6 +1197,14 @@ static const struct drm_prop_enum_list dp_colorspaces[] = {
>>>>>>    *	drm_connector_attach_max_bpc_property() to create and attach the
>>>>>>    *	property to the connector during initialization.
>>>>>>    *
>>>>>> + * active bpc:
>>>>>> + *	This read-only range property tells userspace the pixel color bit depth
>>>>>> + *	actually used by the hardware display engine on "the cable" on a
>>>>>> + *	connector. The chosen value depends on hardware capabilities, both
>>>>>> + *	display engine and connected monitor, and the "max bpc" property.
>>>>>> + *	Drivers shall use drm_connector_attach_active_bpc_property() to install
>>>>>> + *	this property.
>>>>>> + *  
>>>>> Regarding "on the cable" and dithering: As far as I can tell, what the dithering option does, is setting a hardware
>>>>> register here:
>>>>>
>>>>> - https://elixir.bootlin.com/linux/v5.13/source/drivers/gpu/drm/i915/display/intel_display.c#L4534
>>>>>
>>>>> - https://elixir.bootlin.com/linux/v5.13/source/drivers/gpu/drm/i915/display/intel_display.c#L4571
>>>>>
>>>>> So dithering seems to be calculated by fixed purpose hardware/firmware outside of the driver?
>>>>>
>>>>> The Intel driver does not seem to set a target bpc/bpp for this hardware so I guess it defaults to 6 or 8 bpc?  
>>>> Never mind it does. This switch-case does affect the dithering output:
>>>> https://elixir.bootlin.com/linux/v5.13/source/drivers/gpu/drm/i915/display/intel_display.c#L4537  
>>> Hi,
>>>
>>> I obviously do not know the intel driver or hardware at all, but
>>> to me that just looks like translating from bits per pixel to bits per
>>> channel in RGB mapping?  
>> No, if i understand the documentation correctly: Writing bit depth here 
>> with dithering enabled sets the dithering target bpc.
>>>  
>>>> As found in this documentation p.548:
>>>> https://01.org/sites/default/files/documentation/intel-gfx-prm-osrc-lkf-vol02c-commandreference-registers-part2.pdf
>>>>
>>>> So max bpc and active bpc are affecting/affected by the bpc after dithering.  
>>> By definition, if the cable carries N bpc, then dithering does not
>>> change that. The cable still carries N bpc, but due to spatial or
>>> temporal dithering, the *observed* color resolution may or may not be
>>> higher than the cable bpc.  
>> Yes, and max bpc and active bpc tell the cable bpc ist not the 
>> *observed* bpc.
>>> Of course, if the cable bpc is 8, and dithering targets 6 bpc, then 2
>>> LSB on the cable are always zero, right?  
>> I would assume that in this case only 6 bpc are actually send? Isn't the 
>> whole thing of dithering that you can't send, for example, 8 bpc?
>>> Maybe one would want to do that if the monitor has a 6 bit panel and it
>>> simply ignored the 2 LSB, and the cable cannot go down to 6 bpc.  
>> Is there dithering actually doing this? aka is my assumption above wrong?
>>
>> AMD code that confused me before, is hinting that you might be right: 
>> https://elixir.bootlin.com/linux/v5.13/source/drivers/gpu/drm/amd/display/dc/dce/dce_transform.c#L826
>>
>> there is a set_clamp depth and a separate DCP_SPATIAL_DITHER_DEPTH_30BPP
>>
>>> So, what does "max bpc" mean right now?
>>>
>>> It seems like dither on/off is insufficient information, one would also
>>> need to control the dithering target bpc. I suppose the driver has a
>>> policy on how it chooses the target bpc, but what is that policy? Is
>>> the dither target bpc the cable bpc or the sink bpc?
>>>
>>> Needless to say, I'm quite confused.  
>> ... We need someone who knows what dithering on intel and amd gpu 
>> actually means.
>>
>> But I don't want this to become a blocker for this patchset, because if 
>> there is no dithering, which seems to be the norm, the active bpc 
>> property is already really usefull as it is. So add a note to the docs 
>> that the value might be invalid when dithering is active for now?
> Hi,
>
> not necessarily invalid. It all depends on how "max bpc" and "active
> bpc" are defined.
>
> If they are defined and implemented as "on the cable", then they are
> both well-defined and always valid, regardless of what dithering or bit
> clamping does, so this is the semantics I'd would prefer. It's clear,
> but of course does not tell full story.
>
> When better properties for dithering are added, those can then define
> how it works on top of cable bpc, with no impact on "max bpc" or
> "active bpc" properties.
>
> So if we cannot tell what "max bpc" is, then "active bpc" should just
> be defined as the same thing as "max bpc" affects, and leave the
> precise definition of both for later.
But as long as I don't know exactly how dithering is affected by max bpc I can't tell for sure if active bpc is acting
the same. That's why I wrote it is "undefined" to not run into a trap where the actual behavior have to change after the
fact.
>
> If the definition was observed bpc, then we would have problems and
> would need to know everything right now. But you can't really make
> promises of observed bpc anyway, because you don't know what the
> monitor does to the video signal I suppose. Unless you define it "as if
> observed through an ideal theoretical monitor" which then gets awkward
> to explain.
Yes, that's why I think describing the "raw" signal is the best and leave it to the user to know what his or her Monitor
is making out of it.
>
>
> Thanks,
> pq
