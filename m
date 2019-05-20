Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AC12297F
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2019 02:12:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A7E489175;
	Mon, 20 May 2019 00:12:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4448989175
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 00:12:14 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id j53so14357955qta.9
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2019 17:12:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=00rc2d7E6nzGfdw+dxGhcOctOgwdvAnLnh4F/f6DG1Y=;
 b=OHMVnyb6mX5lM4eKShc/IuprOSD5Did2vWOct+uJM9m8XjLjooAqleMZmIZgLGImB6
 v9OKMw91KJ8vt7d49A/NeIx+tDlAETDIavQQs9y4C69ObwGdVoo2dywWvBctVlbo/CEa
 BmrvV4l/C1DXwO8f0gjEJCabPhoAUGsG8bBoQYb1a52oRwlUWC/u5ImwqX2CEDWZYmJH
 5FKZzPwFtFrW3HCu8qE5iA2GUtRvrSWMf9IOU6zEHk9vhiuHQlwP0PkTv+Sai9mKDphH
 dcxJ3C/O7XrkysnGhoa+QKpFo0W5xvsbGdi9Tw8x37iBlk/J+HbyTpV4+wUxxf/XPKO2
 NZTg==
X-Gm-Message-State: APjAAAUWIuDcNqG+L/5ylEWeZqy26QOf/IfXmafLe+3ChAh7Ozes0nqv
 fcvHmA+iQHu9BLjUaowC6LY=
X-Google-Smtp-Source: APXvYqzgLOvsYJSAD0VDyr7qts88R4GClEpaw1oY+Pb2nHzsR+1REe2dneYjVeBCrO/pm3H68LXqkg==
X-Received: by 2002:a0c:fd48:: with SMTP id j8mr12492987qvs.10.1558311133311; 
 Sun, 19 May 2019 17:12:13 -0700 (PDT)
Received: from smtp.gmail.com ([187.121.151.151])
 by smtp.gmail.com with ESMTPSA id a1sm8434424qth.69.2019.05.19.17.12.10
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 19 May 2019 17:12:12 -0700 (PDT)
Date: Sun, 19 May 2019 21:12:08 -0300
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 Shayenne Moura <shayenneluzmoura@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>
Subject: [PATCH] drm/vkms: Avoid extra discount in the timestamp value
Message-ID: <20190520001208.yh4jivl5lcc7iarh@smtp.gmail.com>
MIME-Version: 1.0
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent;
 bh=00rc2d7E6nzGfdw+dxGhcOctOgwdvAnLnh4F/f6DG1Y=;
 b=XbaawZMQlOtg2W/z5EP1ea9DzNoPEgXu+OcYPUvy/W2j5C3qAScMieXBbMBUPMWcd+
 tHBmko4ZVNRTch44/1yXyhCg46dUVcubbxt3+cVsLgOr7bmSWwANPqw2n89GnvEBBBP4
 v34lIe9TOsaXGJG9OjJtuPOuDS+ZSlro0ySrvXwrtPG12ZGPxyo4745FDIuncLDBJ+w9
 TbYhl2rGnGOe2uvT88YE/tii/biDQoUZ31TZTGEeCFrEd5dm0FN4CR6gy8iBk9B3TBC5
 IqGFUzJ8YNfpX6lZqafnZWyEXNbd+TZhdDB4p5SCG/NLrb8iaQD5dJFpB9hyj2xQuxFH
 yXBQ==
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1633472892=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1633472892==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uc56hyofhfino5qs"
Content-Disposition: inline


--uc56hyofhfino5qs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

After the commit def35e7c5926 ("drm/vkms: Bugfix extra vblank frame")
some of the crc tests (IGT) start to fail in the vkms with the following
error:

 [drm:drm_crtc_add_crc_entry [drm]] *ERROR* Overflow of CRC buffer,
    userspace reads too slow.
 [drm] failed to queue vkms_crc_work_handle
 ...

The commit def35e7c5926 ("drm/vkms: Bugfix extra vblank frame") added an
operation for decrement the timestamp value returned by
`get_vblank_timestamp()` which solved the problems related to kms_flip
tests. However, each call to `get_vblank_timestamp()` reduces the
timestamp even when it is not required. Such decrement generates a
negative number in the following calculation within
`drm_update_vblank_count()`:

 u64 diff_ns =3D ktime_to_ns(ktime_sub(t_vblank, vblank->time));

Next, the DIV_ROUND_CLOSEST_ULL macro is invoked using the diff_ns
value, which generates an undefined result. Therefore, the returned
frame is incorrect, which assign a huge number to the variable
frame_end. In this case, causing the loop (`vkms_crc_work_handle()`)
below to take a long time:

 frame_end =3D drm_crtc_accurate_vblank_count(crtc);
 while (frame_start <=3D frame_end)
   drm_crtc_add_crc_entry(crtc, true, frame_start++, &crc32);

This commit fixes this issue by adding a check that validates whether
the current vblank timestamp is still the same, thus avoiding excessive
timestamp decrement of the  timestamp value.

Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Signed-off-by: Shayenne Moura <shayenneluzmoura@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_crtc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_c=
rtc.c
index 7508815fac11..3ce60e66673e 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -74,9 +74,13 @@ bool vkms_get_vblank_timestamp(struct drm_device *dev, u=
nsigned int pipe,
 {
 	struct vkms_device *vkmsdev =3D drm_device_to_vkms_device(dev);
 	struct vkms_output *output =3D &vkmsdev->output;
+	struct drm_vblank_crtc *vblank =3D &dev->vblank[pipe];
=20
 	*vblank_time =3D output->vblank_hrtimer.node.expires;
=20
+	if (*vblank_time =3D=3D vblank->time)
+		return true;
+
 	if (!in_vblank_irq)
 		*vblank_time -=3D output->period_ns;
=20
--=20
2.21.0

--uc56hyofhfino5qs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAlzh8NgACgkQWJzP/com
vP9XZw/8DzjkHaVji5ckdIfVFUqa+07K3xDYWNMgtir03K2ftctLGRjXYxjPCJIi
VhiEi1FYYOyU5ot9kBtC+swChiySN0CC/fMdsSfPi54aKHN4KCjHe/MI3KWHhRTy
/vMoJ1fYYJ42Nx+jSxRDP0IJhOZ1xXmznaalIkg89iq29+T01KQ9ACyc3JwYP2TM
VLBhwNXsSfv/X6FMsl6mZM5AJthTKQDOEffufzgIiUlblvIGVQ/X4C+H0T98Pla6
PXfwyJrC0APwnbA7pi7s2wTVEEbzoLLCyUCER/iQ9NNslhgFubVsiNrgZ8SuYC8T
89a2wyJjSMfBa0O858whjX7V3Q3ZyYtFzl3GVSglfgUhEbp8qxQIsXOnUqGD6Mhu
oIwpTU5eRCrCkbOuzsHxxxdI1hLiobKvKjvR6ZU9ff8zIOhJrxwk4bwQyyIKOv8c
nBtCKS5rQ2BdVn3oGw3LmF83Un8fR0eM70XVUqbj/GsXA+hceDEkaJ2455vPZzh1
L7hKH5oJ7MsuQTN488+voVdjj4nkiJVRLYH+rsqKynSRYUcTay8bcGm3l4IZ5d3T
snsk2td5Rvs6esVgD9SGwOU4omevVcVDEZ7FAtryq/F/6wBEfMn3hd06qwzUMQpX
MibkbrpiWUKk5TvRyPYZxs72Ks7iLrfqK9sacxRayXqvylPhrsU=
=bRsS
-----END PGP SIGNATURE-----

--uc56hyofhfino5qs--

--===============1633472892==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1633472892==--
