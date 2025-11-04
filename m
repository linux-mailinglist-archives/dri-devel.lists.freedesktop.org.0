Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38EFCC2EC18
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 02:31:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 526D410E504;
	Tue,  4 Nov 2025 01:31:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=mainlining.org header.i=@mainlining.org header.b="Ycyv/quY";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="QSO/NF7E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7734410E4FD;
 Tue,  4 Nov 2025 01:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org;
 c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1762219859; bh=fM/ML8+eiFDNrhDwbDXimr3
 UHaTvT4GeVqajlNLki+8=; b=Ycyv/quYpfC1vZ2XrqanaJqCKS0oYBIcQVGF8LL+DbLvqm0gyi
 08BkhaynJsLulHaqGGvN43le1UU0H60tspFdLQiPEZKxy8XVG5BI9jqC/z1bzhsrzPWRueYqy++
 uy3h7WHhMKJOefWbltZol6YOM2MeQqGiKJImQ95p3E9ZmzLSZMcqmxUguG2JS1H+jAb1UG12tsH
 JKzCUYprRCqQTtVRPvBtprH2jP0D/JpZZnrrvc5sBG96gD1rlJZYZa/FX0/W9RaRhW6/A2Yp9l8
 XvaPHO9fYt6Q6PvPR2xEluAYCHo24fxWdRX2xMe8hRsW9kw986GQ7j/EaPs8wObrP7Q==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org;
 c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1762219859; bh=fM/ML8+eiFDNrhDwbDXimr3
 UHaTvT4GeVqajlNLki+8=; b=QSO/NF7EtmXjONvj3ruouIpXm2yaGnZy9G4EHlG6Hd54VrWIL4
 c0W5lfKAznTnBAJIM/OB0KkQDt/w5GiH3hBQ==;
Message-ID: <bb4a8978-790a-46c5-94bd-9f97ffa15b64@mainlining.org>
Date: Tue, 4 Nov 2025 02:30:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC RFT] drm/msm: adreno: attach the GMU device to a driver
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251022-topic-adreno-attach-gmu-to-driver-v1-1-999037f7c83e@linaro.org>
 <02356e35-0a3a-4a50-ad38-3032f9f166c9@mainlining.org>
 <e9e117ed-823c-47e3-8ed6-14dbecc844bc@linaro.org>
Content-Language: en-US
From: Jens Reidel <adrian@mainlining.org>
In-Reply-To: <e9e117ed-823c-47e3-8ed6-14dbecc844bc@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Neil,

On 10/29/25 11:25 AM, Neil Armstrong wrote:
> Hi,
> 
> On 10/26/25 02:31, Jens Reidel wrote:
>> On 10/22/25 14:44, Neil Armstrong wrote:
>>> Due to the sync_state is enabled by default in pmdomain & CCF since 
>>> v6.17,
>>> the GCC and GPUCC sync_state would stay pending, leaving the 
>>> resources in
>>> full performance:
>>> gcc-x1e80100 100000.clock-controller: sync_state() pending due to 
>>> 3d6a000.gmu
>>> gpucc-x1e80100 3d90000.clock-controller: sync_state() pending due to 
>>> 3d6a000.gmu
>>>
>>> In order to fix this state and allow the GMU to be properly
>>> probed, let's add a proper driver for the GMU and add it to
>>> the MSM driver components.
>>>
>>> Only the proper GMU has been tested since I don't have
>>> access to hardware with a GMU wrapper.
>>>
>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> ---
>>>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c      | 354 +++++++++++++ 
>>> +---------------
>>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c      |   6 -
>>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.h      |   3 -
>>>   drivers/gpu/drm/msm/adreno/adreno_device.c |   4 +
>>>   drivers/gpu/drm/msm/adreno/adreno_gpu.h    |   4 +
>>>   drivers/gpu/drm/msm/msm_drv.c              |  16 +-
>>>   6 files changed, 192 insertions(+), 195 deletions(-)
>>>
> 
> <snip>
> 
>>>
>>> ---
>>> base-commit: 211ddde0823f1442e4ad052a2f30f050145ccada
>>> change-id: 20251022-topic-adreno-attach-gmu-to-driver-e47025fd7ebb
>>>
>>> Best regards,
>>
>> Hi Neil,
>>
>> thanks for the patch. With it applied, my GPU fails to initialize.
>> Here's the related dmesg section:
>>
>> [    1.733062] [drm:dpu_kms_hw_init:1173] dpu hardware 
>> revision:0x50020000
>> [    1.735229] [drm] Initialized msm 1.13.0 for ae01000.display- 
>> controller on minor 0
>> [    1.735403] msm_dpu ae01000.display-controller: 
>> [drm:adreno_request_fw] loaded qcom/a630_sqe.fw from new location
>> [    1.735513] msm_dpu ae01000.display-controller: 
>> [drm:adreno_request_fw] loaded qcom/a630_gmu.bin from new location
>> [    1.746710] a6xx_gmu 506a000.gmu: [drm:a6xx_gmu_set_oob] *ERROR* 
>> Timeout waiting for GMU OOB set BOOT_SLUMBER: 0x800000
>> [    1.746766] msm_dpu ae01000.display-controller: 
>> [drm:adreno_load_gpu] *ERROR* Couldn't power up the GPU: -110
>>
>> This could be because I have an Adreno 630-family GPU, which is marked 
>> as legacy in a6xx_gmu_init / a6xx_gmu_bind. Previously, the rest of 
>> the init code would just always run, while now, some parts are 
>> conditionally disabled for legacy GPUs - that may be unintentional? 
>> However, unconditionally enabling those parts seems to fail to 
>> initialize the GPU followed by a reset shortly after, so there's 
>> probably more to this.
>>
>> Please let me know if there's anything I can do to help debug this.
> 
> Thanks for the report, it's an sdm845 based right ?

Almost, it's SM7150 with Adreno 618.

> 
> I may have mismatched the role of the legacy parameter...
> 
> Could you try this on top:

<snip>

> ===========================><=====================================

This is about what I had already tried earlier. I wasn't able to grab a 
log from
UART to see what exactly was still wrong back then, but I finally got 
around to it today.

Short excerpt from decoded stacktrace:

[    4.838573] Unable to handle kernel paging request at virtual address 
0000000000023010
[    4.846726] Mem abort info:
[    4.857916]   ESR = 0x0000000096000044
[    4.870865]   EC = 0x25: DABT (current EL), IL = 32 bits
[    4.883897]   SET = 0, FnV = 0
[    4.895344]   EA = 0, S1PTW = 0
[    4.898584]   FSC = 0x04: level 0 translation fault
[    4.898586] Data abort info:
[    4.898587]   ISV = 0, ISS = 0x00000044, ISS2 = 0x00000000
[    4.898589]   CM = 0, WnR = 1, TnD = 0, TagAccess = 0
[    4.898591]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[    4.898593] [0000000000023010] user address but active_mm is swapper
[    4.898597] Internal error: Oops: 0000000096000044 [#1]  SMP
[    4.898600] Modules linked in:
[    4.898612] Tainted: [W]=WARN
[    4.898613] Hardware name: xiaomi Xiaomi POCO X3 NFC (Huaxing)/Xiaomi 
POCO X3 NFC (Huaxing), BIOS 2025.10-gcb980be18336 10/01/2025
[    4.898616] Workqueue: events_unbound deferred_probe_work_func
[    4.911316]
[    4.911318] pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS 
BTYPE=--)
[    4.911321] pc : a6xx_gmu_rpmh_init (arch/arm64/include/asm/io.h:43 
include/asm-generic/io.h:293 drivers/gpu/drm/msm/adreno/a6xx_gmu.h:183 
drivers/gpu/drm/msm/adreno/a6xx_gmu.c:621)
[    4.911327] lr : a6xx_gmu_rpmh_init 
(drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1811)
[    4.911331] sp : ffff8000809f3560
[    4.911332] x29: ffff8000809f3560 x28: 0000000000000001
[    4.919938]  x27: ffff800081e50000
[    4.919940] x26: 0000000000000300 x25: 0068000000000413 x24: 
ffffc51d5cca9000
[    4.919944] x23: 0000000000030090 x22: ffff000080aec3b0 x21: 
ffff00008162c010
[    4.919947] x20: ffff000080aec578 x19: ffff800081f90000 x18: 
000000000aa663d1
[    4.919950] x17: ffffc51d5cefc000 x16: ffffc51d5cca9d80 x15: 
0078000000000f13
[    4.930595]
[    4.930596] x14: 0000000000000000 x13: ffff800081f9ffff x12: 
ffff800081f9ffff
[    4.930600] x11: 0000000001000000 x10: 0000000000023010 x9 : 
0000000000000000
[    4.930603] x8 : 0000000000000000 x7 : ffff00008155a960 x6 : 
0000000000000000
[    4.930606] x5 : 0000000000000cc0 x4 : 0000000000001000 x3 : 
007800000b49ff13
[    4.930610] x2 : 000000000b4a0000
[    4.942943]  x1 : ffff800081fa0000 x0 : ffff800081e50000
[    4.942947] Call trace:
[    4.942948]  a6xx_gmu_rpmh_init (arch/arm64/include/asm/io.h:43 
include/asm-generic/io.h:293 drivers/gpu/drm/msm/adreno/a6xx_gmu.h:183 
drivers/gpu/drm/msm/adreno/a6xx_gmu.c:621) (P)
[    4.942954]  a6xx_gmu_bind (drivers/gpu/drm/msm/adreno/a6xx_gmu.c:2102)
[    4.942957]  component_bind_all (drivers/base/component.c:660)
[    4.956709]  msm_drm_init (drivers/gpu/drm/msm/msm_drv.c:159)
[    4.956714]  msm_drm_bind (drivers/gpu/drm/msm/msm_drv.c:1032)

Turns out that previously, gmu->mmio was assigned before setting
gmu->rscc = gmu->mmio + 0x23000;
With your changes, the order is now wrong.
Moving the assignment up again (and applying the diff you shared
for proper handling of legacy parameter) fixes it:

==========================================
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -2027,6 +2027,13 @@ static int a6xx_gmu_bind(struct device *dev, 
struct device *master, void *data)
                 if (ret)
                         goto err_memory;

+               /* Map the GMU registers */
+               gmu->mmio = a6xx_gmu_get_mmio(pdev, "gmu");
+               if (IS_ERR(gmu->mmio)) {
+                       ret = PTR_ERR(gmu->mmio);
+                       goto err_memory;
+               }
+
                 if (adreno_is_a650_family(adreno_gpu) ||
                     adreno_is_a7xx(adreno_gpu)) {
                         gmu->rscc = a6xx_gmu_get_mmio(pdev, "rscc");
@@ -2048,13 +2055,6 @@ static int a6xx_gmu_bind(struct device *dev, 
struct device *master, void *data)
                 }
         }

-       /* Map the GMU registers */
-       gmu->mmio = a6xx_gmu_get_mmio(pdev, "gmu");
-       if (IS_ERR(gmu->mmio)) {
-               ret = PTR_ERR(gmu->mmio);
-               goto err_memory;
-       }
-
         gmu->cxpd = dev_pm_domain_attach_by_name(gmu->dev, "cx");
         if (IS_ERR(gmu->cxpd)) {
                 ret = PTR_ERR(gmu->cxpd);
==========================================

This almost certainly isn't correct either because the wrapper needs
its registers mapped too, perhaps this is better suited for moving it
above the if block, I think that makes more sense.

With the legacy parameter changes and GMU register mapping prior to RSCC
offset calculation:Tested-by: Jens Reidel <adrian@mainlining.org> # SM7150

Best regards,Jens
> 
> Thanks,
> Neil
> 
>>
>> Best regards,
>> Jens
> 
