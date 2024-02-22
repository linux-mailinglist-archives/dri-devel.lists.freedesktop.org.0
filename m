Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFD2860054
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 19:05:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30AD610E9D9;
	Thu, 22 Feb 2024 18:05:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.com header.i=erick.archer@gmx.com header.b="gAx2twXt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CF7810E9D9;
 Thu, 22 Feb 2024 18:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.com;
 s=s31663417; t=1708625097; x=1709229897; i=erick.archer@gmx.com;
 bh=OHabSJQFimhO/JHHtTHgMs8C5zNGLB/BEG4jMB2aFa4=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=gAx2twXtj5xgVNr06bxxy3461Fgd39NpjzPXbDBMl57nPe2uCD9VCQ9K2Zj1mV7l
 cr1Kv0XDlGxxBbIeFqP1njhpOBe0QoD1yvWJAskeLiZYZ/ISUByuDo2YxXZadHyma
 41pY7iCEzYn34EJuxWXQoi9A25zzpn2QuXJngPBndQLC6Z6Uf8QtmWIU2xSQXmT8b
 Fqn99gslXV1hGgmCesdToczet9h59I4Z2/LLeE7mY//67uGUp7xxuWQwPV6FGlKba
 a57qH1+ELjfgWE0bze6Im/ZRUqotrv+cKHyCjkyEoHpNCZ0FqBAqwU/84ggv2XvDe
 0OdN5Klg2W+IzjTr/Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([79.157.194.183]) by mail.gmx.net
 (mrgmx104 [212.227.17.174]) with ESMTPSA (Nemesis) id
 1MdvmY-1r2ECF0Tw6-00b4su; Thu, 22 Feb 2024 19:04:57 +0100
From: Erick Archer <erick.archer@gmx.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Kees Cook <keescook@chromium.org>
Cc: Erick Archer <erick.archer@gmx.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
Subject: [PATCH] drm/radeon/radeon_display: Decrease the size of allocated
 memory
Date: Thu, 22 Feb 2024 19:04:31 +0100
Message-Id: <20240222180431.7451-1-erick.archer@gmx.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:3J4zUxuFIkyhkOjHp/ue4LzXSV3U6rOdF1p0AgSup15g6kK00uG
 DmJLdoaRwGRe5f2qq9TF+vQJmrciGXreAXqmvSGrVbEE52xruGo2xffmvdjfeq6/GHOqmET
 PeUYcDWo4xI8GkbTbNGrN198gjIYifX27qe2hP47m5Bf5PISmUD9IPPJpaMOZ+CF2KA4NVN
 mbFvp01Mbsrv1ICuZOFmw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:3uDifHXcSuA=;A8YDne8bR0TkYKttHQ5ey2DZQ29
 bUO8VrMnhNaP8j3TpBz76LW94hPjA68BSR+GSHq9V0j3kEut1snMRalqSq3DrwfT6W6oEZPiR
 WLH2XpxpR8oy5QkZf5ddINcsDeHYDz5/GbkWcp+phh0RR+8rE8WY0HnxQkMlZ6EmLY2SchbQ4
 VBwuiGuiM15oRwRETo3QqfXiNrOHPy+2rLtgEJ6w7zxhVvwmeqZ4QvPQlYHSnIRefAhQnnnIr
 DkJwSHmU62ff5kfEgOA4KWhKt8eYDYeeRZRs3enKk1XG9j69rkDSzs5GKFZabGK9wUwD1232Y
 ujuL1SryLJeI2Q1ksQV7yT8GPVxhPOwktYlxhUgfwvaJyJXN9TwPWtgdApkQlQReTFawGkrmV
 TItgu8PqEkDkeV1zk3h5uF8qVWPTYDgi0v+9fuBIT5Nn5WFT4V+XPCJPNIhGSABetgRd8QKfO
 /mKUO7ytH8e1RQlkguNxXjRsEz7/WSQMfls5S2F7l6OxE9SzgP7kdk7n2BcSu7I1nkYJ/R49F
 oXyVo9OzKZd2NTJfVKUKKXxPYui3rOnZ743lHbA+YafoWCx0j0+VrlVn2a/XtWDJXQX+jSCMd
 1uo82ictjD62gKWt+T3SHmee9EVH7Zar9Vb/MAtH0N296P9Pxvmuy1S9QK6TOoAM4bbHmq+I2
 RcLJpeTRZVsrzZCnPs9PXKM6UEkuaaX85ioeRJlcQzRnRU50/R/DILTB5H+6dD1RTPPXqpLWo
 V6lZ+d0K+JZY39b1XfaNRwEifoerHQN3Xp9Lb6dCFoe5Oc6Gx1wztaaK41mFkjm/6jQle2Y8L
 5WK+nor6RlDmGTkqYTxp346oe5DJ5y26DD/2WNuwfeAMs=
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

This is an effort to get rid of all multiplications from allocation
functions in order to prevent integer overflows [1] [2].

In this case, the memory allocated to store RADEONFB_CONN_LIMIT pointers
to "drm_connector" structures can be avoided. This is because this
memory area is never accessed.

Also, in the kzalloc function, it is preferred to use sizeof(*pointer)
instead of sizeof(type) due to the type of the variable can change and
one needs not change the former (unlike the latter).

At the same time take advantage to remove the "#if 0" block, the code
where the removed memory area was accessed, and the RADEONFB_CONN_LIMIT
constant due to now is never used.

Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#open-=
coded-arithmetic-in-allocator-arguments [1]
Link: https://github.com/KSPP/linux/issues/160 [2]
Signed-off-by: Erick Archer <erick.archer@gmx.com>
=2D--
 drivers/gpu/drm/radeon/radeon.h         | 1 -
 drivers/gpu/drm/radeon/radeon_display.c | 8 +-------
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/rade=
on.h
index 3e5ff17e3caf..0999c8eaae94 100644
=2D-- a/drivers/gpu/drm/radeon/radeon.h
+++ b/drivers/gpu/drm/radeon/radeon.h
@@ -132,7 +132,6 @@ extern int radeon_cik_support;
 /* RADEON_IB_POOL_SIZE must be a power of 2 */
 #define RADEON_IB_POOL_SIZE			16
 #define RADEON_DEBUGFS_MAX_COMPONENTS		32
-#define RADEONFB_CONN_LIMIT			4
 #define RADEON_BIOS_NUM_SCRATCH			8

 /* internal ring indices */
diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/rad=
eon/radeon_display.c
index efd18c8d84c8..5f1d24d3120c 100644
=2D-- a/drivers/gpu/drm/radeon/radeon_display.c
+++ b/drivers/gpu/drm/radeon/radeon_display.c
@@ -683,7 +683,7 @@ static void radeon_crtc_init(struct drm_device *dev, i=
nt index)
 	struct radeon_device *rdev =3D dev->dev_private;
 	struct radeon_crtc *radeon_crtc;

-	radeon_crtc =3D kzalloc(sizeof(struct radeon_crtc) + (RADEONFB_CONN_LIMI=
T * sizeof(struct drm_connector *)), GFP_KERNEL);
+	radeon_crtc =3D kzalloc(sizeof(*radeon_crtc), GFP_KERNEL);
 	if (radeon_crtc =3D=3D NULL)
 		return;

@@ -709,12 +709,6 @@ static void radeon_crtc_init(struct drm_device *dev, =
int index)
 	dev->mode_config.cursor_width =3D radeon_crtc->max_cursor_width;
 	dev->mode_config.cursor_height =3D radeon_crtc->max_cursor_height;

-#if 0
-	radeon_crtc->mode_set.crtc =3D &radeon_crtc->base;
-	radeon_crtc->mode_set.connectors =3D (struct drm_connector **)(radeon_cr=
tc + 1);
-	radeon_crtc->mode_set.num_connectors =3D 0;
-#endif
-
 	if (rdev->is_atom_bios && (ASIC_IS_AVIVO(rdev) || radeon_r4xx_atom))
 		radeon_atombios_init_crtc(dev, radeon_crtc);
 	else
=2D-
2.25.1

