Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECA857972
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 04:24:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10FF86E584;
	Thu, 27 Jun 2019 02:24:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A25886E581;
 Thu, 27 Jun 2019 02:24:54 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id c70so440265qkg.7;
 Wed, 26 Jun 2019 19:24:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=CwXiTfKdRBSuqmsWvDSj+CcpjrFT7bp9Wdj7/SDDQQM=;
 b=DYx3wGU86KUvmfisWsqfboOPF7Z3i4b8z026eImNMWIXrxbCOKeq6B263TW8bvrLR7
 wLHDqp5a+DsBmyTdZHrBaTca8drRObB+1/YS/mJC0yEZNkGf9CefRqi2o/lCjd87Uvar
 9b3ou183B0M/SHPqeW/Yp0j4BDoiL/5984GtlruT1onLg16JVYJ4pXmrJCS056AXag7t
 0P/VurndrOa2SitIlmQQK2jv6DFl1iRQzhGnmxcsXHiAF2RUFQE7RWnRyvraTh6NK5ZJ
 udYDZnXWZGDgdfK0H8beZSzmkwN0oMviPs7+dadzQJLnlNqbFFV6G4VaRQ9CqPNbVfEg
 b9FA==
X-Gm-Message-State: APjAAAWw5S0aNq/FGMBr6n0LUgwXaVTLJXce/VzJDk3IsumkTVnha9Aw
 TrfGWR5mO6ipNXQJvSjVTGQ=
X-Google-Smtp-Source: APXvYqwILC8Qzl3XDYRopJbpc3veonxZ8pt1ecsAMrdQ8LngY2Fyk6ZNJJGcWZTk1ps0EoHJAC0k6A==
X-Received: by 2002:a37:a86:: with SMTP id 128mr1164611qkk.169.1561602293573; 
 Wed, 26 Jun 2019 19:24:53 -0700 (PDT)
Received: from smtp.gmail.com ([187.121.151.146])
 by smtp.gmail.com with ESMTPSA id y10sm290769qkf.82.2019.06.26.19.24.48
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 26 Jun 2019 19:24:52 -0700 (PDT)
Date: Wed, 26 Jun 2019 23:24:46 -0300
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
To: Keith Packard <keithp@keithp.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>
Subject: [PATCH V5] drm/drm_vblank: Change EINVAL by the correct errno
Message-ID: <20190627022446.fkuomcgiuu3bj3kb@smtp.gmail.com>
MIME-Version: 1.0
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent;
 bh=CwXiTfKdRBSuqmsWvDSj+CcpjrFT7bp9Wdj7/SDDQQM=;
 b=gPQG3Tb3BAqDKCYjknMDPN8Has7WknTuhjx9Onc73ZUttwxlJS7RWqDjI5WjJDKqkc
 YY0RK5D22jP62x5APzLIRXcBvSFXLswLi4euPI89GtJchEdGEWOPBYk7T17cPaTGW46H
 sAo8DxxOoYjPy6+1z+q1WEbPEdrVUfARGuO8gIpfkQm/jY6bdXCtERiVrjIUzzLhT5wu
 JhbqCoKWvAqrcBijMt9eZDrw50UGcpoeAgHrrkL1BGyMLhqEmAhNHqRrMaZNvMT4lGBA
 iermO0Uahq8pbAds3Hg6SLY1nGxws43CAmQui1woxsrDG9KY5fUaR5PhV4HhUFW5WLuv
 uewg==
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
Cc: intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1477247177=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1477247177==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ygl3ejqndwnzekz3"
Content-Disposition: inline


--ygl3ejqndwnzekz3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

For historical reasons, the function drm_wait_vblank_ioctl always return
-EINVAL if something gets wrong. This scenario limits the flexibility
for the userspace to make detailed verification of any problem and take
some action. In particular, the validation of =E2=80=9Cif (!dev->irq_enable=
d)=E2=80=9D
in the drm_wait_vblank_ioctl is responsible for checking if the driver
support vblank or not. If the driver does not support VBlank, the
function drm_wait_vblank_ioctl returns EINVAL, which does not represent
the real issue; this patch changes this behavior by return EOPNOTSUPP.
Additionally, drm_crtc_get_sequence_ioctl and
drm_crtc_queue_sequence_ioctl, also returns EINVAL if vblank is not
supported; this patch also changes the return value to EOPNOTSUPP in
these functions. Lastly, these functions are invoked by libdrm, which is
used by many compositors; because of this, it is important to check if
this change breaks any compositor. In this sense, the following projects
were examined:

* Drm-hwcomposer
* Kwin
* Sway
* Wlroots
* Wayland-core
* Weston
* Xorg (67 different drivers)

For each repository the verification happened in three steps:

* Update the main branch
* Look for any occurrence of "drmCrtcQueueSequence",
  "drmCrtcGetSequence", and "drmWaitVBlank" with the command git grep -n
  "STRING".
* Look in the git history of the project with the command
git log -S<STRING>

None of the above projects validate the use of EINVAL when using
drmWaitVBlank(), which make safe, at least for these projects, to change
the return values. On the other hand, mesa and xserver project uses
drmCrtcQueueSequence() and drmCrtcGetSequence(); this change is harmless
for both projects.

Change since V4 (Daniel):
 - Also return EOPNOTSUPP in drm_crtc_[get|queue]_sequence_ioctl

Change since V3:
 - Return EINVAL for _DRM_VBLANK_SIGNAL (Daniel)

Change since V2:
 Daniel Vetter and Chris Wilson
 - Replace ENOTTY by EOPNOTSUPP
 - Return EINVAL if the parameters are wrong

Cc: Keith Packard <keithp@keithp.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
---
 drivers/gpu/drm/drm_vblank.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 603ab105125d..bd4ac834d3ef 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -1582,7 +1582,7 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, voi=
d *data,
 	unsigned int flags, pipe, high_pipe;
=20
 	if (!dev->irq_enabled)
-		return -EINVAL;
+		return -EOPNOTSUPP;
=20
 	if (vblwait->request.type & _DRM_VBLANK_SIGNAL)
 		return -EINVAL;
@@ -1823,7 +1823,7 @@ int drm_crtc_get_sequence_ioctl(struct drm_device *de=
v, void *data,
 		return -EOPNOTSUPP;
=20
 	if (!dev->irq_enabled)
-		return -EINVAL;
+		return -EOPNOTSUPP;
=20
 	crtc =3D drm_crtc_find(dev, file_priv, get_seq->crtc_id);
 	if (!crtc)
@@ -1881,7 +1881,7 @@ int drm_crtc_queue_sequence_ioctl(struct drm_device *=
dev, void *data,
 		return -EOPNOTSUPP;
=20
 	if (!dev->irq_enabled)
-		return -EINVAL;
+		return -EOPNOTSUPP;
=20
 	crtc =3D drm_crtc_find(dev, file_priv, queue_seq->crtc_id);
 	if (!crtc)
--=20
2.21.0

--ygl3ejqndwnzekz3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl0UKO0ACgkQWJzP/com
vP9DYBAAl3K8kqqVa/P2GDZvxDrE3XCKPipZhDER9QiBIHjjIeEFvMavxBEVvm+T
4fmVKfta/9xYLDcoBvzk8ZxJhpsB8xSrbEZbRcBHKQ+VtF2JU6ArKbqU5TnNBHyZ
HY4eL0Ju6v9E0A8HmutOfIPZPgJT4DFihHhT2hqqjNldkB2CvfOnny6msf7FytGI
piD1wPcYwYNN03ZRcXEW5ocyWByA0mY1aTGCVS1ogYkdDtgz/t7+r9I+Yx6oCWOL
uwhgYCMskG2/PAHm/4xx+qPjwnrN/2TCAW07udDI3Mz0BpxTXlKH+iXC6K5Frt7g
IK/kN6PHk7JCzsz+1uQMOcH+hJJHfgrLSEyUZtpE02vCe1KYHiE7FpY2D5kHj4s1
4l5fButamxNI6mHkg1uBigkfF3R06OSuBJE+q3np0EDf7TE4LsLu91KENCdEa1SF
r3FzrFyW/IZRNWFgNs2ZxbYysUHwogDFkWjvRIxCKnUGGe5Gdg3g2pOsPfJ+yGal
8Bk0OsTgvVn0J9wwS+R8ldOu/Z6Qdd4wwaQpAESYQnogjAA3U5Hy0dMHV46WlycY
6+rWBgr6AdiHKuRgXa2Ga3XphXBZCGD/2AtQmm3M8Jl51GdgPErONbMalazsl5Pb
cTJ7rX4j+lYzlvL+saFge2VhXsi8IV6JICcrQ3eDzrjJnBzPdVY=
=t8eI
-----END PGP SIGNATURE-----

--ygl3ejqndwnzekz3--

--===============1477247177==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1477247177==--
