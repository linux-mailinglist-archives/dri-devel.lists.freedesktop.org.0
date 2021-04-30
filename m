Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 009D636F713
	for <lists+dri-devel@lfdr.de>; Fri, 30 Apr 2021 10:27:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D14176ECF3;
	Fri, 30 Apr 2021 08:27:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8DD76ECF1
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 08:27:50 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id d11so11737325wrw.8
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 01:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x12D1fSgMXo84/StrNDXFY95BOlA8w3dEtySPm5wCgQ=;
 b=q5RkY2TEzEE6oWZZbW+87d2glkkz6bArkK6G7aeyOTL/H6i5S97xaGLHvQ7feTUwKC
 1yaM5gV/avDemn8LUsrGG4ttN8Njingl5hDQcXiFweWa77q5BSlgh8DTBXxWlaQQXQ4k
 r1lSJznmcSEPRoyRX6erX7SDkpU6d2SLI6M8bWaGqGtY1ruPepci6ZZIwFNRYe5YKJa3
 yjAHDDUPwDNtlN2+gWew99O3ATqgPaq1drQVwYnfKrBxevD6IPejzjmuF6NGbn7gSLsS
 uOmK0IYiYEIpsf4jXL+Yqb+Qsa02G5V/KRmeYGuii/TEAavD6FHr3X7gsIieEtzPeQj7
 wX1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x12D1fSgMXo84/StrNDXFY95BOlA8w3dEtySPm5wCgQ=;
 b=Sv0PpV8e+khHuSU8Ep882y+Ydp1DQBLrG4OCpVVS1PoXTXi0CYlOKHja0+alPGPw2m
 ys1zVlylDLxsqHGiFhrQNwnvI2GmuZAomByhB3z7GrZOkN+uxgMv8CouHE2bl8nNMDBR
 oFOXs/eoDdbWfogF9JFYKTOkR1w9L3d2cBLvSDAllIlW4ZXXv6WOsmvCCDun7TXmtE9B
 HobALrDV4d8FWOEezqD7q9OKIbNDIzo2+f6HGrxcieB1STjG8SW7+lH45JZPPzReieoq
 k5VNP5WHzmRUBjQ+XoiT1PT/0zE7VOb15EvsyARmBS+qEOntMz+YgcutzPALgtD9vxsA
 Pe+A==
X-Gm-Message-State: AOAM530lPlG8NeRS9HuCg18q6jriWYtG3JQivbCCIIKuPML7q/FImgSV
 cOOg2kQI5izzcw8ZJxKj5KZbUcUSuV39hT1W
X-Google-Smtp-Source: ABdhPJxGoyaka1SwUgXjXPuWPXVdSHHYtgAfq3tVpjG7MANHxCuZPbgUWnsHDmVM463gHiGYmCPtyg==
X-Received: by 2002:adf:efca:: with SMTP id i10mr1630979wrp.284.1619771268768; 
 Fri, 30 Apr 2021 01:27:48 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:4a89:8c32:4adc:fc67])
 by smtp.gmail.com with ESMTPSA id
 e12sm1336677wrt.51.2021.04.30.01.27.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 01:27:47 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/meson: fix shutdown crash when component not probed
Date: Fri, 30 Apr 2021 10:27:44 +0200
Message-Id: <20210430082744.3638743-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When main component is not probed, by example when the dw-hdmi module is
not loaded yet or in probe defer, the following crash appears on shutdown:

Unable to handle kernel NULL pointer dereference at virtual address 0000000000000038
...
pc : meson_drv_shutdown+0x24/0x50
lr : platform_drv_shutdown+0x20/0x30
...
Call trace:
meson_drv_shutdown+0x24/0x50
platform_drv_shutdown+0x20/0x30
device_shutdown+0x158/0x360
kernel_restart_prepare+0x38/0x48
kernel_restart+0x18/0x68
__do_sys_reboot+0x224/0x250
__arm64_sys_reboot+0x24/0x30
...

Simply check if the priv struct has been allocated before using it.

Fixes: fa0c16caf3d7 ("drm: meson_drv add shutdown function")
Reported-by: Stefan Agner <stefan@agner.ch>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/meson/meson_drv.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index 453d8b4c5763..07fcd12dca16 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -485,11 +485,12 @@ static int meson_probe_remote(struct platform_device *pdev,
 static void meson_drv_shutdown(struct platform_device *pdev)
 {
 	struct meson_drm *priv = dev_get_drvdata(&pdev->dev);
-	struct drm_device *drm = priv->drm;
 
-	DRM_DEBUG_DRIVER("\n");
-	drm_kms_helper_poll_fini(drm);
-	drm_atomic_helper_shutdown(drm);
+	if (!priv)
+		return;
+
+	drm_kms_helper_poll_fini(priv->drm);
+	drm_atomic_helper_shutdown(priv->drm);
 }
 
 static int meson_drv_probe(struct platform_device *pdev)
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
