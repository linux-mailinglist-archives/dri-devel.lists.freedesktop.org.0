Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 576EF9D1521
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 17:14:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94A3810E041;
	Mon, 18 Nov 2024 16:14:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="C/+cYasm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2599210E163
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2024 16:14:07 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id
 d75a77b69052e-460a8d1a9b7so500901cf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2024 08:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1731946446; x=1732551246;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KgQtX3b2sNjnE8zCLQLIEHU/IGPvSB2hdJmfWtj8vrk=;
 b=C/+cYasmTKafo6J66aO6do+rxytw9QgvrZgX3x/TK/3Gpe3gZ5FN5B6OhtXwXXvNaN
 8egDQdqaG2I3OICDQSGXeUKUeoWEndu4n2dbWomr+ubp1jN6k+FPbQK5ZfR4jbybpvVC
 gyyOtXarp2sRZiVOK0o7D3OPmgRCRfq7AERStq2mhe+WvIVg2NFZ9/wL/oKfZgQCJunR
 C8SusIB2/6zT+G5D9SCbAVxzNZcxic/0WIkTOhxkAkL8xlh+524VGM78j7nbp8eAODsK
 igRcY/M9a442RAtSqu3U5MemGUWm/rrFuI9AbKpiCjcbQQ8GEdWBZcVJxCs5/Dx88Z0G
 P+iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731946446; x=1732551246;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KgQtX3b2sNjnE8zCLQLIEHU/IGPvSB2hdJmfWtj8vrk=;
 b=KamugMQZy/a69dKCNS6JIDKONxFkJkx+yNaAov8gsaPqMegFaDsr5ed/EIDTFh2k0h
 O2LW/77aAcMOmVT+tGKHyLXFujqFHjQsb3hRh7X6Ke0ZhLhBLv4RcZ0cj1gdq6gC+fPC
 H1Jy6P+/rM4Pkpf70kHQTLPQ66+Ho5kYEzGb1JXPecrNSXIIt47HL82Fh9n112CLErgo
 VDUmRRfjEEBv8DfxcMVwram3+N0G68jpvvUsJCsYvUdADJopr/0IG3+rgwP/v247t+Pe
 /5PyQEP0Tik81Le7IILtgwRz+n90Fq7dwLvFC2XYMxmJPReNlP7YpzB9gjgzR4PO1kAk
 oI5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVycfh9mHRBUKL0oxKFsxYElEJVgIaEcN3TC3HOhcCKqWgT+yhXhCUQJM30MfslivpCAXuPqIhV9Fc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz658I5x0dLn8mLPR6CdD4fiNUAG7H/InzTpkKwYy71fEuCUYLI
 v62clrjMmx0K9ExUxfgTTZ1QGADQ1vXpj9TTv8veYeZuUt7MtCN4G8NFk6DFF0sZwAzMSaVNrmM
 7lvccwpeTj39EG/71byYnjonkXefnnlA1iWIf
X-Gm-Gg: ASbGnctu0TaIwx5Jjpy7raDwWcM4MtveCybBVLNL0vsANqQ+TIQ+AsFi7kgHT5y1l3n
 +NaeC49G/z0z/zcE4JDT83z1TKVdKUA==
X-Google-Smtp-Source: AGHT+IHoE7/aCHotukRoUu4H4VbQ1/F4lGejyuSD3dcDuVxfpACZZ6+M09T7GFjLtVDZR877r1fa0KWxO45WSo9TeDk=
X-Received: by 2002:a05:622a:2988:b0:462:c158:9f5b with SMTP id
 d75a77b69052e-4637156d12fmr5824231cf.19.1731946445606; Mon, 18 Nov 2024
 08:14:05 -0800 (PST)
MIME-Version: 1.0
References: <20241117170326.1971113-1-tjmercier@google.com>
 <468d41ad-9f89-4a83-8eb1-9bd7efaf1367@ursulin.net>
In-Reply-To: <468d41ad-9f89-4a83-8eb1-9bd7efaf1367@ursulin.net>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Mon, 18 Nov 2024 08:13:54 -0800
Message-ID: <CABdmKX2203KMx5P2x02C=YFCtiR6b5u2JzLS9SbPRh08FzqAKw@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: Fix __dma_buf_debugfs_list_del argument for
 !CONFIG_DEBUG_FS
To: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 18, 2024 at 1:15=E2=80=AFAM Tvrtko Ursulin <tursulin@ursulin.ne=
t> wrote:
>
>
> On 17/11/2024 17:03, T.J. Mercier wrote:
> > The arguments for __dma_buf_debugfs_list_del do not match for both the
> > CONFIG_DEBUG_FS case and the !CONFIG_DEBUG_FS case. The !CONFIG_DEBUG_F=
S
> > case should take a struct dma_buf *, but it's currently struct file *.
> > This can lead to the build error:
> >
> > error: passing argument 1 of =E2=80=98__dma_buf_debugfs_list_del=E2=80=
=99 from
> > incompatible pointer type [-Werror=3Dincompatible-pointer-types]
> >
> > dma-buf.c:63:53: note: expected =E2=80=98struct file *=E2=80=99 but arg=
ument is of
> > type =E2=80=98struct dma_buf *=E2=80=99
> >     63 | static void __dma_buf_debugfs_list_del(struct file *file)
> >
> > Fixes: bfc7bc539392 ("dma-buf: Do not build debugfs related code when !=
CONFIG_DEBUG_FS")
> > Signed-off-by: T.J. Mercier <tjmercier@google.com>
> > ---
> >   drivers/dma-buf/dma-buf.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > index 8892bc701a66..afb8c1c50107 100644
> > --- a/drivers/dma-buf/dma-buf.c
> > +++ b/drivers/dma-buf/dma-buf.c
> > @@ -60,7 +60,7 @@ static void __dma_buf_debugfs_list_add(struct dma_buf=
 *dmabuf)
> >   {
> >   }
> >
> > -static void __dma_buf_debugfs_list_del(struct file *file)
> > +static void __dma_buf_debugfs_list_del(struct dma_buf *dmabuf)
> >   {
> >   }
> >   #endif
>
> Huh I wonder how this sneaked by until now.. thanks for fixing!
>
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>
> Regards,
>
> Tvrtko

Thanks Tvrtko. Upstream there is currently only the one use where it's
called with a void pointer which doesn't generate the error, but
KernelCI caught the problem on an Android branch where it's also
called with a dma_buf pointer:

https://dashboard.kernelci.org/tree/5a4c93e2f794001a5efa13c0dec931235240d38=
4/build/maestro:6737e60d1a48e7821930345d?tableFilter=3D%7B%22buildsTable%22=
%3A%22invalid%22%2C%22bootsTable%22%3A%22all%22%2C%22testsTable%22%3A%22all=
%22%7D&origin=3Dmaestro&currentPageTab=3DtreeDetails.builds&diffFilter=3D%7=
B%7D&treeInfo=3D%7B%22gitBranch%22%3A%22android16-6.12%22%2C%22gitUrl%22%3A=
%22https%3A%2F%2Fandroid.googlesource.com%2Fkernel%2Fcommon%22%2C%22treeNam=
e%22%3A%22android%22%2C%22commitName%22%3A%22ASB-2024-11-05_16-6.12-370-g5a=
4c93e2f7940%22%2C%22headCommitHash%22%3A%225a4c93e2f794001a5efa13c0dec93123=
5240d384%22%7D&intervalInDays=3D7
