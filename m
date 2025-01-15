Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC98A124C2
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 14:33:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0320C10E6A3;
	Wed, 15 Jan 2025 13:33:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fDhitdAE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AC7A10E68B;
 Wed, 15 Jan 2025 13:33:22 +0000 (UTC)
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7F882526;
 Wed, 15 Jan 2025 14:32:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1736947942;
 bh=8JOGQGcW2ZWewo/KKlUGVpyO0dsZu2+5fVZtMSIarrA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=fDhitdAEpi4x4vI7U/E5YZVaek0gB2u/TTS45eMq+neSseTaQ0kQaj+uu9f7l7jDp
 PzJ1EUx8yuUkcwotUbBDGDcB1oEBlwlwINzVJ8Eopn/oXZ75oGAykk4lrfsdw/sOXw
 Y9PORlJ7sPyTjNaCzaBAbXIft918iSL0pYK+YitM=
Message-ID: <f35cb350-6be9-48ca-ad7e-e9dd418281d5@ideasonboard.com>
Date: Wed, 15 Jan 2025 15:33:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 25/25] drm/xlnx: Compute dumb-buffer sizes with
 drm_mode_size_dumb()
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 nouveau@lists.freedesktop.org, virtualization@lists.linux.dev,
 spice-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
 intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andy Yan <andyshrk@163.com>
References: <20250109150310.219442-1-tzimmermann@suse.de>
 <20250109150310.219442-26-tzimmermann@suse.de>
 <cdbe483d-0895-47aa-8c83-1c28220f4a02@ideasonboard.com>
 <bc97b92e-7f8a-4b92-af8a-20fa165ead55@suse.de>
 <f3ba05c7-6e49-4641-a3f9-ba418ebdb7c3@ideasonboard.com>
 <c6735280-7c32-4319-8ca9-a7305d8117c3@suse.de>
 <d67adb03-5cd0-4ac9-af58-cf4446dacee3@ideasonboard.com>
 <0ea6be58-0e04-4172-87cd-064a3e4a43bc@suse.de>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <0ea6be58-0e04-4172-87cd-064a3e4a43bc@suse.de>
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

Hi,

On 15/01/2025 14:34, Thomas Zimmermann wrote:
> Hi
> 
> 
> Am 15.01.25 um 13:06 schrieb Tomi Valkeinen:
>> Hi,
>>
>> On 15/01/2025 13:37, Thomas Zimmermann wrote:
>>> Hi
>>>
>>>
>>> Am 15.01.25 um 11:58 schrieb Tomi Valkeinen:
>>> [...]
>>>>> These are all good points. Did you read my discussion with Andy on 
>>>>> patch 2? I think it resolves all the points you have. The current 
>>>>> CREATE_DUMB 
>>>>
>>>> I had missed the discussion, and, indeed, the patch you attached 
>>>> fixes the problem on Xilinx.
>>>
>>> Great. Thanks for testing.
>>>
>>>>
>>>>> ioctl is unsuited for anything but the simple RGB formats. The bpp 
>>>>
>>>> It's a bit difficult to use, but is it really unsuited? 
>>>> bitsperpixel, width and height do give an exact pitch and size, do 
>>>> they not? It does require the userspace to handle the subsampling 
>>>> and planes, though, so far from perfect.
>>>
>>> The bpp value sets the number of bits per pixel; except for bpp==15 
>>> (XRGB1555), where it sets the color depth. OR bpp is the color depth; 
>>> except for bpp==32 (XRGB8888), where it is the number of bits per 
>>> pixel. It's therefore best to interpret it like a color-mode enum.
>>
>> Ah, right... That's horrible =).
>>
>> And I assume it's not really possible to define the bpp to mean bits 
>> per pixel, except for a few special cases like 15?
>>
>> Why do we even really care about color depth here? We're just 
>> allocating memory. Doesn't DIV_ROUND_UP(args->bpp, SZ_8) work fine for 
>> XRGB1555 too?
> 
> Drivers always did that, but it does not work correctly for (bpp < 8). 
> As we already have helpers to deal with bpp, it makes sense to use 
> them.  This also aligns dumb buffers with the kernel's video= parameter, 
> which as the same odd semantics. The fallback that uses bpp directly 
> will hopefully be the exception.

Hmm, well... If we had a 64-bit RGB format in the list of "legacy fb 
formats", I wouldn't have noticed anything. And if I would just use 32 
as the bpp, and adjust width accordingly, it would also have worked. So, 
I expect the fallback to be an exception,

And by working I mean that I can run my apps fine, but the internal 
operation would sure be odd: allocating any YUV buffer will cause 
drm_mode_size_dumb() to get an RGB format from 
drm_driver_color_mode_format(), and get a drm_format_info_min_pitch() 
for an RGB format.

>>>> So, I'm all for a new ioctl, but I don't right away see why the 
>>>> current ioctl couldn't be used. Which makes me wonder about the 
>>>> drm_warn() in your patch, and the "userspace throws in arbitrary 
>>>> values for bpp and relies on the kernel to figure it out". Maybe I'm 
>>>> missing something here.
>>>
>>> I was unsure about the drm_warn() as well. It's not really wrong to 
>>> have odd bpp values, but handing in an unknown bpp value might point 
>>> to a user-space error. At least there should be a drm_dbg().
>>>
>>>>
>>>>> parameter is not very precise. The solution would be a new ioctl 
>>>>> call that receives the DRM format and returns a buffer for each 
>>>>> individual plane.
>>>>
>>>> Yes, I think that makes sense. That's a long road, though =). So my 
>>>> question is, is CREATE_DUMB really unsuitable for other than simple 
>>>> RGB formats, or can it be suitable if we just define how the 
>>>> userspace should use it for multiplanar, subsampled formats?
>>>
>>> That would duplicate format and hardware information in user-space. Some 
>>
>> But we already have that, don't we? We have drivers and userspace that 
>> support, say, NV12 via dumb buffers. But (correct me if I'm wrong) we 
>> don't document how CREATE_DUMB has to be used to allocate multiplanar 
>> subsampled buffers, so the userspace devs have to "guess".
> 
> Yeah, there are constrains in the scanline and buffer alignments and 
> orientation. And if we say that bpp==12 means NV12, it will be a problem 
> for all other cases where bpp==12 makes sense.

I feel I still don't quite understand. Can't we define and document 
CREATE_DUMB like this:

If (bpp < 8 || is_power_of_two(bpp))
	bpp means bitsperpixel
	pitch is args->width * args->bpp / 8, aligned up to driver-specific-align
else
	bpp is a legacy parameter, and we deal with it case by case.
	list the cases and what they mean

And describe that when allocating subsampled buffers, the caller must 
adjust the width and height accordingly. And that the bpp and width can 
also refer to pixel groups.

Or if the currently existing code prevents the above for 16 and 32 bpps, 
how about defining that any non-RGB or not-simple buffer has to be 
allocated with bpp=8, and the userspace has to align the pitch correctly 
according to the format and platform's hw restrictions?

  Tomi

