Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5560C720AE
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 04:41:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B73110E6DD;
	Thu, 20 Nov 2025 03:41:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=w_armin@gmx.de header.b="EOn+R5//";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F18E210E634;
 Thu, 20 Nov 2025 03:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1763610091; x=1764214891; i=w_armin@gmx.de;
 bh=ga4ZSQNtXRGTyPFXPVELIcbloWPa75MxGJnVt/55XyM=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=EOn+R5//M8SghF1pxoBl4DF1CshAsb7kfXSfuIYPEW07lqhiGNKjZtxM9ZYhG6yJ
 2tHra962kVeqwQzuHIwGcXVSlm8/+Fjyi9E5jhRunDBT1J24Gh3CffGdHZuAoSOR6
 sq77XokmIGYOBEdZoR+SUwfBvYvh/GjyGlB0pMAjB1bO/x6Qh/lu9ETDtOFPcFRgf
 HmdnJAhj0IPn8/MCFWRbNJ2v+V8fb+mGB1cbhqHshqcVBj/A+LiVrzBgIwA9zlg7K
 /o8mwI3zviWydIjsJqb7tJpYQ1Xe3yY6xptL+XI1I89WbfO7qZb6PSzoIaY6meFR1
 33EpS+vx9pFqqpWMPw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([93.202.247.91]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N8XU1-1wHNaF32GX-016RXf; Thu, 20
 Nov 2025 04:41:30 +0100
From: Armin Wolf <W_Armin@gmx.de>
Date: Thu, 20 Nov 2025 04:41:14 +0100
Subject: [PATCH RFC RESEND 4/8] ACPI: fan: Stop creating "device" sysfs
 link
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <20251120-thermal-device-v1-4-bbdad594d57a@gmx.de>
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
X-Provags-ID: V03:K1:jOw+sOFfjscZyERSR8LzbJHICCC7AMyDna5FT0LSbS+jIdyVL9K
 MzSry+XzMAir58qYJuVEU+4AiucvOmjmRB3fD/7bZWzLRzarwie1hgHP3AemzO71AEf5133
 pe1hwkxzb8eIptCxkdIcnA2g82gEn+d8vrwIa5O926wNciQYczMQqd/EjI2RpgLUCbrWliF
 KKGdbgQp5Pood0pe4Bcdw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:xQIYqpfOuu0=;VNlgRbY/LUzaCfnN32pudHsVbyW
 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
 bjSlw1Se/lXD7ycgWyb2zc97FlOq7
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
 drivers/acpi/fan_core.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/acpi/fan_core.c b/drivers/acpi/fan_core.c
index fb08b8549ed7..2ca3e347f15c 100644
=2D-- a/drivers/acpi/fan_core.c
+++ b/drivers/acpi/fan_core.c
@@ -594,6 +594,7 @@ static int acpi_fan_probe(struct platform_device *pdev=
)
 	dev_dbg(&pdev->dev, "registered as cooling_device%d\n", cdev->id);
=20
 	fan->cdev =3D cdev;
+	/* For backwards compatibility */
 	result =3D sysfs_create_link(&pdev->dev.kobj,
 				   &cdev->device.kobj,
 				   "thermal_cooling");
@@ -602,18 +603,8 @@ static int acpi_fan_probe(struct platform_device *pde=
v)
 		goto err_unregister;
 	}
=20
-	result =3D sysfs_create_link(&cdev->device.kobj,
-				   &pdev->dev.kobj,
-				   "device");
-	if (result) {
-		dev_err(&pdev->dev, "Failed to create sysfs link 'device'\n");
-		goto err_remove_link;
-	}
-
 	return 0;
=20
-err_remove_link:
-	sysfs_remove_link(&pdev->dev.kobj, "thermal_cooling");
 err_unregister:
 	thermal_cooling_device_unregister(cdev);
 err_end:
@@ -633,7 +624,6 @@ static void acpi_fan_remove(struct platform_device *pd=
ev)
 		acpi_fan_delete_attributes(device);
 	}
 	sysfs_remove_link(&pdev->dev.kobj, "thermal_cooling");
-	sysfs_remove_link(&fan->cdev->device.kobj, "device");
 	thermal_cooling_device_unregister(fan->cdev);
 }
=20

=2D-=20
2.39.5

