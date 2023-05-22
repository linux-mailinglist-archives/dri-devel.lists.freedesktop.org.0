Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AAE870B75A
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 10:14:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FEF210E26A;
	Mon, 22 May 2023 08:14:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.104])
 by gabe.freedesktop.org (Postfix) with ESMTP id C9FB110E26A
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 08:14:42 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.43:44024.345458232
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.43])
 by 189.cn (HERMES) with SMTP id C5A9F102946;
 Mon, 22 May 2023 16:14:39 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-75648544bd-7vx9t with ESMTP id
 007f8fdc7329415ea6894140ca1e23a5 for kernel@xen0n.name; 
 Mon, 22 May 2023 16:14:40 CST
X-Transaction-ID: 007f8fdc7329415ea6894140ca1e23a5
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <6957f8b7-5e37-889f-0b48-d2424b891392@189.cn>
Date: Mon, 22 May 2023 16:14:38 +0800
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
>> +
>> +      If in doubt, say "N".
>> diff --git a/drivers/gpu/drm/loongson/Makefile 
>> b/drivers/gpu/drm/loongson/Makefile
>> new file mode 100644
>> index 000000000000..9158816ece8e
>> --- /dev/null
>> +++ b/drivers/gpu/drm/loongson/Makefile
>> @@ -0,0 +1,20 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +
>> +loongson-y := \
>> +    lsdc_benchmark.o \
>> +    lsdc_crtc.o \
>> +    lsdc_debugfs.o \
>> +    lsdc_device.o \
>> +    lsdc_drv.o \
>> +    lsdc_gem.o \
>> +    lsdc_gfxpll.o \
>> +    lsdc_i2c.o \
>> +    lsdc_irq.o \
>> +    lsdc_output_7a1000.o \
>> +    lsdc_output_7a2000.o \
>> +    lsdc_plane.o \
>> +    lsdc_pixpll.o \
>> +    lsdc_probe.o \
>> +    lsdc_ttm.o
>> +
>> +obj-$(CONFIG_DRM_LOONGSON) += loongson.o
>> diff --git a/drivers/gpu/drm/loongson/lsdc_benchmark.c 
>> b/drivers/gpu/drm/loongson/lsdc_benchmark.c
>> new file mode 100644
>> index 000000000000..82961531d84c
>> --- /dev/null
>> +++ b/drivers/gpu/drm/loongson/lsdc_benchmark.c
>> @@ -0,0 +1,133 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>
> Is it GPL-2.0, GPL-2.0-only, or GPL-2.0+? Please make sure all license 
> IDs are consistent. 


I see drm/vkms is also writing the copyrights similar.

with "# SPDX-License-Identifier: GPL-2.0-only" in the Makefile,

while "// SPDX-License-Identifier: GPL-2.0+" in the C source file.

Sorry, I'm stupid, I can't figure out the difference between them.

Personally, I really don't care about this as along as checkpatch.pl 
don't complain.

I respect the maintainers of DRM, they didn't told me to change it.

I assume there is no problem.

