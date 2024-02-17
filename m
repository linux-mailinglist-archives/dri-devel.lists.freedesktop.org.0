Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD79F859065
	for <lists+dri-devel@lfdr.de>; Sat, 17 Feb 2024 16:13:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8672810E2D8;
	Sat, 17 Feb 2024 15:13:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=wahrenst@gmx.net header.b="hwImWSyG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DB3610E2D8
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Feb 2024 15:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=s31663417; t=1708182784; x=1708787584; i=wahrenst@gmx.net;
 bh=QGuTKRj2N/lP5XJpmnq3PGjh1xg9yd5nqLJ2t63uGsw=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=hwImWSyG99533J0EhThVkJyzF2VqniyG+4T+YDuzMBPMFZKe66pjS8RvXKuu+yqT
 gMK+zA2lGRwuZNmY5JLocc97OHj5BcQWG8qslh8JCpE39OID3khxrebYJ6yC1urYU
 d3FU/mXc7mrJ0SCP+T2dSk6TOzWIdH7b26L3CDUbBp9xK8XVAWfDyNqRkY3cE2Qy7
 SKPOTOcydPnWDW0ElBUFEJMklYpST9ac83zAq7YZKk+0uwfZuNpmdDPSqdojX7S1f
 YGDFFQfvMgEpkbiBhJ0MZs2QOXlY0P7r9KFs/8eoyY6KoL0OjoBl3OvVEpNQRFOqA
 27R0PvsVJ54kagSCOw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MmDIo-1rArB42c0O-00iCKo; Sat, 17
 Feb 2024 16:07:46 +0100
From: Stefan Wahren <wahrenst@gmx.net>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Dom Cobley <popcornmix@gmail.com>,
 Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH] drm/vc4: drv: Avoid possible NPD when booted without KMS
Date: Sat, 17 Feb 2024 16:07:20 +0100
Message-Id: <20240217150720.33257-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:DKi8TUNuA4L12xrwfFyBj7572a545/hxDT/r7151wrFJK+3T5Hv
 FU3TnIGkI+TYZM4fY1WzoLzt4zqbncRA7mrbTuCPcm5sFj7sIqB/O1IxtCAV4eEzaJieDt7
 0Z3/6R7xnVPXdYnHVWZ3rfHZJSnJiBhlDOWzFqCVZjYTxQW+DT4eHgOOFtWva4a4BL78S9r
 a5QMRX9wSk1VRFf/5ELpg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:dE6o7e5FFDQ=;0HUdUCnXVVAIAm1UzLS5JpQB8gF
 a1U66GJHTa46Ci5aN0NhnqdVijNlP/Yz6ad7XhVV9JdjuuRK3joPWkvb/RH9KRGrderSWXkMY
 DTW8CdUH0M9yGLNEsENwhT6PEJDaud96n3UbCyvPV5JVZqTimnSiFT2yswnrMk8nCwnKOcEeD
 a6ojceyLaBr+oggeTg2ATkAaTd2GwoMUsG7qccwY2pl7cs5tUhsatnv0dEnxn4PlrgSdkg7NK
 vIFLNs8D+57jJfaxWebWzw10XJaLtYfy+LoEDKeZDRHdYcG+n1RQJuhbEmXR5Nxu9ph8C+uNF
 PJZ53ZBODKKOu9LGj8MoAmbV6ok2h32IIuGoFS9V9Hg6BTo6H7Fh1zDESzEiqsjFO+TysDPU2
 nQvvgDoGcEkIOI63Qp1GUn8pg6Ddn1qwjPxsF2vdOKODzMLzGIix4K0aME1P+KPi0zEvGq39N
 x6R/jZQ0GcSVu3Cc5vXh7vYd91XeF3YHhcc5WrqvPiDlnGINqJZA8YenLR6NXVOOUa9c+67vG
 1zgyjc2ScSAhzk2rDnR5ZT/jZDgdKhyHisjSTNc/slUnL/u8uAQcXWvTKchXOVRRtrvEUzBxi
 O0XqYMgOUStdJ1nCEZe7ldYsq0qF6/ldREpqj70vOoI9Qyh5ZSvHTrulGBzmmK1LilYO8gXW4
 s7rMv0geBEMJDV/9Eo1ocA1O8sv8j0YndJ8cXLX7Ey8cGZg531UBo+cyAzSB/sWN4SQ3vNw5q
 ToBThjguOTLOjvDMlK+MiRDN55jAsPacHj7bJgL+WqExa7Zm6TDuJrHdGibMD2Wnr+9/Z2Yxd
 EoM1+yVHpuIyzvWd9WSk4ozqILGxZsmpQp1lchY6r0OUk=
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dom Cobley <popcornmix@gmail.com>

In case there is no matching KMS, the function vc4_match_add_driver
won't change the match pointer which is initialized with NULL.
Since component_master_add_with_match doesn't expected match
to be a NULL pointer, this results into a NPD.

Fixes: c8b75bca92cb ("drm/vc4: Add KMS support for Raspberry Pi.")
Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/gpu/drm/vc4/vc4_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index c133e96b8aca..4f17840df9d3 100644
=2D-- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -439,6 +439,8 @@ static int vc4_platform_drm_probe(struct platform_devi=
ce *pdev)

 	vc4_match_add_drivers(dev, &match,
 			      component_drivers, ARRAY_SIZE(component_drivers));
+	if (!match)
+		return -ENODEV;

 	return component_master_add_with_match(dev, &vc4_drm_ops, match);
 }
=2D-
2.34.1

