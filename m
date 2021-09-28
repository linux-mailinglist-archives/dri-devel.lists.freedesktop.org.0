Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C26F841AB5A
	for <lists+dri-devel@lfdr.de>; Tue, 28 Sep 2021 11:02:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2E1C8940E;
	Tue, 28 Sep 2021 09:02:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 403 seconds by postgrey-1.36 at gabe;
 Tue, 28 Sep 2021 09:02:25 UTC
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA0268940E
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 09:02:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id D2A32FB03;
 Tue, 28 Sep 2021 10:55:38 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b4uIgp2xdlGl; Tue, 28 Sep 2021 10:55:37 +0200 (CEST)
Date: Tue, 28 Sep 2021 10:55:35 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, Sam Ravnborg <sam@ravnborg.org>,
 Lucas Stach <l.stach@pengutronix.de>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm: mxsfb: Set proper default bus format when using a bridge
Message-ID: <YVLYh/SgBritG/RJ@qwark.sigxcpu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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

If a bridge doesn't do any bus format handling MEDIA_BUS_FMT_FIXED is
returned. Fallback to a reasonable default (MEDIA_BUS_FMT_RGB888_1X24) in
that case.

This unbreaks e.g. using mxsfb with the nwl bridge and mipi panels.

Fixes: b776b0f00f24 ("drm: mxsfb: Use bus_format from the nearest bridge if present")

Signed-off-by: Guido Günther <agx@sigxcpu.org>
---

I'll look at what needs to be done in nwl separately but this also
unbreaks other bridge seupts that don't to format negotiation yet.

 drivers/gpu/drm/mxsfb/mxsfb_kms.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
index af6c620adf6e..4ef94cf686b0 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
@@ -369,6 +369,8 @@ static void mxsfb_crtc_atomic_enable(struct drm_crtc *crtc,
 			drm_atomic_get_new_bridge_state(state,
 							mxsfb->bridge);
 		bus_format = bridge_state->input_bus_cfg.format;
+		if (bus_format == MEDIA_BUS_FMT_FIXED)
+			bus_format = MEDIA_BUS_FMT_RGB888_1X24;
 	}
 
 	/* If there is no bridge, use bus format from connector */
-- 
2.33.0
