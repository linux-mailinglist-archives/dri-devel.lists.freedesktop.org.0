Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8432D9439
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 09:41:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ABBF6E0F5;
	Mon, 14 Dec 2020 08:41:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01D786E0F5
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 08:41:54 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id w13so28074190lfd.5
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 00:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=hxYZtZ1G/4lHRYduqJWDbqPOVytRE36CQUvdMMCESa8=;
 b=LSrtygkWhjd0rDRs2FBVmtUxEl3235G0UMTSsfOs/8cNAdXYx2KMw7Qf2VPqvP6Z9s
 Y3foMVyIyQK9rURRGfIm8t9uo5jGU0PXpJHKrOBVDYx8wabSPPou8xIAcVtWJDj4bbt0
 Og3hPByi3bkGvwy1xyXeYqM2ZOeDTQlTqG0T07jg9JjZSpN686IV1U1TwFP3RyTWV/FZ
 aDjCV3LPO59Kb8JujLDQr7Zd9Voz49x6TYgTQPhCe2kWXuyZ0I84RrxDAnIGeL64vk5B
 iQyrTiyXpe3QvivubzXg9oRlgkX0WsMuEGszd4wkKIVXoIA8jSoGiy+Lq2qxE6iAwQKq
 LhKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=hxYZtZ1G/4lHRYduqJWDbqPOVytRE36CQUvdMMCESa8=;
 b=MVosXIJv/4OYXNXbDXsKtvK2SVi3ViEpFNtoeK8cWGANq/JPnSfKbH5r2dbYSl2YMt
 R+NRjqrW3bUd62jrkO5E8Cj7Uki4OQzhk4PD2BtYdF+4BLFE4UvF4Q442BkEANjFaGHk
 KJUAS50MfidpB9i0XeqsZFNSvJjcnOo4eDXohupn2oY4HU8fWjfdTZEslFuu+Op2KWSu
 f9DP8WZ8/XjCbfhQprOAE3WvuOPGYlckavqy9Gc7JEqKxPQN+DkNKBTBGDyQwq11Ow71
 tUHhAXs0q/TcZ2PTwTKalXs3nw6SADYzAsEbPTd+gPHMogNm4gug2YpXbs1MXxhr+CS5
 /+qw==
X-Gm-Message-State: AOAM5314P8OBe8jtBta10bEclI1jqU50HwY4IQ+RgNGh+hy1jcxG32Cx
 bFdwfJeDrc/T0vaa3zLpS0E=
X-Google-Smtp-Source: ABdhPJwNIvDN+FJRSkxmzT7Wh/yBZYi0K5eZhQkHO8YjfjeNR8i0SLFN6B7YcN9QEvsns0G3fi8i5A==
X-Received: by 2002:a05:651c:205b:: with SMTP id
 t27mr6967715ljo.368.1607935313414; 
 Mon, 14 Dec 2020 00:41:53 -0800 (PST)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id y9sm1036372ljy.37.2020.12.14.00.41.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 00:41:53 -0800 (PST)
Date: Mon, 14 Dec 2020 10:41:49 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v3 4/4] drm: require each CRTC to have a unique primary
 plane
Message-ID: <20201214104149.2d5532c4@eldfell>
In-Reply-To: <K0Ezu_ZjJ0PpN07HHog8QTOfwsHGxmowZgYxSCV7QLlr1pGFKU06x-8PDxSJd0vShRCjjASXpoFd2D5NhJdUhN1ltsLD6cJLjfr_pKzudpc=@emersion.fr>
References: <diZcSZPAu0GrvVEqzkkXk1LYv1pDkE536hsLoYTUoUw@cp3-web-016.plabs.ch>
 <20201211155024.5ea63a88@eldfell>
 <K0Ezu_ZjJ0PpN07HHog8QTOfwsHGxmowZgYxSCV7QLlr1pGFKU06x-8PDxSJd0vShRCjjASXpoFd2D5NhJdUhN1ltsLD6cJLjfr_pKzudpc=@emersion.fr>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0044920556=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0044920556==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/fZ2aizPjQ5C6h408eDL4YlV"; protocol="application/pgp-signature"

--Sig_/fZ2aizPjQ5C6h408eDL4YlV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 11 Dec 2020 14:39:35 +0000
Simon Ser <contact@emersion.fr> wrote:

> On Friday, December 11th, 2020 at 2:50 PM, Pekka Paalanen <ppaalanen@gmai=
l.com> wrote:
>=20
> > is there a reason why one cannot have more primary planes than CRTCs in
> > existence?
> >
> > Daniel implied that in <20201209003637.GK401619@phenom.ffwll.local>,
> > but I didn't get the reason for it yet.
> >
> > E.g. if all your planes are interchangeable in the sense that you can
> > turn on a CRTC with any one of them, would one not then expose all the
> > planes as "Primary"? =20
>=20
> I'm thinking of primary as a hint for simple user-space: "you can likely
> light up a CRTC if you attach this plane and don't do anything crazy".
> For anything more complicated, user-space uses atomic commits and can
> completely ignore whether a plane is primary, cursor or overlay.

That's a nice reason, do we have those written down anywhere?

- plane type "Primary" is a hint to userspace that using this plane
  alone on a CRTC has the highest probability of being able to turn on
  the CRTC

- plane types are just a hint to userspace, userspace can and *should*
  use atomic test_only commits to discover more ways of making use of
  the planes (note: if this applies to cursor planes, it will invalidate
  some "optimizations" that virtual hardware drivers like vmwgfx(?)
  might do by having the cursor plane position controller directly from
  the host rather than looped through the guest)

> > If the planes have other differences, like supported formats or
> > scaling, then marking them all "Primary" would let userspace know that
> > it can pick any plane with the suitable properties and expect to turn
> > on the CRTC with it. =20
>=20
> That's interesting, but I'd bet no user-space does that. If new user-space
> wants to, it's better to rely on test-only commits instead.

Ok. So plane types are not a good reason to prune a compositor's testing
matrix to avoid testing some combinations.

> > Or does marking a plane as "Primary" imply something else too, like
> > "cannot scale"? I think Weston does make this assumption in an attempt
> > to hit fewer causes for failure. =20
>=20
> No, AFAIK "Primary" doesn't imply something else, e.g. on amdgpu you can =
do
> scaling on the primary plane.

Thanks,
pq

--Sig_/fZ2aizPjQ5C6h408eDL4YlV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl/XJU0ACgkQI1/ltBGq
qqdbVhAAoOK7tIl8WrldMS69saeB6+3aI+IjnlxE2mceeunPE1Q2/OKuh6wd8Cde
sg/eYo3Ceqk2tzxY5U+ijzCfXqTUjNw9MzP0GHuzQEwf2AMjjeZ/saqPOS7GLh8a
01L4QRajYRpB0KlnrqXSuLuJW0kA0+geZmbqzra+jF6eu7gnOipG4/EYbgawPPU4
N2LfWbnoeHCm8X889lD34eUTHALYgXQjzarkcRjvNVArT9BHeY5PH8CHNl/xr3s4
bhDjve9YP0E8bKXgzJJHhKVDyds/qXj40V1mdaKafdjq/4BVpuQLSl3pZibR1jRT
6nLwJXhG2FwPeUASA2YjWnZRNHmv3rhh7licUt4M+/1VnUcKdwngfT/u+0++kfwp
CHnADNYiIpsv1quZyw1CZUBJX3j7skmEZ2JcOJRbCed+CYDf4Ig/KzSDQnC6eyCS
hRejx5kA24GBJ+D4w0DNUP4KXyBOYGnFUKRks6qZy/wAuaJTR+/AH0E9OmBBFtmm
SWJ95F5pXZ0SoQt0vXWsJG1rwBagklakYodglfMu8pW5NbwtfZzVx+GrW6+wJbHU
xs7cU3lYTSpdhONg4RFquX74nDH231PYd5cd1jP2iSU7Bru4ikmHxmjhX1EZiAgA
ddh5r3ZdKwrFYGqlZXNA8t39aHgyMFH8XJpN76CFn0y3IefECKE=
=pLzY
-----END PGP SIGNATURE-----

--Sig_/fZ2aizPjQ5C6h408eDL4YlV--

--===============0044920556==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0044920556==--
