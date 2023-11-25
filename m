Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC3D7F8FC8
	for <lists+dri-devel@lfdr.de>; Sat, 25 Nov 2023 23:25:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8692510E062;
	Sat, 25 Nov 2023 22:25:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 321C310E062
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Nov 2023 22:25:49 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 43E3E8708D;
 Sat, 25 Nov 2023 23:25:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1700951147;
 bh=o4l2cZR2NqUOARa40siZZkK9Q1acG/raQs61/qKQxvQ=;
 h=From:To:Cc:Subject:Date:From;
 b=IBzx5mA9eTL4qM9rtPZkGngh/AhfdDGB6PrOaFr+fCtpgIDhCE64dHEFUBeDD9u82
 SZGmZOt0xUuSOI6whFkLln5Eaz0MbQSVONQKtegNuT2yqgdxLjcDfTYrgZyDNBLEAG
 aqsHknJXbvz+4qzTG2RvA/Fl294R3+by+i16nfURRM3d0ncNbVFwSMkArg993hPe+n
 efb11YaqGjR1nBzbWzjPCuW72a7k62tXTAQ7HeNLajfuUqBjZYVHZYvkYw828TVBAh
 /MQFw7kdrM3Mo1x4Jz9F2FaJhsuRX28Dk/rSX+hzkOFDHPAaNw4mlaiB2f9eb+4DBM
 9ovRa0TBpHsug==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/mxsfb: Switch to drmm_mode_config_init
Date: Sat, 25 Nov 2023 23:25:20 +0100
Message-ID: <20231125222536.97769-1-marex@denx.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
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
Cc: Marek Vasut <marex@denx.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sascha Hauer <s.hauer@pengutronix.de>,
 Maxime Ripard <mripard@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Switch from deprecated unmanaged drm_mode_config_init() to
managed drmm_mode_config_init(). No functional change.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Stefan Agner <stefan@agner.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/mxsfb/mxsfb_drv.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index 3bfa369b2507e..9f746852b8ff2 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -248,7 +248,11 @@ static int mxsfb_load(struct drm_device *drm,
 	pm_runtime_enable(drm->dev);
 
 	/* Modeset init */
-	drm_mode_config_init(drm);
+	ret = drmm_mode_config_init(drm);
+	if (ret) {
+		dev_err(drm->dev, "Failed to initialize mode config\n");
+		goto err_vblank;
+	}
 
 	ret = mxsfb_kms_init(mxsfb);
 	if (ret < 0) {
-- 
2.42.0

