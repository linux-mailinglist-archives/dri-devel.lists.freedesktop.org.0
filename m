Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CDCC0C576
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 09:39:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DB3A10E04B;
	Mon, 27 Oct 2025 08:39:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lJgzi/rB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com
 [209.85.222.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B47E910E04B
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 08:39:48 +0000 (UTC)
Received: by mail-ua1-f49.google.com with SMTP id
 a1e0cc1a2514c-932bcc0bcf3so3367894241.3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 01:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761554387; x=1762159187; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LVeKWq/PUcnanhtRemidmBBr9Q1nvH92bMeb25iRoXU=;
 b=lJgzi/rB/QSERFPWF1wSAnvubAlpBXLZvjVrDlzComPwQdwVt14ZJkUprf/DsQZbHR
 R7cKUU2+ulZ2bGnPupU0O+wNI+kfe2nmWwE2+cIH4uP928+JfSYFD6KAdnm1eOEDyg9o
 QyPs0+DG226M1duEaTu8RtiBM1qZ3A/dFA/lW8/3tqRmNUiMNaur12lGOtJtbJRb6cxb
 qoCiW3vxW1a/icbwTgneoNaZa8vTJcMhRnhnH/C+wpfuIQaTELSfLaJrjIiYBMwJCyeO
 +3LhZVF39OsbpQlbAuV+K06qf35FImAAjhlU92Bpwxpx+v1HfUODdHaW0sOE6eDMvPkp
 o2hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761554387; x=1762159187;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LVeKWq/PUcnanhtRemidmBBr9Q1nvH92bMeb25iRoXU=;
 b=tTFzm1/D5cbjCCwjFfqbLkmtkmdz2eJkaX5XNYf2WOeb0lr1lzbPwjnhR+5++6kmVw
 XNeAIFs8HMkSZpzfZxjwMlS5/GwE9NrMg5i8J0AsM1eC5zmdEcM0SJ9GcFEhph9ZIYPr
 Tbi+Bq+I20eUhUeENtL0xqsaEGq1FoQ3I90j2GZJkCZlR5BAtya4aC7N8DnUKAzojt0b
 iPEaX45RB7GaxbY9eCut4fkkQ0E0kY525pFqpWtfsUMmZa/atP0l0XeYLjiinubhDIQ3
 ihyyoq+EQh5WDy+Wb2D+xDvBhCrFZFhf4OxRF9G3P34pI70iaNDfjxTUKYpYrqv67Un+
 NRqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUMQ8+aMtmR65zOOzYP+BEK/bmuuJ9Mapgje60WrMHc8YWW0mfdjXZMkEHZ/gPRIbrUAAoY/zBoUU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxIgqVfO7D67fNHka2NCn0HhfvcxuY3tOW7OhYNvv8eOIujQ8zg
 xHSSH+93L8w3wUu8u5s0BOYSvn8eg8Lg6VMJiykidw6S9bM1Q6hhjWUX5gbEPcs/HcJ6/7Y3s5n
 4vUO24zJhrv7rPUsbXJgV7oo/3A9Deo4=
X-Gm-Gg: ASbGnctnwRDeuePp1QX55bX6mjseNULgbUINTm8cbZQDsF0gA2m6UQYaQBB0ycYuepJ
 JhRmfjDO3A03PNYLei4ZZnMmhPByv92Wbwhz9zy7na+zgXnsnRnsrIVUY09QWYsuAbXxlAItF3w
 HV/smAK9Jvicj+iKm0FFoD6O6kku2dFaG8ksavqCuMwySGE6q/Xp2wNJp4ZPdXEm6EN68cC9doo
 XlVymr84/aLpectRaNTpZzD/5nTnLNkRwRvkpP/REjX+0sn7rzSu14MlTK2R0BtdjEqM1eLAYPB
 jIgciUp+94attYAywKYX6RaHiMxi
X-Google-Smtp-Source: AGHT+IEkfcnfwuZO4D0yfhhVNz9QlAgJOdxgTLgX5eJlebMGNCREbWZ6shn+IJkJKUDrSiC1zFgV5M2F8naNthKSkC4=
X-Received: by 2002:a05:6102:4421:b0:5d6:254f:4e24 with SMTP id
 ada2fe7eead31-5d7dd5ea5f5mr13446335137.32.1761554387168; Mon, 27 Oct 2025
 01:39:47 -0700 (PDT)
MIME-Version: 1.0
References: <20251020053523.731353-1-uwu@icenowy.me>
 <dff6216d-b4a4-4d5d-89e3-e393dc018dec@amd.com>
In-Reply-To: <dff6216d-b4a4-4d5d-89e3-e393dc018dec@amd.com>
From: Han Gao <rabenda.cn@gmail.com>
Date: Mon, 27 Oct 2025 16:39:35 +0800
X-Gm-Features: AWmQ_bmwtlbQuKUnS-IuTkyrp0egdh5iciKLYtYyF5wyQpHkC3GNMn5GWoRJOw8
Message-ID: <CAAT7Ki8e8vUeiLVt+j=f6=aB_JyEOwE2HhPn+xH1TPC_NYec8Q@mail.gmail.com>
Subject: Re: [PATCH v2] drm/ttm: add pgprot handling for RISC-V
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Icenowy Zheng <uwu@icenowy.me>, Huang Rui <ray.huang@amd.com>, 
 Matthew Auld <matthew.auld@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Vivian Wang <wangruikang@iscas.ac.cn>, Inochi Amaoto <inochiama@gmail.com>, 
 Yao Zi <ziyao@disroot.org>
Content-Type: multipart/alternative; boundary="0000000000007ff32c06421fd73d"
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

--0000000000007ff32c06421fd73d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Tested on sophgo sg2042/sophgo sg2044/ultrarisc dp1000.

On Mon, Oct 27, 2025 at 15:57 Christian K=C3=B6nig <christian.koenig@amd.co=
m>
wrote:

>
>
> On 10/20/25 07:35, Icenowy Zheng wrote:
> > The RISC-V Svpbmt privileged extension provides support for overriding
> > page memory coherency attributes, and, along with vendor extensions lik=
e
> > Xtheadmae, supports pgprot_{writecombine,noncached} on RISC-V.
> >
> > Adapt the codepath that maps ttm_write_combined to pgprot_writecombine
> > and ttm_noncached to pgprot_noncached to RISC-V, to allow proper page
> > access attributes.
> >
> > Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> > Tested-by: Han Gao <rabenda.cn@gmail.com>
> > ---
> > Changes in v2:
> > - Added Han Gao's test tag.
> >
> >  drivers/gpu/drm/ttm/ttm_module.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/ttm/ttm_module.c
> b/drivers/gpu/drm/ttm/ttm_module.c
> > index b3fffe7b5062a..aa137ead5cc59 100644
> > --- a/drivers/gpu/drm/ttm/ttm_module.c
> > +++ b/drivers/gpu/drm/ttm/ttm_module.c
> > @@ -74,7 +74,8 @@ pgprot_t ttm_prot_from_caching(enum ttm_caching
> caching, pgprot_t tmp)
> >  #endif /* CONFIG_UML */
> >  #endif /* __i386__ || __x86_64__ */
> >  #if defined(__ia64__) || defined(__arm__) || defined(__aarch64__) || \
> > -     defined(__powerpc__) || defined(__mips__) || defined(__loongarch_=
_)
> > +     defined(__powerpc__) || defined(__mips__) ||
> defined(__loongarch__) || \
> > +     defined(__riscv)
>
> Looks reasonable, but does that work on all RISC-V variants?
>
> And while at it maybe please fix the indentation, using a tab here is
> probably not very adequate. In other words make the defined() match the o=
ne
> on the first line.
>
> Regards,
> Christian.
>
> >       if (caching =3D=3D ttm_write_combined)
> >               tmp =3D pgprot_writecombine(tmp);
> >       else
>
>

--0000000000007ff32c06421fd73d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Tested on sophgo sg2042/sophgo sg2044/ultrarisc dp1000.</=
div><div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"l=
tr" class=3D"gmail_attr">On Mon, Oct 27, 2025 at 15:57 Christian K=C3=B6nig=
 &lt;<a href=3D"mailto:christian.koenig@amd.com">christian.koenig@amd.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
On 10/20/25 07:35, Icenowy Zheng wrote:<br>
&gt; The RISC-V Svpbmt privileged extension provides support for overriding=
<br>
&gt; page memory coherency attributes, and, along with vendor extensions li=
ke<br>
&gt; Xtheadmae, supports pgprot_{writecombine,noncached} on RISC-V.<br>
&gt; <br>
&gt; Adapt the codepath that maps ttm_write_combined to pgprot_writecombine=
<br>
&gt; and ttm_noncached to pgprot_noncached to RISC-V, to allow proper page<=
br>
&gt; access attributes.<br>
&gt; <br>
&gt; Signed-off-by: Icenowy Zheng &lt;<a href=3D"mailto:uwu@icenowy.me" tar=
get=3D"_blank">uwu@icenowy.me</a>&gt;<br>
&gt; Tested-by: Han Gao &lt;<a href=3D"mailto:rabenda.cn@gmail.com" target=
=3D"_blank">rabenda.cn@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; Changes in v2:<br>
&gt; - Added Han Gao&#39;s test tag.<br>
&gt; <br>
&gt;=C2=A0 drivers/gpu/drm/ttm/ttm_module.c | 3 ++-<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/ttm/ttm_module.c b/drivers/gpu/drm/ttm/tt=
m_module.c<br>
&gt; index b3fffe7b5062a..aa137ead5cc59 100644<br>
&gt; --- a/drivers/gpu/drm/ttm/ttm_module.c<br>
&gt; +++ b/drivers/gpu/drm/ttm/ttm_module.c<br>
&gt; @@ -74,7 +74,8 @@ pgprot_t ttm_prot_from_caching(enum ttm_caching cach=
ing, pgprot_t tmp)<br>
&gt;=C2=A0 #endif /* CONFIG_UML */<br>
&gt;=C2=A0 #endif /* __i386__ || __x86_64__ */<br>
&gt;=C2=A0 #if defined(__ia64__) || defined(__arm__) || defined(__aarch64__=
) || \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0defined(__powerpc__) || defined(__mips__) || defi=
ned(__loongarch__)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0defined(__powerpc__) || defined(__mips__) || defi=
ned(__loongarch__) || \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0defined(__riscv)<br>
<br>
Looks reasonable, but does that work on all RISC-V variants?<br>
<br>
And while at it maybe please fix the indentation, using a tab here is proba=
bly not very adequate. In other words make the defined() match the one on t=
he first line.<br>
<br>
Regards,<br>
Christian.<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (caching =3D=3D ttm_write_combined)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tmp =3D pgprot_w=
ritecombine(tmp);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
<br>
</blockquote></div></div>

--0000000000007ff32c06421fd73d--
