Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B9835569
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 04:45:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69BEC8919D;
	Wed,  5 Jun 2019 02:45:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C34258919D
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 02:45:49 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id y57so16384689qtk.4
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jun 2019 19:45:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=BQfBVOtXcs0qzMIh6nmcxcUOcBUU3ej7Z8jgcon5kpQ=;
 b=UVJx6qnS132tKAfU/76f9DLh1QY62TjdThucsXwNC947jILxu24KDbtLJINejb+8Ly
 3gK7lbi/WfS6h9qCj5/8IYfaWShcdQ/F5tFV9iVIJjHOsrD2e1ruGAkcZQ1Bg6AwgUNW
 oH4r4u4Wv5agHsO9eGft/PT93b8+bsEY4dvBH2G/jxZ7xF+m29TgbZlTqu/GHsPRJ3b+
 3pJJrYu6XQNOd7jtXMVdtTHWD0j4RzT8CsFFohUSgt102j5xoIE3Et8b7HT1YjoLmZdV
 nh04FSwCUVLD4RjBHfvLc2Zh4L7bXlr9V946/aoZQ78X1eBZMo3Lb9SmLSNDdAgrI54W
 zaUg==
X-Gm-Message-State: APjAAAURPJV9xwQPr4p6oKXKfW89hdF59/86cg+Qv6O9Ijcecw1I0I0y
 dEzLl1QVMKjw5E5rCltI1sU=
X-Google-Smtp-Source: APXvYqyUU6pz3RkTE8SZvZU5kZk+A62iNXn5Zu4YkGvXgB2qdg6ofbFKPeKy+4/S47uUiSpQ815bRQ==
X-Received: by 2002:aed:3804:: with SMTP id j4mr31335025qte.361.1559702748899; 
 Tue, 04 Jun 2019 19:45:48 -0700 (PDT)
Received: from smtp.gmail.com ([187.121.151.146])
 by smtp.gmail.com with ESMTPSA id k40sm9325569qta.50.2019.06.04.19.45.44
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 04 Jun 2019 19:45:48 -0700 (PDT)
Date: Tue, 4 Jun 2019 23:45:43 -0300
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
To: Simon Ser <simon.ser@intel.com>,
 Ville Syrjala <ville.syrjala@linux.intel.com>,
 Shayenne Moura <shayenneluzmoura@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>
Subject: [PATCH V2] drm/vkms: Avoid extra discount in the timestamp value
Message-ID: <20190605024543.pcsnkf74mmgfhtuh@smtp.gmail.com>
MIME-Version: 1.0
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent;
 bh=BQfBVOtXcs0qzMIh6nmcxcUOcBUU3ej7Z8jgcon5kpQ=;
 b=DGd6ZJMuCw4wWZb+/hxWOpe9FC4seEzDtRiNche1kXONtQmbx5I/TVyogo3MR8MUWg
 HX6XrIaLRKq5qnBeAO1kziZycNh11yLibk5y5Z6zxNAz8FpGMDO4W8zjHpTOY48uxwh0
 2yKqYIbwCADSDGxIwSiX7e67IIgsaFx29/f9EbgczyWWZ1017hDufsviKY6l9RCB28BB
 yg10iQ1Zs85d6jclpSeI8s7DyqFvT0MEh22tb5XTElf2lZM+Z4VU2FdRWd5Q/dP15QjI
 6AN1fOJ8cyAqtPqmjBSFFa2+GQ1DFLGRfKssCxSb3x/3Sz8OmAip2ggLGaejoPGMjZ3G
 HksA==
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 18oliveira.charles@gmail.com
Content-Type: multipart/mixed; boundary="===============0674896062=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0674896062==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fjpgzm34khffs6b6"
Content-Disposition: inline


--fjpgzm34khffs6b6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

After the commit def35e7c5926 ("drm/vkms: Bugfix extra vblank frame")
some of the crc tests started to fail in the vkms with the following
error:

 [drm:drm_crtc_add_crc_entry [drm]] *ERROR* Overflow of CRC buffer,
    userspace reads too slow.
 [drm] failed to queue vkms_crc_work_handle
 ...

The aforementioned commit fixed the extra vblank added by
`drm_crtc_arm_vblank_event()` which is invoked inside
`vkms_crtc_atomic_flush()` if the vblank event count was zero, otherwise
`drm_crtc_send_vblank_event()` is invoked. The fix was implemented in
`vkms_get_vblank_timestamp()` by subtracting one period from the current
timestamp, as the code snippet below illustrates:

 if (!in_vblank_irq)
  *vblank_time -=3D output->period_ns;

The above fix works well when `drm_crtc_arm_vblank_event()` is invoked.
However, it does not properly work when `drm_crtc_send_vblank_event()`
executes since it subtracts the correct timestamp, which it shouldn't.
In this case, the `drm_crtc_accurate_vblank_count()` function will
returns the wrong frame number, which generates the aforementioned
error. Such decrease in `get_vblank_timestamp()` produce a negative
number in the following calculation within `drm_update_vblank_count()`:

 u64 diff_ns =3D ktime_to_ns(ktime_sub(t_vblank, vblank->time));

After this operation, the DIV_ROUND_CLOSEST_ULL macro is invoked using
diff_ns with a negative number, which generates an undefined result;
therefore, the returned frame is a huge and incorrect number. Finally,
the code below is part of the `vkms_crc_work_handle()`, note that the
while loop depends on the returned value from
`drm_crtc_accurate_vblank_count()` which may cause the loop to take a
long time to finish in case of huge value.

 frame_end =3D drm_crtc_accurate_vblank_count(crtc);
 while (frame_start <=3D frame_end)
   drm_crtc_add_crc_entry(crtc, true, frame_start++, &crc32);

This commit fixes this issue by checking if the vblank timestamp
corresponding to the current software vblank counter is equal to the
current vblank; if they are equal, it means that
`drm_crtc_send_vblank_event()` was invoked and vkms does not need to
discount the extra vblank, otherwise, `drm_crtc_arm_vblank_event()` was
executed and vkms have to discount the extra vblank. This fix made the
CRC tests work again whereas keep all tests from kms_flip working as
well.

V2: Update commit message

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


--fjpgzm34khffs6b6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAlz3LNcACgkQWJzP/com
vP/X4hAApcr5/bEnDAvsOsV2xeueMBVUxkCOy5jyP804U41fgrRvvSmSXL9r4Aha
6gaKPXNYjxTX/q6NiVLJ0eKd/ghuyjdWEygnVKzslqkdlZPMGLsXW+eh9CVEPpdS
3ntASLzK+X8SEK0ghEqwIBjibvigKl7m9/Me/5dcF9omezMDYUgdCuip2Bl12S7u
snxH/0kfZZ4FbpvkzNg19rK7Jy3gQaJhJ2NVokdY3tNsqwRlRC2o25oISFXZCC+T
/GDKvUs2MlV24b8l+IOECZrAyXa3627IoKGhirNXbNdPipU5/lel5c5uy0u38zVO
2yH7veHOs45SNrFKayY0M8CsEorBtg4BuYZdLToYZz6+MwuRODj758nVb3zTqPPS
EpUg1kya5bV9WujDz9oVodf7AwWa+/7G98VSwDCa5ffc6NLODLSwiRzCa380GdS+
UZGAt6nEMXXwBkYPgLsQuZ/2tZ3ASRdgRbZN7zDCWmGi/ataX1/psdFpDAfTtsVU
2lJY665DmPvtT1QPNyfZKV+A76RYfdxXYk6ANd65cWFPyQ+15oYYejo8cfBt3gO0
FayQJzWXgMXkeOkUJJLaeNsQIth1wamo4AYKNrM3cf9bCKG8lQaObkvufjpWbnAF
XUCj3wDLKxkc0zOpA0nsXI9N5ZagdqHadTFnFlW9IKkBJHEuKzk=
=5usR
-----END PGP SIGNATURE-----

--fjpgzm34khffs6b6--

--===============0674896062==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0674896062==--
