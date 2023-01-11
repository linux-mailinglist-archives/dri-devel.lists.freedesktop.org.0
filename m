Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1935E665F74
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 16:42:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 658E810E77B;
	Wed, 11 Jan 2023 15:41:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A70110E771
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 15:41:30 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 ay12-20020a05600c1e0c00b003d9ea12bafcso9269198wmb.3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 07:41:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uA+tPLir+1X4c7NIGPD8fbGsyIZBKsPUjYPi9h9kAc8=;
 b=eNQu3m5MBYcJ4ir7wnU2uKSOdOlTVnwwoNbl7ndwmx7pL0oaymY4tJ+VPavmH4gWu3
 ctX/ciqpqll+Gi0G39VkzdIVV+zIy+55w4NRmQ48GvAAagPpdV92t11x9dtuCypNqs8x
 VKs1+2qNooBYEQ/WTCaaYQDd8eQZXRMv5YgkU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uA+tPLir+1X4c7NIGPD8fbGsyIZBKsPUjYPi9h9kAc8=;
 b=MqO/3rf8E4L4VFJM0B3ntJrBUba8R5TylSLoBXcBx9DZw8+nJOXtcs6jsrrd0ISDw7
 MUPBVSOUbRMmF5iMtBXatoXNN6ccOjIqRQ60MzgdFXuDj4PNVaEQGFjrelL4m1U5oKI7
 MyqYp+P6s+OcVOhxLkUc815MIJcBXY86Bx1kwbGpS6RqNCV0rLZ8FCECAyuOrEbXJ3M4
 DXwgTiFwYY+OLI4EqeTF3BlhDEWO35m/KOso0trE439r6UHF7uhuLHAcxVXeKylOvmar
 dwb/YdS6fWCIlnL/dGvj7vUAcgYk14T5blruTf9uuTSbqZ7kC8LT2tfJzbpWKxvt2I2e
 L7aA==
X-Gm-Message-State: AFqh2koK7v0cHgOoLmCIHotRbBWEPvb90adBlAGVL3jd0on7YFAIIENN
 BuCPsaszFHVxkfGuVFPLxbOBp1E6s4skDdBC
X-Google-Smtp-Source: AMrXdXvP0g7aBxRONWD/2hWDOWNy8uqW2LewLgFiVP8szo0yPD2T/n1jDfUyAtI8xKF52PjIaacOWg==
X-Received: by 2002:a05:600c:4f83:b0:3d2:3f55:f73f with SMTP id
 n3-20020a05600c4f8300b003d23f55f73fmr53421615wmq.8.1673451688237; 
 Wed, 11 Jan 2023 07:41:28 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 t9-20020a05600c198900b003d9e74dd9b2sm15936149wmq.9.2023.01.11.07.41.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jan 2023 07:41:27 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 06/11] staging/lynxfb: Use pci aperture helper
Date: Wed, 11 Jan 2023 16:41:07 +0100
Message-Id: <20230111154112.90575-6-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230111154112.90575-1-daniel.vetter@ffwll.ch>
References: <20230111154112.90575-1-daniel.vetter@ffwll.ch>
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
Cc: linux-fbdev@vger.kernel.org, Teddy Wang <teddy.wang@siliconmotion.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Daniel Vetter <daniel.vetter@intel.com>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It exists! Note that since this is an exact copy, there shouldn't be
any functional difference here.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: Teddy Wang <teddy.wang@siliconmotion.com>
Cc: linux-fbdev@vger.kernel.org
---
 drivers/staging/sm750fb/sm750.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index effc7fcc3703..22ace3168723 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -989,20 +989,6 @@ static int sm750fb_framebuffer_alloc(struct sm750_dev *sm750_dev, int fbidx)
 	return err;
 }
 
-static int lynxfb_kick_out_firmware_fb(struct pci_dev *pdev)
-{
-	resource_size_t base = pci_resource_start(pdev, 0);
-	resource_size_t size = pci_resource_len(pdev, 0);
-	bool primary = false;
-
-#ifdef CONFIG_X86
-	primary = pdev->resource[PCI_ROM_RESOURCE].flags &
-					IORESOURCE_ROM_SHADOW;
-#endif
-
-	return aperture_remove_conflicting_devices(base, size, primary, "sm750_fb1");
-}
-
 static int lynxfb_pci_probe(struct pci_dev *pdev,
 			    const struct pci_device_id *ent)
 {
@@ -1011,7 +997,7 @@ static int lynxfb_pci_probe(struct pci_dev *pdev,
 	int fbidx;
 	int err;
 
-	err = lynxfb_kick_out_firmware_fb(pdev);
+	err = aperture_remove_conflicting_pci_devices(pdev, "sm750_fb1");
 	if (err)
 		return err;
 
-- 
2.39.0

