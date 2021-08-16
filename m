Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9653ED7E2
	for <lists+dri-devel@lfdr.de>; Mon, 16 Aug 2021 15:46:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1A2F896E9;
	Mon, 16 Aug 2021 13:46:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 546 seconds by postgrey-1.36 at gabe;
 Mon, 16 Aug 2021 13:46:33 UTC
Received: from h1954565.stratoserver.net (sebastianwick.net
 [IPv6:2a01:238:4226:4f00:79f5:2d39:beca:3cf1])
 by gabe.freedesktop.org (Postfix) with ESMTP id BE1B6896E9;
 Mon, 16 Aug 2021 13:46:33 +0000 (UTC)
Received: from mail.sebastianwick.net (sebastianwick.net
 [IPv6:2a01:238:4226:4f00:79f5:2d39:beca:3cf1])
 by h1954565.stratoserver.net (Postfix) with ESMTPSA id CF10F164FC4;
 Mon, 16 Aug 2021 15:37:23 +0200 (CEST)
MIME-Version: 1.0
Date: Mon, 16 Aug 2021 15:37:23 +0200
From: sebastian@sebastianwick.net
To: Harry Wentland <harry.wentland@amd.com>
Cc: Brian Starkey <brian.starkey@arm.com>, "Sharma, Shashank"
 <shashank.sharma@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, ppaalanen@gmail.com, mcasas@google.com,
 jshargo@google.com, Deepak.Sharma@amd.com, Shirish.S@amd.com,
 Vitaly.Prosyak@amd.com, aric.cyr@amd.com, Bhawanpreet.Lakha@amd.com,
 Krunoslav.Kovac@amd.com, hersenxs.wu@amd.com, Nicholas.Kazlauskas@amd.com,
 laurentiu.palcu@oss.nxp.com, ville.syrjala@linux.intel.com, nd@arm.com,
 uma.shankar@intel.com
Subject: Re: [RFC PATCH v3 1/6] drm/doc: Color Management and HDR10 RFC
In-Reply-To: <ace8dcf8-fe01-ad1e-8cfb-92e559f01d2f@amd.com>
References: <20210730204134.21769-1-harry.wentland@amd.com>
 <20210730204134.21769-2-harry.wentland@amd.com>
 <20210802163042.2phdkytybie236x4@000377403353>
 <4e13504d-20ec-ae9c-7cb0-f79376d0f98b@amd.com>
 <20210816111029.74cisnhblllindcv@000377403353>
 <ace8dcf8-fe01-ad1e-8cfb-92e559f01d2f@amd.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <a2fc2bd00af431a4f6e3842c6db072a2@sebastianwick.net>
X-Sender: sebastian@sebastianwick.net
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
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

On 2021-08-16 14:40, Harry Wentland wrote:
> On 2021-08-16 7:10 a.m., Brian Starkey wrote:
>> On Fri, Aug 13, 2021 at 10:42:12AM +0530, Sharma, Shashank wrote:
>>> Hello Brian,
>>> (+Uma in cc)
>>> 
>>> Thanks for your comments, Let me try to fill-in for Harry to keep the 
>>> design
>>> discussion going. Please find my comments inline.
>>> 
> 
> Thanks, Shashank. I'm back at work now. Had to cut my trip short
> due to rising Covid cases and concern for my kids.
> 
>>> On 8/2/2021 10:00 PM, Brian Starkey wrote:
>>>> 
>> 
>> -- snip --
>> 
>>>> 
>>>> Android doesn't blend in linear space, so any API shouldn't be built
>>>> around an assumption of linear blending.
>>>> 
> 
> This seems incorrect but I guess ultimately the OS is in control of
> this. If we want to allow blending in non-linear space with the new
> API we would either need to describe the blending space or the
> pre/post-blending gamma/de-gamma.
> 
> Any idea if this blending behavior in Android might get changed in
> the future?

There is lots of software which blends in sRGB space and designers
adjusted to the incorrect blending in a way that the result looks right.
Blending in linear space would result in incorrectly looking images.

>>> 
>>> If I am not wrong, we still need linear buffers for accurate Gamut
>>> transformation (SRGB -> BT2020 or other way around) isn't it ?
>> 
>> Yeah, you need to transform the buffer to linear for color gamut
>> conversions, but then back to non-linear (probably sRGB or gamma 2.2)
>> for actual blending.
>> 
>> This is why I'd like to have the per-plane "OETF/GAMMA" separate
>> from tone-mapping, so that the composition transfer function is
>> independent.
>> 
>>> 
>> 
>> ...
>> 
>>>>> +
>>>>> +Tonemapping in this case could be a simple nits value or `EDR`_ to 
>>>>> describe
>>>>> +how to scale the :ref:`SDR luminance`.
>>>>> +
>>>>> +Tonemapping could also include the ability to use a 3D LUT which 
>>>>> might be
>>>>> +accompanied by a 1D shaper LUT. The shaper LUT is required in 
>>>>> order to
>>>>> +ensure a 3D LUT with limited entries (e.g. 9x9x9, or 17x17x17) 
>>>>> operates
>>>>> +in perceptual (non-linear) space, so as to evenly spread the 
>>>>> limited
>>>>> +entries evenly across the perceived space.
>>>> 
>>>> Some terminology care may be needed here - up until this point, I
>>>> think you've been talking about "tonemapping" being luminance
>>>> adjustment, whereas I'd expect 3D LUTs to be used for gamut
>>>> adjustment.
>>>> 
>>> 
>>> IMO, what harry wants to say here is that, which HW block gets picked 
>>> and
>>> how tone mapping is achieved can be a very driver/HW specific thing, 
>>> where
>>> one driver can use a 1D/Fixed function block, whereas another one can 
>>> choose
>>> more complex HW like a 3D LUT for the same.
>>> 
>>> DRM layer needs to define only the property to hook the API with core
>>> driver, and the driver can decide which HW to pick and configure for 
>>> the
>>> activity. So when we have a tonemapping property, we might not have a
>>> separate 3D-LUT property, or the driver may fail the atomic_check() 
>>> if both
>>> of them are programmed for different usages.
>> 
>> I still think that directly exposing the HW blocks and their
>> capabilities is the right approach, rather than a "magic" tonemapping
>> property.
>> 
>> Yes, userspace would need to have a good understanding of how to use
>> that hardware, but if the pipeline model is standardised that's the
>> kind of thing a cross-vendor library could handle.
>> 
> 
> One problem with cross-vendor libraries is that they might struggle
> to really be cross-vendor when it comes to unique HW behavior. Or
> they might pick sub-optimal configurations as they're not aware of
> the power impact of a configuration. What's an optimal configuration
> might differ greatly between different HW.
> 
> We're seeing this problem with "universal" planes as well.

I'm repeating what has been said before but apparently it has to be said
again: if a property can't be replicated exactly in a shader the
property is useless. If your hardware is so unique that it can't give us
the exact formula we expect you cannot expose the property.

Maybe my view on power consumption is simplistic but I would expect enum
< 1d lut < 3d lut < shader. Is there more to it?

Either way if the fixed KMS pixel pipeline is not sufficient to expose
the intricacies of real hardware the right move would be to make the KMS
pixel pipeline more dynamic, expose more hardware specifics and create a
hardware specific user space like mesa. Moving the whole compositing
with all its policies and decision making into the kernel is exactly the
wrong way to go.

Laurent Pinchart put this very well:
https://lists.freedesktop.org/archives/dri-devel/2021-June/311689.html

>> It would definitely be good to get some compositor opinions here.
>> 
> 
> For this we'll probably have to wait for Pekka's input when he's
> back from his vacation.
> 
>> Cheers,
>> -Brian
>> 
