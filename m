Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C1675ABD2
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 12:23:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F35F10E109;
	Thu, 20 Jul 2023 10:23:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com
 [IPv6:2607:f8b0:4864:20::92e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39D5310E438;
 Wed, 19 Jul 2023 09:02:35 +0000 (UTC)
Received: by mail-ua1-x92e.google.com with SMTP id
 a1e0cc1a2514c-799a451ca9cso1128668241.2; 
 Wed, 19 Jul 2023 02:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20221208; t=1689757354; x=1692349354;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dxIwZYUXAuriCTTrhHVqHKddrsis7m+qCsP3HgdIynU=;
 b=roMthWZenYjFJbkbM2mH9bPO4Bf42B0BRdA0sdFpwN48PKQ9gk4TZacDsuyYpWMUtU
 l7XYUiMzUMAy/phDMUaatUjESkkXKZSAnkJ4YsFYi4LHKq1cuYFBne+6nU2905/UPcSF
 eiRoC/YPnk4Xfg/OHZHNVe0aaySC7Dum98v/RDAWN8si4j+7KTylat/B7KzsdUU52gR0
 ATZdikwexy+mWOAK83xK6JMDtH6htGdJ9v/DCaLbaPTlmTZwkNX8scIlclg0p8FahA0R
 h6FoIIVMuIN5v6FVCN4uWBK72xyHC8S/m8tYhlYULPyoo8BMP5rmm5j7YoomYtBCUVRH
 okmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689757354; x=1692349354;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dxIwZYUXAuriCTTrhHVqHKddrsis7m+qCsP3HgdIynU=;
 b=Jz+KC7HWYsVbOTSRFGX5jGx3beUhktezHACccZezvJcy2CPvabuxSL1FzrpbQcfPF7
 F/1YS5hqJHSJyZauHqVA+9UQWta0gHObynPnbGsH06dYY8+WU5dt6qFeeHxs7KIS5Hqr
 izlV+oP1pSguG+siU8BApjTX5IShp1TOB3PEoImvwb5wdJOnPG408Zm9VCK7k5RviXML
 CSJaApXMRb5qr/9BAQPwY0EwoY8wJfabT+my64xrMs3ZEn+UtHp7XfSzlgwH6g+QUNBu
 5bBGQeM6ji7FvEM8ILyHflBWQ3HBewsgbpNe8yeKf5KagCnqZwQ/W2xYrHEsRkRSEmv3
 MLlg==
X-Gm-Message-State: ABy/qLaIDB8Ijv6U4GCYBNCvm9PgknE6joSNr5a5aJrlJH7zua5BYPIs
 adnzLabMaY0VT8ZaDyC9D4uyh0O5nI5FC7hmfXw=
X-Google-Smtp-Source: APBJJlFGC7hcxDjV2bvRpf7CwCMnWqPqtKrErYoLtJJRVn7WV3aGJI76Q4oBgWPzIE71Uc7VS02UNu6Z+sX11RmvnXE=
X-Received: by 2002:a67:ce82:0:b0:443:6e00:d32 with SMTP id
 c2-20020a67ce82000000b004436e000d32mr8825653vse.8.1689757353731; Wed, 19 Jul
 2023 02:02:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230719075127.47736-1-wangkefeng.wang@huawei.com>
 <20230719075127.47736-4-wangkefeng.wang@huawei.com>
In-Reply-To: <20230719075127.47736-4-wangkefeng.wang@huawei.com>
From: =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>
Date: Wed, 19 Jul 2023 11:02:22 +0200
Message-ID: <CAJ2a_DfGvPeDuN38UBXD4f2928n9GZpHFgdiPo9MoSAY7YXeOg@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] selinux: use vma_is_initial_stack() and
 vma_is_initial_heap()
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 20 Jul 2023 10:23:05 +0000
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
Cc: Paul Moore <paul@paul-moore.com>, selinux@vger.kernel.org,
 Stephen Smalley <stephen.smalley.work@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-perf-users@vger.kernel.org,
 linux-mm@kvack.org, amd-gfx@lists.freedesktop.org,
 linux-fsdevel@vger.kernel.org, Eric Paris <eparis@parisplace.org>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 19 Jul 2023 at 09:40, Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
>
> Use the helpers to simplify code.
>
> Cc: Paul Moore <paul@paul-moore.com>
> Cc: Stephen Smalley <stephen.smalley.work@gmail.com>
> Cc: Eric Paris <eparis@parisplace.org>
> Acked-by: Paul Moore <paul@paul-moore.com>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>  security/selinux/hooks.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
> index d06e350fedee..ee8575540a8e 100644
> --- a/security/selinux/hooks.c
> +++ b/security/selinux/hooks.c
> @@ -3762,13 +3762,10 @@ static int selinux_file_mprotect(struct vm_area_struct *vma,
>         if (default_noexec &&
>             (prot & PROT_EXEC) && !(vma->vm_flags & VM_EXEC)) {
>                 int rc = 0;
> -               if (vma->vm_start >= vma->vm_mm->start_brk &&
> -                   vma->vm_end <= vma->vm_mm->brk) {
> +               if (vma_is_initial_heap(vma)) {

This seems to change the condition from

    vma->vm_start >= vma->vm_mm->start_brk && vma->vm_end <= vma->vm_mm->brk

to

    vma->vm_start <= vma->vm_mm->brk && vma->vm_end >= vma->vm_mm->start_brk

(or AND arguments swapped)

    vma->vm_end >= vma->vm_mm->start_brk && vma->vm_start <= vma->vm_mm->brk

Is this intended?

>                         rc = avc_has_perm(sid, sid, SECCLASS_PROCESS,
>                                           PROCESS__EXECHEAP, NULL);
> -               } else if (!vma->vm_file &&
> -                          ((vma->vm_start <= vma->vm_mm->start_stack &&
> -                            vma->vm_end >= vma->vm_mm->start_stack) ||
> +               } else if (!vma->vm_file && (vma_is_initial_stack(vma) ||
>                             vma_is_stack_for_current(vma))) {
>                         rc = avc_has_perm(sid, sid, SECCLASS_PROCESS,
>                                           PROCESS__EXECSTACK, NULL);
> --
> 2.27.0
>
