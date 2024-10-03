Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7277998EF6D
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 14:41:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DE7C10E830;
	Thu,  3 Oct 2024 12:41:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=wahrenst@gmx.net header.b="NT6T1GIo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C76A110E830
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2024 12:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
 s=s31663417; t=1727959274; x=1728564074; i=wahrenst@gmx.net;
 bh=YnUO4CKkc1+oBQ7nfo3qXoEWai63XjWoSzBMZ4zBOc4=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=NT6T1GIozfy9FZ29B3V7dRUEytsAspxBUUQmNR8L4yhpjISui73NnjLaxpC37TTy
 02lTtZPAWTiuMJZahEPfqjphbo/6+we4eJp53vRMNXmwVkkfNjFKC1BAuL2LbKonX
 dXTAwQu7pKUxtdEfdIDAIATuwPi7UVPD9UsW0GSpjL5fG5c2rOVS3YCZE7Ix99Ji4
 8pX+KVnF+uPJ4rKeXVd7IL6VgD0ud3+2Fsx6rJvW378t7Y3m4P8SUVK0wSUvecrU7
 DQEaADOOHz1F6EVxwTrq1Q1gi0JphP3mReScahQuCuOmtjEVdBBIDe+3Y60zqnUS4
 gFm4DDUp15deyaaiFg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MZktj-1sQGC52Wrn-00RisG; Thu, 03
 Oct 2024 14:41:14 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
 Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Peter Robinson <pbrobinson@gmail.com>,
 dri-devel@lists.freedesktop.org, kernel-list@raspberrypi.com,
 Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V4 2/2] drm/vc4: v3d: add PM suspend/resume support
Date: Thu,  3 Oct 2024 14:41:07 +0200
Message-Id: <20241003124107.39153-3-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241003124107.39153-1-wahrenst@gmx.net>
References: <20241003124107.39153-1-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:t+vO0AEE0p4f4N/vpWFk0zu56kYqGOJJSDAE8m8gZsH6JlP/kAt
 IjhmWu75EtuE8oEcBDIxmGamLMR6n1WePPSMCuihIRhh5VHyteh+PqUy9E2tlz280XnH47f
 cFBkuEKew1WuHmxFqY2SwkRz2l0BzkNUmZ89Ts1/j+hzvAKBcfYIajjlfJ/n58qpBGffULw
 ZBcjHEyVsb8l1ef2nqyow==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:k3oi6o0bE48=;+neQBDdKHH7amm7ub82vmltSx+h
 MiH/uXxqYChJ5OU5qm//2ZO28yltJwXpRsOUlquSbItcT40697KGwmJ5Ox5bWbKM6L8zZP1D7
 hDBTqHGLUan8S98fSg0dTG9FZ9Ld/ZYtRFWnGfOPav/n2lZ9V1UA3VsUFwieuXqwixRNFIMD3
 rXpfrtrDzdRtc2idfLx6Cv8W8DqRPX4x/tS41Hrb3vQOS7JynSsFMGfq0Po1+V8882H0KRnnd
 Bm4KMO3oAk+YNlThpr4b+ks+UeVeoY7sPUwKDGo5H+3fHwkYDhHKX5jUg5LOXtIhohJcBjZCz
 SSY+UztIiz/HcsxYYNBoO4wPBiGSmsfsnMD97/wCI9ecGt5k6DYZWSLcCf66RgnYcEYHMvFI2
 YBnPy/PDiwqtSr1HMAFtfFtik3GWx//vd/FhJuWuctFGxCOW3oZ9jf0lT+sMP0eUtneoEH5q4
 CCn3B5jhuemeiloZ+m/x5LDd7QMX6zNDIIx5OvwJ3GwkXspEHj1xHU0Ct7pzoyTttBsVGeUgv
 vyUXEamyfJJFVHX/+j0355drtpy7oBqAG3EpSGOeCNJo3d2O1ce97YzbpoKvSQ2c3m2QwY5KR
 LmPSq1j0lLXssb3BkRiH2EIsg9KVggX488rLJM/prerlOqOPi7CnuoKA8qfK497y5LhawHlaQ
 8otNKfj0H3kjQJ0xQaJwVoAzcvHWXk2ZLLFMyFJ4i7yoqu/Nimc4VskzXSL/4ADjBDrAy4PpP
 PFnPwB7IdOc6wNgR+U1fc2maTethm+G4Y90Rs47ceimd+G0ylvugi6KbFvJcTNRZ1cp84KN9y
 re8zQ02GVak5i7R7W8DkDVpQ==
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
 drivers/gpu/drm/vc4/vc4_v3d.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_v3d.c b/drivers/gpu/drm/vc4/vc4_v3d.c
index 2423826c89eb..8057b06c1f16 100644
=2D-- a/drivers/gpu/drm/vc4/vc4_v3d.c
+++ b/drivers/gpu/drm/vc4/vc4_v3d.c
@@ -368,7 +368,6 @@ void vc4_v3d_bin_bo_put(struct vc4_dev *vc4)
 	mutex_unlock(&vc4->bin_bo_lock);
 }

-#ifdef CONFIG_PM
 static int vc4_v3d_runtime_suspend(struct device *dev)
 {
 	struct vc4_v3d *v3d =3D dev_get_drvdata(dev);
@@ -397,7 +396,6 @@ static int vc4_v3d_runtime_resume(struct device *dev)

 	return 0;
 }
-#endif

 int vc4_v3d_debugfs_init(struct drm_minor *minor)
 {
@@ -507,7 +505,8 @@ static void vc4_v3d_unbind(struct device *dev, struct =
device *master,
 }

 static const struct dev_pm_ops vc4_v3d_pm_ops =3D {
-	SET_RUNTIME_PM_OPS(vc4_v3d_runtime_suspend, vc4_v3d_runtime_resume, NULL=
)
+	RUNTIME_PM_OPS(vc4_v3d_runtime_suspend, vc4_v3d_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 };

 static const struct component_ops vc4_v3d_ops =3D {
@@ -538,6 +537,6 @@ struct platform_driver vc4_v3d_driver =3D {
 	.driver =3D {
 		.name =3D "vc4_v3d",
 		.of_match_table =3D vc4_v3d_dt_match,
-		.pm =3D &vc4_v3d_pm_ops,
+		.pm =3D pm_ptr(&vc4_v3d_pm_ops),
 	},
 };
=2D-
2.34.1

