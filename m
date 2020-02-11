Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F40C15A337
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2020 09:25:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90CD86E9D0;
	Wed, 12 Feb 2020 08:25:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p03-ob.smtp.rzone.de (mo6-p03-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5303::5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0D1A6F459
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 21:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1581457657;
 s=strato-dkim-0002; d=goldelico.com;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=v3anE5b2foHTOj2GJ8iyGcibKBz905Yhze/9YVRQ/TQ=;
 b=Gi/JQ0sUP03WCzaQr7ENUCxTrQrLfbncIxvTCk8j0smNzu3W1L2F5YXqgAYbzD/rRU
 UBdzsq16+P8XOcf8f3MdEOuHz9NGcqU4J+LHI50WLgeAZ7kMy2g7nqbBlGHcLLYyMsTI
 Jx6A6Y+5ugskhSBlkLk4M9STdRTMxRYFrvzEgO557R2skevonlJEUVNpoCCjAn94trZU
 IkdANdADlqRPMC82VIhhVUA/KmeZWwewt4T18jD1r3NNGVFXOtd3PfYR0BL5XdsGBCqL
 wm9JeycgVtsKoGyNorEa98n7oaWxR7Gc3D0jPxm110D3lCqan4I0bp7O0SJGqlQ2O+CI
 bcVA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1OAA2UNf2M0P2mp10IM"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 46.1.12 DYNA|AUTH)
 with ESMTPSA id U06217w1BLfZ0EJ
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 11 Feb 2020 22:41:35 +0100 (CET)
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
Subject: [PATCH 03/14] net: davicom: dm9000: allow to pass MAC address through
 mac_addr module parameter
Date: Tue, 11 Feb 2020 22:41:20 +0100
Message-Id: <4e11dd4183da55012198824ca7b8933b1eb57e4a.1581457290.git.hns@goldelico.com>
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

This is needed to give the MIPS Ingenic CI20 board a stable MAC address
which can be optionally provided by vendor U-Boot.

For get_mac_addr() we use an adapted copy of from ksz884x.c which
has very similar functionality.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/net/ethernet/davicom/dm9000.c | 42 +++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/net/ethernet/davicom/dm9000.c b/drivers/net/ethernet/davicom/dm9000.c
index 1ea3372775e6..7402030b0352 100644
--- a/drivers/net/ethernet/davicom/dm9000.c
+++ b/drivers/net/ethernet/davicom/dm9000.c
@@ -1409,6 +1409,43 @@ static struct dm9000_plat_data *dm9000_parse_dt(struct device *dev)
 	return pdata;
 }
 
+static char *mac_addr = ":";
+module_param(mac_addr, charp, 0);
+MODULE_PARM_DESC(mac_addr, "MAC address");
+
+static void get_mac_addr(struct net_device *ndev, char *macaddr)
+{
+	int i = 0;
+	int j = 0;
+	int got_num = 0;
+	int num = 0;
+
+	while (j < ETH_ALEN) {
+		if (macaddr[i]) {
+			int digit;
+
+			got_num = 1;
+			digit = hex_to_bin(macaddr[i]);
+			if (digit >= 0)
+				num = num * 16 + digit;
+			else if (':' == macaddr[i])
+				got_num = 2;
+			else
+				break;
+		} else if (got_num) {
+			got_num = 2;
+		} else {
+			break;
+		}
+		if (got_num == 2) {
+			ndev->dev_addr[j++] = (u8)num;
+			num = 0;
+			got_num = 0;
+		}
+		i++;
+	}
+}
+
 /*
  * Search DM9000 board, allocate space and register it
  */
@@ -1679,6 +1716,11 @@ dm9000_probe(struct platform_device *pdev)
 			ndev->dev_addr[i] = ior(db, i+DM9000_PAR);
 	}
 
+	if (!is_valid_ether_addr(ndev->dev_addr)) {
+		mac_src = "param";
+		get_mac_addr(ndev, mac_addr);
+	}
+
 	if (!is_valid_ether_addr(ndev->dev_addr)) {
 		inv_mac_addr = true;
 		eth_hw_addr_random(ndev);
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
