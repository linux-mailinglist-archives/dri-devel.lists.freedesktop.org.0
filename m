Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C60386F64C4
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 08:13:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21DB210E38F;
	Thu,  4 May 2023 06:13:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96DCF10E38F
 for <dri-devel@lists.freedesktop.org>; Thu,  4 May 2023 06:13:10 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2F8EC62B0E
 for <dri-devel@lists.freedesktop.org>; Thu,  4 May 2023 06:13:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85354C433A0
 for <dri-devel@lists.freedesktop.org>; Thu,  4 May 2023 06:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683180788;
 bh=x5kwsDZ4TN9cZ90xAynKsrlFYiS4VMknuQmqXWKQv4E=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=WC5TbwZPBi0tQQNBvTGJXplLeEakP8uBRvGG581CxvUv9/lukOh5AC1X3zAPMZ+g8
 9fy0AysYaV3efBV0IrkrXu1zdYN2KWUIc2IUyOFvA4x8KVpiESnSeOjJRWPmpAmGjj
 BMcPaTFDazfHj/l4xwLkGcnDNik8NE3EswvdDTb9R7L3TBIQj3kvERaZmHJ4qwp1Do
 sCu8BfoRZt4Uxqa/GKexTOKqeuQTzen5tcfIBeZue2AGLB2uh0E9GC8/ouptYgrPLg
 Adtyp+A8xJKNwpZG9emF1LF7yEeYjzIUYlvQG6aZ8GJnBDSY7y9+vhBlmA7vw1ClOY
 cu2w4G8yOCltA==
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-b9d881ad689so159847276.2
 for <dri-devel@lists.freedesktop.org>; Wed, 03 May 2023 23:13:08 -0700 (PDT)
X-Gm-Message-State: AC+VfDzVQPLLw/U73ush03B3TwHk/O9z135DhLPMYuwR1p33bf7H9HCj
 5stvAZwZ6/fweyk4Y4KiIMOer+RU71+IbueWWW4=
X-Google-Smtp-Source: ACHHUZ6KF0mvEfZ7c7A7TDoA7IR0SoQqosIt/hT5lEC3d9rVnjWTYftxg5H7oyxdR6EjaIgGYcc740OPEhS6iP0Y7Yo=
X-Received: by 2002:a25:4117:0:b0:b95:c55f:5d4b with SMTP id
 o23-20020a254117000000b00b95c55f5d4bmr27227873yba.3.1683180787246; Wed, 03
 May 2023 23:13:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230428144903.26048-1-cai.huoqing@linux.dev>
 <CAFCwf13cqApEckT89kJdtNZppMNjDVJQtOCL_3hchY7oYDvrUQ@mail.gmail.com>
 <ZFMfu7BuMXdNReLy@chq-MS-7D45>
In-Reply-To: <ZFMfu7BuMXdNReLy@chq-MS-7D45>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Thu, 4 May 2023 09:12:40 +0300
X-Gmail-Original-Message-ID: <CAFCwf13zp78dKKAU+KcWs+4jC+jdd5dU8n8N0NfHg+AXOGR5aw@mail.gmail.com>
Message-ID: <CAFCwf13zp78dKKAU+KcWs+4jC+jdd5dU8n8N0NfHg+AXOGR5aw@mail.gmail.com>
Subject: Re: [PATCH v2] accel/habanalabs: Make use of rhashtable
To: Cai Huoqing <cai.huoqing@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, May 4, 2023 at 6:00=E2=80=AFAM Cai Huoqing <cai.huoqing@linux.dev> =
wrote:
>
> On 30 4=E6=9C=88 23 09:36:29, Oded Gabbay wrote:
> > On Fri, Apr 28, 2023 at 5:49=E2=80=AFPM Cai Huoqing <cai.huoqing@linux.=
dev> wrote:
> > >
> > > Using rhashtable to accelerate the search for userptr by address,
> > > instead of using a list.
> > >
> > > Preferably, the lookup complexity of a hash table is O(1).
> > >
> > > This patch will speedup the method
> > > hl_userptr_is_pinned by rhashtable_lookup_fast.
> > >
> > > Signed-off-by: Cai Huoqing <cai.huoqing@linux.dev>
> >
> > Thanks for the patch, but the reason we never optimized this path is
> > because this code path is only relevant for Goya, which we don't want
> > to change the code for anymore.
> > For Gaudi we don't pin the memory in the host during submission. It is
> > done much earlier, when the user maps the memory to the device. The
> > code path in Gaudi is only in case the device is loaded with its MMU
> > disabled. This mode was used only for debug/bring-up of the ASIC many
> > years ago. As you can see in Gaudi2, that mode was dropped even for
>
> Do you mean that the userspace directly call HL_MEM_OP_MAP/HL_MEM_OP_UNMA=
P
> with a flag HL_MEM_USERPTR instead of pin host mem in submissmion?
Yes, correct.

>
> > debug/bring-up.
> >
> > Therefore, I prefer not to take this patch as validation for both
> > functionality and performance will take time which will be better
> > spent elsewhere.
> >
> > Thanks,
> > Oded
> >
> > > ---
> > > v1->v2:
> > > Use rhashtable_free_and_destroy in hl_userptr_delete_list.
> > >
> > >  .../habanalabs/common/command_submission.c    | 16 ++++++--
> > >  drivers/accel/habanalabs/common/habanalabs.h  | 19 +++++----
> > >  drivers/accel/habanalabs/common/memory.c      | 39 +++++++++++------=
--
> > >  drivers/accel/habanalabs/gaudi/gaudi.c        | 16 +++++---
> > >  drivers/accel/habanalabs/goya/goya.c          | 14 ++++---
> > >  5 files changed, 65 insertions(+), 39 deletions(-)
> > >
> > > diff --git a/drivers/accel/habanalabs/common/command_submission.c b/d=
rivers/accel/habanalabs/common/command_submission.c
> > > index af9d2e22c6e7..35c2ab934396 100644
> > > --- a/drivers/accel/habanalabs/common/command_submission.c
> > > +++ b/drivers/accel/habanalabs/common/command_submission.c
> > > @@ -312,7 +312,7 @@ static int cs_parser(struct hl_fpriv *hpriv, stru=
ct hl_cs_job *job)
> > >         parser.job_id =3D job->id;
> > >
> > >         parser.hw_queue_id =3D job->hw_queue_id;
> > > -       parser.job_userptr_list =3D &job->userptr_list;
> > > +       parser.job_userptr_ht =3D &job->userptr_ht;
> > >         parser.patched_cb =3D NULL;
> > >         parser.user_cb =3D job->user_cb;
> > >         parser.user_cb_size =3D job->user_cb_size;
> > > @@ -351,7 +351,7 @@ static void hl_complete_job(struct hl_device *hde=
v, struct hl_cs_job *job)
> > >         struct hl_cs *cs =3D job->cs;
> > >
> > >         if (is_cb_patched(hdev, job)) {
> > > -               hl_userptr_delete_list(hdev, &job->userptr_list);
> > > +               hl_userptr_delete_list(hdev, &job->userptr_ht);
> > >
> > >                 /*
> > >                  * We might arrive here from rollback and patched CB =
wasn't
> > > @@ -1284,6 +1284,7 @@ struct hl_cs_job *hl_cs_allocate_job(struct hl_=
device *hdev,
> > >                 enum hl_queue_type queue_type, bool is_kernel_allocat=
ed_cb)
> > >  {
> > >         struct hl_cs_job *job;
> > > +       int rc;
> > >
> > >         job =3D kzalloc(sizeof(*job), GFP_ATOMIC);
> > >         if (!job)
> > > @@ -1296,13 +1297,20 @@ struct hl_cs_job *hl_cs_allocate_job(struct h=
l_device *hdev,
> > >         job->queue_type =3D queue_type;
> > >         job->is_kernel_allocated_cb =3D is_kernel_allocated_cb;
> > >
> > > -       if (is_cb_patched(hdev, job))
> > > -               INIT_LIST_HEAD(&job->userptr_list);
> > > +       if (is_cb_patched(hdev, job)) {
> > > +               rc =3D rhashtable_init(&job->userptr_ht, &hl_userptr_=
rht_params);
> > > +               if (rc)
> > > +                       goto free_job;
> > > +       }
> > >
> > >         if (job->queue_type =3D=3D QUEUE_TYPE_EXT)
> > >                 INIT_WORK(&job->finish_work, job_wq_completion);
> > >
> > >         return job;
> > > +
> > > +free_job:
> > > +       kfree(job);
> > > +       return NULL;
> > >  }
> > >
> > >  static enum hl_cs_type hl_cs_get_cs_type(u32 cs_type_flags)
> > > diff --git a/drivers/accel/habanalabs/common/habanalabs.h b/drivers/a=
ccel/habanalabs/common/habanalabs.h
> > > index eaae69a9f817..9c876d1480d2 100644
> > > --- a/drivers/accel/habanalabs/common/habanalabs.h
> > > +++ b/drivers/accel/habanalabs/common/habanalabs.h
> > > @@ -19,6 +19,7 @@
> > >  #include <linux/dma-direction.h>
> > >  #include <linux/scatterlist.h>
> > >  #include <linux/hashtable.h>
> > > +#include <linux/rhashtable.h>
> > >  #include <linux/debugfs.h>
> > >  #include <linux/rwsem.h>
> > >  #include <linux/eventfd.h>
> > > @@ -540,6 +541,8 @@ struct hl_hints_range {
> > >         u64 end_addr;
> > >  };
> > >
> > > +extern const struct rhashtable_params hl_userptr_rht_params;
> > > +
> > >  /**
> > >   * struct asic_fixed_properties - ASIC specific immutable properties=
.
> > >   * @hw_queues_props: H/W queues properties.
> > > @@ -1915,7 +1918,7 @@ struct hl_ctx_mgr {
> > >  /**
> > >   * struct hl_userptr - memory mapping chunk information
> > >   * @vm_type: type of the VM.
> > > - * @job_node: linked-list node for hanging the object on the Job's l=
ist.
> > > + * @job_node: hashtable node for hanging the object on the Job's lis=
t.
> > >   * @pages: pointer to struct page array
> > >   * @npages: size of @pages array
> > >   * @sgt: pointer to the scatter-gather table that holds the pages.
> > > @@ -1928,7 +1931,7 @@ struct hl_ctx_mgr {
> > >   */
> > >  struct hl_userptr {
> > >         enum vm_type            vm_type; /* must be first */
> > > -       struct list_head        job_node;
> > > +       struct rhash_head       job_node;
> > >         struct page             **pages;
> > >         unsigned int            npages;
> > >         struct sg_table         *sgt;
> > > @@ -2028,7 +2031,7 @@ struct hl_cs {
> > >   * @patched_cb: in case of patching, this is internal CB which is su=
bmitted on
> > >   *             the queue instead of the CB we got from the IOCTL.
> > >   * @finish_work: workqueue object to run when job is completed.
> > > - * @userptr_list: linked-list of userptr mappings that belong to thi=
s job and
> > > + * @userptr_ht: hashtable of userptr mappings that belong to this jo=
b and
> > >   *                     wait for completion.
> > >   * @debugfs_list: node in debugfs list of command submission jobs.
> > >   * @refcount: reference counter for usage of the CS job.
> > > @@ -2056,7 +2059,7 @@ struct hl_cs_job {
> > >         struct hl_cb            *user_cb;
> > >         struct hl_cb            *patched_cb;
> > >         struct work_struct      finish_work;
> > > -       struct list_head        userptr_list;
> > > +       struct rhashtable       userptr_ht;
> > >         struct list_head        debugfs_list;
> > >         struct kref             refcount;
> > >         enum hl_queue_type      queue_type;
> > > @@ -2075,7 +2078,7 @@ struct hl_cs_job {
> > >   * @user_cb: the CB we got from the user.
> > >   * @patched_cb: in case of patching, this is internal CB which is su=
bmitted on
> > >   *             the queue instead of the CB we got from the IOCTL.
> > > - * @job_userptr_list: linked-list of userptr mappings that belong to=
 the related
> > > + * @job_userptr_ht: hashtable of userptr mappings that belong to the=
 related
> > >   *                     job and wait for completion.
> > >   * @cs_sequence: the sequence number of the related CS.
> > >   * @queue_type: the type of the H/W queue this job is submitted to.
> > > @@ -2098,7 +2101,7 @@ struct hl_cs_job {
> > >  struct hl_cs_parser {
> > >         struct hl_cb            *user_cb;
> > >         struct hl_cb            *patched_cb;
> > > -       struct list_head        *job_userptr_list;
> > > +       struct rhashtable       *job_userptr_ht;
> > >         u64                     cs_sequence;
> > >         enum hl_queue_type      queue_type;
> > >         u32                     ctx_id;
> > > @@ -3760,9 +3763,9 @@ int hl_pin_host_memory(struct hl_device *hdev, =
u64 addr, u64 size,
> > >                         struct hl_userptr *userptr);
> > >  void hl_unpin_host_memory(struct hl_device *hdev, struct hl_userptr =
*userptr);
> > >  void hl_userptr_delete_list(struct hl_device *hdev,
> > > -                               struct list_head *userptr_list);
> > > +                               struct rhashtable *userptr_ht);
> > >  bool hl_userptr_is_pinned(struct hl_device *hdev, u64 addr, u32 size=
,
> > > -                               struct list_head *userptr_list,
> > > +                               struct rhashtable *userptr_ht,
> > >                                 struct hl_userptr **userptr);
> > >
> > >  int hl_mmu_init(struct hl_device *hdev);
> > > diff --git a/drivers/accel/habanalabs/common/memory.c b/drivers/accel=
/habanalabs/common/memory.c
> > > index a7b6a273ce21..fa2104e33639 100644
> > > --- a/drivers/accel/habanalabs/common/memory.c
> > > +++ b/drivers/accel/habanalabs/common/memory.c
> > > @@ -23,6 +23,13 @@ MODULE_IMPORT_NS(DMA_BUF);
> > >
> > >  #define MEM_HANDLE_INVALID     ULONG_MAX
> > >
> > > +const struct rhashtable_params hl_userptr_rht_params =3D {
> > > +       .head_offset =3D offsetof(struct hl_userptr, job_node),
> > > +       .key_offset =3D offsetof(struct hl_userptr, addr),
> > > +       .key_len =3D sizeof(u64),
> > > +       .automatic_shrinking =3D true,
> > > +};
> > > +
> > >  static int allocate_timestamps_buffers(struct hl_fpriv *hpriv,
> > >                         struct hl_mem_in *args, u64 *handle);
> > >
> > > @@ -2483,7 +2490,6 @@ int hl_pin_host_memory(struct hl_device *hdev, =
u64 addr, u64 size,
> > >         userptr->size =3D size;
> > >         userptr->addr =3D addr;
> > >         userptr->dma_mapped =3D false;
> > > -       INIT_LIST_HEAD(&userptr->job_node);
> > >
> > >         rc =3D get_user_memory(hdev, addr, size, npages, start, offse=
t,
> > >                                 userptr);
> > > @@ -2522,32 +2528,32 @@ void hl_unpin_host_memory(struct hl_device *h=
dev, struct hl_userptr *userptr)
> > >         unpin_user_pages_dirty_lock(userptr->pages, userptr->npages, =
true);
> > >         kvfree(userptr->pages);
> > >
> > > -       list_del(&userptr->job_node);
> > > -
> > >         sg_free_table(userptr->sgt);
> > >         kfree(userptr->sgt);
> > >  }
> > >
> > > +static void hl_userptr_free_cb(void *ptr, void *arg)
> > > +{
> > > +       struct hl_userptr *userptr =3D ptr;
> > > +       struct hl_device *hdev =3D (struct hl_device *)arg;
> > > +
> > > +       hl_unpin_host_memory(hdev, userptr);
> > > +       kfree(userptr);
> > > +}
> > > +
> > >  /**
> > >   * hl_userptr_delete_list() - clear userptr list.
> > >   * @hdev: pointer to the habanalabs device structure.
> > > - * @userptr_list: pointer to the list to clear.
> > > + * @userptr_ht: pointer to the hashtable to clear.
> > >   *
> > >   * This function does the following:
> > >   * - Iterates over the list and unpins the host memory and frees the=
 userptr
> > >   *   structure.
> > >   */
> > >  void hl_userptr_delete_list(struct hl_device *hdev,
> > > -                               struct list_head *userptr_list)
> > > +                               struct rhashtable *userptr_ht)
> > >  {
> > > -       struct hl_userptr *userptr, *tmp;
> > > -
> > > -       list_for_each_entry_safe(userptr, tmp, userptr_list, job_node=
) {
> > > -               hl_unpin_host_memory(hdev, userptr);
> > > -               kfree(userptr);
> > > -       }
> > > -
> > > -       INIT_LIST_HEAD(userptr_list);
> > > +       rhashtable_free_and_destroy(userptr_ht, hl_userptr_free_cb, h=
dev);
> > >  }
> > >
> > >  /**
> > > @@ -2555,7 +2561,7 @@ void hl_userptr_delete_list(struct hl_device *h=
dev,
> > >   * @hdev: pointer to the habanalabs device structure.
> > >   * @addr: user address to check.
> > >   * @size: user block size to check.
> > > - * @userptr_list: pointer to the list to clear.
> > > + * @userptr_ht: pointer to the hashtable to clear.
> > >   * @userptr: pointer to userptr to check.
> > >   *
> > >   * This function does the following:
> > > @@ -2563,10 +2569,11 @@ void hl_userptr_delete_list(struct hl_device =
*hdev,
> > >   *   pinned. If so, returns true, otherwise returns false.
> > >   */
> > >  bool hl_userptr_is_pinned(struct hl_device *hdev, u64 addr,
> > > -                               u32 size, struct list_head *userptr_l=
ist,
> > > +                               u32 size, struct rhashtable *userptr_=
ht,
> > >                                 struct hl_userptr **userptr)
> > >  {
> > > -       list_for_each_entry((*userptr), userptr_list, job_node) {
> > > +       (*userptr) =3D rhashtable_lookup_fast(userptr_ht, &addr, hl_u=
serptr_rht_params);
> > > +       if (*userptr) {
> > >                 if ((addr =3D=3D (*userptr)->addr) && (size =3D=3D (*=
userptr)->size))
> > >                         return true;
> > >         }
> > > diff --git a/drivers/accel/habanalabs/gaudi/gaudi.c b/drivers/accel/h=
abanalabs/gaudi/gaudi.c
> > > index a29aa8f7b6f3..1e1433042413 100644
> > > --- a/drivers/accel/habanalabs/gaudi/gaudi.c
> > > +++ b/drivers/accel/habanalabs/gaudi/gaudi.c
> > > @@ -1031,7 +1031,7 @@ static int _gaudi_init_tpc_mem(struct hl_device=
 *hdev,
> > >         }
> > >
> > >  free_job:
> > > -       hl_userptr_delete_list(hdev, &job->userptr_list);
> > > +       hl_userptr_delete_list(hdev, &job->userptr_ht);
> > >         hl_debugfs_remove_job(hdev, job);
> > >         kfree(job);
> > >         atomic_dec(&cb->cs_cnt);
> > > @@ -4901,7 +4901,7 @@ static int gaudi_pin_memory_before_cs(struct hl=
_device *hdev,
> > >         int rc;
> > >
> > >         if (hl_userptr_is_pinned(hdev, addr, le32_to_cpu(user_dma_pkt=
->tsize),
> > > -                       parser->job_userptr_list, &userptr))
> > > +                       parser->job_userptr_ht, &userptr))
> > >                 goto already_pinned;
> > >
> > >         userptr =3D kzalloc(sizeof(*userptr), GFP_KERNEL);
> > > @@ -4913,7 +4913,10 @@ static int gaudi_pin_memory_before_cs(struct h=
l_device *hdev,
> > >         if (rc)
> > >                 goto free_userptr;
> > >
> > > -       list_add_tail(&userptr->job_node, parser->job_userptr_list);
> > > +       rc =3D rhashtable_insert_fast(parser->job_userptr_ht,
> > > +                                   &userptr->job_node, hl_userptr_rh=
t_params);
> > > +       if (rc)
> > > +               goto unpin_memory;
> > >
> > >         rc =3D hdev->asic_funcs->asic_dma_map_sgtable(hdev, userptr->=
sgt, dir);
> > >         if (rc) {
> > > @@ -4931,7 +4934,8 @@ static int gaudi_pin_memory_before_cs(struct hl=
_device *hdev,
> > >         return 0;
> > >
> > >  unpin_memory:
> > > -       list_del(&userptr->job_node);
> > > +       rhashtable_remove_fast(parser->job_userptr_ht,
> > > +                              &userptr->job_node, hl_userptr_rht_par=
ams);
> > >         hl_unpin_host_memory(hdev, userptr);
> > >  free_userptr:
> > >         kfree(userptr);
> > > @@ -5175,7 +5179,7 @@ static int gaudi_patch_dma_packet(struct hl_dev=
ice *hdev,
> > >         if ((!skip_host_mem_pin) &&
> > >                 (!hl_userptr_is_pinned(hdev, addr,
> > >                                         le32_to_cpu(user_dma_pkt->tsi=
ze),
> > > -                                       parser->job_userptr_list, &us=
erptr))) {
> > > +                                       parser->job_userptr_ht, &user=
ptr))) {
> > >                 dev_err(hdev->dev, "Userptr 0x%llx + 0x%x NOT mapped\=
n",
> > >                                 addr, user_dma_pkt->tsize);
> > >                 return -EFAULT;
> > > @@ -5472,7 +5476,7 @@ static int gaudi_parse_cb_no_mmu(struct hl_devi=
ce *hdev,
> > >
> > >  free_userptr:
> > >         if (rc)
> > > -               hl_userptr_delete_list(hdev, parser->job_userptr_list=
);
> > > +               hl_userptr_delete_list(hdev, parser->job_userptr_ht);
> > >         return rc;
> > >  }
> > >
> > > diff --git a/drivers/accel/habanalabs/goya/goya.c b/drivers/accel/hab=
analabs/goya/goya.c
> > > index fb0ac9df841a..bfcbb9e8b126 100644
> > > --- a/drivers/accel/habanalabs/goya/goya.c
> > > +++ b/drivers/accel/habanalabs/goya/goya.c
> > > @@ -3347,7 +3347,7 @@ static int goya_pin_memory_before_cs(struct hl_=
device *hdev,
> > >         int rc;
> > >
> > >         if (hl_userptr_is_pinned(hdev, addr, le32_to_cpu(user_dma_pkt=
->tsize),
> > > -                       parser->job_userptr_list, &userptr))
> > > +                       parser->job_userptr_ht, &userptr))
> > >                 goto already_pinned;
> > >
> > >         userptr =3D kzalloc(sizeof(*userptr), GFP_KERNEL);
> > > @@ -3359,7 +3359,10 @@ static int goya_pin_memory_before_cs(struct hl=
_device *hdev,
> > >         if (rc)
> > >                 goto free_userptr;
> > >
> > > -       list_add_tail(&userptr->job_node, parser->job_userptr_list);
> > > +       rc =3D rhashtable_insert_fast(parser->job_userptr_ht,
> > > +                                   &userptr->job_node, hl_userptr_rh=
t_params);
> > > +       if (rc)
> > > +               goto unpin_memory;
> > >
> > >         rc =3D hdev->asic_funcs->asic_dma_map_sgtable(hdev, userptr->=
sgt, dir);
> > >         if (rc) {
> > > @@ -3377,7 +3380,8 @@ static int goya_pin_memory_before_cs(struct hl_=
device *hdev,
> > >         return 0;
> > >
> > >  unpin_memory:
> > > -       list_del(&userptr->job_node);
> > > +       rhashtable_remove_fast(parser->job_userptr_ht,
> > > +                              &userptr->job_node, hl_userptr_rht_par=
ams);
> > >         hl_unpin_host_memory(hdev, userptr);
> > >  free_userptr:
> > >         kfree(userptr);
> > > @@ -3806,7 +3810,7 @@ static int goya_patch_dma_packet(struct hl_devi=
ce *hdev,
> > >         if ((!skip_host_mem_pin) &&
> > >                 (hl_userptr_is_pinned(hdev, addr,
> > >                         le32_to_cpu(user_dma_pkt->tsize),
> > > -                       parser->job_userptr_list, &userptr) =3D=3D fa=
lse)) {
> > > +                       parser->job_userptr_ht, &userptr) =3D=3D fals=
e)) {
> > >                 dev_err(hdev->dev, "Userptr 0x%llx + 0x%x NOT mapped\=
n",
> > >                                 addr, user_dma_pkt->tsize);
> > >                 return -EFAULT;
> > > @@ -4104,7 +4108,7 @@ static int goya_parse_cb_no_mmu(struct hl_devic=
e *hdev,
> > >
> > >  free_userptr:
> > >         if (rc)
> > > -               hl_userptr_delete_list(hdev, parser->job_userptr_list=
);
> > > +               hl_userptr_delete_list(hdev, parser->job_userptr_ht);
> > >         return rc;
> > >  }
> > >
> > > --
> > > 2.34.1
> > >
