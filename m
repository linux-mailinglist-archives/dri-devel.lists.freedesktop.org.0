Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D7F539E1E
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 09:21:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A01EE1130D9;
	Wed,  1 Jun 2022 07:21:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6C6C1130D7
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 07:21:38 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id m26so1051724ljb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 00:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=R0IMS+Qt4mqr4NHtcqGr3xQYaR4k0FJwELEdeLG6jKI=;
 b=PcDpvn0jE90tfviSgNnmKTgm3iMaAN5XtnxU84SwjbW72xizTc9zW33bH+avOyKxfe
 fxBcJ9tLbfyu6f/3qmU1+yVulWEiNQfepFTMaVn+YhSIUaCyOXBVavm+nCf22D6+36Sk
 BP3irxiElq5MdWTjao3uwRNbE2z1zpDXjwDKa1T7PjSQS4LBjEJsoMBtJYHVb4EyNXYZ
 7K+nYKS6Cfcxwl1D7hv71ADVG4njfDBTOeee3A/2BfgL+/66v3kJXYYeEtuFRSYMhCWP
 O2vBAWao4Kjfr0TRsqWnxVEn1zCf+w17ydvR6pxkrS437NgsWmeNEpbWTXJkBLYlxAc4
 kw+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=R0IMS+Qt4mqr4NHtcqGr3xQYaR4k0FJwELEdeLG6jKI=;
 b=PaOyfU9aWA3LI1FD9IgXIq6xMNDXZSGZ/lgiQ8IwRIhCSut+CEGUnSLjfLqFdAK5Rm
 rgqb3CcU8Zr2PB0qBUgMzmClFT9rD7fyjaIZpnUpSby68BYmx8utMEXKtjw28LfXAFvJ
 5k1jqJMNjYPn6jtHyybcLIxzSLBQ3AXIVvXy01QCZuWF2U+n7YCWVEN97I3uzCg3myHm
 KWtBrshEnQwRVJSrOGsnLvWvTvghvN0EkUEXRv1/615raqSaH3tkVQT7q6ghx0Zdv9Ed
 cQbojmd0Cj2KS7hfzR6zxrY79D+HrOIjfqRNv1zzlfGsD4432hQ5vJE2dN1C7Sp8ik7N
 ITug==
X-Gm-Message-State: AOAM531WU2Q9IYVo0j6SZ/E+2EFdow6M9V5i86BFAoG9nCtG0pKnjMGD
 JqvTrBbYHdFw//PcFRPGEvc=
X-Google-Smtp-Source: ABdhPJyi7p6/1IrWOp05L70k7S4njPTBIMezJmKb6LfZQ6pktrpgbKwecm7HORYi7Day6rWLq6tdGQ==
X-Received: by 2002:a2e:8955:0:b0:255:481e:cb27 with SMTP id
 b21-20020a2e8955000000b00255481ecb27mr12057707ljk.362.1654068096717; 
 Wed, 01 Jun 2022 00:21:36 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 v28-20020a2e505c000000b00253deeaeb3dsm158345ljd.131.2022.06.01.00.21.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 00:21:36 -0700 (PDT)
Date: Wed, 1 Jun 2022 10:21:26 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: How should "max bpc" and "Colorspace" KMS property work?
Message-ID: <20220601102126.4f3602fd@eldfell>
In-Reply-To: <YpZSWwVkhJOalM4M@intel.com>
References: <20220426113502.224d0a90@eldfell> <YmgyArRaJCh6JkQh@intel.com>
 <57d16ed5-8bfc-ce29-9250-14e2de18710a@redhat.com>
 <20220523112246.056ddc99@eldfell>
 <CA+hFU4wTHR9kLrFY3XkbeROZgxWamiZ6yGYL4jH+wpe8MzLvMw@mail.gmail.com>
 <20220525102850.5a70e58f@eldfell>
 <80798931-dbe7-54d7-8e1a-aaebfc39780c@mailbox.org>
 <U2A3FifHdFH9yDVrigaioxCTNx60MgkND7jcyIeKP2S4Ghu-BmmRaODqBDp6K0Q-aPBjPcqa2zUGuJNkGmRWZyQx2FjRJe9dVtJhQG9ZNCk=@emersion.fr>
 <20220525133647.052d09da@eldfell> <YpZSWwVkhJOalM4M@intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mzn2dvYQ0vE9/GO5bvtUrS0";
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Michel =?UTF-8?B?RMOkbnplcg==?= <michel.daenzer@mailbox.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>,
 Jonas =?UTF-8?B?w4VkYWhs?= <jadahl@redhat.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/mzn2dvYQ0vE9/GO5bvtUrS0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 31 May 2022 20:37:31 +0300
Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> wrote:

> On Wed, May 25, 2022 at 01:36:47PM +0300, Pekka Paalanen wrote:
> > On Wed, 25 May 2022 09:23:51 +0000
> > Simon Ser <contact@emersion.fr> wrote:
> >  =20
> > > On Wednesday, May 25th, 2022 at 10:35, Michel D=C3=A4nzer <michel.dae=
nzer@mailbox.org> wrote:
> > >  =20
> > > > > Mind that "max bpc" is always in auto. It's only an upper limit, =
with
> > > > > the assumption that the driver can choose less.   =20
> > > >
> > > > It seems to me like the "max bpc" property is just kind of bad API,
> > > > and trying to tweak it to cater to more use cases as we discover th=
em
> > > > will take us down a rabbit hole. It seems better to replace it with
> > > > new properties which allow user space to determine the current
> > > > effective bpc and to explicitly control it.   =20
> > >=20
> > > +1, this sounds much more robust, and allows better control by user-s=
pace.
> > > User-space needs to have fallback logic for other state as well anywa=
ys.
> > > If the combinatorial explosion is too much, we should think about opt=
imizing
> > > the KMS implementation, or improve the uAPI. =20
> >=20
> > +1 as well, with some recommendations added and the running off to the
> > sunset:
> >=20
> > Use two separate KMS properties for reporting current vs.
> > programming desired. The KMS property reporting the current value
> > must be read-only (immutable). This preserves the difference between
> > what userspace wanted and what it got, making it possible to read
> > back both without confusing them. It also allows preserving driver beha=
viour =20
>=20
> I don't see much real point in a property to report the current bpc.
> That can't be used to do anything atomically. So I suppose plymouth
> would be the only user.

Hi Ville,

I think also professional color managed display servers would need it.

If they detect that the link bpc is no longer the same as it was when
the monitor was profiled, the profile will need to be re-verified by
measuring the monitor again.

See "Color calibration auditing system" notes in
https://gitlab.freedesktop.org/wayland/weston/-/issues/467 description.

> So IMO if someone really need explicit control over this then we=20
> should just expose properties to set things explicitly. So we'd
> need at least props for the actual bpc and some kind of color=20
> encoding property (RGB/YCbCr 4:4:4/4:2:2:/4:2:0, etc.). And someone
> would really need to figure out how DSC would interact with those.

I believe there still must be "auto" setting for bpc, and a separate
feedback property, so that userspace can use "auto" to see what it can
get without doing thousands of TEST_ONLY commits plus a few "link
status" failure handlings in order to find a working configuration (I'm
assuming we have many more properties than just "max bpc" to figure
out). After "auto" has told userspace what actually works without blind
trial and error, then userspace can program than value explicitly to
make sure it doesn't change accidentally in the future.

What's DSC?

Now that you mentioned some kind of color encoding property (I assume
you referred mostly to the sub-sampling aspect), how does the connector
property "Colorspace" factor in?

The enum values (which are not documented in KMS docs, btw.) are tuples
of color space + color model, e.g. on Intel:

"Colorspace": enum {Default, SMPTE_170M_YCC, BT709_YCC, XVYCC_601,
XVYCC_709, SYCC_601, opYCC_601, opRGB, BT2020_CYCC, BT2020_RGB,
BT2020_YCC, DCI-P3_RGB_D65, DCI-P3_RGB_Theater}

Reading the KMS docs from
https://www.kernel.org/doc/html/latest/gpu/drm-kms.html#standard-connector-=
properties
they say:

> Basically the expectation from userspace is:
>=20
>         Set up CRTC DEGAMMA/CTM/GAMMA to convert to some sink
> colorspace
>=20
>         Set this new property to let the sink know what it converted
> the CRTC output to.
>=20
>         This property is just to inform sink what colorspace source
> is trying to drive.=20

However, where does userspace program the actual conversion from RGB to
NNN? Is it expected to be embedded in CTM?

Or does setting "Colorspace" imply some additional automatic
conversion? If so, where does it happen and how is it chosen?

> For just the plymouth case I guess the easiest thing would be to
> just clamp "max bpc" to the current value. The problem with that
> is that we'd potentially break existing userspace. Eg. I don't think
> the modesetting ddx or perhaps even most of the wayland compositors
> set "max bpc" at all. So we'd need to roll out a bunch of userspace
> updates first. And the "current bpc" prop idea would also have this
> same problem since plymouth would just clamp "max bpc" based on the
> current bpc before the real userspace starts.

True, but I believe once color management spreads through Wayland, so
will KMS clients also learn to set it.

Besides, any KMS client that does not set absolutely all KMS properties
will be at the mercy of any other KMS client they temporarily switch
with. So every KMS client should learn to program all possible KMS
properties anyway.


Thanks,
pq

--Sig_/mzn2dvYQ0vE9/GO5bvtUrS0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmKXE3YACgkQI1/ltBGq
qqcIEw//UlnX7s9CkKtPxePpYTFgm8vmEwGnJ/ub3NjRdP0Z7mnFZRjb43cadgH4
KeLupKYeNUb1qfinQ3FTUzllHp8CdNXeRETUKDyd6YD7kGzt3ciXsZpoElDdmX5l
j5yo4uluCqIkdicg7lDhtH39tcyBBR6OJNuqHKIq7+Z1MSqz1Vq5vFP18EN4i2uy
C+wTDHW10Z64iyo2YzHhjSWceKer8jhAIb9maW42lRJ71jET4Wi/0++fzAONBvF7
qJxYVIs+ETVdRZ+Os4i+KeS0AxrHAd0hnl0EqFc4wrPwt+mUt6CllbI3LtxjNieJ
7uMM+oG0Y8FaCWrhb0X7aCRdXcJ3tjVkriNlcqPoeQU57HziW6CSgw195ISbWF37
x9BKY00Yc3+CBgknHdkTm5zLNYEZXMkwDMvI2710Hfgjm9kEhosRC1XL3eFQ1SBR
IZu65hkM/MosPeESGa2gxie+ITWsL0NDoL69cQILqRkhJGirgiN7iDN6WSt9JteI
MCiqhPqxKFsoYqVYxtTkZI2t4NWoOCbe6x9IiuaWxOpnf+a0OX9b6u/fW7er9kPp
ROFj/Sb+tSdO68MLUN6x5Slpih67pLTJrcMHhI0UxHtOBYSBpK7R/Jrjvv1c4iSg
mR+wA5lVPpBSn+7y8L/78JhHgQ0ZsPXmoVRLzm0l2/YdjW3+gAU=
=shic
-----END PGP SIGNATURE-----

--Sig_/mzn2dvYQ0vE9/GO5bvtUrS0--
