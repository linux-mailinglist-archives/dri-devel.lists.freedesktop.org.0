Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3206E70B86B
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 11:05:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40F3F10E287;
	Mon, 22 May 2023 09:05:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.103])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3300F10E0FF
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 09:05:16 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.43:51158.600247562
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.43])
 by 189.cn (HERMES) with SMTP id 387F01002CF;
 Mon, 22 May 2023 17:05:11 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-75648544bd-7vx9t with ESMTP id
 4e1da2ddffb14c7ea87b889e41f0d88c for kernel@xen0n.name; 
 Mon, 22 May 2023 17:05:14 CST
X-Transaction-ID: 4e1da2ddffb14c7ea87b889e41f0d88c
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <47bfa5a1-8a60-6faa-1983-d8a29589cdb6@189.cn>
Date: Mon, 22 May 2023 17:05:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v14 1/2] drm: add kms driver for loongson display
 controller
Content-Language: en-US
To: WANG Xuerui <kernel@xen0n.name>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sui Jingfeng <suijingfeng@loongson.cn>, Li Yi <liyi@loongson.cn>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian Koenig <christian.koenig@amd.com>,
 Emil Velikov <emil.l.velikov@gmail.com>
References: <20230520105718.325819-1-15330273260@189.cn>
 <20230520105718.325819-2-15330273260@189.cn>
 <26fd78b9-c074-8341-c99c-4e3b38cd861a@xen0n.name>
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <26fd78b9-c074-8341-c99c-4e3b38cd861a@xen0n.name>
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
Cc: loongson-kernel@lists.loongnix.cn,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Nathan Chancellor <nathan@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>,
 linaro-mm-sig@lists.linaro.org, Liu Peibao <liupeibao@loongson.cn>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2023/5/21 20:21, WANG Xuerui wrote:
>> +++ b/drivers/gpu/drm/loongson/lsdc_debugfs.c
>> @@ -0,0 +1,91 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * Copyright (C) 2023 Loongson Technology Corporation Limited
>> + */
>> +
>> +#include <drm/drm_debugfs.h>
>> +
>> +#include "lsdc_benchmark.h"
>> +#include "lsdc_drv.h"
>> +#include "lsdc_gem.h"
>> +#include "lsdc_probe.h"
>> +#include "lsdc_ttm.h"
>> +
>> +/* device level debugfs */
>> +
>> +static int lsdc_identify(struct seq_file *m, void *arg)
>> +{
>> +    struct drm_info_node *node = (struct drm_info_node *)m->private;
>> +    struct lsdc_device *ldev = (struct lsdc_device 
>> *)node->info_ent->data;
>> +    const struct loongson_gfx_desc *gfx = to_loongson_gfx(ldev->descp);
>> +    u8 impl, rev;
>> +
>> +    loongson_cpu_get_prid(&impl, &rev);
>> +
>> +    seq_printf(m, "Running on cpu 0x%x, cpu revision: 0x%x\n",
>> +           impl, rev);
>
> Is this really needed/relevant for LSDC identification? AFAICS the 
> loongson_cpu_get_prid helper has only one use (that's here), 

Yes, this is really needed, when doing the remote debugging, sometime 
you only have a ssh login the target machine.

User of the driver could know what the host is in the DRM way.

> so if it's not absolutely necessary you can just get rid of that 
> function and lsdc_probe.h altogether.
This function it written for the future, It will not be removed.
>
>> +
>> +    seq_printf(m, "Contained in: %s\n", gfx->model);
>
> "model: " would be more appropriate for a piece of info looking like a 
> "gfx->model"?
No, these are nearly equivalent.
