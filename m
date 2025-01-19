Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F901A16191
	for <lists+dri-devel@lfdr.de>; Sun, 19 Jan 2025 13:19:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91CB910E09D;
	Sun, 19 Jan 2025 12:19:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tRX80voc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D241810E09D;
 Sun, 19 Jan 2025 12:19:00 +0000 (UTC)
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7716F5B3;
 Sun, 19 Jan 2025 13:17:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1737289078;
 bh=WuYYM946dC5xRl6wuOuPFt4jLi3lqjwU+0HIDQSxgRA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=tRX80voci0sTMUOK/9reTBMJPQAlIV8TvrcXURq7jGG+vCjVE38fbi500thBBeC7R
 1NlYT9LEyEDVeYFh/ogm0nF9tKWDflDEycJBP5OcuRzlfjV7wptK19XyjYCNbKLSBt
 z/j+dL4juHco2r0+YdfeUb8fcWnZC19aO+gnkjK0=
Message-ID: <ef52dab0-058f-408f-a298-c4b2453a3d2f@ideasonboard.com>
Date: Sun, 19 Jan 2025 14:18:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 25/25] drm/xlnx: Compute dumb-buffer sizes with
 drm_mode_size_dumb()
To: Sui Jingfeng <sui.jingfeng@linux.dev>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, imx@lists.linux.dev,
 linux-samsung-soc@vger.kernel.org, nouveau@lists.freedesktop.org,
 virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-tegra@vger.kernel.org, intel-xe@lists.freedesktop.org,
 xen-devel@lists.xenproject.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andy Yan <andyshrk@163.com>, Daniel Stone <daniel@fooishbar.org>
References: <f3ba05c7-6e49-4641-a3f9-ba418ebdb7c3@ideasonboard.com>
 <c6735280-7c32-4319-8ca9-a7305d8117c3@suse.de>
 <d67adb03-5cd0-4ac9-af58-cf4446dacee3@ideasonboard.com>
 <0ea6be58-0e04-4172-87cd-064a3e4a43bc@suse.de>
 <f35cb350-6be9-48ca-ad7e-e9dd418281d5@ideasonboard.com>
 <4af0b6a7-c16a-4187-bbf5-365a9c86de21@suse.de>
 <e327ad84-b5c9-4480-b873-dc3aca605538@ideasonboard.com>
 <a2bbeb47-2569-4ee0-9265-92bab139bdc6@suse.de>
 <f3833771-fcd7-45dc-9019-1525fef34429@ideasonboard.com>
 <CAMuHMdXxYa+Na3XxpLTy=-eUL_zQ9kAiUKYu-E04u3KWApusSA@mail.gmail.com>
 <xz5ncq67bgmdase2jg3cfvyaxpiwhol2eqpfzow6dqpauvslo5@2w3rw27lhnxo>
 <b97fcd2f-516a-4172-aef3-631418564cfa@linux.dev>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <b97fcd2f-516a-4172-aef3-631418564cfa@linux.dev>
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

On 19/01/2025 13:29, Sui Jingfeng wrote:
> Hi,
> 
> On 2025/1/16 18:35, Dmitry Baryshkov wrote:
>> On Thu, Jan 16, 2025 at 11:17:50AM +0100, Geert Uytterhoeven wrote:
>>> On Thu, Jan 16, 2025 at 11:03 AM Tomi Valkeinen
>>> <tomi.valkeinen@ideasonboard.com> wrote:
>>>> On 16/01/2025 10:09, Thomas Zimmermann wrote:
>>>>> Am 15.01.25 um 15:20 schrieb Tomi Valkeinen:
>>>>> [...]
>>>>>> My point is that we have the current UAPI, and we have userspace 
>>>>>> using
>>>>>> it, but we don't have clear rules what the ioctl does with specific
>>>>>> parameters, and we don't document how it has to be used.
>>>>>>
>>>>>> Perhaps the situation is bad, and all we can really say is that
>>>>>> CREATE_DUMB only works for use with simple RGB formats, and the
>>>>>> behavior for all other formats is platform specific. But I think even
>>>>>> that would be valuable in the UAPI docs.
>>>>> To be honest, I would not want to specify behavior for anything but 
>>>>> the
>>>>> linear RGB formats. If anything, I'd take Daniel's reply mail for
>>>>> documentation as-is. Anyone stretching the UAPI beyond RGB is on 
>>>>> their own.
>>>>>
>>>>>> Thinking about this, I wonder if this change is good for omapdrm or
>>>>>> xilinx (probably other platforms too that support non-simple non-RGB
>>>>>> formats via dumb buffers): without this patch, in both drivers, the
>>>>>> pitch calculations just take the bpp as bit-per-pixels, align it up,
>>>>>> and that's it.
>>>>>>
>>>>>> With this patch we end up using drm_driver_color_mode_format(), and
>>>>>> aligning buffers according to RGB formats figured out via heuristics.
>>>>>> It does happen to work, for the formats I tested, but it sounds like
>>>>>> something that might easily not work, as it's doing adjustments based
>>>>>> on wrong format.
>>>>>>
>>>>>> Should we have another version of drm_mode_size_dumb() which just
>>>>>> calculates using the bpp, without the drm_driver_color_mode_format()
>>>>>> path? Or does the drm_driver_color_mode_format() path provide some
>>>>>> value for the drivers that do not currently do anything similar?
>>>>> With the RGB-only rule, using drm_driver_color_mode_format() makes
>>>>> sense. It aligns dumb buffers and video=, provides error checking, and
>>>>> overall harmonizes code. The fallback is only required because of the
>>>>> existing odd cases that already bend the UAPI's rules.
>>>> I have to disagree here.
>>>>
>>>> On the platforms I have been using (omap, tidss, xilinx, rcar) the dumb
>>>> buffers are the only buffers you can get from the DRM driver. The dumb
>>>> buffers have been used to allocate linear and multiplanar YUV buffers
>>>> for a very long time on those platforms.
>>>>
>>>> I tried to look around, but I did not find any mentions that 
>>>> CREATE_DUMB
>>>> should only be used for RGB buffers. Is anyone outside the core
>>>> developers even aware of it?
>>>>
>>>> If we don't use dumb buffers there, where do we get the buffers? Maybe
>>>> from a v4l2 device or from a gpu device, but often you don't have 
>>>> those.
>>>> DMA_HEAP is there, of course.
>>> Why can't there be a variant that takes a proper fourcc format 
>>> instead of
>>> an imprecise bpp value?
>> Backwards compatibility. We can add an IOCTL for YUV / etc.
> 
> [...]
> 
>> But userspace must be able to continue allocating YUV buffers through
>> CREATE_DUMB.
> 
> I think, allocating YUV buffers through CREATE_DUMB interface is just
> an *abuse* and *misuse* of this API for now.
> 
> Take the NV12 format as an example, NV12 is YUV420 planar format, have
> two planar: the Y-planar and the UV-planar. The Y-planar appear first
> in memory as an array of unsigned char values. The Y-planar is followed
> immediately by the UV-planar, which is also an array of unsigned char
> values that contains packed U (Cb) and V (Cr) samples.
> 
> But the 'drm_mode_create_dumb' structure is only intend to provide
> descriptions for *one* planar.
> 
> struct drm_mode_create_dumb {
>      __u32 height;
>      __u32 width;
>      __u32 bpp;
>      __u32 flags;
>      __u32 handle;
>      __u32 pitch;
>      __u64 size;
> };
> 
> An width x height NV12 image takes up width*height*(1 + 1/4 + 1/4) bytes.
> 
> So we can allocate an *equivalent* sized buffer to store the NV12 raw data.
> 
> Either 'width * (height * 3/2)' where each pixel take up 8 bits,
> or just 'with * height' where each pixels take up 12 bits.
> 
> However, all those math are just equivalents description to the original
> NV12 format, neither are concrete correct physical description.

I don't see the problem. Allocating dumb buffers, if we don't have any 
heuristics related to RGB behind it, is essentially just allocating a 
specific amount of memory, defined by width, height and bitsperpixel.

If I want to create an NV12 framebuffer, I allocate two dumb buffers, 
one for Y and one for UV planes, and size them accordingly. And then 
create the DRM framebuffer with those.

> Therefore, allocating YUV buffers through the dumb interface is just an
> abuse for that API. We certainly can abuse more by allocating two dumb
> buffers, one for Y-planer, another one for the UV-planer. But again,dumb 
> buffers can be (and must be) used for *scanout* directly. What will 
> yield if I commit the YUV buffers you allocated to the CRTC directly?

You'll see it on the screen? I don't understand your point here...

> In other words, You can allocated buffers via the dumb APIs to store 
> anything,
> but the key point is that how can we interpret it.
> 
> As Daniel puts it, the semantics of that API is well defined for simple RGB
> formats. Usages on non linear RGB dumb buffers are considered as undefined
> behavior.
> 
> Peoples can still abusing it at the user-space though, but the kernel don't
> have to guarantee that the user-space *must* to be able to continue doing
> balabala..., That's it.

I have hard time understanding the "abuse" argument. But in any case, 
the API has been working like this for who knows how long, and used 
widely (afaik). The question is, do we break it or not. Granted, this 
series doesn't break it as such, but it adds heuristics that wasn't 
there before, and it could affect the behavior. If we still want to do 
that, I want to understand what is the benefit, because there's a 
potential to cause regressions.

  Tomi

