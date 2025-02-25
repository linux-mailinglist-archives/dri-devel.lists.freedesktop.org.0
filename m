Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20541A4412C
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 14:45:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6D5410E699;
	Tue, 25 Feb 2025 13:45:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="TqAOEm8j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE16510E699;
 Tue, 25 Feb 2025 13:45:30 +0000 (UTC)
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B326D82E;
 Tue, 25 Feb 2025 14:43:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1740491038;
 bh=JFC+miNbc8z+8hh+i0aV4a/eWqJcZlJ5xtiAErPuktY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=TqAOEm8jY6aGAOQ9BLN0iANHoj9EuhjvkXpBKUccldcKmyKt0NStoy2kNYhgofeYZ
 cUbxnpnvTsSayJiVOvExLLPlDM3UqxjFgDEnVVrdk1CIPi9iMuRQtQFt1hZU3tRKsg
 1eg95cZ+G1uKJIo455If+sXgT6dP77C6jL2Y3A4E=
Message-ID: <f74af5cc-bca8-45c1-9204-b362fcd6f998@ideasonboard.com>
Date: Tue, 25 Feb 2025 15:45:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/25] drm/dumb-buffers: Provide helper to set pitch
 and size
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
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20250218142542.438557-1-tzimmermann@suse.de>
 <20250218142542.438557-3-tzimmermann@suse.de>
 <dcd59a75-7945-4a2e-99f9-3abbb3e9de14@ideasonboard.com>
 <355ed315-61fa-4a9d-b72b-8d5bc7b5a16c@suse.de>
 <596b960e-71f8-4c2c-9abe-058206df1dfb@ideasonboard.com>
 <87ca2b81-a67a-468b-ae2b-30d02a3a64bc@suse.de>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <87ca2b81-a67a-468b-ae2b-30d02a3a64bc@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Hi,

On 21/02/2025 11:19, Thomas Zimmermann wrote:
> Hi
> 
> Am 20.02.25 um 11:53 schrieb Tomi Valkeinen:
>> Hi,
>>
>> On 20/02/2025 12:05, Thomas Zimmermann wrote:
>>> Hi
>>>
>>> Am 20.02.25 um 10:18 schrieb Tomi Valkeinen:
>>> [...]
>>>>> + * Color modes of 10, 12, 15, 30 and 64 are only supported for use by
>>>>> + * legacy user space. Please don't use them in new code. Other modes
>>>>> + * are not support.
>>>>> + *
>>>>> + * Do not attempt to allocate anything but linear framebuffer memory
>>>>> + * with single-plane RGB data. Allocation of other framebuffer
>>>>> + * layouts requires dedicated ioctls in the respective DRM driver.
>>>>
>>>> According to this, every driver that supports, say, NV12, should 
>>>> implement their own custom ioctl to do the exact same thing? And, of 
>>>> course, every userspace app that uses, say, NV12, should then add 
>>>> code for all these platforms to call the custom ioctls?
>>>
>>> Yes, that's exactly the current status.
>>>
>>> There has been discussion about a new dumb-create ioctl that takes a 
>>> DRM format as parameter. I'm all for it, but it's out of the scope 
>>> for this series.
>>>
>>>>
>>>> As libdrm's modetest currently supports YUV formats with dumb 
>>>> buffers, should we remove that code, as it's not correct and I'm 
>>>> sure people use libdrm code as a reference?
>>>
>>> Of course not.
>>>
>>>>
>>>> Well, I'm not serious above, but I think all my points from the 
>>>> earlier version are still valid. I don't like this. It changes the 
>>>> parameters of the ioctl (bpp used to be bits-per-pixel, not it's 
>>>> "color mode"), and the behavior of the ioctl, behavior that we've 
>>>> had for a very long time, and we have no idea how many users there 
>>>> are that will break (could be none, of course). And the 
>>>> documentation changes make the current behavior and uses wrong or 
>>>> legacy.
>>>
>>> Before I go into details about this statement, what use case exactly 
>>> are you referring to when you say that behavior changes?
>>
>> For every dumb_buffer allocation with bpp that is not divisible by 8, 
>> the result is different, i.e. instead of DIV_ROUND_UP(width * bpp, 8), 
>> we now have width * DIV_ROUND_UP(bpp, 8). This, of course, depends on 
>> the driver implementation. Some already do the latter.
> 
> The current dumb-buffer code does a stride computation at [1], which is 
> correct for all cases; although over-allocates sometimes. It's the one 
> you describe as "width * DIV_ROUND_UP(bpp, 8)". It's in the ioctl entry 
> point, so it's somewhat authoritative for all driver's implementations. 
> It's also used by several drivers.
> 
> The other variant, "DIV_ROUND_UP(width * bpp, 8)", is used by gem-dma, 
> gem-shmem and others. It can give incorrect results and possibly OOBs. 
> To give a simple example, let's allocate 15-bit XRGB1555. Bpp is 15. 
> With a width of 1024, that would result in 1920 bytes per scanline. But 
> because XRGB1555 has a filler bit, so the pixel is actually 16 bit and a 
> scanline needs to be 2048 bytes. The new code fixes that. This is not 
> just a hypothetical scenario: we do have drivers that support XRGB1555 
> and some of them also export a preferred_depth of 15 to userspace. [2] 
> In the nearby comment, you'll see that this value is meant for dumb 
> buffers.
> 
> Rounding up the depth value in user space is possible for RGB, but not 
> for YUV. Here different pixel planes have a different number of bits. 
> Sometimes pixels are sharing bits. The value of bits-per-pixel becomes 
> meaningless. That's why it's also deprecated in struct drm_format_info. 
> The struct instead uses a more complicated per-plane calculation to 
> compute the number of bits per plane. [3] The user-space code currently 
> doing YUV on dumb buffers simply got lucky.
> 
> [1] https://elixir.bootlin.com/linux/v6.13.3/source/drivers/gpu/drm/ 
> drm_dumb_buffers.c#L77
> [2] https://elixir.bootlin.com/linux/v6.13.3/source/include/drm/ 
> drm_mode_config.h#L885
> [3] https://elixir.bootlin.com/linux/v6.13.3/source/include/drm/ 
> drm_fourcc.h#L83
> 
>>
>> This change also first calls the drm_driver_color_mode_format(), which 
>> could change the behavior even more, but afaics at the moment does not. 
> 
> Because currently each driver does its own thing, it can be hard to 
> write user space that reliably allocates on all drivers. That's why it's 
> important that parameters are not just raw numbers, but have well- 
> defined semantics. The raw bpp is meaningless; it's also important to 
> know which formats are associated with each value. Otherwise, you might 
> get a dumb buffer with a bpp of 15, but it will be displayed 
> incorrectly. This patch series finally implements this and clearly 
> documents the assumptions behind the interfaces. The assumptions 
> themselves have always existed.

This is perhaps where the biggest gap in understanding/view is: I have 
always thought dumb-buffer's "bpp" to mean bits-per-pixel, where, for 
more complex formats, "pixel" is not necessarily a visible pixel but a 
container unit of some kind. So bpp * width = stride.

It would not occur to me to allocate XRGB1555 dumb-buffer with 15 bpp, 
but 16 bpp, as that's what a pixel takes. I have never seen the 
dumb-buffer bpp connected directly to the pixel format (that's what the 
ADDFB brings in).

I may be alone with that thinking, but afaics the documentation leans a 
bit on my interpretation (instead of considering bpp as a "color mode"), 
although admittedly the docs also don't really say much so this may be 
fully just my interpretation:

https://man.archlinux.org/man/drm-memory.7.en

https://cgit.freedesktop.org/drm/libdrm/tree/include/drm/drm_mode.h#n1055

I (mostly) understand all the complexities around here, thanks to your 
replies, and I think I'm ok with the series as it doesn't break anything 
(need to test the v3, though).

I still don't like it though =). And I would be happier with the simpler 
"bpp" interpretation that I mentioned above, instead of it being a color 
mode. But we can't have it both ways, and perhaps it's better to unify 
the code and have the behavior explained explicitly as you do in this 
series, even if the explanation only covers some RGB formats.

  Tomi

