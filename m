Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DD2790430
	for <lists+dri-devel@lfdr.de>; Sat,  2 Sep 2023 01:42:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38AFE10E83B;
	Fri,  1 Sep 2023 23:42:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F8A810E839
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 23:42:52 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-68a440a8a20so2165969b3a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Sep 2023 16:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1693611771; x=1694216571;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hHay3IZ79gwyzzJIvA/KLviDPDyXcoAjtR8WZOwFgDw=;
 b=JqNxfGfGIg9p/Ioaix3E1fCYp7u9wuAdBIBGvQ90GS1kMVdK9SHlPrCOjl7OCNBPbV
 Cs1sLH0cpWUfQBctHkMRDNGoWd5r/XN85VT00VV7z3CeRUasUobVscMX8liHJdlalbNS
 8VvT08+nsn3MoITpo02O6o0UClgZGsVfB9jYI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693611771; x=1694216571;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hHay3IZ79gwyzzJIvA/KLviDPDyXcoAjtR8WZOwFgDw=;
 b=aQQN/Dt6TrCpwnRoMrIwDOHds9gL6FFr5TO3PuvHWzcvqi3TlK5Plcgq8jzblEqy0Z
 wZTY7ILMwCztpeNTtkQ1ckL+6ZcW2Zwl/vmdCAIrG6ZbTRwJbPMIC3QxUSFZN8K2khZ2
 0geVZKftkaP0wJ9BDqIMk/6O6QXMgV+0SqHvP5T8Ht4Ea0QKXviLxVm3KOrR+Zeu49Xp
 PEbuL89mQhhEQOm8Tjr8nE5cKSKRwkBgwp3Yy6PnA0SOwtwjjGKJdtaYs/C8FsM9hg2D
 g2mvzBf6TwyoS6iTli8Iyke/E3uvGaYcGWt7FR5HHQJ3P6NlyWLAC4o418n++dj1qXxD
 G1Eg==
X-Gm-Message-State: AOJu0YwT7++ZX8Tq5lnBWs4u9goOEkzNmjDCXXxodVHa9PGPdfhFxvhH
 MWtS+RsMSE83ETYO+oa+CA/y9CVl75YYZ30l8Z1DoYx1
X-Google-Smtp-Source: AGHT+IHY7t2zN6rtVOOQuBIslh6uo5hZExLEtoUk+kZCKL2mIpIBCiF+lomwnDGZdtLEJFAPIrODXQ==
X-Received: by 2002:a05:6a20:2cf:b0:14d:382c:f354 with SMTP id
 15-20020a056a2002cf00b0014d382cf354mr3916743pzb.36.1693611770966; 
 Fri, 01 Sep 2023 16:42:50 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:8d94:1fc5:803c:41cc])
 by smtp.gmail.com with ESMTPSA id
 o9-20020a639a09000000b0056c3a4a3ca5sm3326390pge.36.2023.09.01.16.42.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Sep 2023 16:42:50 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Subject: [RFT PATCH 12/15] drm/gma500: Call drm_helper_force_disable_all() at
 shutdown/remove time
Date: Fri,  1 Sep 2023 16:41:23 -0700
Message-ID: <20230901164111.RFT.12.I1be622999c3b23f28f077fc75bb0319396a216e9@changeid>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
In-Reply-To: <20230901234202.566951-1-dianders@chromium.org>
References: <20230901234202.566951-1-dianders@chromium.org>
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
Cc: Douglas Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Based on grepping through the source code, this driver appears to be
missing a call to drm_atomic_helper_shutdown(), or in this case the
non-atomic equivalent drm_helper_force_disable_all(), at system
shutdown time and at driver remove time. This is important because
drm_helper_force_disable_all() will cause panels to get disabled
cleanly which may be important for their power sequencing. Future
changes will remove any custom powering off in individual panel
drivers so the DRM drivers need to start getting this right.

The fact that we should call drm_atomic_helper_shutdown(), or in this
case the non-atomic equivalent drm_helper_force_disable_all(), in the
case of OS shutdown/restart comes straight out of the kernel doc
"driver instance overview" in drm_drv.c.

Suggested-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
This commit is only compile-time tested.

 drivers/gpu/drm/gma500/psb_drv.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
index 8b64f61ffaf9..a5a399bbe8f5 100644
--- a/drivers/gpu/drm/gma500/psb_drv.c
+++ b/drivers/gpu/drm/gma500/psb_drv.c
@@ -20,6 +20,7 @@
 #include <acpi/video.h>
 
 #include <drm/drm.h>
+#include <drm/drm_crtc_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
 #include <drm/drm_ioctl.h>
@@ -485,6 +486,12 @@ static void psb_pci_remove(struct pci_dev *pdev)
 	struct drm_device *dev = pci_get_drvdata(pdev);
 
 	drm_dev_unregister(dev);
+	drm_helper_force_disable_all(dev);
+}
+
+static void psb_pci_shutdown(struct pci_dev *pdev)
+{
+	drm_helper_force_disable_all(pci_get_drvdata(pdev));
 }
 
 static DEFINE_RUNTIME_DEV_PM_OPS(psb_pm_ops, gma_power_suspend, gma_power_resume, NULL);
@@ -521,6 +528,7 @@ static struct pci_driver psb_pci_driver = {
 	.id_table = pciidlist,
 	.probe = psb_pci_probe,
 	.remove = psb_pci_remove,
+	.shutdown = psb_pci_shutdown,
 	.driver.pm = &psb_pm_ops,
 };
 
-- 
2.42.0.283.g2d96d420d3-goog

