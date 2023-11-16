Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A4B7EDD8C
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 10:23:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A30C510E256;
	Thu, 16 Nov 2023 09:23:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D139010E255
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 09:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700126583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=w35rrT7mZxkd5tfTUmEJQuHgJFwG2ZKuKcURtyFKyzE=;
 b=S55gNxeNT/5EfLrr8xHrtbIy5OBAlPNtZNsfdKGh+RhdsU0Ydn37cGQBcrkFdh59Tmma3I
 7ToIvi1BLRJuYnlqznJGs6erZ6y0WNNeBIQlOqn9RbucV2i6kzTh1BYmcx1r3tKfT1FstA
 sdvhM1E5NRW5jIfN9GvsM8B4I2/wSXI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-446-nt9qVdNPNTWaB4zWza_Mpw-1; Thu, 16 Nov 2023 04:23:00 -0500
X-MC-Unique: nt9qVdNPNTWaB4zWza_Mpw-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4092164eceeso3306915e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 01:23:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700126579; x=1700731379;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w35rrT7mZxkd5tfTUmEJQuHgJFwG2ZKuKcURtyFKyzE=;
 b=uHnn6HIAPXpr//8btbvAiTSuOYODunbhSi29nI4zhUIAamxkF58sGliftgZlsg6gEb
 BhxnAup8T2CVMIZgcdptKkjo95xhWRg4eDNWDqm5awwRiMxt4WVIwVIVq92kZySYCsNl
 OXLLBXfOuukRXbreltP9/Pu/HeQm8SHO+T+/R8BCms9swLMHpAt3tZjzK/7TWO4Dx7UB
 xsK8IWrCcdtsRYa0l2jGorKp5rBxbbu623wwtF5lvSONMPAYpAizl1DnWi28wVtR+vKi
 EWW6B9qNSyd9iH+gX7YFLD1Q3ZAmHAdPCcuTVsPbqA3AvMzH3q3heFGxTVHlA1wYihZ2
 VHSw==
X-Gm-Message-State: AOJu0YyM+Ztt1kQUP0GPlw9oDXdmtvDqpWItaWaLWLFI7EMSFcLIzZ6A
 Xc9UUrD05klKd0/zVkh/oTkp5uhBXCoEl1qOiWahJPK/EWrvOuUcZ1It0LJ0dQERirek1Y05Khm
 CfoS88oTO9kZK6PFUnrUyOyIJ3L7W
X-Received: by 2002:a05:600c:1906:b0:408:5ba9:d707 with SMTP id
 j6-20020a05600c190600b004085ba9d707mr12879655wmq.16.1700126579446; 
 Thu, 16 Nov 2023 01:22:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGyuBLaQ9uVYXCAgGY4tjsp6WBRdoWBL/6H3EJ08muS9pK4nQxBMd8/uWN9ZKr7eoapbzo5sw==
X-Received: by 2002:a05:600c:1906:b0:408:5ba9:d707 with SMTP id
 j6-20020a05600c190600b004085ba9d707mr12879634wmq.16.1700126579048; 
 Thu, 16 Nov 2023 01:22:59 -0800 (PST)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 dn17-20020a0560000c1100b0032db1d741a6sm12734556wrb.99.2023.11.16.01.22.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Nov 2023 01:22:58 -0800 (PST)
Date: Thu, 16 Nov 2023 10:22:58 +0100
From: Maxime Ripard <mripard@redhat.com>
To: Luben Tuikov <ltuikov89@gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the drm-misc tree
Message-ID: <53oamsiakocoohdvs2raagdpzfj73xlrxuxvrsdvxkkwxdrm3m@dlu2tno6tjgv>
References: <20231114075501.61321c29@canb.auug.org.au>
 <19740d41-dd5a-47e4-b3e8-539b45bbd3e5@gmail.com>
 <3c306310-04b3-4658-a197-4b2d22a88274@gmail.com>
 <20231114134506.2ba0de1f@canb.auug.org.au>
 <530b6100-4f4e-4b3d-8fea-5b316e989633@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="oucpashu4qkda5nm"
Content-Disposition: inline
In-Reply-To: <530b6100-4f4e-4b3d-8fea-5b316e989633@gmail.com>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--oucpashu4qkda5nm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Nov 13, 2023 at 09:56:32PM -0500, Luben Tuikov wrote:
> On 2023-11-13 21:45, Stephen Rothwell wrote:
> > Hi Luben,
> >=20
> > On Mon, 13 Nov 2023 20:32:40 -0500 Luben Tuikov <ltuikov89@gmail.com> w=
rote:
> >>
> >> On 2023-11-13 20:08, Luben Tuikov wrote:
> >>> On 2023-11-13 15:55, Stephen Rothwell wrote: =20
> >>>> Hi all,
> >>>>
> >>>> Commit
> >>>>
> >>>>   0da611a87021 ("dma-buf: add dma_fence_timestamp helper")
> >>>>
> >>>> is missing a Signed-off-by from its committer.
> >>>> =20
> >>>
> >>> In order to merge the scheduler changes necessary for the Xe driver, =
those changes
> >>> were based on drm-tip, which included this change from drm-misc-fixes=
, but which
> >>> wasn't present in drm-misc-next.
> >>>
> >>> I didn't want to create a merge conflict between drm-misc-next and dr=
m-misc-fixes,
> >>> when pulling that change from drm-misc-next to drm-misc-fixes, so tha=
t I can apply =20
> >>
> >> ... when pulling that change from from drm-misc-fixes into drm-misc-ne=
xt, so that I can apply...
> >>
> >>> the Xe scheduler changes on top of drm-misc-next. =20
> >>
> >> The change in drm-misc-fixes is b83ce9cb4a465b. The latter is contained
> >> in linus-master, and in drm-misc-fixes, while the former is in drm-mis=
c-next.
> >> When we merge linus-master/drm-misc-fixes into drm-misc-next, or which=
ever way
> >> it happens, I'd like to avoid a merge conflict, but wanted to expedite=
 the changes
> >> for Xe.
> >=20
> > None of that is relevant ... if you commit a patch to a tree that will
> > be in the linux kernel tree, you must add your Signed-off-by to the com=
mit.
>
> Noted!
>=20
> So I always do this when I do git-am and such, but wasn't sure for this o=
ne single cherry-pick whose
> original author was the committer in drm-misc-fixes, but will add my Sign=
ed-off-by in those
> rare circumstances.
>=20
> Thanks for the clarification!

In order to move forward with this, can you provide your SoB here for
that patch so that we can at least point to it in the drm-misc-next PR?

Maxime

--oucpashu4qkda5nm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZVXfcgAKCRDj7w1vZxhR
xQ0TAQD+tZvFBotDMwtlIexNUj36LAdqeTNlZf+et4C/TGjE6wD8Cpt1DNsNFwD7
HtkspJgcjo7h41mN5yevjDoR2XxRbAo=
=ZICb
-----END PGP SIGNATURE-----

--oucpashu4qkda5nm--

