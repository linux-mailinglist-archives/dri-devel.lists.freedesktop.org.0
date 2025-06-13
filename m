Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BAC9AD835D
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 08:47:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF65010E2A1;
	Fri, 13 Jun 2025 06:47:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NrUHLguj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8713010E2A1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 06:47:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A3CFE629E6;
 Fri, 13 Jun 2025 06:47:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A86CEC4CEE3;
 Fri, 13 Jun 2025 06:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749797256;
 bh=HuUgwK5ImF1vg2CKRBQ6CVk1qKYD47pCh05L6gSjH78=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=NrUHLgujyc87I3zciHnIcIQSmMP6OXDum4NXDEpZ0JOgJZhANVmDmGA3xC1qyn2cF
 fwYW5usQIoAKSm84HsX2lCCX11q8D4r19rDvbHDNyqylfndVyLPDJ2wimEsQ8XTXqd
 ZPfANjAoPMqkFukTZ8XfNcYkhuwLgCnazQq88PPN6hByXPGIY3N8mQZcRoItZ8HaxR
 64zn+d1vLtclHCKqf7bDVx9HuDeoxSGdJVDn3YEaJGkOQhlsplv0NKMhgarXi5d3Sq
 UmIFIc3v8+gfxROP577S8y+o/F+WxSyyZWH/dU9hyCWUlizkpZr56fNK9bRJBSgUoc
 3tebBdrPJNcGQ==
Message-ID: <dc47d638-121d-4eee-ada9-481e13a6a642@kernel.org>
Date: Fri, 13 Jun 2025 08:47:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/8] drm/imagination: Use pwrseq for TH1520 GPU power
 management
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Matt Coster <matt.coster@imgtec.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>, Drew Fustini <drew@pdp7.com>,
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Frank Binns
 <frank.binns@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Ulf Hansson <ulf.hansson@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20250530-apr_14_for_sending-v3-0-83d5744d997c@samsung.com>
 <CGME20250529222405eucas1p18ed1254bf1b2d78468734656fec537e1@eucas1p1.samsung.com>
 <20250530-apr_14_for_sending-v3-3-83d5744d997c@samsung.com>
 <20250603-whispering-jaybird-of-thunder-f87867@kuoka>
 <d42a8c49-7ad2-49ef-bd9c-1e3d9981b58e@samsung.com>
 <e5a0bee2-ff74-47cf-ad2c-0c78b57ae6cf@kernel.org>
 <a6a29e58-8613-47f0-9e5c-d125da7ddb49@samsung.com>
 <cc4dbf7c-e023-403c-88be-4691f97a0ff0@kernel.org>
 <c7774790-07c3-469d-a994-9e84108ad21d@samsung.com>
 <CAMRc=Mexq9ThfG6jZUbs3wYDA9UZN-+pHnX_Y-7WO4ubXvEuCw@mail.gmail.com>
 <ad6981eb-f53a-4a7b-90bd-2e2705bd0297@samsung.com>
 <CAMRc=Mfv9n3dioCz2ZAeoU=Q6tY+UxCiNV0wkmLHK36qKTTitQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <CAMRc=Mfv9n3dioCz2ZAeoU=Q6tY+UxCiNV0wkmLHK36qKTTitQ@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/06/2025 14:32, Bartosz Golaszewski wrote:
> On Wed, Jun 11, 2025 at 2:01 PM Michal Wilczynski
> <m.wilczynski@samsung.com> wrote:
>>
>>
>>
>> On 6/5/25 10:10, Bartosz Golaszewski wrote:
>>> On Thu, Jun 5, 2025 at 9:47 AM Michal Wilczynski
>>> <m.wilczynski@samsung.com> wrote:
>>>>
>>>>
>>>>
>>>> On 6/4/25 14:07, Krzysztof Kozlowski wrote:
>>>>> On 04/06/2025 13:53, Michal Wilczynski wrote:
>>>>>>>>
>>>>>>>> The GPU node will depend on the AON node, which will be the sole
>>>>>>>> provider for the 'gpu-power' sequencer (based on the discussion in patch
>>>>>>>> 1).
>>>>>>>>
>>>>>>>> Therefore, if the AON/pwrseq driver has already completed its probe, and
>>>>>>>> devm_pwrseq_get() in the GPU driver subsequently returns -EPROBE_DEFER
>>>>>>>> (because pwrseq_get found 'no match' on the bus for 'gpu-power'), the
>>>>>>>> interpretation is that the AON driver did not register this optional
>>>>>>>> sequencer. Since AON is the only anticipated source, it implies the
>>>>>>>> sequencer won't become available later from its designated provider.
>>>>>>>
>>>>>>> I don't understand why you made this assumption. AON could be a module
>>>>>>> and this driver built-in. AON will likely probe later.
>>>>>>
>>>>>> You're absolutely right that AON could be a module and would generally
>>>>>> probe later in that scenario. However, the GPU device also has a
>>>>>> 'power-domains = <&aon TH1520_GPU_PD>' dependency. If the AON driver (as
>>>>>> the PM domain provider) were a late probing module, the GPU driver's
>>>>>> probe would hit -EPROBE_DEFER when its power domain is requested
>>>>>> which happens before attempting to get other resources like a power
>>>>>> sequencer.
>>>>>
>>>>> Huh, so basically you imply certain hardware design and certain DTS
>>>>> description in your driver code. Well, that's clearly fragile design to
>>>>> me, because you should not rely how hardware properties are presented in
>>>>> DTS. Will work here on th1520 with this DTS, won't work with something else.
>>>>>
>>>>> Especially that this looks like generic Imagination GPU code, common to
>>>>> multiple devices, not TH1520 only specific.
>>>>>
>>>>>>
>>>>>> So, if the GPU driver's code does reach the devm_pwrseq_get(dev,
>>>>>> "gpu-power") call, it strongly implies the AON driver has already
>>>>>> successfully probed.
>>>>>>
>>>>>> This leads to the core challenge with the optional 'gpu-power'
>>>>>> sequencer: Even if the AON driver has already probed, if it then chooses
>>>>>> not to register the "gpu-power" sequence (because it's an optional
>>>>>> feature), pwrseq_get() will still find "no device matched" on the
>>>>>> pwrseq_bus and return EPROBE_DEFER.
>>>>>>
>>>>>> If the GPU driver defers here, as it normally should for -EPROBE_DEFER,
>>>>>> it could wait indefinitely for an optional sequence that its
>>>>>> already probed AON provider will not supply.
>>>>>>
>>>>>> Anyway I think you're right, that this is probably confusing and we
>>>>>> shouldn't rely on this behavior.
>>>>>>
>>>>>> To solve this, and to allow the GPU driver to correctly handle
>>>>>> -EPROBE_DEFER when a sequencer is genuinely expected, I propose using a
>>>>>> boolean property on the GPU's DT node, e.g.
>>>>>> img,gpu-expects-power-sequencer. If the GPU node provides this property
>>>>>> it means the pwrseq 'gpu-power' is required.
>>>>>
>>>>> No, that would be driver design in DTS.
>>>>>
>>>>> I think the main problem is the pwrseq API: you should get via phandle,
>>>>> not name of the pwrseq controller. That's how all producer-consumer
>>>>> relationships are done in OF platforms.
>>>>
>>>> Bart,
>>>> Given Krzysztof's valid concerns about the current name based
>>>> lookup in pwrseq_get() and the benefits of phandle based resource
>>>> linking in OF platforms: Would you be open to a proposal for extending
>>>> the pwrseq API to allow consumers to obtain a sequencer (or a specific
>>>> target sequence) via a phandle defined in their Device Tree node? For
>>>> instance, a consumer device could specify power-sequencer =
>>>> <&aon> and a new API variant could resolve this.
>>>>
>>>
>>> I can be open to it all I want, but I bet Krzysztof won't be open to
>>> introducing anything like a power-sequencer device property in DT
>>> bindings. Simply because there's no such thing in the physical world.
>>> The concept behind the power sequencing framework was to bind
>>> providers to consumers based on existing links modelling real device
>>> properties (which a "power-sequencer" is not). I commented on it under
>>> another email saying that you already have a link here - the
>>> power-domains property taking the aon phandle. In your pwrseq
>>> provider's match() callback you can parse and resolve it back to the
>>> aon node thus making sure you're matching the consumer with the
>>> correct provider.
>>>
>>> Please take a look at the existing wcn pwrseq driver which does a
>>> similar thing but parses the regulator properties of the power
>>> management unit (in the pwrseq_qcom_wcn_match() function).
>>>
>>> We've tried to do something like what you're proposing for years and
>>> it always got stuck on the fact that DT must not make up bogus
>>> properties only to satisfy the driver implementation. We've done it in
>>> the past, that's true, but just because we didn't know any better and
>>> DT maintainers are currently much stricter as to what kind of
>>> properties to allow.
>>
>> Hi Bartosz, Krzysztof, Matt
>>
>> Thanks for the detailed explanation. I understand and agree with your
>> point about using existing device tree links. The pwrseq framework's
>> design makes perfect sense, and matching via the power-domains property
>> is the right way forward for the provider.
>>
>> Just to clarify, my intention is to add the power-domains check to my
>> existing .match() function, which already validates the consumer's
>> compatible ("thead,th1520-gpu"). Combining these two checks will create
>> an even stronger, more specific match. I will proceed with this change.
>>
>> However, this leads me back to a fundamental issue with the
>> consumer side implementation in the generic pvr_device.c driver. The
>> current fallback code is:
>>
>> /*
>>  * If the error is -EPROBE_DEFER, it's because the
>>  * optional sequencer provider is not present
>>  * and it's safe to fall back on manual power-up.
>>  */
>> if (pwrseq_err == -EPROBE_DEFER)
>>         pvr_dev->pwrseq = NULL;
>>
>> As Krzysztof noted, simply ignoring -EPROBE_DEFER is not ideal. But if I
>> change this to a standard deferred probe, the pvr_device.c driver will
>> break on all other supported SoCs. It would wait indefinitely for a
>> pwrseq-thead-gpu provider that will never appear on those platforms.
>>
>> The core of the problem is that any solution within the provider's
>> .match() function cannot help here. On other SoCs, the
>> pwrseq-thead-gpu.c driver is not even compiled, so its .match() function
>> will never be executed. The generic consumer driver needs a way to know
>> whether it should even attempt to get a sequencer.
>>
>> This brings me back to the idea of a DT property, and I'd like to frame
>> it from a different perspective. A property like needs-power-sequencer
>> (perhaps vendor-prefixed as thead,needs-power-sequencer) isn't meant to
>> describe driver behavior, but rather to describe a physical integration
>> requirement of the hardware.
>>
>> For the TH1520, the SoC integrators made a design choice that mandates a
>> specific software driven power on sequence. On other supported SoCs, as
>> noted by the Imagination developers [1], this sequencing is handled by
>> the hardware itself. Describing this platform specific requirement this
>> hardware quirk in the DT seems to be the most accurate way to model the
>> physical reality.
>>
> 
> Krzysztof, this sounds a bit like the qcom,controlled-remotely and
> qcom,powered-remotely boolean properties we have for the BAM DMA nodes
> on Qualcomm platforms, doesn't it? They too, tell the driver to not
> enable certain resources as it's the TrustZone that will do it. Maybe
> it is a valid use-case for something more generic? And if not, then
> something like thead,hlos-controlled for this particular use-case.

Depends what "SoC integrators" mean. Following sentence suggests it is
about this given SoC, so it looks 100% purely compatible-deducible. You
have here something different for this one given hardware. That
something different is defined by compatible.

That's why every hardware binding MUST have specific compatible. Also
that's one of the reasons why we really dislike generic compatibles like
one used here, but it is a separate thing.

Best regards,
Krzysztof
