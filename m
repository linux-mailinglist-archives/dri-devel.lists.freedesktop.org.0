Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5E5403891
	for <lists+dri-devel@lfdr.de>; Wed,  8 Sep 2021 13:13:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D9326E190;
	Wed,  8 Sep 2021 11:13:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E9DF6E190
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Sep 2021 11:13:27 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id f18so3657226lfk.12
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Sep 2021 04:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=a0AwZqCISlDdDTJUtxZvX791tIdeTIm+uggGZuEbUjk=;
 b=mdj+vMcSj1iI0HTYGzQ4yEE3TaNUObCnvshIs31nBPZHWofuO9fQnEPkoItT531NVA
 sz1ZD/JP9hXU9j2R7VACsZVGvaMLbwhDvOCsLHiZhLEr5wqk1uwnksOe76sL08oGE7Pl
 SO61hh+3f6oYK5fT4r9E58DRy4ZHmf1ixo4chxLJEw+5Tffs+zS0KkJyH06dTrsx1FgB
 xCi0oU68SWGgvZDkJod1y1QPDbKjha2UUovKVtFPaxZ6HJmsoobsiHqatEse1c/JC1FY
 9/3fZgU41hHx8L6uDPhVw26Vb4zTcDBwVbgt0gvcLxUD3xBx4xY9XczJ1IcPs2qFpv7O
 TpBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=a0AwZqCISlDdDTJUtxZvX791tIdeTIm+uggGZuEbUjk=;
 b=GlT4eeAEGpBFys/7WBa5T4seDQvQigv2PVZz6sXea5y+jy5RMMwIvee+x3bIT9zdYL
 3h0epyVWrfQEkWVLITlMpCzVwgnlqVNeJ+46H9xqW7VnXWV9ZhaUj8wlZfGi3qooUw2y
 0fWjbu1TBls4y/8k98zTUmyYKyyiqEXwazK91Zd/G+WIRTuhYqn9mviKfiic3bOa5nV2
 K1MupbZNnzuLY+lDgwbP86aW16XaGNM/o+9MP+8aybLDMf9BteIqpcYKAjE2rX4q3LT+
 z0gqu0aq8SkC99HzYcG1srW23gslnH4HLd7yEFe5TtDE6WLw6N/nwNJtDnRQ4EYNH1uW
 bIgQ==
X-Gm-Message-State: AOAM532r7COmyWHIazgooZbsgKOzAiDYtUVnOYcUMOEPASBn55Ofnk35
 x2WautX9rirUvVMhvAlzARg=
X-Google-Smtp-Source: ABdhPJzpJKRKNAV0vhtJJklDLr16K8PvoIOSM0CSEHt71vu27aS0a6+WLPqkxKZcOII15dZRvH8ALQ==
X-Received: by 2002:a05:6512:3982:: with SMTP id
 j2mr2220761lfu.1.1631099605374; 
 Wed, 08 Sep 2021 04:13:25 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id b21sm162989lfi.104.2021.09.08.04.13.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 04:13:24 -0700 (PDT)
Date: Wed, 8 Sep 2021 14:13:15 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Cc: Dennis Filder <d.filder@web.de>, dri-devel@lists.freedesktop.org, Hans
 de Goede <hdegoede@redhat.com>
Subject: Re: Handling DRM master transitions cooperatively
Message-ID: <20210908141315.4868f5d5@eldfell>
In-Reply-To: <jSyTJ5Ev5ZkQFBv0Ar_6MALQ4Vj1e5lvB9gXrWcYkilCvhQ_Zo-9zpuPti5L0h1flBJuc4N_ayBmoqTbfqiSaUMwk3b08EgQ1DYKTHMYQsI=@emersion.fr>
References: <YTJypepF1Hpc2YYT@reader> <20210907130746.7b667dac@eldfell>
 <Kh2hM9odvPcbqNUxhSEwQbnUCLt6nyrAzGhxnQ0JO1CcAzI6y31enf8_AmgAynFxWo3E1QUlW1m8UvKPDAq0gFLQi2CF1b3FFNMRfiUzOAI=@emersion.fr>
 <20210907155214.285b3561@eldfell>
 <jSyTJ5Ev5ZkQFBv0Ar_6MALQ4Vj1e5lvB9gXrWcYkilCvhQ_Zo-9zpuPti5L0h1flBJuc4N_ayBmoqTbfqiSaUMwk3b08EgQ1DYKTHMYQsI=@emersion.fr>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9Jw/PYk_xOPxC73CeuRu.jn";
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/9Jw/PYk_xOPxC73CeuRu.jn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 08 Sep 2021 09:51:54 +0000
Simon Ser <contact@emersion.fr> wrote:

> > On Tue, 07 Sep 2021 10:19:03 +0000
> > Simon Ser <contact@emersion.fr> wrote:
> > =20
> > > FWIW, I've just hit a case where a compositor leaves a "rotation" KMS
> > > prop set behind, then Xorg tries to startup and fails because it does=
n't
> > > reset this prop. So none of this is theoretical.
> > >
> > > I still think a "reset all KMS props to an arbitrary default value" f=
lag
> > > in drmModeAtomicCommit is the best way forward. I'm not sure a user-s=
pace
> > > protocol would help too much. =20
> >
> > Hi Simon,
> >
> > for the "reset KMS state" problem, sure. Thanks for confirming the
> > problem, too.
> >
> > The hand-off problem does need userspace protocol though, so that the
> > two parties can negotiate what part of KMS state can be inherited by
> > the receiver and who will do the animation from the first to the second
> > state in case you want to avoid abrupt changes. It would also be useful
> > for a cross-fade as a perhaps more flexible way than the current "leak
> > an FB, let the next KMS client scrape it via ioctls and copy it so it
> > can be textured from". =20
>=20
> The KMS state can be limited to single FB on primary plane covering the w=
hole
> CRTC, no scaling, no other property set than FB_ID/CRTC_*/SRC_*.
>=20
> Is it useful to make the previous client perform the animation? I don't r=
eally
> understand the use-case here.

I guess the use cases are more or less imaginary for now.

Imagine one HDR-capable display server handing off to another
HDR-capable display server. If the releasing display server does not
know the receiving display server understands HDR, the releasing
display server might run an animation to turn HDR off - fade to black,
for instance, so that the impact from changing from HDR to SDR is
minimized. Then the receiving display server sees KMS is in SDR mode,
and maybe sets up a black image and then switches back to HDR.

If you're happy with fade-to-black on switch, then no problem. However,
the only way to not fade-to-black or even come cross-fade is
some negotiation to see that both sides understand HDR.

If the previous FB was rendered for HDR display, you will need to know
a lot from it if you want to do a cross-fade that doesn't glitch.

Also, while I don't see why changing between SDR and HDR would require
a modeset in KMS, I suppose it might take a moment for the monitor to
adapt. It might cause glitches similar to changing video modes.

> > Userspace protocol is also useful for starting the next KMS client
> > first and handing off only later once it's actually running. I'm not
> > sure if that is already possible with the session switching stuff, but
> > I have a feeling it might be fragile or miss pieces like the next KMS
> > client signalling ready before actually switching to it. =20
>=20
> Hm, right. I'm not 100% clear if it's possible for the next client to set
> everything up while the VT is not active.
>=20
> It would help to make logind/seatd give a non-master DRM FD when VT-switc=
hed
> away. Not sure they do it atm.

Oh yeah, that may be an obvious gap I missed.


Thanks,
pq

--Sig_/9Jw/PYk_xOPxC73CeuRu.jn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmE4mssACgkQI1/ltBGq
qqctLA/8Dea9xtE3unkm9pikGb+KRMXI4KgnElSVx5Y6LTaDDjPZPOyVCfF9CVqR
MpHg7N9T6Ca002k+YpZMmdDyPokvOVBoVy4yHgL7iFmt1Y4IsJr2AYi7uvFqI9g9
6GgPO1Ms1JP/tRR1zr5m+gdq0UftiC22P4hsVEYdrB1G4VP9KlFIHMp0IptyUNOa
lpGiqSdDuLQ7qaHN8PNs2oosoE7WyqpbFQg1TF/10fiY1QJ14ZgEtWYGEJEKqqP8
LC3tSSFmpJJBtQMa1DY9El6gjNIUFl9p+CSzs2SCfKRS5s6Y0tXKCqC6NluP4Oa1
ZMHU8//fc+NZ+tp/BtHtb7IgrBkLePOnxIu1DIxjpoqBg+6LSl6tmdaU63FPPVXv
R+X6iSN893rzefuZ4s8gsi1K05ksqMZmtMBvygTpiD0pdCfli17+FHD47Sge681N
LmP+VRpxOmE6rNvShWvqsGgS6I12CZjkZg+O4HURJNYeoNQNnlt+tzTZTkUvNyNI
C4NTy3lvTekRq1Neh9V3q0mmyQHlj1bCpPO+LaD1gA+NfrXLaMS1gm9hNAll87TS
2wWCe7AlloXBu76JnNqbJD1fe4bZ+/a914/B6+7BdXCo9Wpnymb8P1czg7M4gvg0
DlKQvdXO7GIJS5nYN6a7hGRsHlkTfnjX+aEIHHY9FbTmd2OaaV8=
=W4KA
-----END PGP SIGNATURE-----

--Sig_/9Jw/PYk_xOPxC73CeuRu.jn--
