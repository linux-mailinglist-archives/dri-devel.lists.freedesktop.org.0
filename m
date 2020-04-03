Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A50D819D871
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 16:00:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40E656EBFC;
	Fri,  3 Apr 2020 13:59:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C76296EBEF
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 13:59:22 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id d77so7270600wmd.3
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Apr 2020 06:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U1cHersM9/MfPM0Fx9g6p3GkJLTmtKqALH6AGQhj1JI=;
 b=RvYyGz9ian64iVeJFw6t6d7gceNBKh8bfj4Xfn+73BfHLtNJ/wlplbNB0zcnMLkzUC
 lIQG8Lh76k1lPqN5gvsFF/SaZf/KrOO2rhhtiwrR7zsPcEir0299JmqVW03Acf9xH9hT
 mbRaIBmnM36dNdBo1NXJr/nDnCysdzRSLY2mg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U1cHersM9/MfPM0Fx9g6p3GkJLTmtKqALH6AGQhj1JI=;
 b=n8lgdMOOEL6Ny2eUypP2RnB13Ojz5AnMXmUb/zrvbFG/CAG4l8K8k2AjN0B4QUmK7e
 KZHAUZTF27UprmFhbCD9bfrRULcKqxgcciCy+3ICJD6avilGaFme8oWMhy10hkX7aRuu
 TOwpm4XCjaF1k5gmi1T9EbWJn1fIC/6Tclse/ptGRc54glYPFxIG8hQXNjt95k6HJ82p
 jb78P0Mev4sVAh0NGQuBrCdXzjVCB485vCeC/z9YKYYgZbM7aqPhRQJSNupt88p/XICf
 ydd1bn/8f7s7NeLTbYG1lcJZ2r+9tHXENpeG8YTwDV1ZQUGy1OgzzxXNZcDD4TyoCAjP
 sYtQ==
X-Gm-Message-State: AGi0PubqECSJmHeUVlgfrXFtpPrw3wdAbN0Zi5QsAUR6s11XsNrPKlbH
 Q1jsImjVvvFmOtGTVsNFyDo8SX6xWuMYOg==
X-Google-Smtp-Source: APiQypL2Q4dfyzxX07RuWi+jeQZugdM02r4yCbHzr657Cgm4H09cgHwOJtKP7xFlt+B1N61lm0XUDQ==
X-Received: by 2002:a1c:7919:: with SMTP id l25mr9280478wme.12.1585922361078; 
 Fri, 03 Apr 2020 06:59:21 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f141sm11783919wmf.3.2020.04.03.06.59.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 06:59:20 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 41/44] drm/i915: Use devm_drm_dev_alloc
Date: Fri,  3 Apr 2020 15:58:25 +0200
Message-Id: <20200403135828.2542770-42-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
References: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Luckily we're already well set up in the main driver, with
drm_dev_put() being the last thing in both the unload error case and
the pci remove function.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/i915/i915_drv.c | 17 ++++-------------
 drivers/gpu/drm/i915/i915_pci.c |  2 --
 2 files changed, 4 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
index a7a3b4b98572..9c0ff25c5d41 100644
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@ -879,19 +879,11 @@ i915_driver_create(struct pci_dev *pdev, const struct pci_device_id *ent)
 		(struct intel_device_info *)ent->driver_data;
 	struct intel_device_info *device_info;
 	struct drm_i915_private *i915;
-	int err;
 
-	i915 = kzalloc(sizeof(*i915), GFP_KERNEL);
-	if (!i915)
-		return ERR_PTR(-ENOMEM);
-
-	err = drm_dev_init(&i915->drm, &driver, &pdev->dev);
-	if (err) {
-		kfree(i915);
-		return ERR_PTR(err);
-	}
-
-	drmm_add_final_kfree(&i915->drm, i915);
+	i915 = devm_drm_dev_alloc(&pdev->dev, &driver,
+				  struct drm_i915_private, drm);
+	if (IS_ERR(i915))
+		return i915;
 
 	i915->drm.pdev = pdev;
 	pci_set_drvdata(pdev, i915);
@@ -1008,7 +1000,6 @@ int i915_driver_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	pci_disable_device(pdev);
 out_fini:
 	i915_probe_error(i915, "Device initialization failed (%d)\n", ret);
-	drm_dev_put(&i915->drm);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index 2c80a0194c80..0f8b439d6fd5 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -920,8 +920,6 @@ static void i915_pci_remove(struct pci_dev *pdev)
 
 	i915_driver_remove(i915);
 	pci_set_drvdata(pdev, NULL);
-
-	drm_dev_put(&i915->drm);
 }
 
 /* is device_id present in comma separated list of ids */
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
