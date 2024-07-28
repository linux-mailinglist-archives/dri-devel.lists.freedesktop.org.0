Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F72D93E534
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jul 2024 15:01:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37FD110E166;
	Sun, 28 Jul 2024 13:01:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=wahrenst@gmx.net header.b="H1+1N26d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E40310E166
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jul 2024 13:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
 s=s31663417; t=1722171645; x=1722776445; i=wahrenst@gmx.net;
 bh=vd35QWujqoCcgjswql0d6hqDvtzrzubBkMD+QAru0Qg=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=H1+1N26dP3qxTbZhVbmD2kVxYDvt1bitmot0XfOTZRuZhUjzfLM8ETRZuo6e+TE5
 mz5TrjZ1fjhIxqVAPBG+5e/GWQcVijDuoG1vgzpoG7VhnN7MvBw93jsDe02RvRF7s
 GvLi/mTmL1YbIrBGHkRnmlIkJJCyIZWqUj/XqouMgF1MK3FvEdv8fu09dajwn9m3d
 r/ZX4ARtdekRd8PHzVmo69IQ+LraHJn02aFegNXUwf3nJpNtQnIlDWuNFVYLIH5kD
 hQ+0py9UvYlokvYbcaaH9E/ncJuItdeC0kM//Sd8lBgrfXd+d0onftfEH35ax5WJO
 2bCpTT/8gNxn4VcTNw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MUosN-1sh62W1D0r-00YhSR; Sun, 28
 Jul 2024 15:00:45 +0200
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
Subject: [PATCH V2 09/16] drm/vc4: v3d: simplify clock retrieval
Date: Sun, 28 Jul 2024 15:00:22 +0200
Message-Id: <20240728130029.78279-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240728114200.75559-1-wahrenst@gmx.net>
References: <20240728114200.75559-1-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:pBQ7NbVoNBvF4yIvkxD/tynf0vR3oAGG6Sf+gA8vYtZQi08lBDC
 0zBDHPYYYpVokSsMiUDz1Ksp6GoGWJdQU3kmcobhVvR0YP3w1oFOOfSWCbtOrZybaJiSaHj
 tm/fqlFx2pn3945+FbIho/zZR0rmu9emmLdLoMtR3+3pG2sUXpLmI/oubUyxh3Cd5PbfFT3
 nk++MfRVoNdOSJ943i1Ig==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:+vPpj/uVAzA=;irWGD7Y+dbxeocYnUfFCB/5Yp/L
 z4Da8MKGgalWaaps++KCqlP+9YICpWybJ0fhiOJ0Gii2cptTJtZE7o1XyR41ky5lX5GPH4SoF
 r7JGfNT1F3kFWHww86FZHrmVWosKTiBAgB96ro+MN7UkJhWeQT8bbE7IzNLBnA6rWITk7UW8D
 /L3JyLZ2aWQCUYjLWnL7ZSo43Bu9ourvXdqgK27JlwX2VtvQCzOtXsn6BT0ruIRFeiUN+/N6G
 wTJJ+kMxvNO689UjmE5rhGj3D9/AYDBRqJL25P5V2IiYHOW+mfEtRHNtwBcSnxB5DI0Hiz1b5
 enHRLTtop0tjf60g/gVYwfY+uRcER7LSJa/XlpQcJayq36eeD5e3+Ur5/u1mUvI+ekPW9HeOT
 hska2q072STvAOPKm5AGd3MPI8MdOdqSSF+TPUSpgHQPYkBYJn2v5EFGeoSS7pq6cOTXItnvT
 2+1D1aNt7p9ZUhkDk1G1Bve9fyFnUXr9JMSOrulKajiI175u1knJva71Ous4GpqtZhLWKFWY2
 WOpVwlQx5XRoJdG/e8ANdcaFry+/qKYPSc2fh54Ew1U59HRXNapLMUQloqLEjZHcrIOKktD5I
 dwpaqDGON5HOtLTpgBgzBDQ68jZYcIt8nOJYa/b7z95ZcsnoAJEifldjiqyh2hNyyXelQJMA6
 haoxOUG5TEVH3OqJLo4PAH7pmJu3uwLCmVAk/IMqeKvH5lEpv9NlhbTgLM/f1bic/QHKUcliu
 exu3dqzqJMZgFTfQNMBEO5ryb2lGSfOjQMs3XXABqLSRIN5/SJWD2Npn/aAKFm/L9CQ8PNk/A
 rpVu1hBnuSakHZF9JrsP6uig==
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
=2D--
 drivers/gpu/drm/vc4/vc4_v3d.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_v3d.c b/drivers/gpu/drm/vc4/vc4_v3d.c
index 1ede508a67d3..4bf3a8d24770 100644
=2D-- a/drivers/gpu/drm/vc4/vc4_v3d.c
+++ b/drivers/gpu/drm/vc4/vc4_v3d.c
@@ -441,20 +441,11 @@ static int vc4_v3d_bind(struct device *dev, struct d=
evice *master, void *data)
 	vc4->v3d =3D v3d;
 	v3d->vc4 =3D vc4;

-	v3d->clk =3D devm_clk_get(dev, NULL);
+	v3d->clk =3D devm_clk_get_optional(dev, NULL);
 	if (IS_ERR(v3d->clk)) {
 		int ret =3D PTR_ERR(v3d->clk);

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
+		return dev_err_probe(dev, ret, "Failed to get V3D clock\n");
 	}

 	ret =3D platform_get_irq(pdev, 0);
=2D-
2.34.1

