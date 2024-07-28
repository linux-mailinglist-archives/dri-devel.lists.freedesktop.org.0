Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5B393E4EA
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jul 2024 13:47:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 437C410E14A;
	Sun, 28 Jul 2024 11:47:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=wahrenst@gmx.net header.b="sj0ErC+W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB89D10E14A
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jul 2024 11:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
 s=s31663417; t=1722167242; x=1722772042; i=wahrenst@gmx.net;
 bh=VnHoX9D2vL8DbaLHX2BeVUbFhgz21D+r3BRC2GixxA0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=sj0ErC+WiDTXyb91zzTGbdMkY4+j7x8wsYN1DYvyXWOhqRUspyfTYKsD6gdFIy1/
 2DT8/wE6VN+Wb3WJURRusuFiFJtBx1FQGjcoA69xSE+YKNS2vAKMjR5Sepmcodd6P
 uMLjq0hYPYAaOXa67S3uxH6YgINEDm5txsBR5rsTuDxUDvqVZjrp6eOmrjLmQNYFJ
 bZCtyi5XiUKHrxm26R3AOZwwSs6cz+4+WvYOQR2JjGqzulgC5TrJtQxvoVxqibNvO
 2BcyhTpYasmBSJKmy+KBhliftjDuEyJ1d/4eqvtwelbT70D4TonxTncwZmMtMZoqt
 UkVcKX7aSm/f54lG5A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MQ5rU-1su7b82TWi-00RARj; Sun, 28
 Jul 2024 13:47:22 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Maxime Ripard <mripard@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Jiri Slaby <jirislaby@kernel.org>, Minas Harutyunyan <hminas@synopsys.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Lukas Wunner <lukas@wunner.de>,
 Artur Petrosyan <Arthur.Petrosyan@synopsys.com>,
 Peter Robinson <pbrobinson@gmail.com>, dri-devel@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com, linux-pm@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel-list@raspberrypi.com,
 Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V2 05/16] pmdomain: raspberrypi-power: set flag
 GENPD_FLAG_ACTIVE_WAKEUP
Date: Sun, 28 Jul 2024 13:41:49 +0200
Message-Id: <20240728114200.75559-6-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240728114200.75559-1-wahrenst@gmx.net>
References: <20240728114200.75559-1-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:uxKiXd6jwZWgXWEH6uC64rVTfCngHxgdOvyVH/WF2293Y1bqd/J
 g0oFNZ2i9C3d7IgzUd1/GQbUeBVl+bFscd2h8xXnAqiFtovevQWuF2o1xsy95bDQUAjzYfc
 NqPM0YMADF+60LN54UAeqLlk8l/3vhRAnjJ/Cvn0c5pK/ZRpowh9lsb0g9Rh6F70Kvj8L5/
 O5SZE8lUiQfDIVymrwAFg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ArETKKCQMyY=;dvGBSb/ARqZJQh44PUvPLFN88Dz
 6286irfK1ua0GW/CPFUMEEtBfcnPP6439cdsVyS4X8VZNxWdQf3daRG0IBNf+/VrThWdt9UH0
 hME1MX7KMFM+qanVUZ9EO/G5wnetgpmW9JITOS7b9ErDPJTz2ZELa4E16k0IpeMhuvYvZssIl
 xTpukwUofmY3Ai3gCSxmg7e0P02XOVzgFa7eD9XHFuPMdpF1JBe0eYUKuiYaW68o3k3Rcd1U+
 /VnoZ6TkPL4y8ImsPVdID6TQrevZLAS++vjvMuQpePAPg5MJkPHIBP8fyUp5grriyyTBzglhI
 K0e6YWPuG1dgvE9/bvQyWl3lYYgCXSqsnGmyUv6yVv5sjPdl0ixgoqkxAkpoG6bTSeJlDxygv
 nAYzho/evO5HE5Gs5E29d2ZBCOGtQakjvAo6w2oTF4zamZRRWuF7jPrOzhZILHMbLdNI0ZOPi
 Fe2rQ8nioA1Hp05/1MmninLBNCyzjDP82VuuosOw37nwbSGv8iCjubRHgFr0j+I/OEADvvnH2
 9lST4dpKySB6NiXgv5OGLrltD4SCmhWZpADU6phJguPK0wOGBbu9Kxf4VUM4grNOQKPgP5pu6
 C3g4T2E7Sr5X6A5mRi7dz0Lx3MFzbCoqzqT4ZoJfEmC1S56zecorxVacJt3Nfo3iXwHkYqEdR
 rfJHgeaUya0dJykXiEpbG41RcGEMCrqHG1QDH8Ir3N7zznZOf0sEKSiFsDwPnOm66Lvp5H4Bm
 gJozeZ0Pt8Sn5x0kr4SLKoxcodWTnPannGfRlc1wk9+2KtSJa33b5l2Da8BO+3/X7V1Btxb6M
 bfOBGVw3w8snLEOlRirJlJEw==
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

Set flag GENPD_FLAG_ACTIVE_WAKEUP to rpi_power genpd, then when a device
is set as wakeup source using device_set_wakeup_enable, the power
domain could be kept on to make sure the device could wakeup the system.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/pmdomain/bcm/raspberrypi-power.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pmdomain/bcm/raspberrypi-power.c b/drivers/pmdomain/b=
cm/raspberrypi-power.c
index fadedfc9c645..b87ea7adb7be 100644
=2D-- a/drivers/pmdomain/bcm/raspberrypi-power.c
+++ b/drivers/pmdomain/bcm/raspberrypi-power.c
@@ -91,6 +91,7 @@ static void rpi_common_init_power_domain(struct rpi_powe=
r_domains *rpi_domains,
 	dom->fw =3D rpi_domains->fw;

 	dom->base.name =3D name;
+	dom->base.flags =3D GENPD_FLAG_ACTIVE_WAKEUP;
 	dom->base.power_on =3D rpi_domain_on;
 	dom->base.power_off =3D rpi_domain_off;

=2D-
2.34.1

