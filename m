Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3717E9BC6
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 13:03:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E90110E361;
	Mon, 13 Nov 2023 12:03:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF0F810E361
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 12:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699877000; x=1731413000;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=J0FBMRacXl1mkVznb6S6XrUDIW3kRHSDw/fGDh1KOOE=;
 b=U7W4iTKAPbrWuQ9evt18hu5eGtDlscPc5R7882jVi8JMOdShMy26Mq4h
 GYgyCMf3v+vc5wd7xU9bRIGk2sAXkIOD0ichZlIsKzZDnJxUpD5vHkrdY
 a0wW1+UIMyITrFYvrL2wl6pBHSn4RW4F6hd8CDVDonh+/fmVY5yu1zd9L
 S6YsirWXS5XvajRfBxHg6L1xcQEkk7mZuk0dp432wxqP9ekZJ/VUR2yAL
 YSAiXTa25JnZMipfWrKPfIY6Ol8y17hhE2KUnx61tZF+F4CLy72/KL2S8
 PTigLRazmOLHNcw3sPJXEaBEMNn1Rg6GFpj/Xhxwa2WnfKBeoVTTrwjU/ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="476641768"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="476641768"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 04:03:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="854946495"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="854946495"
Received: from unknown (HELO [10.217.160.78]) ([10.217.160.78])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 04:03:18 -0800
Message-ID: <4217eab0-fdda-4f3f-bd09-56e29b1ae0a2@linux.intel.com>
Date: Mon, 13 Nov 2023 13:03:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] accel/ivpu: Use threaded IRQ to handle JOB done
 messages
Content-Language: en-US
To: dri-devel@lists.freedesktop.org
References: <20231107123514.2218850-1-jacek.lawrynowicz@linux.intel.com>
 <20231107123514.2218850-6-jacek.lawrynowicz@linux.intel.com>
 <3dfeec85-1d05-2b9d-fe37-aebbfe9732b6@quicinc.com>
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <3dfeec85-1d05-2b9d-fe37-aebbfe9732b6@quicinc.com>
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

Hi,

On 10.11.2023 17:44, Jeffrey Hugo wrote:
> On 11/7/2023 5:35 AM, Jacek Lawrynowicz wrote:
>> Remove job_done thread and replace it with generic callback based
>> mechanism.
>>
>> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>> ---
>>   drivers/accel/ivpu/ivpu_drv.c     |  30 ++---
>>   drivers/accel/ivpu/ivpu_drv.h     |   3 +-
>>   drivers/accel/ivpu/ivpu_hw_37xx.c |  29 +++--
>>   drivers/accel/ivpu/ivpu_ipc.c     | 195 +++++++++++++++++-------------
>>   drivers/accel/ivpu/ivpu_ipc.h     |  22 +++-
>>   drivers/accel/ivpu/ivpu_job.c     |  84 +++----------
>>   drivers/accel/ivpu/ivpu_job.h     |   6 +-
>>   7 files changed, 185 insertions(+), 184 deletions(-)
>>
>> diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
>> index c4456abe228c..48cbcb254237 100644
>> --- a/drivers/accel/ivpu/ivpu_drv.c
>> +++ b/drivers/accel/ivpu/ivpu_drv.c
>> @@ -318,13 +318,15 @@ static int ivpu_wait_for_ready(struct ivpu_device *vdev)
>>       if (ivpu_test_mode & IVPU_TEST_MODE_FW_TEST)
>>           return 0;
>>   -    ivpu_ipc_consumer_add(vdev, &cons, IVPU_IPC_CHAN_BOOT_MSG);
>> +    ivpu_ipc_consumer_add(vdev, &cons, IVPU_IPC_CHAN_BOOT_MSG, NULL);
>>         timeout = jiffies + msecs_to_jiffies(vdev->timeout.boot);
>>       while (1) {
>>           ret = ivpu_ipc_irq_handler(vdev);
>> -        if (ret)
>> +        if (ret != IRQ_HANDLED) {
> 
> What about the IRQ_WAKE_THREAD case?

IRQ_WAKE_THREAD is only used when consumer has a callback (last arg to ivpu_ipc_consumer_add()).
We are here waiting for the response synchronously before IRQs are enabled.

>> +            ret = -EIO;
>>               break;
>> +        }
>>           ret = ivpu_ipc_receive(vdev, &cons, &ipc_hdr, NULL, 0);
>>           if (ret != -ETIMEDOUT || time_after_eq(jiffies, timeout))
>>               break;
> 
>> diff --git a/drivers/accel/ivpu/ivpu_hw_37xx.c b/drivers/accel/ivpu/ivpu_hw_37xx.c
>> index a172cfb1c31f..d1795cd6cc09 100644
>> --- a/drivers/accel/ivpu/ivpu_hw_37xx.c
>> +++ b/drivers/accel/ivpu/ivpu_hw_37xx.c
>> @@ -891,9 +891,13 @@ static void ivpu_hw_37xx_irq_noc_firewall_handler(struct ivpu_device *vdev)
>>   }
>>     /* Handler for IRQs from VPU core (irqV) */
>> -static u32 ivpu_hw_37xx_irqv_handler(struct ivpu_device *vdev, int irq)
>> +static irqreturn_t ivpu_hw_37xx_irqv_handler(struct ivpu_device *vdev, int irq)
>>   {
>>       u32 status = REGV_RD32(VPU_37XX_HOST_SS_ICB_STATUS_0) & ICB_0_IRQ_MASK;
>> +    irqreturn_t ret = IRQ_NONE;
>> +
>> +    if (!status)
>> +        return IRQ_NONE;
>>         REGV_WR32(VPU_37XX_HOST_SS_ICB_CLEAR_0, status);
>>   @@ -901,7 +905,7 @@ static u32 ivpu_hw_37xx_irqv_handler(struct ivpu_device *vdev, int irq)
>>           ivpu_mmu_irq_evtq_handler(vdev);
>>         if (REG_TEST_FLD(VPU_37XX_HOST_SS_ICB_STATUS_0, HOST_IPC_FIFO_INT, status))
>> -        ivpu_ipc_irq_handler(vdev);
>> +        ret |= ivpu_ipc_irq_handler(vdev);
> 
> Why the bitwise operation?  handler() returns a irqreturn_t, so it seems like this should just be ret = handler();

I could use simple assignment here as currently no other handlers propagate return values but there is still this:
>> +    ret |= ivpu_hw_37xx_irqv_handler(vdev, irq);
>> +    ret |= ivpu_hw_37xx_irqb_handler(vdev, irq);
> 
> I think this violates coding-style. typedefs are only to be used in limited circumstances.  The one I think that applies here is that the type is intended to be completely opaque and only accessed through proper accessor functions.  You are peering into the type and using the information that it is implemented as a bitfield, which is not for you to know.

I agree, this is shady :) I will define my own bitfield in v2.

> 
> If irqreturn_t changes in structure, this will break, and I don't think it will be caught by the compiler, or be obvious.
> 
>>         /* Re-enable global interrupts to re-trigger MSI for pending interrupts */
>>       REGB_WR32(VPU_37XX_BUTTRESS_GLOBAL_INT_MASK, 0x0);
>>   -    return IRQ_RETVAL(ret_irqb | ret_irqv);
>> +    if (ret & IRQ_WAKE_THREAD)
>> +        return IRQ_WAKE_THREAD;
>> +
>> +    return ret;
>>   }
>>     static void ivpu_hw_37xx_diagnose_failure(struct ivpu_device *vdev)

Regards,
Jacek
