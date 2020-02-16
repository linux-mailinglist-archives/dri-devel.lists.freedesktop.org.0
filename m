Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B067160CE2
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2020 09:21:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48B026E7D0;
	Mon, 17 Feb 2020 08:20:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61F1389BF4
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Feb 2020 15:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1581868713; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=euW6vOeEXRNCpOLcFmuhhSlyzof0lbP27ls/IkheQ7E=;
 b=s1ZPUDAQHlYJWMS0XZmG7j7/K3bIsZh1BdvwMjHBtHbB7MCBtq0oHJnBl+WXkflcMc8yGA
 7aS++Wirv/IuMH3nNApbhX5r4X5v62NKqcNfxs/u/GYK8fbymRkYM0PDPb7lG2CKHd+qS0
 45RNQZdbVfdUCegLkxLdlIXFnjAw4wE=
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 2/3] gpu/drm: ingenic: Switch emulated fbdev to 16bpp
Date: Sun, 16 Feb 2020 12:58:10 -0300
Message-Id: <20200216155811.68463-2-paul@crapouillou.net>
In-Reply-To: <20200216155811.68463-1-paul@crapouillou.net>
References: <20200216155811.68463-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 17 Feb 2020 08:20:47 +0000
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
Cc: Paul Cercueil <paul@crapouillou.net>, od@zcrc.me,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The fbdev emulation is only ever used on Ingenic SoCs to run old SDL1
based games at 16bpp (rgb565). Recent applications generally talk to
DRM directly, and can request their favourite pixel format; so we can
make everybody happy by switching the emulated fbdev to 16bpp.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/ingenic/ingenic-drm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm.c b/drivers/gpu/drm/ingenic/ingenic-drm.c
index 034961a40e98..9aa88fabbd2a 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm.c
@@ -808,7 +808,7 @@ static int ingenic_drm_probe(struct platform_device *pdev)
 		goto err_devclk_disable;
 	}
 
-	ret = drm_fbdev_generic_setup(drm, 32);
+	ret = drm_fbdev_generic_setup(drm, 16);
 	if (ret)
 		dev_warn(dev, "Unable to start fbdev emulation: %i", ret);
 
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
