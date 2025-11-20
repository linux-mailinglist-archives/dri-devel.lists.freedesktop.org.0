Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BED25C72096
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 04:41:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3C8610E6DC;
	Thu, 20 Nov 2025 03:41:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=w_armin@gmx.de header.b="Th3qEvxj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A072310E6DB;
 Thu, 20 Nov 2025 03:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1763610088; x=1764214888; i=w_armin@gmx.de;
 bh=eaVKqe10jzGoKFaLYje3vU37/s2NKQBvZXfmlKCsGAc=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=Th3qEvxjewQqwXU/xhaHf5Ll1f8Vp8hBfOK6ybKV+U8vWmZTNhjyZWr/LYz6vWOd
 jJjt15/HvTqKN6IR11Yflx/J2I6FDe4kvKwSv8+gd4uDm4wVJAejJsA4myAmpJnxy
 fWZk8pFU0UBuZv4PWCkd06l/35/0b7QxK/QVqRNjBwmesQvAdg3uCvFzYsc4vjOTW
 T+LHsCiFrnKYsWhUwxubAI9QsLGdpMHXIcIJhap7ed6KuDbLwSB6ixBPaXFAlia6l
 8cy8vL1bGxsmAtiECsWBbXs7EoZrplOJZJ4l+JmgAFeOVC8+GKA6qGLFnRDtdluH7
 wjWZyc4ZexuDePU9zw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([93.202.247.91]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N4QsY-1wJpsv3tLC-013yhI; Thu, 20
 Nov 2025 04:41:28 +0100
From: Armin Wolf <W_Armin@gmx.de>
Date: Thu, 20 Nov 2025 04:41:13 +0100
Subject: [PATCH RFC RESEND 3/8] ACPI: processor: Stop creating "device"
 sysfs link
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <20251120-thermal-device-v1-3-bbdad594d57a@gmx.de>
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
X-Provags-ID: V03:K1:SWQ7IvrI1KL+iiz0txNAGiZfu9T4bhUbIqbVkWpgAXS65gy5YI/
 YpmPXK4L/gpxGPYeuwRV/AIKDjUHbK87+XzAxo1gN/fgEBjKLM4pE4OD69RumNUFc9r8kcI
 sxvQmo7/wJKWnUEvF6ubDkMCaTYLJdRy5Q29YlNoxLRgJglIdMJPUVl0vGHV4OUHhy84V/E
 TQhrWPU3+/kbcnUkEmkqA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:HjK8xIrgeAI=;j9mCg/IYDC1FMwnexbAW9LuTo8N
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

The thermal core will soon automatically create sysfs links between
the cooling device and its parent device. Stop manually creating
the "device" sysfs link between the cooling device and the parent
device to avoid a name collision. The "thermal_cooling" sysfs link
however stays for backwards compatibility, as it does not suffer
from a name collision.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/acpi/processor_thermal.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/acpi/processor_thermal.c b/drivers/acpi/processor_the=
rmal.c
index c7b1dc5687ec..1ff10321eac5 100644
=2D-- a/drivers/acpi/processor_thermal.c
+++ b/drivers/acpi/processor_thermal.c
@@ -323,6 +323,7 @@ int acpi_processor_thermal_init(struct acpi_processor =
*pr,
 	dev_dbg(&device->dev, "registered as cooling_device%d\n",
 		pr->cdev->id);
=20
+	/* For backwards compatibility */
 	result =3D sysfs_create_link(&device->dev.kobj,
 				   &pr->cdev->device.kobj,
 				   "thermal_cooling");
@@ -332,19 +333,8 @@ int acpi_processor_thermal_init(struct acpi_processor=
 *pr,
 		goto err_thermal_unregister;
 	}
=20
-	result =3D sysfs_create_link(&pr->cdev->device.kobj,
-				   &device->dev.kobj,
-				   "device");
-	if (result) {
-		dev_err(&pr->cdev->device,
-			"Failed to create sysfs link 'device'\n");
-		goto err_remove_sysfs_thermal;
-	}
-
 	return 0;
=20
-err_remove_sysfs_thermal:
-	sysfs_remove_link(&device->dev.kobj, "thermal_cooling");
 err_thermal_unregister:
 	thermal_cooling_device_unregister(pr->cdev);
=20
@@ -356,7 +346,6 @@ void acpi_processor_thermal_exit(struct acpi_processor=
 *pr,
 {
 	if (pr->cdev) {
 		sysfs_remove_link(&device->dev.kobj, "thermal_cooling");
-		sysfs_remove_link(&pr->cdev->device.kobj, "device");
 		thermal_cooling_device_unregister(pr->cdev);
 		pr->cdev =3D NULL;
 	}

=2D-=20
2.39.5

