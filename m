Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B719186066
	for <lists+dri-devel@lfdr.de>; Mon, 16 Mar 2020 00:19:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEEED6E23F;
	Sun, 15 Mar 2020 23:19:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp03.smtpout.orange.fr
 [80.12.242.125])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D31D6E220
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Mar 2020 19:42:49 +0000 (UTC)
Received: from localhost.localdomain ([93.22.37.174]) by mwinf5d57 with ME
 id Ejij2200K3lSDvh03jijNx; Sun, 15 Mar 2020 20:42:47 +0100
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 15 Mar 2020 20:42:47 +0100
X-ME-IP: 93.22.37.174
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: robdclark@gmail.com, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
 dianders@chromium.org
Subject: [PATCH] drm/msm: Fix an error handling path 'msm_drm_init()'
Date: Sun, 15 Mar 2020 20:42:39 +0100
Message-Id: <20200315194239.28785-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 15 Mar 2020 23:19:06 +0000
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
Cc: linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If this memory allocation fails, we have to go through the error handling
path to perform some clean-up, as already done in other other paths of
this function.

Fixes: db735fc4036b ("drm/msm: Set dma maximum segment size for mdss")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpu/drm/msm/msm_drv.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 2a82c23a6e4d..29295dee2a2e 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -444,8 +444,10 @@ static int msm_drm_init(struct device *dev, struct drm_driver *drv)
 	if (!dev->dma_parms) {
 		dev->dma_parms = devm_kzalloc(dev, sizeof(*dev->dma_parms),
 					      GFP_KERNEL);
-		if (!dev->dma_parms)
-			return -ENOMEM;
+		if (!dev->dma_parms) {
+			ret = -ENOMEM;
+			goto err_msm_uninit;
+		}
 	}
 	dma_set_max_seg_size(dev, DMA_BIT_MASK(32));
 
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
