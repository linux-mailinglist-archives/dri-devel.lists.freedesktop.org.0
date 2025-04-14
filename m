Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FFCA88CE3
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 22:14:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03E7010E650;
	Mon, 14 Apr 2025 20:14:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="rdxPbLcW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDEAF10E650
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 20:14:03 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53EKDr7M2255205
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Apr 2025 15:13:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1744661633;
 bh=u4s325uvuTrWBpavXWq6UQUmHw42JVkD/r2Zx8Uy0G4=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=rdxPbLcWyTDIJ9phfExl7sbHI2mZmInXxPpoGj/wFsJkGVlvtRGloTMdtZxIBXrED
 7TELmyo9rNl8zsOJZBDwZhvqEeu0SIJRVV9jNqOvbbk9PLU9jZeuGLrJIyw5ATrZyM
 KOFq5+UyrUBsVdrOplbysZE/EGNZ9W6GdmLbrMMQ=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53EKDrWo107347
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 14 Apr 2025 15:13:53 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 14
 Apr 2025 15:13:52 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 14 Apr 2025 15:13:53 -0500
Received: from [10.249.42.149] ([10.249.42.149])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53EKDqaS030321;
 Mon, 14 Apr 2025 15:13:52 -0500
Message-ID: <4c77a566-d231-43f2-ada6-a81ec6b58237@ti.com>
Date: Mon, 14 Apr 2025 15:13:52 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] uio/dma-buf: Give UIO users access to DMA addresses.
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
CC: Christoph Hellwig <hch@infradead.org>, Bastien Curutchet
 <bastien.curutchet@bootlin.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <linux-kernel@vger.kernel.org>
References: <20250410-uio-dma-v1-0-6468ace2c786@bootlin.com>
 <Z_yjNgY3dVnA5OVz@infradead.org> <20250414102455.03331c0f@windsurf>
 <Z_zwZYBO5Txz6lDF@infradead.org> <20250414134831.20b04c77@windsurf>
 <8f55367e-45c0-4280-b1ed-7ce9160c1fad@ti.com>
 <20250414212125.4b3e6f33@windsurf>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250414212125.4b3e6f33@windsurf>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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

On 4/14/25 2:21 PM, Thomas Petazzoni wrote:
> Hello Andrew,
> 
> On Mon, 14 Apr 2025 12:08:44 -0500
> Andrew Davis <afd@ti.com> wrote:
> 
>> "UIO is a broken legacy mess, so let's add more broken things
>> to it as broken + broken => still broken, so no harm done", am I
>> getting that right?
> 
> Who says UIO is a "broken legacy mess"? Only you says so. I don't see
> any indication anywhere in the kernel tree suggesting that UIO is
> considered a broken legacy mess.
> 

I'm not saying that*, I'm pointing out your argument is that even
though what you are trying to do is broken and unsafe, it is okay to
do because it isn't any "more "broken and unsafe" than UIO already is."

*It is, but that is an argument to have outside of this thread :)

> Keep in mind that when you're running code as root, you can load a
> kernel module, which can do anything on the system security-wise. So
> letting UIO expose MMIO registers of devices to userspace applications
> running as root is not any worse than that.
> 

You can take your computer out back and shoot it too, but we shouldn't
encourage that either :) According to the original docs, UIO was created
to support "industrial I/O cards", think old one-off custom ISA cards by
vendors that had no intention of ever writing a proper driver and just
wanted to poke registers and wait on an IRQ.

IMHO we shouldn't be encouraging that, and trying to modernize UIO does just
that. It gives the impression that is how drivers should still be written.
If you setup your FPGA card to go blink an LED, sure UIO driver it is,
anything more complex, then writing a proper driver is the way to go.

>> If your FPGA IP can do DMA then you should not be using UIO in
>> the first place, see UIO docs:
>>
>>> Please note that UIO is not an universal driver interface. Devices that
>>> are already handled well by other kernel subsystems (like networking or
>>> serial or USB) are no candidates for an UIO driver.
>>
>> The DMA subsystem already handles DMA devices, so write a DMA driver.
> 
> My FPGA IP block is not a DMA controller that would fit the dmaengine
> kernel subsystem. It's a weird custom device that doesn't fit in any
> existing subsystem, and that happens to do "peripheral DMA" (i.e the IP
> block is DMA-capable itself, without relying on a separate DMA
> controller). So this (very valid) recommendation from the UIO
> documentation doesn't apply to my device.

Peripheral DMA is the much more common case, nothing new here. Could
you give a hint as to what this device does that doesn't fit *any*
current subsystem? Or are we talking a hypothetical device (which
for the sake of argument is a valid thing to say, I'm sure with an
FPGA card I could make something that doesn't fit any current
framework too). Just want to know if you are trying to solve a
specific issue or a generic issue here.

Andrew

> 
> Best regards,
> 
> Thomas
