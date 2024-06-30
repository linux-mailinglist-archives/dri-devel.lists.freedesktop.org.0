Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF36291D256
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2024 17:37:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5501C10E27B;
	Sun, 30 Jun 2024 15:37:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=wahrenst@gmx.net header.b="ep8yM1Uq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A83310E281
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jun 2024 15:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
 s=s31663417; t=1719761838; x=1720366638; i=wahrenst@gmx.net;
 bh=+rxQ791ubcSxhOIK3kEqE6IzwyoFm1gQrUg4Eh9bhfg=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=ep8yM1UqjNI4tYbUGxYXd3MWHdd7qpwG3ZkN+8Bb00WnDJx0khVHLkZA9LcxzS3R
 ociMgBcDCGrxxvuHZfBWVtVaMGPj50QAer6BMcyerrpNVl0O/EhKDqt7gtstfLPtw
 XIM/GvEGcubFQNYLTwAwZmiP9BwWtD/QoqY/cwjuFh72HdFpRcDisMlqKxTbM5+p0
 M5pWJvFc8YD3FzEalcfoaX2NkMWlUGsvIjmi7GoWBw4dsJCIk0WFN87axKNCGdHzE
 4KroQkD/cMQLzTbjpNJiUrc7woXa1KQjtRsY5F+hN0szsaSeOS7ihjbiqlatWeDT3
 k2sEiCiyniboX57PbA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N1wq3-1sH5tc3gcb-013lvq; Sun, 30
 Jun 2024 17:37:18 +0200
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
Subject: [PATCH 01/11] firmware: raspberrypi: Improve timeout warning
Date: Sun, 30 Jun 2024 17:36:42 +0200
Message-Id: <20240630153652.318882-2-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240630153652.318882-1-wahrenst@gmx.net>
References: <20240630153652.318882-1-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+fDSsr7/+1m0xx5jNNZO5K4aelCIX1oa9z/e7EF4bCJ/BqcX+/l
 GZB4P+Dbvny3hJik8esZBgJdKLMNoMLwRyuDU9g9cw7nCo6Niu37bmQS83d06fYvF821c51
 xt0tuKV93IfqN1Xco4x4g/807GrrMeshXjpmWMufSWbTQcuQ9m/i5yabx49vm/MS9bZWtD4
 QWgSi7beLjp8V/oAvMMKg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:qL3riX2MGg4=;D2/m4WXwE9Wy2ZsgCNs/qwYDp9R
 lSBIPwXiITay4NnuZ1BzTnJ6onPzOWqZ00kx5YARH9TP8jR0tjxOPf6a7VlPjbySxELwm0AlS
 R+CBtdyPakaNEQHdUaRdNkaeIyKqFnIud+Bpi6PqoOhyOKRMBv/0mu8GnY4C3JiEzuIdz+1EU
 LEhUirQ45fWoXvlx9u7jHbT4QHXQSSpgBA6bs7VN1KOwF2AP+9lbfAmEyDUBFM2nyJlQgSS+n
 e7cv+pFv/iQdaqD41ksPD3t6UaEHL6YLHPEzoICMpMIiYN7Y1jXoZRFn/3u4b7ctp1hNJRyJ+
 WboLv6atSIyjgrPCPDNXEADzkm5nrESe/2/MOGpp5nmHkhzYug+eHqPK73lzdmchS4LLm8Fr0
 +A0VkFy+VSOBl9qOaRKxog4ScP8Yf2IrvOj6oCuXsv5hxpiiOD2bt9L2yOcPr9T0enCW4o+gJ
 6sD+zcMzSEI4MBCKLVqJj7ueoX9kDfPOMuQ5kCCCnYmmGyZBsNTM0gePhzsTBMeiE8KUUPlB5
 awyGxW3T9NrvLGfpyyMVPC/vVq236X2tS4o6fwriTbIWYsbGmsxWfF/Q1crAFFKsp8Zv9Cz71
 9ZbOF0AzPlBDBrJuYPT7tAks0r3L3N/smARjTwD/Ua6FlYo0zek54GgroF7CFHMIuRWYMMstP
 nru+phMPCC8uYUcCOjixlBvp5lhTOgkQ8OyAsGuJDZouSG3Ln6ThWXcB04dWFidDhg/EcOylf
 F2Rsa8SulqGm/wOoyCclP1zhZnevUJBfPPrmiE48zbFnr/O16IaPuKJRM/gS0HWKECg7Ywzzv
 /pOMkfXgsHxNvJE5JzZpDu5oENBKoPLMf3phzmlUdypr8=
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

