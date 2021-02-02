Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD96530CBF9
	for <lists+dri-devel@lfdr.de>; Tue,  2 Feb 2021 20:43:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A970B89AC9;
	Tue,  2 Feb 2021 19:43:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EF0A89A9B
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Feb 2021 19:43:27 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1l71a4-0002fO-D0; Tue, 02 Feb 2021 20:43:20 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1l71Zv-0004SH-BD; Tue, 02 Feb 2021 20:43:11 +0100
Date: Tue, 2 Feb 2021 20:43:08 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Russell King <linux+pull@armlinux.org.uk>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Tushar Khandelwal <Tushar.Khandelwal@arm.com>,
 Jassi Brar <jassisinghbrar@gmail.com>
Subject: [PATCH] mailbox: arm_mhuv2: make remove callback return void
Message-ID: <20210202194308.jm66vblqjwr5wo6v@pengutronix.de>
References: <20210126165835.687514-1-u.kleine-koenig@pengutronix.de>
 <20210202135350.36nj3dmcoq3t7gcf@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20210202135350.36nj3dmcoq3t7gcf@pengutronix.de>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, kvm@vger.kernel.org,
 David Airlie <airlied@linux.ie>, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig.org@pengutronix.de>,
 linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-watchdog@vger.kernel.org, linux-rtc@vger.kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>, Mike Leach <mike.leach@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, Arnd Bergmann <arnd@arndb.de>,
 coresight@lists.linaro.org, Vladimir Zapolskiy <vz@mleia.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Mark Brown <broonie@kernel.org>,
 linux-fbdev@vger.kernel.org, Matt Mackall <mpm@selenic.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, Alessandro Zummo <a.zummo@towertech.it>,
 Cornelia Huck <cohuck@redhat.com>, linux-mmc@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, linux-crypto@vger.kernel.org,
 Leo Yan <leo.yan@linaro.org>, dmaengine@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============0347251866=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0347251866==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="agbwdn2ioogiuabj"
Content-Disposition: inline


--agbwdn2ioogiuabj
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

My build tests failed to catch that amba driver that would have needed
adaption in commit 3fd269e74f2f ("amba: Make the remove callback return
void"). Change the remove function to make the driver build again.

Reported-by: kernel test robot <lkp@intel.com>
Fixes: 3fd269e74f2f ("amba: Make the remove callback return void")
Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
---
Hello,

I guess I missed that driver during rebase as it was only introduced in
the last merge window. Sorry for that.

I'm unsure what is the right thing to do now. Should I redo the pull
request (with this patch squashed into 3fd269e74f2f)? Or do we just
apply this patch on top?

FTR, the test robot report is at https://lore.kernel.org/r/202102030343.D9j=
1wukx-lkp@intel.com

Best regards
Uwe

 drivers/mailbox/arm_mhuv2.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mailbox/arm_mhuv2.c b/drivers/mailbox/arm_mhuv2.c
index 67fb10885bb4..6cf1991a5c9c 100644
--- a/drivers/mailbox/arm_mhuv2.c
+++ b/drivers/mailbox/arm_mhuv2.c
@@ -1095,14 +1095,12 @@ static int mhuv2_probe(struct amba_device *adev, co=
nst struct amba_id *id)
 	return ret;
 }
=20
-static int mhuv2_remove(struct amba_device *adev)
+static void mhuv2_remove(struct amba_device *adev)
 {
 	struct mhuv2 *mhu =3D amba_get_drvdata(adev);
=20
 	if (mhu->frame =3D=3D SENDER_FRAME)
 		writel_relaxed(0x0, &mhu->send->access_request);
-
-	return 0;
 }
=20
 static struct amba_id mhuv2_ids[] =3D {
--=20
2.29.2


--agbwdn2ioogiuabj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmAZq0gACgkQwfwUeK3K
7AnvFwf/Vj/2rwm/LS2yBZgC9lI9lbNS7MDRNAth1Fq2eWp2ByCbKHdpRnFCokp/
Bk350ppjYY61jBRAG9ts8T+mrfwcHD9fjOamGLqhCRg9sdwC29T72vxVbt7p8j5g
ZMPgB1Cs1n56eeobyale3SG5V9DncI0cu9gr5q/s09YI0qZfLfd4oVj2M1AJd8x0
FzlgEPrVQadxZxqVmFogIFepwe6xmpjPmBFLn6XK3RB6tQjamSqXd3XUYYy9DkAj
Xt57rSlMAYgF69pHmEcEVcPdGOw3YwImELrFdBhM7GfXjxIiYI4VjKH1Z05hG/Bx
KkEiVe0iL1vI9eSQ6l5bCY9dNdIxEg==
=S1EL
-----END PGP SIGNATURE-----

--agbwdn2ioogiuabj--

--===============0347251866==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0347251866==--
