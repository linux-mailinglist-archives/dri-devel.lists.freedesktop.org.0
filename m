Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5386C72099
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 04:41:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0065E10E6DE;
	Thu, 20 Nov 2025 03:41:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=w_armin@gmx.de header.b="QI/Fub52";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA2AF10E6DF
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 03:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1763610082; x=1764214882; i=w_armin@gmx.de;
 bh=w2Nfv//wKfgQYjOWaBmhUaOG3ji2GxiPpvMEXNJkovk=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=QI/Fub525wDohQgrQZJy5ZGp8vcwn40gJOPbT3X67Wz3mcytu+sSkKm+/liAXaF/
 ze5WJNam4JEBz9EvtkmEzVyuR57mBKFa9Jqt1l7RuJOJaqTil8BSmZQm2pK/X1nXE
 haJGM77SqXmQY7+kQVVFyy8y0wqfCsnSmnLuWJUOVJotxqk3p0intCgNvuDa5Ju6e
 Yt/pILqQOXJIspRJxtrPtGdM37tHWRemFt/RMkc6/8kmbqqg1dSse/LkXsZ31awVL
 YEDEvZYeHzsDif/aKGKSFsZiQ53dxNiF3ripIR4vdnr6GBhiZfrbvMXp6iQYit5JP
 eQhthGQgTH/PDrHChA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([93.202.247.91]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MMXUN-1vcDTi2rZ9-00LXG9; Thu, 20
 Nov 2025 04:41:21 +0100
From: Armin Wolf <W_Armin@gmx.de>
Date: Thu, 20 Nov 2025 04:41:11 +0100
Subject: [PATCH RFC RESEND 1/8] thermal: core: Allow setting the parent
 device of cooling devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <20251120-thermal-device-v1-1-bbdad594d57a@gmx.de>
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
X-Provags-ID: V03:K1:DWBT/C9r0u0GJbnfM2x6xD+VPAcKYxVi3FSehphoX9P+PP9QP40
 H1l/LJwjFLMySZKWql7wwYEqHZyDutpIpBTgGBKEh2J88LfH30owsDkDNqR6bHSrBuTRbf6
 Kl+PZlhIRv/dziKbjlpllqBNeLTfwcmKKbnRw5NROE93Ahsf+EfgRcHUnCNUJXv4F+hTDU4
 HyxqaIXpHJbzFhFdy/jiA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ysKf264By68=;oa9a8ZuzYONRxmuvwwbz4iIX39i
 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
 /UEweJKU=
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

