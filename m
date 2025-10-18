Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B72F0BEC844
	for <lists+dri-devel@lfdr.de>; Sat, 18 Oct 2025 07:45:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FBC710E093;
	Sat, 18 Oct 2025 05:45:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=0x0f.com header.i=@0x0f.com header.b="lw+k6Qvx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B38D810E08F
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Oct 2025 05:45:00 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-78af3fe5b17so2253998b3a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 22:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=0x0f.com; s=google; t=1760766300; x=1761371100; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=89BI59zwmh1Ubu37m+UzRMVYEbxdBWMilagPFw2Lo2s=;
 b=lw+k6QvxkKY/70o7MSlJUzEGUjEPH6z7/eTVVYBQz5FhbuwvUXUd207mbC8VDTQPYZ
 ppl0s7yxW6QBYXwEcg+plkXs8+tknTIXoEWL4ocjCLEGaHDZUCWpLVhiA82W1yVcnvWp
 jJKPdssESj8PREegZX2wgijh91S2PXNw+sHsY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760766300; x=1761371100;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=89BI59zwmh1Ubu37m+UzRMVYEbxdBWMilagPFw2Lo2s=;
 b=WlcoKOnDgJ1hyJyGM/j4eFlJSKT8SXwt+tuaUxYr4Y7BF7JfYqU5YHag6Qf8k/M7bY
 W89pha7oKGdsom0IlYKEIuP36gl0zeaVdjtPKYFj+FOxaW2+WWknE/rI7sPKa+AwJAwM
 0fdJdVVROOIDbnpIEgi4QMa7omfgWgXjyQDQuAVgimi13hHfa229yqhfF2l8/idw1EN8
 Z5YjQzb+zEdsJxfaoXXJ87Gln1jknXENA3TC6FPmOM4Gp6+0ToeB7uic/bs/u/7jvTc8
 CovHGveWTFxeRiCVpvyiqPTYzKn0Q9V0lBIrEGsfUMxGCrJiqKW/EvCIOMP9J4HLHqJU
 W9tQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVo/QgfEECfWfvke/9JoyCWPR9x/uE1Dd2GxJA7MBwHBDyS7iHKtaN87jQu11F1PS1cttIL2NfD6hY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwA7VwjSn0H9bVwvGVijZ18Ny1LxFFETNCeAVZc/FpMYnsQSYF1
 lq9JY9vDPPJUZqMUME0MzDecL8gij+3qosv9iBemHLK7bEyXqrtah3gnnGCPnnqkZjc=
X-Gm-Gg: ASbGncs+ZNiz15/HLd+0zpQE4XmcYRtPL0xrThsd1TMS7N+ssv0TQ84tnNkIgGZ/veq
 WWC9i5T4KoENjh/vdTXi5DIuO5waDOO62jlAh9yY8IH7QXbljsalLEJcq0xhZmCqmzAY5K4EQS7
 RVxfZ3OxO0v4jKrc7Foq9/brlobDvdzsxT/gOTwqHGK1iPnEMQbTa4KowSJV0szB7JOyIp97Jcc
 z+xNqtja96LPJlu4IfRhT66bZPuqz03uMH/5RMajx4K4OZB5AV4naYp2FqqpIR6GEKqzBZ8v6XB
 Df4qu4JExVe2jjRoFL5qpwqvTByGV93V3cnOn/UGQ8ams+4dl11SuJtXIfz/k4OnaS3Z5fohrgx
 0n5KsMlyHufci0pgitpfHZ08n2as9d2xUGI+OrTXOByCAtLQv4xva/DtTLhDZqS5h30PLl5/oEh
 ISl1OwZZgFlcm4zSrS2PUmxgV+H2yT+7w9haU1dwxf3lKYzSCqZUc=
X-Google-Smtp-Source: AGHT+IEHbWRy0UQfKYZEKhc6rfju/pKkbqQ6hk4S/GiStG+bKUHgiK4+G/rplbVGaAB9yEUU3M4bFA==
X-Received: by 2002:a05:6a21:6daa:b0:306:2a14:d0d4 with SMTP id
 adf61e73a8af0-334a8625728mr7189585637.43.1760766300265; 
 Fri, 17 Oct 2025 22:45:00 -0700 (PDT)
Received: from shiro (p1391188-ipxg00a01sizuokaden.shizuoka.ocn.ne.jp.
 [153.222.3.188]) by smtp.googlemail.com with ESMTPSA id
 41be03b00d2f7-b6a76645c61sm1657222a12.3.2025.10.17.22.44.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Oct 2025 22:45:00 -0700 (PDT)
From: Daniel Palmer <daniel@0x0f.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch, wuhoipok@gmail.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 1/3] drm/radeon: Clean up pdev->dev instances in probe
Date: Sat, 18 Oct 2025 14:44:49 +0900
Message-ID: <20251018054451.259432-2-daniel@0x0f.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251018054451.259432-1-daniel@0x0f.com>
References: <20251018054451.259432-1-daniel@0x0f.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Get a struct device pointer from the start and use it.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 drivers/gpu/drm/radeon/radeon_drv.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
index 88e821d67af7..eb5138da8d5b 100644
--- a/drivers/gpu/drm/radeon/radeon_drv.c
+++ b/drivers/gpu/drm/radeon/radeon_drv.c
@@ -262,6 +262,7 @@ static int radeon_pci_probe(struct pci_dev *pdev,
 	unsigned long flags = 0;
 	struct drm_device *ddev;
 	struct radeon_device *rdev;
+	struct device *dev = &pdev->dev;
 	const struct drm_format_info *format;
 	int ret;
 
@@ -277,7 +278,7 @@ static int radeon_pci_probe(struct pci_dev *pdev,
 		case CHIP_VERDE:
 		case CHIP_OLAND:
 		case CHIP_HAINAN:
-			dev_info(&pdev->dev,
+			dev_info(dev,
 				 "SI support disabled by module param\n");
 			return -ENODEV;
 		}
@@ -289,7 +290,7 @@ static int radeon_pci_probe(struct pci_dev *pdev,
 		case CHIP_HAWAII:
 		case CHIP_KABINI:
 		case CHIP_MULLINS:
-			dev_info(&pdev->dev,
+			dev_info(dev,
 				 "CIK support disabled by module param\n");
 			return -ENODEV;
 		}
@@ -303,11 +304,11 @@ static int radeon_pci_probe(struct pci_dev *pdev,
 	if (ret)
 		return ret;
 
-	rdev = devm_drm_dev_alloc(&pdev->dev, &kms_driver, typeof(*rdev), ddev);
+	rdev = devm_drm_dev_alloc(dev, &kms_driver, typeof(*rdev), ddev);
 	if (IS_ERR(rdev))
 		return PTR_ERR(rdev);
 
-	rdev->dev = &pdev->dev;
+	rdev->dev = dev;
 	rdev->pdev = pdev;
 	ddev = rdev_to_drm(rdev);
 	ddev->dev_private = rdev;
-- 
2.51.0

