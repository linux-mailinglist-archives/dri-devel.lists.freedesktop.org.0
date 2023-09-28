Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 449287B1437
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 09:11:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2535110E5D6;
	Thu, 28 Sep 2023 07:11:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55A6D10E5D6
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 07:11:15 +0000 (UTC)
Received: from verdu-eth.calcurco.cat.235.168.192.in-addr.arpa (unknown
 [93.176.144.0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: sergi)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 3E0DC6607327;
 Thu, 28 Sep 2023 08:11:13 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1695885074;
 bh=32T81fKvUycfKAhnCTiHsDbfmXmo2fIN4PHbMCuJ0bs=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=HuS2RykrdK0vM5nrbTCy64Xc2ZB6qNUhKxlqtqFcqXi8x3JpQb6FIfbQ0H9vhZkyU
 cJJq2Lr8PSlC2GDs3B4TPSVCz0FZhgEn8wMU1PlUBd9MpQ0mLcDShZIdg392kv0Gk6
 Lp0XceWupnpVs8OwCkKW8UNCEpAtA4swFiH16gr4CWm1TpV6/pQZav7gAfocw/ZY5k
 Lz27QcV/QIPjtJdRhaNyOaYC8asYLqMCWcEyFgJ0YvVw1vGAdHaRTWzn0iHP/qhEl5
 pb1S+7809Y8Ug6AFS3OYgXolpJpjoxtsayVRf6G6q9vpv00halZBmXLlyQWI6Ql72k
 Y+sr/Y2h2o9XA==
Message-ID: <c25165891e0628b3a3a50cc528a86b2b2a65b7ae.camel@collabora.com>
Subject: Re: [RFC PATCH] drm/ci: add helper script update-xfails.py
From: Sergi Blanch Torne <sergi.blanch.torne@collabora.com>
To: Helen Koike <helen.koike@collabora.com>, dri-devel@lists.freedesktop.org
Date: Thu, 28 Sep 2023 09:10:58 +0200
In-Reply-To: <785cbfee-f4d3-3d53-a3e6-2f9af8fa05fb@collabora.com>
References: <20230925195556.106090-1-helen.koike@collabora.com>
 <8f946d0a5632d580b593cf731091126d59feb77f.camel@collabora.com>
 <785cbfee-f4d3-3d53-a3e6-2f9af8fa05fb@collabora.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.46.4-2 
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
Cc: mripard@kernel.org, michel.daenzer@mailbox.org,
 guilherme.gallo@collabora.com, vignesh.raman@collabora.com,
 linux-kernel@vger.kernel.org, quic_abhinavk@quicinc.com,
 david.heidelberg@collabora.com, quic_jesszhan@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Helen,

On Wed, 2023-09-27 at 19:28 -0300, Helen Koike wrote:
> > > +def get_unit_test_name_and_results(unit_test):
> > > +=C2=A0=C2=A0=C2=A0 if "Artifact results/failures.csv not found" in u=
nit_test:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return None, None
> > > +=C2=A0=C2=A0=C2=A0 unit_test_name, unit_test_result =3D
> > > unit_test.strip().split(",")
> > > +=C2=A0=C2=A0=C2=A0 return unit_test_name, unit_test_result
> >=20
> > Suggestion: it is not managing empty lines or comments. By now,
> > there
> > aren't, but they could be found.
>=20
> Indeed.

Just add a new if statement to discard if the strings start with # or
strip the line and check the length. Perhaps we can think of other
assertions to sanitise the string.

> > Suggestion: Sometimes tests fails with different status ("Fail" to
> > "Crash" for example) and the expectations should be updated with
> > the
> > newer status.
>=20
> The status is only present in the fails and not in the flakes list,
> so I=20
> update it with add_unit_test_or_update_result_to_fails_if_present()=20
> function below, make sense?

Absolutely, sorry that I didn't see this was a process included in the
last if statement. If it is present in the fails' file (that includes
the test name and its state) you do exactly what's necessary: add if
not present, update if it was already in the file.

>=20
Regards,


- --=20
Sergi Blanch Torn=C3=A9
Senior Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales, no. 5513718

-----BEGIN PGP SIGNATURE-----

iHUEARYIAB0WIQQwWRK68l+taJfhwqAto5bHyTm9RwUCZRUnAgAKCRAto5bHyTm9
R53NAP9T2OCiwbnEjv+H0CQg/eK1xGe7yS/3cqjaPFRvvZPp1wD/V1H9NuhpRR6M
8+QZgbsS/swSPdwYABtcz+75CKpuJwo=3D
=3DXRRO
-----END PGP SIGNATURE-----
