Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35806C720C0
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 04:42:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98C3610E634;
	Thu, 20 Nov 2025 03:42:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=w_armin@gmx.de header.b="aKRIWuba";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3660810E6DF;
 Thu, 20 Nov 2025 03:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1763610097; x=1764214897; i=w_armin@gmx.de;
 bh=2kOZ2qGDbUtlfM0lfAWL+CuCYcvOT4XDmaR4zoAjfg0=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=aKRIWuba0IAdSUR2MXvDkorv86Y1ma2GufVCsqO7RDi044SaUcUeLfJRCsvWhOJZ
 8lZCCPrDPiIwpKYFe92yZ7cl+oQBk5PdsXE9QtVfJHT6fY/4WyTWm3RVh9+1pvNYT
 XOTtdu+Py5bMANyXWChVUNV/XOqyhDY6rkxskQXa4PJMhZ4HXSdcmbwKt8z6pWvDw
 AOqOqQglEo0n2sNgSc13QNRZNO8l0YSQyF5TE8XSk/gx3MT4ZSL/gSh0NODa1+a94
 b4HGwJ9JmaVnftC4QqsZpRQ7DpGBZEyNTe2pZUU+7gAYi2dJyimmLuWgp/RsZCQk6
 MgBVjHxoIbwuoDuL8Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([93.202.247.91]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MHXFx-1vQeUz3w9p-00FRNj; Thu, 20
 Nov 2025 04:41:37 +0100
From: Armin Wolf <W_Armin@gmx.de>
Date: Thu, 20 Nov 2025 04:41:16 +0100
Subject: [PATCH RFC RESEND 6/8] thermal: core: Set parent device in
 thermal_cooling_device_register()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <20251120-thermal-device-v1-6-bbdad594d57a@gmx.de>
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
X-Provags-ID: V03:K1:4cIbWlrQp5RG0n2sdwfhJ6mqPNnFdfuw6wKcvDWlILFAv7qB4Kk
 KqQuPEi4WwVoI3o132IYI+euD43CiKKHwCpQCZNpS6bMVqqmIv2AW0/pM3zKghPVVUzAlVw
 QhugDQFsCGPrviBIOLioCsXA6xffXkGkUjh/U4M/vLy/p/zKDgcqUYeENmR7spTp54/Q6Uc
 nFlDNc2B7nUFaUiFctdJA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:P3U7megnmYM=;50+IRZ/J8/lMb44LA+JADkKOOMq
 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
 D+g+ND8CQLykQNoG4g8heDLsFQhGM
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

Extend thermal_cooling_device_register() to allow users to specify
the parent device of the cooling device to be created.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 Documentation/driver-api/thermal/sysfs-api.rst          | 5 ++++-
 drivers/acpi/acpi_video.c                               | 2 +-
 drivers/acpi/fan_core.c                                 | 4 ++--
 drivers/acpi/processor_thermal.c                        | 2 +-
 drivers/net/ethernet/mellanox/mlxsw/core_thermal.c      | 2 +-
 drivers/net/wireless/ath/ath10k/thermal.c               | 2 +-
 drivers/net/wireless/ath/ath11k/thermal.c               | 2 +-
 drivers/net/wireless/intel/iwlwifi/mld/thermal.c        | 4 +---
 drivers/net/wireless/intel/iwlwifi/mvm/tt.c             | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7915/init.c        | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7996/init.c        | 2 +-
 drivers/platform/x86/acerhdf.c                          | 2 +-
 drivers/thermal/intel/int340x_thermal/int3403_thermal.c | 4 ++--
 drivers/thermal/intel/int340x_thermal/int3406_thermal.c | 2 +-
 drivers/thermal/intel/intel_powerclamp.c                | 2 +-
 drivers/thermal/intel/intel_tcc_cooling.c               | 2 +-
 drivers/thermal/pcie_cooling.c                          | 2 +-
 drivers/thermal/thermal_core.c                          | 5 +++--
 include/linux/thermal.h                                 | 9 +++++----
 19 files changed, 30 insertions(+), 27 deletions(-)

diff --git a/Documentation/driver-api/thermal/sysfs-api.rst b/Documentatio=
n/driver-api/thermal/sysfs-api.rst
index f73de211bdce..cf242cd16f2e 100644
=2D-- a/Documentation/driver-api/thermal/sysfs-api.rst
+++ b/Documentation/driver-api/thermal/sysfs-api.rst
@@ -215,13 +215,16 @@ temperature) and throttle appropriate devices.
     ::
=20
 	struct thermal_cooling_device
-	*thermal_cooling_device_register(char *name,
+	*thermal_cooling_device_register(struct device *parent, char *name,
 			void *devdata, struct thermal_cooling_device_ops *)
=20
     This interface function adds a new thermal cooling device (fan/proces=
sor/...)
     to /sys/class/thermal/ folder as `cooling_device[0-*]`. It tries to b=
ind itself
     to all the thermal zone devices registered at the same time.
=20
+    parent:
+        parent device pointer.
+
     name:
 	the cooling device name.
     devdata:
diff --git a/drivers/acpi/acpi_video.c b/drivers/acpi/acpi_video.c
index 658e11745523..eae1ff9805b1 100644
=2D-- a/drivers/acpi/acpi_video.c
+++ b/drivers/acpi/acpi_video.c
@@ -1759,7 +1759,7 @@ static void acpi_video_dev_register_backlight(struct=
 acpi_video_device *device)
 	device->backlight->props.brightness =3D
 			acpi_video_get_brightness(device->backlight);
=20
-	device->cooling_dev =3D thermal_cooling_device_register("LCD", device,
+	device->cooling_dev =3D thermal_cooling_device_register(parent, "LCD", d=
evice,
 							      &video_cooling_ops);
 	if (IS_ERR(device->cooling_dev)) {
 		/*
diff --git a/drivers/acpi/fan_core.c b/drivers/acpi/fan_core.c
index 2ca3e347f15c..7ebf2529fbfd 100644
=2D-- a/drivers/acpi/fan_core.c
+++ b/drivers/acpi/fan_core.c
@@ -584,8 +584,8 @@ static int acpi_fan_probe(struct platform_device *pdev=
)
 	else
 		name =3D acpi_device_bid(device);
=20
-	cdev =3D thermal_cooling_device_register(name, device,
-						&fan_cooling_ops);
+	cdev =3D thermal_cooling_device_register(&pdev->dev, name, device,
+					       &fan_cooling_ops);
 	if (IS_ERR(cdev)) {
 		result =3D PTR_ERR(cdev);
 		goto err_end;
diff --git a/drivers/acpi/processor_thermal.c b/drivers/acpi/processor_the=
rmal.c
index 1ff10321eac5..a7307f5d137f 100644
=2D-- a/drivers/acpi/processor_thermal.c
+++ b/drivers/acpi/processor_thermal.c
@@ -313,7 +313,7 @@ int acpi_processor_thermal_init(struct acpi_processor =
*pr,
 {
 	int result =3D 0;
=20
-	pr->cdev =3D thermal_cooling_device_register("Processor", device,
+	pr->cdev =3D thermal_cooling_device_register(&device->dev, "Processor", =
device,
 						   &processor_cooling_ops);
 	if (IS_ERR(pr->cdev)) {
 		result =3D PTR_ERR(pr->cdev);
diff --git a/drivers/net/ethernet/mellanox/mlxsw/core_thermal.c b/drivers/=
net/ethernet/mellanox/mlxsw/core_thermal.c
index eac9a14a6058..1117d59b74fd 100644
=2D-- a/drivers/net/ethernet/mellanox/mlxsw/core_thermal.c
+++ b/drivers/net/ethernet/mellanox/mlxsw/core_thermal.c
@@ -693,7 +693,7 @@ int mlxsw_thermal_init(struct mlxsw_core *core,
 			mlxsw_cdev =3D &thermal->cdevs[i];
 			mlxsw_cdev->thermal =3D thermal;
 			mlxsw_cdev->idx =3D i;
-			cdev =3D thermal_cooling_device_register("mlxsw_fan",
+			cdev =3D thermal_cooling_device_register(dev, "mlxsw_fan",
 							       mlxsw_cdev,
 							       &mlxsw_cooling_ops);
 			if (IS_ERR(cdev)) {
diff --git a/drivers/net/wireless/ath/ath10k/thermal.c b/drivers/net/wirel=
ess/ath/ath10k/thermal.c
index 8b15ec07b107..16eb41b928ba 100644
=2D-- a/drivers/net/wireless/ath/ath10k/thermal.c
+++ b/drivers/net/wireless/ath/ath10k/thermal.c
@@ -161,7 +161,7 @@ int ath10k_thermal_register(struct ath10k *ar)
 	if (!test_bit(WMI_SERVICE_THERM_THROT, ar->wmi.svc_map))
 		return 0;
=20
-	cdev =3D thermal_cooling_device_register("ath10k_thermal", ar,
+	cdev =3D thermal_cooling_device_register(ar->dev, "ath10k_thermal", ar,
 					       &ath10k_thermal_ops);
=20
 	if (IS_ERR(cdev)) {
diff --git a/drivers/net/wireless/ath/ath11k/thermal.c b/drivers/net/wirel=
ess/ath/ath11k/thermal.c
index 18d6eab5cce3..363697ce8641 100644
=2D-- a/drivers/net/wireless/ath/ath11k/thermal.c
+++ b/drivers/net/wireless/ath/ath11k/thermal.c
@@ -172,7 +172,7 @@ int ath11k_thermal_register(struct ath11k_base *ab)
 		if (!ar)
 			continue;
=20
-		cdev =3D thermal_cooling_device_register("ath11k_thermal", ar,
+		cdev =3D thermal_cooling_device_register(&ar->hw->wiphy->dev, "ath11k_t=
hermal", ar,
 						       &ath11k_thermal_ops);
=20
 		if (IS_ERR(cdev)) {
diff --git a/drivers/net/wireless/intel/iwlwifi/mld/thermal.c b/drivers/ne=
t/wireless/intel/iwlwifi/mld/thermal.c
index f8a8c35066be..9e56e6e80ab7 100644
=2D-- a/drivers/net/wireless/intel/iwlwifi/mld/thermal.c
+++ b/drivers/net/wireless/intel/iwlwifi/mld/thermal.c
@@ -366,9 +366,7 @@ static void iwl_mld_cooling_device_register(struct iwl=
_mld *mld)
 	BUILD_BUG_ON(ARRAY_SIZE(name) >=3D THERMAL_NAME_LENGTH);
=20
 	mld->cooling_dev.cdev =3D
-		thermal_cooling_device_register(name,
-						mld,
-						&tcooling_ops);
+		thermal_cooling_device_register(mld->dev, name, mld, &tcooling_ops);
=20
 	if (IS_ERR(mld->cooling_dev.cdev)) {
 		IWL_DEBUG_TEMP(mld,
diff --git a/drivers/net/wireless/intel/iwlwifi/mvm/tt.c b/drivers/net/wir=
eless/intel/iwlwifi/mvm/tt.c
index 53bab21ebae2..b184f08230b9 100644
=2D-- a/drivers/net/wireless/intel/iwlwifi/mvm/tt.c
+++ b/drivers/net/wireless/intel/iwlwifi/mvm/tt.c
@@ -744,7 +744,7 @@ static void iwl_mvm_cooling_device_register(struct iwl=
_mvm *mvm)
 	BUILD_BUG_ON(ARRAY_SIZE(name) >=3D THERMAL_NAME_LENGTH);
=20
 	mvm->cooling_dev.cdev =3D
-		thermal_cooling_device_register(name,
+		thermal_cooling_device_register(mvm->dev, name,
 						mvm,
 						&tcooling_ops);
=20
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7915/init.c
index 5ea8b46e092e..cb08bb36f6e2 100644
=2D-- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -200,7 +200,7 @@ static int mt7915_thermal_init(struct mt7915_phy *phy)
 	if (!name)
 		return -ENOMEM;
=20
-	cdev =3D thermal_cooling_device_register(name, phy, &mt7915_thermal_ops)=
;
+	cdev =3D thermal_cooling_device_register(&wiphy->dev, name, phy, &mt7915=
_thermal_ops);
 	if (!IS_ERR(cdev)) {
 		if (sysfs_create_link(&wiphy->dev.kobj, &cdev->device.kobj,
 				      "cooling_device") < 0)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/init.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7996/init.c
index 5e95a36b42d1..bb6e55d79d0e 100644
=2D-- a/drivers/net/wireless/mediatek/mt76/mt7996/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
@@ -249,7 +249,7 @@ static int mt7996_thermal_init(struct mt7996_phy *phy)
=20
 	snprintf(cname, sizeof(cname), "cooling_device%d", phy->mt76->band_idx);
=20
-	cdev =3D thermal_cooling_device_register(name, phy, &mt7996_thermal_ops)=
;
+	cdev =3D thermal_cooling_device_register(&wiphy->dev, name, phy, &mt7996=
_thermal_ops);
 	if (!IS_ERR(cdev)) {
 		if (sysfs_create_link(&wiphy->dev.kobj, &cdev->device.kobj,
 				      cname) < 0)
diff --git a/drivers/platform/x86/acerhdf.c b/drivers/platform/x86/acerhdf=
.c
index 5ce5ad3efe69..c74937d475e5 100644
=2D-- a/drivers/platform/x86/acerhdf.c
+++ b/drivers/platform/x86/acerhdf.c
@@ -650,7 +650,7 @@ static int __init acerhdf_register_thermal(void)
 {
 	int ret;
=20
-	cl_dev =3D thermal_cooling_device_register("acerhdf-fan", NULL,
+	cl_dev =3D thermal_cooling_device_register(NULL, "acerhdf-fan", NULL,
 						 &acerhdf_cooling_ops);
=20
 	if (IS_ERR(cl_dev))
diff --git a/drivers/thermal/intel/int340x_thermal/int3403_thermal.c b/dri=
vers/thermal/intel/int340x_thermal/int3403_thermal.c
index 264c9bc8e645..08d9e91f01cb 100644
=2D-- a/drivers/thermal/intel/int340x_thermal/int3403_thermal.c
+++ b/drivers/thermal/intel/int340x_thermal/int3403_thermal.c
@@ -178,8 +178,8 @@ static int int3403_cdev_add(struct int3403_priv *priv)
 	priv->priv =3D obj;
 	obj->max_state =3D p->package.count - 1;
 	obj->cdev =3D
-		thermal_cooling_device_register(acpi_device_bid(priv->adev),
-				priv, &int3403_cooling_ops);
+		thermal_cooling_device_register(&priv->adev->dev, acpi_device_bid(priv-=
>adev),
+						priv, &int3403_cooling_ops);
 	if (IS_ERR(obj->cdev))
 		result =3D PTR_ERR(obj->cdev);
=20
diff --git a/drivers/thermal/intel/int340x_thermal/int3406_thermal.c b/dri=
vers/thermal/intel/int340x_thermal/int3406_thermal.c
index e21fcbccf4ba..e458add39a88 100644
=2D-- a/drivers/thermal/intel/int340x_thermal/int3406_thermal.c
+++ b/drivers/thermal/intel/int340x_thermal/int3406_thermal.c
@@ -157,7 +157,7 @@ static int int3406_thermal_probe(struct platform_devic=
e *pdev)
=20
 	int3406_thermal_get_limit(d);
=20
-	d->cooling_dev =3D thermal_cooling_device_register(acpi_device_bid(adev)=
,
+	d->cooling_dev =3D thermal_cooling_device_register(&pdev->dev, acpi_devi=
ce_bid(adev),
 							 d, &video_cooling_ops);
 	if (IS_ERR(d->cooling_dev))
 		goto err;
diff --git a/drivers/thermal/intel/intel_powerclamp.c b/drivers/thermal/in=
tel/intel_powerclamp.c
index 9a4cec000910..a8f798bf459f 100644
=2D-- a/drivers/thermal/intel/intel_powerclamp.c
+++ b/drivers/thermal/intel/intel_powerclamp.c
@@ -779,7 +779,7 @@ static int __init powerclamp_init(void)
 	/* set default limit, maybe adjusted during runtime based on feedback */
 	window_size =3D 2;
=20
-	cooling_dev =3D thermal_cooling_device_register("intel_powerclamp", NULL=
,
+	cooling_dev =3D thermal_cooling_device_register(NULL, "intel_powerclamp"=
, NULL,
 						      &powerclamp_cooling_ops);
 	if (IS_ERR(cooling_dev))
 		return -ENODEV;
diff --git a/drivers/thermal/intel/intel_tcc_cooling.c b/drivers/thermal/i=
ntel/intel_tcc_cooling.c
index f352ecafbedf..a0ead0fb1fbe 100644
=2D-- a/drivers/thermal/intel/intel_tcc_cooling.c
+++ b/drivers/thermal/intel/intel_tcc_cooling.c
@@ -101,7 +101,7 @@ static int __init tcc_cooling_init(void)
 	pr_info("Programmable TCC Offset detected\n");
=20
 	tcc_cdev =3D
-	    thermal_cooling_device_register("TCC Offset", NULL,
+	    thermal_cooling_device_register(NULL, "TCC Offset", NULL,
 					    &tcc_cooling_ops);
 	if (IS_ERR(tcc_cdev)) {
 		ret =3D PTR_ERR(tcc_cdev);
diff --git a/drivers/thermal/pcie_cooling.c b/drivers/thermal/pcie_cooling=
.c
index a876d64f1582..4d37f7f9d108 100644
=2D-- a/drivers/thermal/pcie_cooling.c
+++ b/drivers/thermal/pcie_cooling.c
@@ -61,7 +61,7 @@ struct thermal_cooling_device *pcie_cooling_device_regis=
ter(struct pci_dev *port
 	if (!name)
 		return ERR_PTR(-ENOMEM);
=20
-	return thermal_cooling_device_register(name, port, &pcie_cooling_ops);
+	return thermal_cooling_device_register(&port->dev, name, port, &pcie_coo=
ling_ops);
 }
=20
 void pcie_cooling_device_unregister(struct thermal_cooling_device *cdev)
diff --git a/drivers/thermal/thermal_core.c b/drivers/thermal/thermal_core=
.c
index 5d752e712cc0..92e51d2e4535 100644
=2D-- a/drivers/thermal/thermal_core.c
+++ b/drivers/thermal/thermal_core.c
@@ -1145,6 +1145,7 @@ __thermal_cooling_device_register(struct device *par=
ent, struct device_node *np,
=20
 /**
  * thermal_cooling_device_register() - register a new thermal cooling dev=
ice
+ * @parent:	parent device pointer.
  * @type:	the thermal cooling device type.
  * @devdata:	device private data.
  * @ops:		standard thermal cooling devices callbacks.
@@ -1157,10 +1158,10 @@ __thermal_cooling_device_register(struct device *p=
arent, struct device_node *np,
  * ERR_PTR. Caller must check return value with IS_ERR*() helpers.
  */
 struct thermal_cooling_device *
-thermal_cooling_device_register(const char *type, void *devdata,
+thermal_cooling_device_register(struct device *parent, const char *type, =
void *devdata,
 				const struct thermal_cooling_device_ops *ops)
 {
-	return __thermal_cooling_device_register(NULL, NULL, type, devdata, ops)=
;
+	return __thermal_cooling_device_register(parent, NULL, type, devdata, op=
s);
 }
 EXPORT_SYMBOL_GPL(thermal_cooling_device_register);
=20
diff --git a/include/linux/thermal.h b/include/linux/thermal.h
index fa53d12173ce..29a608bf5f80 100644
=2D-- a/include/linux/thermal.h
+++ b/include/linux/thermal.h
@@ -250,8 +250,9 @@ struct device *thermal_zone_device(struct thermal_zone=
_device *tzd);
 void thermal_zone_device_update(struct thermal_zone_device *,
 				enum thermal_notify_event);
=20
-struct thermal_cooling_device *thermal_cooling_device_register(const char=
 *,
-		void *, const struct thermal_cooling_device_ops *);
+struct thermal_cooling_device *
+thermal_cooling_device_register(struct device *parent, const char *type, =
void *drvdata,
+				const struct thermal_cooling_device_ops *ops);
 struct thermal_cooling_device *
 thermal_of_cooling_device_register(struct device *parent, struct device_n=
ode *np, const char *type,
 				   void *devdata, const struct thermal_cooling_device_ops *);
@@ -298,8 +299,8 @@ static inline void thermal_zone_device_update(struct t=
hermal_zone_device *tz,
 { }
=20
 static inline struct thermal_cooling_device *
-thermal_cooling_device_register(const char *type, void *devdata,
-	const struct thermal_cooling_device_ops *ops)
+thermal_cooling_device_register(struct device *parent, const char *type, =
void *devdata,
+				const struct thermal_cooling_device_ops *ops)
 { return ERR_PTR(-ENODEV); }
 static inline struct thermal_cooling_device *
 thermal_of_cooling_device_register(struct device *parent, struct device_n=
ode *np, const char *type,

=2D-=20
2.39.5

