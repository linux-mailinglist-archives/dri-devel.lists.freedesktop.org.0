Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CA773FFED
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 17:42:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1392910E010;
	Tue, 27 Jun 2023 15:42:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E69DA10E305
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 15:42:21 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id
 5614622812f47-39e8a7701f0so3362173b6e.3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 08:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687880540; x=1690472540;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DDRNmsVFsUEzri1TiBcwZTCSnwb9CdHf8yN+aQyD2Zo=;
 b=iGtUT+wYmd1N5nrA9eCGC4XMWdhXhQB9DTHbOeixdjWQ3ItWfNhCPaldpFSYejYaii
 vcCtEJ+1yTtNmtKOxR+J2AjkfiLW8nTgF4zkFUkqUhNLydDyjLWZ9wQ//iIyatgkEWE6
 t7PDkmpEQAOEX3MMPgoUBBqtUBS+qkgubJwfApvwq+Z5NE2HntG+Nu7daMlSSN/qqA3x
 OT3MxS2d8+c1ZrhKq18ykWEU+vO6qPOeGY5X5a5zUMndj8h9qXfVKEap2BkbSk26qQ/D
 MUhvo6kei8erCh54HgiuKaELbh+JY/f1woNuE8+vIn8m8yklhdDbbllcIMR3xtYLpM+w
 gDEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687880540; x=1690472540;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DDRNmsVFsUEzri1TiBcwZTCSnwb9CdHf8yN+aQyD2Zo=;
 b=DUIv5QDfDeo7YTf5pZl3j5GS75KaCKZaCR919suoe2+QCxeP/AZ6PQRJrXI34ZPT0/
 dxuwX17NeqBTEu+q4OLdWD7n/oxu7SkeMoKFgqQLhDcs7XZsun9PCvwaubz5XJKiI4z6
 07mqPgnzcvjz5nP57dS2eNJCslP/FSb8B46Y4dUrGtUdunrmnGs2fYvuQ0YOtQ3FhEQo
 u8HJGHvHlWHyTJX5PiICi3MrbdR2qwNXa5qEkKDZXeAu+PojFqhAlbnAJmURDX001rcZ
 4/rOzD5QKMv6CKLERezGxJposd0f6DIMzKgsU+eQ8rA9HFvz30Q1utGVYwedwP6JX+r6
 2e5g==
X-Gm-Message-State: AC+VfDzT0gSQrDwqiyyrJe6vsZGw1pyOzk6L+9p/ayahJAeemPi7lT3l
 pwvQ8ncA3CX0JZYy0c+ezOUYYgrakUhBunqjxFg=
X-Google-Smtp-Source: ACHHUZ6QB04hX23R/ptsB5Ruw1h406hCLoPrKXqy7Rq5aJ4OkJYOL5i06eZkzncQMIUr7s8ICA63/FF0AKmS3+vUJh8=
X-Received: by 2002:a05:6808:274c:b0:39a:815d:8aad with SMTP id
 eh12-20020a056808274c00b0039a815d8aadmr25379955oib.11.1687880540497; Tue, 27
 Jun 2023 08:42:20 -0700 (PDT)
MIME-Version: 1.0
References: <b551fb687a07e1461ca325c6951e96f4f962941a.camel@redhat.com>
In-Reply-To: <b551fb687a07e1461ca325c6951e96f4f962941a.camel@redhat.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 27 Jun 2023 11:42:09 -0400
Message-ID: <CADnq5_N-0DV7PpOwjMAp2ZdOEBYiJRWw4duo-g07AL7Mo5kS7Q@mail.gmail.com>
Subject: Re: Why does kgd2kfd_interrupt() have to schedule work on a specific
 CPU?
To: Philipp Stanner <pstanner@redhat.com>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>, "Yang, Philip" <Philip.Yang@amd.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+Felix, Philip

On Tue, Jun 27, 2023 at 4:42=E2=80=AFAM Philipp Stanner <pstanner@redhat.co=
m> wrote:
>
> Hello folks,
>
> I'm currently trying to learn more about DRM and discovered the
> following code sequence:
>
>
> drivers/gpu/drm/amd/amdkfd/kfd_device.c, Line 824 on 6.4-rc7
>
> static inline void kfd_queue_work(struct workqueue_struct *wq,
>                                   struct work_struct *work)
> {
>         int cpu, new_cpu;
>
>         cpu =3D new_cpu =3D smp_processor_id();
>         do {
>                 new_cpu =3D cpumask_next(new_cpu, cpu_online_mask) % nr_c=
pu_ids;
>                 if (cpu_to_node(new_cpu) =3D=3D numa_node_id())
>                         break;
>         } while (cpu !=3D new_cpu);
>
>         queue_work_on(new_cpu, wq, work);
> }
>
> /* This is called directly from KGD at ISR. */
> void kgd2kfd_interrupt(struct kfd_dev *kfd, const void *ih_ring_entry)
> {
>         uint32_t patched_ihre[KFD_MAX_RING_ENTRY_SIZE];
>         bool is_patched =3D false;
>         unsigned long flags;
>
>         if (!kfd->init_complete)
>                 return;
>
>         if (kfd->device_info.ih_ring_entry_size > sizeof(patched_ihre)) {
>                 dev_err_once(kfd_device, "Ring entry too small\n");
>                 return;
>         }
>
>         spin_lock_irqsave(&kfd->interrupt_lock, flags);
>
>         if (kfd->interrupts_active
>             && interrupt_is_wanted(kfd, ih_ring_entry,
>                                    patched_ihre, &is_patched)
>             && enqueue_ih_ring_entry(kfd,
>                                      is_patched ? patched_ihre : ih_ring_=
entry))
>                 kfd_queue_work(kfd->ih_wq, &kfd->interrupt_work);
>
>         spin_unlock_irqrestore(&kfd->interrupt_lock, flags);
> }
>
>
> These functions seem to be exclusively invoked by amdgpu_irq_dispatch()
> in amdgpu_irq.c
> At first glance it seems to me that it's just a typical scenario taking
> place here: Interrupt arises, interrupt submits work to wq, then jumps
> back to sleep / former process execution context again.
>
> What I don't understand is why it's apparently important to schedule
> the work on a particular CPU.
>
> It seems that the do-while in kfd_queue_work() is searching for a CPU
> within the same NUMA-Node. Thus I suspect that this is done because
> either
> a) performance requires it or
> b) the work-function needs access to something that's only available
>    within the same node.
>
> I suspect there is an interrupt-related reason why that particular work
> should be enqueued on a specific CPU. Just by reading the code alone I
> can't really figure out why precisely that's necessary, though.
>
> Does someone have any hints for me? :)
>
> Cheers,
> Philipp
>
>
