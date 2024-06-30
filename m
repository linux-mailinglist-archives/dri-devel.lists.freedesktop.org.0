Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BBD91D2D2
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2024 18:53:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B075B10E075;
	Sun, 30 Jun 2024 16:53:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=wahrenst@gmx.net header.b="co+khgJL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 650CD10E075
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jun 2024 16:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
 s=s31663417; t=1719766404; x=1720371204; i=wahrenst@gmx.net;
 bh=x6X/JBGaDbXhfz2zCdgdBC9Xbw9KpBWry+heZSf/vYw=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=co+khgJLL3I35VMjh/AKMVnmw3JPmoSsHTQRnoawNenZfKo4FyiEzMwGWe1Sy5ww
 hR6AIrhO3oh4hFkXrLHHIVlDKTHomfo+fUc9AghNyCeJ9vhJOlIY+y4cEWcsYXoKN
 jJbugRnYLl3ly/aZKQDKzTEYtRCDlHfOntQcuuyl6f5rbhfgOLi8pvDqJomIT+rIN
 rFJ0n/l1jY4QzzL+QQQYkR7VMcTigBfxsxmffxDjXVcLlK1pXB6B2Ap5yPDs1pt6O
 gxTquMIZsvzELOGK3xlLE2qJiFGQqMyLJs8dMXlWkq+zpeE2nf/ZQnNSWhPr3O/q8
 73J0RYsy35yFwRUTzw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M3lcJ-1sOEv12IFf-002P3U; Sun, 30
 Jun 2024 18:53:24 +0200
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
Subject: [PATCH RFT 10/11] serial: 8250_bcm2835aux: add PM suspend/resume
 support
Date: Sun, 30 Jun 2024 18:53:04 +0200
Message-Id: <20240630165304.323095-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240630153652.318882-1-wahrenst@gmx.net>
References: <20240630153652.318882-1-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:4gFUJsAqzBEe0Ecm192F+EOC5bzkfojzIoxo17BhwwQMZSUayGA
 aoHR3ququVF0cAZgp0qNUz+67nJI3An977H1iEQn0dvfqUUSZAkNJd0Cge4khmOjgHPODAW
 3fxZ+TBPZSHDWvrKdOb4YOn8Fkz6nb9woQGsYOtRjr1UmI7SgLZLatvKan1jOGJjZvJFbI6
 7huOwk+6E0lfTHXsikFhg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:RC+tt6aEpOI=;1EW8hiWdl4BGJhJ4wQfv5AMukc5
 ZEeVMD/okghGbmPzVHi0APqS3iWRMF1wKmhloRCbelkkAJn1Sm/Vvn98lJFrOzCO8urP9Ygwf
 gTGkYWjIAoUo8NoZxBxrnGWJ0joi+LCicWuTtMarXVr9yCRFBjr+kbHObjc/yjO+7UKcTz3WZ
 0py2ifYsEsJaE/bLO/eRuYgiAQOP6nNhG0gb0vuEwzd5k7VA+lZ0FmqdBtIj5CAI4KqwGpxSb
 Jyfyb6rmrTvDA9fC59hAa8gIXjwklPT087BiLt5G4Fgv5w1vimzAwe/IoKJbOCSSzGKUhnvVJ
 XHyjbnG5Pd8CEJzi7YHIxwgNJj57kAYuki3Xkdij4zXwkXmWFKaCPpL/SJJ7gkJAsnGQgKmkF
 poizMB35wx89493MKT/E+8eV4pOz2sVuvfjBHdNtc1SeeMnVCYrzw+2TIm1ZpTTRixdX4pbuE
 VUZQl2RvlJXPD1tjKhRxKik0gCjl/T5Hk1YBLRr1c9fwlU0pXl3VhEGLxbcVNEJruDnfezGtQ
 iqOhszlDM/1ldUPLzejAS8R5LT5rqeIu9FYPuU1okh2BR9ub3faug8JzYAG6IsomotgU2Zmpd
 ATf0m6AoTiMqz1pzNBy4tvJAdviKXJxbJT56dx1kr+uMEGFpvVI4j2+wce8zFCDtlv/csnJ4h
 eKP62EVipAK/KdjNrNwXfDPhTxngwEcTpbIrC+pvGnEjeXWTPjYQcTniJfZZ+dDMVzN9cupV4
 54a+7MHBLu69HLRnHUiGt6VepISknaHu2CTqbxPxaV8jqRQgv6KmwFuGunm9LdtKqTKcvsbW8
 2ku5nTDp+OHzRjSaFTyFL3dYB3fj1Xy2+wJgUs1cWGQnE=
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

This adds suspend/resume support for the 8250_bcm2835aux
driver to provide power management support on attached
devices.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--

Since i don't have a RS485 setup, any test feedback would be great.

 drivers/tty/serial/8250/8250_bcm2835aux.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_bcm2835aux.c b/drivers/tty/seria=
l/8250/8250_bcm2835aux.c
index 121a5ce86050..cccd2a09cb6f 100644
=2D-- a/drivers/tty/serial/8250/8250_bcm2835aux.c
+++ b/drivers/tty/serial/8250/8250_bcm2835aux.c
@@ -213,11 +213,34 @@ static const struct acpi_device_id bcm2835aux_serial=
_acpi_match[] =3D {
 };
 MODULE_DEVICE_TABLE(acpi, bcm2835aux_serial_acpi_match);

+static int __maybe_unused bcm2835aux_suspend(struct device *dev)
+{
+	struct bcm2835aux_data *data =3D dev_get_drvdata(dev);
+
+	serial8250_suspend_port(data->line);
+
+	return 0;
+}
+
+static int __maybe_unused bcm2835aux_resume(struct device *dev)
+{
+	struct bcm2835aux_data *data =3D dev_get_drvdata(dev);
+
+	serial8250_resume_port(data->line);
+
+	return 0;
+}
+
+static const struct dev_pm_ops bcm2835aux_dev_pm_ops =3D {
+	SET_SYSTEM_SLEEP_PM_OPS(bcm2835aux_suspend, bcm2835aux_resume)
+};
+
 static struct platform_driver bcm2835aux_serial_driver =3D {
 	.driver =3D {
 		.name =3D "bcm2835-aux-uart",
 		.of_match_table =3D bcm2835aux_serial_match,
 		.acpi_match_table =3D bcm2835aux_serial_acpi_match,
+		.pm =3D &bcm2835aux_dev_pm_ops,
 	},
 	.probe  =3D bcm2835aux_serial_probe,
 	.remove_new =3D bcm2835aux_serial_remove,
=2D-
2.34.1

