Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 427677103DC
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 06:09:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41BCF10E6BF;
	Thu, 25 May 2023 04:09:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.102])
 by gabe.freedesktop.org (Postfix) with ESMTP id 266DF10E6BF
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 04:09:28 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.31:40046.373704923
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.31])
 by 189.cn (HERMES) with SMTP id 39E3D100249;
 Thu, 25 May 2023 12:09:21 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-75648544bd-xp9j7 with ESMTP id
 c566e9566e63438fbeb66c42cff385ec for kernel@xen0n.name; 
 Thu, 25 May 2023 12:09:25 CST
X-Transaction-ID: c566e9566e63438fbeb66c42cff385ec
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <04ede1b1-9757-5181-eec7-658c1df0480e@189.cn>
Date: Thu, 25 May 2023 12:09:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v14 1/2] drm: add kms driver for loongson display
 controller
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
 <5ae49b7a-b8d2-a822-65bc-6a894d2b1b4e@189.cn>
 <0e5e4a4b-1426-ffae-e958-cf8f9aece166@xen0n.name>
 <69edaf49-359a-229c-c8b4-8aa3af622008@189.cn>
 <ece7821e-c4bb-f2b7-3b1d-dacc04729530@xen0n.name>
Content-Language: en-US
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <ece7821e-c4bb-f2b7-3b1d-dacc04729530@xen0n.name>
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

On 2023/5/23 00:40, WANG Xuerui wrote:
> On 5/22/23 21:13, Sui Jingfeng wrote:
>> Hi,
>>
>> On 2023/5/22 18:25, WANG Xuerui wrote:
>>> On 2023/5/22 18:17, Sui Jingfeng wrote:
>>>> Hi,
>>>>
>>>> On 2023/5/22 18:05, WANG Xuerui wrote:
>>>>> On 2023/5/22 17:49, Sui Jingfeng wrote:
>>>>>> Hi,
>>>>>>
>>>>>> On 2023/5/22 17:28, WANG Xuerui wrote:
>>>>>>> On 2023/5/22 17:25, Sui Jingfeng wrote:
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>> On 2023/5/21 20:21, WANG Xuerui wrote:
>>>>>>>>>> + * LS3A4000/LS3A5000/LS3A6000 CPU, they are equipped with 
>>>>>>>>>> on-board video RAM
>>>>>>>>>> + * typically. While LS2K0500/LS2K1000/LS2K2000 are low cost 
>>>>>>>>>> SoCs which share
>>>>>>>>>> + * the system RAM as video RAM, they don't has a dediacated 
>>>>>>>>>> VRAM.
>>>>>>>>>
>>>>>>>>> CPU models are not typically prefixed with "LS", so "Loongson 
>>>>>>>>> 3A4000/3A5000/3A6000".
>>>>>>>>>
>>>>>>>> Here is because when you do programming, variable name should 
>>>>>>>> prefix with letters.
>>>>>>>
>>>>>>> Commit messages, comments, and log messages etc. are natural 
>>>>>>> language, so it's better to treat them differently. No problem 
>>>>>>> to keep code as-is IMO.
>>>>>>>
>>>>>> Then you get two name for a single chip,  take  LS7A1000 as an 
>>>>>> example.
>>>>>>
>>>>>> You name it as Loongson 7A1000 in commit message,  and then you 
>>>>>> have to define another name in the code,  say LS7A1000.
>>>>>>
>>>>>> "Loongson 7A1000" is too long,  not as compact as LS7A1000.
>>>>>>
>>>>>> This also avoid bind the company name to a specific product, 
>>>>>> because a company can produce many product.
>>>>>
>>>>> Nah, the existing convention is "LS7Xxxxx" for bridges and 
>>>>> "Loongson 3Axxxx" for CPUs (SoCs like 2K fall under this category 
>>>>> too). It's better to stick with existing practice so it would be 
>>>>> familiar to long-time Loongson/LoongArch developers, but I 
>>>>> personally don't think it will hamper understanding if you feel 
>>>>> like doing otherwise.
>>>>>
>>>> Can you explain why it is better?
>>>>
>>>> is it that the already existing is better ?
>>>
>>> It's not about subjective perception of "better" or "worse", but 
>>> about tree-wide consistency, and about reducing any potential 
>>> confusion from newcomers. I remember Huacai once pointing out that 
>>> outsiders usually have a hard time remembering "1, 2, and 3 are 
>>> CPUs, some 2 are SoCs, 7 are bridge chips", and consistently 
>>> referring to the bridge chips throughout the tree as "LS7A" helped.
>>>
>>> In any case, for the sake of consistency, you can definitely refer 
>>> to the CPU models in natural language like "LS3Axxxx"; just make 
>>> sure to refactor for example every occurrence in arch/loongarch and 
>>> other parts of drivers/. That's a lot of churn, though, so I don't 
>>> expect such changes to get accepted, and that's why the tree-wide 
>>> consistency should be favored over the local one.
>>>
>> There are document[1] which named LS7A1000 bridge chip as Loongson 
>> 7A1000 Bridge,
>>
>> which is opposed to what you have said "the existing convention is 
>> LS7Xxxxx for bridges".
>>
>>
>> there are also plenty projects[2] which encode ls2k1000 as project 
>> name, which simply
>>
>> don't fall into the category as you have mentioned("Loongson 3Axxxx").
>>
>>
>> See [1][2] for reference, how to explain this phenomenon then?
>
> Turn down the flames a little bit, okay? ;-)
>
>
There is no flames, its just that it need sufficient discussion when 
started to contribute to community.

We want more rigorous toward to our patch.


We can't adopt irresponsible ideas, especially from someone who is 
reluctant to give a

reasonable rationale and refused to discussion.


Such changes could probably made a damage to Loongson company.

As it tend to introduce self-contradictory between the code and comment.

Especially when we introduce DT support, there is no write space in the 
middle the string is allowed.

and encode model information to the compatible string is an common practice.


While at it, I will take it into another consideration if there are more 
professional person who

is supporting your ideas and could take the responsibility for it.

Beside this, other reviews are still acceptable, thanks for the 
reasonable part.


