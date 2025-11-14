Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5FDC5B17D
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 04:24:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CE3C10E991;
	Fri, 14 Nov 2025 03:24:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=w_armin@gmx.de header.b="Z9GFXIEi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7447610E991
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 03:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1763090652; x=1763695452; i=w_armin@gmx.de;
 bh=eaVKqe10jzGoKFaLYje3vU37/s2NKQBvZXfmlKCsGAc=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=Z9GFXIEiHD6GIQIfXsMI4ndi0xeystmd+2fQGVLSOpHDISyy/7h/qiqsCv7i25Wy
 z4j0p14XnJEGt5Z8dUqTKoXqG1SdzA8Kyals3GRZIoH7QlJyw/tKCL/4qNtNwp97l
 iDnhEc4Olz0I2ltP1lwYM6V2+GQ2bG+hB51FV5d7QGh+5ExIYYrucEg1fBen8XAtw
 1giP6F8l7QpCD9KJJHOMHpBRXQ3+/20tNBp7NHnOftsI+6hh8j14AHHv3Xv22Uyv1
 RyncRUfh7xaezaE3tCuVB/ymca+9jJOZDtKEc3H+TeOVKO2yz5M0xQ3Q2XnwWAfA8
 /6JESqnKWIq2BWjL+g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([93.202.247.91]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MKKYx-1vcFwC23YN-00MX1X; Fri, 14
 Nov 2025 04:24:11 +0100
From: Armin Wolf <W_Armin@gmx.de>
Date: Fri, 14 Nov 2025 04:23:04 +0100
Subject: [PATCH RFC 3/8] ACPI: processor: Stop creating "device" sysfs link
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <20251114-thermal-device-v1-3-d8b442aae38b@gmx.de>
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
X-Provags-ID: V03:K1:nPhVaIWI4Qq4tuVB45WFPPKBJ/CGwZWVPg6Gt8tmT9A+FbWxAtE
 Ga2PcMjf7l6TmkQjRQ3DFYFE90GnC+dErsnnwPmuKj78/C4sD9b5HrIRgH196Q1c0m0ofUi
 EBPGWPUk4nGDUtf4BPr+Xv0RNEWUzTg2mVcokune5EpyI2qHlLVTUkezu/BzR1w7FmlPmmH
 fMjnazZjMw5aYR76qC7wg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ptx3nKX2J4Y=;2pTj6jvcQKwkyuEufzs5HT6bowS
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

