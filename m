Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A25598EF6B
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 14:41:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B22FF10E82B;
	Thu,  3 Oct 2024 12:41:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=wahrenst@gmx.net header.b="ZBuYwigB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1817310E82B
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2024 12:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
 s=s31663417; t=1727959274; x=1728564074; i=wahrenst@gmx.net;
 bh=tnQcBU5toJjMIRGGXx0VSn/ZnlHQ0dkV9gVm+2hU+G4=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=ZBuYwigB/ZRkTs1vzpTqReOE5Z539kaZ5f9WaXpltzRVa5awhdpQdV965w01Hs3c
 BuYwWvYWfiuJZoG+9rv8s+a3ieq7jfPCzvkgxPrgvEzBmdQ/zrdhMyTtn9+oHqNn3
 U5Ga6otzz0Zh0Bv78Ei//pGSjRIRw3Zkw514D2I4xGUv/HnTyfQnDTbFgH51txbFO
 pfUnO66/MW2K5kzhI3RKp4lguORwYi6rcYTNNCCXUzUfvJmlgRsW08C6XYJedormE
 w3bmd1ymYGMRPFwFZ+CKtbLwmNxmfnmGYFB/Takq7YyhpvbW1U+T9qSZa8oAyVwJF
 h1h09oiJUQGsSYB7Aw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MwfWU-1ryJlr3vje-00tP6n; Thu, 03
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
Subject: [PATCH V4 1/2] drm/vc4: hdmi: add PM suspend/resume support
Date: Thu,  3 Oct 2024 14:41:06 +0200
Message-Id: <20241003124107.39153-2-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241003124107.39153-1-wahrenst@gmx.net>
References: <20241003124107.39153-1-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:11kO0ckKqnLzd9cpwH173pwRGEXeP2dVte0XmK8E8Auy+s5ZPxJ
 n5Mz5X0w77FwtvroevqavtFd1arJNG0PDzRUGHkxr/EFksi0FX5Y5Bbr8xa85cCBjfXnLXW
 m3fsA9Ke2vWdH6Bx6VPjvaCyqWxGrrjTAQ6sA6/kEQ5TWvgFBGNDyHqLYEkDHuBuQThnbg8
 UcJBbQXKQ8Qu7/1gXP2IA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:b5fQAdBeQ9k=;Pekfi3o96vyL8L8ejA/frZEPoHB
 KALeOtHCaE8qBpG7Q9xODOdDVxe3v1LWq2Aovdl3pBNt7DEyfP/Fes9gX+Aouzc6Bf+XxyBBf
 BZd2oFtXrb3ltUbK3t2+PHpb5mu8KQmnzGl20Uvq8SZmmfOw+OsCGgPdobjOvwPRLgYoYm+ey
 NV4MSxIdh5jbMVLycEz981tU9LMUnDU/j5VgBr26NeQ+g1YvvewIipuOcYnZdJZKrvFK0y7cb
 WRG5MH2M6MfWI55u9BdoNIS54xSbvmrMPculV9kucXulje2xUSbB0dG043IAAytm+gH0LeTLv
 WS2/qBK0DGHAEGt4w0CUMLER5fG8yUs/Rxi8z3rFYR9jwmIyoMu9SlSAySvGP+lbjt2PDa0Hp
 W8OyAfe7aPTKvrCfTcuKXQK/PvDyA/Rt3QTGD7hj9dkHdeEOXkZ8DykNSzKS30IGz6CSEKTBP
 xHs3tqfEvgbl0qzXs/7xt37N0vYYpn7Tnwi1P3KixkXiD89Ir4TOFJozgGRdN4D6Ng3qp3YdS
 MPI8A9snsQYAmpt84MqB2oeizx68ziHaSSt/iB82kzpNW3ucDLWLxqNXCApIeFR8hOSc28rNQ
 EEsNh0BaxpYNL0hxC42okrcKzsz53488z8rl44YkPPZXsJ2Gomf1al0WgcSh9GGGyLSyRWUDq
 CUzfTqDJdWZcpYwWJiu0DCX0ncuIJvDLBXP/REgPUjmvVjJZIXuR2zdjGIfVyAsT8Qs4Gskim
 sUJggOb3N3mbZqBIEPVN9oKBtKSEr0+eKbe/NxxpIeDBaoIDLUO5vrwBDBf8kC38EORdNRj37
 moZDEcY8u19aJmI2xyVzl8pw==
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

Add suspend/resume support for the VC4 HDMI component in order
to handle suspend to idle properly. Since the HDMI power domain
is powered down during suspend, this makes connector status polling
pointless.

Link: https://lore.kernel.org/dri-devel/7003512d-7303-4f41-b0d6-a8af5bf8e4=
97@gmx.net/
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Acked-by: Maxime Ripard <mripard@kernel.org>
=2D--
 drivers/gpu/drm/vc4/vc4_hdmi.c | 32 ++++++++++++++++++++++++++++----
 1 file changed, 28 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi=
.c
index 62b82b1eeb36..5e5d1c609858 100644
=2D-- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -3117,6 +3117,31 @@ static int vc5_hdmi_init_resources(struct drm_devic=
e *drm,
 	return 0;
 }

+static int vc4_hdmi_suspend(struct device *dev)
+{
+	struct vc4_hdmi *vc4_hdmi =3D dev_get_drvdata(dev);
+	struct drm_device *drm =3D vc4_hdmi->connector.dev;
+
+	if (drm && drm->mode_config.poll_enabled)
+		drm_kms_helper_poll_disable(drm);
+
+	return pm_runtime_force_suspend(dev);
+}
+
+static int vc4_hdmi_resume(struct device *dev)
+{
+	struct vc4_hdmi *vc4_hdmi =3D dev_get_drvdata(dev);
+	struct drm_device *drm =3D vc4_hdmi->connector.dev;
+	int ret;
+
+	ret =3D pm_runtime_force_resume(dev);
+
+	if (drm && drm->mode_config.poll_enabled)
+		drm_kms_helper_poll_enable(drm);
+
+	return ret;
+}
+
 static int vc4_hdmi_runtime_suspend(struct device *dev)
 {
 	struct vc4_hdmi *vc4_hdmi =3D dev_get_drvdata(dev);
@@ -3415,9 +3440,8 @@ static const struct of_device_id vc4_hdmi_dt_match[]=
 =3D {
 };

 static const struct dev_pm_ops vc4_hdmi_pm_ops =3D {
-	SET_RUNTIME_PM_OPS(vc4_hdmi_runtime_suspend,
-			   vc4_hdmi_runtime_resume,
-			   NULL)
+	RUNTIME_PM_OPS(vc4_hdmi_runtime_suspend, vc4_hdmi_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(vc4_hdmi_suspend, vc4_hdmi_resume)
 };

 struct platform_driver vc4_hdmi_driver =3D {
@@ -3426,6 +3450,6 @@ struct platform_driver vc4_hdmi_driver =3D {
 	.driver =3D {
 		.name =3D "vc4_hdmi",
 		.of_match_table =3D vc4_hdmi_dt_match,
-		.pm =3D &vc4_hdmi_pm_ops,
+		.pm =3D pm_ptr(&vc4_hdmi_pm_ops),
 	},
 };
=2D-
2.34.1

