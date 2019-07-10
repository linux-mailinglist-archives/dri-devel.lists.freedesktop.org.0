Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1B763F0B
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 03:55:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B49288972B;
	Wed, 10 Jul 2019 01:55:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFF4D8972B
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 01:55:19 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id h21so718754qtn.13
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jul 2019 18:55:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=+A+XURfQyB8AGFyMf1LEzeRDTsqVu/9+CULnouL4R1Y=;
 b=sJSw8r1UzST5EWqWQN2vKuQCX4o4r7bFqw6ZE556Y1G7bpUPtO3/wjHO3HuLClE1Lt
 Xczj4+1hdgFIyQH+dfCiXv4/ihsLgIQHkWDlRVBjvfGEes+D1gFl4wnISaIzJiCPhyOu
 eAKWWuPyk2TD/hPlwH/aIl+cnJOszQ5xkIobJcgWTow+i2aqgO5uDmBxMDbPZcRXhcGZ
 XQAQFg/wir/CgXAtIqT8PDrEKfl9TEYwPYV+kpUSWODGXTEE3jTH27jN0BX6khJG2xq4
 xGceH+YQ4z9IJVsxQFdBIuYZfG9G/HQrXWekJqAIn0txm/7hgL2jxky/lkY7Vc3UWpwB
 B8LQ==
X-Gm-Message-State: APjAAAUhTxqi+S8dtIqxUJMFYGDEVP1O5KAbz8Sn33pN/qyo564TjfYS
 2zoEH9ytj7EyPVXMkUWmnF4=
X-Google-Smtp-Source: APXvYqxBcjbo+yP5AUv1Ap9d8SOzy//okd1bX0SnEzMbzUs56O39l3Czd6XGj3iXhVjga9zgt4d5ng==
X-Received: by 2002:ac8:36b9:: with SMTP id a54mr21981970qtc.300.1562723719095; 
 Tue, 09 Jul 2019 18:55:19 -0700 (PDT)
Received: from smtp.gmail.com ([187.121.151.22])
 by smtp.gmail.com with ESMTPSA id z4sm406271qtd.60.2019.07.09.18.55.15
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 09 Jul 2019 18:55:18 -0700 (PDT)
Date: Tue, 9 Jul 2019 22:55:14 -0300
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 David Airlie <airlied@linux.ie>, Simon Ser <contact@emersion.fr>,
 Oleg Vasilev <oleg.vasilev@intel.com>
Subject: [PATCH V3] drm/vkms: Add support for vkms work without vblank
Message-ID: <20190710015514.42anrmx3r2ijaomz@smtp.gmail.com>
MIME-Version: 1.0
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent;
 bh=+A+XURfQyB8AGFyMf1LEzeRDTsqVu/9+CULnouL4R1Y=;
 b=Kf1ZG5989CAPh773hWh61mlxI7hJpjFULTKfO6o9mI051brplF5Ag+TJCLa+tu7rbs
 CH1z34q9ANrkA1eE2ArJFFmD9DhTM0xjtw5gdChjav4mjfu1paPqYxxBLwHGr80o+qR2
 L/FRXpmikkLBHBDzdTgvTE7b4uTcYlVAabk1PTf6S7Rgh/T2dIssdUtG4zCNfEY+OqoV
 0tjBJf5xTrh5dJf5TALbvY+gUPuqqECUETbmpgwDnJO2WD2/IKQJJb+4dIxnSWe3uKQ4
 RkLk9GVU5cEL/SJKy1Xb7h7oqBUaaWFUtJsopzqwVTv0Fz0ojJNznnimE26PnHjPIQwd
 sy7g==
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
Content-Type: multipart/mixed; boundary="===============0348171235=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0348171235==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6esr2cieaotn52rj"
Content-Disposition: inline


--6esr2cieaotn52rj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Currently, vkms only work with enabled VBlank. This patch adds another
operation model that allows vkms to work without VBlank support. In this
scenario, vblank signaling is faked by calling drm_send_vblank_event()
in vkms_crtc_atomic_flush(); this approach works due to the
drm_vblank_get() =3D=3D 0 checking.

Changes since V2:
 - Rebase

Changes since V1:
  Daniel Vetter:
  - Change module parameter name from disablevblank to virtual_hw
  - Improve parameter description
  - Improve commit message

Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_crtc.c | 10 ++++++++++
 drivers/gpu/drm/vkms/vkms_drv.c  | 13 +++++++++++--
 drivers/gpu/drm/vkms/vkms_drv.h  |  2 ++
 3 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_c=
rtc.c
index 49a8ec2cb1c1..a0c75b8c4335 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -207,12 +207,22 @@ static int vkms_crtc_atomic_check(struct drm_crtc *cr=
tc,
 static void vkms_crtc_atomic_enable(struct drm_crtc *crtc,
 				    struct drm_crtc_state *old_state)
 {
+	struct vkms_output *vkms_out =3D drm_crtc_to_vkms_output(crtc);
+
+	if (vkms_out->disable_vblank)
+		return;
+
 	drm_crtc_vblank_on(crtc);
 }
=20
 static void vkms_crtc_atomic_disable(struct drm_crtc *crtc,
 				     struct drm_crtc_state *old_state)
 {
+	struct vkms_output *vkms_out =3D drm_crtc_to_vkms_output(crtc);
+
+	if (vkms_out->disable_vblank)
+		return;
+
 	drm_crtc_vblank_off(crtc);
 }
=20
diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_dr=
v.c
index 152d7de24a76..542a002ef9d5 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -34,6 +34,11 @@ bool enable_writeback;
 module_param_named(enable_writeback, enable_writeback, bool, 0444);
 MODULE_PARM_DESC(enable_writeback, "Enable/Disable writeback connector");
=20
+bool virtual_hw;
+module_param_named(virtual_hw, virtual_hw, bool, 0444);
+MODULE_PARM_DESC(virtual_hw,
+		 "Enable virtual hardware mode (disables vblanks and immediately complet=
es flips)");
+
 static const struct file_operations vkms_driver_fops =3D {
 	.owner		=3D THIS_MODULE,
 	.open		=3D drm_open,
@@ -154,9 +159,13 @@ static int __init vkms_init(void)
 	if (ret)
 		goto out_unregister;
=20
-	vkms_device->drm.irq_enabled =3D true;
+	vkms_device->output.disable_vblank =3D virtual_hw;
+	vkms_device->drm.irq_enabled =3D !virtual_hw;
+
+	if (virtual_hw)
+		DRM_INFO("Virtual hardware mode enabled");
=20
-	ret =3D drm_vblank_init(&vkms_device->drm, 1);
+	ret =3D (virtual_hw) ? 0 : drm_vblank_init(&vkms_device->drm, 1);
 	if (ret) {
 		DRM_ERROR("Failed to vblank\n");
 		goto out_fini;
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_dr=
v.h
index 9ff2cd4ebf81..256e5e65c947 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -21,6 +21,7 @@
=20
 extern bool enable_cursor;
 extern bool enable_writeback;
+extern bool virtual_hw;
=20
 struct vkms_composer {
 	struct drm_framebuffer fb;
@@ -69,6 +70,7 @@ struct vkms_output {
 	struct drm_connector connector;
 	struct drm_writeback_connector wb_connector;
 	struct hrtimer vblank_hrtimer;
+	bool disable_vblank;
 	ktime_t period_ns;
 	struct drm_pending_vblank_event *event;
 	/* ordered wq for composer_work */
--=20
2.21.0

--6esr2cieaotn52rj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl0lRYEACgkQWJzP/com
vP9MDxAAwhNkK7mcj0n8LEr9fUZV6JWhcpikrLWRFWdyhTSZlY3woV9UvgSWWDdc
SvIUmpA9PxRK3FEg1OZbQE2M+rLHbNh63MSPyZY9kRwgYhEYND6G+PpbRp9epWB5
80eUrJ10uF8+PR42yW7JSPZKTNdcH9RPHZOB3V5IU4M+gYZqcTzYRN1Bd7lGqb2M
z9T5vdK4GM24DGphcY7HCifIdcoIgT20WJnwCVHHPUR6nk55ysbLxLte4lB6IPRs
9YfCtPYOrsAOdmQwRZMUJbbA11OEb3cDkU3I67inFDf+PqpLeV47JUPpSqY1s2uP
BpGJLZlVON403+Xh9xV2kxx1SwRqUCbL/FAvpCUUJXRzQk2/a1FWg78sHRIsHCh/
uN7EnHvolADG5s1TY2P8DwCuYPv/HMyMUurWlwP5QW6owXiP7Fk4H1UjUonSboAz
jHb0olSV5xN66S7OyEFZymmJTf1Q7G0HppCHAZb1WTQYIeoPF2+D2KrwSpx3u4cz
kQR7Sg39HW+7L4aOc7/dg2dk8mz8v0BXfW9ayorxkYxDFVCTUznJwgO3B8mFCQC2
85HVluyT8gaGh+VpZzLXIz/AfNqbqPti7Pf/CzjImmCtpL+dN9Zty7J/wbC4zpFT
kbp2hdEclnDEWcmsbHRGW2EGLPMM9ftVjR+24+VQohAxqhpBjZg=
=SQQk
-----END PGP SIGNATURE-----

--6esr2cieaotn52rj--

--===============0348171235==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0348171235==--
