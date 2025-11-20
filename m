Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C06C720DB
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 04:42:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 532E710E6E8;
	Thu, 20 Nov 2025 03:42:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=w_armin@gmx.de header.b="Fn+QVfxa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B95810E6E6;
 Thu, 20 Nov 2025 03:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1763610103; x=1764214903; i=w_armin@gmx.de;
 bh=yGCAfufdk5uS0AxJlXQPTK96nfX3x9IiOUSTFIkZ/is=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=Fn+QVfxaSd0iv80J/t3/nHz27I4UZwNn/U8ZC4n7U53UXfe6mivDKKOhlfkOmgU5
 kgRauhVnYUVO4DvkYlaeaaST5QdgH9gBgq5HI8FkCbn8rwB7pbo+rAX0nrSM8VO8i
 0630u+KDujYVAtPnXhJ9kBRV3uPE/16oaWSQPsZsSqjEc+jYRZXbQsu6ke6hcooL/
 3q78rGoz1CXC5hCz3F75IQNumahYNZtk1y9z6f6LegSibcTox8sBJ1/Ir2R5lH/iY
 LPEKdA+esjJQNPXPZjwOc/UUo80AHXuuh2t0qaswri+onvVodEaAVl0bNeGH75Lnf
 A2AYMzyB3p+S2yHn8Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([93.202.247.91]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MpDNf-1vvqqv49BH-00oEAf; Thu, 20
 Nov 2025 04:41:43 +0100
From: Armin Wolf <W_Armin@gmx.de>
Date: Thu, 20 Nov 2025 04:41:18 +0100
Subject: [PATCH RFC RESEND 8/8] thermal: core: Allow setting the parent
 device of thermal zone devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <20251120-thermal-device-v1-8-bbdad594d57a@gmx.de>
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
X-Provags-ID: V03:K1:R29awBHW0pqrjeABaMJFeDeacollc6WnJKGlNk9Wna3omHYXCjn
 m61RHMalT6Lb2k4YAfSPR7ytFyN0UtIL90dS+nXkcN4L3ICEvRK9gpAPBEyzklGXl/Lz2DD
 bg0fadpRxNvgexXTaEqozYWxR36WENOxDYp6KdPE4bWpFRrS270/z3yY1fChEG4kRsCNEH+
 sM5FUlwuIXR0Xxm961Frg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:i5pXje0rV6w=;1Ujnq5tb+zNr7M3rsTtP+kZayRV
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

Thermal zone devices currently have no parent device, potentially
causing issues with suspend ordering and making it impossible for
user space appications to associate a given thermal zone device with
its parent device.

Extend the functions used to register thermal zone devices to also
accept a parent device pointer. Also update all users of those
functions to provide a parent device pointer if available.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 Documentation/driver-api/thermal/sysfs-api.rst     |  5 ++-
 drivers/acpi/thermal.c                             | 16 +++++---
 drivers/net/ethernet/chelsio/cxgb4/cxgb4_thermal.c |  4 +-
 drivers/net/ethernet/mellanox/mlxsw/core_thermal.c | 45 +++++++++++------=
=2D----
 drivers/net/wireless/intel/iwlwifi/mld/thermal.c   |  2 +-
 drivers/net/wireless/intel/iwlwifi/mvm/tt.c        | 10 ++---
 drivers/platform/x86/acerhdf.c                     |  2 +-
 drivers/power/supply/power_supply_core.c           |  4 +-
 drivers/thermal/armada_thermal.c                   |  2 +-
 drivers/thermal/da9062-thermal.c                   |  2 +-
 drivers/thermal/dove_thermal.c                     |  2 +-
 drivers/thermal/imx_thermal.c                      |  2 +-
 .../intel/int340x_thermal/int3400_thermal.c        |  2 +-
 .../intel/int340x_thermal/int340x_thermal_zone.c   | 13 +++----
 .../int340x_thermal/processor_thermal_device_pci.c |  7 ++--
 drivers/thermal/intel/intel_pch_thermal.c          |  2 +-
 drivers/thermal/intel/intel_quark_dts_thermal.c    |  2 +-
 drivers/thermal/intel/intel_soc_dts_iosf.c         |  2 +-
 drivers/thermal/intel/x86_pkg_temp_thermal.c       |  6 +--
 drivers/thermal/kirkwood_thermal.c                 |  2 +-
 drivers/thermal/renesas/rcar_thermal.c             | 10 +++--
 drivers/thermal/spear_thermal.c                    |  2 +-
 drivers/thermal/testing/zone.c                     |  2 +-
 drivers/thermal/thermal_core.c                     |  7 +++-
 drivers/thermal/thermal_of.c                       |  9 +++--
 include/linux/thermal.h                            |  4 ++
 26 files changed, 92 insertions(+), 74 deletions(-)

diff --git a/Documentation/driver-api/thermal/sysfs-api.rst b/Documentatio=
n/driver-api/thermal/sysfs-api.rst
index cf242cd16f2e..0a29bc949ef3 100644
=2D-- a/Documentation/driver-api/thermal/sysfs-api.rst
+++ b/Documentation/driver-api/thermal/sysfs-api.rst
@@ -37,7 +37,8 @@ temperature) and throttle appropriate devices.
     ::
=20
 	struct thermal_zone_device *
-	thermal_zone_device_register_with_trips(const char *type,
+	thermal_zone_device_register_with_trips(struct device *parent,
+                                        const char *type,
 					const struct thermal_trip *trips,
 					int num_trips, void *devdata,
 					const struct thermal_zone_device_ops *ops,
@@ -49,6 +50,8 @@ temperature) and throttle appropriate devices.
     /sys/class/thermal folder as `thermal_zone[0-*]`. It tries to bind al=
l the
     thermal cooling devices registered to it at the same time.
=20
+    parent:
+        parent device pointer.
     type:
 	the thermal zone type.
     trips:
diff --git a/drivers/acpi/thermal.c b/drivers/acpi/thermal.c
index 99ad67bbd764..483e28ce0d67 100644
=2D-- a/drivers/acpi/thermal.c
+++ b/drivers/acpi/thermal.c
@@ -607,16 +607,20 @@ static int acpi_thermal_register_thermal_zone(struct=
 acpi_thermal *tz,
 					      unsigned int trip_count,
 					      int passive_delay)
 {
+	unsigned int polling_delay =3D tz->polling_frequency * 100;
 	int result;
=20
 	if (trip_count)
-		tz->thermal_zone =3D thermal_zone_device_register_with_trips(
-					"acpitz", trip_table, trip_count, tz,
-					&acpi_thermal_zone_ops, NULL, passive_delay,
-					tz->polling_frequency * 100);
+		tz->thermal_zone =3D thermal_zone_device_register_with_trips(&tz->devic=
e->dev,
+									   "acpitz", trip_table,
+									   trip_count, tz,
+									   &acpi_thermal_zone_ops,
+									   NULL, passive_delay,
+									   polling_delay);
 	else
-		tz->thermal_zone =3D thermal_tripless_zone_device_register(
-					"acpitz", tz, &acpi_thermal_zone_ops, NULL);
+		tz->thermal_zone =3D thermal_tripless_zone_device_register(&tz->device-=
>dev, "acpitz",
+									 tz, &acpi_thermal_zone_ops,
+									 NULL);
=20
 	if (IS_ERR(tz->thermal_zone))
 		return PTR_ERR(tz->thermal_zone);
diff --git a/drivers/net/ethernet/chelsio/cxgb4/cxgb4_thermal.c b/drivers/=
net/ethernet/chelsio/cxgb4/cxgb4_thermal.c
index 7bab8da8f6e6..05a1ec7df7a5 100644
=2D-- a/drivers/net/ethernet/chelsio/cxgb4/cxgb4_thermal.c
+++ b/drivers/net/ethernet/chelsio/cxgb4/cxgb4_thermal.c
@@ -59,8 +59,8 @@ int cxgb4_thermal_init(struct adapter *adap)
 	}
=20
 	snprintf(ch_tz_name, sizeof(ch_tz_name), "cxgb4_%s", adap->name);
-	ch_thermal->tzdev =3D thermal_zone_device_register_with_trips(ch_tz_name=
, &trip, num_trip,
-								    adap,
+	ch_thermal->tzdev =3D thermal_zone_device_register_with_trips(adap->pdev=
_dev, ch_tz_name,
+								    &trip, num_trip, adap,
 								    &cxgb4_thermal_ops,
 								    NULL, 0, 0);
 	if (IS_ERR(ch_thermal->tzdev)) {
diff --git a/drivers/net/ethernet/mellanox/mlxsw/core_thermal.c b/drivers/=
net/ethernet/mellanox/mlxsw/core_thermal.c
index 1117d59b74fd..a1b1e9e8dd3d 100644
=2D-- a/drivers/net/ethernet/mellanox/mlxsw/core_thermal.c
+++ b/drivers/net/ethernet/mellanox/mlxsw/core_thermal.c
@@ -349,6 +349,8 @@ static const struct thermal_cooling_device_ops mlxsw_c=
ooling_ops =3D {
 static int
 mlxsw_thermal_module_tz_init(struct mlxsw_thermal_module *module_tz)
 {
+	unsigned int polling_delay =3D module_tz->parent->polling_delay;
+	struct device *dev =3D module_tz->parent->bus_info->dev;
 	char tz_name[40];
 	int err;
=20
@@ -358,14 +360,12 @@ mlxsw_thermal_module_tz_init(struct mlxsw_thermal_mo=
dule *module_tz)
 	else
 		snprintf(tz_name, sizeof(tz_name), "mlxsw-module%d",
 			 module_tz->module + 1);
-	module_tz->tzdev =3D thermal_zone_device_register_with_trips(tz_name,
-							module_tz->trips,
-							MLXSW_THERMAL_NUM_TRIPS,
-							module_tz,
-							&mlxsw_thermal_module_ops,
-							&mlxsw_thermal_params,
-							0,
-							module_tz->parent->polling_delay);
+	module_tz->tzdev =3D thermal_zone_device_register_with_trips(dev, tz_nam=
e, module_tz->trips,
+								   MLXSW_THERMAL_NUM_TRIPS,
+								   module_tz,
+								   &mlxsw_thermal_module_ops,
+								   &mlxsw_thermal_params, 0,
+								   polling_delay);
 	if (IS_ERR(module_tz->tzdev)) {
 		err =3D PTR_ERR(module_tz->tzdev);
 		return err;
@@ -466,6 +466,8 @@ mlxsw_thermal_modules_fini(struct mlxsw_thermal *therm=
al,
 static int
 mlxsw_thermal_gearbox_tz_init(struct mlxsw_thermal_module *gearbox_tz)
 {
+	unsigned int polling_delay =3D gearbox_tz->parent->polling_delay;
+	struct device *dev =3D gearbox_tz->parent->bus_info->dev;
 	char tz_name[40];
 	int ret;
=20
@@ -475,13 +477,13 @@ mlxsw_thermal_gearbox_tz_init(struct mlxsw_thermal_m=
odule *gearbox_tz)
 	else
 		snprintf(tz_name, sizeof(tz_name), "mlxsw-gearbox%d",
 			 gearbox_tz->module + 1);
-	gearbox_tz->tzdev =3D thermal_zone_device_register_with_trips(tz_name,
-						gearbox_tz->trips,
-						MLXSW_THERMAL_NUM_TRIPS,
-						gearbox_tz,
-						&mlxsw_thermal_gearbox_ops,
-						&mlxsw_thermal_params, 0,
-						gearbox_tz->parent->polling_delay);
+	gearbox_tz->tzdev =3D thermal_zone_device_register_with_trips(dev, tz_na=
me,
+								    gearbox_tz->trips,
+								    MLXSW_THERMAL_NUM_TRIPS,
+								    gearbox_tz,
+								    &mlxsw_thermal_gearbox_ops,
+								    &mlxsw_thermal_params, 0,
+								    polling_delay);
 	if (IS_ERR(gearbox_tz->tzdev))
 		return PTR_ERR(gearbox_tz->tzdev);
=20
@@ -709,13 +711,12 @@ int mlxsw_thermal_init(struct mlxsw_core *core,
 				 MLXSW_THERMAL_SLOW_POLL_INT :
 				 MLXSW_THERMAL_POLL_INT;
=20
-	thermal->tzdev =3D thermal_zone_device_register_with_trips("mlxsw",
-						      thermal->trips,
-						      MLXSW_THERMAL_NUM_TRIPS,
-						      thermal,
-						      &mlxsw_thermal_ops,
-						      &mlxsw_thermal_params, 0,
-						      thermal->polling_delay);
+	thermal->tzdev =3D thermal_zone_device_register_with_trips(dev, "mlxsw",
+								 thermal->trips,
+								 MLXSW_THERMAL_NUM_TRIPS,
+								 thermal, &mlxsw_thermal_ops,
+								 &mlxsw_thermal_params, 0,
+								 thermal->polling_delay);
 	if (IS_ERR(thermal->tzdev)) {
 		err =3D PTR_ERR(thermal->tzdev);
 		dev_err(dev, "Failed to register thermal zone\n");
diff --git a/drivers/net/wireless/intel/iwlwifi/mld/thermal.c b/drivers/ne=
t/wireless/intel/iwlwifi/mld/thermal.c
index 9e56e6e80ab7..56a0022d33db 100644
=2D-- a/drivers/net/wireless/intel/iwlwifi/mld/thermal.c
+++ b/drivers/net/wireless/intel/iwlwifi/mld/thermal.c
@@ -256,7 +256,7 @@ static void iwl_mld_thermal_zone_register(struct iwl_m=
ld *mld)
=20
 	sprintf(name, "iwlwifi_%u", atomic_inc_return(&counter) & 0xFF);
 	mld->tzone =3D
-		thermal_zone_device_register_with_trips(name, trips,
+		thermal_zone_device_register_with_trips(mld->dev, name, trips,
 							IWL_MAX_DTS_TRIPS,
 							mld, &tzone_ops,
 							NULL, 0, 0);
diff --git a/drivers/net/wireless/intel/iwlwifi/mvm/tt.c b/drivers/net/wir=
eless/intel/iwlwifi/mvm/tt.c
index b184f08230b9..e4777b815976 100644
=2D-- a/drivers/net/wireless/intel/iwlwifi/mvm/tt.c
+++ b/drivers/net/wireless/intel/iwlwifi/mvm/tt.c
@@ -672,11 +672,11 @@ static void iwl_mvm_thermal_zone_register(struct iwl=
_mvm *mvm)
 		mvm->tz_device.trips[i].type =3D THERMAL_TRIP_PASSIVE;
 		mvm->tz_device.trips[i].flags =3D THERMAL_TRIP_FLAG_RW_TEMP;
 	}
-	mvm->tz_device.tzone =3D thermal_zone_device_register_with_trips(name,
-							mvm->tz_device.trips,
-							IWL_MAX_DTS_TRIPS,
-							mvm, &tzone_ops,
-							NULL, 0, 0);
+	mvm->tz_device.tzone =3D thermal_zone_device_register_with_trips(mvm->de=
v, name,
+								       mvm->tz_device.trips,
+								       IWL_MAX_DTS_TRIPS,
+								       mvm, &tzone_ops,
+								       NULL, 0, 0);
 	if (IS_ERR(mvm->tz_device.tzone)) {
 		IWL_DEBUG_TEMP(mvm,
 			       "Failed to register to thermal zone (err =3D %ld)\n",
diff --git a/drivers/platform/x86/acerhdf.c b/drivers/platform/x86/acerhdf=
.c
index c74937d475e5..abdb5749c169 100644
=2D-- a/drivers/platform/x86/acerhdf.c
+++ b/drivers/platform/x86/acerhdf.c
@@ -656,7 +656,7 @@ static int __init acerhdf_register_thermal(void)
 	if (IS_ERR(cl_dev))
 		return -EINVAL;
=20
-	thz_dev =3D thermal_zone_device_register_with_trips("acerhdf", trips, AR=
RAY_SIZE(trips),
+	thz_dev =3D thermal_zone_device_register_with_trips(NULL, "acerhdf", tri=
ps, ARRAY_SIZE(trips),
 							  NULL, &acerhdf_dev_ops,
 							  &acerhdf_zone_params, 0,
 							  (kernelmode) ? interval*1000 : 0);
diff --git a/drivers/power/supply/power_supply_core.c b/drivers/power/supp=
ly/power_supply_core.c
index 9a28381e2607..cbc4bed17efa 100644
=2D-- a/drivers/power/supply/power_supply_core.c
+++ b/drivers/power/supply/power_supply_core.c
@@ -1531,8 +1531,8 @@ static int psy_register_thermal(struct power_supply =
*psy)
 		struct thermal_zone_params tzp =3D {
 			.no_hwmon =3D IS_ENABLED(CONFIG_POWER_SUPPLY_HWMON)
 		};
-		psy->tzd =3D thermal_tripless_zone_device_register(psy->desc->name,
-				psy, &psy_tzd_ops, &tzp);
+		psy->tzd =3D thermal_tripless_zone_device_register(&psy->dev, psy->desc=
->name, psy,
+								 &psy_tzd_ops, &tzp);
 		if (IS_ERR(psy->tzd))
 			return PTR_ERR(psy->tzd);
 		ret =3D thermal_zone_device_enable(psy->tzd);
diff --git a/drivers/thermal/armada_thermal.c b/drivers/thermal/armada_the=
rmal.c
index c2fbdb534f61..fc60b0bab627 100644
=2D-- a/drivers/thermal/armada_thermal.c
+++ b/drivers/thermal/armada_thermal.c
@@ -871,7 +871,7 @@ static int armada_thermal_probe(struct platform_device=
 *pdev)
 		/* Wait the sensors to be valid */
 		armada_wait_sensor_validity(priv);
=20
-		tz =3D thermal_tripless_zone_device_register(priv->zone_name,
+		tz =3D thermal_tripless_zone_device_register(&pdev->dev, priv->zone_nam=
e,
 							   priv, &legacy_ops,
 							   NULL);
 		if (IS_ERR(tz)) {
diff --git a/drivers/thermal/da9062-thermal.c b/drivers/thermal/da9062-the=
rmal.c
index a8d4b766ba21..c5368c2b53b9 100644
=2D-- a/drivers/thermal/da9062-thermal.c
+++ b/drivers/thermal/da9062-thermal.c
@@ -196,7 +196,7 @@ static int da9062_thermal_probe(struct platform_device=
 *pdev)
 	INIT_DELAYED_WORK(&thermal->work, da9062_thermal_poll_on);
 	mutex_init(&thermal->lock);
=20
-	thermal->zone =3D thermal_zone_device_register_with_trips(thermal->confi=
g->name,
+	thermal->zone =3D thermal_zone_device_register_with_trips(&pdev->dev, th=
ermal->config->name,
 								trips, ARRAY_SIZE(trips), thermal,
 								&da9062_thermal_ops, NULL, pp_tmp,
 								0);
diff --git a/drivers/thermal/dove_thermal.c b/drivers/thermal/dove_thermal=
.c
index 723bc72f0626..101c6109b04a 100644
=2D-- a/drivers/thermal/dove_thermal.c
+++ b/drivers/thermal/dove_thermal.c
@@ -139,7 +139,7 @@ static int dove_thermal_probe(struct platform_device *=
pdev)
 		return ret;
 	}
=20
-	thermal =3D thermal_tripless_zone_device_register("dove_thermal", priv,
+	thermal =3D thermal_tripless_zone_device_register(&pdev->dev, "dove_ther=
mal", priv,
 							&ops, NULL);
 	if (IS_ERR(thermal)) {
 		dev_err(&pdev->dev,
diff --git a/drivers/thermal/imx_thermal.c b/drivers/thermal/imx_thermal.c
index 38c993d1bcb3..043e80756017 100644
=2D-- a/drivers/thermal/imx_thermal.c
+++ b/drivers/thermal/imx_thermal.c
@@ -679,7 +679,7 @@ static int imx_thermal_probe(struct platform_device *p=
dev)
 		goto legacy_cleanup;
 	}
=20
-	data->tz =3D thermal_zone_device_register_with_trips("imx_thermal_zone",
+	data->tz =3D thermal_zone_device_register_with_trips(dev, "imx_thermal_z=
one",
 							   trips,
 							   ARRAY_SIZE(trips),
 							   data,
diff --git a/drivers/thermal/intel/int340x_thermal/int3400_thermal.c b/dri=
vers/thermal/intel/int340x_thermal/int3400_thermal.c
index 41d3bc3ed8a2..ed21da8f0a47 100644
=2D-- a/drivers/thermal/intel/int340x_thermal/int3400_thermal.c
+++ b/drivers/thermal/intel/int340x_thermal/int3400_thermal.c
@@ -594,7 +594,7 @@ static int int3400_thermal_probe(struct platform_devic=
e *pdev)
=20
 	evaluate_odvp(priv);
=20
-	priv->thermal =3D thermal_tripless_zone_device_register("INT3400 Thermal=
", priv,
+	priv->thermal =3D thermal_tripless_zone_device_register(&pdev->dev, "INT=
3400 Thermal", priv,
 							      &int3400_thermal_ops,
 							      &int3400_thermal_params);
 	if (IS_ERR(priv->thermal)) {
diff --git a/drivers/thermal/intel/int340x_thermal/int340x_thermal_zone.c =
b/drivers/thermal/intel/int340x_thermal/int340x_thermal_zone.c
index 3d9efe69d562..3adccb7fc157 100644
=2D-- a/drivers/thermal/intel/int340x_thermal/int340x_thermal_zone.c
+++ b/drivers/thermal/intel/int340x_thermal/int340x_thermal_zone.c
@@ -160,13 +160,12 @@ struct int34x_thermal_zone *int340x_thermal_zone_add=
(struct acpi_device *adev,
=20
 	int34x_zone->lpat_table =3D acpi_lpat_get_conversion_table(adev->handle)=
;
=20
-	int34x_zone->zone =3D thermal_zone_device_register_with_trips(
-							acpi_device_bid(adev),
-							zone_trips, trip_cnt,
-							int34x_zone,
-							&zone_ops,
-							&int340x_thermal_params,
-							0, 0);
+	int34x_zone->zone =3D thermal_zone_device_register_with_trips(&adev->dev=
,
+								    acpi_device_bid(adev),
+								    zone_trips, trip_cnt,
+								    int34x_zone, &zone_ops,
+								    &int340x_thermal_params,
+								    0, 0);
 	kfree(zone_trips);
=20
 	if (IS_ERR(int34x_zone->zone)) {
diff --git a/drivers/thermal/intel/int340x_thermal/processor_thermal_devic=
e_pci.c b/drivers/thermal/intel/int340x_thermal/processor_thermal_device_p=
ci.c
index 0d4dcc66e097..2b3116e23fa1 100644
=2D-- a/drivers/thermal/intel/int340x_thermal/processor_thermal_device_pci=
.c
+++ b/drivers/thermal/intel/int340x_thermal/processor_thermal_device_pci.c
@@ -371,10 +371,9 @@ static int proc_thermal_pci_probe(struct pci_dev *pde=
v, const struct pci_device_
=20
 	psv_trip.temperature =3D get_trip_temp(pci_info);
=20
-	pci_info->tzone =3D thermal_zone_device_register_with_trips("TCPU_PCI", =
&psv_trip,
-							1, pci_info,
-							&tzone_ops,
-							&tzone_params, 0, 0);
+	pci_info->tzone =3D thermal_zone_device_register_with_trips(&pdev->dev, =
"TCPU_PCI", &psv_trip,
+								  1, pci_info, &tzone_ops,
+								  &tzone_params, 0, 0);
 	if (IS_ERR(pci_info->tzone)) {
 		ret =3D PTR_ERR(pci_info->tzone);
 		goto err_del_legacy;
diff --git a/drivers/thermal/intel/intel_pch_thermal.c b/drivers/thermal/i=
ntel/intel_pch_thermal.c
index fc326985796c..754527b2b09a 100644
=2D-- a/drivers/thermal/intel/intel_pch_thermal.c
+++ b/drivers/thermal/intel/intel_pch_thermal.c
@@ -235,7 +235,7 @@ static int intel_pch_thermal_probe(struct pci_dev *pde=
v,
=20
 	nr_trips +=3D pch_wpt_add_acpi_psv_trip(ptd, &ptd_trips[nr_trips]);
=20
-	ptd->tzd =3D thermal_zone_device_register_with_trips(board_names[board_i=
d],
+	ptd->tzd =3D thermal_zone_device_register_with_trips(&pdev->dev, board_n=
ames[board_id],
 							   ptd_trips, nr_trips,
 							   ptd, &tzd_ops,
 							   NULL, 0, 0);
diff --git a/drivers/thermal/intel/intel_quark_dts_thermal.c b/drivers/the=
rmal/intel/intel_quark_dts_thermal.c
index 89498eb29a89..d8d38b6ed452 100644
=2D-- a/drivers/thermal/intel/intel_quark_dts_thermal.c
+++ b/drivers/thermal/intel/intel_quark_dts_thermal.c
@@ -376,7 +376,7 @@ static struct soc_sensor_entry *alloc_soc_dts(void)
 	trips[QRK_DTS_ID_TP_HOT].temperature =3D get_trip_temp(QRK_DTS_ID_TP_HOT=
);
 	trips[QRK_DTS_ID_TP_HOT].type =3D THERMAL_TRIP_HOT;
=20
-	aux_entry->tzone =3D thermal_zone_device_register_with_trips("quark_dts"=
,
+	aux_entry->tzone =3D thermal_zone_device_register_with_trips(NULL, "quar=
k_dts",
 								   trips,
 								   QRK_MAX_DTS_TRIPS,
 								   aux_entry,
diff --git a/drivers/thermal/intel/intel_soc_dts_iosf.c b/drivers/thermal/=
intel/intel_soc_dts_iosf.c
index ea87439fe7a9..74638dac75e6 100644
=2D-- a/drivers/thermal/intel/intel_soc_dts_iosf.c
+++ b/drivers/thermal/intel/intel_soc_dts_iosf.c
@@ -230,7 +230,7 @@ static int add_dts_thermal_zone(int id, struct intel_s=
oc_dts_sensor_entry *dts,
 		}
 	}
 	snprintf(name, sizeof(name), "soc_dts%d", id);
-	dts->tzone =3D thermal_zone_device_register_with_trips(name, trips,
+	dts->tzone =3D thermal_zone_device_register_with_trips(NULL, name, trips=
,
 							     SOC_MAX_DTS_TRIPS,
 							     dts, &tzone_ops,
 							     NULL, 0, 0);
diff --git a/drivers/thermal/intel/x86_pkg_temp_thermal.c b/drivers/therma=
l/intel/x86_pkg_temp_thermal.c
index 3fc679b6f11b..807126dc4bea 100644
=2D-- a/drivers/thermal/intel/x86_pkg_temp_thermal.c
+++ b/drivers/thermal/intel/x86_pkg_temp_thermal.c
@@ -342,9 +342,9 @@ static int pkg_temp_thermal_device_add(unsigned int cp=
u)
=20
 	INIT_DELAYED_WORK(&zonedev->work, pkg_temp_thermal_threshold_work_fn);
 	zonedev->cpu =3D cpu;
-	zonedev->tzone =3D thermal_zone_device_register_with_trips("x86_pkg_temp=
",
-			trips, thres_count,
-			zonedev, &tzone_ops, &pkg_temp_tz_params, 0, 0);
+	zonedev->tzone =3D thermal_zone_device_register_with_trips(NULL, "x86_pk=
g_temp", trips,
+								 thres_count, zonedev, &tzone_ops,
+								 &pkg_temp_tz_params, 0, 0);
 	if (IS_ERR(zonedev->tzone)) {
 		err =3D PTR_ERR(zonedev->tzone);
 		goto out_kfree_zonedev;
diff --git a/drivers/thermal/kirkwood_thermal.c b/drivers/thermal/kirkwood=
_thermal.c
index 4619e090f756..4827ad2bdb49 100644
=2D-- a/drivers/thermal/kirkwood_thermal.c
+++ b/drivers/thermal/kirkwood_thermal.c
@@ -71,7 +71,7 @@ static int kirkwood_thermal_probe(struct platform_device=
 *pdev)
 	if (IS_ERR(priv->sensor))
 		return PTR_ERR(priv->sensor);
=20
-	thermal =3D thermal_tripless_zone_device_register("kirkwood_thermal",
+	thermal =3D thermal_tripless_zone_device_register(&pdev->dev, "kirkwood_=
thermal",
 							priv, &ops, NULL);
 	if (IS_ERR(thermal)) {
 		dev_err(&pdev->dev,
diff --git a/drivers/thermal/renesas/rcar_thermal.c b/drivers/thermal/rene=
sas/rcar_thermal.c
index fdd7afdc4ff6..3d228e4c7b09 100644
=2D-- a/drivers/thermal/renesas/rcar_thermal.c
+++ b/drivers/thermal/renesas/rcar_thermal.c
@@ -488,10 +488,12 @@ static int rcar_thermal_probe(struct platform_device=
 *pdev)
 						dev, i, priv,
 						&rcar_thermal_zone_ops);
 		} else {
-			priv->zone =3D thermal_zone_device_register_with_trips(
-				"rcar_thermal", trips, ARRAY_SIZE(trips), priv,
-						&rcar_thermal_zone_ops, NULL, 0,
-						idle);
+			priv->zone =3D thermal_zone_device_register_with_trips(dev, "rcar_ther=
mal",
+									     trips,
+									     ARRAY_SIZE(trips),
+									     priv,
+									     &rcar_thermal_zone_ops,
+									     NULL, 0, idle);
=20
 			ret =3D thermal_zone_device_enable(priv->zone);
 			if (ret) {
diff --git a/drivers/thermal/spear_thermal.c b/drivers/thermal/spear_therm=
al.c
index 603dadcd3df5..c5bba9d600d4 100644
=2D-- a/drivers/thermal/spear_thermal.c
+++ b/drivers/thermal/spear_thermal.c
@@ -122,7 +122,7 @@ static int spear_thermal_probe(struct platform_device =
*pdev)
 	stdev->flags =3D val;
 	writel_relaxed(stdev->flags, stdev->thermal_base);
=20
-	spear_thermal =3D thermal_tripless_zone_device_register("spear_thermal",
+	spear_thermal =3D thermal_tripless_zone_device_register(&pdev->dev, "spe=
ar_thermal",
 							      stdev, &ops, NULL);
 	if (IS_ERR(spear_thermal)) {
 		dev_err(&pdev->dev, "thermal zone device is NULL\n");
diff --git a/drivers/thermal/testing/zone.c b/drivers/thermal/testing/zone=
.c
index c12c405225bb..5a7e9969582e 100644
=2D-- a/drivers/thermal/testing/zone.c
+++ b/drivers/thermal/testing/zone.c
@@ -402,7 +402,7 @@ static int tt_zone_register_tz(struct tt_thermal_zone =
*tt_zone)
=20
 	tt_zone->tz_temp =3D tt_zone->temp;
=20
-	tz =3D thermal_zone_device_register_with_trips("test_tz", trips, i, tt_z=
one,
+	tz =3D thermal_zone_device_register_with_trips(NULL, "test_tz", trips, i=
, tt_zone,
 						     &tt_zone_ops, NULL, 0, 0);
 	if (IS_ERR(tz))
 		return PTR_ERR(tz);
diff --git a/drivers/thermal/thermal_core.c b/drivers/thermal/thermal_core=
.c
index 92e51d2e4535..9d8499999579 100644
=2D-- a/drivers/thermal/thermal_core.c
+++ b/drivers/thermal/thermal_core.c
@@ -1475,6 +1475,7 @@ static void thermal_zone_init_complete(struct therma=
l_zone_device *tz)
=20
 /**
  * thermal_zone_device_register_with_trips() - register a new thermal zon=
e device
+ * @parent:	parent device pointer
  * @type:	the thermal zone device type
  * @trips:	a pointer to an array of thermal trips
  * @num_trips:	the number of trip points the thermal zone support
@@ -1498,7 +1499,7 @@ static void thermal_zone_init_complete(struct therma=
l_zone_device *tz)
  * IS_ERR*() helpers.
  */
 struct thermal_zone_device *
-thermal_zone_device_register_with_trips(const char *type,
+thermal_zone_device_register_with_trips(struct device *parent, const char=
 *type,
 					const struct thermal_trip *trips,
 					int num_trips, void *devdata,
 					const struct thermal_zone_device_ops *ops,
@@ -1576,6 +1577,7 @@ thermal_zone_device_register_with_trips(const char *=
type,
 		tz->ops.critical =3D thermal_zone_device_critical;
=20
 	tz->device.class =3D thermal_class;
+	tz->device.parent =3D parent;
 	tz->devdata =3D devdata;
 	tz->num_trips =3D num_trips;
 	for_each_trip_desc(tz, td) {
@@ -1651,12 +1653,13 @@ thermal_zone_device_register_with_trips(const char=
 *type,
 EXPORT_SYMBOL_GPL(thermal_zone_device_register_with_trips);
=20
 struct thermal_zone_device *thermal_tripless_zone_device_register(
+					struct device *parent,
 					const char *type,
 					void *devdata,
 					const struct thermal_zone_device_ops *ops,
 					const struct thermal_zone_params *tzp)
 {
-	return thermal_zone_device_register_with_trips(type, NULL, 0, devdata,
+	return thermal_zone_device_register_with_trips(parent, type, NULL, 0, de=
vdata,
 						       ops, tzp, 0, 0);
 }
 EXPORT_SYMBOL_GPL(thermal_tripless_zone_device_register);
diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
index 1a51a4d240ff..e3359ca20d77 100644
=2D-- a/drivers/thermal/thermal_of.c
+++ b/drivers/thermal/thermal_of.c
@@ -354,6 +354,7 @@ static void thermal_of_zone_unregister(struct thermal_=
zone_device *tz)
  * zone properties and registers new thermal zone with those
  * properties.
  *
+ * @parent: parent device pointer
  * @sensor: A device node pointer corresponding to the sensor in the devi=
ce tree
  * @id: An integer as sensor identifier
  * @data: A private data to be stored in the thermal zone dedicated priva=
te area
@@ -364,7 +365,9 @@ static void thermal_of_zone_unregister(struct thermal_=
zone_device *tz)
  *	- ENOMEM: if one structure can not be allocated
  *	- Other negative errors are returned by the underlying called function=
s
  */
-static struct thermal_zone_device *thermal_of_zone_register(struct device=
_node *sensor, int id, void *data,
+static struct thermal_zone_device *thermal_of_zone_register(struct device=
 *parent,
+							    struct device_node *sensor,
+							    int id, void *data,
 							    const struct thermal_zone_device_ops *ops)
 {
 	struct thermal_zone_device_ops of_ops =3D *ops;
@@ -412,7 +415,7 @@ static struct thermal_zone_device *thermal_of_zone_reg=
ister(struct device_node *
 			of_ops.critical =3D thermal_zone_device_critical_shutdown;
 	}
=20
-	tz =3D thermal_zone_device_register_with_trips(np->name, trips, ntrips,
+	tz =3D thermal_zone_device_register_with_trips(parent, np->name, trips, =
ntrips,
 						     data, &of_ops, &tzp,
 						     pdelay, delay);
 	if (IS_ERR(tz)) {
@@ -478,7 +481,7 @@ struct thermal_zone_device *devm_thermal_of_zone_regis=
ter(struct device *dev, in
 	if (!ptr)
 		return ERR_PTR(-ENOMEM);
=20
-	tzd =3D thermal_of_zone_register(dev->of_node, sensor_id, data, ops);
+	tzd =3D thermal_of_zone_register(dev, dev->of_node, sensor_id, data, ops=
);
 	if (IS_ERR(tzd)) {
 		devres_free(ptr);
 		return tzd;
diff --git a/include/linux/thermal.h b/include/linux/thermal.h
index 29a608bf5f80..0c5a91313bd5 100644
=2D-- a/include/linux/thermal.h
+++ b/include/linux/thermal.h
@@ -226,6 +226,7 @@ int thermal_zone_get_crit_temp(struct thermal_zone_dev=
ice *tz, int *temp);
=20
 #ifdef CONFIG_THERMAL
 struct thermal_zone_device *thermal_zone_device_register_with_trips(
+					struct device *parent,
 					const char *type,
 					const struct thermal_trip *trips,
 					int num_trips, void *devdata,
@@ -235,6 +236,7 @@ struct thermal_zone_device *thermal_zone_device_regist=
er_with_trips(
 					unsigned int polling_delay);
=20
 struct thermal_zone_device *thermal_tripless_zone_device_register(
+					struct device *parent,
 					const char *type,
 					void *devdata,
 					const struct thermal_zone_device_ops *ops,
@@ -276,6 +278,7 @@ int thermal_zone_device_disable(struct thermal_zone_de=
vice *tz);
 void thermal_zone_device_critical(struct thermal_zone_device *tz);
 #else
 static inline struct thermal_zone_device *thermal_zone_device_register_wi=
th_trips(
+					struct device *parent,
 					const char *type,
 					const struct thermal_trip *trips,
 					int num_trips, void *devdata,
@@ -285,6 +288,7 @@ static inline struct thermal_zone_device *thermal_zone=
_device_register_with_trip
 { return ERR_PTR(-ENODEV); }
=20
 static inline struct thermal_zone_device *thermal_tripless_zone_device_re=
gister(
+					struct device *parent,
 					const char *type,
 					void *devdata,
 					struct thermal_zone_device_ops *ops,

=2D-=20
2.39.5

