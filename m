Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C5D6E36D1
	for <lists+dri-devel@lfdr.de>; Sun, 16 Apr 2023 11:54:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50A1710E04A;
	Sun, 16 Apr 2023 09:54:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 990CC10E04A;
 Sun, 16 Apr 2023 09:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1681638869; i=markus.elfring@web.de;
 bh=LY4EBg2BdWLPjNGYjC3YZ3qcq9tadoc7hWdZSllHPfc=;
 h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:In-Reply-To;
 b=fIp3mt6z4Wd5OdTAyC9IBAdEfhqiFBFwdrQqcpb6UV2VQJ4ZVDCoHgSxWOtRfczNx
 kSq9flOmYAXNOwfESKIL4b63criUjaG0aFdEyGN4P2TlBlO4wtEtIi8ogklzJaFgVE
 HKMcKnu+eJnca4fgXf2sSXJnjtfhmwQ7JvIXJ4vcdpFKmSjXExeGlPs+2GyDytR6Hi
 0MuGkXoZvyovKYHWjadLn4w3YKPNhZHzfMGD7lr0xRu3LVTix4O6r72l50MrBongRM
 We3Dw4xSFG7femJBozqMV/4lQLEmmjsL5qkTUcily1DL86I8cJobwUhT6fyU2f89vx
 IcTS9OtGHe2FA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.83]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MFJjP-1pYMyD3UzJ-00FPCj; Sun, 16
 Apr 2023 11:54:28 +0200
Message-ID: <04e2c1f5-26c7-9a23-5861-3d8757556cdd@web.de>
Date: Sun, 16 Apr 2023 11:54:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: [PATCH 8/9] drm/nouveau/pci: Move an expression into a function call
 parameter in nvkm_pcie_set_link()
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
X-Provags-ID: V03:K1:J0e0yr1JxAVW3GPnlcv9HTk5ueCQ7OmAOHYr8TWyPkLUlQZIYjp
 OxRdTBXpMLWU0b8VR/zdDxoteTVBlphkcMQsA+TCyfRmpGUtGb/0B1GUBa7R+u3jjV4jaWE
 L2UR+mx95QDP/punzQSPXWIT1wo/t60xwdO/4pDH4onlUewnnkUhEFWOK5AZm041A4f/Zq1
 HV7TkKbzM9gZI8/irNBCQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:iY2Ybj487Zs=;+JKNvsw6oP2MgAkUx4t/u031lMc
 U3Rs6wOrpAxEjeAeRvV3et1BdZArX4mqWjt0VQULSV7XTzfb2eoADJnsv7cEtCvNm/CB7SQAk
 hxIaODuGSUQ7WwM/RYzDZ5+Lh5JJRyVhK5KYOVTomffp3qqkNjcpf5in7DmGgWCqTonnWGL2E
 3Z8rEyFOp/2wH68GMRm3ZTFRu0+3r5zpcr0Dz3nOLv9ostgvNRVvtqm9XpJhyLv9FTjkZsJDg
 BqvyuBJLZNraxwfk3jHCLhdGbhSTUTM2/EPOms3W0y/aTnIaICVjR4BhFbC0BBo56fru0DLuj
 1jiE7zZREF9QBiVkyQo0buYIVcZ12Z04w9/ykPxqCXVza9rvAiuHpnsTKUONqzhxqUlb78Pjm
 gK4oYiE+m34/VfHG+vDS/OBXweQRkpIZzH2aJEC5P2K4Y2SHlaUlOoBpZUVLcd29nCMmVVSFz
 FQqFYeiyXGmP2HITOq9nQLDB+fNpFsQJHD6AyKRrS47cnr+bfsRCvgTBnuCABu3FeKEWIEBPq
 UCtnC+/MVD4f5YLF+mMPrgh1ZS6eF07f12+KdpVH15vq+rZwSH+sOX9AJMO4PLEp/9FJsaAUm
 DSuNMyPVi91eP7Cb33zWfBpJAdrYbVl9M7ALbi0LdSnIikPjFY4Qb4zuJ+ve77zf3p856qUPa
 64kK6Z0pps3CLSL38F8UQZMmQxUxHQWTnL29YSBDaT/Egk4eyjYVJ8XD+f1c/9xl1mnSp7UvX
 unBoK8DpSvr+ZKBxAcIdF3gEv1E8pCxOlWZ3BeWwq7GkpHBjnnNBk+HlzXJPnGATRxFRcc39B
 Qaez1bKLpdDeLqoYVS1gsAciyxd9WlegVYGsVtSqGojw6G/3Bm6cvYnXyqQc0B9s3PXH6xzkH
 8MEJDdrruDsPHB1sX6G+GNYcakFoCrumKq41fVk1/hf0aAyhUbUdGOk3e
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

Date: Sun, 16 Apr 2023 08:45:31 +0200

The variable =E2=80=9Cpbus=E2=80=9D was read only once in the implementati=
on of
the function =E2=80=9Cnvkm_pcie_set_link=E2=80=9D.
Thus move the usage of an expression into a parameter for a function call.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/gpu/drm/nouveau/nvkm/subdev/pci/pcie.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/pci/pcie.c b/drivers/gpu/=
drm/nouveau/nvkm/subdev/pci/pcie.c
index b295f100e1c1..dd18d9d0bade 100644
=2D-- a/drivers/gpu/drm/nouveau/nvkm/subdev/pci/pcie.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/pci/pcie.c
@@ -116,12 +116,10 @@ nvkm_pcie_set_link(struct nvkm_pci *pci, enum nvkm_p=
cie_speed speed, u8 width)
 {
 	struct nvkm_subdev *subdev;
 	enum nvkm_pcie_speed cur_speed, max_speed;
-	struct pci_bus *pbus;
 	int ret;

 	if (!pci || !pci_is_pcie(pci->pdev))
 		return 0;
-	pbus =3D pci->pdev->bus;

 	if (!pci->func->pcie.set_link)
 		return -ENOSYS;
@@ -135,7 +133,7 @@ nvkm_pcie_set_link(struct nvkm_pci *pci, enum nvkm_pci=
e_speed speed, u8 width)
 	}

 	cur_speed =3D pci->func->pcie.cur_speed(pci);
-	max_speed =3D min(nvkm_pcie_speed(pbus->max_bus_speed),
+	max_speed =3D min(nvkm_pcie_speed(pci->pdev->bus->max_bus_speed),
 			pci->func->pcie.max_speed(pci));

 	nvkm_trace(subdev, "current speed: %s\n", nvkm_pcie_speeds[cur_speed]);
=2D-
2.40.0

