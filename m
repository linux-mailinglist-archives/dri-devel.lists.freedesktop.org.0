Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 190DE7F9E7E
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 12:24:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A94FB10E241;
	Mon, 27 Nov 2023 11:24:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18B0710E241
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 11:24:34 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20231127112432euoutp01eebbca4cbd4203a90f34588d0d80e15a~bdyIAY_er1944019440euoutp01r
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 11:24:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20231127112432euoutp01eebbca4cbd4203a90f34588d0d80e15a~bdyIAY_er1944019440euoutp01r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1701084272;
 bh=RGhhL7XXl0hEOVf83TtpufSve7Y/eXk4j3SDGa7Vcog=;
 h=Date:Subject:From:To:Cc:In-Reply-To:References:From;
 b=R+v8Fd1oFcKwPDC6zHd3t0YiokGd4hy/ymteKgdtsCalerrfV0XA6i7qUBQ/eLPO1
 NqaKeYHINqeVdAuBD/h/Jk4sIkWpeGML4d6n+WlJFwD0FBxOXw9iNBlQAs76qHubft
 WDE3pEth906QGZ4ATNVY5BLGOliv1X1r4ypVSJys=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20231127112431eucas1p2302dc6bfd4747a11a64a603149d12b27~bdyHpDUWL2065920659eucas1p2b;
 Mon, 27 Nov 2023 11:24:31 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 51.06.09814.F6C74656; Mon, 27
 Nov 2023 11:24:31 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20231127112431eucas1p2e5cfc376fc3d771cb23c50adc424ab1f~bdyHLuxpv2062420624eucas1p2b;
 Mon, 27 Nov 2023 11:24:31 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20231127112431eusmtrp2ea6b0ee7f72daa68de80cab944f51163~bdyHKO_tX0076800768eusmtrp2t;
 Mon, 27 Nov 2023 11:24:31 +0000 (GMT)
X-AuditID: cbfec7f4-727ff70000002656-fe-65647c6f63ea
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 04.8D.09146.F6C74656; Mon, 27
 Nov 2023 11:24:31 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20231127112430eusmtip25fcfd6652bdfe64de8db7bf2832183e1~bdyGN4nft1493714937eusmtip2H;
 Mon, 27 Nov 2023 11:24:30 +0000 (GMT)
Message-ID: <054f6a93-8911-40bb-b677-ccdfd27d132b@samsung.com>
Date: Mon, 27 Nov 2023 12:24:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panfrost: Really power off GPU cores in
 panfrost_gpu_power_off()
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, AngeloGioacchino
 Del Regno <angelogioacchino.delregno@collabora.com>, Boris Brezillon
 <boris.brezillon@collabora.com>
In-Reply-To: <37d373e1-8850-4ab2-8fdb-6b069e2d6976@samsung.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHKsWRmVeSWpSXmKPExsWy7djPc7r5NSmpBht2a1lcWilhcfrMKSaL
 K1/fs1lsPtfDarH39VZ2i8u75rBZzDi/j8mirXMZq0XjEaDsljcTWS1mtF1mdeD2WDNvDaPH
 7IaLLB477i5h9Ni0qpPN4861PWwe97uPM3lsPl3t8XmTXABHFJdNSmpOZllqkb5dAlfGtnkN
 rAULVCse7FzG2sD4TK6LkZNDQsBEYt+evexdjFwcQgIrGCU2P1/FDOF8YZTY/eMHVOYzo8SM
 FUcZuxg5wFru3nWGiC9nlGhsnMAG4XxklHg/YzMTSBGvgJ1E8+lakBUsAqoSN85uZAGxeQUE
 JU7OfAJmiwrIS9y/NYMdxBYWiJY4PuMaE4jNLCAucevJfDCbTcBQouttF9h8EYHNjBIzb21i
 AXGYBTqYJDb9WsYMsoxTwF7idHM9RLO8RPPW2cwQv03mlDjwOBbCdpGYce0NI4QtLPHq+BZ2
 CFtG4v9OkGVcQHY7o8SC3/ehnAmMEg3Pb0F1WEvcOfeLDWQZs4CmxPpd+hBhR4nuxi52SKjw
 Sdx4KwhxA5/EpG3TmSHCvBIdbUIQ1WoSs46vg1t78MIl5gmMSrOQgmUWkvdnIflmFsLeBYws
 qxjFU0uLc9NTi43yUsv1ihNzi0vz0vWS83M3MQKT2Ol/x7/sYFz+6qPeIUYmDsZDjBIczEoi
 vHofk1OFeFMSK6tSi/Lji0pzUosPMUpzsCiJ86qmyKcKCaQnlqRmp6YWpBbBZJk4OKUamDjY
 y57Ye6uznroUu3Kde3fvE5m5G5bHrP36VvGEtGfznR7P7RGZjxI5r639aRiwaHES541mPrbP
 i2/mRWgqitnPs/p+R4KVZ41m6tLSzXkSmuJNxVcUHxffc7rX11zE6KdT7Sa5xkF4+kVhtbiL
 J0/U6q7/aOsq6Njcvn/J+W2iD7bEflpV/fnY9rd2N+fyhr3N03v+wsbi92nXar3+gLbpIrOj
 53t0Zkuwn9UVF4+ZXmVSzRe+qP2s29rkDLWcq0ezNkW8vPG7aKPlpdrrvKEPunMS1Z7VPVjh
 cGnmeo7Zm7zDrf5ubGa6vXbL+rs/7+tUeyikdc1/zHV7ynH2ZSvfHVO8H76qun7WutXpEUos
 xRmJhlrMRcWJAOkOwPDRAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPIsWRmVeSWpSXmKPExsVy+t/xe7r5NSmpBq9aeS0urZSwOH3mFJPF
 la/v2Sw2n+thtdj7eiu7xeVdc9gsZpzfx2TR1rmM1aLxCFB2y5uJrBYz2i6zOnB7rJm3htFj
 dsNFFo8dd5cwemxa1cnmcefaHjaP+93HmTw2n672+LxJLoAjSs+mKL+0JFUhI7+4xFYp2tDC
 SM/Q0kLPyMRSz9DYPNbKyFRJ384mJTUnsyy1SN8uQS9j27wG1oIFqhUPdi5jbWB8JtfFyMEh
 IWAicfeucxcjF4eQwFJGiXv/HjF2MXICxWUkTk5rYIWwhSX+XOtiA7GFBN4zSjR/MQbp5RWw
 k2g+XQsSZhFQlbhxdiMLiM0rIChxcuYTMFtUQF7i/q0Z7CC2sEC0xPEZ15hAbGYBcYlbT+aD
 2WwChhJdb0HGc3GICGxmlDj38BMTiMMs0MEkcfbzZGaIxbtYJL58KARZzClgL3G6uR5ikJlE
 19YuRghbXqJ562zmCYxCs5DcMQvJvllIWmYhaVnAyLKKUSS1tDg3PbfYUK84Mbe4NC9dLzk/
 dxMjMGa3Hfu5eQfjvFcf9Q4xMnEwHmKU4GBWEuHV+5icKsSbklhZlVqUH19UmpNafIjRFBgY
 E5mlRJPzgUkjryTe0MzA1NDEzNLA1NLMWEmc17OgI1FIID2xJDU7NbUgtQimj4mDU6qBSU9g
 iX6bhL/KW88td4w6uRQWsp8punlnwUlxsyuX1169IF9WoWXMuONREOc7pW/qPJsN0n4Iz/t8
 6unro5dfznV1fip+x6Fv3fopFyMmpaV9fi73MORAxb+Mhetn356cYMvANMv73uP1IpM1zM8Z
 8J+1cFnhXGoZwuX2+5KhPDN3+d//3EqvHC5809R3me6Q0ia55JTJ9SJV439+6WG1K9Y8iGGo
 k2bhrEj9ZS6gfkKiy27fkrUhoY2CCdJHjvRt91xlcaUlpPF1Zvfp1GvCmRd2Vb4+rqDiEtRk
 7Ch/laFZ36+oxKZvu3B62AuJU3Jpj593HAtNrFgcqG19zVr8wrRcm0ebS7wOfLxzYmG3Ektx
 RqKhFnNRcSIAfcZa12IDAAA=
X-CMS-MailID: 20231127112431eucas1p2e5cfc376fc3d771cb23c50adc424ab1f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20231122092952eucas1p291af9a5570a05c67014f5c871c85e98c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20231122092952eucas1p291af9a5570a05c67014f5c871c85e98c
References: <20231102141507.73481-1-angelogioacchino.delregno@collabora.com>
 <7928524a-b581-483b-b1a1-6ffd719ce650@arm.com>
 <1c9838fb-7f2d-4752-b86a-95bcf504ac2f@linaro.org>
 <6b7a4669-7aef-41a7-8201-c2cfe401bc43@collabora.com>
 <20231121175531.085809f5@collabora.com>
 <d95259b8-10cf-4ded-866c-47cbd2a44f84@linaro.org>
 <4c73f67e-174c-497e-85a5-cb053ce657cb@collabora.com>
 <CGME20231122092952eucas1p291af9a5570a05c67014f5c871c85e98c@eucas1p2.samsung.com>
 <39e9514b-087c-42eb-8d0e-f75dc620e954@linaro.org>
 <37d373e1-8850-4ab2-8fdb-6b069e2d6976@samsung.com>
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
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, mripard@kernel.org,
 Steven Price <steven.price@arm.com>, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, wenst@chromium.org, kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24.11.2023 13:45, Marek Szyprowski wrote:
> On 22.11.2023 10:29, Krzysztof Kozlowski wrote:
>> On 22/11/2023 10:06, AngeloGioacchino Del Regno wrote:
>>>>>> Hey Krzysztof,
>>>>>>
>>>>>> This is interesting. It might be about the cores that are missing 
>>>>>> from the partial
>>>>>> core_mask raising interrupts, but an external abort on 
>>>>>> non-linefetch is strange to
>>>>>> see here.
>>>>> I've seen such external aborts in the past, and the fault type has
>>>>> often been misleading. It's unlikely to have anything to do with a
>>>> Yeah, often accessing device with power or clocks gated.
>>>>
>>> Except my commit does *not* gate SoC power, nor SoC clocks 🙂
>> It could be that something (like clocks or power supplies) was missing
>> on this board/SoC, which was not critical till your patch came.
>>
>>> What the "Really power off ..." commit does is to ask the GPU to 
>>> internally power
>>> off the shaders, tilers and L2, that's why I say that it is strange 
>>> to see that
>>> kind of abort.
>>>
>>> The GPU_INT_CLEAR GPU_INT_STAT, GPU_FAULT_STATUS and 
>>> GPU_FAULT_ADDRESS_{HI/LO}
>>> registers should still be accessible even with shaders, tilers and 
>>> cache OFF.
>>>
>>> Anyway, yes, synchronizing IRQs before calling the poweroff sequence 
>>> would also
>>> work, but that'd add up quite a bit of latency on the 
>>> runtime_suspend() call, so
>>> in this case I'd be more for avoiding to execute any register r/w in 
>>> the handler
>>> by either checking if the GPU is supposed to be OFF, or clearing 
>>> interrupts, which
>>> may not work if those are generated after the execution of the 
>>> poweroff function.
>>> Or we could simply disable the irq after power_off, but that'd be 
>>> hacky (as well).
>>>
>>>
>>> Let's see if asking to poweroff *everything* works:
>> Worked.
>
> Yes, I also got into this issue some time ago, but I didn't report it 
> because I also had some power supply related problems on my test farm 
> and everything was a bit unstable. I wasn't 100% sure that the 
> $subject patch is responsible for the observed issues. Now, after 
> fixing power supply, I confirm that the issue was revealed by the 
> $subject patch and above mentioned change fixes the problem. Feel free 
> to add:
>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>


I must revoke my tested-by tag for the above fix alone. Although it 
fixed the boot issue and system stability issue, it looks that there is 
still something missing and opening the panfrost dri device causes a 
system crash:

root@target:~# ./modetest -C
trying to open device 'i915'...failed
trying to open device 'amdgpu'...failed
trying to open device 'radeon'...failed
trying to open device 'nouveau'...failed
trying to open device 'vmwgfx'...failed
trying to open device 'omapdrm'...failed
trying to open device 'exynos'...done
root@target:~#

8<--- cut here ---
Unhandled fault: external abort on non-linefetch (0x1008) at 0xf0c6803c
[f0c6803c] *pgd=42d87811, *pte=11800653, *ppte=11800453
Internal error: : 1008 [#1] PREEMPT SMP ARM
Modules linked in: exynos_gsc s5p_mfc s5p_jpeg v4l2_mem2mem 
videobuf2_dma_contig videobuf2_memops videobuf2_v4l2 videobuf2_common 
videodev mc s5p_cec
CPU: 0 PID: 0 Comm: swapper/0 Not tainted 
6.7.0-rc2-next-20231127-00055-ge14abcb527d6 #7649
Hardware name: Samsung Exynos (Flattened Device Tree)
PC is at panfrost_gpu_irq_handler+0x18/0xfc
LR is at __handle_irq_event_percpu+0xcc/0x31c
...
Process swapper/0 (pid: 0, stack limit = 0x0e2875ff)
Stack: (0xc1301e48 to 0xc1302000)
...
  panfrost_gpu_irq_handler from __handle_irq_event_percpu+0xcc/0x31c
  __handle_irq_event_percpu from handle_irq_event+0x38/0x80
  handle_irq_event from handle_fasteoi_irq+0x9c/0x250
  handle_fasteoi_irq from generic_handle_domain_irq+0x24/0x34
  generic_handle_domain_irq from gic_handle_irq+0x88/0xa8
  gic_handle_irq from generic_handle_arch_irq+0x34/0x44
  generic_handle_arch_irq from __irq_svc+0x8c/0xd0
Exception stack(0xc1301f10 to 0xc1301f58)
...
  __irq_svc from default_idle_call+0x20/0x2c4
  default_idle_call from do_idle+0x244/0x2b4
  do_idle from cpu_startup_entry+0x28/0x2c
  cpu_startup_entry from rest_init+0xec/0x190
  rest_init from arch_post_acpi_subsys_init+0x0/0x8
Code: e591300c e593402c f57ff04f e591300c (e593903c)
---[ end trace 0000000000000000 ]---
Kernel panic - not syncing: Fatal exception in interrupt
CPU2: stopping


It looks that the panfrost interrupts must be somehow synchronized with 
turning power off, what has been already discussed. Let me know if you 
want me to test any patch.


Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

