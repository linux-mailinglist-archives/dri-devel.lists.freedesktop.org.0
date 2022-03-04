Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D344CCABF
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 01:26:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A26310E343;
	Fri,  4 Mar 2022 00:25:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CD7510E343
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Mar 2022 00:25:45 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 97A9B839E2;
 Fri,  4 Mar 2022 01:25:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1646353543;
 bh=xKsP5ox1DKmpb6RB30ClQTaPkXCGpmdZsBIQG/v1P4g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JB8y43wKec0yKerZCdz0g+a1VEOq4JmU09K+EIPu8sfE0maXyr644uyPI49PYStet
 UOWp1IzMDm9Gja/xerTkAr4tkKuEdzaovf8Ws9ocJAUzg3VlzBMLoUG8rNLLxkCboC
 Nh1AiC25gBVYULMouPqMbS5rLu5+fUnDOYTMpEwmHt676hri9I/JLcqy7RM0Gy1wR0
 a0J2ArBuz/GBziVaqTs9tqxiwHzk+ne94BansQ2kQI6ev6YsnAFvUj4NNxj+3q58v0
 Wpp6c5UYVDGy+HthqdVWatt5n+9cahKlVQweoSrf1/n/VRzqBN9wpdSGC917sIuSkA
 C1h1pfMVnRrgA==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V3 13/13] drm: bridge: icn6211: Read and validate chip IDs
 before configuration
Date: Fri,  4 Mar 2022 01:25:08 +0100
Message-Id: <20220304002508.75676-14-marex@denx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220304002508.75676-1-marex@denx.de>
References: <20220304002508.75676-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>, Robert Foss <robert.foss@linaro.org>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Read out the Vendor/Chip/Version ID registers from the chip before
performing any configuration, and validate that the registers have
correct values. This is mostly a simple test whether DSI register
access does work, since that tends to be broken on various bridges.

Acked-by: Maxime Ripard <maxime@cerno.tech>
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
To: dri-devel@lists.freedesktop.org
---
V2: Rebase on next-20220214
V3: Add AB from Maxime
---
 drivers/gpu/drm/bridge/chipone-icn6211.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/bridge/chipone-icn6211.c
index c66eacc6b1e2a..0a07023d0aeec 100644
--- a/drivers/gpu/drm/bridge/chipone-icn6211.c
+++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
@@ -153,6 +153,14 @@ static inline struct chipone *bridge_to_chipone(struct drm_bridge *bridge)
 	return container_of(bridge, struct chipone, bridge);
 }
 
+static void chipone_readb(struct chipone *icn, u8 reg, u8 *val)
+{
+	if (icn->interface_i2c)
+		*val = i2c_smbus_read_byte_data(icn->client, reg);
+	else
+		mipi_dsi_generic_read(icn->dsi, (u8[]){reg, 1}, 2, val, 1);
+}
+
 static void chipone_writeb(struct chipone *icn, u8 reg, u8 val)
 {
 	if (icn->interface_i2c)
@@ -251,7 +259,21 @@ static void chipone_atomic_enable(struct drm_bridge *bridge,
 	const struct drm_bridge_state *bridge_state;
 	u16 hfp, hbp, hsync;
 	u32 bus_flags;
-	u8 pol;
+	u8 pol, id[4];
+
+	chipone_readb(icn, VENDOR_ID, id);
+	chipone_readb(icn, DEVICE_ID_H, id + 1);
+	chipone_readb(icn, DEVICE_ID_L, id + 2);
+	chipone_readb(icn, VERSION_ID, id + 3);
+
+	dev_dbg(icn->dev,
+		"Chip IDs: Vendor=0x%02x Device=0x%02x:0x%02x Version=0x%02x\n",
+		id[0], id[1], id[2], id[3]);
+
+	if (id[0] != 0xc1 || id[1] != 0x62 || id[2] != 0x11) {
+		dev_dbg(icn->dev, "Invalid Chip IDs, aborting configuration\n");
+		return;
+	}
 
 	/* Get the DPI flags from the bridge state. */
 	bridge_state = drm_atomic_get_new_bridge_state(state, bridge);
-- 
2.34.1

