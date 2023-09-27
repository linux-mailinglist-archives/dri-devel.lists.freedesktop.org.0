Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E76B7B07F6
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 17:18:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A62F610E074;
	Wed, 27 Sep 2023 15:18:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D23A410E074
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 15:18:02 +0000 (UTC)
Received: from [IPV6:2a01:e0a:120:3210:672:46bd:3ec7:6cdf] (unknown
 [IPv6:2a01:e0a:120:3210:672:46bd:3ec7:6cdf])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: benjamin.gaignard)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 01CC266072FA;
 Wed, 27 Sep 2023 16:18:00 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1695827881;
 bh=cZBkE6AW/WssOj4Sg/xEx/jkclNbZ+Y8K8ys56ebtZE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=nvQ+joYfwJYLudibSGOOzSGLGqZ+UOM4ouQwSmesmc4Rnn8MMjLisKOD74cHJrbNu
 Hdg+Rf8A8LUaI0W5eqotS0MAgkfIn5Qp4gUveDyLdym4xfy/LWWxhWqw4zZ4OiLh3z
 WbeER/mejIiJT6i33HVqeydwaHbS8FMoxV3q7qm7rxqGjXCCs4R5KRdzPfcoyO/A+j
 xGdDtHGikNoAQCRVO8YB6ebSzYlqvmXfGbfa1wOyVr7fNJEL1Ufk3eVVqz+pbfttwN
 0HyqihJMmzpZRvN3NvjmPtgAQDYMFA4+uWovXxx6T8wlJc6sGmwSBbKO1Eu/xBaMLI
 W49r7tGjgdx+w==
Message-ID: <3aaafe47-3733-a4d5-038d-a7e439309282@collabora.com>
Date: Wed, 27 Sep 2023 17:17:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 5/9] dma-buf: heaps: mtk_sec_heap: Initialise tee session
To: Joakim Bech <joakim.bech@linaro.org>, =?UTF-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?=
 <Yong.Wu@mediatek.com>
References: <20230911023038.30649-1-yong.wu@mediatek.com>
 <20230911023038.30649-6-yong.wu@mediatek.com>
 <d0373c02-9b22-661f-9930-ca720053c2a0@collabora.com>
 <a115a2a5d3ac218e6db65ccdb0a1876f9cfca02b.camel@mediatek.com>
 <d798b15b-6f35-96db-e3f7-5c0bcc5d46a2@collabora.com>
 <a4ecc2792f3a4d3159e34415be984ff7d5f5e263.camel@mediatek.com>
 <20230927134614.kp27moxdw72jiu4y@pop-os.localdomain>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <20230927134614.kp27moxdw72jiu4y@pop-os.localdomain>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 =?UTF-8?B?S3VvaG9uZyBXYW5nICjnjovlnIvptLsp?= <kuohong.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "jstultz@google.com" <jstultz@google.com>,
 "tjmercier@google.com" <tjmercier@google.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 =?UTF-8?B?SmlhbmppYW8gWmVuZyAo5pu+5YGl5aejKQ==?= <Jianjiao.Zeng@mediatek.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Le 27/09/2023 à 15:46, Joakim Bech a écrit :
> On Mon, Sep 25, 2023 at 12:49:50PM +0000, Yong Wu (吴勇) wrote:
>> On Tue, 2023-09-12 at 11:32 +0200, AngeloGioacchino Del Regno wrote:
>>> Il 12/09/23 08:17, Yong Wu (吴勇) ha scritto:
>>>> On Mon, 2023-09-11 at 11:29 +0200, AngeloGioacchino Del Regno
>>>> wrote:
>>>>> Il 11/09/23 04:30, Yong Wu ha scritto:
>>>>>> The TEE probe later than dma-buf heap, and PROBE_DEDER doesn't
>>>>>> work
>>>>>> here since this is not a platform driver, therefore initialise
>>>>>> the
>>>>>> TEE
>>>>>> context/session while we allocate the first secure buffer.
>>>>>>
>>>>>> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
>>>>>> ---
>>>>>>     drivers/dma-buf/heaps/mtk_secure_heap.c | 61
>>>>>> +++++++++++++++++++++++++
>>>>>>     1 file changed, 61 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/dma-buf/heaps/mtk_secure_heap.c
>>>>>> b/drivers/dma-
>>>>>> buf/heaps/mtk_secure_heap.c
>>>>>> index bbf1c8dce23e..e3da33a3d083 100644
>>>>>> --- a/drivers/dma-buf/heaps/mtk_secure_heap.c
>>>>>> +++ b/drivers/dma-buf/heaps/mtk_secure_heap.c
>>>>>> @@ -10,6 +10,12 @@
>>>>>>     #include <linux/err.h>
>>>>>>     #include <linux/module.h>
>>>>>>     #include <linux/slab.h>
>>>>>> +#include <linux/tee_drv.h>
>>>>>> +#include <linux/uuid.h>
>>>>>> +
>>>>>> +#define TZ_TA_MEM_UUID		"4477588a-8476-11e2-ad15-
>>>>>> e41f1390d676"
>>>>>> +
>>>>> Is this UUID the same for all SoCs and all TZ versions?
>>>> Yes. It is the same for all SoCs and all TZ versions currently.
>>>>
>>> That's good news!
>>>
>>> Is this UUID used in any userspace component? (example: Android
>>> HALs?)
>> No. Userspace never use it. If userspace would like to allocate this
>> secure buffer, it can achieve through the existing dmabuf IOCTL via
>> /dev/dma_heap/mtk_svp node.
>>
> In general I think as mentioned elsewhere in comments, that there isn't
> that much here that seems to be unique for MediaTek in this patch
> series, so I think it worth to see whether this whole patch set can be
> made more generic. Having said that, the UUID is always unique for a
> certain Trusted Application. So, it's not entirely true saying that the
> UUID is the same for all SoCs and all TrustZone versions. It might be
> true for a family of MediaTek devices and the TEE in use, but not
> generically.
>
> So, if we need to differentiate between different TA implementations,
> then we need different UUIDs. If it would be possible to make this patch
> set generic, then it sounds like a single UUID would be sufficient, but
> that would imply that all TA's supporting such a generic UUID would be
> implemented the same from an API point of view. Which also means that
> for example Trusted Application function ID's needs to be the same etc.
> Not impossible to achieve, but still not easy (different TEE follows
> different specifications) and it's not typically something we've done in
> the past.
>
> Unfortunately there is no standardized database of TA's describing what
> they implement and support.
>
> As an alternative, we could implement a query call in the TEE answering,
> "What UUID does your TA have that implements secure unmapped heap?".
> I.e., something that reminds of a lookup table. Then we wouldn't have to
> carry this in UAPI, DT or anywhere else.

Joakim does a TA could offer a generic API and hide the hardware specific
details (like kernel uAPI does for drivers) ?

Aside that question I wonder what are the needs to perform a 'secure' playback.
I have in mind 2 requirements:
- secure memory regions, which means configure the hardware to ensure that only
dedicated hardware blocks and read or write into it.
- set hardware blocks in secure modes so they access to secure memory.
Do you see something else ?

Regards,
Benjamin

>
