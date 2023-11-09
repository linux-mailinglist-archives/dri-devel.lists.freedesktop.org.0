Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 141877E6479
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 08:39:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51BC310E1CE;
	Thu,  9 Nov 2023 07:39:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BD7510E1C8
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 07:38:51 +0000 (UTC)
Received: from [127.0.1.1] (91-158-149-209.elisa-laajakaista.fi
 [91.158.149.209])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C4D1DAF2;
 Thu,  9 Nov 2023 08:38:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1699515508;
 bh=DctFIvkDoFEqJ33Z6ruCYMdZFJxb/7pQYzOou//Ap3I=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Dc9GjD7/juHAmMUUFhiwOgCXA4OXdrRrZ1hX8ejF44mMI0MHKeBCDabyy6gpnwGsv
 zV7+IhxWEZhz/maI/drQJZZAYppVK+28umotd42BzVPPnqHeFwOLd7o8gFcHVnViF8
 w0XlrVI7Beh8FITWRxveF3I6mOEOHc2W6Mt6WLbc=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 09 Nov 2023 09:38:02 +0200
Subject: [PATCH v2 09/11] drm/tidss: IRQ code cleanup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231109-tidss-probe-v2-9-ac91b5ea35c0@ideasonboard.com>
References: <20231109-tidss-probe-v2-0-ac91b5ea35c0@ideasonboard.com>
In-Reply-To: <20231109-tidss-probe-v2-0-ac91b5ea35c0@ideasonboard.com>
To: Aradhya Bhatia <a-bhatia1@ti.com>, Devarsh Thakkar <devarsht@ti.com>, 
 Jyri Sarha <jyri.sarha@iki.fi>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=3782;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=DctFIvkDoFEqJ33Z6ruCYMdZFJxb/7pQYzOou//Ap3I=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBlTIyA/Ed2GdhSjNB0TdLDAtTBLS3T3owhC5Feg
 AjEZ5prDE+JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZUyMgAAKCRD6PaqMvJYe
 9bfXEACOcy1uY/FsnMlL7FZbPFWduaeQxZS35htX2N1qTBrmP6urK9VYAyugcSbuDvezOUMkNi5
 dYnMaRD08OrqD6HlQLiDVOjP+DWiS0DN2JNnXctyXKrl/ozrbnPLGqdwEQcjSDYkusWqyaYP/Kk
 QUfzxb1KDStz9dlgI7nBBOlQY7mS0jJymZc4JlZw4IF+ZSBGvGA5xVgWUn2vb85mm/6sOCcDizn
 ysgYo6Bl4YwOH1LQrCIMOvtLdx2EgfpkDmkig9QteDP6r3UXwQUV3iG+X0w46kcf7wvgDYdpHhH
 6k6dHcVk/BWSbWCY1k3Hy4rXRWmch85qQTnY12w4aGi5j2BfBZeAcZ3nVuRNeN026GQfvIXDh5y
 0zu5lkUlg0aiH6EsXU6UQmJG/IATb/8r8gSV50VWUon+GOwDdHI6OcGGYKlUHFcWBrpOdGaeSpb
 orpwMgoAbzYT2gvSPS1UAtlg/bs6gq6YjyA3x1mm19wy1ux4yY7q53P+Oz9UAfqTYpGQYofn/cG
 XLy5u+yMAiKmIJFSpMaliWPdcRnbmCynwcIZulo8IHMq80pkSWPuR6H8O5LxTzU0OZNHUYsYHbw
 dvHXWuOL6B+qzOYSNEVWI9SBF4a9icPSWQ1ooKTbt7XF+5RuxOkymCUhRONJCwetNsRm/IUYAxC
 BxCTt++Vmnonh2w==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
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
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Francesco Dolcini <francesco@dolcini.it>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The IRQ setup code is overly complex. All we really need to do is
initialize the related fields in struct tidss_device, and request the
IRQ.

We can drop all the HW accesses, as they are pointless: the driver will
set the IRQs correctly when it needs any of the IRQs, and at probe time
we have done a reset, so we know that all the IRQs are masked by default
in the hardware.

Thus we can combine the tidss_irq_preinstall() and
tidss_irq_postinstall() into the tidss_irq_install() function, drop the
HW accesses, and drop the use of spinlock, as this is done at init time
and there can be no races.

We can also drop the HW access from the tidss_irq_uninstall(), as the
driver will anyway disable and suspend the hardware at remove time.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/tidss/tidss_drv.c |  2 ++
 drivers/gpu/drm/tidss/tidss_irq.c | 54 ++++++---------------------------------
 2 files changed, 10 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
index f51c87e26e10..490d15ed2216 100644
--- a/drivers/gpu/drm/tidss/tidss_drv.c
+++ b/drivers/gpu/drm/tidss/tidss_drv.c
@@ -138,6 +138,8 @@ static int tidss_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, tidss);
 
+	spin_lock_init(&tidss->wait_lock);
+
 	ret = dispc_init(tidss);
 	if (ret) {
 		dev_err(dev, "failed to initialize dispc: %d\n", ret);
diff --git a/drivers/gpu/drm/tidss/tidss_irq.c b/drivers/gpu/drm/tidss/tidss_irq.c
index 0c681c7600bc..604334ef526a 100644
--- a/drivers/gpu/drm/tidss/tidss_irq.c
+++ b/drivers/gpu/drm/tidss/tidss_irq.c
@@ -93,33 +93,21 @@ void tidss_irq_resume(struct tidss_device *tidss)
 	spin_unlock_irqrestore(&tidss->wait_lock, flags);
 }
 
-static void tidss_irq_preinstall(struct drm_device *ddev)
-{
-	struct tidss_device *tidss = to_tidss(ddev);
-
-	spin_lock_init(&tidss->wait_lock);
-
-	tidss_runtime_get(tidss);
-
-	dispc_set_irqenable(tidss->dispc, 0);
-	dispc_read_and_clear_irqstatus(tidss->dispc);
-
-	tidss_runtime_put(tidss);
-}
-
-static void tidss_irq_postinstall(struct drm_device *ddev)
+int tidss_irq_install(struct drm_device *ddev, unsigned int irq)
 {
 	struct tidss_device *tidss = to_tidss(ddev);
-	unsigned long flags;
-	unsigned int i;
+	int ret;
 
-	tidss_runtime_get(tidss);
+	if (irq == IRQ_NOTCONNECTED)
+		return -ENOTCONN;
 
-	spin_lock_irqsave(&tidss->wait_lock, flags);
+	ret = request_irq(irq, tidss_irq_handler, 0, ddev->driver->name, ddev);
+	if (ret)
+		return ret;
 
 	tidss->irq_mask = DSS_IRQ_DEVICE_OCP_ERR;
 
-	for (i = 0; i < tidss->num_crtcs; ++i) {
+	for (unsigned int i = 0; i < tidss->num_crtcs; ++i) {
 		struct tidss_crtc *tcrtc = to_tidss_crtc(tidss->crtcs[i]);
 
 		tidss->irq_mask |= DSS_IRQ_VP_SYNC_LOST(tcrtc->hw_videoport);
@@ -127,28 +115,6 @@ static void tidss_irq_postinstall(struct drm_device *ddev)
 		tidss->irq_mask |= DSS_IRQ_VP_FRAME_DONE(tcrtc->hw_videoport);
 	}
 
-	tidss_irq_update(tidss);
-
-	spin_unlock_irqrestore(&tidss->wait_lock, flags);
-
-	tidss_runtime_put(tidss);
-}
-
-int tidss_irq_install(struct drm_device *ddev, unsigned int irq)
-{
-	int ret;
-
-	if (irq == IRQ_NOTCONNECTED)
-		return -ENOTCONN;
-
-	tidss_irq_preinstall(ddev);
-
-	ret = request_irq(irq, tidss_irq_handler, 0, ddev->driver->name, ddev);
-	if (ret)
-		return ret;
-
-	tidss_irq_postinstall(ddev);
-
 	return 0;
 }
 
@@ -156,9 +122,5 @@ void tidss_irq_uninstall(struct drm_device *ddev)
 {
 	struct tidss_device *tidss = to_tidss(ddev);
 
-	tidss_runtime_get(tidss);
-	dispc_set_irqenable(tidss->dispc, 0);
-	tidss_runtime_put(tidss);
-
 	free_irq(tidss->irq, ddev);
 }

-- 
2.34.1

