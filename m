Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CE7831F3B
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jan 2024 19:47:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AC4010E904;
	Thu, 18 Jan 2024 18:47:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 452 seconds by postgrey-1.36 at gabe;
 Thu, 18 Jan 2024 18:47:47 UTC
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C511F10E8CE
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 18:47:47 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 35B4187837;
 Thu, 18 Jan 2024 19:39:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1705603174;
 bh=dQijsUiEvg/XTv+pweptrFRSty3VQC0QIvTt8FgZnls=;
 h=From:To:Cc:Subject:Date:From;
 b=w/phsO2jPp0Oc7/2LRG/IuYVVnWAgJp3ZrwQaBlkmh12HzC/386iZVv8pBZgEOywH
 oQqw5w/YX9yN46RoIhl+c/vSrjXnQfOJ8hWgpK6zlR4lx5/8YWmnV89vWI0AekZSgV
 8ZcoDfqHbypnVujE5sg7mLywPuwfenj4V8hqfcadbCxdGuvv5H62wiAZl75QgHLLPS
 IwgysV2t4jYNMb2Uv9cIyqvaoKX2JViGm7Qr1+ipzmCgys4mYXiXn3W13t5r3CQL/3
 5oX1k5e497MI2wleBa1FD8mcls++Yw3AFE5XV00qH7+JSn69DbYbDmVXc7NUD+qKaq
 0fbwDcV1vxF2w==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/lcdif: Do not disable clock on already suspended hardware
Date: Thu, 18 Jan 2024 19:39:02 +0100
Message-ID: <20240118183924.144221-1-marex@denx.de>
X-Mailer: git-send-email 2.43.0
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
 Thomas Zimmermann <tzimmermann@suse.de>, Liu Ying <victor.liu@nxp.com>,
 David Airlie <airlied@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Maxime Ripard <mripard@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Daniel Vetter <daniel@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In case the LCDIF is enabled in DT but unused, the clock used by the
LCDIF are not enabled. Those clock may even have a use count of 0 in
case there are no other users of those clock. This can happen e.g. in
case the LCDIF drives HDMI bridge which has no panel plugged into the
HDMI connector.

Do not attempt to disable clock in the suspend callback and re-enable
clock in the resume callback unless the LCDIF is enabled and was in
use before the system entered suspend, otherwise the driver might end
up trying to disable clock which are already disabled with use count
0, and would trigger a warning from clock core about this condition.

Note that the lcdif_rpm_suspend() and lcdif_rpm_resume() functions
internally perform the clock disable and enable operations and act
as runtime PM hooks too.

Fixes: 9db35bb349a0 ("drm: lcdif: Add support for i.MX8MP LCDIF variant")
Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Liu Ying <victor.liu@nxp.com>
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
 drivers/gpu/drm/mxsfb/lcdif_drv.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lcdif_drv.c
index ea10bf81582e9..0f895b8a99d62 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
@@ -343,6 +343,9 @@ static int __maybe_unused lcdif_suspend(struct device *dev)
 	if (ret)
 		return ret;
 
+	if (pm_runtime_suspended(dev))
+		return 0;
+
 	return lcdif_rpm_suspend(dev);
 }
 
@@ -350,7 +353,8 @@ static int __maybe_unused lcdif_resume(struct device *dev)
 {
 	struct drm_device *drm = dev_get_drvdata(dev);
 
-	lcdif_rpm_resume(dev);
+	if (!pm_runtime_suspended(dev))
+		lcdif_rpm_resume(dev);
 
 	return drm_mode_config_helper_resume(drm);
 }
-- 
2.43.0

