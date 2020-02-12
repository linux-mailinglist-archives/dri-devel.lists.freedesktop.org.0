Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F92015A56D
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2020 10:55:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38858899F0;
	Wed, 12 Feb 2020 09:55:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 556 seconds by postgrey-1.36 at gabe;
 Wed, 12 Feb 2020 09:55:47 UTC
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id E492D899F0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2020 09:55:47 +0000 (UTC)
Received: from localhost (p54B335A7.dip0.t-ipconnect.de [84.179.53.167])
 by pokefinder.org (Postfix) with ESMTPSA id 1A98E2C07EB;
 Wed, 12 Feb 2020 10:46:29 +0100 (CET)
Date: Wed, 12 Feb 2020 10:46:28 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: i2c: jz4780: silence log flood on txabrt
Message-ID: <20200212094628.GB1143@ninjato>
References: <cover.1581457290.git.hns@goldelico.com>
 <7facef52af9cff6ebe26ff321a7fd4f1ac640f74.1581457290.git.hns@goldelico.com>
MIME-Version: 1.0
In-Reply-To: <7facef52af9cff6ebe26ff321a7fd4f1ac640f74.1581457290.git.hns@goldelico.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Mark Rutland <mark.rutland@arm.com>, Paul Boddie <paul@boddie.org.uk>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 James Hogan <jhogan@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 Richard Fontana <rfontana@redhat.com>, linux-i2c@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Andi Kleen <ak@linux.intel.com>,
 Paul Burton <paulburton@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alex Smith <alex.smith@imgtec.com>,
 Petr =?utf-8?Q?=C5=A0tetiar?= <ynezz@true.cz>, devicetree@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, letux-kernel@openphoenux.org,
 Allison Randal <allison@lohutok.net>, netdev@vger.kernel.org,
 linux-mips@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
 kernel@pyra-handheld.com, "David S. Miller" <davem@davemloft.net>
Content-Type: multipart/mixed; boundary="===============0166090513=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0166090513==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="i9LlY+UWpKt15+FH"
Content-Disposition: inline


--i9LlY+UWpKt15+FH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


The printout for txabrt is way too talkative. Reduce it to the minimum,
the rest can be gained by I2C core debugging and datasheet information.
Also, make it a debug printout, it won't help the regular user.

Reported-by: H. Nikolaus Schaller <hns@goldelico.com>
Signed-off-by: Wolfram Sang <wsa@the-dreams.de>
---

Sorry, normally I don't do counter patches. Yet, this time I realized
that it would be faster to actually do what I envisioned than to
describe it in words. I hope you don't feel offended. This driver has
way too many dev_err anyhow, so this may be a start.

Obviously, I can't test, does it work for you?

 drivers/i2c/busses/i2c-jz4780.c | 36 ++-------------------------------
 1 file changed, 2 insertions(+), 34 deletions(-)

diff --git a/drivers/i2c/busses/i2c-jz4780.c b/drivers/i2c/busses/i2c-jz478=
0.c
index 16a67a64284a..b426fc956938 100644
--- a/drivers/i2c/busses/i2c-jz4780.c
+++ b/drivers/i2c/busses/i2c-jz4780.c
@@ -78,25 +78,6 @@
=20
 #define X1000_I2C_DC_STOP		BIT(9)
=20
-static const char * const jz4780_i2c_abrt_src[] =3D {
-	"ABRT_7B_ADDR_NOACK",
-	"ABRT_10ADDR1_NOACK",
-	"ABRT_10ADDR2_NOACK",
-	"ABRT_XDATA_NOACK",
-	"ABRT_GCALL_NOACK",
-	"ABRT_GCALL_READ",
-	"ABRT_HS_ACKD",
-	"SBYTE_ACKDET",
-	"ABRT_HS_NORSTRT",
-	"SBYTE_NORSTRT",
-	"ABRT_10B_RD_NORSTRT",
-	"ABRT_MASTER_DIS",
-	"ARB_LOST",
-	"SLVFLUSH_TXFIFO",
-	"SLV_ARBLOST",
-	"SLVRD_INTX",
-};
-
 #define JZ4780_I2C_INTST_IGC		BIT(11)
 #define JZ4780_I2C_INTST_ISTT		BIT(10)
 #define JZ4780_I2C_INTST_ISTP		BIT(9)
@@ -576,21 +557,8 @@ static irqreturn_t jz4780_i2c_irq(int irqno, void *dev=
_id)
=20
 static void jz4780_i2c_txabrt(struct jz4780_i2c *i2c, int src)
 {
-	int i;
-
-	dev_err(&i2c->adap.dev, "txabrt: 0x%08x\n", src);
-	dev_err(&i2c->adap.dev, "device addr=3D%x\n",
-		jz4780_i2c_readw(i2c, JZ4780_I2C_TAR));
-	dev_err(&i2c->adap.dev, "send cmd count:%d  %d\n",
-		i2c->cmd, i2c->cmd_buf[i2c->cmd]);
-	dev_err(&i2c->adap.dev, "receive data count:%d  %d\n",
-		i2c->cmd, i2c->data_buf[i2c->cmd]);
-
-	for (i =3D 0; i < 16; i++) {
-		if (src & BIT(i))
-			dev_dbg(&i2c->adap.dev, "I2C TXABRT[%d]=3D%s\n",
-				i, jz4780_i2c_abrt_src[i]);
-	}
+	dev_dbg(&i2c->adap.dev, "txabrt: 0x%08x, cmd: %d, send: %d, recv: %d\n",
+		src, i2c->cmd, i2c->cmd_buf[i2c->cmd], i2c->data_buf[i2c->cmd]);
 }
=20
 static inline int jz4780_i2c_xfer_read(struct jz4780_i2c *i2c,
--=20
2.20.1


--i9LlY+UWpKt15+FH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5DyXAACgkQFA3kzBSg
KbYoahAAtIAAtnnBgAg6FGqt5JLhVswxcJnxfAzMxAk708tbDSluUzpyiEXWCa52
d60BlamWi8++aJOMQ/iZ4k8wdvJX+9AN9JSyLtECMSFGhJVqDygeJGCA7N3qY33S
XBcvEIf2/OjfaWiTH22XXH9Pt6Hyo7ykrfv0LCD9OQwI5B+OvTfaM4WjXiPMP+dT
89R9yTKvQPIpV8G6hhj5BKF4TAbkmn2MKMNG+Z6vWlPToTQAGs732p470xXjSX+t
Oc5fNIt6NchL2pySrVsqDY84+GTRJ6J8by4lKAK3jQUxB3fzYqgri2z+BPBsXUkQ
IuaqB/a1gvmkAFl8JwfHvvgueeisXevGW5RdpPnWhvNPBDNg5BXgeSSjZDRLJCdA
rRO+2IUDoRyCLAnu7hV43GtIqiKQSidH8t9WfjLbspxici/1MISwfJPivPvbTBx3
AVFXKutTSBgR4r3Obtyb5cUZvQbYP+IvKArUHPTcFeVGZPFLhNF1OjgMAd6W/Q05
uZqYud9prhC71Hk9t3jW6rsXvKUfZkMESrMGsCnH0NUayvBkGv89r+B/HqqurLLn
5Hx1cO1AZpIxnO9QYaiQya6mCysTJZE7x3lpHznLBt6skM2JonKiqOUeTN8f3m86
oDJgVd4tkF2kIOweXNSxBWP7K3Xh5tCVqCdeEPz5fG7WlkGdKoI=
=LWAJ
-----END PGP SIGNATURE-----

--i9LlY+UWpKt15+FH--

--===============0166090513==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0166090513==--
