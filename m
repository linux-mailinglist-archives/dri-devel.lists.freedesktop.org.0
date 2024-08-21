Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BDC95A6D6
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 23:41:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 061CB10E6E5;
	Wed, 21 Aug 2024 21:41:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=wahrenst@gmx.net header.b="Cvg0iNSD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81CB410E5D5
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2024 21:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
 s=s31663417; t=1724276469; x=1724881269; i=wahrenst@gmx.net;
 bh=CYaxw6OqWnumzsOX4pTskLMeKldjXRkPxVS7XND9ynA=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=Cvg0iNSD3lobwyOQRxY3291ZvZ3RzXe8nCiwTo+VaSa+C2WrqN41eduqE3ScOQq/
 Soz+iMTaoNbAT+n5tia/IPtaPCi+xQxhR36xtlwq4rh3nJ8iYm2wz0hT4aT8X2Mkg
 ogUTSXaMQUpvRfKYTK97HMxbh0iuEq9cAIJMFb2+RGLrtWrBV+c1gknboUS2fmCHO
 Ba/+tmlqXlNR0VLfVGBmThLT/SiE2/toGRaajt6BhwtMRM5M969XVx4xikoVNO45f
 YJ+1hAfOKYp3sImcq+7hRi2bw4z/HnYYEF5ZflBT1cUZadm4VJXVisoer5L33ITEM
 4Pc6c4ePXzwBVypdxA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M2O2W-1shQF919va-0034DI; Wed, 21
 Aug 2024 23:41:09 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Russell King <linux@armlinux.org.uk>,
 Doug Anderson <dianders@chromium.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Maxime Ripard <mripard@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Minas Harutyunyan <hminas@synopsys.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Lukas Wunner <lukas@wunner.de>,
 Artur Petrosyan <Arthur.Petrosyan@synopsys.com>,
 Peter Robinson <pbrobinson@gmail.com>, dri-devel@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com, linux-pm@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel-list@raspberrypi.com, Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V3 5/9] drm/vc4: v3d: simplify clock retrieval
Date: Wed, 21 Aug 2024 23:40:48 +0200
Message-Id: <20240821214052.6800-6-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240821214052.6800-1-wahrenst@gmx.net>
References: <20240821214052.6800-1-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:h/VZtsIWcUY12L1wpbcwbKWJ694UX0+mLRWUIBBvEgAAesXyQrv
 1s3VjliBqbjqDa7UOwwHdMamlBfrLd8f1xAnXbC8rBDV6XiJrIrMkSaY5cX6o/LXt4Kq7+R
 RCqB8+/HahurNItDvIwMTOy5x36m8UgUNUD2J0bPyDoI7F1jNYD1w3ozSBFpIpnOay0M26X
 QIJ5OdwUtJCb15T5xWk7g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Fc0XG+t8WVo=;0+sC399aSpdqdN6OijPXgeXP1lM
 37ojsJGp+Or4UHep3zHle090l7QrITFyo28t/VW1ePLPcOuMcNJPHBONnn3DMeZkovivi/71s
 xmuCe043h+oXZANUaOi9rKuMXHfpaUXfCqJjQwN5d3n0sgTiGAHLx2m7FFyDMLqEP6PR3BLBU
 J6cxTMM00Jex/qAqkD7cqI9ruwzt7GdFqlQIFJ3OZTJZesaJZtZYcztR63sKl7xOqUzGMY7Mu
 XJhjRKzPmk7KQXWAGBkWNv8TW+wCH/v7wFZkqDaM/c1+q7BNwa3ixs5+a5IuwKIL9JPZnrUBd
 ZXhFVY5K/viwOuSOMCVWR44YPXDdGcx3iAOmLdJpJeOTLIxcogLrulESd5aRE/WF2zQFsc3Tw
 Vr0m4IBxFiVS3V0MkLN5wvGMvtcWhsw2IBHmr6atzE96p23mL8LSn9FrdRdl49UPtSwT48eFr
 9kQL4fQvObVhxoAsH2v0miTqqywBQxIwleOKEP/giUQ7nDyobOk4+TMy/4Th0Bu8fQOYPoH4r
 i3KSutvsSH7N6kb+tD2Wf1PQOk12/FRO9oUQL/hbfgzMQzDY43ieCwTgJQ6mdkZDrwHNP4rhC
 /l8kgE37R4POrxo5/uA8WvBYssaBtKX1Ot3pErcyOySLra+7hPwFcdD7Hq/3fDzv/2HntXw/J
 AiSklyGe8UK7Q5OFC27NHsEA65DLJJlHmkBKRnhvLhdaSI9HoL9NZQBpqivv7QApfoMpxIV76
 2d5+fleTg3XGCcTP0cW/flpTX26aXEIgKeJY9oSYvUcMcRbG4J8SkFl66mfEDJEUtz+5KGp06
 mQcgX0o1fLnCqQ1f526evBEA==
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

Common pattern of handling deferred probe can be simplified with
dev_err_probe() and devm_clk_get_optional(). This results in much
less code.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Reviewed-by: Ma=C3=ADra Canal <mcanal@igalia.com>
=2D--
 drivers/gpu/drm/vc4/vc4_v3d.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_v3d.c b/drivers/gpu/drm/vc4/vc4_v3d.c
index 6e566584afbf..bf5c4e36c94e 100644
=2D-- a/drivers/gpu/drm/vc4/vc4_v3d.c
+++ b/drivers/gpu/drm/vc4/vc4_v3d.c
@@ -441,21 +441,9 @@ static int vc4_v3d_bind(struct device *dev, struct de=
vice *master, void *data)
 	vc4->v3d =3D v3d;
 	v3d->vc4 =3D vc4;

-	v3d->clk =3D devm_clk_get(dev, NULL);
-	if (IS_ERR(v3d->clk)) {
-		int ret =3D PTR_ERR(v3d->clk);
-
-		if (ret =3D=3D -ENOENT) {
-			/* bcm2835 didn't have a clock reference in the DT. */
-			ret =3D 0;
-			v3d->clk =3D NULL;
-		} else {
-			if (ret !=3D -EPROBE_DEFER)
-				dev_err(dev, "Failed to get V3D clock: %d\n",
-					ret);
-			return ret;
-		}
-	}
+	v3d->clk =3D devm_clk_get_optional(dev, NULL);
+	if (IS_ERR(v3d->clk))
+		return dev_err_probe(dev, PTR_ERR(v3d->clk), "Failed to get V3D clock\n=
");

 	ret =3D platform_get_irq(pdev, 0);
 	if (ret < 0)
=2D-
2.34.1

