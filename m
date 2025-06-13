Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64226AD886A
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 11:49:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A85910E95B;
	Fri, 13 Jun 2025 09:49:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="KeXXtrQr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D6C110E95B
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 09:49:41 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20250613094940euoutp02249d3c201b48c5207087d7c412b85e6a~IkUTUQmvo1061010610euoutp02J
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 09:49:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20250613094940euoutp02249d3c201b48c5207087d7c412b85e6a~IkUTUQmvo1061010610euoutp02J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1749808180;
 bh=kh1WI/bcozY1n6lzmehL+B2GaHGpJodSvRw79/7fyDs=;
 h=Date:Subject:From:To:Cc:In-Reply-To:References:From;
 b=KeXXtrQrpOo9k9DvNiYd5/p0RN5OETv7UZnLk2u/rgXrUymIm52y9w85Yr7XC/g/t
 ol8m6jQ7WrEMV/OQwyzA/v6GLEdTz9UB5OCdWztyv53RRzBRZfI8K3/IbkePmcs9Ki
 WK165kGbRXZvrbmDLUIR30Nzoczywx3Q9x0rfURw=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20250613094939eucas1p223e7a49c4cdbbfbeb66f81b1c4d38a64~IkUS23hRn0145001450eucas1p26;
 Fri, 13 Jun 2025 09:49:39 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250613094938eusmtip1d772fb1eb26491c3a808b58eca12daed~IkURy2A162383923839eusmtip1j;
 Fri, 13 Jun 2025 09:49:38 +0000 (GMT)
Message-ID: <44090712-0635-47bf-b73d-d9b16ec446a4@samsung.com>
Date: Fri, 13 Jun 2025 11:49:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/8] drm/imagination: Use pwrseq for TH1520 GPU power
 management
From: Michal Wilczynski <m.wilczynski@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Matt Coster <matt.coster@imgtec.com>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei
 <wefu@redhat.com>, Rob Herring <robh@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Frank Binns
 <frank.binns@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Ulf Hansson <ulf.hansson@linaro.org>, Marek
 Szyprowski <m.szyprowski@samsung.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Language: en-US
In-Reply-To: <e5d3d3b3-7ada-476f-9558-328d3d316088@samsung.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20250613094939eucas1p223e7a49c4cdbbfbeb66f81b1c4d38a64
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250529222405eucas1p18ed1254bf1b2d78468734656fec537e1
X-EPHeader: CA
X-CMS-RootMailID: 20250529222405eucas1p18ed1254bf1b2d78468734656fec537e1
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
 <59cc6827-1602-402a-9279-96ad6285cff4@kernel.org>
 <e5d3d3b3-7ada-476f-9558-328d3d316088@samsung.com>
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



On 6/13/25 10:25, Michal Wilczynski wrote:
> 
> 
> On 6/13/25 08:44, Krzysztof Kozlowski wrote:
>> On 11/06/2025 14:01, Michal Wilczynski wrote:
>>>
>>> However, this leads me back to a fundamental issue with the
>>> consumer side implementation in the generic pvr_device.c driver. The
>>> current fallback code is:
>>>
>>> /*
>>>  * If the error is -EPROBE_DEFER, it's because the
>>>  * optional sequencer provider is not present
>>>  * and it's safe to fall back on manual power-up.
>>>  */
>>> if (pwrseq_err == -EPROBE_DEFER)
>>>         pvr_dev->pwrseq = NULL;
>>>
>>> As Krzysztof noted, simply ignoring -EPROBE_DEFER is not ideal. But if I
>>> change this to a standard deferred probe, the pvr_device.c driver will
>>
>> Why? You have specific compatible for executing such quirks only for
>> given platform.

I realized now that you may have meant the "thead,th1520-gpu" compatible,
not the "thead,th1520" SoC compatible.

In any case, the whole reason for using the pwrseq framework is to avoid
polluting the generic driver with SoC specific logic and instead offload
that responsibility to a pwrseq provider. Therefore, I can't simply add
a check like if (compatible == "thead,th1520-gpu") to the generic driver
to decide whether to get a power sequencer. This entire matching
responsibility was intended to be offloaded to the pwrseq framework.

> 
> This is due to how the pwrseq API works; it constructs a bus on which
> provider devices may appear at any time. With the current API, there is
> no way to express that a provider for a specific target will never
> appear. ('gpu-power' is the generic target name, and of course, more
> specific binding is handled in the provider's .match callback - based on
> the compatible and the node phandle like discussed previously).
> 
> For all other supported SoCs, no such provider will ever appear on the
> bus, and the current pwrseq API doesn't allow a generic consumer to know
> this.
> 
> However, your suggestion of handling this with a platform specific
> driver is a good path forward. It would still require a minimal addition
> to the pwrseq API to work. For example, a new SoC specific driver for
> "thead,th1520" could call a new function like
> pwrseq_enable_optional_target("gpu-power") during its probe. This would
> signal to the pwrseq core that this target is expected on the platform.
> Therefore, when the Imagination driver later calls pwrseq_get() on a
> TH1520, it would correctly result in either a match or a deferral.
> 
> On all other platforms, this optional target would not be enabled. The
> pwrseq_get() call would then immediately return -ENODEV instead of
> deferring, which solves the problem and allows the other supported SoCs
> to probe correctly.
> 
> I wonder whether Bartosz would be okay with such an addition.
> 
>>
>>> break on all other supported SoCs. It would wait indefinitely for a
>>> pwrseq-thead-gpu provider that will never appear on those platforms.
>>>
>>
>>
>>
>> Best regards,
>> Krzysztof
>>
> 
> Best regards,

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>
