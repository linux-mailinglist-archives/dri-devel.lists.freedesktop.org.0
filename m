Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FA875F454
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 13:05:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CA1210E2D4;
	Mon, 24 Jul 2023 11:04:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2140510E2D4
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 11:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690196692;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=etz4wbh9dB0ZKUyzz/bbGnklVssFcVDN14mQb5dEpuQ=;
 b=JJ2px+j0KNf82a0a9EtG8ET4etmexPhczSHI3+ooOZYb92zw8TkXlPkpXyl9SH58W+YTil
 +cP2yKSQMl30RNydcgmG7l0WpD3Y93HPdCpWnAH6erNDkOzA/dLGneqy2fMHJiefmq56NB
 MxkV7v7XImKb9o9QHau+F4UbhpHYbXY=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-152-OCqkb1swNt2l6bKgvAUi5w-1; Mon, 24 Jul 2023 07:04:51 -0400
X-MC-Unique: OCqkb1swNt2l6bKgvAUi5w-1
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-268068d80b9so570885a91.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 04:04:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690196690; x=1690801490;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=etz4wbh9dB0ZKUyzz/bbGnklVssFcVDN14mQb5dEpuQ=;
 b=NDyLRYVhs0kpsOnuizzvjFw+IUaKsZTgywGxCnNkzHkUfe1LBy6px9uaCtt+ZIk28t
 RUtxosxgj10oczBcAwZ03lAY7qYi3tyGAg13kC312MAyNPshqWbTa+n6x6YRZI7jlYxj
 VxBa8Z75tBfBMVWmbp7T9fQV1fMmgIBfv+7fCZmJjT+l2LeKu3L6XIyhucz7qidR9hvI
 bJJHT1GRv8k+3I94xXXsDncWSsVKB1gdvB++xGE1g+X1upa6S/W6nxOQEg4gseK7AkL0
 pmAaC2bS5cV5K1OV909ph/FR6mnyWbe/qlAG6+Wzws+sV0c44au+MENmM62oM7AUlxlF
 +O0g==
X-Gm-Message-State: ABy/qLZ/SNoRPI/Mhk3MVpDW1HDLecGkRQ2aZ6KbQO1kaM3KZB5pp3w8
 5csR/ljFqeBhmncr3v/PEHROusI1j0OSzgD1RXrCzkYOwps8WeaVovmTYAkRiQN+u9+OniwBS+q
 CHUhd7yTg0uGAKZykaathbEVHHqfdTJdgszD5LL82yKIM
X-Received: by 2002:a17:90b:14d:b0:25e:ff04:4fb with SMTP id
 em13-20020a17090b014d00b0025eff0404fbmr8795303pjb.23.1690196690276; 
 Mon, 24 Jul 2023 04:04:50 -0700 (PDT)
X-Google-Smtp-Source: APBJJlG51pj4MKuaHrJsIq9+fRcFApM78gvSsM8wq0USn2r5IvnS8K+AmP2WIFWH3BK8EXHlsUJyFLp2cqjusLoV3tc=
X-Received: by 2002:a17:90b:14d:b0:25e:ff04:4fb with SMTP id
 em13-20020a17090b014d00b0025eff0404fbmr8795276pjb.23.1690196689884; Mon, 24
 Jul 2023 04:04:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230719014218.1700057-1-zack@kde.org>
 <20230719014218.1700057-10-zack@kde.org>
 <20230719111541.33c05b14@eldfell>
 <41590ef35281fbc54be1ee58d9187ede8bc44698.camel@vmware.com>
 <xhJhUmlWt6a9ajOdF2Wodjm6IQBab4jqySRdBAPLaA4No87O7zfEX9v4d-ugWWAPgJBIWQeLV4RVuuRoZPK7aTYgNWp2YofiHra2GVLBfpY=@emersion.fr>
 <87sf9jhspo.fsf@minerva.mail-host-address-is-not-set>
 <YpGDUfd-_k9UGRn9xM-lwrWFXim3YiYG1wzgbk_lvSTQ2JL3zxxDuZef4ZTJe_NtOlwMMDy5OoDqK-Ia4VN3p-fibO_gaR7t6pH3oxyEI8Y=@emersion.fr>
 <b4f00adeeaec35aacd008fe7a6ca9283760f6421.camel@vmware.com>
 <Tgp5V2I8rIgxaVYHTqX5kWeyeqgaKygNFitQeObTXCR2hUDcaR-mAn_37bUhKrTxeqlwf2GlPIOmkSlOzZHQ5D-hkHu5jeYhEDm1x45oePw=@emersion.fr>
In-Reply-To: <Tgp5V2I8rIgxaVYHTqX5kWeyeqgaKygNFitQeObTXCR2hUDcaR-mAn_37bUhKrTxeqlwf2GlPIOmkSlOzZHQ5D-hkHu5jeYhEDm1x45oePw=@emersion.fr>
From: Albert Esteve <aesteve@redhat.com>
Date: Mon, 24 Jul 2023 13:04:38 +0200
Message-ID: <CADSE00Ld7D8E8MG6cc7HAgM_DbqXqYreik4ZZLUhkkJDW3B=Yg@mail.gmail.com>
Subject: Re: [PATCH v5 9/9] drm: Introduce documentation for hotspot properties
To: Simon Ser <contact@emersion.fr>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000004d47b906013995b9"
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
Cc: Michael Banack <banackm@vmware.com>,
 "javierm@redhat.com" <javierm@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Martin Krastev <krastevm@vmware.com>,
 "ppaalanen@gmail.com" <ppaalanen@gmail.com>, Ian Forbes <iforbes@vmware.com>,
 Maaz Mombasawala <mombasawalam@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000004d47b906013995b9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 20, 2023 at 9:32=E2=80=AFPM Simon Ser <contact@emersion.fr> wro=
te:

> On Thursday, July 20th, 2023 at 21:28, Zack Rusin <zackr@vmware.com>
> wrote:
>
> > On Thu, 2023-07-20 at 09:07 +0000, Simon Ser wrote:
> >
> > > !! External Email
> > >
> > > On Thursday, July 20th, 2023 at 10:50, Javier Martinez Canillas
> > > javierm@redhat.com wrote:
> > >
> > > > > On Thursday, July 20th, 2023 at 07:03, Zack Rusin zackr@vmware.co=
m
> wrote:
> > > > >
> > > > > > I'll give this series a few more hours on the list and if no on=
e
> objects
> > > > > > I'll push
> > > > > > it to drm-misc later today. Thanks!
> > > > >
> > > > > Sorry, but this doesn't seem to be enough to satisfy the DRM merg=
e
> > > > > requirements. This introduces a new uAPI but is missing user-spac=
e
> > > > > patches and IGT. See 1 and 2.
> > > >
> > > > Albert (Cc'ed) wrote IGT tests for this new uAPI and was waiting fo=
r
> > > > Zack's patches to land to post them. I believe his branch is 0 but
> > > > he can correct me if I'm wrong on that.
> > > >
> > > > Zack also has mutter patches and Albert has been testing those too.
> > >
> > > Ah, nice. Please do post all of these (without merging them) and
> > > include links to them in the commit message. Posting is important
> > > to make sure there are no gaps/mistakes in the tests and user-space
> > > impl.
> >
> > What should those links point to? Because my private mutter repository
> is definitely
> > not going to last long so I'm not sure if there's any point in putting
> that in a
> > kernel commit log. Or would you like the links to those in the cover
> letter?
>
> The kernel docs say: "The userspace side must be fully reviewed and
> tested to the standards of that userspace project".
>
> So you need to open a merge request for mutter. Same for IGT.
>
>
Hi,

Here's the link to the IGT patch:
https://lists.freedesktop.org/archives/igt-dev/2023-July/058427.html

--0000000000004d47b906013995b9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div><div dir=3D"ltr" class=3D"gmail_sign=
ature"><div dir=3D"ltr"><br></div></div></div></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 20, 2023 at 9:32=
=E2=80=AFPM Simon Ser &lt;<a href=3D"mailto:contact@emersion.fr">contact@em=
ersion.fr</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Thursday, July 20th, 2023 at 21:28, Zack Rusin &lt;<a href=3D=
"mailto:zackr@vmware.com" target=3D"_blank">zackr@vmware.com</a>&gt; wrote:=
<br>
<br>
&gt; On Thu, 2023-07-20 at 09:07 +0000, Simon Ser wrote:<br>
&gt; <br>
&gt; &gt; !! External Email<br>
&gt; &gt; <br>
&gt; &gt; On Thursday, July 20th, 2023 at 10:50, Javier Martinez Canillas<b=
r>
&gt; &gt; <a href=3D"mailto:javierm@redhat.com" target=3D"_blank">javierm@r=
edhat.com</a> wrote:<br>
&gt; &gt; <br>
&gt; &gt; &gt; &gt; On Thursday, July 20th, 2023 at 07:03, Zack Rusin <a hr=
ef=3D"mailto:zackr@vmware.com" target=3D"_blank">zackr@vmware.com</a> wrote=
:<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; I&#39;ll give this series a few more hours on the =
list and if no one objects<br>
&gt; &gt; &gt; &gt; &gt; I&#39;ll push<br>
&gt; &gt; &gt; &gt; &gt; it to drm-misc later today. Thanks!<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; Sorry, but this doesn&#39;t seem to be enough to satisf=
y the DRM merge<br>
&gt; &gt; &gt; &gt; requirements. This introduces a new uAPI but is missing=
 user-space<br>
&gt; &gt; &gt; &gt; patches and IGT. See 1 and 2.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Albert (Cc&#39;ed) wrote IGT tests for this new uAPI and was=
 waiting for<br>
&gt; &gt; &gt; Zack&#39;s patches to land to post them. I believe his branc=
h is 0 but<br>
&gt; &gt; &gt; he can correct me if I&#39;m wrong on that.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Zack also has mutter patches and Albert has been testing tho=
se too.<br>
&gt; &gt; <br>
&gt; &gt; Ah, nice. Please do post all of these (without merging them) and<=
br>
&gt; &gt; include links to them in the commit message. Posting is important=
<br>
&gt; &gt; to make sure there are no gaps/mistakes in the tests and user-spa=
ce<br>
&gt; &gt; impl.<br>
&gt; <br>
&gt; What should those links point to? Because my private mutter repository=
 is definitely<br>
&gt; not going to last long so I&#39;m not sure if there&#39;s any point in=
 putting that in a<br>
&gt; kernel commit log. Or would you like the links to those in the cover l=
etter?<br>
<br>
The kernel docs say: &quot;The userspace side must be fully reviewed and<br=
>
tested to the standards of that userspace project&quot;.<br>
<br>
So you need to open a merge request for mutter. Same for IGT.<br>
<br></blockquote><div><br></div><div>Hi,</div><div><br></div><div>Here&#39;=
s the link to the IGT patch:=C2=A0=C2=A0<a href=3D"https://lists.freedeskto=
p.org/archives/igt-dev/2023-July/058427.html">https://lists.freedesktop.org=
/archives/igt-dev/2023-July/058427.html</a></div></div></div>

--0000000000004d47b906013995b9--

