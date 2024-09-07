Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8C597024C
	for <lists+dri-devel@lfdr.de>; Sat,  7 Sep 2024 15:03:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00BE210E0F0;
	Sat,  7 Sep 2024 13:03:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=codewreck.org header.i=@codewreck.org header.b="q3O591lE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 595 seconds by postgrey-1.36 at gabe;
 Sat, 07 Sep 2024 06:04:48 UTC
Received: from submarine.notk.org (submarine.notk.org [62.210.214.84])
 by gabe.freedesktop.org (Postfix) with ESMTP id B203E10E1F5
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Sep 2024 06:04:48 +0000 (UTC)
Received: from gaia.codewreck.org (localhost [127.0.0.1])
 by submarine.notk.org (Postfix) with ESMTPS id AB4DC14C1E1;
 Sat,  7 Sep 2024 07:54:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codewreck.org;
 s=2; t=1725688491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qj67ertlQRTeftmw+g9h4C2AnGK6C33+Vq5AG+IOQ2c=;
 b=q3O591lE2JGBwdtdtSQntarN2ZlH/P1P3gKgDcxSXQEEQc9LNmyKwIaaBIssWoBYPHvTFy
 3zJwvtJFNNpm8t+gcrfv9bnJ7VlXXcHhNL4xSaJX3aIXo+GZhCEj46Ybn5AnamgdC5Evz8
 Y+GiT9apL96eIU0cdS6rvt1A9QmD//UR4hkGY7J1QkmJlDYaRFZnD5VXUj7TFFWbPXx7/t
 1SPqrofM/N9ewj4zWf32a/xf7RctM4cgi8I7/rJPKGwN0eF3yJAxqzDsYp8CR8rjZSey0/
 skv5TflnSFlduQaMa50hrsCiDwEUzkQZA+To0SmhbQw+HrhjBqRfkBpv9sCD+w==
Received: from [127.0.0.1] (localhost.lan [::1])
 by gaia.codewreck.org (OpenSMTPD) with ESMTP id 6cf0701c;
 Sat, 7 Sep 2024 05:54:42 +0000 (UTC)
From: Dominique Martinet <asmadeus@codewreck.org>
Date: Sat, 07 Sep 2024 14:54:33 +0900
Subject: [PATCH v2] drm/bridge: imx8mp-hdmi-tx: allow 0.5% margin with
 selected clock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240907-hdmi-tolerance-v2-1-b9d7abd89f5c@codewreck.org>
X-B4-Tracking: v=1; b=H4sIAJjq22YC/zWMwQ7CIBAFf8XsWRqgNFRP/ofpgcAqGwUUsNE0/
 Xexibc3L5lZoGAmLHDcLZBxpkIpNpD7HVhv4hUZucYguVT8wDXzLhCr6Y7ZRItMubHnWhk1CA1
 NemS80HsLnqfGnkpN+bP1Z/F7/ynFx17wvhNy0GrkTDCXAkV6vrALJleKWE+mtnljFa2PqbMpw
 LSu6xdNlPD1tgAAAA==
To: Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Adam Ford <aford173@gmail.com>, Lucas Stach <l.stach@pengutronix.de>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, 
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Dominique Martinet <dominique.martinet@atmark-techno.com>
X-Mailer: b4 0.14-dev-87f09
X-Developer-Signature: v=1; a=openpgp-sha256; l=2120;
 i=asmadeus@codewreck.org; h=from:subject:message-id;
 bh=nqr2dM1v6KRqxdCBlCHE8iSEaSRxPOverS1W33lMLzI=;
 b=owEBbQKS/ZANAwAIAatOm+xqmOZwAcsmYgBm2+qiwNG20vIXdu+YEeULa01ttlJy2QSvC7+R+
 q5lR89eNZCJAjMEAAEIAB0WIQT8g9txgG5a3TOhiE6rTpvsapjmcAUCZtvqogAKCRCrTpvsapjm
 cCf/EAC4hi6ChKZlBaMMneNhA2qE4PdW2Keg3zZYWMKMWodNjPR+YBT6tLWWHh7AanTLVUyRzaV
 RdNbsaIL3GBy3Z7IGQ5lQeESlFZ9A9TMOQf8UxEgNPL4bd/oWyE1toTD8nyRqzjNdqjdfBf+iw1
 zv/TuvyicWWBKTSj9QNmJc7JQD42fbSMmsEhDZ0PSjViXNx7ZW9mqtLv/OkNePmqYqnNzz08T+v
 8V7DxK9Fpf6EH83bJFrJoZ0naeKb5W5UQ9uhCbSsxmYaowdt1ddwLrv+ZuoAvZqumcuEgVbwQYf
 3cZdJ0f+hvRtXzT8K1bLCJnk5yuFYHquQE/B4Jytol6LWsf+4igOtrQh3QW/DP+896lV7roSmHW
 WGBl7yQ1kb63VwlEG6/tvkUYs5z+vKHJpX4VW3GF62qTespjQ9aykP0fUuEKIcockq3jI+WEZev
 F3l2a/WmXIArf1jA/15TkPtc9AaB3zYrrBf2RJ7OGnx2ecX8Hxaao+nBD3KMNwwPi6lgDXwFauB
 pTLGt6Xbr38u3xtGbqjerCN+Ri7B2LQADXd6GYDhTeT5Gy0MUOYvs+ANVaXqSdvlj5d9q1kGKpe
 nuu5hqzt5ZGR7JAm5oHlZi+AwWKlxfqJ165Eg+PtClAPPzxhDXwFTMCKw8/cjMQnhsAU6Mwak1R
 m88KRhuEw3Hjlaw==
X-Developer-Key: i=asmadeus@codewreck.org; a=openpgp;
 fpr=B894379F662089525B3FB1B9333F1F391BBBB00A
X-Mailman-Approved-At: Sat, 07 Sep 2024 13:03:11 +0000
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

From: Dominique Martinet <dominique.martinet@atmark-techno.com>

This allows the hdmi driver to pick e.g. 64.8MHz instead of 65Mhz when we
cannot output the exact frequency, enabling the imx8mp HDMI output to
support more modes

Tested-by: Adam Ford <aford173@gmail.com> #imx8mp-beacon
Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Signed-off-by: Dominique Martinet <dominique.martinet@atmark-techno.com>
---
Changes in v2:
- Improve comment about the tolerance
- Link to v1: https://lore.kernel.org/r/20240904083103.1257480-1-dominique.martinet@atmark-techno.com
---
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
index 13bc570c5473..200d65184159 100644
--- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
+++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
@@ -23,6 +23,7 @@ imx8mp_hdmi_mode_valid(struct dw_hdmi *dw_hdmi, void *data,
 		       const struct drm_display_mode *mode)
 {
 	struct imx8mp_hdmi *hdmi = (struct imx8mp_hdmi *)data;
+	long round_rate;
 
 	if (mode->clock < 13500)
 		return MODE_CLOCK_LOW;
@@ -30,8 +31,14 @@ imx8mp_hdmi_mode_valid(struct dw_hdmi *dw_hdmi, void *data,
 	if (mode->clock > 297000)
 		return MODE_CLOCK_HIGH;
 
-	if (clk_round_rate(hdmi->pixclk, mode->clock * 1000) !=
-	    mode->clock * 1000)
+	round_rate = clk_round_rate(hdmi->pixclk, mode->clock * 1000);
+	/* imx8mp's pixel clock generator (fsl-samsung-hdmi) cannot generate
+	 * all possible frequencies, so allow some tolerance to support more
+	 * modes.
+	 * Allow 0.5% difference allowed in various standards (VESA, CEA861)
+	 * 0.5% = 5/1000 tolerance (mode->clock is 1/1000)
+	 */
+	if (abs(round_rate - mode->clock * 1000) > mode->clock * 5)
 		return MODE_CLOCK_RANGE;
 
 	/* We don't support double-clocked and Interlaced modes */

---
base-commit: 67784a74e258a467225f0e68335df77acd67b7ab
change-id: 20240907-hdmi-tolerance-4d83074a4517

Best regards,
-- 
Dominique Martinet | Asmadeus

