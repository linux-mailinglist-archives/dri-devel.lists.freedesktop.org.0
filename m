Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FAE26DE04
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 16:21:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CD7E6E2B0;
	Thu, 17 Sep 2020 14:21:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EEFE6E2B0
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 14:21:54 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id l15so4557506wmh.1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 07:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=5FnmYtdXAn2GfXn0e/JA4kujHMKHfd/DBUE2dQvYwgc=;
 b=Gf2VHjDfGmm9jrDvmYL4jz5y45xySJnjysTrqANbMzxQPRjuOMt72KfrKD71HetTlL
 GKhqe6MfA46drBGR0zd8zud/Pa7hEGUl1JdkL8LikUjqK/mpJhKqQeJEO6ahRwOcLkd1
 MRHJejKac8RXl42/N9CklbXNdsbH5Rn5R96UvSkhRbQ9Z32n5qVCRog4xjPJwsB7bdu7
 drXNTEyy/gq7khARyXSpioNWh/1l0NWmpIMa3I2K81Ca5GrcvgFpfHIw7nMKGI04WPDb
 Ln984b+6/EO0xisuNQvf3weBsEWIKa96jGoeAP44rZdEytQCTT+EUjA16G0V3PODIwpu
 KIcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=5FnmYtdXAn2GfXn0e/JA4kujHMKHfd/DBUE2dQvYwgc=;
 b=RhHoQ0bX60DwqHXFMseQAfTyZAbMQY9GFatap2eY9I+o1G9nnndC+DidnfRA5uhDQh
 dy+NJw2848YloVavPIA2Z18QyX1mIT1mp1QbAiWjZw50QjshFyn/BdwodW5YDGHG66TZ
 /EycxEysdcnvBMG/Gsm40Hf8WbIcFdvb6x1MDN3SbyDBTAQbPyQSpEM4Wff472hq7jvT
 n0Ho8TH+6N5YXU/6pJz58qm2Cw32d4oX/7KI15p7LJsyzQHeewXYo479iaZ5vcoRxq8p
 6wRBiVx4yVQV/vRfmZ4uPZ88HNj2e6RAXD/OyRsqyT3ABQVqVAc6Y8czoNkKkMK+7i1h
 W4ww==
X-Gm-Message-State: AOAM533wHx7SSJUR8v4/L71P4fsarBRD2B9ef9WxwkPcChXJWVl+g5lT
 xbrtPVuCqSfUYJCQiOD48WUQ7pW+hzDb0w==
X-Google-Smtp-Source: ABdhPJycYUiauYLP6RHWxZ07Hqg0M6H3AS73hlY+BtUCrt3NweQ9aMj6lSlkhiWeCUDRIlwak8XZ+w==
X-Received: by 2002:a1c:bcd6:: with SMTP id m205mr8037634wmf.68.1600352513274; 
 Thu, 17 Sep 2020 07:21:53 -0700 (PDT)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
 by smtp.gmail.com with ESMTPSA id w14sm42327866wrk.95.2020.09.17.07.21.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2020 07:21:52 -0700 (PDT)
Date: Thu, 17 Sep 2020 11:21:45 -0300
From: Melissa Wen <melissa.srw@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>
Subject: [PATCH] drm/vgem: validate vgem_device before exit operations
Message-ID: <20200917142145.ipcxb2zo4up357t2@smtp.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds a check for the vgem_device before handling it.

Signed-off-by: Melissa Wen <melissa.srw@gmail.com>
---
 drivers/gpu/drm/vgem/vgem_drv.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vgem_drv.c
index cb884c890065..119ca887cb8a 100644
--- a/drivers/gpu/drm/vgem/vgem_drv.c
+++ b/drivers/gpu/drm/vgem/vgem_drv.c
@@ -472,7 +472,14 @@ static int __init vgem_init(void)
 
 static void __exit vgem_exit(void)
 {
-	struct platform_device *pdev = vgem_device->platform;
+	struct platform_device *pdev;
+
+	if (!vgem_device) {
+		DRM_INFO("vgem_device is NULL\n");
+		return;
+	}
+
+	pdev = vgem_device->platform;
 
 	drm_dev_unregister(&vgem_device->drm);
 	devres_release_group(&pdev->dev, NULL);
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
