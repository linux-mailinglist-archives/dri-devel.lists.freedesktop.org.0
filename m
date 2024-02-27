Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29722868C04
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 10:18:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9774810F2D3;
	Tue, 27 Feb 2024 09:18:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="AOZQ8fmO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3B7810F2D3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 09:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709025486;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Qek61wspXs8l98Avlozl6PXBKp/6fSu28LmXK11Qxvg=;
 b=AOZQ8fmOKYCwOLl6UXNT4yLgzQnGUtSEn+qNaf14V2wFpWBQOUankzeuYCOu1q3MXiG0yc
 PrPbyc9o/JtWC/pQEcHAebD/SDbqYcnTU4VTMe9qCG4dTCxNPrm51RRJYLYaTT7Y0eOshV
 ImXws4Sh749+AAPHMF4OhTqeZ1ObEkU=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-114-e3r5lb08PVqQkDjSxjFEsw-1; Tue, 27 Feb 2024 04:18:04 -0500
X-MC-Unique: e3r5lb08PVqQkDjSxjFEsw-1
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-51313b50f1bso83646e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 01:18:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709025482; x=1709630282;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qek61wspXs8l98Avlozl6PXBKp/6fSu28LmXK11Qxvg=;
 b=FuZkEn/rQ00ttkl5qLJkRkmQoOtLJJeMli50HKqxb576U1hXK4UBjDneth6mSDC/Oh
 BzaTx+ZL+GfzUJCHSx/q7Anf8RhlzG1Orcd7oxa+KzkopToysNLx2QLlZQTad09DF0vG
 5q75WIKYC5RF8roeQM6iV1zir2rEc5raxQs2n0cF6NDkLiGA4jqQy3Wdyg9/Pf/QJT5l
 dzd//s3/i+pVBlfCor9yWrStm5jLq92lgHMmtAZZOA80rb89ocjKRAFJotnlMwwHi0au
 2yLsuBKQQVxEEXppiUJfG50etLByJTNdcZerB6Qo7z1gbaFG3cPXM4MGAmX1QISSX+OA
 zd3w==
X-Gm-Message-State: AOJu0YysDiWuVl6PaHF2BsP0gwfzrbeBGoezYJciwcemzd41yGdDek46
 jg4DKq7FC/gliWof96pNa8mV7wH2Dp3VaS6697agC+aCzoWO+MJPr4KcMASiJYAsoC0zw13a45H
 ThT3JKUPwx8nANah1kucuDI9MkSNEslywb1f7wl2peneZooS0e7s1+ZyShuYCYIVAVw==
X-Received: by 2002:a05:6512:4005:b0:512:bce9:11af with SMTP id
 br5-20020a056512400500b00512bce911afmr8002135lfb.3.1709025482485; 
 Tue, 27 Feb 2024 01:18:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG1azD3zw8/fVU6eiSFgd1n31c4ICayrJMk2lsjefwyIXZ5XohcUpf+O55ZoCeo30CKzgBAuw==
X-Received: by 2002:a05:6512:4005:b0:512:bce9:11af with SMTP id
 br5-20020a056512400500b00512bce911afmr8002112lfb.3.1709025482088; 
 Tue, 27 Feb 2024 01:18:02 -0800 (PST)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 bt21-20020a056000081500b0033b48190e5esm11059341wrb.67.2024.02.27.01.18.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Feb 2024 01:18:01 -0800 (PST)
Date: Tue, 27 Feb 2024 10:18:01 +0100
From: Maxime Ripard <mripard@redhat.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, 
 Daniel Vetter <daniel.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Daniel Stone <daniels@collabora.com>, dim-tools@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: Re: DRM Migration to Gitlab
Message-ID: <q4imcbwr5act2iy3pswsvhojj6r5spjbo4w3wejn2mi2a34irl@c2gin24mbiwr>
References: <k555c7lj3mcj2skzrmc2ywxzz5ndtdgfpitw7fftdlyjjpmfou@7maudk3vdxuf>
 <87edcyl38y.fsf@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="lbjy76afh27ceari"
Content-Disposition: inline
In-Reply-To: <87edcyl38y.fsf@intel.com>
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


--lbjy76afh27ceari
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jani,

On Tue, Feb 27, 2024 at 10:29:01AM +0200, Jani Nikula wrote:
> On Tue, 27 Feb 2024, Maxime Ripard <mripard@redhat.com> wrote:
> > Hi,
> >
> > Sima, after becoming aware of the drm-misc transition to Gitlab in the
> > next couple of weeks, to do the same for DRM today.
> >
> > This is now done and all the various bits (nightly.conf, MAINTAINERS,
> > doc, etc.) should be there.
> >
> > If all goes well, the only thing you'll notice is that dim will complain
> > about the drm remote not having the right URLs.
> >
> > Any dim user should update the URL with either one of the two following
> > commands:
> >
> > git remote set-url drm ssh://git@gitlab.freedesktop.org/drm/kernel.git
> > git remote set-url drm https://gitlab.freedesktop.org/drm/kernel.git
> >
> > And the rest should be transparent.
>=20
> Except it isn't. If you do that before updating to new nightly.conf,
> it'll complain that the URL it sees in the old config isn't available,
> and prompts.
>=20
> If you first do 'dim ub', and then do 'dim ub' again, before changing
> the URL, it'll also prompt, but it's unable to override the existing drm
> remote.

Urgh, you're right... It's also partly due to drm-tip being the last
repo to be updated. I've overlooked that aspect since I had the local
changes to nightly.conf.

> I think dim should be updated to handle all of this without user
> manually doing anything other than answering a yes/no prompt.

I've started to work on that, but it's probably going to take a bit of
time to figure it out, bash isn't really my strong suit.

If anyone is stuck with this, you can get unstuck manually by doing:

cd $DIM_PREFIX/drm-rerere
git checkout rerere-cache
git pull

cd $DIM_PREFIX/kernel
git remote set-url drm ...

There's been reports in private that some didn't get their branch
updated for some time and will have to add the drm/xe repo too:

git remote add drm-xe ssh://git@gitlab.freedesktop.org/drm/xe/kernel.git

Maxime

--lbjy76afh27ceari
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZd2oyAAKCRDj7w1vZxhR
xVwWAQDZZFN7/cUljlyPFonrZwjI0TQob/XdnMm2nSpu98MlrQD/UvzdI8gOW8Xs
ejc1C2Kj2PpOqQK7Yi2/4zBu8Ep+BAw=
=DvPh
-----END PGP SIGNATURE-----

--lbjy76afh27ceari--

