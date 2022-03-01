Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 068C14C8BE3
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 13:43:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A6FF10E943;
	Tue,  1 Mar 2022 12:43:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6951F10E943
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Mar 2022 12:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646138627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=x+dwhD93YTqhMx+pdHPzeUKn3G2GSBR27WYaSq1Zfio=;
 b=WvJHV0GVsBjnz5fsN0F+nVXeHZ0GqBvyDa4vKDjZGJhK36qlq+ICSvG6jwNgF6E0Q9BLUu
 iTcLndXlN+kO67aEWHTGx1F58WT7ai0QcReuJDOCk9YEsue6uzuiFT9PnrB3NlCwG2olRA
 NkN42zGzEGpUmTlUVwYp5cjqCHmL8og=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-118-JtvW3JPLOyywfFcb8gXRyw-1; Tue, 01 Mar 2022 07:43:45 -0500
X-MC-Unique: JtvW3JPLOyywfFcb8gXRyw-1
Received: by mail-qk1-f197.google.com with SMTP id
 t17-20020a05620a035100b0060df15e2977so13778764qkm.21
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Mar 2022 04:43:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x+dwhD93YTqhMx+pdHPzeUKn3G2GSBR27WYaSq1Zfio=;
 b=KfujZGFsDW/SlhV2ck3KirMMq1kGYSi7X2cPDrkc1/urotb/EU68xua1KUZ7xFhKmZ
 DM0FEn4td6ltX3r7eMkmPbn+M+yxpyUgcikhb6FGayRKt+fmfIB74BznIW2BMWk40wx9
 BBxmLOkBD5f84ZbqGFpURSGgi0eeBAF2+sv3AbfE85xwXleUpMuAMBVhiLtSiSziQ1sP
 CmqQqmWC8Yt9V4gefZHIgkvOFkemcIRVCrc6jXCKL4O73+JsdO3H7ohXn3v+qPNUUsYP
 NJomiZkfmGAzMWWWfo4PJiS1WcTzIywfxAAaa/EUeDpPjwQEUrNbg8BjZhs44MCZhTuf
 8njA==
X-Gm-Message-State: AOAM533Nwys94kM9jQgckXqm3/iR929BTgkCn1LMQWygG7gySI7mvqS1
 wnIioGX+I4JfC42MTJOfaED4zEhNC83QlDWqJqJV7N6EiS17QC/6fLmozZENYZZQk3EzIYpW99k
 nm2lnby9Gjtn9sntmnVncWqeBhzqg
X-Received: by 2002:a0c:ab51:0:b0:432:4db3:f52e with SMTP id
 i17-20020a0cab51000000b004324db3f52emr16853841qvb.114.1646138625117; 
 Tue, 01 Mar 2022 04:43:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJya9fDvbWL7dgsZMQta2Ro8omYh2gW3GOBowplvGXvSGHYOmq0OdB3+A33jeMwm4KZqJa+XyA==
X-Received: by 2002:a0c:ab51:0:b0:432:4db3:f52e with SMTP id
 i17-20020a0cab51000000b004324db3f52emr16853825qvb.114.1646138624820; 
 Tue, 01 Mar 2022 04:43:44 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com.
 [24.205.208.113]) by smtp.gmail.com with ESMTPSA id
 r2-20020a05620a03c200b00477981c7129sm6435799qkm.17.2022.03.01.04.43.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 04:43:44 -0800 (PST)
From: trix@redhat.com
To: robh@kernel.org, tomeu.vizoso@collabora.com, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drm/panfrost: cleanup comments
Date: Tue,  1 Mar 2022 04:43:39 -0800
Message-Id: <20220301124339.264544-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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
Cc: Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tom Rix <trix@redhat.com>

For spdx
change tab to space delimiter
Use // for *.c

Replacements
commited to committed, use multiline comment style
regsiters to registers
initialze to initialize

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c          | 2 +-
 drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c | 2 +-
 drivers/gpu/drm/panfrost/panfrost_issues.h       | 6 ++++--
 drivers/gpu/drm/panfrost/panfrost_mmu.c          | 2 +-
 drivers/gpu/drm/panfrost/panfrost_regs.h         | 2 +-
 5 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 96bb5a4656278..94b6f0a19c83a 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -562,7 +562,7 @@ static int panfrost_probe(struct platform_device *pdev)
 
 	pfdev->coherent = device_get_dma_attr(&pdev->dev) == DEV_DMA_COHERENT;
 
-	/* Allocate and initialze the DRM device. */
+	/* Allocate and initialize the DRM device. */
 	ddev = drm_dev_alloc(&panfrost_drm_driver, &pdev->dev);
 	if (IS_ERR(ddev))
 		return PTR_ERR(ddev);
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c b/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
index b0142341e2235..77e7cb6d1ae3b 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0 */
+// SPDX-License-Identifier: GPL-2.0
 /* Copyright (C) 2019 Arm Ltd.
  *
  * Based on msm_gem_freedreno.c:
diff --git a/drivers/gpu/drm/panfrost/panfrost_issues.h b/drivers/gpu/drm/panfrost/panfrost_issues.h
index 8e59d765bf19f..4e7cf979ee67a 100644
--- a/drivers/gpu/drm/panfrost/panfrost_issues.h
+++ b/drivers/gpu/drm/panfrost/panfrost_issues.h
@@ -13,8 +13,10 @@
  * to care about.
  */
 enum panfrost_hw_issue {
-	/* Need way to guarantee that all previously-translated memory accesses
-	 * are commited */
+	/*
+	 * Need way to guarantee that all previously-translated memory accesses
+	 * are committed
+	 */
 	HW_ISSUE_6367,
 
 	/* On job complete with non-done the cache is not flushed */
diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index 39562f2d11a47..d3f82b26a631d 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier:	GPL-2.0
+// SPDX-License-Identifier: GPL-2.0
 /* Copyright 2019 Linaro, Ltd, Rob Herring <robh@kernel.org> */
 
 #include <drm/panfrost_drm.h>
diff --git a/drivers/gpu/drm/panfrost/panfrost_regs.h b/drivers/gpu/drm/panfrost/panfrost_regs.h
index 6c5a11ef1ee87..efe4b75149d35 100644
--- a/drivers/gpu/drm/panfrost/panfrost_regs.h
+++ b/drivers/gpu/drm/panfrost/panfrost_regs.h
@@ -292,7 +292,7 @@
 #define AS_FAULTADDRESS_LO(as)		(MMU_AS(as) + 0x20) /* (RO) Fault Address for address space n, low word */
 #define AS_FAULTADDRESS_HI(as)		(MMU_AS(as) + 0x24) /* (RO) Fault Address for address space n, high word */
 #define AS_STATUS(as)			(MMU_AS(as) + 0x28) /* (RO) Status flags for address space n */
-/* Additional Bifrost AS regsiters */
+/* Additional Bifrost AS registers */
 #define AS_TRANSCFG_LO(as)		(MMU_AS(as) + 0x30) /* (RW) Translation table configuration for address space n, low word */
 #define AS_TRANSCFG_HI(as)		(MMU_AS(as) + 0x34) /* (RW) Translation table configuration for address space n, high word */
 #define AS_FAULTEXTRA_LO(as)		(MMU_AS(as) + 0x38) /* (RO) Secondary fault address for address space n, low word */
-- 
2.26.3

