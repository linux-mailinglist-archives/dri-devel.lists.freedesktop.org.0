Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B969D65BE74
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jan 2023 11:54:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECBD110E253;
	Tue,  3 Jan 2023 10:54:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C67E110E253
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jan 2023 10:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672743256; x=1704279256;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=wfsI3dyF5HljALUjV0mihciT/UNsyYdiBi1GSAMT98o=;
 b=l1+bn77rtgIFLKfMF2hXkeR9ZJH3QpUmYK6d/9oeQZAMpCQXJ/KLZ3CL
 Tec8LoTWYaCQZo0ungiOyjQQIPQsswHTT5dgL1WnztenkasYYpU7o/KNU
 lmE/9B7Pr5Ya255Qt1BCtU1fTENB9tXKEIHMyaNKbQCb/LwW4uQdiHZ24
 +GAYIpHhO1t1lD28RMR+d6xX/cY4jCKFjS2RShm+tHd3K38psEXXOza+b
 SEmRkv70n7V/CooMUolcZ9ofQ/Ynrt72Sj75rPRrRKLJlCARS7d6t3NcK
 pCjHp8lzGCs3fDbCUikrNgDwTJhHlhocXwLd0pOlgoTYr1mQ9ZJEZB5Ot w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10578"; a="348855118"
X-IronPort-AV: E=Sophos;i="5.96,296,1665471600"; d="scan'208";a="348855118"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2023 02:54:16 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10578"; a="900139006"
X-IronPort-AV: E=Sophos;i="5.96,296,1665471600"; d="scan'208";a="900139006"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [172.22.250.11])
 ([172.22.250.11])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2023 02:54:14 -0800
Message-ID: <6a65f8bf-924b-a2b7-593b-8b8eb4301d15@linux.intel.com>
Date: Tue, 3 Jan 2023 11:54:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 4/7] accel/ivpu: Add IPC driver and JSM messages
Content-Language: en-US
To: Oded Gabbay <oded.gabbay@gmail.com>
References: <20221208110733.5498-1-jacek.lawrynowicz@linux.intel.com>
 <20221208110733.5498-5-jacek.lawrynowicz@linux.intel.com>
 <CAFCwf10opfQDJme_qw3enzAdav_n=n3QPNoCGXEKE37kV8NOjw@mail.gmail.com>
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <CAFCwf10opfQDJme_qw3enzAdav_n=n3QPNoCGXEKE37kV8NOjw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>,
 quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org,
 stanislaw.gruszka@linux.intel.com, tzimmermann@suse.de,
 andrzej.kacprowski@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 27.12.2022 16:34, Oded Gabbay wrote:
> On Thu, Dec 8, 2022 at 1:08 PM Jacek Lawrynowicz
> <jacek.lawrynowicz@linux.intel.com> wrote:
>>
>> The IPC driver is used to send and receive messages to/from firmware
>> running on the VPU.
>>
>> The only supported IPC message format is Job Submission Model (JSM)
>> defined in vpu_jsm_api.h header.
>>
>> Co-developed-by: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
>> Signed-off-by: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
>> Co-developed-by: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>
>> Signed-off-by: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>
>> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>> ---
>>  drivers/accel/ivpu/Makefile       |   2 +
>>  drivers/accel/ivpu/ivpu_drv.c     |  13 +
>>  drivers/accel/ivpu/ivpu_drv.h     |   2 +
>>  drivers/accel/ivpu/ivpu_hw_mtl.c  |   4 +
>>  drivers/accel/ivpu/ivpu_ipc.c     | 508 +++++++++++++++
>>  drivers/accel/ivpu/ivpu_ipc.h     |  93 +++
>>  drivers/accel/ivpu/ivpu_jsm_msg.c | 170 +++++
>>  drivers/accel/ivpu/ivpu_jsm_msg.h |  23 +
>>  drivers/accel/ivpu/vpu_jsm_api.h  | 999 ++++++++++++++++++++++++++++++
>>  9 files changed, 1814 insertions(+)
>>  create mode 100644 drivers/accel/ivpu/ivpu_ipc.c
>>  create mode 100644 drivers/accel/ivpu/ivpu_ipc.h
>>  create mode 100644 drivers/accel/ivpu/ivpu_jsm_msg.c
>>  create mode 100644 drivers/accel/ivpu/ivpu_jsm_msg.h
>>  create mode 100644 drivers/accel/ivpu/vpu_jsm_api.h
>>
>> diff --git a/drivers/accel/ivpu/Makefile b/drivers/accel/ivpu/Makefile
>> index 1b4b24ebf5ea..1fe3ad6c2c21 100644
>> --- a/drivers/accel/ivpu/Makefile
>> +++ b/drivers/accel/ivpu/Makefile
>> @@ -5,6 +5,8 @@ intel_vpu-y := \
>>         ivpu_drv.o \
>>         ivpu_gem.o \
>>         ivpu_hw_mtl.o \
>> +       ivpu_ipc.o \
>> +       ivpu_jsm_msg.o \
>>         ivpu_mmu.o \
>>         ivpu_mmu_context.o
>>
>> diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
>> index 29e78c5ec7c5..6f289e820cd2 100644
>> --- a/drivers/accel/ivpu/ivpu_drv.c
>> +++ b/drivers/accel/ivpu/ivpu_drv.c
>> @@ -17,6 +17,7 @@
>>  #include "ivpu_drv.h"
>>  #include "ivpu_gem.h"
>>  #include "ivpu_hw.h"
>> +#include "ivpu_ipc.h"
>>  #include "ivpu_mmu.h"
>>  #include "ivpu_mmu_context.h"
>>
>> @@ -230,6 +231,7 @@ int ivpu_shutdown(struct ivpu_device *vdev)
>>         int ret;
>>
>>         ivpu_hw_irq_disable(vdev);
>> +       ivpu_ipc_disable(vdev);
>>         ivpu_mmu_disable(vdev);
>>
>>         ret = ivpu_hw_power_down(vdev);
>> @@ -346,6 +348,10 @@ static int ivpu_dev_init(struct ivpu_device *vdev)
>>         if (!vdev->mmu)
>>                 return -ENOMEM;
>>
>> +       vdev->ipc = drmm_kzalloc(&vdev->drm, sizeof(*vdev->ipc), GFP_KERNEL);
>> +       if (!vdev->ipc)
>> +               return -ENOMEM;
>> +
>>         vdev->hw->ops = &ivpu_hw_mtl_ops;
>>         vdev->platform = IVPU_PLATFORM_INVALID;
>>         vdev->context_xa_limit.min = IVPU_GLOBAL_CONTEXT_MMU_SSID + 1;
>> @@ -390,6 +396,12 @@ static int ivpu_dev_init(struct ivpu_device *vdev)
>>                 goto err_mmu_gctx_fini;
>>         }
>>
>> +       ret = ivpu_ipc_init(vdev);
>> +       if (ret) {
>> +               ivpu_err(vdev, "Failed to initialize IPC: %d\n", ret);
>> +               goto err_mmu_gctx_fini;
>> +       }
>> +
>>         return 0;
>>
>>  err_mmu_gctx_fini:
>> @@ -404,6 +416,7 @@ static int ivpu_dev_init(struct ivpu_device *vdev)
>>  static void ivpu_dev_fini(struct ivpu_device *vdev)
>>  {
>>         ivpu_shutdown(vdev);
>> +       ivpu_ipc_fini(vdev);
>>         ivpu_mmu_global_context_fini(vdev);
>>
>>         drm_WARN_ON(&vdev->drm, !xa_empty(&vdev->context_xa));
>> diff --git a/drivers/accel/ivpu/ivpu_drv.h b/drivers/accel/ivpu/ivpu_drv.h
>> index 69088a03928a..1b9ac8dd8ae7 100644
>> --- a/drivers/accel/ivpu/ivpu_drv.h
>> +++ b/drivers/accel/ivpu/ivpu_drv.h
>> @@ -74,6 +74,7 @@ struct ivpu_wa_table {
>>
>>  struct ivpu_hw_info;
>>  struct ivpu_mmu_info;
>> +struct ivpu_ipc_info;
>>
>>  struct ivpu_device {
>>         struct drm_device drm;
>> @@ -85,6 +86,7 @@ struct ivpu_device {
>>         struct ivpu_wa_table wa;
>>         struct ivpu_hw_info *hw;
>>         struct ivpu_mmu_info *mmu;
>> +       struct ivpu_ipc_info *ipc;
>>
>>         struct ivpu_mmu_context gctx;
>>         struct xarray context_xa;
>> diff --git a/drivers/accel/ivpu/ivpu_hw_mtl.c b/drivers/accel/ivpu/ivpu_hw_mtl.c
>> index 39350203452d..fb2b79daabfc 100644
>> --- a/drivers/accel/ivpu/ivpu_hw_mtl.c
>> +++ b/drivers/accel/ivpu/ivpu_hw_mtl.c
>> @@ -7,6 +7,7 @@
>>  #include "ivpu_hw_mtl_reg.h"
>>  #include "ivpu_hw_reg_io.h"
>>  #include "ivpu_hw.h"
>> +#include "ivpu_ipc.h"
>>  #include "ivpu_mmu.h"
>>
>>  #define TILE_FUSE_ENABLE_BOTH       0x0
>> @@ -934,6 +935,9 @@ static u32 ivpu_hw_mtl_irqv_handler(struct ivpu_device *vdev, int irq)
>>         if (REG_TEST_FLD(MTL_VPU_HOST_SS_ICB_STATUS_0, MMU_IRQ_0_INT, status))
>>                 ivpu_mmu_irq_evtq_handler(vdev);
>>
>> +       if (REG_TEST_FLD(MTL_VPU_HOST_SS_ICB_STATUS_0, HOST_IPC_FIFO_INT, status))
>> +               ivpu_ipc_irq_handler(vdev);
>> +
>>         if (REG_TEST_FLD(MTL_VPU_HOST_SS_ICB_STATUS_0, MMU_IRQ_1_INT, status))
>>                 ivpu_dbg(vdev, IRQ, "MMU sync complete\n");
>>
>> diff --git a/drivers/accel/ivpu/ivpu_ipc.c b/drivers/accel/ivpu/ivpu_ipc.c
>> new file mode 100644
>> index 000000000000..4bcf3c827235
>> --- /dev/null
>> +++ b/drivers/accel/ivpu/ivpu_ipc.c
>> @@ -0,0 +1,508 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (C) 2020-2022 Intel Corporation
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
>> +#define IPC_MAX_RX_MSG 128
>> +#define IS_KTHREAD()   (get_current()->flags & PF_KTHREAD)
>> +
>> +struct ivpu_ipc_tx_buf {
>> +       struct ivpu_ipc_hdr ipc;
>> +       struct vpu_jsm_msg jsm;
>> +};
>> +
>> +struct ivpu_ipc_rx_msg {
>> +       struct list_head link;
>> +       struct ivpu_ipc_hdr *ipc_hdr;
>> +       struct vpu_jsm_msg *jsm_msg;
>> +};
>> +
>> +static void ivpu_ipc_msg_dump(struct ivpu_device *vdev, char *c,
>> +                             struct ivpu_ipc_hdr *ipc_hdr, u32 vpu_addr)
>> +{
>> +       ivpu_dbg(vdev, IPC,
>> +                "%s: vpu:0x%x (data_addr:0x%08x, data_size:0x%x, channel:0x%x, src_node:0x%x, dst_node:0x%x, status:0x%x)",
>> +                c, vpu_addr, ipc_hdr->data_addr, ipc_hdr->data_size, ipc_hdr->channel,
>> +                ipc_hdr->src_node, ipc_hdr->dst_node, ipc_hdr->status);
>> +}
>> +
>> +static void ivpu_jsm_msg_dump(struct ivpu_device *vdev, char *c,
>> +                             struct vpu_jsm_msg *jsm_msg, u32 vpu_addr)
>> +{
>> +       u32 *payload = (u32 *)&jsm_msg->payload;
>> +
>> +       ivpu_dbg(vdev, JSM,
>> +                "%s: vpu:0x%08x (type:0x%x, status:0x%x, id: 0x%x, result: 0x%x, payload:0x%x 0x%x 0x%x 0x%x 0x%x)\n",
>> +                c, vpu_addr, jsm_msg->type, jsm_msg->status, jsm_msg->request_id, jsm_msg->result,
>> +                payload[0], payload[1], payload[2], payload[3], payload[4]);
>> +}
>> +
>> +static void
>> +ivpu_ipc_rx_mark_free(struct ivpu_device *vdev, struct ivpu_ipc_hdr *ipc_hdr,
>> +                     struct vpu_jsm_msg *jsm_msg)
>> +{
>> +       ipc_hdr->status = IVPU_IPC_HDR_FREE;
>> +       if (jsm_msg)
>> +               jsm_msg->status = VPU_JSM_MSG_FREE;
>> +       wmb(); /* Flush WC buffers for message statuses */
>> +}
>> +
>> +static void ivpu_ipc_mem_fini(struct ivpu_device *vdev)
>> +{
>> +       struct ivpu_ipc_info *ipc = vdev->ipc;
>> +
>> +       ivpu_bo_free_internal(ipc->mem_rx);
>> +       ivpu_bo_free_internal(ipc->mem_tx);
>> +}
>> +
>> +static int
>> +ivpu_ipc_tx_prepare(struct ivpu_device *vdev, struct ivpu_ipc_consumer *cons,
>> +                   struct vpu_jsm_msg *req)
>> +{
>> +       struct ivpu_ipc_info *ipc = vdev->ipc;
>> +       struct ivpu_ipc_tx_buf *tx_buf;
>> +       u32 tx_buf_vpu_addr;
>> +       u32 jsm_vpu_addr;
>> +
>> +       tx_buf_vpu_addr = gen_pool_alloc(ipc->mm_tx, sizeof(*tx_buf));
>> +       if (!tx_buf_vpu_addr) {
>> +               ivpu_err(vdev, "Failed to reserve IPC buffer, size %ld\n",
>> +                        sizeof(*tx_buf));
>> +               return -ENOMEM;
>> +       }
>> +
>> +       tx_buf = ivpu_to_cpu_addr(ipc->mem_tx, tx_buf_vpu_addr);
>> +       if (drm_WARN_ON(&vdev->drm, !tx_buf)) {
>> +               gen_pool_free(ipc->mm_tx, tx_buf_vpu_addr, sizeof(*tx_buf));
>> +               return -EIO;
>> +       }
>> +
>> +       jsm_vpu_addr = tx_buf_vpu_addr + offsetof(struct ivpu_ipc_tx_buf, jsm);
>> +
>> +       if (tx_buf->ipc.status != IVPU_IPC_HDR_FREE)
>> +               ivpu_warn(vdev, "IPC message vpu:0x%x not released by firmware\n",
>> +                         tx_buf_vpu_addr);
>> +
>> +       if (tx_buf->jsm.status != VPU_JSM_MSG_FREE)
>> +               ivpu_warn(vdev, "JSM message vpu:0x%x not released by firmware\n",
>> +                         jsm_vpu_addr);
>> +
>> +       memset(tx_buf, 0, sizeof(*tx_buf));
>> +       tx_buf->ipc.data_addr = jsm_vpu_addr;
>> +       /* TODO: Set data_size to actual JSM message size, not union of all messages */
>> +       tx_buf->ipc.data_size = sizeof(*req);
>> +       tx_buf->ipc.channel = cons->channel;
>> +       tx_buf->ipc.src_node = 0;
>> +       tx_buf->ipc.dst_node = 1;
>> +       tx_buf->ipc.status = IVPU_IPC_HDR_ALLOCATED;
>> +       tx_buf->jsm.type = req->type;
>> +       tx_buf->jsm.status = VPU_JSM_MSG_ALLOCATED;
>> +       tx_buf->jsm.payload = req->payload;
>> +
>> +       req->request_id = atomic_inc_return(&ipc->request_id);
>> +       tx_buf->jsm.request_id = req->request_id;
>> +       cons->request_id = req->request_id;
>> +       wmb(); /* Flush WC buffers for IPC, JSM msgs */
>> +
>> +       cons->tx_vpu_addr = tx_buf_vpu_addr;
>> +
>> +       ivpu_jsm_msg_dump(vdev, "TX", &tx_buf->jsm, jsm_vpu_addr);
>> +       ivpu_ipc_msg_dump(vdev, "TX", &tx_buf->ipc, tx_buf_vpu_addr);
>> +
>> +       return 0;
>> +}
>> +
>> +static void ivpu_ipc_tx_release(struct ivpu_device *vdev, u32 vpu_addr)
>> +{
>> +       struct ivpu_ipc_info *ipc = vdev->ipc;
>> +
>> +       if (vpu_addr)
>> +               gen_pool_free(ipc->mm_tx, vpu_addr, sizeof(struct ivpu_ipc_tx_buf));
>> +}
>> +
>> +static void ivpu_ipc_tx(struct ivpu_device *vdev, u32 vpu_addr)
>> +{
>> +       ivpu_hw_reg_ipc_tx_set(vdev, vpu_addr);
>> +}
>> +
>> +void
>> +ivpu_ipc_consumer_add(struct ivpu_device *vdev, struct ivpu_ipc_consumer *cons, u32 channel)
>> +{
>> +       struct ivpu_ipc_info *ipc = vdev->ipc;
>> +
>> +       INIT_LIST_HEAD(&cons->link);
>> +       cons->channel = channel;
>> +       cons->tx_vpu_addr = 0;
>> +       cons->request_id = 0;
>> +       spin_lock_init(&cons->rx_msg_lock);
>> +       INIT_LIST_HEAD(&cons->rx_msg_list);
>> +       init_waitqueue_head(&cons->rx_msg_wq);
>> +
>> +       spin_lock_irq(&ipc->cons_list_lock);
>> +       list_add_tail(&cons->link, &ipc->cons_list);
>> +       spin_unlock_irq(&ipc->cons_list_lock);
>> +}
>> +
>> +void ivpu_ipc_consumer_del(struct ivpu_device *vdev, struct ivpu_ipc_consumer *cons)
>> +{
>> +       struct ivpu_ipc_info *ipc = vdev->ipc;
>> +       struct ivpu_ipc_rx_msg *rx_msg, *r;
>> +
>> +       spin_lock_irq(&ipc->cons_list_lock);
>> +       list_del(&cons->link);
>> +       spin_unlock_irq(&ipc->cons_list_lock);
>> +
>> +       spin_lock_irq(&cons->rx_msg_lock);
>> +       list_for_each_entry_safe(rx_msg, r, &cons->rx_msg_list, link) {
>> +               list_del(&rx_msg->link);
>> +               ivpu_ipc_rx_mark_free(vdev, rx_msg->ipc_hdr, rx_msg->jsm_msg);
>> +               atomic_dec(&ipc->rx_msg_count);
>> +               kfree(rx_msg);
>> +       }
>> +       spin_unlock_irq(&cons->rx_msg_lock);
>> +
>> +       ivpu_ipc_tx_release(vdev, cons->tx_vpu_addr);
>> +}
>> +
>> +static int
>> +ivpu_ipc_send(struct ivpu_device *vdev, struct ivpu_ipc_consumer *cons, struct vpu_jsm_msg *req)
>> +{
>> +       struct ivpu_ipc_info *ipc = vdev->ipc;
>> +       int ret;
>> +
>> +       ret = mutex_lock_interruptible(&ipc->lock);
>> +       if (ret)
>> +               return ret;
>> +
>> +       if (!ipc->on) {
>> +               ret = -EAGAIN;
>> +               goto unlock;
>> +       }
>> +
>> +       ret = ivpu_ipc_tx_prepare(vdev, cons, req);
>> +       if (ret)
>> +               goto unlock;
>> +
>> +       ivpu_ipc_tx(vdev, cons->tx_vpu_addr);
>> +
>> +unlock:
>> +       mutex_unlock(&ipc->lock);
>> +       return ret;
>> +}
>> +
>> +int ivpu_ipc_receive(struct ivpu_device *vdev, struct ivpu_ipc_consumer *cons,
>> +                    struct ivpu_ipc_hdr *ipc_buf,
>> +                    struct vpu_jsm_msg *ipc_payload, unsigned long timeout_ms)
>> +{
>> +       struct ivpu_ipc_info *ipc = vdev->ipc;
>> +       struct ivpu_ipc_rx_msg *rx_msg;
>> +       int wait_ret, ret = 0;
>> +
>> +       wait_ret = wait_event_interruptible_timeout(cons->rx_msg_wq,
>> +                                                   (IS_KTHREAD() && kthread_should_stop()) ||
>> +                                                   !list_empty(&cons->rx_msg_list),
>> +                                                   msecs_to_jiffies(timeout_ms));
>> +
>> +       if (IS_KTHREAD() && kthread_should_stop())
>> +               return -EINTR;
>> +
>> +       if (wait_ret == 0)
>> +               return -ETIMEDOUT;
>> +
>> +       if (wait_ret < 0)
>> +               return -ERESTARTSYS;
>> +
>> +       spin_lock_irq(&cons->rx_msg_lock);
>> +       rx_msg = list_first_entry_or_null(&cons->rx_msg_list, struct ivpu_ipc_rx_msg, link);
>> +       if (!rx_msg) {
>> +               spin_unlock_irq(&cons->rx_msg_lock);
>> +               return -EAGAIN;
>> +       }
>> +       list_del(&rx_msg->link);
>> +       spin_unlock_irq(&cons->rx_msg_lock);
>> +
>> +       if (ipc_buf)
>> +               memcpy(ipc_buf, rx_msg->ipc_hdr, sizeof(*ipc_buf));
>> +       if (rx_msg->jsm_msg) {
>> +               u32 size = min_t(int, rx_msg->ipc_hdr->data_size, sizeof(*ipc_payload));
>> +
>> +               if (rx_msg->jsm_msg->result != VPU_JSM_STATUS_SUCCESS) {
>> +                       ivpu_dbg(vdev, IPC, "IPC resp result error: %d\n", rx_msg->jsm_msg->result);
>> +                       ret = -EBADMSG;
>> +               }
>> +
>> +               if (ipc_payload)
>> +                       memcpy(ipc_payload, rx_msg->jsm_msg, size);
>> +       }
>> +
>> +       ivpu_ipc_rx_mark_free(vdev, rx_msg->ipc_hdr, rx_msg->jsm_msg);
>> +       atomic_dec(&ipc->rx_msg_count);
>> +       kfree(rx_msg);
>> +
>> +       return ret;
>> +}
>> +
>> +static int
>> +ivpu_ipc_send_receive_internal(struct ivpu_device *vdev, struct vpu_jsm_msg *req,
>> +                              enum vpu_ipc_msg_type expected_resp_type,
>> +                              struct vpu_jsm_msg *resp, u32 channel,
>> +                              unsigned long timeout_ms)
>> +{
>> +       struct ivpu_ipc_consumer cons;
>> +       int ret;
>> +
>> +       ivpu_ipc_consumer_add(vdev, &cons, channel);
>> +
>> +       ret = ivpu_ipc_send(vdev, &cons, req);
>> +       if (ret) {
>> +               ivpu_warn(vdev, "IPC send failed: %d\n", ret);
>> +               goto consumer_del;
>> +       }
>> +
>> +       ret = ivpu_ipc_receive(vdev, &cons, NULL, resp, timeout_ms);
>> +       if (ret) {
>> +               ivpu_warn(vdev, "IPC receive failed: type 0x%x, ret %d\n", req->type, ret);
>> +               goto consumer_del;
>> +       }
>> +
>> +       if (resp->type != expected_resp_type) {
>> +               ivpu_warn(vdev, "Invalid JSM response type: 0x%x\n", resp->type);
>> +               ret = -EBADE;
>> +       }
>> +
>> +consumer_del:
>> +       ivpu_ipc_consumer_del(vdev, &cons);
>> +       return ret;
>> +}
>> +
>> +int ivpu_ipc_send_receive(struct ivpu_device *vdev, struct vpu_jsm_msg *req,
>> +                         enum vpu_ipc_msg_type expected_resp_type,
>> +                         struct vpu_jsm_msg *resp, u32 channel,
>> +                         unsigned long timeout_ms)
>> +{
>> +       struct vpu_jsm_msg hb_req = { .type = VPU_JSM_MSG_QUERY_ENGINE_HB };
>> +       struct vpu_jsm_msg hb_resp;
>> +       int ret;
>> +
>> +       ret = ivpu_rpm_get(vdev);
>> +       if (ret < 0)
>> +               return ret;
>> +
>> +       ret = ivpu_ipc_send_receive_internal(vdev, req, expected_resp_type, resp,
>> +                                            channel, timeout_ms);
>> +       if (ret != -ETIMEDOUT)
>> +               goto rpm_put;
>> +
>> +       ret = ivpu_ipc_send_receive_internal(vdev, &hb_req, VPU_JSM_MSG_QUERY_ENGINE_HB_DONE,
>> +                                            &hb_resp, VPU_IPC_CHAN_ASYNC_CMD, vdev->timeout.jsm);
>> +       if (ret == -ETIMEDOUT)
>> +               ivpu_hw_diagnose_failure(vdev);
>> +
>> +rpm_put:
>> +       ivpu_rpm_put(vdev);
>> +       return ret;
>> +}
>> +
>> +static bool
>> +ivpu_ipc_match_consumer(struct ivpu_device *vdev, struct ivpu_ipc_consumer *cons,
>> +                       struct ivpu_ipc_hdr *ipc_hdr, struct vpu_jsm_msg *jsm_msg)
>> +{
>> +       if (cons->channel != ipc_hdr->channel)
>> +               return false;
>> +
>> +       if (!jsm_msg || jsm_msg->request_id == cons->request_id)
>> +               return true;
>> +
>> +       return false;
>> +}
>> +
>> +static bool
>> +ivpu_ipc_dispatch(struct ivpu_device *vdev, struct ivpu_ipc_consumer *cons,
>> +                 struct ivpu_ipc_hdr *ipc_hdr, struct vpu_jsm_msg *jsm_msg)
>> +{
>> +       struct ivpu_ipc_info *ipc = vdev->ipc;
>> +       struct ivpu_ipc_rx_msg *rx_msg;
>> +       unsigned long flags;
>> +
>> +       lockdep_assert_held(&ipc->cons_list_lock);
>> +
>> +       if (!ivpu_ipc_match_consumer(vdev, cons, ipc_hdr, jsm_msg))
>> +               return false;
>> +
>> +       rx_msg = kzalloc(sizeof(*rx_msg), GFP_ATOMIC);
>> +       if (!rx_msg) {
>> +               ivpu_ipc_rx_mark_free(vdev, ipc_hdr, jsm_msg);
>> +               return true;
> Isn't this supposed to be false ?

ivpu_ipc_dispatch() returns true if the consumer was matched and not really if dispatch was successful.
I will move ivpu_ipc_match_consumer() outside this function and ivpu_ipc_dispatch() then will be void.
The code should be more readable then.

>> +       }
>> +
>> +       atomic_inc(&ipc->rx_msg_count);
>> +
>> +       rx_msg->ipc_hdr = ipc_hdr;
>> +       rx_msg->jsm_msg = jsm_msg;
>> +
>> +       spin_lock_irqsave(&cons->rx_msg_lock, flags);
>> +       list_add_tail(&rx_msg->link, &cons->rx_msg_list);
>> +       spin_unlock_irqrestore(&cons->rx_msg_lock, flags);
>> +
>> +       wake_up(&cons->rx_msg_wq);
>> +       return true;
>> +}
>> +
>> +int ivpu_ipc_irq_handler(struct ivpu_device *vdev)
> No one checks the return value, so please change this to void or check
> the return value

The return value is checked in the next patch in ivpu_wait_for_ready() function.

Regards,
Jacek
