Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E03A218052
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 09:07:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 083CC6E87D;
	Wed,  8 Jul 2020 07:06:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB91489F2D
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 16:35:38 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id u5so18657404pfn.7
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jul 2020 09:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=BbB6l7MlcJgIuZZaMltGq/np+EgD/lW+jRVCBQ7h6eM=;
 b=uSv3pNF6F9jEH4/maCBAqAq7ynlJJJCHlBJp/d95HeFwMQj472w2ywG/UW3zlu0Zs1
 FCvhm9MKX+NUOKoIi82oH09zZgfmc7ShcWpagqa0M37am4nckNyp5fVd+ug+4fwMf+7U
 eE206eiaOJXVusnnJr0dUOp5fm8dMDlQsIabNeij765SPXnEui7Ofz3SratiG97kzSbv
 lAqDV7w4KswJ7ou3ACpt0FARItCE9+S83YmkvY0KUaC1geKTccwtG1W1971NLHs7N9hr
 B9SI49LHXVKj/rOSyprl92UTvv+5YEs8NtR5cAuBfryPeZhvYZ1H/JfVz2etcnFcy8Lv
 LtZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=BbB6l7MlcJgIuZZaMltGq/np+EgD/lW+jRVCBQ7h6eM=;
 b=abrBWM1HDSwgl/cnQrjBSu3GP3QHttjNyClyoERgLM6/0MArYTz37S9WaJu+ZBCLA4
 373Hg+kt2NMzR1HOsCUJgS3tr3hcF3WXtPnsGURP7AEUY4OPno/uPGpPIoNpcJwAMicO
 YGYPJgRCKmasSlHplhuZuMdKViV3eiPryGmQLAvBex3crZteTWiKqJPJktLP1N7RUSiw
 mWO+ZH4suYCSuuBX84UK7bKNsgjoix3ODjoEPoj9F0sbgwlEGDrFQWSyZumYJ97wPIas
 PMhcsJ+OZia8UJkuxNHzYhCoBwJJWGKw1J+0aXrzPIkWPwWou+Jsa4JSt+Ndwyy+gjH5
 iiNA==
X-Gm-Message-State: AOAM531zmRdemCeMZDmWwqaVUgWoplcBdug35yGSpCQS46/nQ2r0/+Hk
 mijiFSVKJA4JP0u5fixN0LU=
X-Google-Smtp-Source: ABdhPJwGwzq1meutrv4mWgmis+cyWy3zh/H4Jrh0LyiLk7GaHCxV9uhpEh+9Pf8fZwPX8+tTkbJZAw==
X-Received: by 2002:a62:b409:: with SMTP id h9mr13698887pfn.305.1594139738379; 
 Tue, 07 Jul 2020 09:35:38 -0700 (PDT)
Received: from blackclown ([103.88.82.137])
 by smtp.gmail.com with ESMTPSA id p5sm1372232pgi.83.2020.07.07.09.35.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 07 Jul 2020 09:35:37 -0700 (PDT)
Date: Tue, 7 Jul 2020 22:05:23 +0530
From: Suraj Upadhyay <usuraj35@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 1/4] drm: mipi-dsi: Convert logging to drm_* functions.
Message-ID: <feeec2816debcf4105ac22af1661fd2d491d02b9.1594136880.git.usuraj35@gmail.com>
References: <cover.1594136880.git.usuraj35@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cover.1594136880.git.usuraj35@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Wed, 08 Jul 2020 07:06:31 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0074164118=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0074164118==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YiEDa0DAkWCtVeE4"
Content-Disposition: inline


--YiEDa0DAkWCtVeE4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Convert logging errors from dev_err() to drm_err().

Signed-off-by: Suraj Upadhyay <usuraj35@gmail.com>
---
 drivers/gpu/drm/drm_mipi_dsi.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index 07102d8da58f..5dd475e82995 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -34,6 +34,7 @@
 #include <linux/slab.h>
=20
 #include <drm/drm_dsc.h>
+#include <drm/drm_print.h>
 #include <video/mipi_display.h>
=20
 /**
@@ -155,19 +156,18 @@ static int mipi_dsi_device_add(struct mipi_dsi_device=
 *dsi)
 static struct mipi_dsi_device *
 of_mipi_dsi_device_add(struct mipi_dsi_host *host, struct device_node *nod=
e)
 {
-	struct device *dev =3D host->dev;
 	struct mipi_dsi_device_info info =3D { };
 	int ret;
 	u32 reg;
=20
 	if (of_modalias_node(node, info.type, sizeof(info.type)) < 0) {
-		dev_err(dev, "modalias failure on %pOF\n", node);
+		drm_err(host, "modalias failure on %pOF\n", node);
 		return ERR_PTR(-EINVAL);
 	}
=20
 	ret =3D of_property_read_u32(node, "reg", &reg);
 	if (ret) {
-		dev_err(dev, "device node %pOF has no valid reg property: %d\n",
+		drm_err(host, "device node %pOF has no valid reg property: %d\n",
 			node, ret);
 		return ERR_PTR(-EINVAL);
 	}
@@ -202,22 +202,21 @@ mipi_dsi_device_register_full(struct mipi_dsi_host *h=
ost,
 			      const struct mipi_dsi_device_info *info)
 {
 	struct mipi_dsi_device *dsi;
-	struct device *dev =3D host->dev;
 	int ret;
=20
 	if (!info) {
-		dev_err(dev, "invalid mipi_dsi_device_info pointer\n");
+		drm_err(host, "invalid mipi_dsi_device_info pointer\n");
 		return ERR_PTR(-EINVAL);
 	}
=20
 	if (info->channel > 3) {
-		dev_err(dev, "invalid virtual channel: %u\n", info->channel);
+		drm_err(host, "invalid virtual channel: %u\n", info->channel);
 		return ERR_PTR(-EINVAL);
 	}
=20
 	dsi =3D mipi_dsi_device_alloc(host);
 	if (IS_ERR(dsi)) {
-		dev_err(dev, "failed to allocate DSI device %ld\n",
+		drm_err(host, "failed to allocate DSI device %ld\n",
 			PTR_ERR(dsi));
 		return dsi;
 	}
@@ -228,7 +227,7 @@ mipi_dsi_device_register_full(struct mipi_dsi_host *hos=
t,
=20
 	ret =3D mipi_dsi_device_add(dsi);
 	if (ret) {
-		dev_err(dev, "failed to add DSI device %d\n", ret);
+		drm_err(host, "failed to add DSI device %d\n", ret);
 		kfree(dsi);
 		return ERR_PTR(ret);
 	}
--=20
2.17.1


--YiEDa0DAkWCtVeE4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE7AbCa0kOsMJ4cx0j+gRsbIfe744FAl8EpEsACgkQ+gRsbIfe
744THA/9GKnIzxHZm26JxemmT2Mv35+aYOz1jhWJ4kl/RSLXWMVEb5dBGRf7TCKv
qcwq4YL0CRuETsTMqRjADRnz5zy9s2tbP1CC8fBuhe4X8THtNIFC3LQzZbN4QXTe
h3PBMY8OCyDF1uBRT1gAHxbA6RD1LYSPKYViDaSJZLyWr5nNAHadBDtHm/eHVDIR
TlNse+ljLYOBzZdk0058Ltw5iDZWjFBdXkKBn6L+mXEH/QogeQE3Pzao2j87bB1d
60CLx1lckzfeAy9An6Y+QsCYDNjmtGtEtz1Tarbu/s3KESVvw4wdglKUlG3cPTcy
d0VG5ZsPnahBKIgdAEma5/Yo2i4E/EsaQqy2qZ9DoX1p50ZnHNJCzY704kFOkiU3
O39TzvCExFSSNYDOyRWwoTmqD3xO66vThZ7LLfg5w/LvviP7vVh+THFQiKQP74Dd
VP/oSsWeTvpnGPVFguisVmq08bc1HfihfdZvK9wtRC7T5VTP2MjOb6F2MB5QZmui
L712c6cH5RAJXU2yCO+r5BXGlaDTR+RmHqWppx+kkjzvcMjLfrIxPs7WkFb0sxoE
Lmc8G4LssNKcspDsgLJsi/Bp+EEuzM0us8pWjZSViVvMvxoagj+kjLw2tkLc0Njv
XSO0lYxkgQgCBkq3iVof3a7Fh3MGHRk/kuTyzm0fhbySAyxJlMo=
=8RKt
-----END PGP SIGNATURE-----

--YiEDa0DAkWCtVeE4--

--===============0074164118==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0074164118==--
