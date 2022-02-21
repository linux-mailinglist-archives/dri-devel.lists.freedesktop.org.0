Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF11E4BD875
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 10:18:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCB68112A71;
	Mon, 21 Feb 2022 09:18:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88A9D112A6F
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 09:18:41 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id r20so13669842ljj.1
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 01:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=VDxWS8qXeBqZHxv4UIjlTGo4icQfu5MFRYllis4kD3Y=;
 b=Psy0cp3TLiY2HhZTqXf3Znk2WpkfK7bDSzKiDHmLl/QFvTBQVmiaoVIEoGF9chu7XS
 2qTls9bK5qZId9Lp2rrE+GMPHqhAOc+uW/T5rK62ytT8O35hrNz1N52IkkmpRTYnjsYh
 xPE6c8JB18rpgX3WqwtwMSbQr5/be7pBj0YZ2Ic2pjYbF+pO/uK5zitPiwVI5i37hepC
 4F3Ccek4I10/H1rqAsbYaxgBOdv+DxLYmHEIQ1x0yWYM/PEyaqc0rdSAvpEW/b/P9gtD
 g3P/A4XIXpE+8Sa3u9heAyl6Lhop/z3zSnIVW4v1gYFsfwQZoy30QXBdaLOmyOidku4l
 xcyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=VDxWS8qXeBqZHxv4UIjlTGo4icQfu5MFRYllis4kD3Y=;
 b=zUuBS3kSRz6mOlhaLgienyFplY5DxQJNmSzCybeGaSAd+qejTsiCzvkiVlbyPXPY9W
 NpvDsH1+6Bj3badxg3cmPNomJuOZonrIWHMboizAFhqhyJ0wwMd5MGcPG78hiMe8PSx9
 JyOsxPltQj2YIEggarec+ornp05clPkDbSdCYZf+mNKXh2DEfPCEREsGvTH1UwBEQyMn
 59zHNSuiWhbrNzps7vRw4akaKsY89EWDPiQ46pRszbdQCG0ka5ZjUNbxJ0OwqkYWY4o/
 xcF0csHw3+TntpPCKliro0qh04ypM6MO9pWz10XCFTNwlhm8nHBypJ7Dqp1peqi0QnVc
 PlvQ==
X-Gm-Message-State: AOAM530EWu88N4Tdl8VjDE0ArB5/RHgRjdXlfSg/gMgbETem07LWLW87
 kkH7uZqxxE0DI+fePV2Dl44=
X-Google-Smtp-Source: ABdhPJzruRNSNs/mu0geBPhegXmtmCmAfCbNmcs4JCXjAh0xSOBbq200YlwZ4axqksPwtGKoCWihyQ==
X-Received: by 2002:a05:651c:10b:b0:246:280:c7 with SMTP id
 a11-20020a05651c010b00b00246028000c7mr13926572ljb.126.1645435119578; 
 Mon, 21 Feb 2022 01:18:39 -0800 (PST)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id n17sm588703lfu.193.2022.02.21.01.18.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 01:18:39 -0800 (PST)
Date: Mon, 21 Feb 2022 11:18:23 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Igor Torrente <igormtorrente@gmail.com>
Subject: Re: [PATCH v4 7/9] drm: vkms: Refactor the plane composer to accept
 new formats
Message-ID: <20220221111823.044ca6ca@eldfell>
In-Reply-To: <1b26f760-2213-b711-53fb-847560daf963@gmail.com>
References: <20220121213831.47229-1-igormtorrente@gmail.com>
 <20220121213831.47229-8-igormtorrente@gmail.com>
 <20220208104018.cxnxgzgjn3ecf53l@mail.igalia.com>
 <b40b3f1b-1b0d-0b81-a5cf-1496fb479920@gmail.com>
 <20220209214535.wqoe3otgelry2kef@mail.igalia.com>
 <1b26f760-2213-b711-53fb-847560daf963@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2BtyoQmGNl8EtNIWf/Ys16o";
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
Cc: hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, Melissa Wen <mwen@igalia.com>,
 tzimmermann@suse.de, ~lkcamp/patches@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/2BtyoQmGNl8EtNIWf/Ys16o
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Sun, 20 Feb 2022 22:02:12 -0300
Igor Torrente <igormtorrente@gmail.com> wrote:

> Hi Melissa,
>=20
> On 2/9/22 18:45, Melissa Wen wrote:
> > On 02/08, Igor Torrente wrote: =20
> >> Hi Melissa,
> >>
> >> On 2/8/22 07:40, Melissa Wen wrote: =20
> >>> On 01/21, Igor Torrente wrote: =20
> >>>> Currently the blend function only accepts XRGB_8888 and ARGB_8888
> >>>> as a color input.
> >>>>
> >>>> This patch refactors all the functions related to the plane composit=
ion
> >>>> to overcome this limitation.
> >>>>
> >>>> A new internal format(`struct pixel`) is introduced to deal with all
> >>>> possible inputs. It consists of 16 bits fields that represent each of
> >>>> the channels.
> >>>>
> >>>> The pixels blend is done using this internal format. And new handlers
> >>>> are being added to convert a specific format to/from this internal f=
ormat.
> >>>>
> >>>> So the blend operation depends on these handlers to convert to this =
common
> >>>> format. The blended result, if necessary, is converted to the writeb=
ack
> >>>> buffer format.
> >>>>
> >>>> This patch introduces three major differences to the blend function.
> >>>> 1 - All the planes are blended at once.
> >>>> 2 - The blend calculus is done as per line instead of per pixel.
> >>>> 3 - It is responsible to calculates the CRC and writing the writeback
> >>>>       buffer(if necessary).
> >>>>
> >>>> These changes allow us to allocate way less memory in the intermedia=
te
> >>>> buffer to compute these operations. Because now we don't need to
> >>>> have the entire intermediate image lines at once, just one line is
> >>>> enough.
> >>>>
> >>>> | Memory consumption (output dimensions) |
> >>>> |:--------------------------------------:|
> >>>> |       Current      |     This patch    |
> >>>> |:------------------:|:-----------------:|
> >>>> |   Width * Heigth   |     2 * Width     |
> >>>>
> >>>> Beyond memory, we also have a minor performance benefit from all
> >>>> these changes. Results running the IGT tests `*kms_cursor_crc*`:
> >>>> =20
> >>> First, thanks for this improvement.
> >>>
> >>> Some recent changes in kms_cursor_crc caused VKMS to fail in most test
> >>> cases (iirc, only size-change and alpha-opaque are passing currently)=
. =20
> >>
> >> I updated my igt and kernel(from drm_misc/drm-misc-next) to the latest
> >> commit[1][2] and I'm getting mixed results. Sometimes most of the test
> >> passes, sometimes almost nothing passes. =20
> > hmm.. is it happening when running kms_cursor_crc? Is the results
> > variation random or is it possible to follow a set of steps to reproduce
> > it? When failing, what is the reason displayed by the log? =20
>=20
> I investigated it a little bit and discovered that the KMS
> cursor(".*kms_cursor_crc*" ) are failing after the execution of
> writeback tests(".*kms_writeback.*").
>=20
> I don't know what is causing it, but they are failing while trying to=20
> commit the KMS changes.
>=20
> out.txt:
> IGT-Version: 1.26-NO-GIT (x86_64) (Linux: 5.17.0-rc2 x86_64)
> Stack trace:
>    #0 ../lib/igt_core.c:1754 __igt_fail_assert()
>    #1 ../lib/igt_kms.c:3795 do_display_commit()
>    #2 ../lib/igt_kms.c:3901 igt_display_commit2()
>    #3 ../tests/kms_cursor_crc.c:820 __igt_unique____real_main814()
>    #4 ../tests/kms_cursor_crc.c:814 main()
>    #5 ../csu/libc-start.c:308 __libc_start_main()
>    #6 [_start+0x2a]
> Subtest pipe-A-cursor-size-change: FAIL
>=20
> err.txt:
> (kms_cursor_crc:1936) igt_kms-CRITICAL: Test assertion failure function=20
> do_display_commit, file ../lib/igt_kms.c:3795:
> (kms_cursor_crc:1936) igt_kms-CRITICAL: Failed assertion: ret =3D=3D 0
> (kms_cursor_crc:1936) igt_kms-CRITICAL: Last errno: 22, Invalid argument
> (kms_cursor_crc:1936) igt_kms-CRITICAL: error: -22 !=3D 0
>=20
> >=20
> >  From my side, only the first two subtest of kms_cursor_crc is passing
> > before this patch. And after your changes here, all subtests are
> > successful again, except those related to 32x10 cursor size (that needs
> > futher investigation). I didn't check how the recent changes in
> > kms_cursor_crc affect VKMS performance on it, but I bet that clearing
> > the alpha channel is the reason to have the performance back. =20
>=20
> Yeah, I also don't understand why the 32x10 cursor tests are failing.
>=20

Hi,

are the tests putting the cursor partially outside of the CRTC area?
Or partially outside of primary plane area (which IIRC you used when you
should have used the CRTC area?)?

Does the writeback test forget to unlink the writeback connector? Or
does VKMS not handle unlinking the writeback connector?

If both are a problem, the latter would be just an unrelated bug that
exposes the first bug in VKMS, because whether writeback is used or not
probably should not affect where the cursor plane is allowed to be.


Thanks,
pq

--Sig_/2BtyoQmGNl8EtNIWf/Ys16o
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmITWN8ACgkQI1/ltBGq
qqfWKQ//aTTqFGHmIwm23C3wynXnbnvz1RVqROfQHULsnPMcEpdwHqYVj/VHWCLW
ZRT+trUaCCDLClyk7+608w5mZZVTbVb8bElDvCd2Bw1M1nKEmWmm83IxeTCE/eVM
Vw8IRQl+gfZXbfeY+zBhDR6kcmvqQJmU4R7s4BYutahML+xw/du/YKe6IdIxmUmW
rMuIgu12JJPrZZyBEmy3lFPI3ZK25UozQk0b9+6TyNzBdrpOcFddaept+FoK5KGQ
fRnK0opSB6tROC2EB6bqy+qSUjSmE0nEId/T2lgTmDjjanEh+/BgKyriA+XFr//n
NCk5SFage+xn+KArPDygj+HMTj6Hwv2+PhW7qxUMDI1OPfkhmOHBxBOW6jVI92ZY
501m2uBgODXXUD1K8JxdTCes2W06wiuijcpQuodOQ4cMwNIfh/Ul9W05/9PqamEr
sxhVx0QIppidEpqe31Fr0aPEKM8ngpcrZErWd+YGZ1HPfnERp0+iAUOwMtiK3zAE
sQa2O62udVcwvmy4cuOOQzN0daP6+7ZZKarCSdnUbXs+YbsxwmROusYBPtyhz6nG
n2r3QUJfKrw/6Dz63bfn5M54onS1FCQtW3DaJMtHWG4R/ZAwnmpG6bP0ftL5VYKm
RwTJt3dFIZJBgg6SBD/MYIeCG5lLCVxrY1yYWYxeWZJ9SIjvmY4=
=M3kG
-----END PGP SIGNATURE-----

--Sig_/2BtyoQmGNl8EtNIWf/Ys16o--
