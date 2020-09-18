Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E56B126FE3C
	for <lists+dri-devel@lfdr.de>; Fri, 18 Sep 2020 15:25:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1155F6ECFD;
	Fri, 18 Sep 2020 13:25:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0731B6ECFD
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Sep 2020 13:25:16 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id y15so5577046wmi.0
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Sep 2020 06:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bqA8wRk5Nq48ozg18p/JKqMGUJq+nJzeTZVZ0hWoQos=;
 b=C4Hm1mXrEZIpzJLmmnj9SW/UFx7zjK6EuR3i3MW4mFiIYbSwKMcxIG3IWt4gnhRZJu
 KnWAekST9k368aQae2zhwPEa37MUPkHUZYjhqmqep26crrRIO13HXIv8JAt6FN4C22sN
 M+WKIFcCZAwvM/gH7X5UD8r/GHOuKqIgjibjc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bqA8wRk5Nq48ozg18p/JKqMGUJq+nJzeTZVZ0hWoQos=;
 b=PCwOdYLVsj24kAbVp5IHGB33U0pWIrwxuY6hbWDn8A+SjzAkfFQqY8hv1G1VEJKRUm
 v4Di1eYraieOy3n6Mf0r8tJD9DZemCnj4oqZAYF/egsOiBSCJE50t5RySCoCwKT0WC+L
 a2VQ52nX1FhBZ/3oWfSNzoOPL1LnBhkZ1BBzJONJblFCv5/2kQjxPk9KduFf3egGB9aN
 1WfqltLv2/3M3WHrni14xBZEGcTuYxDRhUxGxJ7n1Bz6cVcgqaDruJXdfcTaCYCC3owb
 2o0Ov6UySuW1VmeOm7hxBa1zftn5ma4ct3RKPyK12ePm4pPK3MpfU9UtkKIHddU4q9cH
 4qKA==
X-Gm-Message-State: AOAM532M18bCiN73HT2W9AfeqvwZNnBSzjxdpwXur0n4CIVqUa1O4/0o
 gPqQabVgw6JASk0qtnmLd/qnsR57fu9fIffX
X-Google-Smtp-Source: ABdhPJwVtnqw7M6swccNbGpHxkdHeMxmPX5dearv/JGiLGTZ/LiJWe4vzfqEie1ExiM+YfwlbAWt3A==
X-Received: by 2002:a1c:bbd7:: with SMTP id
 l206mr16570930wmf.185.1600435514370; 
 Fri, 18 Sep 2020 06:25:14 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id k6sm4872693wmi.1.2020.09.18.06.25.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2020 06:25:13 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 3/4] drm/amdgpu: Convert to using devm_drm_dev_alloc() (v2)
Date: Fri, 18 Sep 2020 15:25:04 +0200
Message-Id: <20200918132505.2316382-4-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200918132505.2316382-1-daniel.vetter@ffwll.ch>
References: <20200918132505.2316382-1-daniel.vetter@ffwll.ch>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Luben Tuikov <luben.tuikov@amd.com>, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Luben Tuikov <luben.tuikov@amd.com>

Convert to using devm_drm_dev_alloc(),
as drm_dev_init() is going away.

v2: Remove drm_dev_put() since
    a) devres doesn't do refcounting, see
    Documentation/driver-api/driver-model/devres.rst,
    Section 4, paragraph 1; and since
    b) devres acts as garbage collector when
    the DRM device's parent's devres "action" callback
    is called to free the container device (amdgpu_device),
    which embeds the DRM dev.

Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 6edde2b9e402..3ded6f43f982 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1142,25 +1142,20 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
 	if (ret)
 		return ret;
 
-	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
-	if (!adev)
-		return -ENOMEM;
+	adev = devm_drm_dev_alloc(&pdev->dev, &kms_driver, typeof(*adev), ddev);
+	if (IS_ERR(adev))
+		return PTR_ERR(adev);
 
 	adev->dev  = &pdev->dev;
 	adev->pdev = pdev;
 	ddev = adev_to_drm(adev);
-	ret = drm_dev_init(ddev, &kms_driver, &pdev->dev);
-	if (ret)
-		goto err_free;
-
-	drmm_add_final_kfree(ddev, adev);
 
 	if (!supports_atomic)
 		ddev->driver_features &= ~DRIVER_ATOMIC;
 
 	ret = pci_enable_device(pdev);
 	if (ret)
-		goto err_free;
+		return ret;
 
 	ddev->pdev = pdev;
 	pci_set_drvdata(pdev, ddev);
@@ -1188,8 +1183,6 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
 
 err_pci:
 	pci_disable_device(pdev);
-err_free:
-	drm_dev_put(ddev);
 	return ret;
 }
 
@@ -1206,7 +1199,6 @@ amdgpu_pci_remove(struct pci_dev *pdev)
 	amdgpu_driver_unload_kms(dev);
 	pci_disable_device(pdev);
 	pci_set_drvdata(pdev, NULL);
-	drm_dev_put(dev);
 }
 
 static void
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
