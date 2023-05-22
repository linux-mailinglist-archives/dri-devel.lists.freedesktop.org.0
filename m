Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0527770D6DD
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 10:14:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 183E410E3F2;
	Tue, 23 May 2023 08:14:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7FBB10E278
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 08:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
 t=1684744962; bh=KpoRxSTMXjvQHeAOX030xl1ELhy5opCOdNVTtUGkJz8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=gHuZb871pYewey0RthFhrNb0TNW+AwaRzsYWELrrrX5sW4hIvUxU+RutrBtK4JaZc
 jaq1DKg24eRm7w/Lmxd+VZL9/ZDHRAuUU4pp1CFwKwglnfbQrGom2lDl4se54en8Nb
 e1VUET/KsQqei8wgwRwItcjUI++Bfpb1FL160rrI=
Received: from [100.100.57.122] (unknown [58.34.185.106])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id B9D32600DA;
 Mon, 22 May 2023 16:42:41 +0800 (CST)
Message-ID: <9075974f-d130-6398-b7df-7f2e67caedb0@xen0n.name>
Date: Mon, 22 May 2023 16:42:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH v14 1/2] drm: add kms driver for loongson display
 controller
Content-Language: en-US
To: Sui Jingfeng <15330273260@189.cn>,
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
 <73447e35-f4df-9871-6210-b7bf1a3f04fc@189.cn>
 <97fe7af2-0a93-3f28-db6e-40a9b0798d49@xen0n.name>
 <d8e7a1ee-317c-6b44-27eb-ea637f8813ec@189.cn>
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <d8e7a1ee-317c-6b44-27eb-ea637f8813ec@189.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 23 May 2023 08:13:57 +0000
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

On 2023/5/22 16:29, Sui Jingfeng wrote:
> 
> On 2023/5/22 16:09, WANG Xuerui wrote:
>> On 2023/5/22 16:02, Sui Jingfeng wrote:
>>> Hi,
>>>
>>> On 2023/5/21 20:21, WANG Xuerui wrote:
>>>>> --- /dev/null
>>>>> +++ b/drivers/gpu/drm/loongson/Kconfig
>>>>> @@ -0,0 +1,17 @@
>>>>> +# SPDX-License-Identifier: GPL-2.0
>>>>> +
>>>>> +config DRM_LOONGSON
>>>>> +    tristate "DRM support for Loongson Graphics"
>>>>> +    depends on DRM && PCI && MMU
>>>>> +    select DRM_KMS_HELPER
>>>>> +    select DRM_TTM
>>>>> +    select I2C
>>>>> +    select I2C_ALGOBIT
>>>>> +    help
>>>>> +      This is a DRM driver for Loongson Graphics, it may including
>>>>> +      LS7A2000, LS7A1000, LS2K2000 and LS2K1000 etc. Loongson LS7A
>>>>> +      series are bridge chipset, while Loongson LS2K series are SoC.
>>>>> +
>>>>> +      If "M" is selected, the module will be called loongson.
>>>>
>>>> Just "loongson"? 
>>>
>>> Yes,  when compile this driver as module,  loongson.ko will be 
>>> generated.
>>>
>>>   drm radeon is also doing so, See drm/radeon/Kconfig.
>>>
>>>> I know it's like this for ages (at least dating back to the MIPS 
>>>> days) but you really don't want to imply Loongson is mainly a GPU 
>>>> company. Something like "loongson_drm" or "lsdc" or "gsgpu" could be 
>>>> better. 
>>>
>>> No, these name may have backward compatibility problems.
>>>
>>> Downstream driver already taken those name.
>>>
>>> userspace driver need to differentiate them who is who.
>>
>> IMO this shouldn't be a problem. Let me try explaining this: 
>> currently, upstream / the "new world" doesn't have any support for 
>> this driver at all, so any name will work; just use whatever is 
>> appropriate from an upstream's perspective, then make the userspace 
>> bits recognize both variants, and you'll be fine. And the "existing" 
>> userspace drivers can also carry the change, it'll just be a branch 
>> never taken in that setup.
>>
>> So, I'm still in favor of keeping the upstream "clean" without dubious 
>> names like this (bare "loongson"). What do you think about my 
>> suggestion above?
>>
> No,
> 
> there is a 'arm' folder in the drivers/gpu/drm/,  It doesn't say that 
> arm is a pure gpu company.
> 
> there is a 'ingenic' folder in the drivers/gpu/drm/, ingenic also have 
> their own custom CPUs.
> 
> there is a 'amd' folder in the drivers/gpu/drm/, these doesn't imply amd 
> is mainly a GPU company.
> 
> when a folder emerged in drm/, it stand for the GPU related part of this 
> company.

What you said is correct, but I'm referring to the module name, instead 
of the directory name. For example the AMD GPU driver is called 
"amdgpu", not "amd"; similarly, the Ingenic DRM driver is called 
"ingenic-drm", not "ingenic".

-- 
WANG "xen0n" Xuerui

Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/

