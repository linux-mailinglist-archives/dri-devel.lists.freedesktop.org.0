Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B48388F2D
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 15:30:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25FAF6EDB2;
	Wed, 19 May 2021 13:30:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C1B36EDB2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 13:30:47 +0000 (UTC)
Received: from [IPv6:2804:431:e7dd:20a5:77af:59ad:49dc:ab16] (unknown
 [IPv6:2804:431:e7dd:20a5:77af:59ad:49dc:ab16])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: leandrohrb)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id CE0851F4321B;
 Wed, 19 May 2021 14:30:44 +0100 (BST)
Subject: Re: [PATCH 2/2] drm/doc: document drm_mode_get_plane
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20210428213651.55467-1-leandro.ribeiro@collabora.com>
 <20210428213651.55467-3-leandro.ribeiro@collabora.com>
 <20210506121003.4ab918bb@eldfell>
From: Leandro Ribeiro <leandro.ribeiro@collabora.com>
Message-ID: <cb41184d-8625-698f-1cd6-5f3d6728debf@collabora.com>
Date: Wed, 19 May 2021 10:30:40 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210506121003.4ab918bb@eldfell>
Content-Type: text/plain; charset=windows-1252
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
Cc: airlied@linux.ie, kernel@collabora.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/6/21 6:10 AM, Pekka Paalanen wrote:
> On Wed, 28 Apr 2021 18:36:51 -0300
> Leandro Ribeiro <leandro.ribeiro@collabora.com> wrote:
> 
>> Add a small description and document struct fields of
>> drm_mode_get_plane.
>>
>> Signed-off-by: Leandro Ribeiro <leandro.ribeiro@collabora.com>
> 
> Hi,
> 
> thanks a lot for revising these.
> 
>> ---
>>  include/uapi/drm/drm_mode.h | 22 ++++++++++++++++++++++
>>  1 file changed, 22 insertions(+)
>>
>> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
>> index a5e76aa06ad5..8fa6495cd948 100644
>> --- a/include/uapi/drm/drm_mode.h
>> +++ b/include/uapi/drm/drm_mode.h
>> @@ -312,16 +312,38 @@ struct drm_mode_set_plane {
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
> 
> This is an "in" field, right?
> 
> "in" meaning that userspace sets it to the ID of the plane it wants
> information on.
> 
> "out" field is a field written by the kernel as a response.
> 
> I'm not sure if the kernel has a habit of documenting these, because we
> use libdrm to abstract this so users do not need to care, but I think
> it would be nice.
> 

In a quick look, I couldn't find anything. But I can change the phrasing
to the following:

"@plane_id: Object ID of the plane whose information should be
retrieved. IN field, set by userspace."

>>  	__u32 plane_id;
>>
>> +	/** @crtc_id: Object ID of the current CRTC. */
>>  	__u32 crtc_id;
>> +	/** @fb_id: Object ID of the current fb. */
>>  	__u32 fb_id;
>>
>> +	/**
>> +	 * @possible_crtcs: Bitmask of CRTC's compatible with the plane. CRTC's
>> +	 * are created and they receive an index, which corresponds to their
>> +	 * position in the bitmask. CRTC with index 0 will be in bit 0, and so
>> +	 * on. To learn how to find out the index of a certain CRTC, please see
>> +	 * :ref:`crtc_index`.
> 
> This could be shortened to something like bit N corresponds to CRTC
> index N, and make "CRTC index N" a hyperlink.
> 

Nice, I'll apply this change.

>> +	 */
>>  	__u32 possible_crtcs;
>> +	/** @gamma_size: Number of entries of the legacy gamma lookup table. */
>>  	__u32 gamma_size;
>>
>> +	/** @count_format_types: Number of formats. */
>>  	__u32 count_format_types;
>> +	/**
>> +	 * @format_type_ptr: Pointer to ``__u32`` array of formats that are
>> +	 * supported by the plane. These formats do not require modifiers.
>> +	 */
>>  	__u64 format_type_ptr;
> 
> The count/ptr fields have an interesting usage pattern, which I suppose
> is common for all DRM ioctls. Makes me wonder if it should be documented.
> 
> AFAIU, count is in+out field: when set to 0, the kernel uses it to
> return the count needed. Then userspace allocates space and calls the
> ioctl again with the right count and ptr set to point to the allocated
> array of count elements. This is so that kernel never allocates memory
> on behalf of userspace for the return data, making things much simpler
> at the cost of maybe needing to call the ioctl twice to first figure
> out long the array should be.
> 
> This can be seen in libdrm code for drmModeGetPlane().
>
> There is certainly no point in explaining all that here, that is too
> much. But if there was a way to annotate the count member as in+out,
> that would be nice. And the ptr member as "in".
> 

This is documented in the description of struct drm_mode_get_connector:

https://www.kernel.org/doc/html/latest/gpu/drm-uapi.html#c.drm_mode_get_connector

Would be enough to have something similar in struct drm_mode_get_plane?

> 
> Thanks,
> pq
> 
>>  };
>>
>> --
>> 2.31.1
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 
