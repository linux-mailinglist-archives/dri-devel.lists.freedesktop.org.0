Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A69443882E8
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 01:00:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22B896E055;
	Tue, 18 May 2021 23:00:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from h1954565.stratoserver.net (sebastianwick.net
 [IPv6:2a01:238:4226:4f00:79f5:2d39:beca:3cf1])
 by gabe.freedesktop.org (Postfix) with ESMTP id 872BF6E055;
 Tue, 18 May 2021 23:00:23 +0000 (UTC)
Received: by h1954565.stratoserver.net (Postfix, from userid 117)
 id 73227163F46; Wed, 19 May 2021 01:00:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
 h1954565.stratoserver.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED
 autolearn=unavailable autolearn_force=no version=3.4.2
Received: from mail.sebastianwick.net (localhost [IPv6:::1])
 by h1954565.stratoserver.net (Postfix) with ESMTP id CFAFF163F42;
 Wed, 19 May 2021 01:00:17 +0200 (CEST)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date: Wed, 19 May 2021 01:00:17 +0200
From: Sebastian Wick <sebastian@sebastianwick.net>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [RFC PATCH 0/3] A drm_plane API to support HDR planes
In-Reply-To: <9d4ec9c3-6716-7c80-97d5-dd3c5c50ab51@amd.com>
References: <20210426173852.484368-1-harry.wentland@amd.com>
 <20210427175005.5b92badc@eldfell>
 <e51a3067-a0b3-16e4-5996-bd8527b7536b@amd.com>
 <20210517115726.4fc1c710@eldfell>
 <5f6abaaa45bb7f77110d9f87c9824e3f@sebastianwick.net>
 <b0834be8-9023-0fde-f15d-8c44f72e7702@amd.com>
 <20210518105615.212b84e4@eldfell>
 <9d4ec9c3-6716-7c80-97d5-dd3c5c50ab51@amd.com>
Message-ID: <d254788ea658ee4af6f09c8d10a497f6@sebastianwick.net>
X-Sender: sebastian@sebastianwick.net
User-Agent: Roundcube Webmail/1.3.4
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
Cc: Deepak.Sharma@amd.com, amd-gfx@lists.freedesktop.org, mcasas@google.com,
 Shashank.Sharma@amd.com, dri-devel@lists.freedesktop.org, Shirish.S@amd.com,
 Krunoslav.Kovac@amd.com, hersenxs.wu@amd.com,
 Vitaly Prosyak <vitaly.prosyak@amd.com>, laurentiu.palcu@oss.nxp.com,
 Bhawanpreet.Lakha@amd.com, Nicholas.Kazlauskas@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-05-18 16:19, Harry Wentland wrote:
> On 2021-05-18 3:56 a.m., Pekka Paalanen wrote:
>> On Mon, 17 May 2021 15:39:03 -0400
>> Vitaly Prosyak <vitaly.prosyak@amd.com> wrote:
>> 
>>> On 2021-05-17 12:48 p.m., Sebastian Wick wrote:
>>>> On 2021-05-17 10:57, Pekka Paalanen wrote:
>>>>> On Fri, 14 May 2021 17:05:11 -0400
>>>>> Harry Wentland <harry.wentland@amd.com> wrote:
>>>>> 
>>>>>> On 2021-04-27 10:50 a.m., Pekka Paalanen wrote:
>>>>>>> On Mon, 26 Apr 2021 13:38:49 -0400
>>>>>>> Harry Wentland <harry.wentland@amd.com> wrote:
>>>>> 
>>>>> ...
>>>>> 
>>>>>>>> ## Mastering Luminances
>>>>>>>> 
>>>>>>>> Now we are able to use the PQ 2084 EOTF to define the luminance 
>>>>>>>> of
>>>>>>>> pixels in absolute terms. Unfortunately we're again presented 
>>>>>>>> with
>>>>>>>> physical limitations of the display technologies on the market
>>>>>> today.
>>>>>>>> Here are a few examples of luminance ranges of displays.
>>>>>>>> 
>>>>>>>> | Display                  | Luminance range in nits |
>>>>>>>> | ------------------------ | ----------------------- |
>>>>>>>> | Typical PC display       | 0.3 - 200 |
>>>>>>>> | Excellent LCD HDTV       | 0.3 - 400 |
>>>>>>>> | HDR LCD w/ local dimming | 0.05 - 1,500 |
>>>>>>>> 
>>>>>>>> Since no display can currently show the full 0.0005 to 10,000 
>>>>>>>> nits
>>>>>>>> luminance range the display will need to tonemap the HDR 
>>>>>>>> content,
>>>>>> i.e
>>>>>>>> to fit the content within a display's capabilities. To assist 
>>>>>>>> with
>>>>>>>> tonemapping HDR content is usually accompanied with a metadata 
>>>>>>>> that
>>>>>>>> describes (among other things) the minimum and maximum mastering
>>>>>>>> luminance, i.e. the maximum and minimum luminance of the display
>>>>>> that
>>>>>>>> was used to master the HDR content.
>>>>>>>> 
>>>>>>>> The HDR metadata is currently defined on the drm_connector via 
>>>>>>>> the
>>>>>>>> hdr_output_metadata blob property.
>>>>>>>> 
>>>>>>>> It might be useful to define per-plane hdr metadata, as 
>>>>>>>> different
>>>>>>>> planes might have been mastered differently.
>>>>>>> 
>>>>>>> I don't think this would directly help with the dynamic range
>>>>>> blending
>>>>>>> problem. You still need to establish the mapping between the 
>>>>>>> optical
>>>>>>> values from two different EOTFs and dynamic ranges. Or can you 
>>>>>>> know
>>>>>>> which optical values match the mastering display maximum and 
>>>>>>> minimum
>>>>>>> luminances for not-PQ?
>>>>>>> 
>>>>>> 
>>>>>> My understanding of this is probably best illustrated by this 
>>>>>> example:
>>>>>> 
>>>>>> Assume HDR was mastered on a display with a maximum white level of 
>>>>>> 500
>>>>>> nits and played back on a display that supports a max white level 
>>>>>> of
>>>>>> 400
>>>>>> nits. If you know the mastering white level of 500 you know that
>>>>>> this is
>>>>>> the maximum value you need to compress down to 400 nits, allowing
>>>>>> you to
>>>>>> use the full extent of the 400 nits panel.
>>>>> 
>>>>> Right, but in the kernel, where do you get these nits values from?
>>>>> 
>>>>> hdr_output_metadata blob is infoframe data to the monitor. I think 
>>>>> this
>>>>> should be independent of the metadata used for color 
>>>>> transformations in
>>>>> the display pipeline before the monitor.
>>>>> 
>>>>> EDID may tell us the monitor HDR metadata, but again what is used 
>>>>> in
>>>>> the color transformations should be independent, because EDIDs lie,
>>>>> lighting environments change, and users have different preferences.
>>>>> 
>>>>> What about black levels?
>>>>> 
>>>>> Do you want to do black level adjustment?
>>>>> 
>>>>> How exactly should the compression work?
>>>>> 
>>>>> Where do you map the mid-tones?
>>>>> 
>>>>> What if the end user wants something different?
>>>> 
>>>> I suspect that this is not about tone mapping at all. The use cases
>>>> listed always have the display in PQ mode and just assume that no
>>>> content exceeds the PQ limitations. Then you can simply bring all
>>>> content to the color space with a matrix multiplication and then map 
>>>> the
>>>> linear light content somewhere into the PQ range. Tone mapping is
>>>> performed in the display only.
>> 
>> The use cases do use the word "desktop" though. Harry, could you 
>> expand
>> on this, are you seeking a design that is good for generic desktop
>> compositors too, or one that is more tailored to "embedded" video
>> player systems taking the most advantage of (potentially
>> fixed-function) hardware?
>> 
> 
> The goal is to enable this on a generic desktop, such as generic 
> Wayland
> implementations or ChromeOS. We're not looking for a custom solution 
> for
> some embedded systems, though the solution we end up with should 
> obviously
> not prevent an implementation on embedded video players.
> 
>> What matrix would one choose? Which render intent would it
>> correspond to?
>> 
>> If you need to adapt different dynamic ranges into the blending 
>> dynamic
>> range, would a simple linear transformation really be enough?
>> 
>>>> From a generic wayland compositor point of view this is 
>>>> uninteresting.
>>>> 
>>> It a compositor's decision to provide or not the metadata property to
>>> the kernel. The metadata can be available from one or multiple 
>>> clients
>>> or most likely not available at all.
>>> 
>>> Compositors may put a display in HDR10 ( when PQ 2084 INV EOTF and TM
>>> occurs in display ) or NATIVE mode and do not attach any metadata to 
>>> the
>>> connector and do TM in compositor.
>>> 
>>> It is all about user preference or compositor design, or a 
>>> combination
>>> of both options.
>> 
>> Indeed. The thing here is that you cannot just add KMS UAPI, you also
>> need to have the FOSS userspace to go with it. So you need to have 
>> your
>> audience defined, userspace patches written and reviewed and agreed
>> to be a good idea. I'm afraid this particular UAPI design would be
>> difficult to justify with Weston. Maybe Kodi is a better audience?
>> 
> 
> I'm not sure designing a UAPI for Kodi that's not going to work for
> Wayland-compositors is the right thing. From a KMS driver maintainer
> standpoint I don't want an API for each userspace.
> 
> The idea here is to do design and discussion in public so we can 
> eventually
> arrive at a UAPI for HDR and CM that works for Wayland and by extension
> for every other userspace.

Eventually we want to be able to drive displays in PQ mode in weston (I
think?) where the TF property could be used in some cases. So that
property seems good to me. The SDR boost property then might also be
useful but it depends on the details of the formula/mechanism that you
can come up with.

But I want to stress again that we're going to drive all display in
their native color space and dynamic range if possible where none of
those properties discussed are useful and without some kind of 3D LUT in
the plane's pixel pipeline we won't be able to make use of them at all.

The Kodi folks can probably give you better feedback and an actual
implementation in reasonable time because they want to drive the display
in PQ mode.

>> But then again, one also needs to consider whether it is enough for a
>> new UAPI to satisfy only part of the possible audience and then need
>> yet another new UAPI to satisfy the rest. Adding new UAPI requires
>> defining the interactions with all existing UAPI as well.
>> 
>> Maybe we do need several different UAPIs for the "same" things if the
>> hardware designs are too different to cater with just one.
>> 
> 
> I feel we should have a section in the RFC that sketches how different 
> HW
> deals with this currently. It would be good if we can arrive at a UAPI 
> that
> captures at least the common functionality of various HW.
> 
> Harry
> 
>> 
>> Thanks,
>> pq
>> 
