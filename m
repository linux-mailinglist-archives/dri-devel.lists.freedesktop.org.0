Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6950DA07E76
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 18:15:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06C6210EEE6;
	Thu,  9 Jan 2025 17:15:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R0mEQ+Wu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63E3910EEB3;
 Thu,  9 Jan 2025 17:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736442926; x=1767978926;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=iHe0e5c+fmzIEFb4JwfVINvpf7LWF6/4nvNtj0QRgPQ=;
 b=R0mEQ+WuUaHa5xHsD1YsYxKojJgiuLbG7KgDusO19vIqAqLmP+cTqSwz
 LfRIh+glbMsbVuJUi3jpL6ZBCDcehOwtV9cJgwIBIMg15JEUL3x4E8G1o
 lpwJ/VJIDKIDtPHOQS7yk61zH9xneX1RDTLpMcdppznHK6wBPuw2t1JML
 L7YkAbgzQxUYbircwgDBGXzhrcBz6KIvKdC4a/+qV6/Q+YtCuwCqYG21f
 5SOcVm79KzpOdZWsUUlFggDHFv+yFLrGXwNiVdOeZlxFWjUg8jFkc+QsM
 56bkzb6lj1qK/XBAtbWxQd5p9HU1GBfD3UdT86inl66/Oi4zaJq2YmPWL Q==;
X-CSE-ConnectionGUID: YFaFgxkTT6GVrRBin2NliA==
X-CSE-MsgGUID: eWjNcouaQN+0YqSeAxQxnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="36604454"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; d="scan'208";a="36604454"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 09:15:26 -0800
X-CSE-ConnectionGUID: sCHGnpr3S22msRSMnEsaNw==
X-CSE-MsgGUID: Kiw4VfoXQbSJcARHoMEU4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="140776648"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO [10.245.245.241])
 ([10.245.245.241])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 09:15:20 -0800
Message-ID: <ec240a46-3fe1-46fa-84bc-2f962d7441ce@intel.com>
Date: Thu, 9 Jan 2025 17:15:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 23/25] drm/xe: Compute dumb-buffer sizes with
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
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20250109150310.219442-1-tzimmermann@suse.de>
 <20250109150310.219442-24-tzimmermann@suse.de>
 <91c904f8-ba47-4595-be65-6fb57dcc9c64@intel.com>
 <6666af19-a98d-41d7-8329-7b50807c04a9@suse.de>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <6666af19-a98d-41d7-8329-7b50807c04a9@suse.de>
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

On 09/01/2025 16:26, Thomas Zimmermann wrote:
> Hi
> 
> 
> Am 09.01.25 um 17:05 schrieb Matthew Auld:
>> On 09/01/2025 14:57, Thomas Zimmermann wrote:
>>> Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch
>>> and buffer size. Align the pitch to a multiple of 8. Align the
>>> buffer size according to hardware requirements.
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>> Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_bo.c | 8 ++++----
>>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>>> index e6c896ad5602..d75e3c39ab14 100644
>>> --- a/drivers/gpu/drm/xe/xe_bo.c
>>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>>> @@ -8,6 +8,7 @@
>>>   #include <linux/dma-buf.h>
>>>     #include <drm/drm_drv.h>
>>> +#include <drm/drm_dumb_buffers.h>
>>>   #include <drm/drm_gem_ttm_helper.h>
>>>   #include <drm/drm_managed.h>
>>>   #include <drm/ttm/ttm_device.h>
>>> @@ -2535,14 +2536,13 @@ int xe_bo_dumb_create(struct drm_file 
>>> *file_priv,
>>>       struct xe_device *xe = to_xe_device(dev);
>>>       struct xe_bo *bo;
>>>       uint32_t handle;
>>> -    int cpp = DIV_ROUND_UP(args->bpp, 8);
>>>       int err;
>>>       u32 page_size = max_t(u32, PAGE_SIZE,
>>>           xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K);
>>>   -    args->pitch = ALIGN(args->width * cpp, 64);
>>> -    args->size = ALIGN(mul_u32_u32(args->pitch, args->height),
>>> -               page_size);
>>> +    err = drm_mode_size_dumb(dev, args, SZ_64, page_size);
>>
>> AFAICT this looks to change the behaviour, where u64 size was 
>> technically possible and was allowed given that args->size is u64, but 
>> this helper is limiting the size to u32. Is that intentional? If so, 
>> we should probably make that clear in the commit message.
> 
> That's an interesting observation; thanks. The ioctl's internal checks 
> have always limited the size to 32 bit. [1] I think it is not supposed 
> to be larger than that. We can change the helper to support 64-bit sizes 
> as well.

Ah, I missed the internal check.

> 
> Having said that, is there any use case? Dumb buffers are for software 
> rendering only. Allocating more than a few dozen MiB seems like a 
> mistake. Maybe we should rather limit the allowed allocation size instead?

Yeah, I doubt there are any real users. Given the existing internal 
check, limiting to u32 makes sense to me.

> 
> Best regards
> Thomas
> 
> [1] https://elixir.bootlin.com/linux/v6.12.6/source/drivers/gpu/drm/ 
> drm_dumb_buffers.c#L82
> 
>>
>>> +    if (err)
>>> +        return err;
>>>         bo = xe_bo_create_user(xe, NULL, NULL, args->size,
>>>                      DRM_XE_GEM_CPU_CACHING_WC,
>>
> 

