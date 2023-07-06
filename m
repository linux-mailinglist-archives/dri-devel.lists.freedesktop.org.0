Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1143D749EBB
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 16:13:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D6D910E40C;
	Thu,  6 Jul 2023 14:13:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0923410E40B
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jul 2023 14:13:17 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4fba1288bbdso964266e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jul 2023 07:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688652794; x=1691244794;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1yEX9Dwmq9IkMrVkFypkMcFrtVKqN7sxBEMnk/SfYko=;
 b=KIbzE3tBdsBciOOqSRH6/ZZfBehQKzbpLVe1oWyG9ekBBtoqnRWtHPaFa4zHIZkzkG
 TOFHrh+UvfoOV1vfnabddR9BxdOMEAtBmlcSzgEain4XZ7kx1hKTY7BXWIZjLBd47k5R
 nXLVu9RK9ofZQfWoICT9wmFOtHcQ0a9b8zgrGnd4RMEKfPahZD5ul67d/y/AwW26YKbP
 WLqaUtcrBoO+AFwc2zsxOiGq8hKPsYXgPnPO5LkBH4RjehlRPUSl2NXX4ERqCdg40JSt
 c9zmYv1wziwZPoolLx0EHe9SO0jUlyFYY6pAC9ANzRJzhHdJAWsLak6dYIfoanqP7MuE
 u0cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688652794; x=1691244794;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1yEX9Dwmq9IkMrVkFypkMcFrtVKqN7sxBEMnk/SfYko=;
 b=AaMCggXd2A6ha6K/8797r8PSWorRhRMV20LEh2J/Qnz4j8XWbEwbsGwmgzPFJyj+o7
 LtjVtcKObUmKq6YfiO37KKZUOfEkCNflOutmbkR1qLY5IMjy18y6LPz2Mi+JYx/OLrnJ
 jdY/g8XuOaJRQLwU/Nw4y2Sch4JwxZe5jQDIuUtlzAANmOVP4CLrMpBMdQ/Fk9At6I4v
 +OB8X8MOBbtXw4t7g/7A8iG04/ayKODOAYwEN61VN+8UiIAVKxL7h3PMf7ugxaGFJj2a
 ChtozrDUjmio+cdviGWzmfunNdQ76lf/BOWfnruryXoi/Da3IaH2LuG6PB58648OxxhK
 VKUg==
X-Gm-Message-State: ABy/qLbW6Sgy2L4wYAYkIG6k2SAX14iRin7l82xicjp4ElqfnQ++fGG8
 8Vxlm2/Odvbr/rmq/GKjm7VFfhinwu0hE2pZXJOwMA==
X-Google-Smtp-Source: APBJJlF2RWXaT3XjF4XIoYgd+D9lcGt7c9IIXSMJx5LdyPV6oT4nr9r3uapzOVUQJRnkj5wq6GFrBIH0wyFRrEbvlr0=
X-Received: by 2002:a05:6512:3c9f:b0:4fb:829b:196e with SMTP id
 h31-20020a0565123c9f00b004fb829b196emr2526477lfv.2.1688652793506; Thu, 06 Jul
 2023 07:13:13 -0700 (PDT)
MIME-Version: 1.0
References: <b09f1996-3838-4fa2-9193-832b68262e43@moroto.mountain>
 <ed3ef0ec-140d-59f1-b37e-4731d763a11b@amd.com>
In-Reply-To: <ed3ef0ec-140d-59f1-b37e-4731d763a11b@amd.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Thu, 6 Jul 2023 19:43:01 +0530
Message-ID: <CAO_48GF61m4-RtiTEf9a5ntoX6jY66=hLTWe0A1XRUO8PsZkAw@mail.gmail.com>
Subject: Re: [PATCH v2] dma-buf: fix an error pointer vs NULL bug
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: kernel-janitors@vger.kernel.org, Gustavo Padovan <gustavo@padovan.org>,
 Maxime Ripard <mripard@kernel.org>, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Dan Carpenter <dan.carpenter@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 6 Jul 2023 at 18:24, Christian K=C3=B6nig <christian.koenig@amd.com=
> wrote:
>
> Am 06.07.23 um 14:37 schrieb Dan Carpenter:
> > Smatch detected potential error pointer dereference.
> >
> >      drivers/gpu/drm/drm_syncobj.c:888 drm_syncobj_transfer_to_timeline=
()
> >      error: 'fence' dereferencing possible ERR_PTR()
> >
> > The error pointer comes from dma_fence_allocate_private_stub().  One
> > caller expected error pointers and one expected NULL pointers.  Change
> > it to return NULL and update the caller which expected error pointers,
> > drm_syncobj_assign_null_handle(), to check for NULL instead.
> >
> > Fixes: f781f661e8c9 ("dma-buf: keep the signaling time of merged fences=
 v3")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
>
Thanks for catching this!
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
Reviewed-by: Sumit Semwal <sumit.semwal@linaro.org>
>
> Should I push that one to drm-misc-fixes?
If you haven't pushed already, I can push it now.
>
> Regards,
> Christian.

Best,
Sumit.
>
> > ---
> > v2: Fix it in dma_fence_allocate_private_stub() instead of
> >     __dma_fence_unwrap_merge().
> >
> >
> >   drivers/dma-buf/dma-fence.c   | 2 +-
> >   drivers/gpu/drm/drm_syncobj.c | 4 ++--
> >   2 files changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> > index ad076f208760..8aa8f8cb7071 100644
> > --- a/drivers/dma-buf/dma-fence.c
> > +++ b/drivers/dma-buf/dma-fence.c
> > @@ -160,7 +160,7 @@ struct dma_fence *dma_fence_allocate_private_stub(k=
time_t timestamp)
> >
> >       fence =3D kzalloc(sizeof(*fence), GFP_KERNEL);
> >       if (fence =3D=3D NULL)
> > -             return ERR_PTR(-ENOMEM);
> > +             return NULL;
> >
> >       dma_fence_init(fence,
> >                      &dma_fence_stub_ops,
> > diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncob=
j.c
> > index 04589a35eb09..e592c5da70ce 100644
> > --- a/drivers/gpu/drm/drm_syncobj.c
> > +++ b/drivers/gpu/drm/drm_syncobj.c
> > @@ -355,8 +355,8 @@ static int drm_syncobj_assign_null_handle(struct dr=
m_syncobj *syncobj)
> >   {
> >       struct dma_fence *fence =3D dma_fence_allocate_private_stub(ktime=
_get());
> >
> > -     if (IS_ERR(fence))
> > -             return PTR_ERR(fence);
> > +     if (!fence)
> > +             return -ENOMEM;
> >
> >       drm_syncobj_replace_fence(syncobj, fence);
> >       dma_fence_put(fence);
>


--=20
Thanks and regards,

Sumit Semwal (he / him)
Tech Lead - LCG, Vertical Technologies
Linaro.org =E2=94=82 Open source software for ARM SoCs
