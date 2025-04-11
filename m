Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46374A85646
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 10:14:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7541910EB19;
	Fri, 11 Apr 2025 08:14:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="YmyTnQxC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 62458 seconds by postgrey-1.36 at gabe;
 Fri, 11 Apr 2025 08:14:20 UTC
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E32610EB19
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 08:14:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 34A0643137;
 Fri, 11 Apr 2025 08:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1744359258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=afHRpr9hNgOZHrTlQnPrI03bZg/5yASgV0Nawh6heQc=;
 b=YmyTnQxClkeT7De9n44GnKxNoLkwFEDh5p45ANDmyAHffwCLFlcg2OyaktuDMLzYA/S1Fp
 q21g1poX5kc5uUl9BSUEgQN0kqnKtm8i3/sMSMYMgR2Do8L6ZvnHyOzaYMIhN8YHB+dxb6
 ZDT5fNrMI01U26DTyL+UUTzmK4ag2nMdRnRlrQifOToA24lNb0W2gXV9DtR3/W5zpjGqrR
 31m2cc+ayXe6CoVgyllDN8TIzP+rPN3C+qCiJeNeETKGXQDyXBGJdhQBQNmF8F7aFhd09E
 K9fl0cPQPjmOJrWI59BEqkjwIa7Vx2hN2yxqu2wamSwkGk8JNNlG6B5wQJCWFQ==
Message-ID: <60e2d844-418a-4bde-b6ef-76d10448d5ec@bootlin.com>
Date: Fri, 11 Apr 2025 10:14:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] uio/dma-buf: Give UIO users access to DMA addresses.
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20250410-uio-dma-v1-0-6468ace2c786@bootlin.com>
 <09a5beeb-bae3-4a00-9aff-66adf68064e6@amd.com>
 <20250410214307.361e373f@windsurf>
 <b596c9af-c0e3-4557-b45a-462a33179235@amd.com>
From: Bastien Curutchet <bastien.curutchet@bootlin.com>
Content-Language: en-US
In-Reply-To: <b596c9af-c0e3-4557-b45a-462a33179235@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvuddufedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomhepuegrshhtihgvnhcuvehurhhuthgthhgvthcuoegsrghsthhivghnrdgtuhhruhhttghhvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeefffeufeektdeugffgteeiffevgfdvieegueelieekteegfeelkeelheetfeevueenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludelvddrudeikedrtddrudegngdpmhgrihhlfhhrohhmpegsrghsthhivghnrdgtuhhruhhttghhvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeekpdhrtghpthhtoheptghhrhhishhtihgrnhdrkhhovghnihhgsegrmhgurdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepshhumhhithdrshgvmhifrghlsehlihhnrghrohdrohhrghdprhgtphhtthhopehgrhgvghhkhhesl
 hhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopehlihhnrghrohdqmhhmqdhsihhgsehlihhsthhsrdhlihhnrghrohdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: bastien.curutchet@bootlin.com
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

Hi Christian,

On 4/11/25 9:30 AM, Christian König wrote:
> Hi Thomas,
> 
> Am 10.04.25 um 21:43 schrieb Thomas Petazzoni:
>> Hello Christian,
>>
>> Thanks for your feedback!
>>
>> On Thu, 10 Apr 2025 18:29:12 +0200
>> Christian König<christian.koenig@amd.com> wrote:
>>
>>>> Many UIO users performing DMA from their UIO device need to access the
>>>> DMA addresses of the allocated buffers. There are out-of-tree drivers
>>>> that allow to do it but nothing in the mainline.
>>> Well that basically disqualifies this patch set in the first paragraph.
>>>
>>> To justify some kernel change we always need an in kernel user of the
>>> interface, since this is purely for out-of-tree drivers this is a
>>> no-go to begin with.
>> I'm not sure to understand your comment here. This patch series is
>> about extending the UIO interface... which is a user-space interface.
>> So obviously it has no "in-kernel user" because it's meant to be used
>> from user-space. Could you clarify what you meant here?
> 
> Bastien wrote about "out-of-tree drivers" which is something the 
> upstream kernel explicitly does not support.
> 

Sorry maybe it wasn't clear, but what I meant is that the goal of this 
series is to replace 'out-of-tree drivers' with something upstream.

> When you make that UIO API and have an open source userspace driver then 
> that is probably a good justification to do this.
> 
> What the kernel community tries to prevent here is that people start 
> using the UAPI to write closed source drivers in userspace.
> 

>>> What you could potentially do is to create an UIO driver which
>>> imports DMA-bufs, pins them and then provide the DMA addresses to
>>> userspace.
>>>
>>> But please be aware that DMA-fences are fundamentally incompatible
>>> with UIO. So you won't be able to do any form of synchronization
>>> which probably makes the implementation pretty limited.
>> Could you clarify why DMA-fences would be needed here, and for what
>> synchronization?
> 
> In general DMA-buf is an interface which enables you do share device 
> specific buffers between different drivers as well as between userspace 
> processes.
> 
> For this to work with for example cameras, GPUs or RDMA NICs you need to 
> some kind of synchronization primitive, e.g. device A can only starts 
> it's DMA transaction when device B has completed his.
> 
> The problem is that this synchronization approach is fundamentally 
> incompatible with UIO. See here for more details: https:// 
> www.kernel.org/doc/html/latest/driver-api/dma-buf.html#indefinite-dma-fences
>
>> The DMA buffers allocated here are DMA coherent buffers. So the
>> user-space application that uses UIO will allocate such buffers once at
>> application start, retrieve their DMA address, and then program DMA
>> transfers as it sees fit using the memory-mapped registers accessible
>> through UIO. I'm not sure which synchronization you are referring to.
>> We are not "chaining" DMA transfers, with for example a camera
>> interface feeding its DMA buffers to an ISP or something like that. The
>> typical use case here is some IP block in an FPGA that does DMA
>> transfers to transfer data to/from some sort of specialized I/O
>> interface. We get an interrupt when the transfer is done, and we can
>> re-use the buffer for the next transfer.
> 
> Well why do you then want to use DMA-buf in the first place? As far as I 
> know what you describe can perfectly be done with the normal UIO memory 
> management interfaces.
> 
> DMA-buf is only interesting when you actually want to share something in 
> between devices or between applications.
>

I wanted to use DMA-buf because it allows to dynamically 
allocate/release coherent buffers from userspace. UIO doesn't provide 
such interface.
I'm aware that exposing DMA addresses to userspace isn't a good 
practice. That's why this series create a new heap specific to UIO that 
will be the only one implementing the new ioctl.


Best regards,
Bastien



