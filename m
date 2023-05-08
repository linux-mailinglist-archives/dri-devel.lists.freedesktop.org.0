Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A1F6F9F60
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 08:02:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5718D10E0A7;
	Mon,  8 May 2023 06:02:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-50.mta1.migadu.com (out-50.mta1.migadu.com [95.215.58.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FE3310E0A7
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 06:02:34 +0000 (UTC)
Date: Mon, 8 May 2023 14:02:24 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1683525748;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4XCjKPWw87amv/SWPant+1dma5UGLkCTw8zSGY3QUSo=;
 b=YPW75G8+tYIV1N3p4+jYePZfrIj3Fpln4PXw+AfVDpFuiSa/WgrgvBieG3wU19FjFUKddq
 lkos9C9fBGzbo1B1t8IOv8k79lf6wQVrwPC/HYEQpVAOUPSuG1706NLTbQRzns+vERvth2
 4UVl+yt0iO2NXQ1fMtETY1Kgf6N8sfg=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Cai Huoqing <cai.huoqing@linux.dev>
To: Oded Gabbay <ogabbay@kernel.org>
Subject: Re: [PATCH v2] accel/habanalabs: Make use of rhashtable
Message-ID: <ZFiQcO5hRFJznsTq@chq-MS-7D45>
References: <20230428144903.26048-1-cai.huoqing@linux.dev>
 <CAFCwf13cqApEckT89kJdtNZppMNjDVJQtOCL_3hchY7oYDvrUQ@mail.gmail.com>
 <ZFMfu7BuMXdNReLy@chq-MS-7D45>
 <CAFCwf13zp78dKKAU+KcWs+4jC+jdd5dU8n8N0NfHg+AXOGR5aw@mail.gmail.com>
 <ZFYdCgWi9Io+bdvv@chq-MS-7D45>
 <CAFCwf13Pb-eRU=KuKS4eN87p6VnGivH71On3S4QW2U=JJJJFMA@mail.gmail.com>
 <ZFiIiwbyHi+dU3hm@chq-MS-7D45>
 <CAFCwf13m305vN9nAeYjNQYED-AMsuJN+_moEMjXVpYm0naC71g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFCwf13m305vN9nAeYjNQYED-AMsuJN+_moEMjXVpYm0naC71g@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ohad Sharabi <osharabi@habana.ai>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08 5月 23 08:33:02, Oded Gabbay wrote:
> On Mon, May 8, 2023 at 8:28 AM Cai Huoqing <cai.huoqing@linux.dev> wrote:
> >
> > On 07 5月 23 16:17:55, Oded Gabbay wrote:
> > > On Sat, May 6, 2023 at 12:25 PM Cai Huoqing <cai.huoqing@linux.dev> wrote:
> > > >
> > > > On 04 5月 23 09:12:40, Oded Gabbay wrote:
> > > > > On Thu, May 4, 2023 at 6:00 AM Cai Huoqing <cai.huoqing@linux.dev> wrote:
> > > > > >
> > > > > > On 30 4月 23 09:36:29, Oded Gabbay wrote:
> > > > > > > On Fri, Apr 28, 2023 at 5:49 PM Cai Huoqing <cai.huoqing@linux.dev> wrote:
> > > > > > > >
> > > > > > > > Using rhashtable to accelerate the search for userptr by address,
> > > > > > > > instead of using a list.
> > > > > > > >
> > > > > > > > Preferably, the lookup complexity of a hash table is O(1).
> > > > > > > >
> > > > > > > > This patch will speedup the method
> > > > > > > > hl_userptr_is_pinned by rhashtable_lookup_fast.
> > > > > > > >
> > > > > > > > Signed-off-by: Cai Huoqing <cai.huoqing@linux.dev>
> > > > > > >
> > > > > > > Thanks for the patch, but the reason we never optimized this path is
> > > > > > > because this code path is only relevant for Goya, which we don't want
> > > > > > > to change the code for anymore.
> > > > > > > For Gaudi we don't pin the memory in the host during submission. It is
> > > > > > > done much earlier, when the user maps the memory to the device. The
> > > > > > > code path in Gaudi is only in case the device is loaded with its MMU
> > > > > > > disabled. This mode was used only for debug/bring-up of the ASIC many
> > > > > > > years ago. As you can see in Gaudi2, that mode was dropped even for
> > > > > >
> > > > > > Do you mean that the userspace directly call HL_MEM_OP_MAP/HL_MEM_OP_UNMAP
> > > > > > with a flag HL_MEM_USERPTR instead of pin host mem in submissmion?
> > > > > Yes, correct.
> > > >
> > > > BTW,
> > > >
> > > > Another question,
> > > >
> > > > I found the PMMU in the driver code, does it support for like CudaHostAlloc
> > > > and hostMap?
> > > In Habana, you allocate host memory by yourself, not through the
> > > driver. Just do malloc in your application.
> > > Then you need to map it to the device to get a virtual address that
> > > the device is familiar with.
> > > This is done by calling the MEMORY ioctl with the MAP opcode.
> > >
> > > >
> > > > gaudi seems can access host memory by pcie, some kernel can compute data
> > > > in host directly, right?
> > > In theory, yes. However, we don't do that. We move data into the HBM
> > > and then the kernels work on the data.
> > > Oded
> > Agree, but What is the purpose of designing pmmu,
> > do you think using the pagetable in PMMU can speed up memcpy
> > H2D/D2H  or some memory notity between CPU and device ?
> 
> Without pmmu, you will have to allocate dmable memory in the host,
> which will have to be physical contiguous memory.
> That means the user can't use malloc to do it, but he must call the
> driver (so it can call dma_alloc_coherent or similar), which is bad.
> And the amount of that memory is limited, which is also bad.
Agree, but without pmmu, KMD also can use host_register-ioctl to get
cpu_vaddr and pin it, then access host physical non-contiguous memory.
However if Habana only use map/unmap_device, pmmu is needed.

Thanks,
Cai-

> 
> With PMMU, you can map any host virtual memory space, which is backed
> by non-contiguous physical pages, to a device virtual address.
> 
> Oded
> >
> > Thanks
> > Cai-
> >
> > > >
> > > > But accessing via PCIE(64GB/s), compared to accessing HBM(3T/s),
> > > > has too low bandwidth.
> > > >
> > > > for nvidia, it has NVLINK.
> > > >
> > > > Thank,
> > > > Cai-
> > > >
> > > > >
> > > > > >
> > > > > > > debug/bring-up.
> > > > > > >
> > > > > > > Therefore, I prefer not to take this patch as validation for both
> > > > > > > functionality and performance will take time which will be better
> > > > > > > spent elsewhere.
> > > > > > >
> > > > > > > Thanks,
> > > > > > > Oded
> > > > > > >
> > > > > > > > ---
> > > > > > > > v1->v2:
> > > > > > > > Use rhashtable_free_and_destroy in hl_userptr_delete_list.
> > > > > > > >
> > > > > > > >  .../habanalabs/common/command_submission.c    | 16 ++++++--
> > > > > > > >  drivers/accel/habanalabs/common/habanalabs.h  | 19 +++++----
> > > > > > > >  drivers/accel/habanalabs/common/memory.c      | 39 +++++++++++--------
> > > > > > > >  drivers/accel/habanalabs/gaudi/gaudi.c        | 16 +++++---
> > > > > > > >  drivers/accel/habanalabs/goya/goya.c          | 14 ++++---
> > > > > > > >  5 files changed, 65 insertions(+), 39 deletions(-)
> > > > > > > >
> > > > > > > > diff --git a/drivers/accel/habanalabs/common/command_submission.c b/drivers/accel/habanalabs/common/command_submission.c
> > > > > > > > index af9d2e22c6e7..35c2ab934396 100644
> > > > > > > > --- a/drivers/accel/habanalabs/common/command_submission.c
> > > > > > > > +++ b/drivers/accel/habanalabs/common/command_submission.c
> > > > > > > > @@ -312,7 +312,7 @@ static int cs_parser(struct hl_fpriv *hpriv, struct hl_cs_job *job)
> > > > > > > >         parser.job_id = job->id;
> > > > > > > >
> > > > > > > >         parser.hw_queue_id = job->hw_queue_id;
> > > > > > > > -       parser.job_userptr_list = &job->userptr_list;
> > > > > > > > +       parser.job_userptr_ht = &job->userptr_ht;
> > > > > > > >         parser.patched_cb = NULL;
> > > > > > > >         parser.user_cb = job->user_cb;
> > > > > > > >         parser.user_cb_size = job->user_cb_size;
> > > > > > > > @@ -351,7 +351,7 @@ static void hl_complete_job(struct hl_device *hdev, struct hl_cs_job *job)
> > > > > > > >         struct hl_cs *cs = job->cs;
> > > > > > > >
> > > > > > > >         if (is_cb_patched(hdev, job)) {
> > > > > > > > -               hl_userptr_delete_list(hdev, &job->userptr_list);
> > > > > > > > +               hl_userptr_delete_list(hdev, &job->userptr_ht);
> > > > > > > >
> > > > > > > >                 /*
> > > > > > > >                  * We might arrive here from rollback and patched CB wasn't
> > > > > > > > @@ -1284,6 +1284,7 @@ struct hl_cs_job *hl_cs_allocate_job(struct hl_device *hdev,
> > > > > > > >                 enum hl_queue_type queue_type, bool is_kernel_allocated_cb)
> > > > > > > >  {
> > > > > > > >         struct hl_cs_job *job;
> > > > > > > > +       int rc;
> > > > > > > >
> > > > > > > >         job = kzalloc(sizeof(*job), GFP_ATOMIC);
> > > > > > > >         if (!job)
> > > > > > > > @@ -1296,13 +1297,20 @@ struct hl_cs_job *hl_cs_allocate_job(struct hl_device *hdev,
> > > > > > > >         job->queue_type = queue_type;
> > > > > > > >         job->is_kernel_allocated_cb = is_kernel_allocated_cb;
> > > > > > > >
> > > > > > > > -       if (is_cb_patched(hdev, job))
> > > > > > > > -               INIT_LIST_HEAD(&job->userptr_list);
> > > > > > > > +       if (is_cb_patched(hdev, job)) {
> > > > > > > > +               rc = rhashtable_init(&job->userptr_ht, &hl_userptr_rht_params);
> > > > > > > > +               if (rc)
> > > > > > > > +                       goto free_job;
> > > > > > > > +       }
> > > > > > > >
> > > > > > > >         if (job->queue_type == QUEUE_TYPE_EXT)
> > > > > > > >                 INIT_WORK(&job->finish_work, job_wq_completion);
> > > > > > > >
> > > > > > > >         return job;
> > > > > > > > +
> > > > > > > > +free_job:
> > > > > > > > +       kfree(job);
> > > > > > > > +       return NULL;
> > > > > > > >  }
> > > > > > > >
> > > > > > > >  static enum hl_cs_type hl_cs_get_cs_type(u32 cs_type_flags)
> > > > > > > > diff --git a/drivers/accel/habanalabs/common/habanalabs.h b/drivers/accel/habanalabs/common/habanalabs.h
> > > > > > > > index eaae69a9f817..9c876d1480d2 100644
> > > > > > > > --- a/drivers/accel/habanalabs/common/habanalabs.h
> > > > > > > > +++ b/drivers/accel/habanalabs/common/habanalabs.h
> > > > > > > > @@ -19,6 +19,7 @@
> > > > > > > >  #include <linux/dma-direction.h>
> > > > > > > >  #include <linux/scatterlist.h>
> > > > > > > >  #include <linux/hashtable.h>
> > > > > > > > +#include <linux/rhashtable.h>
> > > > > > > >  #include <linux/debugfs.h>
> > > > > > > >  #include <linux/rwsem.h>
> > > > > > > >  #include <linux/eventfd.h>
> > > > > > > > @@ -540,6 +541,8 @@ struct hl_hints_range {
> > > > > > > >         u64 end_addr;
> > > > > > > >  };
> > > > > > > >
> > > > > > > > +extern const struct rhashtable_params hl_userptr_rht_params;
> > > > > > > > +
> > > > > > > >  /**
> > > > > > > >   * struct asic_fixed_properties - ASIC specific immutable properties.
> > > > > > > >   * @hw_queues_props: H/W queues properties.
> > > > > > > > @@ -1915,7 +1918,7 @@ struct hl_ctx_mgr {
> > > > > > > >  /**
> > > > > > > >   * struct hl_userptr - memory mapping chunk information
> > > > > > > >   * @vm_type: type of the VM.
> > > > > > > > - * @job_node: linked-list node for hanging the object on the Job's list.
> > > > > > > > + * @job_node: hashtable node for hanging the object on the Job's list.
> > > > > > > >   * @pages: pointer to struct page array
> > > > > > > >   * @npages: size of @pages array
> > > > > > > >   * @sgt: pointer to the scatter-gather table that holds the pages.
> > > > > > > > @@ -1928,7 +1931,7 @@ struct hl_ctx_mgr {
> > > > > > > >   */
> > > > > > > >  struct hl_userptr {
> > > > > > > >         enum vm_type            vm_type; /* must be first */
> > > > > > > > -       struct list_head        job_node;
> > > > > > > > +       struct rhash_head       job_node;
> > > > > > > >         struct page             **pages;
> > > > > > > >         unsigned int            npages;
> > > > > > > >         struct sg_table         *sgt;
> > > > > > > > @@ -2028,7 +2031,7 @@ struct hl_cs {
> > > > > > > >   * @patched_cb: in case of patching, this is internal CB which is submitted on
> > > > > > > >   *             the queue instead of the CB we got from the IOCTL.
> > > > > > > >   * @finish_work: workqueue object to run when job is completed.
> > > > > > > > - * @userptr_list: linked-list of userptr mappings that belong to this job and
> > > > > > > > + * @userptr_ht: hashtable of userptr mappings that belong to this job and
> > > > > > > >   *                     wait for completion.
> > > > > > > >   * @debugfs_list: node in debugfs list of command submission jobs.
> > > > > > > >   * @refcount: reference counter for usage of the CS job.
> > > > > > > > @@ -2056,7 +2059,7 @@ struct hl_cs_job {
> > > > > > > >         struct hl_cb            *user_cb;
> > > > > > > >         struct hl_cb            *patched_cb;
> > > > > > > >         struct work_struct      finish_work;
> > > > > > > > -       struct list_head        userptr_list;
> > > > > > > > +       struct rhashtable       userptr_ht;
> > > > > > > >         struct list_head        debugfs_list;
> > > > > > > >         struct kref             refcount;
> > > > > > > >         enum hl_queue_type      queue_type;
> > > > > > > > @@ -2075,7 +2078,7 @@ struct hl_cs_job {
> > > > > > > >   * @user_cb: the CB we got from the user.
> > > > > > > >   * @patched_cb: in case of patching, this is internal CB which is submitted on
> > > > > > > >   *             the queue instead of the CB we got from the IOCTL.
> > > > > > > > - * @job_userptr_list: linked-list of userptr mappings that belong to the related
> > > > > > > > + * @job_userptr_ht: hashtable of userptr mappings that belong to the related
> > > > > > > >   *                     job and wait for completion.
> > > > > > > >   * @cs_sequence: the sequence number of the related CS.
> > > > > > > >   * @queue_type: the type of the H/W queue this job is submitted to.
> > > > > > > > @@ -2098,7 +2101,7 @@ struct hl_cs_job {
> > > > > > > >  struct hl_cs_parser {
> > > > > > > >         struct hl_cb            *user_cb;
> > > > > > > >         struct hl_cb            *patched_cb;
> > > > > > > > -       struct list_head        *job_userptr_list;
> > > > > > > > +       struct rhashtable       *job_userptr_ht;
> > > > > > > >         u64                     cs_sequence;
> > > > > > > >         enum hl_queue_type      queue_type;
> > > > > > > >         u32                     ctx_id;
> > > > > > > > @@ -3760,9 +3763,9 @@ int hl_pin_host_memory(struct hl_device *hdev, u64 addr, u64 size,
> > > > > > > >                         struct hl_userptr *userptr);
> > > > > > > >  void hl_unpin_host_memory(struct hl_device *hdev, struct hl_userptr *userptr);
> > > > > > > >  void hl_userptr_delete_list(struct hl_device *hdev,
> > > > > > > > -                               struct list_head *userptr_list);
> > > > > > > > +                               struct rhashtable *userptr_ht);
> > > > > > > >  bool hl_userptr_is_pinned(struct hl_device *hdev, u64 addr, u32 size,
> > > > > > > > -                               struct list_head *userptr_list,
> > > > > > > > +                               struct rhashtable *userptr_ht,
> > > > > > > >                                 struct hl_userptr **userptr);
> > > > > > > >
> > > > > > > >  int hl_mmu_init(struct hl_device *hdev);
> > > > > > > > diff --git a/drivers/accel/habanalabs/common/memory.c b/drivers/accel/habanalabs/common/memory.c
> > > > > > > > index a7b6a273ce21..fa2104e33639 100644
> > > > > > > > --- a/drivers/accel/habanalabs/common/memory.c
> > > > > > > > +++ b/drivers/accel/habanalabs/common/memory.c
> > > > > > > > @@ -23,6 +23,13 @@ MODULE_IMPORT_NS(DMA_BUF);
> > > > > > > >
> > > > > > > >  #define MEM_HANDLE_INVALID     ULONG_MAX
> > > > > > > >
> > > > > > > > +const struct rhashtable_params hl_userptr_rht_params = {
> > > > > > > > +       .head_offset = offsetof(struct hl_userptr, job_node),
> > > > > > > > +       .key_offset = offsetof(struct hl_userptr, addr),
> > > > > > > > +       .key_len = sizeof(u64),
> > > > > > > > +       .automatic_shrinking = true,
> > > > > > > > +};
> > > > > > > > +
> > > > > > > >  static int allocate_timestamps_buffers(struct hl_fpriv *hpriv,
> > > > > > > >                         struct hl_mem_in *args, u64 *handle);
> > > > > > > >
> > > > > > > > @@ -2483,7 +2490,6 @@ int hl_pin_host_memory(struct hl_device *hdev, u64 addr, u64 size,
> > > > > > > >         userptr->size = size;
> > > > > > > >         userptr->addr = addr;
> > > > > > > >         userptr->dma_mapped = false;
> > > > > > > > -       INIT_LIST_HEAD(&userptr->job_node);
> > > > > > > >
> > > > > > > >         rc = get_user_memory(hdev, addr, size, npages, start, offset,
> > > > > > > >                                 userptr);
> > > > > > > > @@ -2522,32 +2528,32 @@ void hl_unpin_host_memory(struct hl_device *hdev, struct hl_userptr *userptr)
> > > > > > > >         unpin_user_pages_dirty_lock(userptr->pages, userptr->npages, true);
> > > > > > > >         kvfree(userptr->pages);
> > > > > > > >
> > > > > > > > -       list_del(&userptr->job_node);
> > > > > > > > -
> > > > > > > >         sg_free_table(userptr->sgt);
> > > > > > > >         kfree(userptr->sgt);
> > > > > > > >  }
> > > > > > > >
> > > > > > > > +static void hl_userptr_free_cb(void *ptr, void *arg)
> > > > > > > > +{
> > > > > > > > +       struct hl_userptr *userptr = ptr;
> > > > > > > > +       struct hl_device *hdev = (struct hl_device *)arg;
> > > > > > > > +
> > > > > > > > +       hl_unpin_host_memory(hdev, userptr);
> > > > > > > > +       kfree(userptr);
> > > > > > > > +}
> > > > > > > > +
> > > > > > > >  /**
> > > > > > > >   * hl_userptr_delete_list() - clear userptr list.
> > > > > > > >   * @hdev: pointer to the habanalabs device structure.
> > > > > > > > - * @userptr_list: pointer to the list to clear.
> > > > > > > > + * @userptr_ht: pointer to the hashtable to clear.
> > > > > > > >   *
> > > > > > > >   * This function does the following:
> > > > > > > >   * - Iterates over the list and unpins the host memory and frees the userptr
> > > > > > > >   *   structure.
> > > > > > > >   */
> > > > > > > >  void hl_userptr_delete_list(struct hl_device *hdev,
> > > > > > > > -                               struct list_head *userptr_list)
> > > > > > > > +                               struct rhashtable *userptr_ht)
> > > > > > > >  {
> > > > > > > > -       struct hl_userptr *userptr, *tmp;
> > > > > > > > -
> > > > > > > > -       list_for_each_entry_safe(userptr, tmp, userptr_list, job_node) {
> > > > > > > > -               hl_unpin_host_memory(hdev, userptr);
> > > > > > > > -               kfree(userptr);
> > > > > > > > -       }
> > > > > > > > -
> > > > > > > > -       INIT_LIST_HEAD(userptr_list);
> > > > > > > > +       rhashtable_free_and_destroy(userptr_ht, hl_userptr_free_cb, hdev);
> > > > > > > >  }
> > > > > > > >
> > > > > > > >  /**
> > > > > > > > @@ -2555,7 +2561,7 @@ void hl_userptr_delete_list(struct hl_device *hdev,
> > > > > > > >   * @hdev: pointer to the habanalabs device structure.
> > > > > > > >   * @addr: user address to check.
> > > > > > > >   * @size: user block size to check.
> > > > > > > > - * @userptr_list: pointer to the list to clear.
> > > > > > > > + * @userptr_ht: pointer to the hashtable to clear.
> > > > > > > >   * @userptr: pointer to userptr to check.
> > > > > > > >   *
> > > > > > > >   * This function does the following:
> > > > > > > > @@ -2563,10 +2569,11 @@ void hl_userptr_delete_list(struct hl_device *hdev,
> > > > > > > >   *   pinned. If so, returns true, otherwise returns false.
> > > > > > > >   */
> > > > > > > >  bool hl_userptr_is_pinned(struct hl_device *hdev, u64 addr,
> > > > > > > > -                               u32 size, struct list_head *userptr_list,
> > > > > > > > +                               u32 size, struct rhashtable *userptr_ht,
> > > > > > > >                                 struct hl_userptr **userptr)
> > > > > > > >  {
> > > > > > > > -       list_for_each_entry((*userptr), userptr_list, job_node) {
> > > > > > > > +       (*userptr) = rhashtable_lookup_fast(userptr_ht, &addr, hl_userptr_rht_params);
> > > > > > > > +       if (*userptr) {
> > > > > > > >                 if ((addr == (*userptr)->addr) && (size == (*userptr)->size))
> > > > > > > >                         return true;
> > > > > > > >         }
> > > > > > > > diff --git a/drivers/accel/habanalabs/gaudi/gaudi.c b/drivers/accel/habanalabs/gaudi/gaudi.c
> > > > > > > > index a29aa8f7b6f3..1e1433042413 100644
> > > > > > > > --- a/drivers/accel/habanalabs/gaudi/gaudi.c
> > > > > > > > +++ b/drivers/accel/habanalabs/gaudi/gaudi.c
> > > > > > > > @@ -1031,7 +1031,7 @@ static int _gaudi_init_tpc_mem(struct hl_device *hdev,
> > > > > > > >         }
> > > > > > > >
> > > > > > > >  free_job:
> > > > > > > > -       hl_userptr_delete_list(hdev, &job->userptr_list);
> > > > > > > > +       hl_userptr_delete_list(hdev, &job->userptr_ht);
> > > > > > > >         hl_debugfs_remove_job(hdev, job);
> > > > > > > >         kfree(job);
> > > > > > > >         atomic_dec(&cb->cs_cnt);
> > > > > > > > @@ -4901,7 +4901,7 @@ static int gaudi_pin_memory_before_cs(struct hl_device *hdev,
> > > > > > > >         int rc;
> > > > > > > >
> > > > > > > >         if (hl_userptr_is_pinned(hdev, addr, le32_to_cpu(user_dma_pkt->tsize),
> > > > > > > > -                       parser->job_userptr_list, &userptr))
> > > > > > > > +                       parser->job_userptr_ht, &userptr))
> > > > > > > >                 goto already_pinned;
> > > > > > > >
> > > > > > > >         userptr = kzalloc(sizeof(*userptr), GFP_KERNEL);
> > > > > > > > @@ -4913,7 +4913,10 @@ static int gaudi_pin_memory_before_cs(struct hl_device *hdev,
> > > > > > > >         if (rc)
> > > > > > > >                 goto free_userptr;
> > > > > > > >
> > > > > > > > -       list_add_tail(&userptr->job_node, parser->job_userptr_list);
> > > > > > > > +       rc = rhashtable_insert_fast(parser->job_userptr_ht,
> > > > > > > > +                                   &userptr->job_node, hl_userptr_rht_params);
> > > > > > > > +       if (rc)
> > > > > > > > +               goto unpin_memory;
> > > > > > > >
> > > > > > > >         rc = hdev->asic_funcs->asic_dma_map_sgtable(hdev, userptr->sgt, dir);
> > > > > > > >         if (rc) {
> > > > > > > > @@ -4931,7 +4934,8 @@ static int gaudi_pin_memory_before_cs(struct hl_device *hdev,
> > > > > > > >         return 0;
> > > > > > > >
> > > > > > > >  unpin_memory:
> > > > > > > > -       list_del(&userptr->job_node);
> > > > > > > > +       rhashtable_remove_fast(parser->job_userptr_ht,
> > > > > > > > +                              &userptr->job_node, hl_userptr_rht_params);
> > > > > > > >         hl_unpin_host_memory(hdev, userptr);
> > > > > > > >  free_userptr:
> > > > > > > >         kfree(userptr);
> > > > > > > > @@ -5175,7 +5179,7 @@ static int gaudi_patch_dma_packet(struct hl_device *hdev,
> > > > > > > >         if ((!skip_host_mem_pin) &&
> > > > > > > >                 (!hl_userptr_is_pinned(hdev, addr,
> > > > > > > >                                         le32_to_cpu(user_dma_pkt->tsize),
> > > > > > > > -                                       parser->job_userptr_list, &userptr))) {
> > > > > > > > +                                       parser->job_userptr_ht, &userptr))) {
> > > > > > > >                 dev_err(hdev->dev, "Userptr 0x%llx + 0x%x NOT mapped\n",
> > > > > > > >                                 addr, user_dma_pkt->tsize);
> > > > > > > >                 return -EFAULT;
> > > > > > > > @@ -5472,7 +5476,7 @@ static int gaudi_parse_cb_no_mmu(struct hl_device *hdev,
> > > > > > > >
> > > > > > > >  free_userptr:
> > > > > > > >         if (rc)
> > > > > > > > -               hl_userptr_delete_list(hdev, parser->job_userptr_list);
> > > > > > > > +               hl_userptr_delete_list(hdev, parser->job_userptr_ht);
> > > > > > > >         return rc;
> > > > > > > >  }
> > > > > > > >
> > > > > > > > diff --git a/drivers/accel/habanalabs/goya/goya.c b/drivers/accel/habanalabs/goya/goya.c
> > > > > > > > index fb0ac9df841a..bfcbb9e8b126 100644
> > > > > > > > --- a/drivers/accel/habanalabs/goya/goya.c
> > > > > > > > +++ b/drivers/accel/habanalabs/goya/goya.c
> > > > > > > > @@ -3347,7 +3347,7 @@ static int goya_pin_memory_before_cs(struct hl_device *hdev,
> > > > > > > >         int rc;
> > > > > > > >
> > > > > > > >         if (hl_userptr_is_pinned(hdev, addr, le32_to_cpu(user_dma_pkt->tsize),
> > > > > > > > -                       parser->job_userptr_list, &userptr))
> > > > > > > > +                       parser->job_userptr_ht, &userptr))
> > > > > > > >                 goto already_pinned;
> > > > > > > >
> > > > > > > >         userptr = kzalloc(sizeof(*userptr), GFP_KERNEL);
> > > > > > > > @@ -3359,7 +3359,10 @@ static int goya_pin_memory_before_cs(struct hl_device *hdev,
> > > > > > > >         if (rc)
> > > > > > > >                 goto free_userptr;
> > > > > > > >
> > > > > > > > -       list_add_tail(&userptr->job_node, parser->job_userptr_list);
> > > > > > > > +       rc = rhashtable_insert_fast(parser->job_userptr_ht,
> > > > > > > > +                                   &userptr->job_node, hl_userptr_rht_params);
> > > > > > > > +       if (rc)
> > > > > > > > +               goto unpin_memory;
> > > > > > > >
> > > > > > > >         rc = hdev->asic_funcs->asic_dma_map_sgtable(hdev, userptr->sgt, dir);
> > > > > > > >         if (rc) {
> > > > > > > > @@ -3377,7 +3380,8 @@ static int goya_pin_memory_before_cs(struct hl_device *hdev,
> > > > > > > >         return 0;
> > > > > > > >
> > > > > > > >  unpin_memory:
> > > > > > > > -       list_del(&userptr->job_node);
> > > > > > > > +       rhashtable_remove_fast(parser->job_userptr_ht,
> > > > > > > > +                              &userptr->job_node, hl_userptr_rht_params);
> > > > > > > >         hl_unpin_host_memory(hdev, userptr);
> > > > > > > >  free_userptr:
> > > > > > > >         kfree(userptr);
> > > > > > > > @@ -3806,7 +3810,7 @@ static int goya_patch_dma_packet(struct hl_device *hdev,
> > > > > > > >         if ((!skip_host_mem_pin) &&
> > > > > > > >                 (hl_userptr_is_pinned(hdev, addr,
> > > > > > > >                         le32_to_cpu(user_dma_pkt->tsize),
> > > > > > > > -                       parser->job_userptr_list, &userptr) == false)) {
> > > > > > > > +                       parser->job_userptr_ht, &userptr) == false)) {
> > > > > > > >                 dev_err(hdev->dev, "Userptr 0x%llx + 0x%x NOT mapped\n",
> > > > > > > >                                 addr, user_dma_pkt->tsize);
> > > > > > > >                 return -EFAULT;
> > > > > > > > @@ -4104,7 +4108,7 @@ static int goya_parse_cb_no_mmu(struct hl_device *hdev,
> > > > > > > >
> > > > > > > >  free_userptr:
> > > > > > > >         if (rc)
> > > > > > > > -               hl_userptr_delete_list(hdev, parser->job_userptr_list);
> > > > > > > > +               hl_userptr_delete_list(hdev, parser->job_userptr_ht);
> > > > > > > >         return rc;
> > > > > > > >  }
> > > > > > > >
> > > > > > > > --
> > > > > > > > 2.34.1
> > > > > > > >
