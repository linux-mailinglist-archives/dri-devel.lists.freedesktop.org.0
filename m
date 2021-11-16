Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 812F3451FB1
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 01:42:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A61D46ECC4;
	Tue, 16 Nov 2021 00:42:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA3B96EC74
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 00:42:06 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id s139so38498541oie.13
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 16:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=R5eOgQLLM4QxME5CDs41GNmTwkVxPDAe8ZaxJG3cpYo=;
 b=Jw+xywDv6rQDFegmQ+p8I8vbmyAhlppO/fXJPKq30zTZ6h985lp7mIdHxHN8DIm8l4
 w2w+N4rX8MqwdPTeZzZ15zmsHaXeiBquVl2DIgssLv3Suk8647Um9ihNRaRbKXMMIEM+
 1PiYO3AICbst90OOZW9uBGuZbyVMqlb/lKTZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=R5eOgQLLM4QxME5CDs41GNmTwkVxPDAe8ZaxJG3cpYo=;
 b=H0VIJEmNBtz0K5+nLhRrQFTR/uP3CqF6mXHhl9syzbx6ZT+sJM4Rv+8SABRmoNAk5+
 tSXmbkQtwZcZe0PQPnHY3660rW8RCuio+LWxGaUpKagUT321Nfswsmcj94UFfdTNrAHS
 z/i8zvY4n6CCX6AGbcjNVCE53md90Zk/peyJHVUqSCbSTP53WSAHRA63WAKoGyNw/IY6
 1BCV3MEZL70ZD35Y17+YdxVvOL7KFZvTxOXv4uwhr3xB4j4G3tnR8gXpRwC2jXnkJQdE
 bTgf+F+B0ZSlQZsbyYN6MdP3cwaOx1nmqnkoCBGS+LmlrWR8578BMBjNKREs72Sh37Rg
 ODag==
X-Gm-Message-State: AOAM531dyAKg65E62PLEbAuzkIq+4nhApOT4msvqkN9jYcKVBFaVf4UC
 YZKyL89Jl17e5auWS4ofasQq8dkuxNIU8i+90q6FWA==
X-Google-Smtp-Source: ABdhPJzN6lMpvqQKlLXPZAElkaHQvyXykKQoORKEtFyKD4aeINCYFsH8oohTwEDsg6XATxYIXS1ZSzkE8GNN2oLbr6M=
X-Received: by 2002:a05:6808:211f:: with SMTP id
 r31mr2706331oiw.64.1637023325967; 
 Mon, 15 Nov 2021 16:42:05 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 15 Nov 2021 16:42:05 -0800
MIME-Version: 1.0
In-Reply-To: <20211110113334.1.I1687e716adb2df746da58b508db3f25423c40b27@changeid>
References: <20211110113334.1.I1687e716adb2df746da58b508db3f25423c40b27@changeid>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Mon, 15 Nov 2021 16:42:05 -0800
Message-ID: <CAE-0n52YFUmX826kPyXEP+g4avoS2FM2wsph4Uu9DFwp37swZA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Fix mmap to include VM_IO and VM_DONTDUMP
To: Douglas Anderson <dianders@chromium.org>, Rob Clark <robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Douglas Anderson (2021-11-10 11:33:42)
> In commit 510410bfc034 ("drm/msm: Implement mmap as GEM object
> function") we switched to a new/cleaner method of doing things. That's
> good, but we missed a little bit.
>
> Before that commit, we used to _first_ run through the
> drm_gem_mmap_obj() case where `obj->funcs->mmap()` was NULL. That meant
> that we ran:
>
>   vma->vm_flags |= VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP;
>   vma->vm_page_prot = pgprot_writecombine(vm_get_page_prot(vma->vm_flags));
>   vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
>
> ...and _then_ we modified those mappings with our own. Now that
> `obj->funcs->mmap()` is no longer NULL we don't run the default
> code. It looks like the fact that the vm_flags got VM_IO / VM_DONTDUMP
> was important because we're now getting crashes on Chromebooks that
> use ARC++ while logging out. Specifically a crash that looks like this
> (this is on a 5.10 kernel w/ relevant backports but also seen on a
> 5.15 kernel):
>
>   Unable to handle kernel paging request at virtual address ffffffc008000000
>   Mem abort info:
>     ESR = 0x96000006
>     EC = 0x25: DABT (current EL), IL = 32 bits
>     SET = 0, FnV = 0
>     EA = 0, S1PTW = 0
>   Data abort info:
>     ISV = 0, ISS = 0x00000006
>     CM = 0, WnR = 0
>   swapper pgtable: 4k pages, 39-bit VAs, pgdp=000000008293d000
>   [ffffffc008000000] pgd=00000001002b3003, p4d=00000001002b3003,
>                      pud=00000001002b3003, pmd=0000000000000000
>   Internal error: Oops: 96000006 [#1] PREEMPT SMP
>   [...]
>   CPU: 7 PID: 15734 Comm: crash_dump64 Tainted: G W 5.10.67 #1 [...]
>   Hardware name: Qualcomm Technologies, Inc. sc7280 IDP SKU2 platform (DT)
>   pstate: 80400009 (Nzcv daif +PAN -UAO -TCO BTYPE=--)
>   pc : __arch_copy_to_user+0xc0/0x30c
>   lr : copyout+0xac/0x14c
>   [...]
>   Call trace:
>    __arch_copy_to_user+0xc0/0x30c
>    copy_page_to_iter+0x1a0/0x294
>    process_vm_rw_core+0x240/0x408
>    process_vm_rw+0x110/0x16c
>    __arm64_sys_process_vm_readv+0x30/0x3c
>    el0_svc_common+0xf8/0x250
>    do_el0_svc+0x30/0x80
>    el0_svc+0x10/0x1c
>    el0_sync_handler+0x78/0x108
>    el0_sync+0x184/0x1c0
>   Code: f8408423 f80008c3 910020c6 36100082 (b8404423)
>
> Let's add the two flags back in.
>
> While we're at it, the fact that we aren't running the default means
> that we _don't_ need to clear out VM_PFNMAP, so remove that and save
> an instruction.
>
> NOTE: it was confirmed that VM_IO was the important flag to fix the
> problem I was seeing, but adding back VM_DONTDUMP seems like a sane
> thing to do so I'm doing that too.
>
> Fixes: 510410bfc034 ("drm/msm: Implement mmap as GEM object function")
> Reported-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Tested-by: Stephen Boyd <swboyd@chromium.org>
