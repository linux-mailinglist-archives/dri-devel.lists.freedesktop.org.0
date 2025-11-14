Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42167C5B1AA
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 04:25:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EE5910E995;
	Fri, 14 Nov 2025 03:25:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=w_armin@gmx.de header.b="SG5pf0NQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C6D710E995;
 Fri, 14 Nov 2025 03:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1763090646; x=1763695446; i=w_armin@gmx.de;
 bh=1witJch5Wm69t8Vr/6mBWOY4SkAhtm8qmFrRdc/aq+w=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=SG5pf0NQwbTnaFT6Y2v8r7p7bVQ9G8A1bpzsnijOtc7W4VbughgUs5Z/TFLAi/58
 QbzySNJUt7AWIrGVPpgxrqHrtTeAtrknI1pE6t3/hk6Q8KWHBb+w4xVoAPmB49293
 zZ5jcCC/sAQNiXljuJhxrdSs3v3oVE2lGs6emAoMo/hSH0wkilQIZq6czlhwPUUqQ
 U5WyS9eii48bib/oBVu/5bhs4aZatV/2AIeguEMnAaZZQ44dr+yfTj6MNq9analLm
 hMEA08X0HOXcUMgCcJadLHbLksFkQ3+NnyPCIafKEk/5O9KXvzcATfbRnsBcwdRdG
 YQqgEQDq6DCplmCU6g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([93.202.247.91]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M5fIQ-1vH1ep2Jr8-001H8w; Fri, 14
 Nov 2025 04:24:05 +0100
From: Armin Wolf <W_Armin@gmx.de>
Date: Fri, 14 Nov 2025 04:23:03 +0100
Subject: [PATCH RFC 2/8] thermal: core: Set parent device in
 thermal_of_cooling_device_register()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <20251114-thermal-device-v1-2-d8b442aae38b@gmx.de>
References: <20251114-thermal-device-v1-0-d8b442aae38b@gmx.de>
In-Reply-To: <20251114-thermal-device-v1-0-d8b442aae38b@gmx.de>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Lucas Stach <l.stach@pengutronix.de>, 
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 Christian Gmeiner <christian.gmeiner@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Amit Daniel Kachhap <amit.kachhap@gmail.com>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Len Brown <lenb@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Ido Schimmel <idosch@nvidia.com>, 
 Petr Machata <petrm@nvidia.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Jeff Johnson <jjohnson@kernel.org>, 
 Miri Korenblit <miriam.rachel.korenblit@intel.com>, 
 Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Peter Kaestle <peter@piie.net>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Potnuri Bharat Teja <bharat@chelsio.com>, 
 Sebastian Reichel <sre@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Support Opensource <support.opensource@diasemi.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
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
X-Provags-ID: V03:K1:baRTeUF6BrfVF/8ExyLWK4P8kDLRpIB2FJy4wvrkwrQtPnqbCM/
 HhH5taZGWtmZqyXvQOOzN+Xi+l7KQ2rbzbTH3mgNt0YddHsJ+OQMsb7fy2wTIWzv/HW5ebC
 hAitrdPBKdEKNOMsDArEW4O700dvHpL3zTcfJgZIRavFasiDChCGkVI/Pd1+SWgCIL/6EnP
 M6I128ccglMdc6MjH4DKA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:XrewDnzivAA=;OcCNh3XKNiGNbBgUmfGNke8yrVV
 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
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

