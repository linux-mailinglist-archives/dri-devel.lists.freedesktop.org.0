Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6513A121A0
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 11:58:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFF1710E5C0;
	Wed, 15 Jan 2025 10:58:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lzo3SM0J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EC6410E4F0;
 Wed, 15 Jan 2025 10:58:54 +0000 (UTC)
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8E93E4AD;
 Wed, 15 Jan 2025 11:57:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1736938675;
 bh=PHvyrlfL90DWijiSoft7XP7rReZoqz0LHMvPolG3eVc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=lzo3SM0Jh0gt3jMLAaQUsepDmw7eYUBnlka5hbbPJnOVGveG2GsivekYsCC/wVcWM
 Fpv1tfAAWSv7Wahb71B2n7RvzSXmVxJHOI1MGlNmaSR3eC23tKmnhwmEeri17hRi+x
 h9NpTRQ9X4CPbC+pYA0xfkGmK5O2KaoBdQa05y/Q=
Message-ID: <f3ba05c7-6e49-4641-a3f9-ba418ebdb7c3@ideasonboard.com>
Date: Wed, 15 Jan 2025 12:58:48 +0200
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
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <bc97b92e-7f8a-4b92-af8a-20fa165ead55@suse.de>
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

On 15/01/2025 12:26, Thomas Zimmermann wrote:
> Hi
> 
> 
> Am 15.01.25 um 11:13 schrieb Tomi Valkeinen:
>> Hi!
>>
>> On 09/01/2025 16:57, Thomas Zimmermann wrote:
>>> Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch and
>>> buffer size. Align the pitch according to hardware requirements.
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>> Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>>> ---
>>>   drivers/gpu/drm/xlnx/zynqmp_kms.c | 7 +++++--
>>>   1 file changed, 5 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.c b/drivers/gpu/drm/ 
>>> xlnx/zynqmp_kms.c
>>> index b47463473472..7ea0cd4f71d3 100644
>>> --- a/drivers/gpu/drm/xlnx/zynqmp_kms.c
>>> +++ b/drivers/gpu/drm/xlnx/zynqmp_kms.c
>>> @@ -19,6 +19,7 @@
>>>   #include <drm/drm_crtc.h>
>>>   #include <drm/drm_device.h>
>>>   #include <drm/drm_drv.h>
>>> +#include <drm/drm_dumb_buffers.h>
>>>   #include <drm/drm_encoder.h>
>>>   #include <drm/drm_fbdev_dma.h>
>>>   #include <drm/drm_fourcc.h>
>>> @@ -363,10 +364,12 @@ static int zynqmp_dpsub_dumb_create(struct 
>>> drm_file *file_priv,
>>>                       struct drm_mode_create_dumb *args)
>>>   {
>>>       struct zynqmp_dpsub *dpsub = to_zynqmp_dpsub(drm);
>>> -    unsigned int pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
>>> +    int ret;
>>>         /* Enforce the alignment constraints of the DMA engine. */
>>> -    args->pitch = ALIGN(pitch, dpsub->dma_align);
>>> +    ret = drm_mode_size_dumb(drm, args, dpsub->dma_align, 0);
>>> +    if (ret)
>>> +        return ret;
>>>         return drm_gem_dma_dumb_create_internal(file_priv, drm, args);
>>>   }
>>
>> I have some trouble with this one.
>>
>> I have sent a series to add some pixel formats:
>>
>> https://lore.kernel.org/all/20250115-xilinx-formats- 
>> v2-0-160327ca652a@ideasonboard.com/
>>
>> Let's look at XV15. It's similar to NV12, but 10 bits per component, 
>> and some packing and padding.
>>
>> First plane: 3 pixels in a 32 bit group
>> Second plane: 3 pixels in a 64 bit group, 2x2 subsampled
>>
>> So, on average, a pixel on the first plane takes 32 / 3 = 10.666... 
>> bits on a line. That's not a usable number for the 
>> DRM_IOCTL_MODE_CREATE_DUMB ioctl.
>>
>> What I did was to use the pixel group size as "bpp" for 
>> DRM_IOCTL_MODE_CREATE_DUMB. So, e.g., for 720 x 576:
>>
>> Stride for first plane: 720 * (32 / 3) / 8 = 960 bytes
>> Stride for second plane: 720 / 2 * (64 / 3) / 8 = 960 bytes
>>
>> First plane: 720 / 3 = 240 pixel groups
>> Second plane: 720 / 2 / 3 = 120 pixel groups
>>
>> So I allocated the two planes with:
>> 240 x 576 with 32 bitspp
>> 120 x 288 with 64 bitspp
>>
>> This worked, and if I look at the DRM_IOCTL_MODE_CREATE_DUMB in the 
>> docs, I can't right away see anything there that says my tactic was 
>> not allowed.
>>
>> The above doesn't work anymore with this patch, as the code calls 
>> drm_driver_color_mode_format(), which fails for 64 bitspp. It feels a 
>> bit odd that DRM_IOCTL_MODE_CREATE_DUMB will try to guess the RGB 
>> fourcc for a dumb buffer allocation.
>>
>> So, what to do here? Am I doing something silly? What's the correct 
>> way to allocate the buffers for XV15? Should I just use 32 bitspp for 
>> the plane 2 too, and double the width (this works)?
>>
>> Is DRM_IOCTL_MODE_CREATE_DUMB only meant for simple RGB formats? The 
>> xilinx driver can, of course, just not use drm_mode_size_dumb(). But 
>> if so, I guess the limitations of drm_mode_size_dumb() should be 
>> documented.
>>
>> Do we need a new dumb-alloc ioctl that takes the format and plane 
>> number as parameters? Or alternatively a simpler dumb-alloc that 
>> doesn't have width and bpp, but instead takes a stride and height as 
>> parameters? I think those would be easier for the userspace to use, 
>> instead of trying to adjust the parameters to be suitable for the kernel.
> 
> These are all good points. Did you read my discussion with Andy on patch 
> 2? I think it resolves all the points you have. The current CREATE_DUMB 

I had missed the discussion, and, indeed, the patch you attached fixes 
the problem on Xilinx.

> ioctl is unsuited for anything but the simple RGB formats. The bpp 

It's a bit difficult to use, but is it really unsuited? bitsperpixel, 
width and height do give an exact pitch and size, do they not? It does 
require the userspace to handle the subsampling and planes, though, so 
far from perfect.

So, I'm all for a new ioctl, but I don't right away see why the current 
ioctl couldn't be used. Which makes me wonder about the drm_warn() in 
your patch, and the "userspace throws in arbitrary values for bpp and 
relies on the kernel to figure it out". Maybe I'm missing something here.

> parameter is not very precise. The solution would be a new ioctl call 
> that receives the DRM format and returns a buffer for each individual 
> plane.

Yes, I think that makes sense. That's a long road, though =). So my 
question is, is CREATE_DUMB really unsuitable for other than simple RGB 
formats, or can it be suitable if we just define how the userspace 
should use it for multiplanar, subsampled formats?

  Tomi

