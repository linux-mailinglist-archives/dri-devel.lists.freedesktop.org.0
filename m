Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F7B93E4DF
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jul 2024 13:46:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62C2810E145;
	Sun, 28 Jul 2024 11:46:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=wahrenst@gmx.net header.b="mR3VAOxX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6935A10E145
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jul 2024 11:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
 s=s31663417; t=1722167177; x=1722771977; i=wahrenst@gmx.net;
 bh=MUjx857aVJb3m/BIq/jv+muXKfBK4aj/UlImOJhlQl0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=mR3VAOxXChhr2y7LUN+ckfBTyxpKYXrD+ni2xc2ekwneT+3Nxrve25RRfRAQseNg
 iUxkajNMtobvAhjbZJ1avjqGnNz0V8sd4ruz/mucpDTeIIpWKEZ9PfK95sWEbM+Jh
 bXWfezMbI1klArtufPyqG8jrw5q0GQXMJGDl6378a7zyyydP14l5iQoKJAjz4YTGu
 fZH+0veWGv+PdlBFltGuMwkxMpIPp1X6HFqd3yp+sxUlyVSpMlEe+XWnhiV30ZHEX
 uKvcTyoNeEF1qcFnyNPoSrgJ8YrGHsJvT+54b1fHQtrU4xWVy4bm/Ot4szevozmEl
 XpOTbWm1eTzML45r6A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MmULr-1rqPsW0GtF-00dMDw; Sun, 28
 Jul 2024 13:46:17 +0200
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
Subject: [PATCH V2 04/16] pmdomain: raspberrypi-power: Add logging to
 rpi_firmware_set_power
Date: Sun, 28 Jul 2024 13:41:48 +0200
Message-Id: <20240728114200.75559-5-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240728114200.75559-1-wahrenst@gmx.net>
References: <20240728114200.75559-1-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:4Eq85eFpyWQtoeOdYaR/mTT65Ogz1QD7be1K3QBHel9skaxonHe
 OTAXpGmln6oRRCUb9/Rjlq7p4feQmQFbl/SAJNdc6K3tBfH/XwL5ySYhaCKHVJ8AMka+AEC
 naQazZaWITnN7A+4GI63w6/SbHKS+wDSJIyDfA+yD6aBDfPaPGJzhTyiTMuWA4FtsIBZsI4
 wk5HudZs94o39xgwnJGjA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:03uvZQHg528=;rz4aTT//fenmms3Woof0gGSTyw+
 lUV/3KaQ/BCAmeLvITzlwih6WwNbnrcURhbeg4m5FWFK2r6jDeedK9NBm3xZ/XGX3FIl8VS1D
 mrGK8YDTI1IGBE4pvS7kGT5U0WimMZiFIoKqyp0Z00slHWDIjE8Ze+MJoH7Spm5Ms/r0fXcZM
 njL62H6glutmu73XxUXlygIHZ5Nce3blNtbeK8uWtrkIx2e8StH0bSqFVGpoxmBZ4k5XLBbOS
 aiD96Py/08eaEmpcqj7DAxWB0KGepe3cwQrDUh70IC7xmqmfi07vNtb1pv/Pfrh8KRiqgLnLO
 n1HfV7C2zZzxocir3JTxbBiRIELTDi7yV5Z2HKpHbb2uCRLjypFi0iAqYlMuAvDLDKgFJ8ng3
 In1BfsCXLUodpIXQz0MoO5Aeox1SQ58C+cyKk7pBQV32iIZWtET/OK8zZxYiDHXXzvz/h6HY3
 9yEA8LpP0IukjoVdd9hAGjzDLvXI8YZ5dWL5OHVSOyywPJwgRTuZ91av9AJCQClXp0KHfwMtZ
 /FPHJy9UTtdRf6hls9swB3PZPRltlLoxijv4xnPGgYhGJU31d+WozfpGMZsCI2xmwLlmbv57S
 B7mfxwkQd/fTc4j9/wHGjIBemKIS+G2yxIYFv3ebtTWwZGrlnyAvInGQMCCLH3+7kFBOejscA
 AvfEfw7SmEYERxHS4uRAfqCeV0UwXOgsb/HqKRdnfjJyDzprpf0a/qlXGGiDnOm63T7SPizDV
 Y4QorlDonW3GAamN3z5HYbnOF9c+P3Gy23RND8UT+gVc7qtzMA0yHhx22uyuFlG8OB1pCRItU
 wyj+ZF+XipA3X6ye5dQDm2mg==
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

The Raspberry Pi power driver heavily relies on the logging of the
underlying firmware driver. This results in disadvantages like unspecific
error messages or limited debugging options. So implement the logging for
the most important function rpi_firmware_set_power.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/pmdomain/bcm/raspberrypi-power.c | 34 ++++++++++++++----------
 1 file changed, 20 insertions(+), 14 deletions(-)

diff --git a/drivers/pmdomain/bcm/raspberrypi-power.c b/drivers/pmdomain/b=
cm/raspberrypi-power.c
index 39d9a52200c3..fadedfc9c645 100644
=2D-- a/drivers/pmdomain/bcm/raspberrypi-power.c
+++ b/drivers/pmdomain/bcm/raspberrypi-power.c
@@ -48,33 +48,39 @@ struct rpi_power_domain_packet {
  * Asks the firmware to enable or disable power on a specific power
  * domain.
  */
-static int rpi_firmware_set_power(struct rpi_power_domain *rpi_domain, bo=
ol on)
+static int rpi_firmware_set_power(struct generic_pm_domain *domain, bool =
on)
 {
+	struct rpi_power_domain *rpi_domain =3D
+		container_of(domain, struct rpi_power_domain, base);
+	bool old_interface =3D rpi_domain->old_interface;
 	struct rpi_power_domain_packet packet;
+	int ret;

 	packet.domain =3D rpi_domain->domain;
 	packet.state =3D on;
-	return rpi_firmware_property(rpi_domain->fw,
-				     rpi_domain->old_interface ?
-				     RPI_FIRMWARE_SET_POWER_STATE :
-				     RPI_FIRMWARE_SET_DOMAIN_STATE,
-				     &packet, sizeof(packet));
+
+	ret =3D rpi_firmware_property(rpi_domain->fw, old_interface ?
+				    RPI_FIRMWARE_SET_POWER_STATE :
+				    RPI_FIRMWARE_SET_DOMAIN_STATE,
+				    &packet, sizeof(packet));
+	if (ret)
+		dev_err(&domain->dev, "Failed to set %s to %u (%d)\n",
+			old_interface ? "power" : "domain", on, ret);
+	else
+		dev_dbg(&domain->dev, "Set %s to %u\n",
+			old_interface ? "power" : "domain", on);
+
+	return ret;
 }

 static int rpi_domain_off(struct generic_pm_domain *domain)
 {
-	struct rpi_power_domain *rpi_domain =3D
-		container_of(domain, struct rpi_power_domain, base);
-
-	return rpi_firmware_set_power(rpi_domain, false);
+	return rpi_firmware_set_power(domain, false);
 }

 static int rpi_domain_on(struct generic_pm_domain *domain)
 {
-	struct rpi_power_domain *rpi_domain =3D
-		container_of(domain, struct rpi_power_domain, base);
-
-	return rpi_firmware_set_power(rpi_domain, true);
+	return rpi_firmware_set_power(domain, true);
 }

 static void rpi_common_init_power_domain(struct rpi_power_domains *rpi_do=
mains,
=2D-
2.34.1

