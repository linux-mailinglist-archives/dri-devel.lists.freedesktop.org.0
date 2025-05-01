Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4B9AA5C9D
	for <lists+dri-devel@lfdr.de>; Thu,  1 May 2025 11:25:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 648FB10E345;
	Thu,  1 May 2025 09:25:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=robert.mader@collabora.com header.b="epQZSRjK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44A7210E345
 for <dri-devel@lists.freedesktop.org>; Thu,  1 May 2025 09:25:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1746091548; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Jnzoy63sp2etEUQgOm9LbbFlpo+P42ROHmeHb/Xr/gj8+M48EWYmkMbDbKhKxRPRnkmSkKaDdiSOPoJjNO7FGFmDTaKwtg2kAlFycsKQJ4SE8YW5Buo0smFf7dRlhyhwh3BTf18vTn7nAwYWNcGJ+tdE7uvrxZ1btBl5oQFFIFE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1746091548;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=ElC4oyuxltt+CJRlzCXUuHTtobKyZqtdFcQtDXd3EuM=; 
 b=VYBB34HnOau33hJ0GRpKmL/WWj1GXn5St2E1yJgIq77PSCaGyypDA1ETeC+i8EgEXS0BOLXOcac2/6P3JtQUTYNTeR1BLZ5XK7q3sgUosITjzVe7n49aL1eH5AFV9SjXPnt1Gd6w66WYUXE9euhSi15eN/VepfC/oQDB3qYiCN0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=robert.mader@collabora.com;
 dmarc=pass header.from=<robert.mader@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1746091548; 
 s=zohomail; d=collabora.com; i=robert.mader@collabora.com;
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=ElC4oyuxltt+CJRlzCXUuHTtobKyZqtdFcQtDXd3EuM=;
 b=epQZSRjK026+CpNotWTlGroRj+RSA6/vCZ2jhkm1IrWe5OnzWKB5rhhnU0Vz22gG
 mii1bDn6DQI81UzrqhJGFLyVfgELXeJnJnXjG8Oguwf4ZpNN5FEGLUl8BREo6BVb/2T
 lTIn6P9bSuo1kfundhWcd1V0H7ap/87eovvGmpKk=
Received: by mx.zohomail.com with SMTPS id 1746091545661396.92895449786056;
 Thu, 1 May 2025 02:25:45 -0700 (PDT)
Message-ID: <ea360766-d545-459c-b862-19414f71584f@collabora.com>
Date: Thu, 1 May 2025 11:25:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: drm_fourcc: add 10/12bit software decoder YCbCr
 formats
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org,
 Christopher Obbard <chris.obbard@collabora.com>,
 Javier Martinez Canillas <javierm@redhat.com>
References: <20250407191314.500601-1-robert.mader@collabora.com>
 <dde3c5c3-4e23-4962-a165-38fa6b004ef1@collabora.com>
 <20250424133130.GD18085@pendragon.ideasonboard.com>
 <22eba1dc-8b98-47cd-bdf4-37a75f6aadfc@ideasonboard.com>
Content-Language: en-US, de-DE, en-GB
From: Robert Mader <robert.mader@collabora.com>
In-Reply-To: <22eba1dc-8b98-47cd-bdf4-37a75f6aadfc@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Hi Tomi

On 24.04.25 18:49, Tomi Valkeinen wrote:
> Hi,
>
> On 24/04/2025 16:31, Laurent Pinchart wrote:
>> On Thu, Apr 24, 2025 at 02:53:18PM +0200, Robert Mader wrote:
>>> Chris, Javier, Laurent - sorry for the noise, but given you reviewed
>>> changes in the respective files before, maybe you can help me moving
>>> this forward? I'd be very happy for any feedback to get this landed,
>>> thanks! :)
>>
>> I don't have spare bandwidth at the moment, sorry :-( One comment below
>> though.
>>
>> Tomi, can you check if there's any overlap with the formats you're
>> adding for the Xilinx FPGA drivers ?
>
> No overlap, they are quite different.
>
>>> On 07.04.25 21:13, Robert Mader wrote:
>>>> This adds FOURCCs for 10/12bit YCbCr formats used by software decoders
>>>> like ffmpeg, dav1d and libvpx. The intended use-case is buffer sharing
>>>> between SW-decoders and GPUs by allocating buffers with udmabuf or
>>>> dma-heaps, avoiding unnecessary copies or format conversions.
>>>>
>>>> Unlike formats typically used by hardware decoders these formats
>>>> use a LSB alignment. In order to allow fast implementations in GL
>>>> and Vulkan the padding must contain only zeros, so the float
>>>> representation can calculated by simple multiplicating with 2^6=64
>
> "can be"
>
>>>> or 2^4=16.
>>
>> This needs to be documented somewhere.
>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Thanks a lot! I just send out a v2 - the changes I made were IMO 
slightly too big to carry that r-b over - I'd be very thankful if you 
could have another look / renew your r-b :)

>
>  Tomi

Cheers,

Robert

>
>>>>
>>>> WIP MRs for Mesa, Vulkan and Gstreamer can be found at:
>>>>    - https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/34303
>>>>    - 
>>>> https://github.com/rmader/Vulkan-Docs/commits/ycbcr-16bit-lsb-formats/
>>>>    - 
>>>> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8540 
>>>>
>>>>
>>>> The values where inspired by the corresponding VA_FOURCC_I010, however
>>>> suggestions are very welcome.
>>>>
>>>> Signed-off-by: Robert Mader <robert.mader@collabora.com>
>>>> ---
>>>>    drivers/gpu/drm/drm_fourcc.c  | 18 ++++++++++++++++++
>>>>    include/uapi/drm/drm_fourcc.h | 20 ++++++++++++++++++++
>>>>    2 files changed, 38 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_fourcc.c 
>>>> b/drivers/gpu/drm/drm_fourcc.c
>>>> index 3a94ca211f9c..917f77703645 100644
>>>> --- a/drivers/gpu/drm/drm_fourcc.c
>>>> +++ b/drivers/gpu/drm/drm_fourcc.c
>>>> @@ -346,6 +346,24 @@ const struct drm_format_info 
>>>> *__drm_format_info(u32 format)
>>>>            { .format = DRM_FORMAT_P030,            .depth = 0,  
>>>> .num_planes = 2,
>>>>              .char_per_block = { 4, 8, 0 }, .block_w = { 3, 3, 0 }, 
>>>> .block_h = { 1, 1, 0 },
>>>>              .hsub = 2, .vsub = 2, .is_yuv = true},
>>>> +        { .format = DRM_FORMAT_I010,            .depth = 0,  
>>>> .num_planes = 3,
>>>> +          .char_per_block = { 2, 2, 2 }, .block_w = { 1, 1, 1 }, 
>>>> .block_h = { 1, 1, 1 },
>>>> +          .hsub = 2, .vsub = 2, .is_yuv = true},
>>>> +        { .format = DRM_FORMAT_I210,            .depth = 0,  
>>>> .num_planes = 3,
>>>> +          .char_per_block = { 2, 2, 2 }, .block_w = { 1, 1, 1 }, 
>>>> .block_h = { 1, 1, 1 },
>>>> +          .hsub = 2, .vsub = 1, .is_yuv = true},
>>>> +        { .format = DRM_FORMAT_I410,            .depth = 0,  
>>>> .num_planes = 3,
>>>> +          .char_per_block = { 2, 2, 2 }, .block_w = { 1, 1, 1 }, 
>>>> .block_h = { 1, 1, 1 },
>>>> +          .hsub = 1, .vsub = 1, .is_yuv = true},
>>>> +        { .format = DRM_FORMAT_I012,            .depth = 0,  
>>>> .num_planes = 3,
>>>> +          .char_per_block = { 2, 2, 2 }, .block_w = { 1, 1, 1 }, 
>>>> .block_h = { 1, 1, 1 },
>>>> +          .hsub = 2, .vsub = 2, .is_yuv = true},
>>>> +        { .format = DRM_FORMAT_I212,            .depth = 0,  
>>>> .num_planes = 3,
>>>> +          .char_per_block = { 2, 2, 2 }, .block_w = { 1, 1, 1 }, 
>>>> .block_h = { 1, 1, 1 },
>>>> +          .hsub = 2, .vsub = 1, .is_yuv = true},
>>>> +        { .format = DRM_FORMAT_I412,            .depth = 0,  
>>>> .num_planes = 3,
>>>> +          .char_per_block = { 2, 2, 2 }, .block_w = { 1, 1, 1 }, 
>>>> .block_h = { 1, 1, 1 },
>>>> +          .hsub = 1, .vsub = 1, .is_yuv = true},
>>>>        };
>>>>           unsigned int i;
>>>> diff --git a/include/uapi/drm/drm_fourcc.h 
>>>> b/include/uapi/drm/drm_fourcc.h
>>>> index e41a3cec6a9e..f22c80031595 100644
>>>> --- a/include/uapi/drm/drm_fourcc.h
>>>> +++ b/include/uapi/drm/drm_fourcc.h
>>>> @@ -397,6 +397,26 @@ extern "C" {
>>>>    #define DRM_FORMAT_YUV444    fourcc_code('Y', 'U', '2', '4') /* 
>>>> non-subsampled Cb (1) and Cr (2) planes */
>>>>    #define DRM_FORMAT_YVU444    fourcc_code('Y', 'V', '2', '4') /* 
>>>> non-subsampled Cr (1) and Cb (2) planes */
>>>>    +/*
>>>> + * 3 plane YCbCr LSB aligned
>>>> + * index 0 = Y plane, [15:0] x:Y [6:10] little endian
>>>> + * index 1 = Cr plane, [15:0] x:Cr [6:10] little endian
>>>> + * index 2 = Cb plane, [15:0] x:Cb [6:10] little endian
>>>> + */
>>>> +#define DRM_FORMAT_I010    fourcc_code('I', '0', '1', '0') /* 2x2 
>>>> subsampled Cb (1) and Cr (2) planes 10 bits per channel */
>>>> +#define DRM_FORMAT_I210    fourcc_code('I', '2', '1', '0') /* 2x1 
>>>> subsampled Cb (1) and Cr (2) planes 10 bits per channel */
>>>> +#define DRM_FORMAT_I410    fourcc_code('I', '4', '1', '0') /* 
>>>> non-subsampled Cb (1) and Cr (2) planes 10 bits per channel */
>>>> +
>>>> +/*
>>>> + * 3 plane YCbCr LSB aligned
>>>> + * index 0 = Y plane, [15:0] x:Y [4:12] little endian
>>>> + * index 1 = Cr plane, [15:0] x:Cr [4:12] little endian
>>>> + * index 2 = Cb plane, [15:0] x:Cb [4:12] little endian
>>>> + */
>>>> +#define DRM_FORMAT_I012    fourcc_code('I', '0', '1', '2') /* 2x2 
>>>> subsampled Cb (1) and Cr (2) planes 12 bits per channel */
>>>> +#define DRM_FORMAT_I212    fourcc_code('I', '2', '1', '2') /* 2x1 
>>>> subsampled Cb (1) and Cr (2) planes 12 bits per channel */
>>>> +#define DRM_FORMAT_I412    fourcc_code('I', '4', '1', '2') /* 
>>>> non-subsampled Cb (1) and Cr (2) planes 12 bits per channel */
>>>> +
>>>>       /*
>>>>     * Format Modifiers:
>>
>
