Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B47D1BCF2D
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 23:54:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 518E089C1A;
	Tue, 28 Apr 2020 21:54:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B05B089C1A
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 21:54:22 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.145]) with ESMTPA (Nemesis) id
 1N6LIF-1j5YGB1AzJ-016ghU; Tue, 28 Apr 2020 23:54:10 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: [PATCH] drm/bridge: fix stack usage warning on old gcc
Date: Tue, 28 Apr 2020 23:53:54 +0200
Message-Id: <20200428215408.4111675-1-arnd@arndb.de>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:iHy77Rgu9/Qf8z+D5jGM8zx0JRD4tfbl7zP0c3hDGD/7Ft21SO3
 I4IsJ+jGm/bVAWJqL1Rgf8I2wrapU26otg4sIofhMQb4XOZnwxaw31TkmIbV3Vlrbsbo54Q
 P/dVYkN3nJTFgE7FH/ZOxI7PtDR5ElP19dDF4HjIELGFelpb9qmkGN6N5JtO+SltH/uj40E
 u1b00TzYaa+Jebr1QgvEA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:L/hkBWoUTWU=:bxdNUJcDA92RjQs7Q9QheM
 QaDyFm0mRKkwmCMy1a0hjVZpquNsrPNbdFKl//hzhASrhSfI+Gheh2b0astjApDRPCLgxrswt
 egURzEGVfCqKE10n/8+Y0APtrnX9MjRb7pbHdZVcK7w7Xpo9ahfsmcibn8HczBc4ut3ICeuRL
 Hy35WFSdVEC7Yj0EXPEiMwHCWuYB0UTm7KZ6ep2c97qg0En0DB9eFytqqJdXtnd0Nc1TkQxwv
 iCO5wTaDNlt7ybbZzSVA6eH6XMri1zKO6wHdMESMbk5TtTAebz4qzanlBB1IIcuWJkPkTBFMo
 ux7nSD03mSQtQmz4IQJjfG0aIi6d2NGNyM2zT3dRPcwQyUfHwLfqRal9QHpQhtZR7O7Kq2ZvT
 bGoxwqZ8LjCMh3Yrj+/NN0iUb5k6fN9LfFHHTj3k0P8r2GiWuWmcni+XzGH8/9M20QsdzHlju
 Q1VrxfFhXeEQn7o08nEaCNa9YuTeyEPCe73nmLw6dFh1Kzlm5IvhOXaOQ68hKZLG/qx2wic1b
 V+KeQDH2Du2SrZ3r4fne5t63amyneyrMRXS5PGb8GNqvnIsUCjha0m+tjhtj5AZUdhMVybTGC
 miRpldWtpPTjOXvaeWCsUH4NUHisorKza7HhxubccmW9QrsaJpffPL17Y1Sk+F2sMZZACDYBp
 4JwBe/Opi/K/ccx2Rqn39JOiLjXw08FdevcWgFiiYMhyXaKfGZCtz48KSwaUUft1ewrKPNwTI
 mmccUZrDPDF68mtgKgpGYBywesmUvDkM1XfwO3vGd6ScMzcAPZ4ZP72ajdmC82zxH3Zh6ln2D
 bp+nQsgzlJTgITvS11vzPCFG7qC3L+ShsNvVbGGHQCjcV43nEA=
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Arnd Bergmann <arnd@arndb.de>,
 Jonas Karlman <jonas@kwiboo.se>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some older versions of gcc badly optimize code that passes
an inline function argument into another function by reference,
causing huge stack usage:

drivers/gpu/drm/bridge/tc358768.c: In function 'tc358768_bridge_pre_enable':
drivers/gpu/drm/bridge/tc358768.c:840:1: error: the frame size of 2256 bytes is larger than 2048 bytes [-Werror=frame-larger-than=]

Use a temporary variable as a workaround and add a comment pointing
to the gcc bug.

Fixes: ff1ca6397b1d ("drm/bridge: Add tc358768 driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/bridge/tc358768.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
index 1b39e8d37834..6650fe4cfc20 100644
--- a/drivers/gpu/drm/bridge/tc358768.c
+++ b/drivers/gpu/drm/bridge/tc358768.c
@@ -178,6 +178,8 @@ static int tc358768_clear_error(struct tc358768_priv *priv)
 
 static void tc358768_write(struct tc358768_priv *priv, u32 reg, u32 val)
 {
+	/* work around https://gcc.gnu.org/bugzilla/show_bug.cgi?id=81715 */
+	int tmpval = val;
 	size_t count = 2;
 
 	if (priv->error)
@@ -187,7 +189,7 @@ static void tc358768_write(struct tc358768_priv *priv, u32 reg, u32 val)
 	if (reg < 0x100 || reg >= 0x600)
 		count = 1;
 
-	priv->error = regmap_bulk_write(priv->regmap, reg, &val, count);
+	priv->error = regmap_bulk_write(priv->regmap, reg, &tmpval, count);
 }
 
 static void tc358768_read(struct tc358768_priv *priv, u32 reg, u32 *val)
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
