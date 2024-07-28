Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0504F93E551
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jul 2024 15:07:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8385610E181;
	Sun, 28 Jul 2024 13:07:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=wahrenst@gmx.net header.b="AJKPnb1I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE12D10E181
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jul 2024 13:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
 s=s31663417; t=1722172058; x=1722776858; i=wahrenst@gmx.net;
 bh=ar/kp7yD2mJLJuSys73kvAqBB9MnTy6xyWNEEdcVnRA=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=AJKPnb1Ij7xGAEQMkTU5la9CncZ/81VTL5ULYCSRAPhLZl6Pm7fP2eVLbEod2oLa
 XruidB7HNpl+JXTXn1BfpXyZiSuW02Uld4U6t6XPr1SzfevfFbBZns9ZHpLwROwj1
 TawY8hj+hsPrewHDzr55U5AgcJN54lCLiStXeCO2TWiYNQ4SKbshFSTQOrVfe10FW
 /I9ejw7rRA7Ew8Xc6b4qookEO7bOSqSfCgJnqkzlNINesiMKMy9xitOJP9yeUELs0
 MFs73jddIOAmYwCTTbraFIbmU7kEd/rgdt9ZqwyucaJTVcrIL+7zK07dqKw/wQc90
 EhTdmQ1Ub+q/aSnzaQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MzQgC-1sKwYe1EyO-010E9t; Sun, 28
 Jul 2024 15:01:48 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Maxime Ripard <mripard@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Jiri Slaby <jirislaby@kernel.org>, Minas Harutyunyan <hminas@synopsys.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Lukas Wunner <lukas@wunner.de>,
 Artur Petrosyan <Arthur.Petrosyan@synopsys.com>,
 Peter Robinson <pbrobinson@gmail.com>, dri-devel@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com, linux-pm@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel-list@raspberrypi.com,
 Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V2 10/16] drm/vc4: v3d: add PM suspend/resume support
Date: Sun, 28 Jul 2024 15:00:23 +0200
Message-Id: <20240728130029.78279-2-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240728130029.78279-1-wahrenst@gmx.net>
References: <20240728114200.75559-1-wahrenst@gmx.net>
 <20240728130029.78279-1-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:7IJwLoTzlwttqekflfpKp30OMNgCC3j4tWm9XhRYDocXhUqvFz4
 fVyOSsioY5Adrs1r12juiZMUFnUcFVKLW4xosI+l3QsE+KzidpSCATgSFsIfLWyrpuFH40F
 G5YzwSO6aXeiPPEcUqY0QcOibtdV8YZr8uHCLPId3UC5evWHHpkdKMbX4KMUqcBiEJ5f2lF
 Hf+ImoiVPnqpTtSkP08AA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:+7mLj5i30qo=;R5ngtMsmqPUpDW0LusQsEhwbIu4
 kk+MNLEVPRwGDAY4HySFX8tfVFnpCdw/Er74XvbdavpgS3fXlLNuZ8VD8GlfuKCa1VEF1Gvso
 4LTyXSf3NSSZ2szpKYWYbCOZNamkRhzuu0ytFdx4o1ymwlkIXGV0S3z0xmtXYRJ6ayrGUgm1m
 OtZxASOytyV6jeYFJYGdTBcij9s68ZlKO/TL3wRASjoO5eNSlDria9UTFrnQK6aNPM2ArblZ7
 XklooCLCg8stOoWQ9POpJ4q9qsVB981a6369w/J5opCcIMDmVaN2Vc7FMvmB9Gv8jvx5XYVaR
 1YVGCqFLmmJT6H8SfhO/tpke7QrMS6Hkj36PExQr6aKsQRunGtuFq8PnJoL0QXi3CCBsyQN+c
 fqXPG1RhWMlz+ld0ElflyzQLO7R4lGQ8uHKwF5ZV5qC6bTT/wpUEORyd9wenN4st9WSgSiYQg
 bDfni0oYRZ0W3LAufX67PQXdPA5phVZNC69S3SvYA3/6UveyaK2JfJRAFO7B2EKa5M5bZTrK/
 bV4XEJlAadUUilJeXnn+v2QssCLhZbu/NBP9lE5kAdqsKs28xELT9wL9DP6F3Jt6HvzU7lbsZ
 xO2eUDA7UOJ+TMamTRHQxxJnHDAQWYg06EByLRUml4dMpihBaetJQJlF9NHtcogcfEPiUsu2h
 mERbTNK+tTwT59F/J/HvgyAX2PUU2fphM3VQb2Edis1vUMaEQOUQ+VB+6HGIUE8Wwfb0AnGPK
 TAWstBuNQk0VJg49VI8RTRgt7qP1X7B8EnUL+70Kia7sre0x0uUzwphwopvtPW7X02aOWkdNJ
 q+y/BGKJx0y9mxPfOEep2pRQ==
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

Add suspend/resume support for the VC4 V3D component in order
to handle suspend to idle properly.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/gpu/drm/vc4/vc4_v3d.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_v3d.c b/drivers/gpu/drm/vc4/vc4_v3d.c
index 4bf3a8d24770..309c8af08fd0 100644
=2D-- a/drivers/gpu/drm/vc4/vc4_v3d.c
+++ b/drivers/gpu/drm/vc4/vc4_v3d.c
@@ -511,6 +511,8 @@ static void vc4_v3d_unbind(struct device *dev, struct =
device *master,

 static const struct dev_pm_ops vc4_v3d_pm_ops =3D {
 	SET_RUNTIME_PM_OPS(vc4_v3d_runtime_suspend, vc4_v3d_runtime_resume, NULL=
)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
 };

 static const struct component_ops vc4_v3d_ops =3D {
=2D-
2.34.1

