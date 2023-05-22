Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2534370BB42
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 13:12:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A1A710E2C3;
	Mon, 22 May 2023 11:11:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.102])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1219310E2C3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 11:11:54 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.43:43282.1768237263
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.43])
 by 189.cn (HERMES) with SMTP id 19A0A100249;
 Mon, 22 May 2023 19:11:49 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-75648544bd-7vx9t with ESMTP id
 7e6dec763f794de7a956c82faf1763ee for kernel@xen0n.name; 
 Mon, 22 May 2023 19:11:51 CST
X-Transaction-ID: 7e6dec763f794de7a956c82faf1763ee
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <6ff9a210-9d31-d0b0-f282-7640e95aac5e@189.cn>
Date: Mon, 22 May 2023 19:11:48 +0800
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
 Li Yi <liyi@loongson.cn>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian Koenig <christian.koenig@amd.com>,
 Emil Velikov <emil.l.velikov@gmail.com>
References: <20230520105718.325819-1-15330273260@189.cn>
 <20230520105718.325819-2-15330273260@189.cn>
 <26fd78b9-c074-8341-c99c-4e3b38cd861a@xen0n.name>
 <e7f911cc-6588-bc0f-8e1e-759260f5187a@189.cn>
 <ed795dc0-823a-f3d8-9e70-1cf33c0de7f0@xen0n.name>
 <ac2fde55-c770-fbb5-844d-50fb38dd90be@189.cn>
 <331e7baa-a83b-b0c9-37f7-0e8e39187df4@xen0n.name>
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <331e7baa-a83b-b0c9-37f7-0e8e39187df4@xen0n.name>
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

On 2023/5/22 18:05, WANG Xuerui wrote:
> On 2023/5/22 17:49, Sui Jingfeng wrote:
>> Hi,
>>
>> On 2023/5/22 17:28, WANG Xuerui wrote:
>>> On 2023/5/22 17:25, Sui Jingfeng wrote:
>>>> Hi,
>>>>
>>>> On 2023/5/21 20:21, WANG Xuerui wrote:
>>>>>> + * LS3A4000/LS3A5000/LS3A6000 CPU, they are equipped with 
>>>>>> on-board video RAM
>>>>>> + * typically. While LS2K0500/LS2K1000/LS2K2000 are low cost SoCs 
>>>>>> which share
>>>>>> + * the system RAM as video RAM, they don't has a dediacated VRAM.
>>>>>
>>>>> CPU models are not typically prefixed with "LS", so "Loongson 
>>>>> 3A4000/3A5000/3A6000".
>>>>>
>>>> Here is because when you do programming, variable name should 
>>>> prefix with letters.
>>>
>>> Commit messages, comments, and log messages etc. are natural 
>>> language, so it's better to treat them differently. No problem to 
>>> keep code as-is IMO.
>>>
>> Then you get two name for a single chip,  take  LS7A1000 as an example.
>>
>> You name it as Loongson 7A1000 in commit message,  and then you have 
>> to define another name in the code,  say LS7A1000.
>>
>> "Loongson 7A1000" is too long,  not as compact as LS7A1000.
>>
>> This also avoid bind the company name to a specific product, because 
>> a company can produce many product.
>
> Nah, the existing convention is "LS7Xxxxx" for bridges


But I see there are document[1] which named LS7A1000 bridge chip as 
Loongson 7A1000 Bridge,

See [1] for reference, who is wrong in this case?


[1] 
https://loongson.github.io/LoongArch-Documentation/Loongson-7A1000-usermanual-EN

