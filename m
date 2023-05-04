Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D57A6F692F
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 12:39:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 106D910E423;
	Thu,  4 May 2023 10:39:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06F6C10E423;
 Thu,  4 May 2023 10:39:18 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2ac7ac8a4ffso3911531fa.0; 
 Thu, 04 May 2023 03:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683196756; x=1685788756;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=I8cy10TD23BLiLlfGPG7Cx1kjtU5cY0ZvS7C4oKT/pw=;
 b=h/WC9bsIDNhXfE4cBGKdONkvL8j3FuZ+LIKlbUE/Fw/TL7LWRGFeA7+1jOBPeeTWjC
 p2mfRLcjbvnrYAbMyRMn8EfIrEZE5+a8j4/BeBqoFutI3/mHFflZ+EwdzYtnYn6GvWAp
 bPUoVBVgx9A0T6lJU5SK4AaL617FJQjrmtw4u53vZS4fz15YGCxegKUPxOcroxWYuxtB
 6B8WiF8Sz3cFcR4id1NhHDvr88GrA2KcW941R8V+UjU0rnE/5w0aDa23bSUC/FtuPovw
 frQzLlqgl2WCLudQRozM4TtuWpQ7i+tfLK9Rz9A3Q4JeJd2NXj7oJ6OAuOMTEMmJwxhh
 qGBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683196756; x=1685788756;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I8cy10TD23BLiLlfGPG7Cx1kjtU5cY0ZvS7C4oKT/pw=;
 b=Dsw823jh+TBkdLEDjHim+GTGynHQ2GCmGrp7RL9Vt2JbCq2RvS4jGi7wT4lgUe7V5P
 bVwiM7hLSvBrpIVKEcdSdyaXeQv7RTfS9Cr+5l/OkdX6d3qcjqxY8v5lu1YSfMtArCXw
 UPxYJLj8nzdnjdU4LzRPMekA5xfrD3fr3OYXVAqDwJvQSvOvyl8ubP8YDnCFk2dzX8FT
 N1Nl+b76NXyJ5af9PK/UIH/FuB3j+gLVfFk4sJQx+3QNbM6a0ne65PfsO75z9G7LwjDE
 ZjWnnN1MrgAJDKNVP74bOFSueDpuaGS68+WVst0/9frDzTc4EI5JaTLafdA79rfpvu2h
 CKMA==
X-Gm-Message-State: AC+VfDxHXAT9ha2HeBRWB4iXHxWJSUVD3xm2CdIfzdVCnyx4mX4cSLIe
 lWBFSEKWpyeh1/IeHvQb/xk=
X-Google-Smtp-Source: ACHHUZ63JYRRIjOWE/UJE3a2S7oNalHCss8wmWBdY5Pf1RyHzSjjoQCnGEjVircjnZeeAkiqJ9Zb0w==
X-Received: by 2002:a2e:97c3:0:b0:2a8:d32e:e6bd with SMTP id
 m3-20020a2e97c3000000b002a8d32ee6bdmr833683ljj.21.1683196756288; 
 Thu, 04 May 2023 03:39:16 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 j15-20020a2e800f000000b00294692d8645sm6564927ljg.17.2023.05.04.03.39.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 03:39:15 -0700 (PDT)
Date: Thu, 4 May 2023 13:39:04 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Zack Rusin <zackr@vmware.com>
Subject: Re: [PATCH v2 1/8] drm: Disable the cursor plane on atomic contexts
 with virtualized drivers
Message-ID: <20230504133904.4ad3011c@eldfell>
In-Reply-To: <17cc969e9f13fab112827e154495eca28c4bd2b6.camel@vmware.com>
References: <20220712033246.1148476-1-zack@kde.org>
 <20220712033246.1148476-2-zack@kde.org>
 <YvPfedG/uLQNFG7e@phenom.ffwll.local>
 <87lei7xemy.fsf@minerva.mail-host-address-is-not-set>
 <0dd2fa763aa0e659c8cbae94f283d8101450082a.camel@vmware.com>
 <87y1m5x3bt.fsf@minerva.mail-host-address-is-not-set>
 <17cc969e9f13fab112827e154495eca28c4bd2b6.camel@vmware.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.24; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fSX23B7nk8XUDBx03oqMhN_";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: "kraxel@redhat.com" <kraxel@redhat.com>,
 "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "belmouss@redhat.com" <belmouss@redhat.com>,
 "javierm@redhat.com" <javierm@redhat.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "gurchetansingh@chromium.org" <gurchetansingh@chromium.org>,
 Martin Krastev <krastevm@vmware.com>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "spice-devel@lists.freedesktop.org" <spice-devel@lists.freedesktop.org>,
 "airlied@redhat.com" <airlied@redhat.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 Maaz Mombasawala <mombasawalam@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/fSX23B7nk8XUDBx03oqMhN_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 4 May 2023 01:50:25 +0000
Zack Rusin <zackr@vmware.com> wrote:

> On Wed, 2023-05-03 at 09:48 +0200, Javier Martinez Canillas wrote:
> > Zack Rusin <zackr@vmware.com> writes:
> >  =20
> > > On Tue, 2023-05-02 at 11:32 +0200, Javier Martinez Canillas wrote: =20

> > > > AFAICT this is the only remaining thing to be addressed for this se=
ries ? =20
> > >=20
> > > No, there was more. tbh I haven't had the time to think about whether=
 the above
> > > makes sense to me, e.g. I'm not sure if having virtualized drivers ex=
pose
> > > "support
> > > universal planes" and adding another plane which is not universal (th=
e only
> > > "universal" plane on them being the default one) makes more sense tha=
n a flag
> > > that
> > > says "this driver requires a cursor in the cursor plane". There's cer=
tainly a
> > > huge
> > > difference in how userspace would be required to handle it and it's w=
ay uglier
> > > with
> > > two different cursor planes. i.e. there's a lot of ways in which this=
 could be
> > > cleaner in the kernel but they all require significant changes to use=
rspace,
> > > that go
> > > way beyond "attach hotspot info to this plane". I'd like to avoid app=
roaches
> > > that
> > > mean running with atomic kms requires completely separate paths for v=
irtualized
> > > drivers because no one will ever support and maintain it.
> > >=20
> > > It's not a trivial thing because it's fundamentally hard to untangle =
the fact
> > > the
> > > virtualized drivers have been advertising universal plane support wit=
hout ever
> > > supporting universal planes. Especially because most new userspace in=
 general
> > > checks
> > > for "universal planes" to expose atomic kms paths.
> > >  =20
> >=20
> > After some discussion on the #dri-devel, your approach makes sense and =
the
> > only contention point is the name of the driver feature flag name. The =
one
> > you are using (DRIVER_VIRTUAL) seems to be too broad and generic (the f=
act
> > that vkms won't set and is a virtual driver as well, is a good example).
> >=20
> > Maybe something like DRIVER_CURSOR_HOTSPOT or DRIVER_CURSOR_COMMANDEERI=
NG
> > would be more accurate and self explanatory ? =20
>=20
> Sure, or even more verbose DRIVER_NEEDS_CURSOR_PLANE_HOTSPOT, but it soun=
ds like
> Pekka doesn't agree with this approach. As I mentioned in my response to =
him, I'd be
> happy with any approach that gets paravirtualized drivers working with at=
omic kms,
> but atm I don't have enough time to be creating a new kernel subsystem or=
 a new set
> of uapi's for paravirtualized drivers and then porting mutter/kwin to tho=
se.

It seems I have not been clear enough, apologies. Once more, in short:

Zack, I'm worried about this statement from you (copied from above):

> > > I'd like to avoid approaches that mean running with atomic kms
> > > requires completely separate paths for virtualized drivers
> > > because no one will ever support and maintain it.

It feels like you are intentionally limiting your own design options
for the fear of "no one will ever support it". I'm worried that over
the coming years, that will lead to a hard to use, hard to maintain
patchwork of vague or undocumented or just too many little UAPI details.

Please, don't limit your designs. There are good reasons why nested KMS
drivers behave fundamentally differently to most KMS hardware drivers.
Userspace that does not or cannot take that into account is unavoidably
crippled.


Thanks,
pq

--Sig_/fSX23B7nk8XUDBx03oqMhN_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmRTi0gACgkQI1/ltBGq
qqediRAAk0pncI/uXJYfQjhsOa7tB6Ix+d5Y3iIRT1aD3+kt2fGVGlRXhHYamy6f
/R8z/yrSfr3md4rpsf73HWdpQJYC33FDFhOnJ5pYaUaIhTw9sqdCNlqdsHOppWVx
kWWjKB4obarFgjxLZAxAxJ75IUpj1luPqLCfnvwOpwGgCoB1dv+JLZAjN4mj5Oxj
c+nqemTqhZhzX8PpBL4gCiTBkdhF+4gc9F73NHfDb6T8ws7jgXDQ9ePuJY31EKpq
+RY5Z0KyH+PBvIOhsYcirez3QBkCc1losZz3FBB6DwiXchI7jnRfpNtRvDrNvlwv
rA6DGnjAu8buoPh16Or2EKjESAPq9dJL1tFpYCgFD2Ud8VTLYFuV8h7wHXrOnbvj
Jx33L0OL8jlRTwQaUiywNQFUqNF3nK++ogfBU/zzQzzU/RWP6CVJGSiqtbfoyHI2
4kk2fUSt2obvOswJX2XHiWyTHSudgpLzP528HDqFelLRa4B5UAg+QVzBc9j4U/5S
NOZjKTIfTX+zQ4R9vhrvMSuEReQ6mcEo63tEaoioF3wPcxeogSY7HdoJE5syAWsS
gqKV/b+fVk46q5tDZ9bqW874qQmPAupgrhwWenITrSXF1UULQ64hwyT0CL44MJXw
xxnPS9Cqlvk9KsA1u7uUtLDlk3hP8reuUJyzMxDqY3G5yWeKZ5o=
=fN1I
-----END PGP SIGNATURE-----

--Sig_/fSX23B7nk8XUDBx03oqMhN_--
