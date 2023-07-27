Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49636765606
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 16:33:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7B7210E593;
	Thu, 27 Jul 2023 14:33:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03C0310E593
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 14:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690468417;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xmf9jFAe74TWDaGbD40cqNuxwvUchwJqCzoa17xaONg=;
 b=Ghen3dZf6OYcSXDK3Ig/cm6nYbS8bsxwUAD5vAkyOkr58TJsJCRvfbOM601rjPGqzL9XPl
 AngZXgNFnc19n3oWmenB6OyTHz780Y8pS6rqpc9SOvSkpZBGSGHPiMk/+8Tt1kOJS1ryVn
 6U4vqQb3YCesQ0ssRd1UBBxWoraoRK4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-682-690Ow-rEMlGJsL-MRSnkvA-1; Thu, 27 Jul 2023 10:33:33 -0400
X-MC-Unique: 690Ow-rEMlGJsL-MRSnkvA-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3176eb6babbso992630f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 07:33:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690468412; x=1691073212;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xmf9jFAe74TWDaGbD40cqNuxwvUchwJqCzoa17xaONg=;
 b=UF++/iGrRoNOyEScwwGq7x4DrB9dkGSGqaP1FmJpfolZ0qqs5T9ITNAGeuAlOMKyXL
 pbISHTpkb8DQ8Su9gcNHmNWKEyfJCGJZr+j8cAkVlRWeaebWh5oWF2t8SR5RcysTMJ8B
 BfET7LO3NeqdJUV4Rs2+9qELpco53vAZoB1WxiNHLKcK+rzCdOan84/bVpoxAVddVfMo
 GnO9U1UJYYDZ+IgMX27jUtPVz7LPBKHlLe10OisItX6o+dDicY31fJzRwSus2SGKztYM
 0xjP4Nxf0A6KnCTqE/iR9Zw2NgeLbUrosfVncop5SpsoTkSngeWEM/SrofhsanZoLAtQ
 ju3Q==
X-Gm-Message-State: ABy/qLbaRQYT5TrZUKMd2VopNK4THyhewv+3Y+QaH1vOo/B9opjf33oC
 a4CBfpTof2EdBYStxA7ZwhtjAoPNjLkMk593BfGhSvFubdNvjSHWTCGjUKD9eEAYndB6i6n8ETd
 zenYYWJmVgXGZyAYsyhsdrh06vmmf
X-Received: by 2002:adf:fb0e:0:b0:317:6579:2b9f with SMTP id
 c14-20020adffb0e000000b0031765792b9fmr1777440wrr.30.1690468411912; 
 Thu, 27 Jul 2023 07:33:31 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFfTOoP06MbshJoIl90ALvKdeepxdbnSH9136f3hUEKacs/geA/ZVY8cTC/8mEaNZ2N9hdlmA==
X-Received: by 2002:adf:fb0e:0:b0:317:6579:2b9f with SMTP id
 c14-20020adffb0e000000b0031765792b9fmr1777427wrr.30.1690468411545; 
 Thu, 27 Jul 2023 07:33:31 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 b17-20020adfde11000000b003143765e207sm2232640wrm.49.2023.07.27.07.33.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 07:33:30 -0700 (PDT)
Date: Thu, 27 Jul 2023 16:33:30 +0200
From: Maxime Ripard <mripard@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/mgag200: Increase bandwidth for G200se A rev1
Message-ID: <hnyzo4cldffz6rzntmuvblissfrw7ig6qidnc2f3iortcdagid@fi5bn44asg2v>
References: <20230717133037.25941-1-jfalempe@redhat.com>
 <69a9ee2e-bd03-2a63-6651-0680475d7025@suse.de>
 <4f5d262c-527f-0fa6-45e3-a75aa22fcf0d@suse.de>
 <20230724215746.10928@revelation.broadband>
 <ca6cd674-d268-6210-c66d-4750e28a5c77@suse.de>
 <7f6fd614-5910-6c94-2c55-110223b61b5f@redhat.com>
 <8f0ee2da-0a06-a78d-ab74-c552da822b97@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="t2pe4cowqrtcfmto"
Content-Disposition: inline
In-Reply-To: <8f0ee2da-0a06-a78d-ab74-c552da822b97@suse.de>
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
Cc: Roger Sewell <roger.sewell@cantab.net>, airlied@redhat.com,
 Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--t2pe4cowqrtcfmto
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Wed, Jul 26, 2023 at 05:36:15PM +0200, Thomas Zimmermann wrote:
> > I've already sent a patch to use internally 24bit colors, when userspace
> > can use 32bit that would solve this issue as well. In the end, on the
> > VGA link, 24 or 32 bit colors are the same. That would allow modern
> > userspace to work on par with Xorg. So maybe we can reconsider it ?
>=20
> No way. We've had IRC flamewars over this topic already. People didn't get
> work done that day; others ragequit-ed in frustration. Ask Javier, he'll
> remember. :)
>=20
> The consent in DRM-land is: we're not going to mess with color formats
> behind the back of userspace. The only exception is the emulation of
> XRGB8888 iff the hardware does not support that. And only because it's the
> fallback format that is universally supported.

I'm aware that I might be reviving old heated debates here, but I'm not
sure what is the problem here.

I guess part of the problem is that due to the memcpy call, we would
have it in software.

But it's not clear to me how we're messing with color formats there: the
memcpy would drop the alpha part that was doing to be dropped by the
hardware anyway (and likely would have done so transparently if it
wasn't for the memcpy).

It doesn't affect the userspace at all, it doesn't change the way we
interpret the format either, it just ignores a part of the format that
is supposed to be ignored anyway. And doing so frees up a bunch of
resources?

So, AFAIU, it doesn't have any side effect except for the fact that it
consumes less memory bandwidth and allows for more pixels to go through.
That's not really "messing with the formats" in my book.

Maxime

--t2pe4cowqrtcfmto
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZMKAOgAKCRDj7w1vZxhR
xf3DAP9l7S0YsmVPrrtrWGjvs+OZWJ9AyZnnYYu6UoaLap/IAwD/ahBlTryvhEUe
LXsOS4i8pgWAVs2CT9HyWRqIdzIijgo=
=hcv6
-----END PGP SIGNATURE-----

--t2pe4cowqrtcfmto--

