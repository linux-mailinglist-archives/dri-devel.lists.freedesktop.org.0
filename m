Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 044B1121DC
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2019 20:27:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0440B897CD;
	Thu,  2 May 2019 18:27:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from anholt.net (anholt.net [50.246.234.109])
 by gabe.freedesktop.org (Postfix) with ESMTP id 762AF897CD
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2019 18:27:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by anholt.net (Postfix) with ESMTP id 2536F10A3444;
 Thu,  2 May 2019 11:27:32 -0700 (PDT)
X-Virus-Scanned: Debian amavisd-new at anholt.net
Received: from anholt.net ([127.0.0.1])
 by localhost (kingsolver.anholt.net [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id iNnVifLik6UJ; Thu,  2 May 2019 11:27:30 -0700 (PDT)
Received: from eliezer.anholt.net (localhost [127.0.0.1])
 by anholt.net (Postfix) with ESMTP id 735FC10A343C;
 Thu,  2 May 2019 11:27:30 -0700 (PDT)
Received: by eliezer.anholt.net (Postfix, from userid 1000)
 id BE0A12FE3AA9; Thu,  2 May 2019 11:27:29 -0700 (PDT)
From: Eric Anholt <eric@anholt.net>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 4/4] drm/vc4: Allocate binner bo when starting to use
 the V3D
In-Reply-To: <5d8dadb34c9f845e21349253ff21c036c417f37a.camel@bootlin.com>
References: <20190425122917.26536-1-paul.kocialkowski@bootlin.com>
 <20190425122917.26536-5-paul.kocialkowski@bootlin.com>
 <87tvemj80z.fsf@anholt.net>
 <5d8dadb34c9f845e21349253ff21c036c417f37a.camel@bootlin.com>
User-Agent: Notmuch/0.22.2+1~gb0bcfaa (http://notmuchmail.org) Emacs/26.1
 (x86_64-pc-linux-gnu)
Date: Thu, 02 May 2019 11:27:29 -0700
Message-ID: <87k1f8ww32.fsf@anholt.net>
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, Maxime Ripard <maxime.ripard@bootlin.com>,
 Eben Upton <eben@raspberrypi.org>
Content-Type: multipart/mixed; boundary="===============2135530335=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============2135530335==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Paul Kocialkowski <paul.kocialkowski@bootlin.com> writes:

> Hi,
>
> On Thu, 2019-04-25 at 10:42 -0700, Eric Anholt wrote:
>> Paul Kocialkowski <paul.kocialkowski@bootlin.com> writes:
>>=20
>> > The binner BO is not required until the V3D is in use, so avoid
>> > allocating it at probe and do it on the first non-dumb BO allocation.
>> >=20
>> > Keep track of which clients are using the V3D and liberate the buffer
>> > when there is none left, using a kref. Protect the logic with a
>> > mutex to avoid race conditions.
>> >=20
>> > The binner BO is created at the time of the first render ioctl and is
>> > destroyed when there is no client and no exec job using it left.
>> >=20
>> > The Out-Of-Memory (OOM) interrupt also gets some tweaking, to avoid
>> > enabling it before having allocated a binner bo.
>> >=20
>> > We also want to keep the BO alive during runtime suspend/resume to avo=
id
>> > failing to allocate it at resume. This happens when the CMA pool is
>> > full at that point and results in a hard crash.
>> >=20
>> > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
>> > ---
>> >  drivers/gpu/drm/vc4/vc4_bo.c  | 33 +++++++++++++++++++-
>> >  drivers/gpu/drm/vc4/vc4_drv.c |  6 ++++
>> >  drivers/gpu/drm/vc4/vc4_drv.h | 14 +++++++++
>> >  drivers/gpu/drm/vc4/vc4_gem.c | 13 ++++++++
>> >  drivers/gpu/drm/vc4/vc4_irq.c | 21 +++++++++----
>> >  drivers/gpu/drm/vc4/vc4_v3d.c | 58 +++++++++++++++++++++++++++--------
>> >  6 files changed, 125 insertions(+), 20 deletions(-)
>> >=20
>> > diff --git a/drivers/gpu/drm/vc4/vc4_bo.c b/drivers/gpu/drm/vc4/vc4_bo=
.c
>> > index 88ebd681d7eb..2b3ec5926fe2 100644
>> > --- a/drivers/gpu/drm/vc4/vc4_bo.c
>> > +++ b/drivers/gpu/drm/vc4/vc4_bo.c
>> > @@ -799,13 +799,38 @@ vc4_prime_import_sg_table(struct drm_device *dev,
>> >  	return obj;
>> >  }
>> >=20=20
>> > +static int vc4_grab_bin_bo(struct vc4_dev *vc4, struct vc4_file *vc4f=
ile)
>> > +{
>> > +	int ret;
>> > +
>> > +	if (!vc4->v3d)
>> > +		return -ENODEV;
>> > +
>> > +	if (vc4file->bin_bo_used)
>> > +		return 0;
>> > +
>> > +	ret =3D vc4_v3d_bin_bo_get(vc4);
>> > +	if (ret)
>> > +		return ret;
>> > +
>> > +	vc4file->bin_bo_used =3D true;
>>=20
>> I think I found one last race.  Multiple threads could be in an ioctl
>> trying to grab the bin BO at the same time (while this is only during
>> app startup, since the fd only needs to get the ref once, it's
>> particularly plausible given that allocating the bin BO is slow).  I
>> think if you replace this line with:
>>=20
>> 	mutex_lock(&vc4->bin_bo_lock);
>>         if (vc4file->bin_bo_used) {
>>         	mutex_unlock(&vc4->bin_bo_lock);
>>                 vc4_v3d_bin_bo_put(vc4);
>>         } else {
>>         	vc4file->bin_bo_used =3D true;
>>         	mutex_unlock(&vc4->bin_bo_lock);
>>         }
>
> Huh, very good catch once again, thanks! It took me some time to grasp
> this one, but as far as I understand, the risk is that we could ref our
> bin bo twice (although it would only be allocated once) since
> bin_bo_used is not protected.
>
> I'd like to suggest another solution, which would avoid re-locking and
> doing an extra put if we got an extra ref: adding a "bool *used"
> argument to vc4_v3d_bin_bo_get and, which only gets dereferenced with
> the bin_bo lock held. Then we can skip obtaining a new reference if
> (used && *used) in vc4_v3d_bin_bo_get.
>
> So we could pass a pointer to vc4file->bin_bo_used for vc4_grab_bin_bo
> and exec->bin_bo_used for the exec case (where there is no such issue
> since we'll only ever try to _get the bin bo once there anyway).
>
> What do you think?

I like it!

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlzLNpEACgkQtdYpNtH8
nuhALRAApZt7IqOa5t+ZSGZt1v8iX5qpd40P+ssx8Iq7L52Rd3OYItwCk38Mcxla
UutDWr0LMMNDr9AkXvFOw4gR3xR2Tjzoi5mggR25hZCVB92xECXpLUc+HkH64mxk
VbROrGdV5v4qlnEu1s0AwyUHsDdb+lr5jMS3OqWvYTHYCMX4Bft2HoXENypQD+MQ
ZKdJXDnDLlR2uPqPfpIQJbsaHOzRufq4JdgokxEaHaOF3sAUcQbekGPY5ZgZF6uZ
IZ0iI7mHMUt245ewIjpZrvWZjB+raqDJdzQQtorxwfc2EGJHhKQILQTJ2zC47AqU
Mb7r6jeU6zMh4tupXopo+OpURZJA28fUqkE9+yyqjrPDeh2trJgQbfEEMuK3oREc
NXmSwXWuW6zCk0xgr3QrbfCjHbMRSeJcKdSg0i/6+MkGoinWzBjE1KDRFtjgYQVM
ykXIDATYVzV0lTBYtSk3/Cgv3Gk0sGJ5J149xVaUqnAuCfbrtVN5BV5TipE3N6GX
9U5MybuD8MkywvkRrnpCsupUGY8tB1QJfZGo+2nuCiFfcCZvTq17bDwrMa1CW/Hc
yJZ3gnq91xOsCckqKD683cT58YohdIKPu7QBLSMJi3SAq8k1eHNBmLCry5etPZY+
ux7Kd48np0r/N0ja6oz+mZlLcxoj+gCP3hxnpBQMSHUEBcEfmGw=
=qPta
-----END PGP SIGNATURE-----
--=-=-=--

--===============2135530335==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2135530335==--
