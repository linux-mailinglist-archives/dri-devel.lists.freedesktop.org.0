Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC4796FC50
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 21:47:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D65310EAED;
	Fri,  6 Sep 2024 19:47:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="E4G3y5qP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-27.smtpout.orange.fr
 [80.12.242.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C02CE10EAED
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 19:47:22 +0000 (UTC)
Received: from fedora.home ([90.11.132.44]) by smtp.orange.fr with ESMTPA
 id mevBsT9PpGrBemevBsXT6K; Fri, 06 Sep 2024 21:47:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1725652040;
 bh=+Da3YG45hYBpjGQbOAK9bnsoiqlIfkN8ZztMmx3F5yk=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=E4G3y5qPUbQ0ybAxno9HO49+HCCyR9DDuZR0Q2jV3MWK6exeZ5zoDY7lr0x/UALpT
 y+vBnTduSgfIhWgYOkzU8ApCFhnR5DZ7iL6jE55pF1x+men2aiCGUnhWJQ0oX8Tgng
 4q8/TTMBhUj6AsXln/f9GvBsHjaFBLixe+aYDmI/bg/I7WXzvsAPY0fF+BDkh372J0
 2Eb0KTU8BCVSmRqDst2CYj2b2aNUQ5YWVjcKIRY4XRF2coIKRDGKFQcYE/FQtfMxsW
 zxXQa0kcUtlEbau6xQDhxqnJis3aLD2sLQDC/jl+plgWAPJhWjNhQB7vBlPECayMKM
 QVWA17oN+hx1g==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 06 Sep 2024 21:47:20 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Jani Nikula <jani.nikula@intel.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Simona Vetter <simona.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [PATCH] drm/ipuv3/parallel: Fix an error handling path in
 imx_pd_probe()
Date: Fri,  6 Sep 2024 21:47:00 +0200
Message-ID: <1cdd8523443d8850c5531462b30064cb2058924a.1725651992.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
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

If component_add() fails, we need to undo a potential previous
drm_edid_alloc() call.

Add an error handling path and the missing drm_edid_free(), as already done
in the reomve function.

Fixes: 42e08287a318 ("drm/ipuv3/parallel: convert to struct drm_edid")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpu/drm/imx/ipuv3/parallel-display.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/parallel-display.c b/drivers/gpu/drm/imx/ipuv3/parallel-display.c
index 91d7808a2d8d..6d51203f7f0f 100644
--- a/drivers/gpu/drm/imx/ipuv3/parallel-display.c
+++ b/drivers/gpu/drm/imx/ipuv3/parallel-display.c
@@ -350,7 +350,15 @@ static int imx_pd_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, imxpd);
 
-	return component_add(dev, &imx_pd_ops);
+	ret = component_add(dev, &imx_pd_ops);
+	if (ret)
+		goto free_edid;
+
+	return 0;
+
+free_edid:
+	drm_edid_free(imxpd->drm_edid);
+	return ret;
 }
 
 static void imx_pd_remove(struct platform_device *pdev)
-- 
2.46.0

