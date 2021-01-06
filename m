Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E643F2EC403
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jan 2021 20:36:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80C5989DC2;
	Wed,  6 Jan 2021 19:36:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 494 seconds by postgrey-1.36 at gabe;
 Wed, 06 Jan 2021 19:36:20 UTC
Received: from mail.micronovasrl.com (mail.micronovasrl.com [212.103.203.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 831C989DC2
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jan 2021 19:36:20 +0000 (UTC)
Received: from mail.micronovasrl.com (mail.micronovasrl.com [127.0.0.1])
 by mail.micronovasrl.com (Postfix) with ESMTP id 110BCB045E9
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jan 2021 20:28:04 +0100 (CET)
Authentication-Results: mail.micronovasrl.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)" header.d=micronovasrl.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=micronovasrl.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :x-mailer:message-id:date:date:subject:subject:to:from:from; s=
 dkim; t=1609961283; x=1610825284; bh=UftPdzA1EyIkns95CWFTQClal8U
 woAcgD04vL1JUeRs=; b=LHFqv/Omt2v9bBcPlqpWBFLuRoxFyhMlm8gHwC4XrpB
 XiiZHesfbRSB7/ZCbOeJWMKN2PpItAwDB0AsX90PPjcP4tDqKA9OGeyzXITPHKSU
 me8YmvmCW3nfChlPqBa/6jPrUKP9i+RGQCb1O6y3VO7dIacoCMbigx7DG2v1JFpQ
 =
X-Virus-Scanned: Debian amavisd-new at mail.micronovasrl.com
X-Spam-Flag: NO
X-Spam-Score: -2.9
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 tagged_above=-10 required=4.5
 tests=[ALL_TRUSTED=-1, BAYES_00=-1.9]
 autolearn=unavailable autolearn_force=no
Received: from mail.micronovasrl.com ([127.0.0.1])
 by mail.micronovasrl.com (mail.micronovasrl.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id pr7Cx7QQ51zE for <dri-devel@lists.freedesktop.org>;
 Wed,  6 Jan 2021 20:28:03 +0100 (CET)
Received: from ubuntu.localdomain (146-241-198-163.dyn.eolo.it
 [146.241.198.163])
 by mail.micronovasrl.com (Postfix) with ESMTPSA id 66312B045D8;
 Wed,  6 Jan 2021 20:28:02 +0100 (CET)
From: Giulio Benetti <giulio.benetti@micronovasrl.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 1/2] drm/sun4i: tcon: fix inverted DCLK polarity
Date: Wed,  6 Jan 2021 20:27:59 +0100
Message-Id: <20210106192800.164052-2-giulio.benetti@micronovasrl.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210106192800.164052-1-giulio.benetti@micronovasrl.com>
References: <20210106192800.164052-1-giulio.benetti@micronovasrl.com>
MIME-Version: 1.0
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, wens@csie.org,
 linux-arm-kernel@lists.infradead.org, treding@nvidia.com,
 Giulio Benetti <giulio.benetti@micronovasrl.com>,
 Marjan Pascolo <marjan.pascolo@trexom.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

During commit "88bc4178568b8e0331143cc0616640ab72f0cba1" DRM_BUS_FLAG_*
macros have been changed to avoid ambiguity but just because of this
ambiguity previous DRM_BUS_FLAG_PIXDATA_(POS/NEG)EDGE were used meaning
_SAMPLE_ not _DRIVE_. This lead to DLCK inversion, so let's swap DCLK
phase to fix it.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index eaaf5d70e352..52598bb0fb0b 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -585,10 +585,10 @@ static void sun4i_tcon0_mode_set_rgb(struct sun4i_tcon *tcon,
 	 * and DOTCLOCK drivers.
 	 */
 	if (info->bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE)
-		clk_set_phase(tcon->dclk, 240);
+		clk_set_phase(tcon->dclk, 0);
 
 	if (info->bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE)
-		clk_set_phase(tcon->dclk, 0);
+		clk_set_phase(tcon->dclk, 240);
 
 	regmap_update_bits(tcon->regs, SUN4I_TCON0_IO_POL_REG,
 			   SUN4I_TCON0_IO_POL_HSYNC_POSITIVE |
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
