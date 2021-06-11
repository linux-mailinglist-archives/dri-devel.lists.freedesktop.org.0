Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9693A4A94
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 23:20:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3E566F3DA;
	Fri, 11 Jun 2021 21:20:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5985C6F3DA
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 21:20:29 +0000 (UTC)
Received: from [IPv6:2804:431:e7dc:1201:ddd3:c6b:bb28:7501] (unknown
 [IPv6:2804:431:e7dc:1201:ddd3:c6b:bb28:7501])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: leandrohrb)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D80D31F4478E;
 Fri, 11 Jun 2021 22:20:26 +0100 (BST)
Subject: Re: [PATCH v5 1/1] drm/doc: document drm_mode_get_plane
To: Daniel Vetter <daniel@ffwll.ch>, Pekka Paalanen <ppaalanen@gmail.com>
References: <20210610203824.50965-1-leandro.ribeiro@collabora.com>
 <20210610203824.50965-2-leandro.ribeiro@collabora.com>
 <20210611101945.2e7ef9e4@eldfell>
 <CAKMK7uHgmawQJ+dS1mLKhFuMZehs-dQZLzXyp6n0dxPNmT19Rw@mail.gmail.com>
From: Leandro Ribeiro <leandro.ribeiro@collabora.com>
Message-ID: <00f23d2f-33d1-8f0d-00b4-23e961a74305@collabora.com>
Date: Fri, 11 Jun 2021 18:20:22 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uHgmawQJ+dS1mLKhFuMZehs-dQZLzXyp6n0dxPNmT19Rw@mail.gmail.com>
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
Cc: Dave Airlie <airlied@linux.ie>, Collabora Kernel ML <kernel@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/11/21 4:33 AM, Daniel Vetter wrote:
> On Fri, Jun 11, 2021 at 9:20 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
>>
>> On Thu, 10 Jun 2021 17:38:24 -0300
>> Leandro Ribeiro <leandro.ribeiro@collabora.com> wrote:
>>
>>> Add a small description and document struct fields of
>>> drm_mode_get_plane.
>>>
>>> Signed-off-by: Leandro Ribeiro <leandro.ribeiro@collabora.com>
>>> ---
>>>  include/uapi/drm/drm_mode.h | 35 +++++++++++++++++++++++++++++++++++
>>>  1 file changed, 35 insertions(+)
>>>
>>> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
>>> index 9b6722d45f36..698559d9336b 100644
>>> --- a/include/uapi/drm/drm_mode.h
>>> +++ b/include/uapi/drm/drm_mode.h
>>> @@ -312,16 +312,51 @@ struct drm_mode_set_plane {
>>>       __u32 src_w;
>>>  };
>>>
>>> +/**
>>> + * struct drm_mode_get_plane - Get plane metadata.
>>> + *
>>> + * Userspace can perform a GETPLANE ioctl to retrieve information about a
>>> + * plane.
>>> + *
>>> + * To retrieve the number of formats supported, set @count_format_types to zero
>>> + * and call the ioctl. @count_format_types will be updated with the value.
>>> + *
>>> + * To retrieve these formats, allocate an array with the memory needed to store
>>> + * @count_format_types formats. Point @format_type_ptr to this array and call
>>> + * the ioctl again (with @count_format_types still set to the value returned in
>>> + * the first ioctl call).
>>> + */
>>>  struct drm_mode_get_plane {
>>> +     /**
>>> +      * @plane_id: Object ID of the plane whose information should be
>>> +      * retrieved. Set by caller.
>>> +      */
>>>       __u32 plane_id;
>>>
>>> +     /** @crtc_id: Object ID of the current CRTC. */
>>>       __u32 crtc_id;
>>> +     /** @fb_id: Object ID of the current fb. */
>>>       __u32 fb_id;
>>>
>>> +     /**
>>> +      * @possible_crtcs: Bitmask of CRTC's compatible with the plane. CRTC's
>>> +      * are created and they receive an index, which corresponds to their
>>> +      * position in the bitmask. Bit N corresponds to
>>> +      * :ref:`CRTC index<crtc_index>` N.
>>> +      */
>>>       __u32 possible_crtcs;
>>> +     /**
>>> +      * @gamma_size: Number of entries of the legacy gamma lookup table.
>>> +      * Deprecated.
>>> +      */
>>>       __u32 gamma_size;
>>
>> Hi,
>>
>> I wonder, has this field ever been used?
>>
>> "The legacy gamma" refers to CRTC gamma LUT AFAIK, but this here is
>> about planes. I forgot that at first, so didn't see anything funny.
> 
> Yeah "Deprecated" isn't really conveying that this was never used or
> implemented anywehere ever. I think we should put that into the docs
> to make this clear, otherwise someone is going to wonder whether maybe
> they still need to parse it since it's only deprecated and there's no
> other plane gamma (yet). I wouldn't even put any further  docs than
> that in it, because stating that it's the number of entries for
> something we never implemented is going to be confusing at best :-)
> -Daniel
> 

Nice, thanks for elaborating.

I'll update to "@gamma_size: Never used".

>>
>> Anyway, whether the doc for this field is as is, or is changed to
>> "never used" or "unused" or "reserved" or whatever, you have my:
>>
>> Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>
>>
>> With the caveat that I didn't actually build the docs to see how they
>> look.
>>
>>
>> Thanks,
>> pq
>>
>>>
>>> +     /** @count_format_types: Number of formats. */
>>>       __u32 count_format_types;
>>> +     /**
>>> +      * @format_type_ptr: Pointer to ``__u32`` array of formats that are
>>> +      * supported by the plane. These formats do not require modifiers.
>>> +      */
>>>       __u64 format_type_ptr;
>>>  };
>>>
>>> --
>>> 2.31.1
>>>
>>
> 
> 
