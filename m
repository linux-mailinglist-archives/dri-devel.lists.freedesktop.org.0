Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1D86E36A2
	for <lists+dri-devel@lfdr.de>; Sun, 16 Apr 2023 11:33:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B237810E0A4;
	Sun, 16 Apr 2023 09:33:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87F2A10E0A4
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Apr 2023 09:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1681637625; i=markus.elfring@web.de;
 bh=8uHpunreb8Uo0Uleoeb/IuBORjGn6rkAngQmsnHu6wo=;
 h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:In-Reply-To;
 b=uNQkI3B/K8Z8M3MrlYgymN/aLA3rRG1QZdl7qfW7GGfTCt2ZwMWJYT1D0At4y2bxz
 +5Kp5gsNaVI7W18qozcx7W9097C6nbxGmnKFhYjg+J1JO3Pq/Ktu8dbdOZjJKHHfEY
 fylNNvDuVmR8gTQ3WaLYsM7kQST9RWzk3OBd4n0c++b2bq9b7ENYRv2ylivJ/Y9xYQ
 pENXBa3nibtcnNjkMRciQtq3jJWUPvlwKZ6LFLhBu6nWkdUWsYQEQzlA86tWJl/hZq
 svypQZHuGRnMrnUHiucUDoBihHH0y3YmLM3Pbes+EkZboJPEVp47jjw3A+zYKFPJCK
 bujavS4tyRXZA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.83]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MsaS7-1qbYVm0bDH-00tdS0; Sun, 16
 Apr 2023 11:33:45 +0200
Message-ID: <1903e057-57d3-e12e-da37-008e23afd2e2@web.de>
Date: Sun, 16 Apr 2023 11:33:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: [PATCH 1/9] drm/nouveau/debugfs: Move an expression into a function
 call parameter in nouveau_debugfs_pstate_set()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
To: kernel-janitors@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <2a746461-844a-2ad6-7b52-03f13fe1b9bf@web.de>
In-Reply-To: <2a746461-844a-2ad6-7b52-03f13fe1b9bf@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:4oF3Th7JF7y2HCnR8fozd4gR12wECkP6ixJoym1j256YmWiDIVo
 8GgH4sILld65578JRcAcU0gwMo0Bqhm9yfFuy3aU4LPez80+WkLFlNb+mZ1sk/pKTiK+que
 d1iRYCljX6TbqL+5MQ7+Pjz07Cp/Xqvo8DOxxV/na0LIac1BqwyBmnVHbu2AzbIHi0WS/La
 vNUKTLphOY36wAc8QbohQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:iverrg5pEh8=;DgI8r5RfixMh57awQv5JoZe9evv
 FG026mdqqPWNWrAvBJwwgQkDaDRe9GIGjwdYnulqjkjXH9OxOoVtQDCqCYF4jBX4qFufLR2tT
 K07kZrysvb13t7DHKd198A6WaXaXie5YiPndQY1Wj9SzkSrL1gUSu81eC9EuQHEblM90Ajk5g
 KA0IAq992HsqnhHvUYEx//kGmOHkfVk10qlAOhxFMbLzXm2nOgZDdUhsvzki8jWpTBigY704a
 6qqhue2nxvUiX4VD2asBzlB0McVEHc3cVxhTDmYexHoOxqVamMIBPHclnpQP/2Iy/jzzGzEdJ
 tnyKHXDgpN6iTXflWXXkFYq6h+l55bHqfyhwLvreL0Q1zOYq9i+/elzESPjnlx2GxyJLESEil
 k0na8bx9hUP/okmOgfO3tZRMZ1a49uTpk/phfd088SoSAsvcQlq7iro2dk/iZmM3SMS7lka2m
 kXjElSWdxCRYl8I1vQRvyGGYFoxiXs5UeIQbt5CIqQpPQgqYJbEBz3zZYu4NANb/K0fvKLLsB
 MPBKn1dnDAObTimJQVNTLW4uIFBfR3ufOOKOJ4uPIfjzzBQX0idBIUv+RuUljNsWO4UAt7SqV
 iBpvg0nd2xJY1pAfcNLtegzqYLDtDL/56z8k85pSLR+AfUgFNGd52in+Corq9sIZ988qDQVZ7
 wzP6pm8C4QVN1OIsbxy7LztjbLHp0mbOOYaeoGXpOq9WNa2V2XeSunBZz3JXLd56QL+tbQ3WI
 E8IK+yIdYDr4Q5kEWWKcAERvP33BuKuEdxQjVKtiOjmhk2LStc2kQHWR6MCc0eV3HsGkV0Ixg
 iQUs9kWfVGpLNLHvNiPwbmrpo5Ta67t+SGIn9N20KADseQJ4E5/MaLNDIV/Q8lhI2v3pk/Zsa
 6ztUaI4J3uzedEMBRimgkMSEu4fIdRUviFq5TDrHxMujjVKal9L+fbZNH
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
Cc: LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Date: Sat, 15 Apr 2023 21:06:06 +0200

The address of a data structure member was determined before
a corresponding null pointer check in the implementation of
the function =E2=80=9Cnouveau_debugfs_pstate_set=E2=80=9D.

Thus avoid the risk for undefined behaviour by moving the usage
of an expression into a parameter for a function call at the end.

This issue was detected by using the Coccinelle software.

Fixes: 6e9fc177399f08446293fec7607913fdbc95e191 ("drm/nouveau/debugfs: add=
 copy of sysfs pstate interface ported to debugfs")
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/gpu/drm/nouveau/nouveau_debugfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.c b/drivers/gpu/drm/n=
ouveau/nouveau_debugfs.c
index 2a36d1ca8fda..44e26b6e74c7 100644
=2D-- a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
+++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
@@ -144,7 +144,6 @@ nouveau_debugfs_pstate_set(struct file *file, const ch=
ar __user *ubuf,
 	struct seq_file *m =3D file->private_data;
 	struct drm_device *drm =3D m->private;
 	struct nouveau_debugfs *debugfs =3D nouveau_debugfs(drm);
-	struct nvif_object *ctrl =3D &debugfs->ctrl;
 	struct nvif_control_pstate_user_v0 args =3D { .pwrsrc =3D -EINVAL };
 	char buf[32] =3D {}, *tmp, *cur =3D buf;
 	long value, ret;
@@ -188,7 +187,8 @@ nouveau_debugfs_pstate_set(struct file *file, const ch=
ar __user *ubuf,
 		return ret;
 	}

-	ret =3D nvif_mthd(ctrl, NVIF_CONTROL_PSTATE_USER, &args, sizeof(args));
+	ret =3D nvif_mthd(&debugfs->ctrl, NVIF_CONTROL_PSTATE_USER,
+			&args, sizeof(args));
 	pm_runtime_put_autosuspend(drm->dev);
 	if (ret < 0)
 		return ret;
=2D-
2.40.0

