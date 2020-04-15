Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A001A94C1
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 09:42:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46D6D6E8B5;
	Wed, 15 Apr 2020 07:41:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFAC289491
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 07:41:21 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id d17so10953606wrg.11
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 00:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qNncsUXlzsPXlZto5mxj4G9qCB9ihW7GhOP14Dzx+88=;
 b=kKDYv0zBj63u0YKpPv7lsnH5tPY+K4nLY5xgL7IxJVbhDTaGek5voYsqsoL5gYSME+
 yO3JWYG75Vrg/fvfbqU1uBt2shGuktV5TFeMrE14ovjgeYMT5DsooR855KHMaPFOfofK
 fSqgREVhI8k8S+VmdB9LhPmkEQHJUQMVqEDXE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qNncsUXlzsPXlZto5mxj4G9qCB9ihW7GhOP14Dzx+88=;
 b=VeSoarE5gXaBLg6Db06sGBBqAsYbsvafZJitl0S1tLH1hNCrUfbJVUMi0AHylV5ZBS
 GNDBhN+yqqWaXtOOugXiYdqtZV48esDz1+Jw9QMcnPXPIUwAPuCuSCvzzes7/v5WNWFp
 DIpeNfAJX7s/NLZGOBrJdN9N3zheWDT0x5TeZvjHjwLHmF0+fYLYUHC1rLgh9psL1kD5
 twF4ordKNonlzSLYwW2SzSj4dTZB5SgtMPvdbA2Z6yKmvZhPiLsKA/AaIkQ90OpLZnw3
 fxHt5Xh3tlAGyl0ByaXTiGxG6tpoqVkpMJxNI+NVeRjXxenixFLdeBnDiEEkGchinRwu
 XDcw==
X-Gm-Message-State: AGi0PubJBzDjHN7CNTee+ElAWDj79uq0L165jFeDYksmxn0IusneN72n
 JvEri01Xn+CbKgpT1ZVjmA4VxA==
X-Google-Smtp-Source: APiQypJKnQy1o+OQi/gK/YB7zTVyphWXyt5KDuCdGcSFUCktHK0msc87FZbs5xoZpxHJ6nS6K1btLQ==
X-Received: by 2002:adf:feca:: with SMTP id q10mr27383217wrs.199.1586936480652; 
 Wed, 15 Apr 2020 00:41:20 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u30sm1878552wru.13.2020.04.15.00.41.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 00:41:20 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: [PATCH 38/59] drm/i915: Use devm_drm_dev_alloc
Date: Wed, 15 Apr 2020 09:40:13 +0200
Message-Id: <20200415074034.175360-39-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
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
 DRI Development <dri-devel@lists.freedesktop.org>,
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
index 641f5e03b661..ff9a5b1b4c6d 100644
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@ -877,19 +877,11 @@ i915_driver_create(struct pci_dev *pdev, const struct pci_device_id *ent)
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
@@ -1006,7 +998,6 @@ int i915_driver_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	pci_disable_device(pdev);
 out_fini:
 	i915_probe_error(i915, "Device initialization failed (%d)\n", ret);
-	drm_dev_put(&i915->drm);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index 66738f2c4f28..2741fb3e30cb 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -941,8 +941,6 @@ static void i915_pci_remove(struct pci_dev *pdev)
 
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
