Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CF3C72090
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 04:41:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B28FF10E635;
	Thu, 20 Nov 2025 03:41:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=w_armin@gmx.de header.b="X9pVvnxi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C46F10E634;
 Thu, 20 Nov 2025 03:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1763610085; x=1764214885; i=w_armin@gmx.de;
 bh=1witJch5Wm69t8Vr/6mBWOY4SkAhtm8qmFrRdc/aq+w=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=X9pVvnxirBKz8nOlzOnP4OsU3v7iXjlLxvIXyWrM1B8TKyZj5s1HgRHg+VuhJdxf
 LQKhOxg8BpS5wiKWiccUKT2bjrgmlL+XzFa24qwSJ07ZDtPzgnlisTro6NtOdN5xG
 8vJhyn4DX898exMMpbVA3h8+e5az1qJIFPjvWkfEWmb2PibnwH81VitCtX86bt9Ak
 4rgqoK12stYOp1WES3bcFZLo6QhPxoWCrUfW0gdbLU9WGP5OjvV6N5i0dB+nqsaLS
 WUc9Zeh76xLfKS40PQi4cyrkfsd1nM8lK6R3bFRloWEj4jKhwL/3tfHQp/vkFnPRR
 NrrwJeg7KbIsZ4epJQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([93.202.247.91]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N0X8u-1w7ARs3RMi-00yykY; Thu, 20
 Nov 2025 04:41:25 +0100
From: Armin Wolf <W_Armin@gmx.de>
Date: Thu, 20 Nov 2025 04:41:12 +0100
Subject: [PATCH RFC RESEND 2/8] thermal: core: Set parent device in
 thermal_of_cooling_device_register()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <20251120-thermal-device-v1-2-bbdad594d57a@gmx.de>
References: <20251120-thermal-device-v1-0-bbdad594d57a@gmx.de>
In-Reply-To: <20251120-thermal-device-v1-0-bbdad594d57a@gmx.de>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Len Brown <lenb@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Ido Schimmel <idosch@nvidia.com>, 
 Petr Machata <petrm@nvidia.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-tegra@vger.kernel.org, linux-acpi@vger.kernel.org, 
 linux-doc@vger.kernel.org, netdev@vger.kernel.org, 
 linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, 
 ath11k@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, platform-driver-x86@vger.kernel.org, 
 linux-pci@vger.kernel.org, imx@lists.linux.dev, 
 linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Provags-ID: V03:K1:1UoEphsgIh0DCvIypBaBlMhDf5nKXxN9NtIAzorZM9NWMj0e1ly
 JN5L37/wn6iTs/R/JMaMfzdoKjKVEcjUtmQb2Cycd09YxOVvi7b0bTrR3ilr5tAqfIw5n4t
 skj67CtahQ9TyHpW37iM1LpwujivRVFE3BT+J0XOO96wfmml3QOzFsB1zr0dO5Nl+rZ8vR/
 fiTIYNzTYIjCnjJKT7mgg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:TgAPfcCBj4Q=;vDaC4acoIO1HUTjjIuuCj6Sunet
 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
 Z+VgQgaw=
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

Extend thermal_of_cooling_device_register() to allow users to specify
the parent device of the cooling device to be created.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 4 ++--
 drivers/thermal/cpufreq_cooling.c     | 2 +-
 drivers/thermal/cpuidle_cooling.c     | 2 +-
 drivers/thermal/devfreq_cooling.c     | 2 +-
 drivers/thermal/tegra/soctherm.c      | 5 ++---
 drivers/thermal/thermal_core.c        | 5 +++--
 include/linux/thermal.h               | 9 ++++-----
 7 files changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnav=
iv/etnaviv_gpu.c
index cf0d9049bcf1..f2c98e46a1c6 100644
=2D-- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -1778,8 +1778,8 @@ static int etnaviv_gpu_bind(struct device *dev, stru=
ct device *master,
 	int ret;
=20
 	if (IS_ENABLED(CONFIG_DRM_ETNAVIV_THERMAL)) {
-		gpu->cooling =3D thermal_of_cooling_device_register(dev->of_node,
-				(char *)dev_name(dev), gpu, &cooling_ops);
+		gpu->cooling =3D thermal_of_cooling_device_register(dev, dev->of_node, =
dev_name(dev),
+								  gpu, &cooling_ops);
 		if (IS_ERR(gpu->cooling))
 			return PTR_ERR(gpu->cooling);
 	}
diff --git a/drivers/thermal/cpufreq_cooling.c b/drivers/thermal/cpufreq_c=
ooling.c
index 6b7ab1814c12..af9250c44da7 100644
=2D-- a/drivers/thermal/cpufreq_cooling.c
+++ b/drivers/thermal/cpufreq_cooling.c
@@ -593,7 +593,7 @@ __cpufreq_cooling_register(struct device_node *np,
 	if (!name)
 		goto remove_qos_req;
=20
-	cdev =3D thermal_of_cooling_device_register(np, name, cpufreq_cdev,
+	cdev =3D thermal_of_cooling_device_register(dev, np, name, cpufreq_cdev,
 						  cooling_ops);
 	kfree(name);
=20
diff --git a/drivers/thermal/cpuidle_cooling.c b/drivers/thermal/cpuidle_c=
ooling.c
index f678c1281862..520c89a36d90 100644
=2D-- a/drivers/thermal/cpuidle_cooling.c
+++ b/drivers/thermal/cpuidle_cooling.c
@@ -207,7 +207,7 @@ static int __cpuidle_cooling_register(struct device_no=
de *np,
 		goto out_unregister;
 	}
=20
-	cdev =3D thermal_of_cooling_device_register(np, name, idle_cdev,
+	cdev =3D thermal_of_cooling_device_register(dev, np, name, idle_cdev,
 						  &cpuidle_cooling_ops);
 	if (IS_ERR(cdev)) {
 		ret =3D PTR_ERR(cdev);
diff --git a/drivers/thermal/devfreq_cooling.c b/drivers/thermal/devfreq_c=
ooling.c
index 8fd7cf1932cd..d91695ed0f26 100644
=2D-- a/drivers/thermal/devfreq_cooling.c
+++ b/drivers/thermal/devfreq_cooling.c
@@ -454,7 +454,7 @@ of_devfreq_cooling_register_power(struct device_node *=
np, struct devfreq *df,
 	if (!name)
 		goto remove_qos_req;
=20
-	cdev =3D thermal_of_cooling_device_register(np, name, dfc, ops);
+	cdev =3D thermal_of_cooling_device_register(dev, np, name, dfc, ops);
 	kfree(name);
=20
 	if (IS_ERR(cdev)) {
diff --git a/drivers/thermal/tegra/soctherm.c b/drivers/thermal/tegra/soct=
herm.c
index 5d26b52beaba..4f43da123be4 100644
=2D-- a/drivers/thermal/tegra/soctherm.c
+++ b/drivers/thermal/tegra/soctherm.c
@@ -1700,9 +1700,8 @@ static void soctherm_init_hw_throt_cdev(struct platf=
orm_device *pdev)
 			stc->init =3D true;
 		} else {
=20
-			tcd =3D thermal_of_cooling_device_register(np_stcc,
-							 (char *)name, ts,
-							 &throt_cooling_ops);
+			tcd =3D thermal_of_cooling_device_register(dev, np_stcc, name, ts,
+								 &throt_cooling_ops);
 			if (IS_ERR_OR_NULL(tcd)) {
 				dev_err(dev,
 					"throttle-cfg: %s: failed to register cooling device\n",
diff --git a/drivers/thermal/thermal_core.c b/drivers/thermal/thermal_core=
.c
index c8b720194b44..5d752e712cc0 100644
=2D-- a/drivers/thermal/thermal_core.c
+++ b/drivers/thermal/thermal_core.c
@@ -1166,6 +1166,7 @@ EXPORT_SYMBOL_GPL(thermal_cooling_device_register);
=20
 /**
  * thermal_of_cooling_device_register() - register an OF thermal cooling =
device
+ * @parent:	parent device pointer.
  * @np:		a pointer to a device tree node.
  * @type:	the thermal cooling device type.
  * @devdata:	device private data.
@@ -1180,11 +1181,11 @@ EXPORT_SYMBOL_GPL(thermal_cooling_device_register)=
;
  * ERR_PTR. Caller must check return value with IS_ERR*() helpers.
  */
 struct thermal_cooling_device *
-thermal_of_cooling_device_register(struct device_node *np,
+thermal_of_cooling_device_register(struct device *parent, struct device_n=
ode *np,
 				   const char *type, void *devdata,
 				   const struct thermal_cooling_device_ops *ops)
 {
-	return __thermal_cooling_device_register(NULL, np, type, devdata, ops);
+	return __thermal_cooling_device_register(parent, np, type, devdata, ops)=
;
 }
 EXPORT_SYMBOL_GPL(thermal_of_cooling_device_register);
=20
diff --git a/include/linux/thermal.h b/include/linux/thermal.h
index 0b5ed6821080..fa53d12173ce 100644
=2D-- a/include/linux/thermal.h
+++ b/include/linux/thermal.h
@@ -253,8 +253,8 @@ void thermal_zone_device_update(struct thermal_zone_de=
vice *,
 struct thermal_cooling_device *thermal_cooling_device_register(const char=
 *,
 		void *, const struct thermal_cooling_device_ops *);
 struct thermal_cooling_device *
-thermal_of_cooling_device_register(struct device_node *np, const char *, =
void *,
-				   const struct thermal_cooling_device_ops *);
+thermal_of_cooling_device_register(struct device *parent, struct device_n=
ode *np, const char *type,
+				   void *devdata, const struct thermal_cooling_device_ops *);
 struct thermal_cooling_device *
 devm_thermal_of_cooling_device_register(struct device *dev,
 				struct device_node *np,
@@ -302,9 +302,8 @@ thermal_cooling_device_register(const char *type, void=
 *devdata,
 	const struct thermal_cooling_device_ops *ops)
 { return ERR_PTR(-ENODEV); }
 static inline struct thermal_cooling_device *
-thermal_of_cooling_device_register(struct device_node *np,
-	const char *type, void *devdata,
-	const struct thermal_cooling_device_ops *ops)
+thermal_of_cooling_device_register(struct device *parent, struct device_n=
ode *np, const char *type,
+				   void *devdata, const struct thermal_cooling_device_ops *ops)
 { return ERR_PTR(-ENODEV); }
 static inline struct thermal_cooling_device *
 devm_thermal_of_cooling_device_register(struct device *dev,

=2D-=20
2.39.5

