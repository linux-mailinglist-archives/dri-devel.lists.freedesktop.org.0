Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F133ACACCA3
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 11:05:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA29910E353;
	Mon,  8 Dec 2025 10:05:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="S6+lr/6J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD5DC10E2F1
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Dec 2025 10:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765188329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+5DRB1WNuUEh9dw4lXaZHc8OhCgJ52BllgGJz6/xq6I=;
 b=S6+lr/6Jw4cJNuK/sCZx77WVJCD2QxCvtCpYlZqG3Rt4FSN5hz4nMmSl2DmpkdiDRNiyBj
 a21hR/notsNORVRDdAFb+A0/vsvG3QOv3jzGRXqrdelosIfCAdgVxqmcu4SJmPwriQFyg7
 So2JH2BFxBuAspc36WNqTdFpO5gUsxo=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-518-a3Wu67K0PRGCb4fHriYFCg-1; Mon,
 08 Dec 2025 05:05:25 -0500
X-MC-Unique: a3Wu67K0PRGCb4fHriYFCg-1
X-Mimecast-MFC-AGG-ID: a3Wu67K0PRGCb4fHriYFCg_1765188322
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id A154A19560AD; Mon,  8 Dec 2025 10:05:21 +0000 (UTC)
Received: from fedora (unknown [10.45.224.91])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP
 id 794571800357; Mon,  8 Dec 2025 10:05:11 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
 oleg@redhat.com; Mon,  8 Dec 2025 11:05:21 +0100 (CET)
Date: Mon, 8 Dec 2025 11:05:09 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Christian Brauner <brauner@kernel.org>,
 Carlos Llamas <cmllamas@google.com>,
 Suren Baghdasaryan <surenb@google.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 =?iso-8859-1?Q?Adri=E1n?= Larumbe <adrian.larumbe@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Liviu Dudau <liviu.dudau@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Leon Romanovsky <leon@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 netdev@vger.kernel.org
Subject: Re: [PATCH 4/7] drm/amd: kill the outdated "Only the pthreads
 threading model is supported" checks
Message-ID: <aTai1a2sFqTh7wv9@redhat.com>
References: <aTV1jTmYK3Bjh4k6@redhat.com>
 <e8846bef-2a6b-4552-8fb6-a33a00273aab@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e8846bef-2a6b-4552-8fb6-a33a00273aab@amd.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
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

On 12/08, Christian König wrote:
>
> On 12/7/25 13:39, Oleg Nesterov wrote:
> > Nowaday task->group_leader->mm != task->mm is only possible if
> > a) task is not a group leader and b) task->group_leader->mm == NULL
> > because task->group_leader has already exited using sys_exit().
>
> Just for my understanding: That is because CLONE_THREAD can only be
> specified together with CLONE_SIGHAND and CLONE_VM, correct?

Yes, copy copy_process() does

	if ((clone_flags & CLONE_THREAD) && !(clone_flags & CLONE_SIGHAND))
		return ERR_PTR(-EINVAL);

	if ((clone_flags & CLONE_SIGHAND) && !(clone_flags & CLONE_VM))
		return ERR_PTR(-EINVAL);

	...

	if (clone_flags & CLONE_THREAD) {
		p->group_leader = current->group_leader;
		p->tgid = current->tgid;
	} else {
		p->group_leader = p;
		p->tgid = p->pid;
	}
> Reviewed-by: Christian König <christian.koenig@amd.com>

Thanks!

> Should we pick that one up or do you want to merge it upstream somehow?

If you don't object, I would like to route this series via -mm tree.

See 0/7, I am going to send more (simple) tree-wide changes which depend
on this series.

Oleg.

> Regards,
> Christian.
>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c   |  3 ---
> >  drivers/gpu/drm/amd/amdkfd/kfd_process.c | 10 ----------
> >  2 files changed, 13 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> > index a0f8ba382b9e..e44f158a11f0 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> > @@ -2551,9 +2551,6 @@ void amdgpu_vm_set_task_info(struct amdgpu_vm *vm)
> >  	vm->task_info->task.pid = current->pid;
> >  	get_task_comm(vm->task_info->task.comm, current);
> >
> > -	if (current->group_leader->mm != current->mm)
> > -		return;
> > -
> >  	vm->task_info->tgid = current->tgid;
> >  	get_task_comm(vm->task_info->process_name, current->group_leader);
> >  }
> > diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> > index a085faac9fe1..f8ef18a3aa71 100644
> > --- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> > +++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> > @@ -833,12 +833,6 @@ struct kfd_process *kfd_create_process(struct task_struct *thread)
> >  	if (!(thread->mm && mmget_not_zero(thread->mm)))
> >  		return ERR_PTR(-EINVAL);
> >
> > -	/* Only the pthreads threading model is supported. */
> > -	if (thread->group_leader->mm != thread->mm) {
> > -		mmput(thread->mm);
> > -		return ERR_PTR(-EINVAL);
> > -	}
> > -
> >  	/* If the process just called exec(3), it is possible that the
> >  	 * cleanup of the kfd_process (following the release of the mm
> >  	 * of the old process image) is still in the cleanup work queue.
> > @@ -918,10 +912,6 @@ struct kfd_process *kfd_get_process(const struct task_struct *thread)
> >  	if (!thread->mm)
> >  		return ERR_PTR(-EINVAL);
> >
> > -	/* Only the pthreads threading model is supported. */
> > -	if (thread->group_leader->mm != thread->mm)
> > -		return ERR_PTR(-EINVAL);
> > -
> >  	process = find_process(thread, false);
> >  	if (!process)
> >  		return ERR_PTR(-EINVAL);
>

