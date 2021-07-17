Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 921623CC38A
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jul 2021 15:08:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A5C088220;
	Sat, 17 Jul 2021 13:08:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D225F6EA6E;
 Sat, 17 Jul 2021 13:08:35 +0000 (UTC)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id CEBAC81E47;
 Sat, 17 Jul 2021 15:08:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1626527314;
 bh=ASTaSon/9tt70Tajx8OXklTvha2NWmR8t+cGAZAOH/U=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=ARmRQ0ldfKc6LjsA/xJTGhR1lobsG5C7NyhljAMTuiK77Vm48l3EVWjxYpR62Gual
 8aigXxczy/bwVANOmmdvD49qMF3EUyJI/aCLbN8zKG5IarBlaQqgLZsIiWsCBKvY0D
 xMlJX/SOuQ3LfusCIl4L3PsJ60EdbwbmZfJRle3FlRVXykKoOig1u7FKp75vE9kFul
 B7EAm+CuDAM60T7zBBqSHmrD+gkBUWGriExM8dSoZU8RGeohK02AxNYCWhpj4f+KXb
 Zl8ACuLpeoyRqLCPNSRW8hEHmEeyYfYo6LNiLeVnrNVBtw7cnQdz9xskaKHaSOsvzm
 gpivieS5XiSSA==
Subject: Re: [PATCH] drm/lima: Convert to clk_bulk API
To: Qiang Yu <yuq825@gmail.com>
References: <20210716182051.218575-1-marex@denx.de>
 <CAKGbVbsingxFiCARSu_-S_KxMHpQEJRkQn5hq9vAGUDwsBSh_g@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <e12734e8-71aa-375a-d544-c75b7379e576@denx.de>
Date: Sat, 17 Jul 2021 15:08:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAKGbVbsingxFiCARSu_-S_KxMHpQEJRkQn5hq9vAGUDwsBSh_g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: lima@lists.freedesktop.org, dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/17/21 2:34 PM, Qiang Yu wrote:
> On Sat, Jul 17, 2021 at 2:20 AM Marek Vasut <marex@denx.de> wrote:
>>
>> Instead of requesting two separate clock and then handling them
>> separately in various places of the driver, use clk_bulk_*() API.
>> This permits handling devices with more than "bus"/"core" clock,
>> like ZynqMP, which has "gpu"/"gpu_pp0"/"gpu_pp1" all as separate
>> clock.
> 
> I can't find the ZynqMP DTS file under arch/arm64/boot/dts/xilinx
> which has mali GPU node with an upstream kernel, where is it?

Posted here:
https://patchwork.kernel.org/project/linux-arm-kernel/patch/20210716182544.219490-1-marex@denx.de/

> So what's the relationship between "gpu" clk and "gpu_pp0"/"gpu_pp1"
> clk? Do they need to be controlled separately or we can just control the
> "gpu" clk? Because the devfreq code just controls a single module clk.

Per the docs, they are separate enable bits and the zynqmp clock 
controller exports them as separate clock, see bits 24..26 here:

https://www.xilinx.com/html_docs/registers/ug1087/crf_apb___gpu_ref_ctrl.html

>> Signed-off-by: Marek Vasut <marex@denx.de>
>> Cc: Qiang Yu <yuq825@gmail.com>
>> Cc: lima@lists.freedesktop.org
>> ---
>>   drivers/gpu/drm/lima/lima_devfreq.c | 17 +++++++++---
>>   drivers/gpu/drm/lima/lima_devfreq.h |  1 +
>>   drivers/gpu/drm/lima/lima_device.c  | 42 +++++++++++------------------
>>   drivers/gpu/drm/lima/lima_device.h  |  4 +--
>>   4 files changed, 32 insertions(+), 32 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/lima/lima_devfreq.c b/drivers/gpu/drm/lima/lima_devfreq.c
>> index 8989e215dfc9..533b36932f79 100644
>> --- a/drivers/gpu/drm/lima/lima_devfreq.c
>> +++ b/drivers/gpu/drm/lima/lima_devfreq.c
>> @@ -58,7 +58,7 @@ static int lima_devfreq_get_dev_status(struct device *dev,
>>          struct lima_devfreq *devfreq = &ldev->devfreq;
>>          unsigned long irqflags;
>>
>> -       status->current_frequency = clk_get_rate(ldev->clk_gpu);
>> +       status->current_frequency = clk_get_rate(devfreq->clk_gpu);
>>
>>          spin_lock_irqsave(&devfreq->lock, irqflags);
>>
>> @@ -110,12 +110,23 @@ int lima_devfreq_init(struct lima_device *ldev)
>>          struct lima_devfreq *ldevfreq = &ldev->devfreq;
>>          struct dev_pm_opp *opp;
>>          unsigned long cur_freq;
>> -       int ret;
>> +       int i, ret;
>>
>>          if (!device_property_present(dev, "operating-points-v2"))
>>                  /* Optional, continue without devfreq */
>>                  return 0;
>>
>> +       /* Find first clock which are not "bus" clock */
>> +       for (i = 0; i < ldev->nr_clks; i++) {
>> +               if (!strcmp(ldev->clks[i].id, "bus"))
>> +                       continue;
>> +               ldevfreq->clk_gpu = ldev->clks[i].clk;
>> +               break;
>> +       }
> 
> I'd prefer an explicit name for the required clk name. If some DTS has different
> name other than "core" for the module clk (ie. "gpu"), it should be changed to
> "core".

The problem here is, the zynqmp has no core clock, it has "gpu and both 
pixel pipes" super-clock-gate which controls everything, and then 
per-pixel-pipe sub-clock-gates.
