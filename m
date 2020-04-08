Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 699D31A2A59
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 22:28:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F3836EAF9;
	Wed,  8 Apr 2020 20:27:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C0FC6EAF1
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 20:27:45 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.129]) with ESMTPA (Nemesis) id
 1M1HqM-1jJXCV1zju-002p3H; Wed, 08 Apr 2020 22:27:21 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
 Nicolas Pitre <nico@fluxnic.net>
Subject: [RFC 4/6] drm/bridge/sii8620: fix extcon dependency
Date: Wed,  8 Apr 2020 22:27:09 +0200
Message-Id: <20200408202711.1198966-5-arnd@arndb.de>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200408202711.1198966-1-arnd@arndb.de>
References: <20200408202711.1198966-1-arnd@arndb.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:vV8vEqFFzBxDwbCUpevBksXzEnRG+4YylcxGZKW7vX+9eMNUg1m
 GTSrbKOi6FlzzBUHGBDpQR3uJHzbcRVL29ejotroODkZe9OPHSlxi90k/mXcQ4EwBxDqz+S
 fwAOPMaKXUvZqrRoIeRpqd1CCyTHjbL5K4harE/L5KNprHiRjOcSxfYcjG43V5CQGDOrMdP
 0Zvp6NP7uN5f0uBgGxXEA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:MptYX3yueAQ=:b885v6hNqw1kQDiue/weO6
 uP+3VRcZwHepB7aNKzqTfmN4RuwxLKcd3Ykn79jFhPBxl2wZfHWApXes3mbeDb/x1w+Vf3eXo
 q9YEc9yKSSVlxROHdqCSWcymhLpZ2EDGCdvQbKoMGTtFXTirZiv2DAe3FnAWFufrzLccql5PD
 EHa10ti3QaaWQoWarrhnR+u9A33uYjAF35zBqi6jQol9OPXkKAlO5yJcEcD0jpkfo6GS81i5y
 kH+gPTPYH30Wr9WocW6L91lXSvOaqKNE3BzcyPFgUPkKZdEFM+dMi8tZl2HxIwzJA1XqcwFfi
 XrfEV0cIYSe2KcZozeoabmYbdGj6q/22WC5AsKTZZgalFOuOBF8wVGKu/2wC6RLZ9COX/CFeu
 6W+gTiE6JSfyRpDVXLFq+HnzULwdyNoAEb9aJf3iXX2AjYYvaqyB/lzs4IWSfLtkGFp9HDRzt
 AqgANzoPqYHUQkhSHCS2jpi3VNEU1z3mj98JfTwXmrM5v9LhzBIuTMdDAgqLXUSCEdq7RhW3T
 XvOf7th7/rXNolz9+AOIiILyM7J3arHbaIfZhe23PnMVjW1r8ySVflQqck+e0e0zycDo0T/Bx
 YtLQLGldhMoefh+6y6apc8rGbDJpRnerakstMgLD3Xg4C3JBpOoFEMmWSTc0KwSjScvTdVbFZ
 N2d5HtbEJry0CQNPtNudp2FRAzOMVvxY6G+Tz19wbIEno35Y6FxB+s2evGed0xWIVvhi7fdjc
 QFRA5cQBDSRwNMPrqLXlIjX5+A+SX8eaXTCT/FampsaxQeRsv7tSnCQm+OMw67CNp7QNJOZOs
 HS8WJIHYn7I0p4NzUPVc9S0+juW29sTv81JFrBTxLetf8xRiNA=
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Leon Romanovsky <leon@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, netdev@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>, Saeed Mahameed <saeedm@mellanox.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Andrzej Hajda <a.hajda@samsung.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 "David S. Miller" <davem@davemloft.net>, linux-rdma@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Using 'imply' does not work here, it still cause the same build
failure:

arm-linux-gnueabi-ld: drivers/gpu/drm/bridge/sil-sii8620.o: in function `sii8620_remove':
sil-sii8620.c:(.text+0x1b8): undefined reference to `extcon_unregister_notifier'
arm-linux-gnueabi-ld: drivers/gpu/drm/bridge/sil-sii8620.o: in function `sii8620_probe':
sil-sii8620.c:(.text+0x27e8): undefined reference to `extcon_find_edev_by_node'
arm-linux-gnueabi-ld: sil-sii8620.c:(.text+0x2870): undefined reference to `extcon_register_notifier'
arm-linux-gnueabi-ld: drivers/gpu/drm/bridge/sil-sii8620.o: in function `sii8620_extcon_work':
sil-sii8620.c:(.text+0x2908): undefined reference to `extcon_get_state'

I tried the usual 'depends on EXTCON || !EXTCON' logic, but that caused
a circular Kconfig dependency. Using IS_REACHABLE() is ugly but works.

Fixes: 7a109673899b ("drm/bridge/sii8620: add Kconfig dependency on extcon")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/bridge/Kconfig       | 1 -
 drivers/gpu/drm/bridge/sil-sii8620.c | 5 +++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index aaed2347ace9..78e5ba06acff 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -90,7 +90,6 @@ config DRM_SIL_SII8620
 	tristate "Silicon Image SII8620 HDMI/MHL bridge"
 	depends on OF
 	select DRM_KMS_HELPER
-	imply EXTCON
 	depends on RC_CORE || !RC_CORE
 	help
 	  Silicon Image SII8620 HDMI/MHL bridge chip driver.
diff --git a/drivers/gpu/drm/bridge/sil-sii8620.c b/drivers/gpu/drm/bridge/sil-sii8620.c
index 92acd336aa89..94b6c38e6855 100644
--- a/drivers/gpu/drm/bridge/sil-sii8620.c
+++ b/drivers/gpu/drm/bridge/sil-sii8620.c
@@ -2330,7 +2330,8 @@ static int sii8620_probe(struct i2c_client *client,
 	if (ret)
 		return ret;
 
-	ret = sii8620_extcon_init(ctx);
+	if (IS_REACHABLE(CONFIG_EXTCON))
+		ret = sii8620_extcon_init(ctx);
 	if (ret < 0) {
 		dev_err(ctx->dev, "failed to initialize EXTCON\n");
 		return ret;
@@ -2352,7 +2353,7 @@ static int sii8620_remove(struct i2c_client *client)
 {
 	struct sii8620 *ctx = i2c_get_clientdata(client);
 
-	if (ctx->extcon) {
+	if (IS_REACHABLE(CONFIG_EXTCON) && ctx->extcon) {
 		extcon_unregister_notifier(ctx->extcon, EXTCON_DISP_MHL,
 					   &ctx->extcon_nb);
 		flush_work(&ctx->extcon_wq);
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
