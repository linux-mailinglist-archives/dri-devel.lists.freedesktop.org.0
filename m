Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A289B9392
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2019 16:59:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 997246FD21;
	Fri, 20 Sep 2019 14:58:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E390E6FD21;
 Fri, 20 Sep 2019 14:58:56 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id i1so7092756wro.4;
 Fri, 20 Sep 2019 07:58:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=YWSKJigIWyYHoT79ZbcIUltwc9MAequwzDfGlnQbW5U=;
 b=PKv6oxYJuA9uVPmSaYm0CJN08wikVp3kFchTx9JD/auYH+yqgYyJVdBJbuFYjGeq/f
 auXmclGu08ndQgqH+WNrU8Gg+EvDFBDRYROBRArEqWXYSlCTHay8t+iFdo+R5j8ncWSC
 JjfDy5YszNIVMfGIneMXrcrJZgFN+Y5LPicm3ULr5Lrn2EnEkeKuMNCnDCeBBjthIB5J
 Z15emrEt+zWyHTGKQ6zJYfWcmXnT7hVJHlRe4F/XMvLu2ATBqiMaJm1Bc2ISFOfh60Iy
 Xg+nYnKBGQyzUwyT9rfp0NpEUOE1fOdz2RJN3DXxcGUcUltiJN9OFuslvXNnFKoGKqej
 +Aig==
X-Gm-Message-State: APjAAAVWAZ8MC12Gnl07qwEPGUPVVnm54RYWNoepUTRmWgDUDzwU5uSS
 EiNPH8gGCG2sZ6HVoH8+bVQ=
X-Google-Smtp-Source: APXvYqzLyvmfe7qpco90UOMZEgel6sIS3gbWfhbSHxmPnAQ7e84rS2QeY7RN5brumlGiWzjv6fN73Q==
X-Received: by 2002:a5d:6451:: with SMTP id d17mr5255339wrw.260.1568991535483; 
 Fri, 20 Sep 2019 07:58:55 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id b22sm2576487wmj.36.2019.09.20.07.58.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Sep 2019 07:58:54 -0700 (PDT)
Date: Fri, 20 Sep 2019 16:58:53 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH] video/hdmi: Fix AVI bar unpack
Message-ID: <20190920145853.GA10973@ulmo>
References: <20190919132853.30954-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20190919132853.30954-1-ville.syrjala@linux.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=YWSKJigIWyYHoT79ZbcIUltwc9MAequwzDfGlnQbW5U=;
 b=uVhp6vt+uznQ0uQ4BVjgiwDmBVR4W6a/fPzdJTsheAFQRNKsE/4BCDBpdjJ7z+jL7E
 94lJkoNWV2BmHAa2UHw0kAk0UKWZzvKHwfeL84aHU6Ah3RkjEn4hXXzfTRv/w4HCb5v8
 PSnMPBQOtm5ANSeKWvGEZ31bMd/clPHtcCwGQOBuQ11+X75qYtqQDHamiM/3jnqHH5KE
 rf8u+swWQeTJGeJE30jJ+xoLpgfSABdBiz4v9wg3Y2JDMh7r+/Uzmz54ieNa3NZJiA6s
 nVQlfZ/xWXc9OozjIU6KJGx1nqslCpkCKPf0ulcRtMUfeq/RGXiBuRR4n1xYJdzoukf3
 1w7A==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Mauro Carvalho Chehab <mchehab@osg.samsung.com>,
 intel-gfx@lists.freedesktop.org, stable@vger.kernel.org,
 Hans Verkuil <hans.verkuil@cisco.com>, dri-devel@lists.freedesktop.org,
 Martin Bugge <marbugge@cisco.com>, Thierry Reding <treding@nvidia.com>,
 linux-media@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============1275260230=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1275260230==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8t9RHnE3ZwKMSgU+"
Content-Disposition: inline


--8t9RHnE3ZwKMSgU+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 19, 2019 at 04:28:53PM +0300, Ville Syrjala wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>=20
> The bar values are little endian, not big endian. The pack
> function did it right but the unpack got it wrong. Fix it.
>=20
> Cc: stable@vger.kernel.org
> Cc: linux-media@vger.kernel.org
> Cc: Martin Bugge <marbugge@cisco.com>
> Cc: Hans Verkuil <hans.verkuil@cisco.com>
> Cc: Thierry Reding <treding@nvidia.com>
> Cc: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
> Fixes: 2c676f378edb ("[media] hdmi: added unpack and logging functions fo=
r InfoFrames")
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/video/hdmi.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Thierry Reding <treding@nvidia.com>

--8t9RHnE3ZwKMSgU+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2E6SkACgkQ3SOs138+
s6HXNA/+KeSBAey7HOIxjXzG1ATuVyYPEjR0QhVdOB5wRLb6n4mq2VmoGOuHWOET
qJ5letIjaBdJvsBNrg/OTlPhUU+KrYSu22z7q6zmfPt6jF5qSWhSyd0X8TQsguGc
Ga+J2EQkTnU7rRVXAMkTc9ZQuF8EpM993lbJLafeLvoEdJDmkABt5V2/TkfuqehU
9FkyH+eLg/ScFkGzV/A0j/F+2nNEbLXsCn2ChxgDGI2NiUMBrz9VWRrrbp9P+RMl
ZHoXFBLEp8CYXe9CzLiTnHpObuE6HEh1Rls1KDB7ol0FDF+JoJEs+jTzV90X83jW
hGffs6RMV3ZndyL/lUEEhTTPqCnrpWH4Z2X0DtuH/HLGgkyPZ8MyRdNrlapi4Ffb
uUYR8yotEMIXpxIm5hHGIu+uBaFNx33BQFd0cB2IecANMHctudR/Tik+0a6oqzPV
B3OqVW4XQ2T4Fa1DlkcBowkynyWW9J4vIeZTxjudK6uQ9D0W2Fz4wZcYJPprdex6
kMDsspZ3vCzQH2iURcnK6joImUcOQOckveO1XaEJ8OCs0zZch18wTBIy4Aog72mY
aE3Nt45YatvxYZhpEq6L7G7i4dW5sMwtNxNraCAk4H6jO4HFmQCCG0D7kWe4KCno
zU2QjNprjt06iyWQR+sjxcuKG0DFdwefaNjqBycCKynOgh6N2Y4=
=6tSc
-----END PGP SIGNATURE-----

--8t9RHnE3ZwKMSgU+--

--===============1275260230==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1275260230==--
