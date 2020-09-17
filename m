Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5917826D98B
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 12:51:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ABEF6EBA4;
	Thu, 17 Sep 2020 10:51:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD7196EBA4
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 10:51:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: tomeu) with ESMTPSA id 9287529BF49
Subject: Re: [PATCH 0/3] drm: panfrost: Coherency support
To: Steven Price <steven.price@arm.com>, Rob Herring <robh@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
References: <cover.1600213517.git.robin.murphy@arm.com>
 <d109e9da-feb3-c09f-2b7f-98c92ce39593@baylibre.com>
 <20200916170409.GA2543@kevin>
 <CAL_JsqLGO4YYPjQsjnzZCW5iT6n+keZw9G9mFALJip0nDo42Hw@mail.gmail.com>
 <d135f546-41aa-a6e2-52fe-7707d379c793@arm.com>
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Message-ID: <0518e067-3b9a-8fe3-619f-8fce4c6c9677@collabora.com>
Date: Thu, 17 Sep 2020 12:51:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d135f546-41aa-a6e2-52fe-7707d379c793@arm.com>
Content-Language: en-US
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Robin Murphy <robin.murphy@arm.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux IOMMU <iommu@lists.linux-foundation.org>,
 Kevin Hilman <khilman@baylibre.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Will Deacon <will@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/17/20 12:38 PM, Steven Price wrote:
> On 16/09/2020 18:46, Rob Herring wrote:
>> On Wed, Sep 16, 2020 at 11:04 AM Alyssa Rosenzweig
>> <alyssa.rosenzweig@collabora.com> wrote:
>>>
>>>> So I get a performance regression with the dma-coherent approach, 
>>>> even if it's
>>>> clearly the cleaner.
>>>
>>> That's bizarre -- this should really be the faster of the two.
>>
>> Coherency may not be free. CortexA9 had something like 4x slower
>> memcpy if SMP was enabled as an example. I don't know if there's
>> anything going on like that specifically here. If there's never any
>> CPU accesses mixed in with kmscube, then there would be no benefit to
>> coherency.
> 
> The DDK blob has the ability to mark only certain areas of memory as 
> coherent for performance reasons. For simple things like kmscube I would 
> expect that it's basically write-only from the CPU and almost all memory 
> the GPU touches isn't touched by the CPU. I.e. coherency isn't helping 
> and the coherency traffic is probably expensive. Whether the complexity 
> is worth it for "real" content I don't know - it may just be silly 
> benchmarks that benefit.

Or maybe it's only a problem for applications that do silly things? I 
don't think kmscube was ever optimized for performance.

Regards,

Tomeu
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
