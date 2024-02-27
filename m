Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6729868FB8
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 13:09:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F59510E70F;
	Tue, 27 Feb 2024 12:09:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="iloc4fiD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 468B410E1C7
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 12:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709035756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oM1nmhmrYYwiRJpLohVKmwOBLO0DhpwgeVCgc2eX2Gg=;
 b=iloc4fiD9AP2RgP7/VfVKdyA2AaLvvP5DQV76OrB75gqTCiE9JinG91bf2LBM+xKwni6a1
 D0mKUHuink3M85HMSjkESTfCgtY2q1mgvcopiI7nKMsNSg5bLjqCBZjkiM4+/T9aHpoAnq
 qOInBL9tESUoZYkknfI4wQq5NSKgJmw=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-128-8fNsjWqaPnS_i15mcKuRBQ-1; Tue, 27 Feb 2024 07:09:14 -0500
X-MC-Unique: 8fNsjWqaPnS_i15mcKuRBQ-1
Received: by mail-lj1-f197.google.com with SMTP id
 38308e7fff4ca-2d29355b96dso9051861fa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 04:09:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709035753; x=1709640553;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oM1nmhmrYYwiRJpLohVKmwOBLO0DhpwgeVCgc2eX2Gg=;
 b=UbEDg0jxgZ0q5QvoD5D5NxQ5qjGRtdUr+zDqaa6vPOkxewIF5zTcez7nG8t6fkWnrH
 Ma4BixLkHPSgnif/oCkN69facHzFK6g7uSK0cKpEDZFZBSNiMDLS7hfjIJlnAKD/ru9f
 Kt6hBf/WBi7Txrha7WlaN1oMsuLFs2xRnEA/ufVt+dtcP7PMEFlE42ZgxXi+Ne0+9w7t
 cv8QyGnR520EiDQSuUAzDzEUVqryP8ygixnVDCwbEdhPeWf2Vogo0kG/247D/g1Kqg0d
 EYYERluAEzRKflMltLBOESd57P9ifIikcXBAX3KRCtLSe5id8RtZTgWSrnkEeeUZRiaO
 bvqA==
X-Gm-Message-State: AOJu0YzdcEO2rLhJAQMxV9WzcE4ykbEWeNmTa2ocNgJi6FWnDD6PBbut
 eyzDHGG1Ji9gP1UhXsTqRcSOa8VPyD9gTKy9CNeKyXwJagYOCNaZ90WD+IdcOkYT0zUtgz+GMXm
 rr3BBt+xQ5yUsCgc3oY2+wKoqAktIz6RSGdjg/Ws9+I2f58omHfk82VAP+ibFIJPT+w==
X-Received: by 2002:a05:651c:38d:b0:2d2:3018:4cdf with SMTP id
 e13-20020a05651c038d00b002d230184cdfmr4834784ljp.23.1709035753138; 
 Tue, 27 Feb 2024 04:09:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH9G3LparnNwkCyjvTlAUoqjf2NLbplLJPZiM9tnnaWg/TWhTIFlJEPJAE6OlRhuj6NLDGO3Q==
X-Received: by 2002:a05:651c:38d:b0:2d2:3018:4cdf with SMTP id
 e13-20020a05651c038d00b002d230184cdfmr4834774ljp.23.1709035752703; 
 Tue, 27 Feb 2024 04:09:12 -0800 (PST)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 jt2-20020a05600c568200b0041290cd9483sm14863668wmb.28.2024.02.27.04.09.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Feb 2024 04:09:12 -0800 (PST)
Date: Tue, 27 Feb 2024 13:09:12 +0100
From: Maxime Ripard <mripard@redhat.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, 
 Daniel Vetter <daniel.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Daniel Stone <daniels@collabora.com>, dim-tools@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: Re: DRM Migration to Gitlab
Message-ID: <55qlpusrqjqlhuqybmc26f3hwscyhqcgadylrx42dzmqqg4gza@gxdpxuudj6r7>
References: <k555c7lj3mcj2skzrmc2ywxzz5ndtdgfpitw7fftdlyjjpmfou@7maudk3vdxuf>
 <87edcyl38y.fsf@intel.com>
 <q4imcbwr5act2iy3pswsvhojj6r5spjbo4w3wejn2mi2a34irl@c2gin24mbiwr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="5xdvtw5ku5u2ryh4"
Content-Disposition: inline
In-Reply-To: <q4imcbwr5act2iy3pswsvhojj6r5spjbo4w3wejn2mi2a34irl@c2gin24mbiwr>
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


--5xdvtw5ku5u2ryh4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 27, 2024 at 10:18:01AM +0100, Maxime Ripard wrote:
> Hi Jani,
>=20
> On Tue, Feb 27, 2024 at 10:29:01AM +0200, Jani Nikula wrote:
> > On Tue, 27 Feb 2024, Maxime Ripard <mripard@redhat.com> wrote:
> > > Hi,
> > >
> > > Sima, after becoming aware of the drm-misc transition to Gitlab in the
> > > next couple of weeks, to do the same for DRM today.
> > >
> > > This is now done and all the various bits (nightly.conf, MAINTAINERS,
> > > doc, etc.) should be there.
> > >
> > > If all goes well, the only thing you'll notice is that dim will compl=
ain
> > > about the drm remote not having the right URLs.
> > >
> > > Any dim user should update the URL with either one of the two followi=
ng
> > > commands:
> > >
> > > git remote set-url drm ssh://git@gitlab.freedesktop.org/drm/kernel.git
> > > git remote set-url drm https://gitlab.freedesktop.org/drm/kernel.git
> > >
> > > And the rest should be transparent.
> >=20
> > Except it isn't. If you do that before updating to new nightly.conf,
> > it'll complain that the URL it sees in the old config isn't available,
> > and prompts.
> >=20
> > If you first do 'dim ub', and then do 'dim ub' again, before changing
> > the URL, it'll also prompt, but it's unable to override the existing drm
> > remote.
>=20
> Urgh, you're right... It's also partly due to drm-tip being the last
> repo to be updated. I've overlooked that aspect since I had the local
> changes to nightly.conf.
>=20
> > I think dim should be updated to handle all of this without user
> > manually doing anything other than answering a yes/no prompt.
>=20
> I've started to work on that, but it's probably going to take a bit of
> time to figure it out, bash isn't really my strong suit.

I've sent a MR to handle this:

https://gitlab.freedesktop.org/drm/maintainer-tools/-/merge_requests/39

Maxime

--5xdvtw5ku5u2ryh4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZd3Q5wAKCRDj7w1vZxhR
xSjFAQDgQGgWB5/FC3Nf7LEwB7yPcrMPH9MswxIpfnK83oDc9wEAiPEZTu/l7N4w
abEXogk4j/Ka5InNVpiwkoP/G+o60AA=
=f9nn
-----END PGP SIGNATURE-----

--5xdvtw5ku5u2ryh4--

