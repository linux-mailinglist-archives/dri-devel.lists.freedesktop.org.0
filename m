Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2FF6456C9
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 10:47:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 826DA10E364;
	Wed,  7 Dec 2022 09:47:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B5AC10E18E
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Dec 2022 09:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670406447; x=1701942447;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=/d+mkf1q4sX2OpDuwzus1V77tssNuWCyeomM5QnoXjA=;
 b=JCVbJ2QQ3Tpc8g2uqt/8z6l+5+OTD6EikhguSHq/OrEONyZlZWNLvk47
 67tna4vVWnurgsLl5sx/gvKi+ZTp1rtclfDWOFHAM4mtvflS7atV+85a4
 uoWDwzPouvsJvBL7kTNkQ+KOyUylgT5nivYrNDRx6XvHPygB/H85F/W0Y
 LACR4K4/SugdiLx60gJWzi7pFo7Z1+zuOBWUj4Wg3kwpYTHgwpFlPqGVu
 ASgUU3Z7zg5BpePu4zk8qwGFsC5W6MZyFjQK121KjxJ5so2UhMgQIbybC
 kwTmJCRxZ1fjZviqQE+MBVNKch9xI2bjXLyr4gkf9vPCuW6HwSCw5JJtx Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10553"; a="316865078"
X-IronPort-AV: E=Sophos;i="5.96,225,1665471600"; d="scan'208";a="316865078"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2022 01:47:26 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10553"; a="648673073"
X-IronPort-AV: E=Sophos;i="5.96,225,1665471600"; d="scan'208";a="648673073"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.249.150.189])
 ([10.249.150.189])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2022 01:47:24 -0800
Message-ID: <73496c01-f851-c174-d004-f383503e5f70@linux.intel.com>
Date: Wed, 7 Dec 2022 10:47:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3 4/7] drm/ivpu: Add IPC driver and JSM messages
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
 airlied@gmail.com, daniel@ffwll.ch
References: <20220924151149.323622-1-jacek.lawrynowicz@linux.intel.com>
 <20220924151149.323622-5-jacek.lawrynowicz@linux.intel.com>
 <4ad1a005-cf1f-16a3-2ee0-2a00ecb7af0c@suse.de>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <4ad1a005-cf1f-16a3-2ee0-2a00ecb7af0c@suse.de>
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
Cc: andrzej.kacprowski@linux.intel.com, stanislaw.gruszka@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 11/1/2022 11:02 AM, Thomas Zimmermann wrote:
> Hi
> 
> Am 24.09.22 um 17:11 schrieb Jacek Lawrynowicz:
>> The IPC driver is used to send and receive messages to/from firmware
>> running on the VPU.
>>
>> The only supported IPC message format is Job Submission Model (JSM)
>> defined in vpu_jsm_api.h header.
>>
>> Signed-off-by: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
>> Signed-off-by: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>
>> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>> ---
>>   drivers/gpu/drm/ivpu/Makefile       |   2 +
>>   drivers/gpu/drm/ivpu/ivpu_drv.c     |  15 +
>>   drivers/gpu/drm/ivpu/ivpu_drv.h     |   2 +
>>   drivers/gpu/drm/ivpu/ivpu_hw_mtl.c  |   4 +
>>   drivers/gpu/drm/ivpu/ivpu_ipc.c     | 499 ++++++++++++++++++++++
>>   drivers/gpu/drm/ivpu/ivpu_ipc.h     |  90 ++++
>>   drivers/gpu/drm/ivpu/ivpu_jsm_msg.c | 220 ++++++++++
>>   drivers/gpu/drm/ivpu/ivpu_jsm_msg.h |  25 ++
>>   drivers/gpu/drm/ivpu/vpu_jsm_api.h  | 616 ++++++++++++++++++++++++++++
>>   9 files changed, 1473 insertions(+)
>>   create mode 100644 drivers/gpu/drm/ivpu/ivpu_ipc.c
>>   create mode 100644 drivers/gpu/drm/ivpu/ivpu_ipc.h
>>   create mode 100644 drivers/gpu/drm/ivpu/ivpu_jsm_msg.c
>>   create mode 100644 drivers/gpu/drm/ivpu/ivpu_jsm_msg.h
>>   create mode 100644 drivers/gpu/drm/ivpu/vpu_jsm_api.h
>>
>> diff --git a/drivers/gpu/drm/ivpu/Makefile b/drivers/gpu/drm/ivpu/Makefile
>> index 4053fe341d56..4e33860c0dc4 100644
>> --- a/drivers/gpu/drm/ivpu/Makefile
>> +++ b/drivers/gpu/drm/ivpu/Makefile
>> @@ -5,6 +5,8 @@ intel_vpu-y := \
>>       ivpu_drv.o \
>>       ivpu_gem.o \
>>       ivpu_hw_mtl.o \
>> +    ivpu_ipc.o \
>> +    ivpu_jsm_msg.o \
>>       ivpu_mmu.o \
>>       ivpu_mmu_context.o
>>   diff --git a/drivers/gpu/drm/ivpu/ivpu_drv.c b/drivers/gpu/drm/ivpu/ivpu_drv.c
>> index b0442e2a4960..b7e2bc54897a 100644
>> --- a/drivers/gpu/drm/ivpu/ivpu_drv.c
>> +++ b/drivers/gpu/drm/ivpu/ivpu_drv.c
>> @@ -16,6 +16,7 @@
>>   #include "ivpu_drv.h"
>>   #include "ivpu_gem.h"
>>   #include "ivpu_hw.h"
>> +#include "ivpu_ipc.h"
>>   #include "ivpu_mmu.h"
>>   #include "ivpu_mmu_context.h"
>>   @@ -201,6 +202,7 @@ int ivpu_shutdown(struct ivpu_device *vdev)
>>       int ret;
>>         ivpu_hw_irq_disable(vdev);
>> +    ivpu_ipc_disable(vdev);
>>       ivpu_mmu_disable(vdev);
>>         ret = ivpu_hw_power_down(vdev);
>> @@ -318,6 +320,10 @@ static int ivpu_dev_init(struct ivpu_device *vdev)
>>       if (!vdev->mmu)
>>           return -ENOMEM;
>>   +    vdev->ipc = devm_kzalloc(vdev->drm.dev, sizeof(*vdev->ipc), GFP_KERNEL);
>> +    if (!vdev->ipc)
>> +        return -ENOMEM;
>> +
>>       vdev->hw->ops = &ivpu_hw_mtl_ops;
>>       vdev->platform = IVPU_PLATFORM_INVALID;
>>   @@ -361,8 +367,16 @@ static int ivpu_dev_init(struct ivpu_device *vdev)
>>           goto err_mmu_gctx_fini;
>>       }
>>   +    ret = ivpu_ipc_init(vdev);
>> +    if (ret) {
>> +        ivpu_err(vdev, "Failed to initialize IPC: %d\n", ret);
>> +        goto err_mmu_fini;
>> +    }
>> +
>>       return 0;
>>   +err_mmu_fini:
>> +    ivpu_mmu_fini(vdev);
>>   err_mmu_gctx_fini:
>>       ivpu_mmu_global_context_fini(vdev);
>>   err_power_down:
>> @@ -378,6 +392,7 @@ static void ivpu_dev_fini(struct ivpu_device *vdev)
>>   {
>>       ivpu_shutdown(vdev);
>>   +    ivpu_ipc_fini(vdev);
>>       ivpu_mmu_fini(vdev);
>>       ivpu_mmu_global_context_fini(vdev);
>>       ivpu_irq_fini(vdev);
>> diff --git a/drivers/gpu/drm/ivpu/ivpu_drv.h b/drivers/gpu/drm/ivpu/ivpu_drv.h
>> index 6eec3eb76c2f..48e5ed442f71 100644
>> --- a/drivers/gpu/drm/ivpu/ivpu_drv.h
>> +++ b/drivers/gpu/drm/ivpu/ivpu_drv.h
>> @@ -73,6 +73,7 @@ struct ivpu_wa_table {
>>     struct ivpu_hw_info;
>>   struct ivpu_mmu_info;
>> +struct ivpu_ipc_info;
>>     struct ivpu_device {
>>       struct drm_device drm; /* Must be first */
>> @@ -84,6 +85,7 @@ struct ivpu_device {
>>       struct ivpu_wa_table wa;
>>       struct ivpu_hw_info *hw;
>>       struct ivpu_mmu_info *mmu;
>> +    struct ivpu_ipc_info *ipc;
>>         struct ivpu_mmu_context gctx;
>>       struct xarray context_xa;
>> diff --git a/drivers/gpu/drm/ivpu/ivpu_hw_mtl.c b/drivers/gpu/drm/ivpu/ivpu_hw_mtl.c
>> index 525b57c4029c..5e31aec36bfa 100644
>> --- a/drivers/gpu/drm/ivpu/ivpu_hw_mtl.c
>> +++ b/drivers/gpu/drm/ivpu/ivpu_hw_mtl.c
>> @@ -7,6 +7,7 @@
>>   #include "ivpu_hw_mtl_reg.h"
>>   #include "ivpu_hw_reg_io.h"
>>   #include "ivpu_hw.h"
>> +#include "ivpu_ipc.h"
>>   #include "ivpu_mmu.h"
>>     #define TILE_FUSE_ENABLE_BOTH         0x0
>> @@ -931,6 +932,9 @@ static irqreturn_t ivpu_hw_mtl_irqv_handler(struct ivpu_device *vdev, int irq)
>>         REGV_WR32(MTL_VPU_HOST_SS_ICB_CLEAR_0, status);
>>   +    if (REG_TEST_FLD(MTL_VPU_HOST_SS_ICB_STATUS_0, HOST_IPC_FIFO_INT, status))
>> +        ret &= ivpu_ipc_irq_handler(vdev);
>> +
>>       if (REG_TEST_FLD(MTL_VPU_HOST_SS_ICB_STATUS_0, MMU_IRQ_0_INT, status))
>>           ret &= ivpu_mmu_irq_evtq_handler(vdev);
>>   diff --git a/drivers/gpu/drm/ivpu/ivpu_ipc.c b/drivers/gpu/drm/ivpu/ivpu_ipc.c
>> new file mode 100644
>> index 000000000000..9eac5d25f3ea
>> --- /dev/null
>> +++ b/drivers/gpu/drm/ivpu/ivpu_ipc.c
>> @@ -0,0 +1,499 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright © 2020-2022 Intel Corporation
>> + */
>> +
>> +#include <linux/genalloc.h>
>> +#include <linux/highmem.h>
>> +#include <linux/kthread.h>
>> +#include <linux/wait.h>
>> +
>> +#include "ivpu_drv.h"
>> +#include "ivpu_gem.h"
>> +#include "ivpu_hw.h"
>> +#include "ivpu_hw_reg_io.h"
>> +#include "ivpu_ipc.h"
>> +#include "ivpu_jsm_msg.h"
>> +
>> +#define IPC_MAX_RX_MSG    128
>> +#define IS_KTHREAD()    (get_current()->flags & PF_KTHREAD)
>> +
>> +struct ivpu_ipc_tx_buf {
>> +    struct ivpu_ipc_hdr ipc;
>> +    struct vpu_jsm_msg jsm;
>> +};
>> +
>> +struct ivpu_ipc_rx_msg {
>> +    struct list_head link;
>> +    struct ivpu_ipc_hdr *ipc_hdr;
>> +    struct vpu_jsm_msg *jsm_msg;
>> +};
>> +
>> +static void ivpu_ipc_msg_dump(struct ivpu_device *vdev, char *c,
>> +                  struct ivpu_ipc_hdr *ipc_hdr, u32 vpu_addr)
>> +{
>> +    ivpu_dbg(IPC,
>> +         "%s: vpu:0x%x (data_addr:0x%08x, data_size:0x%x, channel:0x%x, src_node:0x%x, dst_node:0x%x, status:0x%x)",
>> +         c, vpu_addr, ipc_hdr->data_addr, ipc_hdr->data_size,
>> +         ipc_hdr->channel, ipc_hdr->src_node, ipc_hdr->dst_node,
>> +         ipc_hdr->status);
>> +}
>> +
>> +static void ivpu_jsm_msg_dump(struct ivpu_device *vdev, char *c,
>> +                  struct vpu_jsm_msg *jsm_msg, u32 vpu_addr)
>> +{
>> +    u32 *payload = (u32 *)&jsm_msg->payload;
>> +
>> +    ivpu_dbg(JSM,
>> +         "%s: vpu:0x%08x (type:%s, status:0x%x, id: 0x%x, result: 0x%x, payload:0x%x 0x%x 0x%x 0x%x 0x%x)\n",
>> +         c, vpu_addr, ivpu_jsm_msg_type_to_str(jsm_msg->type),
>> +         jsm_msg->status, jsm_msg->request_id, jsm_msg->result,
>> +         payload[0], payload[1], payload[2], payload[3], payload[4]);
>> +}
>> +
>> +static void
>> +ivpu_ipc_rx_mark_free(struct ivpu_device *vdev, struct ivpu_ipc_hdr *ipc_hdr,
>> +              struct vpu_jsm_msg *jsm_msg)
>> +{
>> +    ipc_hdr->status = IVPU_IPC_HDR_FREE;
>> +    if (jsm_msg)
>> +        jsm_msg->status = VPU_JSM_MSG_FREE;
>> +    wmb(); /* Flush WC buffers for message statuses */
>> +}
>> +
>> +static void ivpu_ipc_mem_fini(struct ivpu_device *vdev)
>> +{
>> +    struct ivpu_ipc_info *ipc = vdev->ipc;
>> +
>> +    ivpu_bo_free_internal(ipc->mem_rx);
>> +    ivpu_bo_free_internal(ipc->mem_tx);
>> +}
>> +
>> +static int
>> +ivpu_ipc_tx_prepare(struct ivpu_device *vdev, struct ivpu_ipc_consumer *cons,
>> +            struct vpu_jsm_msg *req)
>> +{
>> +    struct ivpu_ipc_info *ipc = vdev->ipc;
>> +    struct ivpu_ipc_tx_buf *tx_buf;
>> +    u32 tx_buf_vpu_addr;
>> +    u32 jsm_vpu_addr;
>> +
>> +    tx_buf_vpu_addr = gen_pool_alloc(ipc->mm_tx, sizeof(*tx_buf));
>> +    if (!tx_buf_vpu_addr) {
>> +        ivpu_err(vdev, "Failed to reserve IPC buffer, size %ld\n",
>> +             sizeof(*tx_buf));
> 
> I noticed that you have plenty of these error messages. IIRC, I mentioned before that useing regular drm_info(), drm_err(), etc might be better candidates.  I can see why you want special debug macros for your driver, though.

ivpu_err() adds function name to the message, so the message itself can be shorter.
I will change ivpu_err()/ivpu_warn()/.. implmentations so they use drm_err() etc.

>> +        return -ENOMEM;
>> +    }
>> +
>> +    tx_buf = ivpu_to_cpu_addr(ipc->mem_tx, tx_buf_vpu_addr);
>> +    if (WARN_ON(!tx_buf)) {
> 
> We have drm_WARN_ON(), which gives additional information about the device.

OK, I will use drm_WARN_ON().

>> +        gen_pool_free(ipc->mm_tx, tx_buf_vpu_addr, sizeof(*tx_buf));
>> +        return -EIO;
> 
> As ivpu_to_cpu_addr() is in your driver, it might be better to let it return an error pointer and extract the value here?
> 
> Especially since EIO is an I/O error. Does this really fit?

I think ivpu_to_cpu_addr() is too simple to use ERR_PTR and
that the IO error should be detected before ivpu_to_cpu_addr() is called.

I will change the code to something like this:
	vpu_addr = ivpu_hw_reg_ipc_rx_addr_get(vdev);
	if (vpu_addr == REG_IO_ERROR) {
		ivpu_err(vdev, "Failed to read IPC rx addr register\n");
		return -EIO;
	}

	ipc_hdr = ivpu_to_cpu_addr(ipc->mem_rx, vpu_addr);
	if (!ipc_hdr) {
		ivpu_warn(vdev, "IPC msg 0x%x out of range\n", vpu_addr);
		continue;
	}

>> +    }
>> +
>> +    jsm_vpu_addr = tx_buf_vpu_addr + offsetof(struct ivpu_ipc_tx_buf, jsm);
>> +
>> +    if (tx_buf->ipc.status != IVPU_IPC_HDR_FREE)
>> +        ivpu_warn(vdev, "IPC message vpu:0x%x not released by firmware\n",
>> +              tx_buf_vpu_addr);
>> +
>> +    if (tx_buf->jsm.status != VPU_JSM_MSG_FREE)
>> +        ivpu_warn(vdev, "JSM message vpu:0x%x not released by firmware\n",
>> +              jsm_vpu_addr);
>> +
>> +    memset(tx_buf, 0, sizeof(*tx_buf));
>> +    tx_buf->ipc.data_addr = jsm_vpu_addr;
>> +    /* TODO: Set data_size to actual JSM message size, not union of all messages */
>> +    tx_buf->ipc.data_size = sizeof(*req);
>> +    tx_buf->ipc.channel = cons->channel;
>> +    tx_buf->ipc.src_node = 0;
>> +    tx_buf->ipc.dst_node = 1;
>> +    tx_buf->ipc.status = IVPU_IPC_HDR_ALLOCATED;
>> +    tx_buf->jsm.type = req->type;
>> +    tx_buf->jsm.status = VPU_JSM_MSG_ALLOCATED;
>> +    tx_buf->jsm.payload = req->payload;
>> +
>> +    req->request_id = atomic_inc_return(&ipc->request_id);
>> +    tx_buf->jsm.request_id = req->request_id;
>> +    cons->request_id = req->request_id;
>> +    wmb(); /* Flush WC buffers for IPC, JSM msgs */
>> +
>> +    cons->tx_vpu_addr = tx_buf_vpu_addr;
>> +
>> +    ivpu_jsm_msg_dump(vdev, "TX", &tx_buf->jsm, jsm_vpu_addr);
>> +    ivpu_ipc_msg_dump(vdev, "TX", &tx_buf->ipc, tx_buf_vpu_addr);
>> +
>> +    return 0;
>> +}
>> +
>> +static void ivpu_ipc_tx_release(struct ivpu_device *vdev, u32 vpu_addr)
>> +{
>> +    struct ivpu_ipc_info *ipc = vdev->ipc;
>> +
>> +    if (vpu_addr)
>> +        gen_pool_free(ipc->mm_tx, vpu_addr, sizeof(struct ivpu_ipc_tx_buf));
>> +}
>> +
>> +static void ivpu_ipc_tx(struct ivpu_device *vdev, u32 vpu_addr)
>> +{
>> +    ivpu_hw_reg_ipc_tx_set(vdev, vpu_addr);
>> +}
>> +
>> +void ivpu_ipc_consumer_add(struct ivpu_device *vdev,
>> +               struct ivpu_ipc_consumer *cons, u32 channel)
>> +{
>> +    struct ivpu_ipc_info *ipc = vdev->ipc;
>> +
>> +    init_waitqueue_head(&cons->rx_msg_wq);
>> +    INIT_LIST_HEAD(&cons->link);
>> +    cons->channel = channel;
>> +    cons->tx_vpu_addr = 0;
>> +    cons->request_id = 0;
>> +
>> +    INIT_LIST_HEAD(&cons->rx_msg_list);
>> +
>> +    spin_lock_irq(&ipc->cons_list_lock);
>> +    list_add_tail(&cons->link, &ipc->cons_list);
>> +    spin_unlock_irq(&ipc->cons_list_lock);
>> +}
>> +
>> +void ivpu_ipc_consumer_del(struct ivpu_device *vdev, struct ivpu_ipc_consumer *cons)
>> +{
>> +    struct ivpu_ipc_info *ipc = vdev->ipc;
>> +    struct ivpu_ipc_rx_msg *rx_msg, *r;
>> +
>> +    spin_lock_irq(&ipc->cons_list_lock);
>> +
>> +    list_del(&cons->link);
>> +    list_for_each_entry_safe(rx_msg, r, &cons->rx_msg_list, link) {
>> +        list_del(&rx_msg->link);
>> +        ivpu_ipc_rx_mark_free(vdev, rx_msg->ipc_hdr, rx_msg->jsm_msg);
>> +        atomic_dec(&ipc->rx_msg_count);
>> +        kfree(rx_msg);
>> +    }
>> +
>> +    spin_unlock_irq(&ipc->cons_list_lock);
> 
> Not sure if it's relevant, but this apparently blocks IPC delivery for all other consumers. Would it make sense / be possible to remove cons from the list and do the loop separately; maybe with a different lock for rx_msg_list?
> 
> While reading these funcstions, I had to look several times to see what is consumer code, what is IPC and when locking is required.

Agreed. I will add a separeate lock for rx_msg_list.

>> +
>> +    ivpu_ipc_tx_release(vdev, cons->tx_vpu_addr);
>> +}
>> +
>> +static int ivpu_ipc_send(struct ivpu_device *vdev, struct ivpu_ipc_consumer *cons,
>> +             struct vpu_jsm_msg *req)
>> +{
>> +    struct ivpu_ipc_info *ipc = vdev->ipc;
>> +    int ret;
>> +
>> +    if (mutex_lock_interruptible(&ipc->lock))
>> +        return -EINTR;
> 
> Any reason to not use the errno code of mutex_luck_interruptibe()? It could also be EDEADLK IIRC.
 
No, I will fix this.

>> +
>> +    if (!ipc->on) {
>> +        ret = -EAGAIN;
>> +        goto unlock;
>> +    }
>> +
>> +    ret = ivpu_ipc_tx_prepare(vdev, cons, req);
>> +    if (ret)
>> +        goto unlock;
>> +
>> +    ivpu_ipc_tx(vdev, cons->tx_vpu_addr);
>> +
>> +unlock:
>> +    mutex_unlock(&ipc->lock);
>> +    return ret;
>> +}
>> +
>> +int ivpu_ipc_receive(struct ivpu_device *vdev, struct ivpu_ipc_consumer *cons,
>> +             struct ivpu_ipc_hdr *ipc_buf,
>> +             struct vpu_jsm_msg *ipc_payload, unsigned long timeout_ms)
>> +{
>> +    struct ivpu_ipc_info *ipc = vdev->ipc;
>> +    struct ivpu_ipc_rx_msg *rx_msg;
>> +    int wait_ret, ret = 0;
>> +
>> +    wait_ret = wait_event_interruptible_timeout(cons->rx_msg_wq,
>> +                            (IS_KTHREAD() && kthread_should_stop()) ||
>> +                            !list_empty(&cons->rx_msg_list),
>> +                            msecs_to_jiffies(timeout_ms));
>> +
>> +    if (IS_KTHREAD() && kthread_should_stop())
>> +        return -EINTR;
>> +
>> +    if (wait_ret == 0)
>> +        return -ETIMEDOUT;
>> +
>> +    if (wait_ret < 0)
>> +        return -ERESTARTSYS;
>> +
>> +    spin_lock_irq(&ipc->cons_list_lock);
>> +    rx_msg = list_first_entry_or_null(&cons->rx_msg_list,
>> +                      struct ivpu_ipc_rx_msg, link);
>> +    if (!rx_msg) {
>> +        spin_unlock_irq(&ipc->cons_list_lock);
>> +        return -EAGAIN;
>> +    }
>> +    list_del(&rx_msg->link);
>> +    spin_unlock_irq(&ipc->cons_list_lock);
>> +
>> +    if (ipc_buf)
>> +        memcpy(ipc_buf, rx_msg->ipc_hdr, sizeof(*ipc_buf));
>> +    if (rx_msg->jsm_msg) {
>> +        u32 size = min_t(int, rx_msg->ipc_hdr->data_size, sizeof(*ipc_payload));
>> +
>> +        if (rx_msg->jsm_msg->result != VPU_JSM_STATUS_SUCCESS) {
>> +            ivpu_dbg(IPC, "IPC resp result error: %d\n", rx_msg->jsm_msg->result);
>> +            ret = -EBADMSG;
>> +        }
>> +
>> +        if (ipc_payload)
>> +            memcpy(ipc_payload, rx_msg->jsm_msg, size);
>> +    }
>> +
>> +    ivpu_ipc_rx_mark_free(vdev, rx_msg->ipc_hdr, rx_msg->jsm_msg);
>> +    atomic_dec(&ipc->rx_msg_count);
>> +    kfree(rx_msg);
>> +
>> +    return ret;
>> +}
>> +
>> +static int
>> +ivpu_ipc_send_receive_internal(struct ivpu_device *vdev, struct vpu_jsm_msg *req,
>> +                   enum vpu_ipc_msg_type expected_resp_type,
>> +                   struct vpu_jsm_msg *resp, u32 channel,
>> +                   unsigned long timeout_ms)
>> +{
>> +    struct ivpu_ipc_consumer cons;
>> +    int ret;
>> +
>> +    ivpu_ipc_consumer_add(vdev, &cons, channel);
>> +
>> +    ret = ivpu_ipc_send(vdev, &cons, req);
>> +    if (ret) {
>> +        ivpu_warn(vdev, "IPC send failed: %d\n", ret);
>> +        goto consumer_del;
>> +    }
>> +
>> +    ret = ivpu_ipc_receive(vdev, &cons, NULL, resp, timeout_ms);
>> +    if (ret) {
>> +        ivpu_warn(vdev, "IPC receive failed: type %s, ret %d\n",
>> +              ivpu_jsm_msg_type_to_str(req->type), ret);
>> +        goto consumer_del;
>> +    }
>> +
>> +    if (resp->type != expected_resp_type) {
>> +        ivpu_warn(vdev, "Invalid JSM response type: %d\n", resp->type);
>> +        ret = -EBADE;
>> +    }
>> +
>> +consumer_del:
>> +    ivpu_ipc_consumer_del(vdev, &cons);
>> +    return ret;
>> +}
>> +
>> +int ivpu_ipc_send_receive(struct ivpu_device *vdev, struct vpu_jsm_msg *req,
>> +              enum vpu_ipc_msg_type expected_resp_type,
>> +              struct vpu_jsm_msg *resp, u32 channel,
>> +              unsigned long timeout_ms)
>> +{
>> +    struct vpu_jsm_msg hb_req = { .type = VPU_JSM_MSG_QUERY_ENGINE_HB };
>> +    struct vpu_jsm_msg hb_resp;
>> +    int ret;
>> +
>> +    ret = ivpu_ipc_send_receive_internal(vdev, req, expected_resp_type, resp,
>> +                         channel, timeout_ms);
>> +    if (ret != -ETIMEDOUT)
>> +        return ret;
>> +
>> +    ret = ivpu_ipc_send_receive_internal(vdev, &hb_req, VPU_JSM_MSG_QUERY_ENGINE_HB_DONE,
>> +                         &hb_resp, VPU_IPC_CHAN_ASYNC_CMD, vdev->timeout.jsm);
>> +    if (ret)
>> +        ivpu_hw_diagnose_tdr(vdev);
>> +
>> +    return ret;
>> +}
>> +
>> +static bool
>> +ivpu_ipc_match_consumer(struct ivpu_device *vdev, struct ivpu_ipc_consumer *cons,
>> +            struct ivpu_ipc_hdr *ipc_hdr, struct vpu_jsm_msg *jsm_msg)
>> +{
>> +    if (cons->channel != ipc_hdr->channel)
>> +        return false;
>> +
>> +    if (!jsm_msg || jsm_msg->request_id == cons->request_id)
>> +        return true;
>> +
>> +    return false;
>> +}
>> +
>> +static bool
>> +ivpu_ipc_dispatch(struct ivpu_device *vdev, struct ivpu_ipc_consumer *cons,
>> +          struct ivpu_ipc_hdr *ipc_hdr, struct vpu_jsm_msg *jsm_msg)
>> +{
>> +    struct ivpu_ipc_info *ipc = vdev->ipc;
>> +    struct ivpu_ipc_rx_msg *rx_msg;
>> +
>> +    if (!ivpu_ipc_match_consumer(vdev, cons, ipc_hdr, jsm_msg))
>> +        return false;
>> +
>> +    if (atomic_read(&ipc->rx_msg_count) > IPC_MAX_RX_MSG) {
>> +        ivpu_warn(vdev, "IPC RX message dropped, msg count %d\n",
>> +              IPC_MAX_RX_MSG);
>> +        ivpu_ipc_rx_mark_free(vdev, ipc_hdr, jsm_msg);
>> +        return true;
>> +    }
>> +
>> +    rx_msg = kzalloc(sizeof(*rx_msg), GFP_ATOMIC);
>> +    if (!rx_msg) {
>> +        ivpu_ipc_rx_mark_free(vdev, ipc_hdr, jsm_msg);
>> +        return true;
>> +    }
>> +
>> +    atomic_inc(&ipc->rx_msg_count);
>> +
>> +    rx_msg->ipc_hdr = ipc_hdr;
>> +    rx_msg->jsm_msg = jsm_msg;
>> +
>> +    lockdep_assert_held(&ipc->cons_list_lock);
>> +    list_add_tail(&rx_msg->link, &cons->rx_msg_list);
>> +
>> +    wake_up_all(&cons->rx_msg_wq);
>> +
>> +    return true;
>> +}
>> +
>> +irqreturn_t ivpu_ipc_irq_handler(struct ivpu_device *vdev)
>> +{
>> +    struct ivpu_ipc_info *ipc = vdev->ipc;
>> +    struct ivpu_ipc_consumer *cons;
>> +    struct ivpu_ipc_hdr *ipc_hdr;
>> +    struct vpu_jsm_msg *jsm_msg;
>> +    unsigned long f;
>> +
>> +    /* Driver needs to purge all messages from IPC FIFO to clear IPC interrupt.
>> +     * Without purge IPC FIFO to 0 next IPC interrupts won't be generated.
>> +     */
>> +    while (ivpu_hw_reg_ipc_rx_count_get(vdev)) {
>> +        u32 vpu_addr = ivpu_hw_reg_ipc_rx_addr_get(vdev);
>> +        bool dispatched = false;
>> +
>> +        ipc_hdr = ivpu_to_cpu_addr(ipc->mem_rx, vpu_addr);
>> +        if (!ipc_hdr) {
>> +            if (vpu_addr == REG_IO_ERROR) {
>> +                ivpu_err(vdev, "Failed to read IPC message\n");
>> +                return IRQ_NONE;
>> +            }
>> +            ivpu_warn(vdev, "IPC message 0x%x out of range\n", vpu_addr);
>> +            continue;
>> +        }
>> +        ivpu_ipc_msg_dump(vdev, "RX", ipc_hdr, vpu_addr);
>> +
>> +        jsm_msg = NULL;
>> +        if (ipc_hdr->channel != IVPU_IPC_CHAN_BOOT_MSG) {
>> +            jsm_msg = ivpu_to_cpu_addr(ipc->mem_rx, ipc_hdr->data_addr);
>> +
>> +            if (!jsm_msg) {
>> +                ivpu_warn(vdev, "JSM message 0x%x out of range\n",
>> +                      ipc_hdr->data_addr);
>> +                ivpu_ipc_rx_mark_free(vdev, ipc_hdr, NULL);
>> +                continue;
>> +            }
>> +
>> +            ivpu_jsm_msg_dump(vdev, "RX", jsm_msg, ipc_hdr->data_addr);
>> +        }
>> +
>> +        spin_lock_irqsave(&ipc->cons_list_lock, f);
>> +        list_for_each_entry(cons, &ipc->cons_list, link) {
>> +            if (ivpu_ipc_dispatch(vdev, cons, ipc_hdr, jsm_msg)) {
> 
> I did not fully understand how the IPC is supposed to work. Within the dispatch function, there's a call to wake_up_all(), which indicates that there are multiple waiters. But I can see only one consumer per queue.

Yeah, wake_up_all() is not needed here. I will change it to wake_up().

> But with only one consumer per wait queue, why is there a shared list of IPC messages? Wouldn't it be better to have a single wait queue for all consumers, or have separate message lists for consumers?

The messages are not shared, they are private for each consumer. I've cleaned up the use of locks so it should be more readable now.

Rgards,
Jacek

