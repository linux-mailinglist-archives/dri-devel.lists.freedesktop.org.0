Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7637E70B73B
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 10:02:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65F8E10E268;
	Mon, 22 May 2023 08:02:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.103])
 by gabe.freedesktop.org (Postfix) with ESMTP id A928B10E268
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 08:02:39 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.43:58120.1490266714
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.43])
 by 189.cn (HERMES) with SMTP id 00AEA1002C4;
 Mon, 22 May 2023 16:02:34 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-75648544bd-7vx9t with ESMTP id
 1a4434578fbd45abb00625fc7c141694 for kernel@xen0n.name; 
 Mon, 22 May 2023 16:02:36 CST
X-Transaction-ID: 1a4434578fbd45abb00625fc7c141694
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <73447e35-f4df-9871-6210-b7bf1a3f04fc@189.cn>
Date: Mon, 22 May 2023 16:02:34 +0800
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
>> --- /dev/null
>> +++ b/drivers/gpu/drm/loongson/Kconfig
>> @@ -0,0 +1,17 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +
>> +config DRM_LOONGSON
>> +    tristate "DRM support for Loongson Graphics"
>> +    depends on DRM && PCI && MMU
>> +    select DRM_KMS_HELPER
>> +    select DRM_TTM
>> +    select I2C
>> +    select I2C_ALGOBIT
>> +    help
>> +      This is a DRM driver for Loongson Graphics, it may including
>
> Drop "it may"; "including" should be enough.
>
'it may' is more *precise* here, because currently we don't ship with 
the support for loongson 2K series SoC.

I'm try to be precise as far as I can, we avoid made this driver too 
large by ignore loongson 2K series SoC temporary.

>> +      LS7A2000, LS7A1000, LS2K2000 and LS2K1000 etc. Loongson LS7A
>> +      series are bridge chipset, while Loongson LS2K series are SoC.
>> +
>> +      If "M" is selected, the module will be called loongson.
>
> Just "loongson"? 

Yes,  when compile this driver as module,  loongson.ko will be generated.

  drm radeon is also doing so, See drm/radeon/Kconfig.

> I know it's like this for ages (at least dating back to the MIPS days) 
> but you really don't want to imply Loongson is mainly a GPU company. 
> Something like "loongson_drm" or "lsdc" or "gsgpu" could be better. 

No, these name may have backward compatibility problems.

Downstream driver already taken those name.

userspace driver need to differentiate them who is who.


