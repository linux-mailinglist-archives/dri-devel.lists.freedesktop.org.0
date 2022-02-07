Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C414AB944
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 12:18:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AE3A10E83A;
	Mon,  7 Feb 2022 11:18:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 817CC10E83A;
 Mon,  7 Feb 2022 11:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644232686; x=1675768686;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=sR52J1jfPqZvgylLjYw2JgjotcmVSxg8kDjAwlZsHSc=;
 b=RLC0AOsaUwC94Rak3dynPu2qnK065vk2tnig9tiMPlD7oxmT5NWgU1VB
 w6K9WW7jZalWMVdj4SQenoWQ0OWIg34mlIytzM5sNfVRWPENCxC3aGmLx
 40uKmrNU8pxd3AETYcEeHyC0WQNXjUhEi4V9APqaSq5bomPFACaLSHwKx
 d1YmPiplWUQ15aF17YnByOpE3lYwq6qCyf+Bsrl1fKZkWgyT8uVh9pvz7
 uErWT5PVlfYTXTrW/bd2DXl8CZfRBzJzOfD6CI7I+ODkknpxZR0WxBHf+
 hcJD+mo474LT6LuemvdyQyG2rrIrCRHfz0/0EE9uiDWaxBKvYAo4JXcYu g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10250"; a="228663913"
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; d="scan'208";a="228663913"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 03:18:06 -0800
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; d="scan'208";a="525095070"
Received: from sparchef-mobl1.ger.corp.intel.com (HELO [10.252.38.221])
 ([10.252.38.221])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 03:18:04 -0800
Message-ID: <7b33c013-354d-ed46-9c7e-00690ec02bd0@linux.intel.com>
Date: Mon, 7 Feb 2022 12:18:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.1
Subject: Re: [RFC PATCH 1/3] drm: Extract amdgpu_sa.c as a generic
 suballocation helper
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
References: <20220204174809.3366967-1-maarten.lankhorst@linux.intel.com>
 <20220204174809.3366967-2-maarten.lankhorst@linux.intel.com>
 <28be9b4b-dbe1-28fa-e013-570c45a5c705@amd.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <28be9b4b-dbe1-28fa-e013-570c45a5c705@amd.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Alex Deucher <alexander.deucher@amd.com>, intel-gfx@lists.freedesktop.org,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Op 04-02-2022 om 19:29 schreef Christian König:
> Oh, that's on my TODO list for years!
>
> Am 04.02.22 um 18:48 schrieb Maarten Lankhorst:
>> Suballocating a buffer object is something that is not driver
>> generic, and is useful for other drivers as well.
>>
>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> ---
>>   drivers/gpu/drm/Makefile       |   4 +-
>>   drivers/gpu/drm/drm_suballoc.c | 424 +++++++++++++++++++++++++++++++++
>>   include/drm/drm_suballoc.h     |  78 ++++++
>>   3 files changed, 505 insertions(+), 1 deletion(-)
>>   create mode 100644 drivers/gpu/drm/drm_suballoc.c
>>   create mode 100644 include/drm/drm_suballoc.h
>>
>> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
>> index 8675c2af7ae1..b848bcf8790c 100644
>> --- a/drivers/gpu/drm/Makefile
>> +++ b/drivers/gpu/drm/Makefile
>> @@ -57,7 +57,9 @@ drm_kms_helper-y := drm_bridge_connector.o drm_crtc_helper.o \
>>           drm_scdc_helper.o drm_gem_atomic_helper.o \
>>           drm_gem_framebuffer_helper.o \
>>           drm_atomic_state_helper.o drm_damage_helper.o \
>> -        drm_format_helper.o drm_self_refresh_helper.o drm_rect.o
>> +        drm_format_helper.o drm_self_refresh_helper.o drm_rect.o \
>> +        drm_suballoc.o
>> +
>
> I think we should put that into a separate module like we now do with other helpers as well.
Can easily be done, it will likely be a very small helper. The code itself is just under a page. I felt the overhead wasn't worth it, but will do so.
>>   drm_kms_helper-$(CONFIG_DRM_PANEL_BRIDGE) += bridge/panel.o
>>   drm_kms_helper-$(CONFIG_DRM_FBDEV_EMULATION) += drm_fb_helper.o
>>   diff --git a/drivers/gpu/drm/drm_suballoc.c b/drivers/gpu/drm/drm_suballoc.c
>> new file mode 100644
>> index 000000000000..e0bb35367b71
>> --- /dev/null
>> +++ b/drivers/gpu/drm/drm_suballoc.c
>> @@ -0,0 +1,424 @@
>> +/*
>> + * Copyright 2011 Red Hat Inc.
>> + * All Rights Reserved.
>> + *
>> + * Permission is hereby granted, free of charge, to any person obtaining a
>> + * copy of this software and associated documentation files (the
>> + * "Software"), to deal in the Software without restriction, including
>> + * without limitation the rights to use, copy, modify, merge, publish,
>> + * distribute, sub license, and/or sell copies of the Software, and to
>> + * permit persons to whom the Software is furnished to do so, subject to
>> + * the following conditions:
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
>> + * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
>> + * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
>> + * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
>> + * USE OR OTHER DEALINGS IN THE SOFTWARE.
>> + *
>> + * The above copyright notice and this permission notice (including the
>> + * next paragraph) shall be included in all copies or substantial portions
>> + * of the Software.
>> + *
>> + */
>> +/*
>> + * Authors:
>> + *    Jerome Glisse <glisse@freedesktop.org>
>> + */
>
> That is hopelessly outdated. IIRC I completely rewrote that stuff in ~2012.
If you rewrote it, can you give me an updated copyright header please?
>
>> +/* Algorithm:
>> + *
>> + * We store the last allocated bo in "hole", we always try to allocate
>> + * after the last allocated bo. Principle is that in a linear GPU ring
>> + * progression was is after last is the oldest bo we allocated and thus
>> + * the first one that should no longer be in use by the GPU.
>> + *
>> + * If it's not the case we skip over the bo after last to the closest
>> + * done bo if such one exist. If none exist and we are not asked to
>> + * block we report failure to allocate.
>> + *
>> + * If we are asked to block we wait on all the oldest fence of all
>> + * rings. We just wait for any of those fence to complete.
>> + */
>> +
>> +#include <drm/drm_suballoc.h>
>> +#include <drm/drm_print.h>
>> +#include <linux/slab.h>
>> +#include <linux/sched.h>
>> +#include <linux/wait.h>
>> +#include <linux/dma-fence.h>
>> +
>> +static void drm_suballoc_remove_locked(struct drm_suballoc *sa);
>> +static void drm_suballoc_try_free(struct drm_suballoc_manager *sa_manager);
>> +
>> +/**
>> + * drm_suballoc_manager_init - Initialise the drm_suballoc_manager
>> + *
>> + * @sa_manager: pointer to the sa_manager
>> + * @size: number of bytes we want to suballocate
>> + * @align: alignment for each suballocated chunk
>> + *
>> + * Prepares the suballocation manager for suballocations.
>> + */
>> +void drm_suballoc_manager_init(struct drm_suballoc_manager *sa_manager,
>> +                   u32 size, u32 align)
>> +{
>> +    u32 i;
>> +
>> +    if (!align)
>> +        align = 1;
>> +
>> +    /* alignment must be a power of 2 */
>> +    BUG_ON(align & (align - 1));
>
> When we move that I think we should cleanup the code once more, e.g. use is_power_of_2() function here for example.

Yeah, I was looking for POW2 or something, I couldn't remember the macro name.

> There are also a bunch of places with extra {} and constructs like "if (....) return true; else return false;" which could certainly be simplified.
>
> Apart from that really great idea.
>
I copied this from the original implementation, I didn't want to do any major cleanups, as I wanted to keep it as identical to the current code as possible.

The only thing I changed is moving the alignment to init, because it removes dealing with differently aligned suballocations as simplification.

By the way, does this break amd's CI in any way?

Cheers,

Maarten

