Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A09C6D6DCE
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 22:18:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 388DC10E79F;
	Tue,  4 Apr 2023 20:18:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 255CA10E79F
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 20:18:47 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id er13so94501071edb.9
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Apr 2023 13:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1680639525;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=v8jR+JhVCEnNPPxxCLey69HJ6bOpFLkEFDu5RIj5lCQ=;
 b=CF3IsDvY6dbEEipZWbZecaB37m03mDmQee26T2SFkUKX7uUiS6WgmAfFWdfr/xo9pg
 Df+9rE/8viBPRfR1w+7r9v3aj7BfD3mNTeOavSozjciQzIW/xKxSnHxT3HwL8pACaTdn
 +UChul2klVrq4mbeJHYKxGH7AajhXYHoTO93A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680639525;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v8jR+JhVCEnNPPxxCLey69HJ6bOpFLkEFDu5RIj5lCQ=;
 b=mfcCPflPStrq8L/aL5t9LAvV/v9JBjICffaFydSvGPHPS4wTS+Fo+iPFDc1QLyU6OF
 YNk0Ax+j/9eDkl/KKFVnI8fsc4z3ZcmG8CTx711h91FTEKzYgjeSL7D0t1U4xRWsT9W+
 qwnIkvP2sz9ILrKNBkmMPlgBGUDrX3sIJhe/6m/0la00XwpsbG4lz8Dd8IRNwaZNCSJr
 XuKJ3HQt7NI9lrCraBhTlPI5rrBxRoBCZvSRek7GyR3ibR0i6BH9X2T1x7J9FTCk0Kve
 fei9i/bhPQsmOAm52L5CtGE9sWUOJZkDMbQMhLwPzR0zxEvhUcoW1Q/cLV2TSCE2T7tv
 /z+g==
X-Gm-Message-State: AAQBX9dfs+AMAp67GF4WZa/BJFQqxTOvWdJzMQsEQP/kEte4XU282LN0
 0pfMqq+8MUA5L9/lICTGE6DQFMD7SNkKlrhsQn4=
X-Google-Smtp-Source: AKy350bsqIb6bhwWYVrLpFa0mQtIxSkLSapSGL/+ogxl2OMRYOXLKUNNTNqVQMeVfYdPtm9a3hx8Sg==
X-Received: by 2002:a05:6402:35cb:b0:502:c397:adc8 with SMTP id
 z11-20020a05640235cb00b00502c397adc8mr1534431edc.1.1680639525501; 
 Tue, 04 Apr 2023 13:18:45 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 u12-20020a50c04c000000b004d8d2735251sm6367986edd.43.2023.04.04.13.18.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 13:18:45 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/8] drm/gma500: Use
 drm_aperture_remove_conflicting_pci_framebuffers
Date: Tue,  4 Apr 2023 22:18:35 +0200
Message-Id: <20230404201842.567344-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.40.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This one nukes all framebuffers, which is a bit much. In reality
gma500 is igpu and never shipped with anything discrete, so there should
not be any difference.

v2: Unfortunately the framebuffer sits outside of the pci bars for
gma500, and so only using the pci helpers won't be enough. Otoh if we
only use non-pci helper, then we don't get the vga handling, and
subsequent refactoring to untangle these special cases won't work.

It's not pretty, but the simplest fix (since gma500 really is the only
quirky pci driver like this we have) is to just have both calls.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/gma500/psb_drv.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
index 2ce96b1b9c74..f1e0eed8fea4 100644
--- a/drivers/gpu/drm/gma500/psb_drv.c
+++ b/drivers/gpu/drm/gma500/psb_drv.c
@@ -422,12 +422,17 @@ static int psb_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	/*
 	 * We cannot yet easily find the framebuffer's location in memory. So
-	 * remove all framebuffers here.
+	 * remove all framebuffers here. Note that we still want the pci special
+	 * handling to kick out vgacon.
 	 *
 	 * TODO: Refactor psb_driver_load() to map vdc_reg earlier. Then we
 	 *       might be able to read the framebuffer range from the device.
 	 */
-	ret = drm_aperture_remove_framebuffers(true, &driver);
+	ret = drm_aperture_remove_framebuffers(false, &driver);
+	if (ret)
+		return ret;
+
+	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, &driver);
 	if (ret)
 		return ret;
 
-- 
2.40.0

