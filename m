Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DC97A9D25
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 21:28:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B3A010E5FA;
	Thu, 21 Sep 2023 19:28:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A15EB10E5FE
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 19:28:47 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1c328b53aeaso11710205ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 12:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1695324526; x=1695929326;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vNE7U3MRFdvHzy3AatqQxrB+Rii45BA8np0vc2lW0nQ=;
 b=TwNBy3PHbyw/XT5wPpPP7CoWwJWOeUiTVuVk3S4L3JEmhXShC9pw8O2f2pzWwTvwNN
 Idc6hdW463V1aqoxxM5dUFfhtsNE5BIE3BEypTtVKMIzzrV4P0Pgtg4W3Levwq18okZC
 KUoE4L7HIDIzUb0acTDETL/XhkJoAgxDUspz0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695324526; x=1695929326;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vNE7U3MRFdvHzy3AatqQxrB+Rii45BA8np0vc2lW0nQ=;
 b=JKQoaCz4Z0nAa94+OcFf8rgA/Y6HuOl2NLoxUgbIIwO5gac2c31gEuw6jk4ffWunPE
 KLKQ99qgQg3ulyvKS/uUSE0Klubpe+mnuqJuxRpGwAXQ300lEmHi4/IJusWyW6lANCYY
 yH7ULXNfp4kprgLOdzmmAdcbhh7aPh9c83b0L51M99NETRNy79R4COxN7X2r1qCHyna4
 c1nw9PJwvWZ9XKcsk2dI3Invvt1jUAJi8comjDkdl54/3pku2HBmlDkndYZ6Lz3qqgJO
 X7vH/qYXADZJxOTlC+FGOSwn/ORYA1jEBaV06hs4Bn7OKIlff2GGWHO65nI9qbX7NLZN
 2HVQ==
X-Gm-Message-State: AOJu0YxE23AFDJ+hxmQIhKpb4WNEeLpezutxqs5rvXtymx8ADyEfSQ9H
 /kDcbzlF18b/6+R1GImy9FH5JjvZV1Bw+mcm+fxS9RUB
X-Google-Smtp-Source: AGHT+IFvUfNdgD3M025ie0SSfztu5G0EGA1WZyW9KYEx3xmH/xP1cMH0WFKYaDRfvGODLOGFhzZm+g==
X-Received: by 2002:a17:902:7fce:b0:1bf:27a2:b52b with SMTP id
 t14-20020a1709027fce00b001bf27a2b52bmr5978389plb.58.1695324526019; 
 Thu, 21 Sep 2023 12:28:46 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:e6ed:6d49:f262:8041])
 by smtp.gmail.com with ESMTPSA id
 w8-20020a1709029a8800b001b9f032bb3dsm1892875plp.3.2023.09.21.12.28.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Sep 2023 12:28:45 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Subject: [RFT PATCH v2 11/12] drm/radeon: Call drm_helper_force_disable_all()
 at shutdown/remove time
Date: Thu, 21 Sep 2023 12:26:54 -0700
Message-ID: <20230921122641.RFT.v2.11.I022cfc2dcd30e77d4f7005a2d912dd7ab76c0338@changeid>
X-Mailer: git-send-email 2.42.0.515.g380fc7ccd1-goog
In-Reply-To: <20230921192749.1542462-1-dianders@chromium.org>
References: <20230921192749.1542462-1-dianders@chromium.org>
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
Cc: Xinhui.Pan@amd.com, Douglas Anderson <dianders@chromium.org>,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 alexander.deucher@amd.com, christian.koenig@amd.com
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

NOTE: in order to get things inserted in the right place, I had to
replace the old/deprecated drm_put_dev() function with the equivalent
new calls.

Suggested-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
I honestly have no idea if I got this patch right. The shutdown()
function already had some special case logic for PPC, Loongson, and
VMs and I don't 100% for sure know how this interacts with
those. Everything here is just compile tested.

(no changes since v1)

 drivers/gpu/drm/radeon/radeon_drv.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
index 39cdede460b5..67995ea24852 100644
--- a/drivers/gpu/drm/radeon/radeon_drv.c
+++ b/drivers/gpu/drm/radeon/radeon_drv.c
@@ -38,6 +38,7 @@
 #include <linux/pci.h>
 
 #include <drm/drm_aperture.h>
+#include <drm/drm_crtc_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
 #include <drm/drm_gem.h>
@@ -357,7 +358,9 @@ radeon_pci_remove(struct pci_dev *pdev)
 {
 	struct drm_device *dev = pci_get_drvdata(pdev);
 
-	drm_put_dev(dev);
+	drm_dev_unregister(dev);
+	drm_helper_force_disable_all(dev);
+	drm_dev_put(dev);
 }
 
 static void
@@ -368,6 +371,8 @@ radeon_pci_shutdown(struct pci_dev *pdev)
 	 */
 	if (radeon_device_is_virtual())
 		radeon_pci_remove(pdev);
+	else
+		drm_helper_force_disable_all(pci_get_drvdata(pdev));
 
 #if defined(CONFIG_PPC64) || defined(CONFIG_MACH_LOONGSON64)
 	/*
-- 
2.42.0.515.g380fc7ccd1-goog

