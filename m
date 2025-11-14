Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D54EC5B17A
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 04:24:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAFBE10E130;
	Fri, 14 Nov 2025 03:24:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=w_armin@gmx.de header.b="fUotuPoo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9E4F10E130;
 Fri, 14 Nov 2025 03:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1763090639; x=1763695439; i=w_armin@gmx.de;
 bh=w2Nfv//wKfgQYjOWaBmhUaOG3ji2GxiPpvMEXNJkovk=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=fUotuPoo9kDgfaEgxcz1UVnfdU/jpQDk8z9QNKXMDbbqg84eJNrTQtYLEemQoZq1
 SNaf4fH865XwX0gdxiyLmffDeso8/n1GADy0Ignx7epQXMRPlOfiMCkMWdlA8U5A6
 RpAV+HL36dk7RmXRM6eO5vtF4Ur/cCC1Qb3TwXj/jPWwjvkXv8+q2+slrV/5LsvRV
 xT3HvtXb0YHKpQGZczRjYoONVR8mVO299joSVkbvS2ZtZjOR0nYWvLRBFUxH2PmYC
 gs5WAQanWytksOW55ea+ditRBWV66PP+C1b7lc3ivPR7CzXsSHkQL3m4XKvEmkwVv
 2Xf4DaxwEKiSXGAMUQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([93.202.247.91]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N8obG-1wDDKK4BnC-011sB0; Fri, 14
 Nov 2025 04:23:59 +0100
From: Armin Wolf <W_Armin@gmx.de>
Date: Fri, 14 Nov 2025 04:23:02 +0100
Subject: [PATCH RFC 1/8] thermal: core: Allow setting the parent device of
 cooling devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <20251114-thermal-device-v1-1-d8b442aae38b@gmx.de>
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
X-Provags-ID: V03:K1:mSKrbR/PpB4cKEZtRli5uJRA5PsxQB6bzPXbr64iliwB167lxtV
 MXj+h4FOluE2qT+jxMTIfWADFfP3cMnNpDgtZDD7yyo0Z1inewv5FqVl6yyP5keH+erbx2f
 Fy1f6jOIEhmAifYIerLXUIlgsX6lKdGa7B/G0qAei9X/5g3T9RP+G9XzBmrJNbhfGS5LZWq
 CUGG7jZ37voYEcBrXkPsw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:xb4yDnRZ9Rc=;bM8loMYjdW2jp+bd7MEagPw7+bv
 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
 WUIiBV7A=
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

Currently, cooling devices have no parent device, potentially causing
issues with suspend ordering and making it impossible for consumers
(thermal zones and userspace appications) to associate a given cooling
device with its parent device.

Extend __thermal_cooling_device_register() to also accept a parent
device pointer. For now only devm_thermal_of_cooling_device_register()
uses this, as the other wrapper functions need to be extended first.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/thermal/thermal_core.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/thermal/thermal_core.c b/drivers/thermal/thermal_core=
.c
index 17ca5c082643..c8b720194b44 100644
=2D-- a/drivers/thermal/thermal_core.c
+++ b/drivers/thermal/thermal_core.c
@@ -1040,6 +1040,7 @@ static void thermal_cooling_device_init_complete(str=
uct thermal_cooling_device *
=20
 /**
  * __thermal_cooling_device_register() - register a new thermal cooling d=
evice
+ * @parent:	parent device pointer.
  * @np:		a pointer to a device tree node.
  * @type:	the thermal cooling device type.
  * @devdata:	device private data.
@@ -1055,7 +1056,7 @@ static void thermal_cooling_device_init_complete(str=
uct thermal_cooling_device *
  * ERR_PTR. Caller must check return value with IS_ERR*() helpers.
  */
 static struct thermal_cooling_device *
-__thermal_cooling_device_register(struct device_node *np,
+__thermal_cooling_device_register(struct device *parent, struct device_no=
de *np,
 				  const char *type, void *devdata,
 				  const struct thermal_cooling_device_ops *ops)
 {
@@ -1092,6 +1093,7 @@ __thermal_cooling_device_register(struct device_node=
 *np,
 	cdev->ops =3D ops;
 	cdev->updated =3D false;
 	cdev->device.class =3D thermal_class;
+	cdev->device.parent =3D parent;
 	cdev->devdata =3D devdata;
=20
 	ret =3D cdev->ops->get_max_state(cdev, &cdev->max_state);
@@ -1158,7 +1160,7 @@ struct thermal_cooling_device *
 thermal_cooling_device_register(const char *type, void *devdata,
 				const struct thermal_cooling_device_ops *ops)
 {
-	return __thermal_cooling_device_register(NULL, type, devdata, ops);
+	return __thermal_cooling_device_register(NULL, NULL, type, devdata, ops)=
;
 }
 EXPORT_SYMBOL_GPL(thermal_cooling_device_register);
=20
@@ -1182,7 +1184,7 @@ thermal_of_cooling_device_register(struct device_nod=
e *np,
 				   const char *type, void *devdata,
 				   const struct thermal_cooling_device_ops *ops)
 {
-	return __thermal_cooling_device_register(np, type, devdata, ops);
+	return __thermal_cooling_device_register(NULL, np, type, devdata, ops);
 }
 EXPORT_SYMBOL_GPL(thermal_of_cooling_device_register);
=20
@@ -1222,7 +1224,7 @@ devm_thermal_of_cooling_device_register(struct devic=
e *dev,
 	if (!ptr)
 		return ERR_PTR(-ENOMEM);
=20
-	tcd =3D __thermal_cooling_device_register(np, type, devdata, ops);
+	tcd =3D __thermal_cooling_device_register(dev, np, type, devdata, ops);
 	if (IS_ERR(tcd)) {
 		devres_free(ptr);
 		return tcd;

=2D-=20
2.39.5

