Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 835796610D3
	for <lists+dri-devel@lfdr.de>; Sat,  7 Jan 2023 19:26:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DC5210E349;
	Sat,  7 Jan 2023 18:26:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0360A10E1BF
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Jan 2023 18:26:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4074E60BAA;
 Sat,  7 Jan 2023 18:26:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B24DAC43445;
 Sat,  7 Jan 2023 18:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673115981;
 bh=FpJgYKX0WvqOM6qXNZm3orw83KtE8CnVdKskuu7Bxj8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=ibafoQF9RQ0654p7+XrOtYyy0N7e1+Wqbgurr/s3R0c31xlvWMaiv1rE43GmUD0ax
 1uKtvH80Di1rpSHQJe+XRgjTJHrofPadAh/ODHSirpNZAFmmMTVoFeMkhMqF2M+/Qu
 WixKllalmm7bZbY2IRu/nqJzf6pqWuaniQUtGDhj54eKNMlAEYrq6fZ1KlFl1OT+YX
 VlpA1g/VS6yYLtn1NxEKn3c6ox3/JuoX4jCkSLY1e0Gw/W5jtHzqrJqEjbuhLSPnHx
 vYPFsreIQl0LgDBkgFOOLtrp9vDAjIyfpPUWOJji2EM4Q4MDv7NkHov4t04dpqNoph
 XMqhiOwWLdVzg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 9DC36C63797;
 Sat,  7 Jan 2023 18:26:21 +0000 (UTC)
From: Sam Ravnborg via B4 Submission Endpoint
 <devnull+sam.ravnborg.org@kernel.org>
Date: Sat, 07 Jan 2023 19:26:23 +0100
Subject: [PATCH 09/15] staging: fbtft: fb_ssd1351.c: Introduce
 backlight_is_blank()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230107-sam-video-backlight-drop-fb_blank-v1-9-1bd9bafb351f@ravnborg.org>
References: <20230107-sam-video-backlight-drop-fb_blank-v1-0-1bd9bafb351f@ravnborg.org>
In-Reply-To: <20230107-sam-video-backlight-drop-fb_blank-v1-0-1bd9bafb351f@ravnborg.org>
To: Nicolas Ferre <nicolas.ferre@microchip.com>, Helge Deller <deller@gmx.de>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Antonino Daplas <adaplas@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Robin van der Gracht <robin@protonic.nl>, Miguel Ojeda <ojeda@kernel.org>,
 Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>
X-Mailer: b4 0.11.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1673115978; l=1470;
 i=sam@ravnborg.org; s=20230107; h=from:subject:message-id;
 bh=G6rOZdtEwpeQEO+0r3oVVgedO7Rz1feTEQR8eX27nq4=; =?utf-8?q?b=3D+S7h4F0wUNPp?=
 =?utf-8?q?/JDzVLZhorRrHoeXoMU92DpeyUhmf+Ru9VbwxZ4HQL+EQ45PgrZJYvAfns99nGaz?=
 +nssZXN1Aj803PnEukV8/v1tXrrRhgpXnDQN/jH9brZR1cK2eNGw
X-Developer-Key: i=sam@ravnborg.org; a=ed25519;
 pk=R0+pqV7BRYOAeOIGkyOrSNke7arx5y3LkEuNi37YEyU=
X-Endpoint-Received: by B4 Submission Endpoint for sam@ravnborg.org/20230107
 with auth_id=22
X-Original-From: Sam Ravnborg <sam@ravnborg.org>
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
Reply-To: sam@ravnborg.org
Cc: linux-fbdev@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Stephen Kitt <steve@sk2.org>, Sam Ravnborg <sam@ravnborg.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sam Ravnborg <sam@ravnborg.org>

Avoiding direct access to backlight_properties.props.

Access to the deprecated props.fb_blank replaced by backlight_is_blank().
Access to props.power is dropped - it was only used for debug.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Stephen Kitt <steve@sk2.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-fbdev@vger.kernel.org
---
 drivers/staging/fbtft/fb_ssd1351.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/fbtft/fb_ssd1351.c b/drivers/staging/fbtft/fb_ssd1351.c
index b8d55aa8c5c7..995fbd2f3dc6 100644
--- a/drivers/staging/fbtft/fb_ssd1351.c
+++ b/drivers/staging/fbtft/fb_ssd1351.c
@@ -190,15 +190,12 @@ static struct fbtft_display display = {
 static int update_onboard_backlight(struct backlight_device *bd)
 {
 	struct fbtft_par *par = bl_get_data(bd);
-	bool on;
+	bool blank = backlight_is_blank(bd);
 
-	fbtft_par_dbg(DEBUG_BACKLIGHT, par,
-		      "%s: power=%d, fb_blank=%d\n",
-		      __func__, bd->props.power, bd->props.fb_blank);
+	fbtft_par_dbg(DEBUG_BACKLIGHT, par, "%s: blank=%d\n", __func__, blank);
 
-	on = !backlight_is_blank(bd);
 	/* Onboard backlight connected to GPIO0 on SSD1351, GPIO1 unused */
-	write_reg(par, 0xB5, on ? 0x03 : 0x02);
+	write_reg(par, 0xB5, !blank ? 0x03 : 0x02);
 
 	return 0;
 }

-- 
2.34.1
