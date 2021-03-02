Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BED5F32A8A3
	for <lists+dri-devel@lfdr.de>; Tue,  2 Mar 2021 18:57:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86B4989C6A;
	Tue,  2 Mar 2021 17:57:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D68F89C6A
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Mar 2021 17:57:21 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id k22so12466738pll.6
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Mar 2021 09:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t0XgsYWzCDRLhsNvXhAFsWAxsY9xHFp6XSF1To7GMYQ=;
 b=YLXgMyNgQnRjv23cdr0A9TqS5czUZWEqzjL+SQxCKArJAenMg38p+18B8lgzV/8W4O
 6MzfIGFKr7GFV33hd1rAckk4m5r4+6cECKAnMmht559jzSqe0nza6AoCUM5mLtb3bz2+
 bT/JSMkWWSIB0AxeshdzbRMy8Pi7xG/9lxKuA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t0XgsYWzCDRLhsNvXhAFsWAxsY9xHFp6XSF1To7GMYQ=;
 b=W6CR17KyY4SVnpQQk0WAl8BNxqk8bRuZfUPGNtarJ0m0KBHX0lkwD6Kld87IwYQRcB
 kZrgZdLgox5jOv2l6rbTxhps273YaKNGkydBSgcrtSpYuhJNPmRgvBxGemsgs3HIIEIZ
 yWeerDmUFZx1NuTF+x3sVF9u+TEH2nNBF+2eXilgjBq03RBb9g8IK2nK1oOnyn750U5l
 p/0P1ZGBSoHdRH9b0NkgJUzj8ZF8ctOZM4UDKsZbyN/R3DsM8nR1Mdq/pFoP/cGpJpgW
 yIcvri8psK11f4vmec0mG05FkFBhegZO41GNZKGj/N046YRz2c756JKcvRFWcWVVexoR
 ExBA==
X-Gm-Message-State: AOAM533YE8dJpNL7nrzxkv4ofAYP19MdoebMNGpAX4FHV9ZGs8Hhk+jF
 U6/iPgQ0Iq7sMk0qg+BzdK9x9w==
X-Google-Smtp-Source: ABdhPJyo1UjGzp40tLRvvraXfpsxXnqkr/lo8Ai+kssmF8iV7dIyu7Zguv60AaGzSRRkEo9ejOaxTg==
X-Received: by 2002:a17:90b:1bc6:: with SMTP id
 oa6mr5801071pjb.86.1614707841197; 
 Tue, 02 Mar 2021 09:57:21 -0800 (PST)
Received: from ub-XPS-13-9350.domain.name ([103.161.30.225])
 by smtp.gmail.com with ESMTPSA id e22sm18521329pgk.56.2021.03.02.09.57.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 09:57:20 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Yannick Fertre <yannick.fertre@st.com>,
 Philippe Cornu <philippe.cornu@st.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Vincent Abriou <vincent.abriou@st.com>
Subject: [PATCH] drm/stm: ltdc: Use simple encoder
Date: Tue,  2 Mar 2021 23:27:00 +0530
Message-Id: <20210302175700.28640-1-jagan@amarulasolutions.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jagan Teki <jagan@amarulasolutions.com>, linux-amarula@amarulasolutions.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

STM ltdc driver uses an empty implementation for its encoder.
Replace the code with the generic simple encoder.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/stm/ltdc.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index 7812094f93d6..aeeb43524ca0 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -31,6 +31,7 @@
 #include <drm/drm_of.h>
 #include <drm/drm_plane_helper.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_vblank.h>
 
 #include <video/videomode.h>
@@ -1020,14 +1021,6 @@ static int ltdc_crtc_init(struct drm_device *ddev, struct drm_crtc *crtc)
 	return ret;
 }
 
-/*
- * DRM_ENCODER
- */
-
-static const struct drm_encoder_funcs ltdc_encoder_funcs = {
-	.destroy = drm_encoder_cleanup,
-};
-
 static void ltdc_encoder_disable(struct drm_encoder *encoder)
 {
 	struct drm_device *ddev = encoder->dev;
@@ -1088,8 +1081,7 @@ static int ltdc_encoder_init(struct drm_device *ddev, struct drm_bridge *bridge)
 	encoder->possible_crtcs = CRTC_MASK;
 	encoder->possible_clones = 0;	/* No cloning support */
 
-	drm_encoder_init(ddev, encoder, &ltdc_encoder_funcs,
-			 DRM_MODE_ENCODER_DPI, NULL);
+	drm_simple_encoder_init(ddev, encoder, DRM_MODE_ENCODER_DPI);
 
 	drm_encoder_helper_add(encoder, &ltdc_encoder_helper_funcs);
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
