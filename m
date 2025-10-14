Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E4CBD909F
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 13:31:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6337B10E218;
	Tue, 14 Oct 2025 11:31:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Qr6AoFSx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE03710E218
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 11:31:22 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id B99A74E4108E;
 Tue, 14 Oct 2025 11:31:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8DD46606EC;
 Tue, 14 Oct 2025 11:31:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9AD5D102F2298; 
 Tue, 14 Oct 2025 13:31:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1760441480; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=51CzKYDEx2a9yVAc768Na++IHptYoF7LDAE19Kl4+7I=;
 b=Qr6AoFSxr32F6mDxxdYbBXAVT1ujiJP11N7z44icP/Q/PhLiq34zX+VKaBACkajgO2Qh52
 3ZwUKEzfQNxycfhwM+xsCRcoF7nALRDLf91eUj1BWm8asG5Om8Cov7twUwCernFzfA4sBU
 pE8Fk4Poj1I1SlLMbSddA9snbZn0rv0sMg/kWEzmYnoAv4AyfcS1V+N5+mQHI1oUzC/AEO
 IqY3dYgeZZ/rmPLxrRLNr33Y2if9OaHrPfZq+2ThmtGwPpaJ7KANXaSxhVB42XifeODsVr
 eq8gkI7zyqYMn9OeSURX9WmtWIJJjO2qy5QG4psRL5BSYBJLqK1nK09QvWS6iQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 14 Oct 2025 13:30:52 +0200
Subject: [PATCH 2/2] drm/imx: parallel-display: add the bridge before
 attaching it
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-drm-bridge-alloc-imx-ipuv3-v1-2-a1bb1dcbff50@bootlin.com>
References: <20251014-drm-bridge-alloc-imx-ipuv3-v1-0-a1bb1dcbff50@bootlin.com>
In-Reply-To: <20251014-drm-bridge-alloc-imx-ipuv3-v1-0-a1bb1dcbff50@bootlin.com>
To: Ernest Van Hoecke <ernestvanhoecke@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
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

Invoking drm_bridge_add() is good practice, so add it to this driver.

Link: https://lore.kernel.org/all/DDHZ5GO9MPF0.CGYTVBI74FOZ@bootlin.com
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Note: there is a proposal to make drm_bridge_add() mandatory before
drm_bridge_attach():
https://lore.kernel.org/lkml/20251003-b4-drm-bridge-alloc-add-before-attach-v1-3-92fb40d27704@bootlin.com/
---
 drivers/gpu/drm/imx/ipuv3/parallel-display.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/imx/ipuv3/parallel-display.c b/drivers/gpu/drm/imx/ipuv3/parallel-display.c
index 3d0de9c6e925978b7532b6d13caf6909cc343dd7..7fc6af7033078eef6be0672ff0d1c7bddda88ba1 100644
--- a/drivers/gpu/drm/imx/ipuv3/parallel-display.c
+++ b/drivers/gpu/drm/imx/ipuv3/parallel-display.c
@@ -256,6 +256,8 @@ static int imx_pd_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, imxpd);
 
+	devm_drm_bridge_add(dev, &imxpd->bridge);
+
 	return component_add(dev, &imx_pd_ops);
 }
 

-- 
2.51.0

