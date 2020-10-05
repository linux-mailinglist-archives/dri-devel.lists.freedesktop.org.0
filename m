Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6834D2833CB
	for <lists+dri-devel@lfdr.de>; Mon,  5 Oct 2020 12:05:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28D1289B33;
	Mon,  5 Oct 2020 10:05:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5BE7689AB5
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Oct 2020 10:05:16 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7EB6F113E;
 Mon,  5 Oct 2020 03:05:15 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E23D73F66B;
 Mon,  5 Oct 2020 03:05:13 -0700 (PDT)
From: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH 3/3] arm64: dts: meson: Describe G12b GPU as coherent
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <cover.1600213517.git.robin.murphy@arm.com>
 <ba61c76654349d3dfcd14c1e24c5aed39ebe3cf7.1600213517.git.robin.murphy@arm.com>
 <e218b95e-39bc-e773-00fb-bcb5f1f835ea@baylibre.com>
 <20201005101517.020c411a@collabora.com>
 <21de320b-0c32-b15b-a97b-d9799cd5ca44@arm.com>
 <20201005103939.667b3f42@collabora.com>
Message-ID: <83bcecd6-f405-dae1-6bf9-fd1f44d74a00@arm.com>
Date: Mon, 5 Oct 2020 11:05:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201005103939.667b3f42@collabora.com>
Content-Language: en-GB
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
Cc: tomeu.vizoso@collabora.com, Neil Armstrong <narmstrong@baylibre.com>,
 Robin Murphy <robin.murphy@arm.com>, dri-devel@lists.freedesktop.org,
 iommu@lists.linux-foundation.org, alyssa.rosenzweig@collabora.com,
 linux-amlogic@lists.infradead.org, will@kernel.org,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05/10/2020 09:39, Boris Brezillon wrote:
> On Mon, 5 Oct 2020 09:34:06 +0100
> Steven Price <steven.price@arm.com> wrote:
> 
>> On 05/10/2020 09:15, Boris Brezillon wrote:
>>> Hi Robin, Neil,
>>>
>>> On Wed, 16 Sep 2020 10:26:43 +0200
>>> Neil Armstrong <narmstrong@baylibre.com> wrote:
>>>    
>>>> Hi Robin,
>>>>
>>>> On 16/09/2020 01:51, Robin Murphy wrote:
>>>>> According to a downstream commit I found in the Khadas vendor kernel,
>>>>> the GPU on G12b is wired up for ACE-lite, so (now that Panfrost knows
>>>>> how to handle this properly) we should describe it as such. Otherwise
>>>>> the mismatch leads to all manner of fun with mismatched attributes and
>>>>> inadvertently snooping stale data from caches, which would account for
>>>>> at least some of the brokenness observed on this platform.
>>>>>
>>>>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
>>>>> ---
>>>>>    arch/arm64/boot/dts/amlogic/meson-g12b.dtsi | 4 ++++
>>>>>    1 file changed, 4 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
>>>>> index 9b8548e5f6e5..ee8fcae9f9f0 100644
>>>>> --- a/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
>>>>> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
>>>>> @@ -135,3 +135,7 @@ map1 {
>>>>>    		};
>>>>>    	};
>>>>>    };
>>>>> +
>>>>> +&mali {
>>>>> +	dma-coherent;
>>>>> +};
>>>>>       
>>>>
>>>> Thanks a lot for digging, I'll run a test to confirm it fixes the issue !
>>>
>>> Sorry for the late reply. I triggered a dEQP run with this patch applied
>>> and I see a bunch of "panfrost ffe40000.gpu: matching BO is not heap type"
>>> errors (see below for a full backtrace). That doesn't seem to happen when
>>> we drop this dma-coherent property.
>>>
>>> [  690.945731] ------------[ cut here ]------------
>>> [  690.950003] panfrost ffe40000.gpu: matching BO is not heap type (GPU VA = 319a000)
>>> [  690.950051] WARNING: CPU: 0 PID: 120 at drivers/gpu/drm/panfrost/panfrost_mmu.c:465 panfrost_mmu_irq_handler_thread+0x47c/0x650
>>> [  690.968854] Modules linked in:
>>> [  690.971878] CPU: 0 PID: 120 Comm: irq/27-panfrost Tainted: G        W         5.9.0-rc5-02434-g7d8109ec5a42 #784
>>> [  690.981964] Hardware name: Khadas VIM3 (DT)
>>> [  690.986107] pstate: 60000005 (nZCv daif -PAN -UAO BTYPE=--)
>>> [  690.991627] pc : panfrost_mmu_irq_handler_thread+0x47c/0x650
>>> [  690.997232] lr : panfrost_mmu_irq_handler_thread+0x47c/0x650
>>> [  691.002836] sp : ffff800011bcbcd0
>>> [  691.006114] x29: ffff800011bcbcf0 x28: ffff0000f3fe3800
>>> [  691.011375] x27: ffff0000ceaf5350 x26: ffff0000ca5fc500
>>> [  691.016636] x25: ffff0000f32409c0 x24: 0000000000000001
>>> [  691.021897] x23: ffff0000f3240880 x22: ffff0000f3e3a800
>>> [  691.027159] x21: 0000000000000000 x20: 0000000000000000
>>> [  691.032420] x19: 0000000000010001 x18: 0000000000000020
>>> [  691.037681] x17: 0000000000000000 x16: 0000000000000000
>>> [  691.042942] x15: ffff0000f3fe3c70 x14: ffffffffffffffff
>>> [  691.048204] x13: ffff8000116c2428 x12: ffff8000116c2086
>>> [  691.053466] x11: ffff800011bcbcd0 x10: ffff800011bcbcd0
>>> [  691.058727] x9 : 00000000fffffffe x8 : 0000000000000000
>>> [  691.063988] x7 : 7420706165682074 x6 : ffff8000116c1816
>>> [  691.069249] x5 : 0000000000000000 x4 : 0000000000000000
>>> [  691.074510] x3 : 00000000ffffffff x2 : ffff8000e348c000
>>> [  691.079771] x1 : f1b91ff9af2df000 x0 : 0000000000000000
>>> [  691.085033] Call trace:
>>> [  691.087452]  panfrost_mmu_irq_handler_thread+0x47c/0x650
>>> [  691.092712]  irq_thread_fn+0x2c/0xa0
>>> [  691.096246]  irq_thread+0x184/0x208
>>> [  691.099699]  kthread+0x140/0x160
>>> [  691.102890]  ret_from_fork+0x10/0x34
>>> [  691.106424] ---[ end trace b5dd8c2dfada8236 ]---
>>>    
>>
>> It's quite possible this is caused by the GPU seeing a stale page table
>> entry, so perhaps coherency isn't working as well as it should...
>>
>> Do you get an "Unhandled Page fault" message after this?
> 
> Yep (see below).
> 
> --->8---
> 
[...]
> [  689.805864] panfrost ffe40000.gpu: Unhandled Page fault in AS0 at VA 0x0000000003146080
> [  689.805864] Reason: TODO
> [  689.805864] raw fault status: 0x10003C3
> [  689.805864] decoded fault status: SLAVE FAULT
> [  689.805864] exception type 0xC3: TRANSLATION_FAULT_LEVEL3
> [  689.805864] access type 0x3: WRITE
> [  689.805864] source id 0x100
> [  690.170419] panfrost ffe40000.gpu: gpu sched timeout, js=1, config=0x7300, status=0x8, head=0x3101100, tail=0x3101100, sched_job=000000004b442768
> [  690.770373] panfrost ffe40000.gpu: error powering up gpu shader
> [  690.945123] panfrost ffe40000.gpu: error powering up gpu shader
> [  690.945731] ------------[ cut here ]------------
> 

That's a write fault from level 3 of the page table triggered by shader
core 0 in a fragment job. So could be writing out the frame buffer.

It would be interesting to see if a patch like below would work round
it:

----8<----
diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index e8f7b11352d2..5144860afdea 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -460,9 +460,12 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
  
  	bo = bomapping->obj;
  	if (!bo->is_heap) {
-		dev_WARN(pfdev->dev, "matching BO is not heap type (GPU VA = %llx)",
+		dev_err(pfdev->dev, "matching BO is not heap type (GPU VA = %llx)",
  			 bomapping->mmnode.start << PAGE_SHIFT);
-		ret = -EINVAL;
+		/* Force a flush of the MMU to restart the transaction */
+		mmu_hw_do_operation(pfdev, bomapping->mmu, addr, 0,
+				    AS_COMMAND_FLUSH_MEM);
+		ret = 0;
  		goto err_bo;
  	}
  	WARN_ON(bomapping->mmu->as != as);
---8<---

That's obviously not the correct solution (the fault shouldn't occur),
but if flushing the GPU's caches and retrying works then we know it's
a coherency issue. You can also try backing off from the big hammer of
AS_COMMAND_FLUSH_MEM and trying AS_COMMAND_FLUSH_PT or
AS_COMMAND_UNLOCK.

Steve
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
