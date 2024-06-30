Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C62591D263
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2024 17:38:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87C2110E2A2;
	Sun, 30 Jun 2024 15:38:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=wahrenst@gmx.net header.b="o7ZIFkdy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 136CA10E298
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jun 2024 15:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
 s=s31663417; t=1719761840; x=1720366640; i=wahrenst@gmx.net;
 bh=uvy/JYKDHmXcPICPfORiHDhkAZe5s5Om1p3LDeO8diw=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=o7ZIFkdyeolSFgsqSlg9F/907y+3/o7oltU/Jq7EwFbSxRgN9WmwgYBH7zyUedaA
 iX5zayU7f5hw1XFRSfb9dJzB2C4L0atfWCnUIEfmZHGbb7YnrQFDYKThhhlyaWmDX
 Zfe4+6HdzhCMfMgdM6bqCm/DumILbrYhN3daXBiqKp2A2fWg0lNSV/qWv8daZ+Wxf
 1XS3snIsP2fA4YDE7wBWZMQfnUC9/vmP3TFSBoZEw2KrK5q2dJasPZNgW1j8gSm8v
 GEq5qLwVKmGWYqBPnG02Nwc42bd07SX5Zt7eZERafXerVIstRn862hdo4gu4rjLQt
 9A/c57oZjPZ1k0BmJg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MdvmO-1rqXH42uNa-00ZIdt; Sun, 30
 Jun 2024 17:37:20 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Jiri Slaby <jirislaby@kernel.org>,
 Minas Harutyunyan <hminas@synopsys.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Lukas Wunner <lukas@wunner.de>,
 Peter Robinson <pbrobinson@gmail.com>, dri-devel@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com, linux-pm@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel-list@raspberrypi.com,
 Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 04/11] pmdomain: raspberrypi-power: Avoid powering down USB
Date: Sun, 30 Jun 2024 17:36:45 +0200
Message-Id: <20240630153652.318882-5-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240630153652.318882-1-wahrenst@gmx.net>
References: <20240630153652.318882-1-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:22tg+yWWqKf6rCi94aIzD/RkT7pXmbRAAhSxwf6W8WcCzyNMjbd
 j47KQebfJCVLSl1XFpvwPcIB8kmB6vxytQOXHOoKX8vpukqcVyRvtoMxZctNIgUXZrZsbyP
 M1Ez1s8XIAFhhBqA7HoCa2qTcc9wcGRMyyFUoiMebKnLHrL9JQpT3spS1oOrMAtG46pk3fq
 T3JonfyI1KZaJXlZvgoog==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:o0N5jBQm4iM=;q+71ifQ2Zv2GDZeVPGzKI9bBQMg
 ITd5Q5iGfSSBWp1p+vKU/AGRKQRK0/1CRitQt627JVfEC+5K6pRuadGo6eJOMsKAtbFZqNVeQ
 lhOHahQLH8rAycR2oLJcj0QWrzH5OOQU7p5oHeG7WHkQUjEV7W2HoPpZtw32Wv8AsteukZPvG
 a6wu0r60xiYh3Lam5CeGSMxW7GhxYmMT2zDlu7YJUDRmUcEHSBDoUgHZ+y7dTSQexufltzMTL
 emG8cSNkyd+S8kvewoKGpWsxttU/+FVoim/lSrB4Mm/mPkQD8FB8IcE0Ya+AJFZ9WW06WkfY1
 9Cm+rrfNlrIs3Q6DR5Q3G91yw2KJBgfJlu6bznnvx/y8FmfMXIN5Ygq4lr6UdN4ikQrc5H1xi
 PMGylNcIWhchhU0R+n7gFWY0CqlJ4uYg64gukNxTkjQBTj0yCYl3ZKNsFejBbArpGOl80JJh6
 5L5kNRFt2yD8M/OTHGO+AuxATLHgDbkr564L9MOXV1jEXJQF9F/mdQnumfsiG1HjsltqT9qDE
 4o/QkeaB4AINfhLyW3lHskid4rPKLH+PosKU4BEUgu6XKT2Y9tPCPifMB/EKQ/Rdy+qDeLl+t
 9yrd8eQqAUTSCoxynVkqNmNB4+q7CqSg4EFEvJlYPoVy6BSGJREeU0NBCl9HrvMCCwxfV6sgK
 /m8zFFKSppQdn1yn07r0fSXPNCxYYRMfXHEPNr0WzFarq3I+ceGxHfAn81QWO72P87aBTA314
 o0pgOZ6eaWF/eBiPrBqPlKePK0OPlurpagJ9qr/Wbgr6sxEX75mWLGZr2biwlnyHRmz4fUAz5
 tV4WK6UkzNRqhEgrwXuILugRk3uih7RHVUhbDt44Wg690=
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

During supend to idle any request to power off the USB domain
leads to a timeout. As a temporary workaround don't register
the relevant power off handler.

Link: https://github.com/raspberrypi/firmware/issues/1894
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/pmdomain/bcm/raspberrypi-power.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/pmdomain/bcm/raspberrypi-power.c b/drivers/pmdomain/b=
cm/raspberrypi-power.c
index 39d9a52200c3..3e7b84006acc 100644
=2D-- a/drivers/pmdomain/bcm/raspberrypi-power.c
+++ b/drivers/pmdomain/bcm/raspberrypi-power.c
@@ -86,7 +86,14 @@ static void rpi_common_init_power_domain(struct rpi_pow=
er_domains *rpi_domains,

 	dom->base.name =3D name;
 	dom->base.power_on =3D rpi_domain_on;
-	dom->base.power_off =3D rpi_domain_off;
+
+	/*
+	 * During supend to idle any request to power off the USB domain
+	 * leads to a timeout. As a temporary workaround don't register
+	 * the relevant power off handler.
+	 */
+	if (strcmp("USB", name))
+		dom->base.power_off =3D rpi_domain_off;

 	/*
 	 * Treat all power domains as off at boot.
=2D-
2.34.1

