Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FAE3369C0D
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 23:30:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ACD96EC5D;
	Fri, 23 Apr 2021 21:30:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25FC66EC5D
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 21:30:40 +0000 (UTC)
Received: from [IPv6:2804:431:e7dd:b215:2a57:79ce:97d1:4a15] (unknown
 [IPv6:2804:431:e7dd:b215:2a57:79ce:97d1:4a15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: leandrohrb)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D70FB1F43DC2;
 Fri, 23 Apr 2021 22:30:37 +0100 (BST)
Subject: Re: [PATCH v2 1/1] drm/doc: document drm_mode_get_plane
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20210422181004.34247-1-leandro.ribeiro@collabora.com>
 <20210422181004.34247-2-leandro.ribeiro@collabora.com>
 <20210423141126.308d4145@eldfell>
From: Leandro Ribeiro <leandro.ribeiro@collabora.com>
Message-ID: <3c3a5d35-10bf-4b32-1970-aed4bc1d6488@collabora.com>
Date: Fri, 23 Apr 2021 18:30:33 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210423141126.308d4145@eldfell>
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
Cc: airlied@linux.ie, kernel@collabora.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/23/21 8:11 AM, Pekka Paalanen wrote:
> On Thu, 22 Apr 2021 15:10:04 -0300
> Leandro Ribeiro <leandro.ribeiro@collabora.com> wrote:
> 
>> Add a small description and document struct fields of
>> drm_mode_get_plane.
>>
>> Signed-off-by: Leandro Ribeiro <leandro.ribeiro@collabora.com>
>> ---
>>  include/uapi/drm/drm_mode.h | 16 ++++++++++++++++
>>  1 file changed, 16 insertions(+)
>>
>> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
>> index a5e76aa06ad5..3e85de928db9 100644
>> --- a/include/uapi/drm/drm_mode.h
>> +++ b/include/uapi/drm/drm_mode.h
>> @@ -312,16 +312,32 @@ struct drm_mode_set_plane {
>>  	__u32 src_w;
>>  };
>>
>> +/**
>> + * struct drm_mode_get_plane - Get plane metadata.
>> + *
>> + * Userspace can perform a GETPLANE ioctl to retrieve information about a
>> + * plane.
>> + */
>>  struct drm_mode_get_plane {
>> +	/** @plane_id: Object ID of the plane. */
>>  	__u32 plane_id;
>>
>> +	/** @crtc_id: Object ID of the current CRTC. */
>>  	__u32 crtc_id;
>> +	/** @fb_id: Object ID of the current fb. */
>>  	__u32 fb_id;
>>
>> +	/** @possible_crtcs: Bitmask of CRTC's compatible with the plane. */
> 
> This should probably explain what the bits in the mask correspond to.
> As in, which CRTC does bit 0 refer to, and so on.
> 

What about:

"possible_crtcs: Bitmask of CRTC's compatible with the plane. CRTC's are
created and they receive an index, which corresponds to their position
in the bitmask. CRTC with index 0 will be in bit 0, and so on."

>>  	__u32 possible_crtcs;
>> +	/** @gamma_size: Size of the legacy gamma table. */
> 
> What are the units? Entries? Bytes?
> 

The number of entries. I'll update to "gamma_size: Number of entries of
the legacy gamma lookup table" in the next version.

>>  	__u32 gamma_size;
>>
>> +	/** @count_format_types: Number of formats. */
>>  	__u32 count_format_types;
>> +	/**
>> +	 * @format_type_ptr: Pointer to ``__u32`` array of formats that are
>> +	 * supported by the plane. These formats do not require modifiers.
> 
> I wonder if the "do not require modifiers" is again going too far in
> making a difference between this list and IN_FORMATS?
> 

Yes that's true, I'll drop this phrase.

>> +	 */
>>  	__u64 format_type_ptr;
>>  };
> 
> Other than those, looks like a significant improvement to me.
> 
> 
> Thanks,
> pq
> 
>>
>> --
>> 2.31.1
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
