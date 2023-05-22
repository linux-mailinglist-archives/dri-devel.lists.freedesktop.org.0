Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2EA70D6E3
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 10:14:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5AF310E405;
	Tue, 23 May 2023 08:14:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 413F410E26A
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 08:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
 t=1684742981; bh=aA1E0+xC/rAqJLb6Jh39PUGRSeGXjVPeIfHkIASardM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=GxNeYl2P1gnfXOcmwOovlg6H5jfccMv55Mlm6Y1G/Rj7o8toa/nDZIs4swTV43Y/g
 cYAQYTAiQC8X1nkbWT/3/uxkWcBz6G3UGpjOeCmxYqh4KFeY8+HF2/fWbWnREobchl
 iWk2z7ftTFn2LgWhH9gRfUSEFmawzGMG7bpz2kuc=
Received: from [100.100.57.122] (unknown [58.34.185.106])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 7DFEA600DA;
 Mon, 22 May 2023 16:09:40 +0800 (CST)
Message-ID: <97fe7af2-0a93-3f28-db6e-40a9b0798d49@xen0n.name>
Date: Mon, 22 May 2023 16:09:39 +0800
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
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <73447e35-f4df-9871-6210-b7bf1a3f04fc@189.cn>
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

On 2023/5/22 16:02, Sui Jingfeng wrote:
> Hi,
> 
> On 2023/5/21 20:21, WANG Xuerui wrote:
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/loongson/Kconfig
>>> @@ -0,0 +1,17 @@
>>> +# SPDX-License-Identifier: GPL-2.0
>>> +
>>> +config DRM_LOONGSON
>>> +    tristate "DRM support for Loongson Graphics"
>>> +    depends on DRM && PCI && MMU
>>> +    select DRM_KMS_HELPER
>>> +    select DRM_TTM
>>> +    select I2C
>>> +    select I2C_ALGOBIT
>>> +    help
>>> +      This is a DRM driver for Loongson Graphics, it may including
>>
>> Drop "it may"; "including" should be enough.
>>
> 'it may' is more *precise* here, because currently we don't ship with 
> the support for loongson 2K series SoC.
> 
> I'm try to be precise as far as I can, we avoid made this driver too 
> large by ignore loongson 2K series SoC temporary.

That's a good idea! For now the patch is so large that my review reply 
is said to be dropped by the lists. Focusing on one bunch of similar 
models first then adding support for the rest not-so-similar models is 
very friendly towards the reviewing process and will help code quality too.

> 
>>> +      LS7A2000, LS7A1000, LS2K2000 and LS2K1000 etc. Loongson LS7A
>>> +      series are bridge chipset, while Loongson LS2K series are SoC.
>>> +
>>> +      If "M" is selected, the module will be called loongson.
>>
>> Just "loongson"? 
> 
> Yes,  when compile this driver as module,  loongson.ko will be generated.
> 
>   drm radeon is also doing so, See drm/radeon/Kconfig.
> 
>> I know it's like this for ages (at least dating back to the MIPS days) 
>> but you really don't want to imply Loongson is mainly a GPU company. 
>> Something like "loongson_drm" or "lsdc" or "gsgpu" could be better. 
> 
> No, these name may have backward compatibility problems.
> 
> Downstream driver already taken those name.
> 
> userspace driver need to differentiate them who is who.

IMO this shouldn't be a problem. Let me try explaining this: currently, 
upstream / the "new world" doesn't have any support for this driver at 
all, so any name will work; just use whatever is appropriate from an 
upstream's perspective, then make the userspace bits recognize both 
variants, and you'll be fine. And the "existing" userspace drivers can 
also carry the change, it'll just be a branch never taken in that setup.

So, I'm still in favor of keeping the upstream "clean" without dubious 
names like this (bare "loongson"). What do you think about my suggestion 
above?

-- 
WANG "xen0n" Xuerui

Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/

