Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78135757553
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 09:28:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72FB910E2E1;
	Tue, 18 Jul 2023 07:28:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com
 [IPv6:2607:f8b0:4864:20::112b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4808A10E284
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 16:13:10 +0000 (UTC)
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-56fff21c2ebso46945457b3.3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 09:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paul-moore.com; s=google; t=1689610389; x=1692202389;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8CqPKH8zLjxPG0T2aNpKAIqJzacVH6EbJBb3LjExpjw=;
 b=cQpEj7wQVECv/U9cTpn+RN55ujAIWvks3MU4IX4Wr/hwnFIe0F/qx5YUKjSMpnx703
 CHzs0WWQ7uBihIAx5z5eiCKmCaltnArXhlaNRgavYeytVm5vSw/gQiRT1py2AerifbO6
 AiJnYOTJCz0R2HkNoD7T9Yf9t3z2uTFa83xyLrtRemXVRe2lrXcVvM5qyrJMMViUNE7U
 6aLZBv3MPfrrvSHz+w10LReOyQijeOLBQAf/Jl5WjQxapxktKezBDH2erUpWfo+TfrZS
 RnuZ/YnESkQ6HSr7gO5+BgLJh/oDlySt0yQzLcBh/BGfPb0h9TdwTyAHNWQPywULEg7z
 BUVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689610389; x=1692202389;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8CqPKH8zLjxPG0T2aNpKAIqJzacVH6EbJBb3LjExpjw=;
 b=WWFhESOTHhVoTN3ghu4Z0w49rCyEcBJuwoFUt0jW9kDSzRYHPzvdH7RowAYLJ1O1+o
 DjkmeFzmVvIwiLZsztmcpQhqPsIoi1v8UUdsn2mkQWG5llmY/AsYmhie7d/NcANOJuGM
 nXZ3hpvXqKDXhWiKtWwZjz2tkLJiTxzqmsJZ2yhrO3Y3N53Ir95BUCBGbomFEGrdbQWh
 tS9qLRxkxnZAuuC1nKzVLZPD9RMklFilB1PftsjKJyvJKlDWa5ji5M6mnYHa63IlGcU4
 Ti3jUB7+HSojXU45+U+DY4lPac4RDSHnVEwfgG9O7pCknrKjt0x+gCKlndnDRTYsMI3M
 uhtg==
X-Gm-Message-State: ABy/qLbLaOaD5cSj1d1NrqNfedT3sU/ZsVCFjLi3dvujcqjmc7nNElVa
 3YUhkBsw+IVx0AJwOj0Lr8b20Q4YLkqWa5Hf/HdUOBF7iFPBS1I=
X-Google-Smtp-Source: APBJJlGog4dyfGlwFIS3iBtcrvJFLeH/ogm5YcXS+semC1utnZAcGzlBZgUKou2DvMgGuYXX4nNPAERtXRDz/TQJF88=
X-Received: by 2002:a81:67c1:0:b0:577:2fda:f181 with SMTP id
 b184-20020a8167c1000000b005772fdaf181mr12551811ywc.44.1689610388723; Mon, 17
 Jul 2023 09:13:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230712143831.120701-1-wangkefeng.wang@huawei.com>
 <20230712143831.120701-5-wangkefeng.wang@huawei.com>
In-Reply-To: <20230712143831.120701-5-wangkefeng.wang@huawei.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 17 Jul 2023 12:12:58 -0400
Message-ID: <CAHC9VhSU=T5FEP=sZyNukykE-xRzWsqyddS2-+sEsy2bmfGHKQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] selinux: use vma_is_stack() and vma_is_heap()
To: Kefeng Wang <wangkefeng.wang@huawei.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 18 Jul 2023 07:28:04 +0000
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
Cc: selinux@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-perf-users@vger.kernel.org,
 linux-mm@kvack.org, amd-gfx@lists.freedesktop.org,
 linux-fsdevel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 12, 2023 at 10:25=E2=80=AFAM Kefeng Wang <wangkefeng.wang@huawe=
i.com> wrote:
>
> Use the helpers to simplify code.
>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>  security/selinux/hooks.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
> index 4e46cf3d67b6..289ef2d6a427 100644
> --- a/security/selinux/hooks.c
> +++ b/security/selinux/hooks.c
> @@ -3775,13 +3775,10 @@ static int selinux_file_mprotect(struct vm_area_s=
truct *vma,
>         if (default_noexec &&
>             (prot & PROT_EXEC) && !(vma->vm_flags & VM_EXEC)) {
>                 int rc =3D 0;
> -               if (vma->vm_start >=3D vma->vm_mm->start_brk &&
> -                   vma->vm_end <=3D vma->vm_mm->brk) {
> +               if (vma_is_heap(vma)) {
>                         rc =3D avc_has_perm(sid, sid, SECCLASS_PROCESS,
>                                           PROCESS__EXECHEAP, NULL);
> -               } else if (!vma->vm_file &&
> -                          ((vma->vm_start <=3D vma->vm_mm->start_stack &=
&
> -                            vma->vm_end >=3D vma->vm_mm->start_stack) ||
> +               } else if (!vma->vm_file && vma_is_stack(vma) ||
>                             vma_is_stack_for_current(vma))) {

With the parens fix that Andrew already provided.

Acked-by: Paul Moore <paul@paul-moore.com>

>                         rc =3D avc_has_perm(sid, sid, SECCLASS_PROCESS,
>                                           PROCESS__EXECSTACK, NULL);
> --
> 2.41.0

--=20
paul-moore.com
