Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0311672F94
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 04:44:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8B3C10E895;
	Thu, 19 Jan 2023 03:44:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F25EA10E8A1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 03:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674099868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fx4mkSxirb65Cal+fs2rQglWi0qL8SHACka6YSDtZDk=;
 b=dfi0eGCT+n8nnnuC4YjZTG5aB3qxfd+HqkGTMaH9JFIfY2mm1bQIdUwJArpMsMrEwxcsiX
 aDl9Ulf2mgo71cTuzfhZo1GozKLULYlpNCiiEUmWnHHr/JXnDkmcpSpy9TX7Dwb+r2QQYX
 JeteYICHLk8WKrRVgbAR8PS5hXrkCIA=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-286-xR9Rl2lHN5yG8U9jiwC9iA-1; Wed, 18 Jan 2023 22:44:26 -0500
X-MC-Unique: xR9Rl2lHN5yG8U9jiwC9iA-1
Received: by mail-ej1-f71.google.com with SMTP id
 du14-20020a17090772ce00b0087108bbcfa6so637362ejc.7
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 19:44:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fx4mkSxirb65Cal+fs2rQglWi0qL8SHACka6YSDtZDk=;
 b=32hVy8/nfFC2LhlWc2R4wfs+rBc1ih+/yanf6Z4pmDAwt9VvzcqIKR1TUTgrTCw2JP
 rbM5C/YkpW1M+SECpqLJavQQix/dzqFax3lsVQHv1lvGQNsJhruvRkJawqN+L9O4LE0b
 iDdD1FHq9RiD28AHJJGiSJb/cs9yJQEy/kR0+0BDtPXFltHMVVdmj7akQJjcBElyI8qb
 dmyDlVlRXWCwoDUfVbHhFFWQq0Eqf9LU2ntQbWhd0vABKlIV/JKdLSwnSZC0ufwzK2Gm
 eVYs5UkZ1q3LnAKQTRfzp0k3pc8Mls92nyeYggW7LEvWiVAayCaerNYoJHl0P40bktGL
 G7NA==
X-Gm-Message-State: AFqh2koH9mu1GtTYQamyEhJyheenFDzQuNOwBYRoT9siMvjQdeOayYc9
 AKhgVCZS7H58kGvT9lB3x9OIXIzEscYEmC1FVODsC86tu1nIIlwmt7NtK8P+xHZFi2Uo1lrULXj
 gdg65bXBexvW+uhT+leyMj+gtq0Eb
X-Received: by 2002:a50:ff12:0:b0:492:8c77:7da9 with SMTP id
 a18-20020a50ff12000000b004928c777da9mr8354666edu.9.1674099865533; 
 Wed, 18 Jan 2023 19:44:25 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtwHD+ENuX6fhSJYTprXMumEP1vzkMFS/VPNeZmhbYHTobd+ELiIEL0Sx8tJ1eQ0Ef/57fSLg==
X-Received: by 2002:a50:ff12:0:b0:492:8c77:7da9 with SMTP id
 a18-20020a50ff12000000b004928c777da9mr8354645edu.9.1674099865176; 
 Wed, 18 Jan 2023 19:44:25 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de78:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de78:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 w22-20020a1709061f1600b0081bfc79beaesm15531104ejj.75.2023.01.18.19.44.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jan 2023 19:44:24 -0800 (PST)
Message-ID: <8e10b46c-f934-8eee-904e-b3d8a7644a71@redhat.com>
Date: Thu, 19 Jan 2023 04:44:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH drm-next 13/14] drm/nouveau: implement new VM_BIND UAPI
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 daniel@ffwll.ch, airlied@redhat.com, christian.koenig@amd.com,
 bskeggs@redhat.com, jason@jlekstrand.net, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net
References: <20230118061256.2689-1-dakr@redhat.com>
 <20230118061256.2689-14-dakr@redhat.com>
 <e371e8a1-88f8-1309-07ca-f48f4157fec8@shipmail.org>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <e371e8a1-88f8-1309-07ca-f48f4157fec8@shipmail.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/18/23 21:37, Thomas Hellström (Intel) wrote:
> 
> On 1/18/23 07:12, Danilo Krummrich wrote:
>> This commit provides the implementation for the new uapi motivated by the
>> Vulkan API. It allows user mode drivers (UMDs) to:
>>
>> 1) Initialize a GPU virtual address (VA) space via the new
>>     DRM_IOCTL_NOUVEAU_VM_INIT ioctl for UMDs to specify the portion of VA
>>     space managed by the kernel and userspace, respectively.
>>
>> 2) Allocate and free a VA space region as well as bind and unbind memory
>>     to the GPUs VA space via the new DRM_IOCTL_NOUVEAU_VM_BIND ioctl.
>>     UMDs can request the named operations to be processed either
>>     synchronously or asynchronously. It supports DRM syncobjs
>>     (incl. timelines) as synchronization mechanism. The management of the
>>     GPU VA mappings is implemented with the DRM GPU VA manager.
>>
>> 3) Execute push buffers with the new DRM_IOCTL_NOUVEAU_EXEC ioctl. The
>>     execution happens asynchronously. It supports DRM syncobj (incl.
>>     timelines) as synchronization mechanism. DRM GEM object locking is
>>     handled with drm_exec.
>>
>> Both, DRM_IOCTL_NOUVEAU_VM_BIND and DRM_IOCTL_NOUVEAU_EXEC, use the DRM
>> GPU scheduler for the asynchronous paths.
>>
>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
>> ---
>>   Documentation/gpu/driver-uapi.rst       |   3 +
>>   drivers/gpu/drm/nouveau/Kbuild          |   2 +
>>   drivers/gpu/drm/nouveau/Kconfig         |   2 +
>>   drivers/gpu/drm/nouveau/nouveau_abi16.c |  16 +
>>   drivers/gpu/drm/nouveau/nouveau_abi16.h |   1 +
>>   drivers/gpu/drm/nouveau/nouveau_drm.c   |  23 +-
>>   drivers/gpu/drm/nouveau/nouveau_drv.h   |   9 +-
>>   drivers/gpu/drm/nouveau/nouveau_exec.c  | 310 ++++++++++
>>   drivers/gpu/drm/nouveau/nouveau_exec.h  |  55 ++
>>   drivers/gpu/drm/nouveau/nouveau_sched.c | 780 ++++++++++++++++++++++++
>>   drivers/gpu/drm/nouveau/nouveau_sched.h |  98 +++
>>   11 files changed, 1295 insertions(+), 4 deletions(-)
>>   create mode 100644 drivers/gpu/drm/nouveau/nouveau_exec.c
>>   create mode 100644 drivers/gpu/drm/nouveau/nouveau_exec.h
>>   create mode 100644 drivers/gpu/drm/nouveau/nouveau_sched.c
>>   create mode 100644 drivers/gpu/drm/nouveau/nouveau_sched.h
> ...
>>
>> +static struct dma_fence *
>> +nouveau_bind_job_run(struct nouveau_job *job)
>> +{
>> +    struct nouveau_bind_job *bind_job = to_nouveau_bind_job(job);
>> +    struct nouveau_uvmm *uvmm = nouveau_cli_uvmm(job->cli);
>> +    struct bind_job_op *op;
>> +    int ret = 0;
>> +
> 
> I was looking at how nouveau does the async binding compared to how xe 
> does it.
> It looks to me that this function being a scheduler run_job callback is 
> the main part of the VM_BIND dma-fence signalling critical section for 
> the job's done_fence and if so, needs to be annotated as such?

Yes, that's the case.

> 
> For example nouveau_uvma_region_new allocates memory, which is not 
> allowed if in a dma_fence signalling critical section and the locking 
> also looks suspicious?

Thanks for pointing this out, I missed that somehow.

I will change it to pre-allocate new regions, mappings and page tables 
within the job's submit() function.

For the ops structures the drm_gpuva_manager allocates for reporting the 
split/merge steps back to the driver I have ideas to entirely avoid 
allocations, which also is a good thing in respect of Christians 
feedback regarding the huge amount of mapping requests some applications 
seem to generate.

Regarding the locking, anything specific that makes it look suspicious 
to you?

> 
> Thanks,
> 
> Thomas
> 
> 
>> +    nouveau_uvmm_lock(uvmm);
>> +    list_for_each_op(op, &bind_job->ops) {
>> +        switch (op->op) {
>> +        case OP_ALLOC: {
>> +            bool sparse = op->flags & DRM_NOUVEAU_VM_BIND_SPARSE;
>> +
>> +            ret = nouveau_uvma_region_new(uvmm,
>> +                              op->va.addr,
>> +                              op->va.range,
>> +                              sparse);
>> +            if (ret)
>> +                goto out_unlock;
>> +            break;
>> +        }
>> +        case OP_FREE:
>> +            ret = nouveau_uvma_region_destroy(uvmm,
>> +                              op->va.addr,
>> +                              op->va.range);
>> +            if (ret)
>> +                goto out_unlock;
>> +            break;
>> +        case OP_MAP:
>> +            ret = nouveau_uvmm_sm_map(uvmm,
>> +                          op->va.addr, op->va.range,
>> +                          op->gem.obj, op->gem.offset,
>> +                          op->flags && 0xff);
>> +            if (ret)
>> +                goto out_unlock;
>> +            break;
>> +        case OP_UNMAP:
>> +            ret = nouveau_uvmm_sm_unmap(uvmm,
>> +                            op->va.addr,
>> +                            op->va.range);
>> +            if (ret)
>> +                goto out_unlock;
>> +            break;
>> +        }
>> +    }
>> +
>> +out_unlock:
>> +    nouveau_uvmm_unlock(uvmm);
>> +    if (ret)
>> +        NV_PRINTK(err, job->cli, "bind job failed: %d\n", ret);
>> +    return ERR_PTR(ret);
>> +}
>> +
>> +static void
>> +nouveau_bind_job_free(struct nouveau_job *job)
>> +{
>> +    struct nouveau_bind_job *bind_job = to_nouveau_bind_job(job);
>> +    struct bind_job_op *op, *next;
>> +
>> +    list_for_each_op_safe(op, next, &bind_job->ops) {
>> +        struct drm_gem_object *obj = op->gem.obj;
>> +
>> +        if (obj)
>> +            drm_gem_object_put(obj);
>> +
>> +        list_del(&op->entry);
>> +        kfree(op);
>> +    }
>> +
>> +    nouveau_base_job_free(job);
>> +    kfree(bind_job);
>> +}
>> +
>> +static struct nouveau_job_ops nouveau_bind_job_ops = {
>> +    .submit = nouveau_bind_job_submit,
>> +    .run = nouveau_bind_job_run,
>> +    .free = nouveau_bind_job_free,
>> +};
>> +
>> +static int
>> +bind_job_op_from_uop(struct bind_job_op **pop,
>> +             struct drm_nouveau_vm_bind_op *uop)
>> +{
>> +    struct bind_job_op *op;
>> +
>> +    op = *pop = kzalloc(sizeof(*op), GFP_KERNEL);
>> +    if (!op)
>> +        return -ENOMEM;
>> +
>> +    op->op = uop->op;
>> +    op->flags = uop->flags;
>> +    op->va.addr = uop->addr;
>> +    op->va.range = uop->range;
>> +
>> +    if (op->op == DRM_NOUVEAU_VM_BIND_OP_MAP) {
>> +        op->gem.handle = uop->handle;
>> +        op->gem.offset = uop->bo_offset;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static void
>> +bind_job_ops_free(struct list_head *ops)
>> +{
>> +    struct bind_job_op *op, *next;
>> +
>> +    list_for_each_op_safe(op, next, ops) {
>> +        list_del(&op->entry);
>> +        kfree(op);
>> +    }
>> +}
>> +
>> +int
>> +nouveau_bind_job_init(struct nouveau_bind_job **pjob,
>> +              struct nouveau_exec_bind *bind)
>> +{
>> +    struct nouveau_bind_job *job;
>> +    struct bind_job_op *op;
>> +    int i, ret;
>> +
>> +    job = *pjob = kzalloc(sizeof(*job), GFP_KERNEL);
>> +    if (!job)
>> +        return -ENOMEM;
>> +
>> +    INIT_LIST_HEAD(&job->ops);
>> +
>> +    for (i = 0; i < bind->op.count; i++) {
>> +        ret = bind_job_op_from_uop(&op, &bind->op.s[i]);
>> +        if (ret)
>> +            goto err_free;
>> +
>> +        list_add_tail(&op->entry, &job->ops);
>> +    }
>> +
>> +    job->base.sync = !(bind->flags & DRM_NOUVEAU_VM_BIND_RUN_ASYNC);
>> +    job->base.ops = &nouveau_bind_job_ops;
>> +
>> +    ret = nouveau_base_job_init(&job->base, &bind->base);
>> +    if (ret)
>> +        goto err_free;
>> +
>> +    return 0;
>> +
>> +err_free:
>> +    bind_job_ops_free(&job->ops);
>> +    kfree(job);
>> +    *pjob = NULL;
>> +
>> +    return ret;
>> +}
>> +
>> +static int
>> +sync_find_fence(struct nouveau_job *job,
>> +        struct drm_nouveau_sync *sync,
>> +        struct dma_fence **fence)
>> +{
>> +    u32 stype = sync->flags & DRM_NOUVEAU_SYNC_TYPE_MASK;
>> +    u64 point = 0;
>> +    int ret;
>> +
>> +    if (stype != DRM_NOUVEAU_SYNC_SYNCOBJ &&
>> +        stype != DRM_NOUVEAU_SYNC_TIMELINE_SYNCOBJ)
>> +        return -EOPNOTSUPP;
>> +
>> +    if (stype == DRM_NOUVEAU_SYNC_TIMELINE_SYNCOBJ)
>> +        point = sync->timeline_value;
>> +
>> +    ret = drm_syncobj_find_fence(job->file_priv,
>> +                     sync->handle, point,
>> +                     sync->flags, fence);
>> +    if (ret)
>> +        return ret;
>> +
>> +    return 0;
>> +}
>> +
>> +static int
>> +exec_job_binds_wait(struct nouveau_job *job)
>> +{
>> +    struct nouveau_exec_job *exec_job = to_nouveau_exec_job(job);
>> +    struct nouveau_cli *cli = exec_job->base.cli;
>> +    struct nouveau_sched_entity *bind_entity = &cli->sched_entity;
>> +    signed long ret;
>> +    int i;
>> +
>> +    for (i = 0; i < job->in_sync.count; i++) {
>> +        struct nouveau_job *it;
>> +        struct drm_nouveau_sync *sync = &job->in_sync.s[i];
>> +        struct dma_fence *fence;
>> +        bool found;
>> +
>> +        ret = sync_find_fence(job, sync, &fence);
>> +        if (ret)
>> +            return ret;
>> +
>> +        mutex_lock(&bind_entity->job.mutex);
>> +        found = false;
>> +        list_for_each_entry(it, &bind_entity->job.list, head) {
>> +            if (fence == it->done_fence) {
>> +                found = true;
>> +                break;
>> +            }
>> +        }
>> +        mutex_unlock(&bind_entity->job.mutex);
>> +
>> +        /* If the fence is not from a VM_BIND job, don't wait for it. */
>> +        if (!found)
>> +            continue;
>> +
>> +        ret = dma_fence_wait_timeout(fence, true,
>> +                         msecs_to_jiffies(500));
>> +        if (ret < 0)
>> +            return ret;
>> +        else if (ret == 0)
>> +            return -ETIMEDOUT;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +int
>> +nouveau_exec_job_submit(struct nouveau_job *job)
>> +{
>> +    struct nouveau_exec_job *exec_job = to_nouveau_exec_job(job);
>> +    struct nouveau_cli *cli = exec_job->base.cli;
>> +    struct nouveau_uvmm *uvmm = nouveau_cli_uvmm(cli);
>> +    struct drm_exec *exec = &job->exec;
>> +    struct drm_gem_object *obj;
>> +    unsigned long index;
>> +    int ret;
>> +
>> +    ret = exec_job_binds_wait(job);
>> +    if (ret)
>> +        return ret;
>> +
>> +    nouveau_uvmm_lock(uvmm);
>> +    drm_exec_while_not_all_locked(exec) {
>> +        struct drm_gpuva *va;
>> +
>> +        drm_gpuva_for_each_va(va, &uvmm->umgr) {
>> +            ret = drm_exec_prepare_obj(exec, va->gem.obj, 1);
>> +            drm_exec_break_on_contention(exec);
>> +            if (ret)
>> +                return ret;
>> +        }
>> +    }
>> +    nouveau_uvmm_unlock(uvmm);
>> +
>> +    drm_exec_for_each_locked_object(exec, index, obj) {
>> +        struct dma_resv *resv = obj->resv;
>> +        struct nouveau_bo *nvbo = nouveau_gem_object(obj);
>> +
>> +        ret = nouveau_bo_validate(nvbo, true, false);
>> +        if (ret)
>> +            return ret;
>> +
>> +        dma_resv_add_fence(resv, job->done_fence, DMA_RESV_USAGE_WRITE);
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static struct dma_fence *
>> +nouveau_exec_job_run(struct nouveau_job *job)
>> +{
>> +    struct nouveau_exec_job *exec_job = to_nouveau_exec_job(job);
>> +    struct nouveau_fence *fence;
>> +    int i, ret;
>> +
>> +    ret = nouveau_dma_wait(job->chan, exec_job->push.count + 1, 16);
>> +    if (ret) {
>> +        NV_PRINTK(err, job->cli, "nv50cal_space: %d\n", ret);
>> +        return ERR_PTR(ret);
>> +    }
>> +
>> +    for (i = 0; i < exec_job->push.count; i++) {
>> +        nv50_dma_push(job->chan, exec_job->push.s[i].va,
>> +                  exec_job->push.s[i].va_len);
>> +    }
>> +
>> +    ret = nouveau_fence_new(job->chan, false, &fence);
>> +    if (ret) {
>> +        NV_PRINTK(err, job->cli, "error fencing pushbuf: %d\n", ret);
>> +        WIND_RING(job->chan);
>> +        return ERR_PTR(ret);
>> +    }
>> +
>> +    return &fence->base;
>> +}
>> +static void
>> +nouveau_exec_job_free(struct nouveau_job *job)
>> +{
>> +    struct nouveau_exec_job *exec_job = to_nouveau_exec_job(job);
>> +
>> +    nouveau_base_job_free(job);
>> +
>> +    kfree(exec_job->push.s);
>> +    kfree(exec_job);
>> +}
>> +
>> +static struct nouveau_job_ops nouveau_exec_job_ops = {
>> +    .submit = nouveau_exec_job_submit,
>> +    .run = nouveau_exec_job_run,
>> +    .free = nouveau_exec_job_free,
>> +};
>> +
>> +int
>> +nouveau_exec_job_init(struct nouveau_exec_job **pjob,
>> +              struct nouveau_exec *exec)
>> +{
>> +    struct nouveau_exec_job *job;
>> +    int ret;
>> +
>> +    job = *pjob = kzalloc(sizeof(*job), GFP_KERNEL);
>> +    if (!job)
>> +        return -ENOMEM;
>> +
>> +    job->push.count = exec->push.count;
>> +    job->push.s = kmemdup(exec->push.s,
>> +                  sizeof(*exec->push.s) *
>> +                  exec->push.count,
>> +                  GFP_KERNEL);
>> +    if (!job->push.s) {
>> +        ret = -ENOMEM;
>> +        goto err_free_job;
>> +    }
>> +
>> +    job->base.ops = &nouveau_exec_job_ops;
>> +    ret = nouveau_base_job_init(&job->base, &exec->base);
>> +    if (ret)
>> +        goto err_free_pushs;
>> +
>> +    return 0;
>> +
>> +err_free_pushs:
>> +    kfree(job->push.s);
>> +err_free_job:
>> +    kfree(job);
>> +    *pjob = NULL;
>> +
>> +    return ret;
>> +}
>> +
>> +void nouveau_job_fini(struct nouveau_job *job)
>> +{
>> +    dma_fence_put(job->done_fence);
>> +    drm_sched_job_cleanup(&job->base);
>> +    job->ops->free(job);
>> +}
>> +
>> +static int
>> +nouveau_job_add_deps(struct nouveau_job *job)
>> +{
>> +    struct dma_fence *in_fence = NULL;
>> +    int ret, i;
>> +
>> +    for (i = 0; i < job->in_sync.count; i++) {
>> +        struct drm_nouveau_sync *sync = &job->in_sync.s[i];
>> +
>> +        ret = sync_find_fence(job, sync, &in_fence);
>> +        if (ret) {
>> +            NV_PRINTK(warn, job->cli,
>> +                  "Failed to find syncobj (-> in): handle=%d\n",
>> +                  sync->handle);
>> +            return ret;
>> +        }
>> +
>> +        ret = drm_sched_job_add_dependency(&job->base, in_fence);
>> +        if (ret)
>> +            return ret;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static int
>> +nouveau_job_fence_attach(struct nouveau_job *job, struct dma_fence 
>> *fence)
>> +{
>> +    struct drm_syncobj *out_sync;
>> +    int i;
>> +
>> +    for (i = 0; i < job->out_sync.count; i++) {
>> +        struct drm_nouveau_sync *sync = &job->out_sync.s[i];
>> +        u32 stype = sync->flags & DRM_NOUVEAU_SYNC_TYPE_MASK;
>> +
>> +        if (stype != DRM_NOUVEAU_SYNC_SYNCOBJ &&
>> +            stype != DRM_NOUVEAU_SYNC_TIMELINE_SYNCOBJ)
>> +            return -EOPNOTSUPP;
>> +
>> +        out_sync = drm_syncobj_find(job->file_priv, sync->handle);
>> +        if (!out_sync) {
>> +            NV_PRINTK(warn, job->cli,
>> +                  "Failed to find syncobj (-> out): handle=%d\n",
>> +                  sync->handle);
>> +            return -ENOENT;
>> +        }
>> +
>> +        if (stype == DRM_NOUVEAU_SYNC_TIMELINE_SYNCOBJ) {
>> +            struct dma_fence_chain *chain;
>> +
>> +            chain = dma_fence_chain_alloc();
>> +            if (!chain) {
>> +                drm_syncobj_put(out_sync);
>> +                return -ENOMEM;
>> +            }
>> +
>> +            drm_syncobj_add_point(out_sync, chain, fence,
>> +                          sync->timeline_value);
>> +        } else {
>> +            drm_syncobj_replace_fence(out_sync, fence);
>> +        }
>> +
>> +        drm_syncobj_put(out_sync);
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static struct dma_fence *
>> +nouveau_job_run(struct nouveau_job *job)
>> +{
>> +    return job->ops->run(job);
>> +}
>> +
>> +static int
>> +nouveau_job_run_sync(struct nouveau_job *job)
>> +{
>> +    struct dma_fence *fence;
>> +    int ret;
>> +
>> +    fence = nouveau_job_run(job);
>> +    if (IS_ERR(fence)) {
>> +        return PTR_ERR(fence);
>> +    } else if (fence) {
>> +        ret = dma_fence_wait(fence, true);
>> +        if (ret)
>> +            return ret;
>> +    }
>> +
>> +    dma_fence_signal(job->done_fence);
>> +
>> +    return 0;
>> +}
>> +
>> +int
>> +nouveau_job_submit(struct nouveau_job *job)
>> +{
>> +    struct nouveau_sched_entity *entity = 
>> to_nouveau_sched_entity(job->base.entity);
>> +    int ret;
>> +
>> +    drm_exec_init(&job->exec, true);
>> +
>> +    ret = nouveau_job_add_deps(job);
>> +    if (ret)
>> +        goto out;
>> +
>> +    drm_sched_job_arm(&job->base);
>> +    job->done_fence = dma_fence_get(&job->base.s_fence->finished);
>> +
>> +    ret = nouveau_job_fence_attach(job, job->done_fence);
>> +    if (ret)
>> +        goto out;
>> +
>> +    if (job->ops->submit) {
>> +        ret = job->ops->submit(job);
>> +        if (ret)
>> +            goto out;
>> +    }
>> +
>> +    if (job->sync) {
>> +        drm_exec_fini(&job->exec);
>> +
>> +        /* We're requested to run a synchronous job, hence don't push
>> +         * the job, bypassing the job scheduler, and execute the jobs
>> +         * run() function right away.
>> +         *
>> +         * As a consequence of bypassing the job scheduler we need to
>> +         * handle fencing and job cleanup ourselfes.
>> +         */
>> +        ret = nouveau_job_run_sync(job);
>> +
>> +        /* If the job fails, the caller will do the cleanup for us. */
>> +        if (!ret)
>> +            nouveau_job_fini(job);
>> +
>> +        return ret;
>> +    } else {
>> +        mutex_lock(&entity->job.mutex);
>> +        drm_sched_entity_push_job(&job->base);
>> +        list_add_tail(&job->head, &entity->job.list);
>> +        mutex_unlock(&entity->job.mutex);
>> +    }
>> +
>> +out:
>> +    drm_exec_fini(&job->exec);
>> +    return ret;
>> +}
>> +
>> +static struct dma_fence *
>> +nouveau_sched_run_job(struct drm_sched_job *sched_job)
>> +{
>> +    struct nouveau_job *job = to_nouveau_job(sched_job);
>> +
>> +    return nouveau_job_run(job);
>> +}
>> +
>> +static enum drm_gpu_sched_stat
>> +nouveau_sched_timedout_job(struct drm_sched_job *sched_job)
>> +{
>> +    struct nouveau_job *job = to_nouveau_job(sched_job);
>> +    struct nouveau_channel *chan = job->chan;
>> +
>> +    if (unlikely(!atomic_read(&chan->killed)))
>> +        nouveau_channel_kill(chan);
>> +
>> +    NV_PRINTK(warn, job->cli, "job timeout, channel %d killed!\n",
>> +          chan->chid);
>> +
>> +    nouveau_sched_entity_fini(job->entity);
>> +
>> +    return DRM_GPU_SCHED_STAT_ENODEV;
>> +}
>> +
>> +static void
>> +nouveau_sched_free_job(struct drm_sched_job *sched_job)
>> +{
>> +    struct nouveau_job *job = to_nouveau_job(sched_job);
>> +    struct nouveau_sched_entity *entity = job->entity;
>> +
>> +    mutex_lock(&entity->job.mutex);
>> +    list_del(&job->head);
>> +    mutex_unlock(&entity->job.mutex);
>> +
>> +    nouveau_job_fini(job);
>> +}
>> +
>> +int nouveau_sched_entity_init(struct nouveau_sched_entity *entity,
>> +                  struct drm_gpu_scheduler *sched)
>> +{
>> +
>> +    INIT_LIST_HEAD(&entity->job.list);
>> +    mutex_init(&entity->job.mutex);
>> +
>> +    return drm_sched_entity_init(&entity->base,
>> +                     DRM_SCHED_PRIORITY_NORMAL,
>> +                     &sched, 1, NULL);
>> +}
>> +
>> +void
>> +nouveau_sched_entity_fini(struct nouveau_sched_entity *entity)
>> +{
>> +    drm_sched_entity_destroy(&entity->base);
>> +}
>> +
>> +static const struct drm_sched_backend_ops nouveau_sched_ops = {
>> +    .run_job = nouveau_sched_run_job,
>> +    .timedout_job = nouveau_sched_timedout_job,
>> +    .free_job = nouveau_sched_free_job,
>> +};
>> +
>> +int nouveau_sched_init(struct drm_gpu_scheduler *sched,
>> +               struct nouveau_drm *drm)
>> +{
>> +    long job_hang_limit = 
>> msecs_to_jiffies(NOUVEAU_SCHED_JOB_TIMEOUT_MS);
>> +
>> +    return drm_sched_init(sched, &nouveau_sched_ops,
>> +                  NOUVEAU_SCHED_HW_SUBMISSIONS, 0, job_hang_limit,
>> +                  NULL, NULL, "nouveau", drm->dev->dev);
>> +}
>> +
>> +void nouveau_sched_fini(struct drm_gpu_scheduler *sched)
>> +{
>> +    drm_sched_fini(sched);
>> +}
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.h 
>> b/drivers/gpu/drm/nouveau/nouveau_sched.h
>> new file mode 100644
>> index 000000000000..7fc5b7eea810
>> --- /dev/null
>> +++ b/drivers/gpu/drm/nouveau/nouveau_sched.h
>> @@ -0,0 +1,98 @@
>> +// SPDX-License-Identifier: MIT
>> +
>> +#ifndef NOUVEAU_SCHED_H
>> +#define NOUVEAU_SCHED_H
>> +
>> +#include <linux/types.h>
>> +
>> +#include <drm/drm_exec.h>
>> +#include <drm/gpu_scheduler.h>
>> +
>> +#include "nouveau_drv.h"
>> +#include "nouveau_exec.h"
>> +
>> +#define to_nouveau_job(sched_job)        \
>> +        container_of((sched_job), struct nouveau_job, base)
>> +
>> +#define to_nouveau_exec_job(job)        \
>> +        container_of((job), struct nouveau_exec_job, base)
>> +
>> +#define to_nouveau_bind_job(job)        \
>> +        container_of((job), struct nouveau_bind_job, base)
>> +
>> +struct nouveau_job {
>> +    struct drm_sched_job base;
>> +    struct list_head head;
>> +
>> +    struct nouveau_sched_entity *entity;
>> +
>> +    struct drm_file *file_priv;
>> +    struct nouveau_cli *cli;
>> +    struct nouveau_channel *chan;
>> +
>> +    struct drm_exec exec;
>> +    struct dma_fence *done_fence;
>> +
>> +    bool sync;
>> +
>> +    struct {
>> +        struct drm_nouveau_sync *s;
>> +        u32 count;
>> +    } in_sync;
>> +
>> +    struct {
>> +        struct drm_nouveau_sync *s;
>> +        u32 count;
>> +    } out_sync;
>> +
>> +    struct nouveau_job_ops {
>> +        int (*submit)(struct nouveau_job *);
>> +        struct dma_fence *(*run)(struct nouveau_job *);
>> +        void (*free)(struct nouveau_job *);
>> +    } *ops;
>> +};
>> +
>> +struct nouveau_exec_job {
>> +    struct nouveau_job base;
>> +
>> +    struct {
>> +        struct drm_nouveau_exec_push *s;
>> +        u32 count;
>> +    } push;
>> +};
>> +
>> +struct nouveau_bind_job {
>> +    struct nouveau_job base;
>> +
>> +    /* struct bind_job_op */
>> +    struct list_head ops;
>> +};
>> +
>> +int nouveau_bind_job_init(struct nouveau_bind_job **job,
>> +              struct nouveau_exec_bind *bind);
>> +int nouveau_exec_job_init(struct nouveau_exec_job **job,
>> +              struct nouveau_exec *exec);
>> +
>> +int nouveau_job_submit(struct nouveau_job *job);
>> +void nouveau_job_fini(struct nouveau_job *job);
>> +
>> +#define to_nouveau_sched_entity(entity)        \
>> +        container_of((entity), struct nouveau_sched_entity, base)
>> +
>> +struct nouveau_sched_entity {
>> +    struct drm_sched_entity base;
>> +    struct {
>> +        struct list_head list;
>> +        struct mutex mutex;
>> +    } job;
>> +};
>> +
>> +int nouveau_sched_entity_init(struct nouveau_sched_entity *entity,
>> +                  struct drm_gpu_scheduler *sched);
>> +void nouveau_sched_entity_fini(struct nouveau_sched_entity *entity);
>> +
>> +int nouveau_sched_init(struct drm_gpu_scheduler *sched,
>> +               struct nouveau_drm *drm);
>> +void nouveau_sched_fini(struct drm_gpu_scheduler *sched);
>> +
>> +#endif
> 

