Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75070D00DB6
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 04:26:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDED910E2E1;
	Thu,  8 Jan 2026 03:26:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Z/TmcRNZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C392A10E2E1
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 03:26:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4127760007;
 Thu,  8 Jan 2026 03:26:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3D0AC116C6;
 Thu,  8 Jan 2026 03:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767842788;
 bh=g6I/Hpv8oGYj+SWDDYJxjNhREEATlu/lZIcNJxiTLF8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Z/TmcRNZcxOWcmNlr2CFRT++E1h9J72ViNz5Czj3KPZ4uCByju8TXmqxse8FAQIE0
 1cN9x0N1vMW5lrac5azXYlt4JTDcn65Ro/uKVboYknGuXIQYc5q4dLJAqjsGYCjUhG
 d8/Sw8eFG4Moefwb9ohPZLJqFL0XOVQbii+nBgsYH57TouE98sHsMXMyM746n5cP6H
 bshXwyV5KZY2AoP5NZtAHR00Xv29D6V4JgcvjUzE+BvN1b4M+O0KsjK8fvVFoQRAuA
 rFgxwLDpWIzkc7s2nrBExlKgicW9h0IL51yvRfiGWK8AOOuqqYNwCVFvhAHvw2uvbV
 jodJNMx/juWnQ==
Message-ID: <77edbbff-661e-4a4e-b455-8cda6bd84b9e@kernel.org>
Date: Wed, 7 Jan 2026 21:26:26 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 1/2] accel/amdxdna: Update message DMA buffer allocation
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org,
 maciej.falkowski@linux.intel.com
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com
References: <20251219014356.2234241-1-lizhi.hou@amd.com>
 <812bcf91-d903-410f-91c8-8a71be3f3f02@amd.com>
 <1b8b49a7-762c-f530-3744-231beef9942f@amd.com>
 <33765a47-b37f-4435-b12c-c1d712ebc194@amd.com>
 <e96f3ed6-fed5-649a-d953-eed3dac7d82a@amd.com>
Content-Language: en-US
From: "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>
In-Reply-To: <e96f3ed6-fed5-649a-d953-eed3dac7d82a@amd.com>
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



On 1/7/2026 4:20 PM, Lizhi Hou wrote:
> 
> On 1/7/26 14:07, Mario Limonciello wrote:
>> On 1/7/26 4:05 PM, Lizhi Hou wrote:
>>>
>>> On 1/7/26 13:19, Mario Limonciello wrote:
>>>> On 12/18/25 7:43 PM, Lizhi Hou wrote:
>>>>> The latest firmware requires the message DMA buffer to
>>>>>    - have a minimum size of 8K
>>>>>    - use a power-of-two size
>>>>>    - be aligned to the buffer size
>>>>>    - not cross 64M boundary
>>>>>
>>>>> Update the buffer allocation logic to meet these requirements and 
>>>>> support
>>>>> the latest firmware.
>>>>
>>>> We can't guarantee that kernel and firmware are moving at the same 
>>>> time.
>>>> What happens if you run old firmware with these changes?
>>>
>>> The old firmware runs fine this these changes. The new firmware adds 
>>> more alignment and size requirements which the old one does not need.
>>
>> Ah OK - so patch 2 won't reject current firmware right?
> 
> Correct. It will not reject current firmware.
> 
Thank for confirming, no other concerns with this patch.

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>

> 
> Lizhi
> 
>>
>>>
>>>
>>> Lizhi
>>>
>>>>
>>>> If the old firmware can't run with these changes then it would be 
>>>> better to instead add a fallback system.
>>>>
>>>> IE:
>>>> 1) kernel tries to load new firmware name and use new behavior
>>>> 2) if firmware is missing, kernel tries to load old firmware name 
>>>> and use old behavior.
>>>> 3) if firmware is missing in old name then fail probe
>>>>
>>>>
>>>>>
>>>>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>>>>> ---
>>>>>   drivers/accel/amdxdna/aie2_error.c   | 10 ++++-----
>>>>>   drivers/accel/amdxdna/aie2_message.c | 33 +++++++++++++++++++ 
>>>>> +--------
>>>>>   drivers/accel/amdxdna/aie2_pci.h     |  5 +++++
>>>>>   3 files changed, 33 insertions(+), 15 deletions(-)
>>>>>
>>>>> diff --git a/drivers/accel/amdxdna/aie2_error.c b/drivers/accel/ 
>>>>> amdxdna/aie2_error.c
>>>>> index d452008ec4f4..5e82df2b7cf6 100644
>>>>> --- a/drivers/accel/amdxdna/aie2_error.c
>>>>> +++ b/drivers/accel/amdxdna/aie2_error.c
>>>>> @@ -338,8 +338,7 @@ void aie2_error_async_events_free(struct 
>>>>> amdxdna_dev_hdl *ndev)
>>>>>       destroy_workqueue(events->wq);
>>>>>       mutex_lock(&xdna->dev_lock);
>>>>>   -    dma_free_noncoherent(xdna->ddev.dev, events->size, events->buf,
>>>>> -                 events->addr, DMA_FROM_DEVICE);
>>>>> +    aie2_free_msg_buffer(ndev, events->size, events->buf, events- 
>>>>> >addr);
>>>>>       kfree(events);
>>>>>   }
>>>>>   @@ -355,8 +354,8 @@ int aie2_error_async_events_alloc(struct 
>>>>> amdxdna_dev_hdl *ndev)
>>>>>       if (!events)
>>>>>           return -ENOMEM;
>>>>>   -    events->buf = dma_alloc_noncoherent(xdna->ddev.dev, 
>>>>> total_size, &events->addr,
>>>>> -                        DMA_FROM_DEVICE, GFP_KERNEL);
>>>>> +    events->buf = aie2_alloc_msg_buffer(ndev, &total_size, 
>>>>> &events- >addr);
>>>>> +
>>>>>       if (!events->buf) {
>>>>>           ret = -ENOMEM;
>>>>>           goto free_events;
>>>>> @@ -396,8 +395,7 @@ int aie2_error_async_events_alloc(struct 
>>>>> amdxdna_dev_hdl *ndev)
>>>>>   free_wq:
>>>>>       destroy_workqueue(events->wq);
>>>>>   free_buf:
>>>>> -    dma_free_noncoherent(xdna->ddev.dev, events->size, events->buf,
>>>>> -                 events->addr, DMA_FROM_DEVICE);
>>>>> +    aie2_free_msg_buffer(ndev, events->size, events->buf, events- 
>>>>> >addr);
>>>>>   free_events:
>>>>>       kfree(events);
>>>>>       return ret;
>>>>> diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/ 
>>>>> amdxdna/aie2_message.c
>>>>> index 051f4ceaabae..99215328505e 100644
>>>>> --- a/drivers/accel/amdxdna/aie2_message.c
>>>>> +++ b/drivers/accel/amdxdna/aie2_message.c
>>>>> @@ -55,6 +55,22 @@ static int aie2_send_mgmt_msg_wait(struct 
>>>>> amdxdna_dev_hdl *ndev,
>>>>>       return ret;
>>>>>   }
>>>>>   +void *aie2_alloc_msg_buffer(struct amdxdna_dev_hdl *ndev, u32 
>>>>> *size,
>>>>> +                dma_addr_t *dma_addr)
>>>>> +{
>>>>> +    struct amdxdna_dev *xdna = ndev->xdna;
>>>>> +    int order;
>>>>> +
>>>>> +    *size = max(*size, SZ_8K);
>>>>> +    order = get_order(*size);
>>>>> +    if (order > MAX_PAGE_ORDER)
>>>>> +        return NULL;
>>>>> +    *size = PAGE_SIZE << order;
>>>>> +
>>>>> +    return dma_alloc_noncoherent(xdna->ddev.dev, *size, dma_addr,
>>>>> +                     DMA_FROM_DEVICE, GFP_KERNEL);
>>>>> +}
>>>>> +
>>>>>   int aie2_suspend_fw(struct amdxdna_dev_hdl *ndev)
>>>>>   {
>>>>>       DECLARE_AIE2_MSG(suspend, MSG_OP_SUSPEND);
>>>>> @@ -346,14 +362,13 @@ int aie2_query_status(struct amdxdna_dev_hdl 
>>>>> *ndev, char __user *buf,
>>>>>   {
>>>>>       DECLARE_AIE2_MSG(aie_column_info, MSG_OP_QUERY_COL_STATUS);
>>>>>       struct amdxdna_dev *xdna = ndev->xdna;
>>>>> +    u32 buf_sz = size, aie_bitmap = 0;
>>>>>       struct amdxdna_client *client;
>>>>>       dma_addr_t dma_addr;
>>>>> -    u32 aie_bitmap = 0;
>>>>>       u8 *buff_addr;
>>>>>       int ret;
>>>>>   -    buff_addr = dma_alloc_noncoherent(xdna->ddev.dev, size, 
>>>>> &dma_addr,
>>>>> -                      DMA_FROM_DEVICE, GFP_KERNEL);
>>>>> +    buff_addr = aie2_alloc_msg_buffer(ndev, &buf_sz, &dma_addr);
>>>>>       if (!buff_addr)
>>>>>           return -ENOMEM;
>>>>>   @@ -363,7 +378,7 @@ int aie2_query_status(struct amdxdna_dev_hdl 
>>>>> *ndev, char __user *buf,
>>>>>         *cols_filled = 0;
>>>>>       req.dump_buff_addr = dma_addr;
>>>>> -    req.dump_buff_size = size;
>>>>> +    req.dump_buff_size = buf_sz;
>>>>>       req.num_cols = hweight32(aie_bitmap);
>>>>>       req.aie_bitmap = aie_bitmap;
>>>>>   @@ -391,7 +406,7 @@ int aie2_query_status(struct amdxdna_dev_hdl 
>>>>> *ndev, char __user *buf,
>>>>>       *cols_filled = aie_bitmap;
>>>>>     fail:
>>>>> -    dma_free_noncoherent(xdna->ddev.dev, size, buff_addr, 
>>>>> dma_addr, DMA_FROM_DEVICE);
>>>>> +    aie2_free_msg_buffer(ndev, buf_sz, buff_addr, dma_addr);
>>>>>       return ret;
>>>>>   }
>>>>>   @@ -402,19 +417,19 @@ int aie2_query_telemetry(struct 
>>>>> amdxdna_dev_hdl *ndev,
>>>>>       DECLARE_AIE2_MSG(get_telemetry, MSG_OP_GET_TELEMETRY);
>>>>>       struct amdxdna_dev *xdna = ndev->xdna;
>>>>>       dma_addr_t dma_addr;
>>>>> +    u32 buf_sz = size;
>>>>>       u8 *addr;
>>>>>       int ret;
>>>>>         if (header->type >= MAX_TELEMETRY_TYPE)
>>>>>           return -EINVAL;
>>>>>   -    addr = dma_alloc_noncoherent(xdna->ddev.dev, size, &dma_addr,
>>>>> -                     DMA_FROM_DEVICE, GFP_KERNEL);
>>>>> +    addr = aie2_alloc_msg_buffer(ndev, &buf_sz, &dma_addr);
>>>>>       if (!addr)
>>>>>           return -ENOMEM;
>>>>>         req.buf_addr = dma_addr;
>>>>> -    req.buf_size = size;
>>>>> +    req.buf_size = buf_sz;
>>>>>       req.type = header->type;
>>>>>         drm_clflush_virt_range(addr, size); /* device can access */
>>>>> @@ -440,7 +455,7 @@ int aie2_query_telemetry(struct amdxdna_dev_hdl 
>>>>> *ndev,
>>>>>       header->minor = resp.minor;
>>>>>     free_buf:
>>>>> -    dma_free_noncoherent(xdna->ddev.dev, size, addr, dma_addr, 
>>>>> DMA_FROM_DEVICE);
>>>>> +    aie2_free_msg_buffer(ndev, buf_sz, addr, dma_addr);
>>>>>       return ret;
>>>>>   }
>>>>>   diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/ 
>>>>> amdxdna/aie2_pci.h
>>>>> index a929fa98a121..e1745f07b268 100644
>>>>> --- a/drivers/accel/amdxdna/aie2_pci.h
>>>>> +++ b/drivers/accel/amdxdna/aie2_pci.h
>>>>> @@ -336,6 +336,11 @@ int aie2_sync_bo(struct amdxdna_hwctx *hwctx, 
>>>>> struct amdxdna_sched_job *job,
>>>>>            int (*notify_cb)(void *, void __iomem *, size_t));
>>>>>   int aie2_config_debug_bo(struct amdxdna_hwctx *hwctx, struct 
>>>>> amdxdna_sched_job *job,
>>>>>                int (*notify_cb)(void *, void __iomem *, size_t));
>>>>> +void *aie2_alloc_msg_buffer(struct amdxdna_dev_hdl *ndev, u32 *size,
>>>>> +                dma_addr_t *dma_addr);
>>>>> +#define aie2_free_msg_buffer(ndev, size, buff_addr, 
>>>>> dma_addr)        \
>>>>> +    dma_free_noncoherent((ndev)->xdna->ddev.dev, size, 
>>>>> buff_addr,    \
>>>>> +                 dma_addr, DMA_FROM_DEVICE)
>>>>>     /* aie2_hwctx.c */
>>>>>   int aie2_hwctx_init(struct amdxdna_hwctx *hwctx);
>>>>
>>

