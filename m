Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE194C720BD
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 04:42:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BE0E10E6E1;
	Thu, 20 Nov 2025 03:42:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=w_armin@gmx.de header.b="Idh70jWi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C698E10E6DF
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 03:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1763610100; x=1764214900; i=w_armin@gmx.de;
 bh=pFfE5rqjVgwE8wDghOzJXBN7RtoFvEZyfhpDnHJr1d0=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=Idh70jWiiPkbKHH0XoOecfXJmknT6hNE5449G+V3LMyn4IRRcNEannq6lrlhcShJ
 cArZjYgMPKzJXjhgfofSOFTDw/fwNkPC2GB+5+FjsocA52JFjReCNbPvBfwtsK1VZ
 TXc+V8CucfA+mugTvPczrYnU8jd7zXGkmbc8l/xYj7QULX5b6ivfR4H+wzGiAx690
 PvOZHF4ao3vUNdGa1DADB8pBFK4bvvOVMyvWzc2eu/l6jtv9jfQ9fPjy1cao0nell
 h9W03I2ahNZU23viBlh3D8CF0cSJp/ZElfabqrC12Jd99CRWcmDuA8OPVZjifnmlx
 ElDm13OIvb8KxWl8WQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([93.202.247.91]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MzQgC-1w8GuJ49qq-00xsos; Thu, 20
 Nov 2025 04:41:40 +0100
From: Armin Wolf <W_Armin@gmx.de>
Date: Thu, 20 Nov 2025 04:41:17 +0100
Subject: [PATCH RFC RESEND 7/8] ACPI: thermal: Stop creating "device" sysfs
 link
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <20251120-thermal-device-v1-7-bbdad594d57a@gmx.de>
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
X-Provags-ID: V03:K1:bKjOl416ZBvt0J4Z1ff2/VOM4YUuBr4pjrnuYziG/rC6UM9Bjrb
 iCAyo+RKmQkcq6atgUTHWnC+hoUqvDNqaFpc2OPzy5pIPPW4oHJPk1sK76vauvunauWsJI/
 rZWHUfcw+kkV+yp+4FePUCajckmPJ0U3pwygCJBQNPEV/qhghQjiEQylyxzO3A0H4gakZ/Q
 lbLGd8IWeIkZr7osImDhg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ZkUHQOrPw+U=;A3N6syoy2tdKzKe+2NJGnSYIA5n
 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
 9Mg1StAM=
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

The thermal core will soon automatically create sysfs links between
the thermal zone device and its parent device. Stop manually creating
the "device" sysfs link between the thermal zone device and the parent
device to avoid a name collision. The "thermal_zone" sysfs link
however stays for backwards compatibility, as it does not suffer
from a name collision.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/acpi/thermal.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/acpi/thermal.c b/drivers/acpi/thermal.c
index a511f9ea0267..99ad67bbd764 100644
=2D-- a/drivers/acpi/thermal.c
+++ b/drivers/acpi/thermal.c
@@ -592,27 +592,14 @@ static const struct thermal_zone_device_ops acpi_the=
rmal_zone_ops =3D {
 static int acpi_thermal_zone_sysfs_add(struct acpi_thermal *tz)
 {
 	struct device *tzdev =3D thermal_zone_device(tz->thermal_zone);
-	int ret;
=20
-	ret =3D sysfs_create_link(&tz->device->dev.kobj,
-				&tzdev->kobj, "thermal_zone");
-	if (ret)
-		return ret;
-
-	ret =3D sysfs_create_link(&tzdev->kobj,
-				   &tz->device->dev.kobj, "device");
-	if (ret)
-		sysfs_remove_link(&tz->device->dev.kobj, "thermal_zone");
-
-	return ret;
+	/* For backwards compatibility */
+	return sysfs_create_link(&tz->device->dev.kobj, &tzdev->kobj, "thermal_z=
one");
 }
=20
 static void acpi_thermal_zone_sysfs_remove(struct acpi_thermal *tz)
 {
-	struct device *tzdev =3D thermal_zone_device(tz->thermal_zone);
-
 	sysfs_remove_link(&tz->device->dev.kobj, "thermal_zone");
-	sysfs_remove_link(&tzdev->kobj, "device");
 }
=20
 static int acpi_thermal_register_thermal_zone(struct acpi_thermal *tz,

=2D-=20
2.39.5

