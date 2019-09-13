Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0B8B26B8
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 22:36:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC5EA6F457;
	Fri, 13 Sep 2019 20:36:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from anholt.net (anholt.net [50.246.234.109])
 by gabe.freedesktop.org (Postfix) with ESMTP id 409966F457
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2019 20:36:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by anholt.net (Postfix) with ESMTP id BBFF210A37BF;
 Fri, 13 Sep 2019 13:36:04 -0700 (PDT)
X-Virus-Scanned: Debian amavisd-new at anholt.net
Received: from anholt.net ([127.0.0.1])
 by localhost (kingsolver.anholt.net [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id ucY20fP-EB5U; Fri, 13 Sep 2019 13:36:02 -0700 (PDT)
Received: from eliezer.anholt.net (localhost [127.0.0.1])
 by anholt.net (Postfix) with ESMTP id CF3D610A3621;
 Fri, 13 Sep 2019 13:36:01 -0700 (PDT)
Received: by eliezer.anholt.net (Postfix, from userid 1000)
 id B4E5D2FE2E27; Fri, 13 Sep 2019 13:36:01 -0700 (PDT)
From: Eric Anholt <eric@anholt.net>
To: Iago Toral <itoral@igalia.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/v3d: clean caches at the end of render jobs on
 request from user space
In-Reply-To: <ddb5ebb30170fb2871ff52cc55128bd38b1c99e2.camel@igalia.com>
References: <20190912083516.13797-1-itoral@igalia.com>
 <87d0g5l94v.fsf@anholt.net>
 <ddb5ebb30170fb2871ff52cc55128bd38b1c99e2.camel@igalia.com>
User-Agent: Notmuch/0.22.2+1~gb0bcfaa (http://notmuchmail.org) Emacs/26.1
 (x86_64-pc-linux-gnu)
Date: Fri, 13 Sep 2019 13:35:44 -0700
Message-ID: <87ftl0szmn.fsf@anholt.net>
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
Content-Type: multipart/mixed; boundary="===============1082447523=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1082447523==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Iago Toral <itoral@igalia.com> writes:

> On Thu, 2019-09-12 at 10:25 -0700, Eric Anholt wrote:
>> Iago Toral Quiroga <itoral@igalia.com> writes:
>>=20
>> > Extends the user space ioctl for CL submissions so it can include a
>> > request
>> > to flush the cache once the CL execution has completed. Fixes
>> > memory
>> > write violation messages reported by the kernel in workloads
>> > involving
>> > shader memory writes (SSBOs, shader images, scratch, etc) which
>> > sometimes
>> > also lead to GPU resets during Piglit and CTS workloads.
>>=20
>> Some context for any other reviewers: This patch is the interface
>> change
>> necessary to expose GLES 3.1 on V3D.  It turns out the HW packets for
>> flushing the caches were broken in multiple ways.
>>=20
>> > Signed-off-by: Iago Toral Quiroga <itoral@igalia.com>
>> > ---
>> >  drivers/gpu/drm/v3d/v3d_gem.c | 51 +++++++++++++++++++++++++++++
>> > ------
>> >  include/uapi/drm/v3d_drm.h    |  7 ++---
>> >  2 files changed, 47 insertions(+), 11 deletions(-)
>> >=20
>> > diff --git a/drivers/gpu/drm/v3d/v3d_gem.c
>> > b/drivers/gpu/drm/v3d/v3d_gem.c
>> > index 5d80507b539b..530fe9d9d5bd 100644
>> > --- a/drivers/gpu/drm/v3d/v3d_gem.c
>> > +++ b/drivers/gpu/drm/v3d/v3d_gem.c
>> > @@ -530,13 +530,16 @@ v3d_submit_cl_ioctl(struct drm_device *dev,
>> > void *data,
>> >  	struct drm_v3d_submit_cl *args =3D data;
>> >  	struct v3d_bin_job *bin =3D NULL;
>> >  	struct v3d_render_job *render;
>> > +	struct v3d_job *clean_job =3D NULL;
>> > +	struct v3d_job *last_job;
>> >  	struct ww_acquire_ctx acquire_ctx;
>> >  	int ret =3D 0;
>> >=20=20
>> >  	trace_v3d_submit_cl_ioctl(&v3d->drm, args->rcl_start, args-
>> > >rcl_end);
>> >=20=20
>> > -	if (args->pad !=3D 0) {
>> > -		DRM_INFO("pad must be zero: %d\n", args->pad);
>> > +	if (args->flags !=3D 0 &&
>> > +	    args->flags !=3D DRM_V3D_SUBMIT_CL_FLUSH_CACHE_FLAG) {
>> > +		DRM_INFO("invalid flags: %d\n", args->flags);
>> >  		return -EINVAL;
>> >  	}
>> >=20=20
>> > @@ -575,12 +578,28 @@ v3d_submit_cl_ioctl(struct drm_device *dev,
>> > void *data,
>> >  		bin->render =3D render;
>> >  	}
>> >=20=20
>> > -	ret =3D v3d_lookup_bos(dev, file_priv, &render->base,
>> > +	if (args->flags & DRM_V3D_SUBMIT_CL_FLUSH_CACHE_FLAG) {
>> > +		clean_job =3D kcalloc(1, sizeof(*clean_job), GFP_KERNEL);
>> > +		if (!clean_job) {
>> > +			ret =3D -ENOMEM;
>> > +			goto fail;
>> > +		}
>> > +
>> > +		ret =3D v3d_job_init(v3d, file_priv, clean_job,
>> > v3d_job_free, 0);
>> > +		if (ret)
>> > +			goto fail;
>>=20
>> Only issue I see: If v3d_job_init() fails, we need to not
>> v3d_job_put()
>> it.  I'm fine with either kfree() it and NULL the ptr before jumping
>> to
>> fail, or open code the bin/render puts.
>
> It seems we also call v3d_job_put() for the bin job when v3d_job_init()
> fails, which also returns immediately in that case instead of jumping
> to fail to v3d_job_put the render job, so I guess we need the same
> treatment there. Shall I fix that in this patch too or would you rather
> see a different patch sent separately for that?

I think you might be looking at the put of the (already-inited) render
job when initing bin job fails?

Looks like we do leak bin in that case, though.  Happy to see that as a
fixup patch.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAl17/aAACgkQtdYpNtH8
nugxTxAAsVGZRpBgSPRz+egUMEwm5F4LUap5O5KboIfLJZ1KffcE3LC4EmxXkWlW
+BBIdcf5CqTy82K6S2BY+PIiirTm5jWdiRWt9LbcAS7IUWiuAl88n4JMCqRS5Bou
dDbDUsARpaSNjXZPGrgjVmk4OSln7q2TJhDrtXkvD4iD6xCdoOEHmiLrWgCo1fBM
a+rQ1tAAwP91KvcKrx81CoBHIfDb2NWW44GqCEW8sGoQvEue0DOlYIBv12f4xkbx
Fps70eulZMLlOV7uBEvOlyWd+bYpdFPw6E/y/e2QM4lHwAVmSpcdMxN0n/S2AC7G
2WkP4O9L2vfBOVKL9r3IrEf/FoeCqz7K543TOOkwxOGAA1ffdTylE2F3MKVi42+t
J86dvWvbEPEPfxzwLh4Skr3OlfKndtFt+Bo/4kRIiPJDQ207dLvy0++pxSZ2Uj8L
PFAlDrQ1UMOfymyBdBiBVA7H3zqsCSxb9np/v3okAjB5GAQblqpUNwBbsASMEQWm
aG9i2/U4e/C3QnZS9MVW/rob8fLO83SIYzY28N3Pia/yq3ZOx9cD0m1qgARIkje5
B7z7vwNMSC4/Vt7zb5ZT6WnDAL6BSWYK5Xk4EZnmG6QxPHnp3758g2IAVpblau5+
HR6FJgxzR98bpe4nChtZNGD5eL9XSBuex6wGufGsApHkRK544Hc=
=b1ce
-----END PGP SIGNATURE-----
--=-=-=--

--===============1082447523==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1082447523==--
