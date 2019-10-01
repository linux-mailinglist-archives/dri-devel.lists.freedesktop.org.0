Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC6AC484F
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 09:19:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC4146E8D3;
	Wed,  2 Oct 2019 07:18:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6196989DEA;
 Tue,  1 Oct 2019 14:30:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8BFA9AE6F;
 Tue,  1 Oct 2019 14:30:03 +0000 (UTC)
Date: Tue, 1 Oct 2019 16:30:01 +0200
From: Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>
To: Kenny Ho <Kenny.Ho@amd.com>
Subject: Re: [PATCH RFC v4 07/16] drm, cgroup: Add total GEM buffer
 allocation limit
Message-ID: <20191001142957.GK6694@blackbody.suse.cz>
References: <20190829060533.32315-1-Kenny.Ho@amd.com>
 <20190829060533.32315-8-Kenny.Ho@amd.com>
MIME-Version: 1.0
In-Reply-To: <20190829060533.32315-8-Kenny.Ho@amd.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Wed, 02 Oct 2019 07:18:31 +0000
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
Cc: felix.kuehling@amd.com, jsparks@cray.com, amd-gfx@lists.freedesktop.org,
 lkaplan@cray.com, tj@kernel.org, y2kenny@gmail.com,
 dri-devel@lists.freedesktop.org, joseph.greathouse@amd.com,
 alexander.deucher@amd.com, cgroups@vger.kernel.org, christian.koenig@amd.com
Content-Type: multipart/mixed; boundary="===============0367818240=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0367818240==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Pz0BBB9QxoYXlT+x"
Content-Disposition: inline


--Pz0BBB9QxoYXlT+x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello.

On Thu, Aug 29, 2019 at 02:05:24AM -0400, Kenny Ho <Kenny.Ho@amd.com> wrote:
> drm.buffer.default
>         A read-only flat-keyed file which exists on the root cgroup.
>         Each entry is keyed by the drm device's major:minor.
>=20
>         Default limits on the total GEM buffer allocation in bytes.
What is the purpose of this attribute (and alikes for other resources)?
I can't see it being set differently but S64_MAX in
drmcg_device_early_init.

> +static ssize_t drmcg_limit_write(struct kernfs_open_file *of, char *buf,
> [...]
> +		switch (type) {
> +		case DRMCG_TYPE_BO_TOTAL:
> +			p_max =3D parent =3D=3D NULL ? S64_MAX :
> +				parent->dev_resources[minor]->
> +				bo_limits_total_allocated;
> +
> +			rc =3D drmcg_process_limit_s64_val(sattr, true,
> +				props->bo_limits_total_allocated_default,
> +				p_max,
> +				&val);
IIUC, this allows initiating the particular limit value based either on
parent or the default per-device value. This is alas rather an
antipattern. The most stringent limit on the path from a cgroup to the
root should be applied at the charging time. However, the child should
not inherit the verbatim value from the parent (may race with parent and
it won't be updated upon parent change).
You already do the appropriate hierarchical check in
drmcg_try_chb_bo_alloc, so the parent propagation could be simply
dropped if I'm not mistaken.


Also, I can't find how the read of
parent->dev_resources[minor]->bo_limits_total_allocated and its
concurrent update are synchronized (i.e. someone writing
buffer.total.max for parent and child in parallel). (It may just my
oversight.)

I'm posting this to the buffer knobs patch but similar applies to lgpu
resource controls as well.

HTH,
Michal

--Pz0BBB9QxoYXlT+x
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEEoQaUCWq8F2Id1tNia1+riC5qSgFAl2TYt0ACgkQia1+riC5
qSgMsg/+KPKKABKL0I3Bt7ronW4ukeFfC/GBQsoVxzJYUUyBtdoFPUYXnEOcJ78L
TyDn6DOND9RB4Fy7UQueB1HVPc/hjrWTmDBZhfdRsq6bFhfO3IVFPxp10uyYNBm4
WYocCUsQQ3IZEFLDZj+3RQGEEtZWSktulpSiwxfWLHpD995LJMpNo1UtESu+U4Dq
Riv1NlgC+mCdOAhlNOQDF53VIPwqSgqKcv4qVR39hwhHgr/K8v3EkFrWfu3nd7tp
J8lHhxTG4F71wMH1/TYGetwYoYB6IraeGJB0fZjWsLqSEtl3HcQFQ07XsVP7g0XA
Xn7StiFOmuXFgCI6Vb0zpTdAUKR3jP1JoElBnWxT3J74Eze11rN0PjtvjzYU/UaW
wffTxB8Cj8AA4rZ9uyA/5zgPqmqyV2a8o0XAApli+fHvox0FWLLTU8nk5sXXCzhq
Drg5cYsNRcxMcebdoHeXZcDpkRQlYJ1/5GVpcH6nFkdasTO/ZrFrXnEOZCQgfJJJ
7d4zyQ/GPRfNXP+rqTtPmZxjMSGk0ZBxi35CqOQYQBzWn5jVkaj1JcP6/YLLHUEB
g1aHg0RRlxefABKqSIEoOv/LSveXSuJ3WUsnV2JWJ/fUaORS0uzJUnlVs44UcwV7
5tb24JpOk2VKyvtwvoGeSRD1T9jR+ab+vnuzZGxONbJfznl2+KY=
=RuK8
-----END PGP SIGNATURE-----

--Pz0BBB9QxoYXlT+x--

--===============0367818240==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0367818240==--
