Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C73D6F01EE
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 09:39:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5A7410EAD9;
	Thu, 27 Apr 2023 07:39:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8B6F10E158;
 Thu, 27 Apr 2023 07:24:59 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-95f4c5cb755so288817966b.0; 
 Thu, 27 Apr 2023 00:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682580296; x=1685172296;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=n0x8yz/BH7Sp+Esx42OKv6E3BY74SAY231PEuV+HVic=;
 b=qgDEtLJoLUTp1mVpKJti0vgMciCsmbV9quipZsc1mmin8erWwYVALwvZuvna6cuqI/
 //NuiCub7siQYE4rQIDTMU+ODGSCUQNiqWTsDazHqwglwnBzNkFK1rzL8MayzaI/sBmt
 GS0HS9AZPT3XXwPZ1XBBIL1eDf+ZAm1/+ncpTSrh4YQLHa7qDZDJ85jkFDxloSXGF36t
 pLSZOk02UZ6SyvzfZRR6++apQn1eNSu4ciICWCEqxN3wmCO0WjEZ0SboQwBgoqCFXh+6
 V0mncZGSAy1OMRtce1v6dXhiOleUJGDQWGH92hZa/uDStDq2lZasPJEvYJ3kyrv4qDLV
 +dvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682580296; x=1685172296;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n0x8yz/BH7Sp+Esx42OKv6E3BY74SAY231PEuV+HVic=;
 b=DpTMOqWs8Yt2vnq8MDGd4d6us6WXed2CNL7qN/0r4D+Ub3a2m+2sFOwAi9Nu8IH/1x
 swXspxWUDDFALYpXfTvEYbwVViBsNfqrd/9LAKHfe3ewT9tmBwZjcRCbVduuWBu1r9KV
 6bBvPQZRMsTzCzd+m+YHJGXlMSyhmJHUlgKTxKCVN5nyHFkIYtGODEuOcauGWMM2GQi/
 z6MUdk15NQ7Bw8hkAeQGvOXY3LTsKb6w1JChiKN2YQrLZ1kxedOiAex7MA/HGwQLP95I
 VCv1PhnjFVR0gzPmGwuektUhk6DQJ9RC0idIwCC+PHM0KShum0MQqA0z6QioZ6xUsvDA
 +vTg==
X-Gm-Message-State: AC+VfDym9NOfmCFTRPztnvNbCRbdC8STjhlGhtgkBhlCIo0s/TFGQnQS
 ufMw8V5W6GOMAFLUvT21BgAucLwb8mCRePUZbdQ=
X-Google-Smtp-Source: ACHHUZ6MtYHlNvjJ9sRe22WzKbPWWOFUTw9vlD6bgF2wcZyljqJ1jfJlm8cKhraM2loDqlpT0O8sLNYfzHIj8twFO3I=
X-Received: by 2002:a17:906:6a28:b0:93e:8791:7d8e with SMTP id
 qw40-20020a1709066a2800b0093e87917d8emr810871ejc.2.1682580296267; Thu, 27 Apr
 2023 00:24:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230419122058.3420-1-hackyzh002@gmail.com>
 <62ae58cb-9fec-37ca-fd40-12bf0c1c5ba3@amd.com>
 <CADnq5_MTgMtHM87YQJcZLcENevcHOuQihoTz-xRetypJ6BQSXQ@mail.gmail.com>
In-Reply-To: <CADnq5_MTgMtHM87YQJcZLcENevcHOuQihoTz-xRetypJ6BQSXQ@mail.gmail.com>
From: whitehat002 whitehat002 <hackyzh002@gmail.com>
Date: Thu, 27 Apr 2023 15:24:44 +0800
Message-ID: <CAF6NKdY49N09+ubFrOfbr9Pj+6EK5U4G0_nmR-d6Sz1keZ_5Jg@mail.gmail.com>
Subject: Re: [PATCH V3 1/2] drm/radeon: Fix integer overflow in
 radeon_cs_parser_init
To: Alex Deucher <alexdeucher@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000dd835705fa4c4077"
X-Mailman-Approved-At: Thu, 27 Apr 2023 07:38:49 +0000
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
Cc: Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, sumit.semwal@linaro.org,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000dd835705fa4c4077
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

What is the current status of this patch, has it been applied?

Alex Deucher <alexdeucher@gmail.com> =E4=BA=8E2023=E5=B9=B44=E6=9C=8819=E6=
=97=A5=E5=91=A8=E4=B8=89 21:49=E5=86=99=E9=81=93=EF=BC=9A

> Applied.  Thanks!
>
> Alex
>
> On Wed, Apr 19, 2023 at 8:24=E2=80=AFAM Christian K=C3=B6nig
> <christian.koenig@amd.com> wrote:
> >
> > Am 19.04.23 um 14:20 schrieb hackyzh002:
> > > The type of size is unsigned, if size is 0x40000000, there will be an
> > > integer overflow, size will be zero after size *=3D sizeof(uint32_t),
> > > will cause uninitialized memory to be referenced later
> > >
> > > Signed-off-by: hackyzh002 <hackyzh002@gmail.com>
> >
> > Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com> for the se=
ries.
> >
> > > ---
> > >   drivers/gpu/drm/radeon/radeon_cs.c | 3 ++-
> > >   1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/radeon/radeon_cs.c
> b/drivers/gpu/drm/radeon/radeon_cs.c
> > > index 46a27ebf4..a6700d727 100644
> > > --- a/drivers/gpu/drm/radeon/radeon_cs.c
> > > +++ b/drivers/gpu/drm/radeon/radeon_cs.c
> > > @@ -270,7 +270,8 @@ int radeon_cs_parser_init(struct radeon_cs_parser
> *p, void *data)
> > >   {
> > >       struct drm_radeon_cs *cs =3D data;
> > >       uint64_t *chunk_array_ptr;
> > > -     unsigned size, i;
> > > +     u64 size;
> > > +     unsigned i;
> > >       u32 ring =3D RADEON_CS_RING_GFX;
> > >       s32 priority =3D 0;
> > >
> >
>

--000000000000dd835705fa4c4077
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div><br>What is the current status of this patch, h=
as it been applied?<br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">Alex Deucher &lt;<a href=3D"mailto:alexdeuche=
r@gmail.com">alexdeucher@gmail.com</a>&gt; =E4=BA=8E2023=E5=B9=B44=E6=9C=88=
19=E6=97=A5=E5=91=A8=E4=B8=89 21:49=E5=86=99=E9=81=93=EF=BC=9A<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">Applied.=C2=A0 Thanks!<br>
<br>
Alex<br>
<br>
On Wed, Apr 19, 2023 at 8:24=E2=80=AFAM Christian K=C3=B6nig<br>
&lt;<a href=3D"mailto:christian.koenig@amd.com" target=3D"_blank">christian=
.koenig@amd.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Am 19.04.23 um 14:20 schrieb hackyzh002:<br>
&gt; &gt; The type of size is unsigned, if size is 0x40000000, there will b=
e an<br>
&gt; &gt; integer overflow, size will be zero after size *=3D sizeof(uint32=
_t),<br>
&gt; &gt; will cause uninitialized memory to be referenced later<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: hackyzh002 &lt;<a href=3D"mailto:hackyzh002@gmail.=
com" target=3D"_blank">hackyzh002@gmail.com</a>&gt;<br>
&gt;<br>
&gt; Reviewed-by: Christian K=C3=B6nig &lt;<a href=3D"mailto:christian.koen=
ig@amd.com" target=3D"_blank">christian.koenig@amd.com</a>&gt; for the seri=
es.<br>
&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 =C2=A0drivers/gpu/drm/radeon/radeon_cs.c | 3 ++-<br>
&gt; &gt;=C2=A0 =C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/drivers/gpu/drm/radeon/radeon_cs.c b/drivers/gpu/drm=
/radeon/radeon_cs.c<br>
&gt; &gt; index 46a27ebf4..a6700d727 100644<br>
&gt; &gt; --- a/drivers/gpu/drm/radeon/radeon_cs.c<br>
&gt; &gt; +++ b/drivers/gpu/drm/radeon/radeon_cs.c<br>
&gt; &gt; @@ -270,7 +270,8 @@ int radeon_cs_parser_init(struct radeon_cs_pa=
rser *p, void *data)<br>
&gt; &gt;=C2=A0 =C2=A0{<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_radeon_cs *cs =3D data;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t *chunk_array_ptr;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0unsigned size, i;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0u64 size;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0unsigned i;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 ring =3D RADEON_CS_RING_GFX;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0s32 priority =3D 0;<br>
&gt; &gt;<br>
&gt;<br>
</blockquote></div>

--000000000000dd835705fa4c4077--
