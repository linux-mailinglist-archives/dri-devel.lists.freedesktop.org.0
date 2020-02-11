Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AAAE15A348
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2020 09:26:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CE486F491;
	Wed, 12 Feb 2020 08:25:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5302::5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91C616F459
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 21:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1581457656;
 s=strato-dkim-0002; d=goldelico.com;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=TdyjL7fnovA7v90cI49fyycJRI+MxjJc1+DrsqTzedE=;
 b=IiroSnrO9gdTz/lYd+yzDNp4xbJUfwZB6wNaqk+Q7lI8dvTyRVCxnowm9X/gCdPAF7
 zQNLcNHFmEdkt6aoqbUnX7PM6uL2pj45hcBtOgUB/RNNvRmCrxcYfoBrz9faJXRLvW6/
 Csb4i2P2mjWIHIZcdUxNFdVVm0l8HvkME2GMZ6FExtwpyxgwlBcE8ixBBO98JaQV2HQR
 JaiqeGcQHkicCwBjY2SSnoDS+4+IjL0buOn94rqveP4LndVMTc/grIb+Gz3ERbewvx9E
 rIS02eNhxToWuvIrE+9APOr/xnpcFeFujHWDp+AHlc8CKnJuUnAatCh9yF/pjW+RO9yA
 FKBA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1OAA2UNf2M0P2mp10IM"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 46.1.12 DYNA|AUTH)
 with ESMTPSA id U06217w1BLfX0EH
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 11 Feb 2020 22:41:33 +0100 (CET)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Paul Cercueil <paul@crapouillou.net>, Paul Boddie <paul@boddie.org.uk>,
 Alex Smith <alex.smith@imgtec.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>,
 Paul Burton <paulburton@kernel.org>, James Hogan <jhogan@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Linus Walleij <linus.walleij@linaro.org>,
 "H. Nikolaus Schaller" <hns@goldelico.com>,
 Andi Kleen <ak@linux.intel.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>,
 Richard Fontana <rfontana@redhat.com>,
 Allison Randal <allison@lohutok.net>, Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH 01/14] i2c: jz4780: suppress txabrt reports for i2cdetect
Date: Tue, 11 Feb 2020 22:41:18 +0100
Message-Id: <7facef52af9cff6ebe26ff321a7fd4f1ac640f74.1581457290.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1581457290.git.hns@goldelico.com>
References: <cover.1581457290.git.hns@goldelico.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 12 Feb 2020 08:25:13 +0000
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
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, kernel@pyra-handheld.com,
 letux-kernel@openphoenux.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This suppresses "simple" error reasons

	ABRT_7B_ADDR_NOACK
	ABRT_10ADDR1_NOACK
	ABRT_10ADDR2_NOACK

from flooding the console log when running i2cdetect on
addresses without a responding slave.

Additionally, reading the JZ4780_I2C_TAR in this situation
seems to harm the controller state.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/i2c/busses/i2c-jz4780.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/i2c/busses/i2c-jz4780.c b/drivers/i2c/busses/i2c-jz4780.c
index 16a67a64284a..55b7518435f1 100644
--- a/drivers/i2c/busses/i2c-jz4780.c
+++ b/drivers/i2c/busses/i2c-jz4780.c
@@ -578,6 +578,9 @@ static void jz4780_i2c_txabrt(struct jz4780_i2c *i2c, int src)
 {
 	int i;
 
+	if (!(src & ~7))
+		return;
+
 	dev_err(&i2c->adap.dev, "txabrt: 0x%08x\n", src);
 	dev_err(&i2c->adap.dev, "device addr=%x\n",
 		jz4780_i2c_readw(i2c, JZ4780_I2C_TAR));
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
