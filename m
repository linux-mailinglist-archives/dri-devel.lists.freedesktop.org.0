Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F36C720CF
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 04:42:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52B1810E6E4;
	Thu, 20 Nov 2025 03:42:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=w_armin@gmx.de header.b="KDjFyoj2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A528910E6E4;
 Thu, 20 Nov 2025 03:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1763610094; x=1764214894; i=w_armin@gmx.de;
 bh=VnJc1wVkPejXYKABp7/OWh15nFmTDlawkMw9JltKC9I=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=KDjFyoj2r6cemWtMfOQJugnRt914OA553U08WJKAp7nWLB/3BfCDM+UKubnrCbgX
 3ZYu9MKaX2DtntYQcxhfXm3KQEJmII30u3dks0AJUY6JHDNB6V23/5VZe1Cg7BIBE
 LP2dA05nAwEo8JBORhirvSFAWg6rezhE3/HpsXEgwbm8YPbn2FX0x9Kigc2WL4rOA
 Q1pBbXTwNkoOLZvwbOlYI8tSvWuOf45JmI56RE6qx4K+Nmyzr+Do/i1sBFred00m+
 +cTwU/r0j0hDxqFgCVg7K+X5tMA8SHKMlEGvrqI8WSxpNpeuJgLgDgqGdN2T1V0xK
 /Y/CSQiqyb10Pow9oQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([93.202.247.91]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MF3DM-1vOAb73RvM-00DWVW; Thu, 20
 Nov 2025 04:41:34 +0100
From: Armin Wolf <W_Armin@gmx.de>
Date: Thu, 20 Nov 2025 04:41:15 +0100
Subject: [PATCH RFC RESEND 5/8] ACPI: video: Stop creating "device" sysfs link
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <20251120-thermal-device-v1-5-bbdad594d57a@gmx.de>
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
X-Provags-ID: V03:K1:D1QCdFWiMAVc69sXgpBcLxZTEqSCMtApo9gaoIgtrkYwIsaC54H
 5XPcDCLC39HGgKUC0oyhvvs0DtBjmapqZH4CJu7OrXg8kd0fUQMgOm7exWuMcG3o2xs2Hsl
 QF4MN/6LvWvdHWz/9nR9kAvpxLcLBAoBxKWF8ddzX6U5M10Gx/gOb4+u8PWW05NSyER5cJA
 ok+pjHrA/djPtZYYbjpMg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:68WoUg+dG98=;uduIoWxBGOyxwRLWZfB3GJ44X9x
 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
 Ya56k2tc=
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
the cooling device and its parent device. Stop manually creating
the "device" sysfs link between the cooling device and the parent
device to avoid a name collision. The "thermal_cooling" sysfs link
however stays for backwards compatibility, as it does not suffer
from a name collision.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/acpi/acpi_video.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/acpi/acpi_video.c b/drivers/acpi/acpi_video.c
index be8e7e18abca..658e11745523 100644
=2D-- a/drivers/acpi/acpi_video.c
+++ b/drivers/acpi/acpi_video.c
@@ -1774,16 +1774,12 @@ static void acpi_video_dev_register_backlight(stru=
ct acpi_video_device *device)
=20
 	dev_info(&device->dev->dev, "registered as cooling_device%d\n",
 		 device->cooling_dev->id);
+	/* For backwards compatibility */
 	result =3D sysfs_create_link(&device->dev->dev.kobj,
 			&device->cooling_dev->device.kobj,
 			"thermal_cooling");
 	if (result)
 		pr_info("sysfs link creation failed\n");
-
-	result =3D sysfs_create_link(&device->cooling_dev->device.kobj,
-			&device->dev->dev.kobj, "device");
-	if (result)
-		pr_info("Reverse sysfs link creation failed\n");
 }
=20
 static void acpi_video_run_bcl_for_osi(struct acpi_video_bus *video)
@@ -1852,7 +1848,6 @@ static void acpi_video_dev_unregister_backlight(stru=
ct acpi_video_device *device
 	}
 	if (device->cooling_dev) {
 		sysfs_remove_link(&device->dev->dev.kobj, "thermal_cooling");
-		sysfs_remove_link(&device->cooling_dev->device.kobj, "device");
 		thermal_cooling_device_unregister(device->cooling_dev);
 		device->cooling_dev =3D NULL;
 	}

=2D-=20
2.39.5

