Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE2193E4CD
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jul 2024 13:43:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE47110E13E;
	Sun, 28 Jul 2024 11:43:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=wahrenst@gmx.net header.b="QVaxeNA8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EE5610E13E
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jul 2024 11:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
 s=s31663417; t=1722166990; x=1722771790; i=wahrenst@gmx.net;
 bh=5K5kBAdZCWeAsANsjCXXlgQc+q/qI1OkuEhMl0S3/Ys=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=QVaxeNA8glaMedGkqwJdzoQdFmy60h9oEHd+j8ZQXDknrUgEgsk1RxU5fDrvPTma
 XpT7tg6/VoEAThfg6Q5CTw7jw0lsaj4g5U2+NsSVvaeqLSpqtRoXv+AmBWa5bV6Md
 Lg9EvRHa1sirsh9i7Nk3PSk7oik8KOJFMKuWZTxUXSPDDdNSU6DvAm5ymmP8buXze
 7q2PQ1nwL0EAl6W5tDWLeGpf8pacRTCzIAAxh4FN7StCzOJz+BDdVHLiYI4zO2SQB
 o4zZzw+CKPJ8y8VnSGPxFvHoIlnmNEvmPSYwaCMd9SGI8qPt9VQQWCIkarrWDMmvD
 fkwOKHEDy1poP7UsmQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M1poA-1saEA22Pua-00AZgY; Sun, 28
 Jul 2024 13:43:10 +0200
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
Subject: [PATCH V2 01/16] firmware: raspberrypi: Improve timeout warning
Date: Sun, 28 Jul 2024 13:41:45 +0200
Message-Id: <20240728114200.75559-2-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240728114200.75559-1-wahrenst@gmx.net>
References: <20240728114200.75559-1-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:FVA7jnUYemg65bMAN/KzrSjeUZ7AIaT5urGSfhIox8kocVwgT2/
 hh458humeGIY15HoUPJuOHuKer7xspVDz2r2LAKAfyEv1BoOW46hwaLFIFQwNw/07F6+xOw
 mBz189fmXQ5hGReyTveqQq8SOtVAh4zvRizne3aSe+wq61N+bv+Em3NA/vrzpYsGA1JOoIU
 9t/V7UjaYw88aDrvu1YxQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:vccvTtuL2Z4=;Ona6kUu/3UswlH5eKiIBueW/r4Y
 BSZW0yIqmScj8IABKZA2mHIvKMVVQmMetWaxD+Q4CQOAMXirv3HDRFS2/PC0Oh+Ny4Y/4sSMo
 fBuvXYF2gdz9mICoLrZqOwuJcytkRpAgYHy03CzMHJfZM5577gyanz4RjkYRjj/BBMCbTSp4A
 j1iSwg0kfbLDrtaMGM0D9RiJU9v5/rzoqKXv4s3EMLkw0dLNF40JyGB5wiMN68J7PHsaiAqOR
 kgSm1V1/TN3ejUE6VnZqyUU5B8jRekuSmIYEAijH56MwNJy35e46zk8MLwyNfUVz+C9AGeOoy
 nDzEJU+AnwrDSDsxnSOPOuRfzdjOzW2PSDvmOvH3iBxo7Vg+J1+L2SEapxvAxRg19uUOcKG/Q
 ZUHA0Z3Tv9gAOjv99QhR2uE733tnO+7L/l/afzGo/eG1Ro5+ldtd/tcAkkgn7lJBmwmcNV4R3
 gBNQE3kABrlE3MnxqRxiyvLi+LFh9UFAKU1x4q6+BII7/P5mjrEYWRW9mzfEjiOJucAgAQtNL
 TCGRTHZ4QT5GxcCKp/KPVdue7lB+l4IcYbJ6r9ZJEYrN3pMzUZMRdC0JjAB8lmmANB7iWrdvK
 P4+TLXiunHl1RZ/nxq2ilajPvUSEZ4KcGmx7YkNAwP/SaGwPSxpOYxnpSxtpzkqdHaYtbIo9N
 /qSWujAvC39FpWiqp3caDigDKfMj0xRY1nMKzGLqgW9mLolHKuZ6J/WH/ezlRFgtSs8/IDwLc
 gdahJV1U4XH0lkTHgI3zAihBfQY/MZeOWTiC/h2dT1DIxWokXdsKfDS7OPJ6R5NpkgQ/nxuUG
 C/nPfrr9oT+au5fPnBfCob9Q==
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

Recent work on raspberry-power driver showed that even the
stacktrace on firmware property timeout doesn't provide
enough information. So add the first tag name to the warning
to be in line with a status error.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
=2D--
 drivers/firmware/raspberrypi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi=
.c
index ac34876a97f8..18cc34987108 100644
=2D-- a/drivers/firmware/raspberrypi.c
+++ b/drivers/firmware/raspberrypi.c
@@ -62,7 +62,6 @@ rpi_firmware_transaction(struct rpi_firmware *fw, u32 ch=
an, u32 data)
 			ret =3D 0;
 		} else {
 			ret =3D -ETIMEDOUT;
-			WARN_ONCE(1, "Firmware transaction timeout");
 		}
 	} else {
 		dev_err(fw->cl.dev, "mbox_send_message returned %d\n", ret);
@@ -125,6 +124,8 @@ int rpi_firmware_property_list(struct rpi_firmware *fw=
,
 		dev_err(fw->cl.dev, "Request 0x%08x returned status 0x%08x\n",
 			buf[2], buf[1]);
 		ret =3D -EINVAL;
+	} else if (ret =3D=3D -ETIMEDOUT) {
+		WARN_ONCE(1, "Firmware transaction 0x%08x timeout", buf[2]);
 	}

 	dma_free_coherent(fw->chan->mbox->dev, PAGE_ALIGN(size), buf, bus_addr);
=2D-
2.34.1

