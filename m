Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B03F44AF58C
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 16:41:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2026910E14B;
	Wed,  9 Feb 2022 15:41:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.103])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1169010E14B
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 15:41:12 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.41:55300.899968331
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.41])
 by 189.cn (HERMES) with SMTP id E409310020D;
 Wed,  9 Feb 2022 23:41:08 +0800 (CST)
Received: from  ([172.27.8.53])
 by gateway-151646-dep-b7fbf7d79-9vctg with ESMTP id
 9a8476fe4b9e405690dea299605a0bea for maxime@cerno.tech; 
 Wed, 09 Feb 2022 23:41:09 CST
X-Transaction-ID: 9a8476fe4b9e405690dea299605a0bea
X-Real-From: 15330273260@189.cn
X-Receive-IP: 172.27.8.53
X-MEDUSA-Status: 0
Message-ID: <def50622-fe08-01f7-83bd-e6e0bc39fe1b@189.cn>
Date: Wed, 9 Feb 2022 23:41:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 1/3] drm/lsdc: add drm driver for loongson display
 controller
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>
References: <20220203082546.3099-1-15330273260@189.cn>
 <20220203082546.3099-2-15330273260@189.cn>
 <20220203085851.yqstkfgt4dz7rcnw@houat>
 <f5381561-25da-61e3-5025-fa6dd61dd730@189.cn>
 <20220209084331.fpq5ng3yuqxmby4q@houat>
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <20220209084331.fpq5ng3yuqxmby4q@houat>
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
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 suijingfeng <suijingfeng@loongson.cn>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Randy Dunlap <rdunlap@infradead.org>,
 Roland Scheidegger <sroland@vmware.com>, linux-mips@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 Rob Herring <robh+dt@kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2022/2/9 16:43, Maxime Ripard wrote:
> On Fri, Feb 04, 2022 at 12:29:39AM +0800, Sui Jingfeng wrote:
>>>> +static int lsdc_modeset = 1;
>>>> +MODULE_PARM_DESC(modeset, "Enable/disable CMA-based KMS(1 = enabled(default), 0 = disabled)");
>>>> +module_param_named(modeset, lsdc_modeset, int, 0644);
>>>> +
>>>> +static int lsdc_cached_coherent = 1;
>>>> +MODULE_PARM_DESC(cached_coherent, "uss cached coherent mapping(1 = enabled(default), 0 = disabled)");
>>>> +module_param_named(cached_coherent, lsdc_cached_coherent, int, 0644);
>>>> +
>>>> +static int lsdc_dirty_update = -1;
>>>> +MODULE_PARM_DESC(dirty_update, "enable dirty update(1 = enabled, 0 = disabled(default))");
>>>> +module_param_named(dirty_update, lsdc_dirty_update, int, 0644);
>>>> +
>>>> +static int lsdc_use_vram_helper = -1;
>>>> +MODULE_PARM_DESC(use_vram_helper, "use vram helper based solution(1 = enabled, 0 = disabled(default))");
>>>> +module_param_named(use_vram_helper, lsdc_use_vram_helper, int, 0644);
>>>> +
>>>> +static int lsdc_verbose = -1;
>>>> +MODULE_PARM_DESC(verbose, "Enable/disable print some key information");
>>>> +module_param_named(verbose, lsdc_verbose, int, 0644);
>>> It's not really clear to me why you need any of those parameters. Why
>>> would a user want to use a non coherent mapping for example?
>>>
>> Because we are Mips architecture. Paul Cercueil already explained it
>> in his mmap GEM buffers cachedpatch  <https://lkml.kernel.org/lkml/20200822164233.71583-1-paul@crapouillou.net/T/>. I drag part of it to here for
>> convenient to reading:
>>
>> /Traditionally, GEM buffers are mapped write-combine. Writes to the buffer
>> are accelerated, and reads are slow. Application doing lots////of
>> alpha-blending paint inside shadow buffers, which is then memcpy'd////into
>> the final GEM buffer.///
>> "non coherent mapping" is actually cached and it is for CMA helpers
>> base driver, not for VRAM helper based driver. For Loongson CPU/SoCs.
>> The cache coherency is maintained by hardware, therefore there no
>> need to worry about coherency problems. This is true at least for
>> ls3a3000, ls3a4000 and ls3a5000.
>>
>> "non coherent" or "coherent" is not important here, the key point is
>> that the backing memory of the framebuffer is cached with non coherent
>> mapping, you don't need a shadow buffer layer when using X server's
>> modesetting driver.
>>
>> Read and write to the framebuffer in system memory is much faster than
>> read and write to the framebuffer in the VRAM.
>>
>> Why CMA helper based solution is faster than the VRAM based solution on Mips platform?
>>
>> Partly because of the CPU have L1, L2 and L3 cache, especially L3 cache
>> is as large as 8MB, read and write from the cache is fast.
>>
>> Another reason is as Paul Cercueil said, read from VRAM with write-combine
>> cache mode is slow. it is just uncache read.
>> Please note that we don't have a GPU here, we are just a display controller.
>>
>> For the VRAM helper based driver case, the backing memory of the framebuffer
>> is located at VRAM, When using X server's modesetting driver, we have to enable
>> the ShadowFB option, Uncache acceleration support(at the kernel size) should
>> also be enabled. Otherwise the performance of graphic application is just slow.
>>
>> Beside write-combine cache mode have bugs on our platform, a kernel side
>> developer have disabled it. Write-combine cache mode just boil down to uncached
>> now. See [1] and [2]
>>
>> [1]https://lkml.org/lkml/2020/8/10/255
>> [2]https://lkml.kernel.org/lkml/1617701112-14007-1-git-send-email-yangtiezhu@loongson.cn/T/
>>
>> This is the reason why we prefer CMA helper base solution with non coherent mapping,
>> simply because it is fast.
>>
>> As far as I know, Loongson's CPU does not has the concept of write-combine,
>> it only support three caching mode:  uncached, cached and uncache acceleration.
>> write-combine is implemented with uncache acceleration on Mips.
> My point wasn't just about the VRAM vs CMA stuff, it was about why do
> you need all those switches in the first place?
>
> Take the verbose parameter for example: it's entirely redundant with the
> already existing, documented, DRM logging infrastructure.

Yes, verbose is redundant, we will use drm_dbg() instead of verbose.  
thanks.

I am correcting.

> Then, you have "modeset", and I'm not sure why it's supposed to be
> there, at all. This is a modesetting driver, why would I want to disable
> modesetting entirely?

Something you want fbdev driver, for example simple-framebuffer driver which
using the firmware passed fb (screeninfo).

besides, text mode support.

> More fundamentally (and this extends to the CMA, caching and VRAM stuff
> you explained above), why can't the driver pick the right decision all
> the time and why would that be under the user control?

The right decision for ls7a1000 is to use VRAM based helper, But sometimes
we need CMA helper based solution. Because: The PRIME support is lost, use
lsdc with etnaviv is not possible any more.

  Buffer sharing with etnaviv is no longer possible, loongson display controllers
  are simple which require scanout buffers to be physically contiguous.

  We still need to develop userspace driver(say xf86-video-loongson)
  on ls3a4000 + ls7a1000 platform then deploy those driver to ls2k1000 platform.

  ls3a4000 and ls3a5000 is fast enough which can build the linux kernel directly.
  Build mesa, libdrm, xf86-video-loongson just a piece of cake.

  Is is so fast on ls3a5000+ls7a1000, developing driver on ls2k1000 is cumbersome,
  embarrassing slow.

  I means it(ls3a4000/ls3a5000 + ls7a1000) is not just target for end user, but
  it is a platform which can be used to develop software for other platform.

  The author of linux device driver told us that device driver is providing mechanism, not policy.

  We are able to make the decision, but we want to give the user more choice.

  "pick the right decision all the time" is also true, i am considering correct this,
  thanks.

> You were mentioning that you need to work-around MIPS memory management.
> Then fine, just do that on MIPS, and don't it on the other architectures
> that don't need it. There's no need for a knob.
>
> Maxime
